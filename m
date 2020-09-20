Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A610427119A
	for <lists+linux-leds@lfdr.de>; Sun, 20 Sep 2020 02:25:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726806AbgITAZF (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 19 Sep 2020 20:25:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726817AbgITAZF (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 19 Sep 2020 20:25:05 -0400
Received: from mail.nic.cz (mail.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E578C061755
        for <linux-leds@vger.kernel.org>; Sat, 19 Sep 2020 17:25:05 -0700 (PDT)
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 0CEC2140A99;
        Sun, 20 Sep 2020 02:25:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600561503; bh=wCHcJGOtTztFA3VOpQ+2gTSFQn1wILFtTiwAsFMseXo=;
        h=From:To:Date;
        b=XA1b/JGmt8WHZqy9C3PtK0j2/evis1YQgP7LJHMfa9s56+2dImvGPQUSJFooDlmuS
         IUDxX3We3NdHw6I+rid6OoO6M0zk3QWbrAisyqFzoYQtfoZaXUmKFcwEk83EGPIZTY
         tRuT61lSkb6i/PJAGkOp1R9ZSM56cssxTLTjSrRQ=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        Peter Meerwald <p.meerwald@bct-electronic.com>,
        Ricardo Ribalda <ribalda@kernel.org>,
        Zahari Petkov <zahari@balena.io>
Subject: [PATCH leds 7/7] leds: pca963x: use struct led_init_data when registering
Date:   Sun, 20 Sep 2020 02:25:00 +0200
Message-Id: <20200920002500.5851-8-marek.behun@nic.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200920002500.5851-1-marek.behun@nic.cz>
References: <20200920002500.5851-1-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Spam-Status: No, score=0.00
X-Spamd-Bar: /
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

By using struct led_init_data when registering we do not need to parse
`label` DT property. Moreover `label` is deprecated and if it is not
present but `color` and `function` are, LED core will compose a name
from these properties instead.

Previously if the `label` DT property was not present, the code composed
name for the LED in the form
  "pca963x:%d:%.2x:%u"
For backwards compatibility we therefore set init_data->default_label
to this value so that the LED will not get a different name if `label`
property is not present, nor are `color` and `function`.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Peter Meerwald <p.meerwald@bct-electronic.com>
Cc: Ricardo Ribalda <ribalda@kernel.org>
Cc: Zahari Petkov <zahari@balena.io>
---
 drivers/leds/leds-pca963x.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/leds/leds-pca963x.c b/drivers/leds/leds-pca963x.c
index 5083ccce1a519..00aecd67e3483 100644
--- a/drivers/leds/leds-pca963x.c
+++ b/drivers/leds/leds-pca963x.c
@@ -289,8 +289,6 @@ static int pca963x_register_leds(struct i2c_client *client,
 	struct pca963x_led *led = chip->leds;
 	struct device *dev = &client->dev;
 	struct fwnode_handle *child;
-	const char *name;
-	char label[64];
 	bool hw_blink;
 	s32 mode2;
 	u32 reg;
@@ -323,6 +321,9 @@ static int pca963x_register_leds(struct i2c_client *client,
 		return ret;
 
 	device_for_each_child_node(dev, child) {
+		struct led_init_data init_data = {};
+		char default_label[32];
+
 		ret = fwnode_property_read_u32(child, "reg", &reg);
 		if (ret || reg >= chipdef->n_leds) {
 			dev_err(dev, "Invalid 'reg' property for node %pfw\n",
@@ -331,23 +332,21 @@ static int pca963x_register_leds(struct i2c_client *client,
 			goto err;
 		}
 
-		ret = fwnode_property_read_string(child, "label", &name);
-		if (!fwnode_property_read_string(child, "label", &name))
-			snprintf(label, sizeof(label), "pca963x:%s", name);
-		else
-			snprintf(label, sizeof(label), "pca963x::");
-
-		fwnode_property_read_string(child, "linux,default-trigger",
-					    &led->led_cdev.default_trigger);
-
 		led->led_num = reg;
 		led->chip = chip;
-		led->led_cdev.name = label;
 		led->led_cdev.brightness_set_blocking = pca963x_led_set;
 		if (hw_blink)
 			led->led_cdev.blink_set = pca963x_blink_set;
 
-		ret = devm_led_classdev_register(dev, &led->led_cdev);
+		init_data.fwnode = child;
+		/* for backwards compatibility */
+		init_data.devicename = "pca963x";
+		snprintf(default_label, sizeof(default_label), "%d:%.2x:%u",
+			 client->adapter->nr, client->addr, reg);
+		init_data.default_label = default_label;
+
+		ret = devm_led_classdev_register_ext(dev, &led->led_cdev,
+						     &init_data);
 		if (ret) {
 			dev_err(dev, "Failed to register LED for node %pfw\n",
 				child);
-- 
2.26.2

