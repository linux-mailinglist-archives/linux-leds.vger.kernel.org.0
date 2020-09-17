Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3882E26E8DD
	for <lists+linux-leds@lfdr.de>; Fri, 18 Sep 2020 00:36:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726129AbgIQWgU (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 17 Sep 2020 18:36:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726201AbgIQWeH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 17 Sep 2020 18:34:07 -0400
Received: from mail.nic.cz (lists.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56962C06178B;
        Thu, 17 Sep 2020 15:33:58 -0700 (PDT)
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 210F2140AB1;
        Fri, 18 Sep 2020 00:33:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600382036; bh=K5Lf0G2J0uUnL5e/ToHHaO/uRjcH8OElecoBqDVp8co=;
        h=From:To:Date;
        b=aayCxCm8gxVPhK5hvNeTKkd9FWxN3HDY3Tzu0xf+Frcsqf620vwCHub69MXRJDsPT
         nwfzV8ABbBRUnBaIlI0oqMmtWTmG1TBpWREQqvRYqrKmv0GXvdk67m78cDDCbUSlJi
         83QVdBb1UKx4gOaAE0tIoZ8+9sj3AtpFxce/gHVU=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megous@megous.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH leds v2 16/50] leds: max77650: use struct led_init_data when registering
Date:   Fri, 18 Sep 2020 00:33:04 +0200
Message-Id: <20200917223338.14164-17-marek.behun@nic.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200917223338.14164-1-marek.behun@nic.cz>
References: <20200917223338.14164-1-marek.behun@nic.cz>
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
  "max77650::"
For backwards compatibility we therefore set
  init_data->default_label = ":";
so that the LED will not get a different name if `label` property is not
present.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/leds/leds-max77650.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/drivers/leds/leds-max77650.c b/drivers/leds/leds-max77650.c
index 56a37d4b7df63..f2090d3ebfd53 100644
--- a/drivers/leds/leds-max77650.c
+++ b/drivers/leds/leds-max77650.c
@@ -66,7 +66,6 @@ static int max77650_led_probe(struct platform_device *pdev)
 	struct max77650_led *leds, *led;
 	struct device *dev;
 	struct regmap *map;
-	const char *label;
 	int rv, num_leds;
 	u32 reg;
 
@@ -86,6 +85,8 @@ static int max77650_led_probe(struct platform_device *pdev)
 		return -ENODEV;
 
 	device_for_each_child_node(dev, child) {
+		struct led_init_data init_data = {};
+
 		rv = fwnode_property_read_u32(child, "reg", &reg);
 		if (rv || reg >= MAX77650_LED_NUM_LEDS) {
 			rv = -EINVAL;
@@ -99,22 +100,16 @@ static int max77650_led_probe(struct platform_device *pdev)
 		led->cdev.brightness_set_blocking = max77650_led_brightness_set;
 		led->cdev.max_brightness = MAX77650_LED_MAX_BRIGHTNESS;
 
-		rv = fwnode_property_read_string(child, "label", &label);
-		if (rv) {
-			led->cdev.name = "max77650::";
-		} else {
-			led->cdev.name = devm_kasprintf(dev, GFP_KERNEL,
-							"max77650:%s", label);
-			if (!led->cdev.name) {
-				rv = -ENOMEM;
-				goto err_node_put;
-			}
-		}
-
 		fwnode_property_read_string(child, "linux,default-trigger",
 					    &led->cdev.default_trigger);
 
-		rv = devm_led_classdev_register(dev, &led->cdev);
+		init_data.fwnode = child;
+		init_data.devicename = "max77650";
+		/* for backwards compatibility if `label` is not present */
+		init_data.default_label = ":";
+
+		rv = devm_led_classdev_register_ext(dev, &led->cdev,
+						    &init_data);
 		if (rv)
 			goto err_node_put;
 
-- 
2.26.2

