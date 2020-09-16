Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B25D026CF62
	for <lists+linux-leds@lfdr.de>; Thu, 17 Sep 2020 01:16:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726760AbgIPXQz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 16 Sep 2020 19:16:55 -0400
Received: from mail.nic.cz ([217.31.204.67]:53792 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726550AbgIPXQy (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 16 Sep 2020 19:16:54 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id B01971409AF;
        Thu, 17 Sep 2020 01:16:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600298212; bh=NpNjcn4HdW5tGiqSNTLD9vPm79G4FY/L4xjAOvUu27c=;
        h=From:To:Date;
        b=iSc6+PqSUDsiI/EV4mZ6XtFU/RNjYdSl2dpUYOfR/4DAxYefKfwzV6z58sxurtqBu
         tjr4SxKXXgy9LEzObbvCCczRpgG/9LEy/POSt7XhLbY9Sswrwo1aqDSEifn2CKkHg9
         byCpugNsUqrdZ82Iv3yq6a6CNxb+tgsNCpJ8saTU=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megous@megous.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH leds v1 04/10] leds: max77650: use struct led_init_data when registering
Date:   Thu, 17 Sep 2020 01:16:44 +0200
Message-Id: <20200916231650.11484-5-marek.behun@nic.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200916231650.11484-1-marek.behun@nic.cz>
References: <20200916231650.11484-1-marek.behun@nic.cz>
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
`label` DT property nor `linux,default-trigger` property.

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
 drivers/leds/leds-max77650.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/leds/leds-max77650.c b/drivers/leds/leds-max77650.c
index a0d4b725c9178..1eeac56b00146 100644
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
@@ -99,22 +100,13 @@ static int max77650_led_probe(struct platform_device *pdev)
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
-		fwnode_property_read_string(child, "linux,default-trigger",
-					    &led->cdev.default_trigger);
+		init_data.fwnode = child;
+		init_data.devicename = "max77650";
+		/* for backwards compatibility if `label` is not present */
+		init_data.default_label = ":";
 
-		rv = devm_led_classdev_register(dev, &led->cdev);
+		rv = devm_led_classdev_register_ext(dev, &led->cdev,
+						    &init_data);
 		if (rv)
 			goto err_node_put;
 
-- 
2.26.2

