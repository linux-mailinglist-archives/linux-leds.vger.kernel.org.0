Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1AD026CF7B
	for <lists+linux-leds@lfdr.de>; Thu, 17 Sep 2020 01:17:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727464AbgIPXRo (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 16 Sep 2020 19:17:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726917AbgIPXQ5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 16 Sep 2020 19:16:57 -0400
Received: from mail.nic.cz (lists.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E443C061788;
        Wed, 16 Sep 2020 16:16:56 -0700 (PDT)
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 20C79140A3F;
        Thu, 17 Sep 2020 01:16:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600298213; bh=NLdLBB/xYveBEvoEdmCbn72+W7/dMLpcsR0cKBC7yTA=;
        h=From:To:Date;
        b=eFyzz/rHyz+pFA91N1RYZqWayp+btcJsPS4Ig+d5OJCSqyk7GxxnmlxAetr8iNeY+
         2OCHvjDnSk6qAdNy+QwNwLucoKIOP7LWmHqIAxszYHDMz0JAIybS/zlpr3xEKQuVcT
         qZYpbw9EaAzDNIx2utO1792nYXpcqOUylhuVUJD4=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megous@megous.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH leds v1 06/10] leds: pm8058: use struct led_init_data when registering
Date:   Thu, 17 Sep 2020 01:16:46 +0200
Message-Id: <20200916231650.11484-7-marek.behun@nic.cz>
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

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/leds/leds-pm8058.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/leds/leds-pm8058.c b/drivers/leds/leds-pm8058.c
index 7869ccdf70ce6..f6190e4af60fe 100644
--- a/drivers/leds/leds-pm8058.c
+++ b/drivers/leds/leds-pm8058.c
@@ -87,36 +87,37 @@ static enum led_brightness pm8058_led_get(struct led_classdev *cled)
 
 static int pm8058_led_probe(struct platform_device *pdev)
 {
+	struct led_init_data init_data = {};
+	struct device *dev = &pdev->dev;
+	enum led_brightness maxbright;
+	struct device_node *np;
 	struct pm8058_led *led;
-	struct device_node *np = pdev->dev.of_node;
-	int ret;
 	struct regmap *map;
 	const char *state;
-	enum led_brightness maxbright;
+	int ret;
 
-	led = devm_kzalloc(&pdev->dev, sizeof(*led), GFP_KERNEL);
+	led = devm_kzalloc(dev, sizeof(*led), GFP_KERNEL);
 	if (!led)
 		return -ENOMEM;
 
-	led->ledtype = (u32)(unsigned long)of_device_get_match_data(&pdev->dev);
+	led->ledtype = (u32)(unsigned long)device_get_match_data(dev);
 
-	map = dev_get_regmap(pdev->dev.parent, NULL);
+	map = dev_get_regmap(dev->parent, NULL);
 	if (!map) {
-		dev_err(&pdev->dev, "Parent regmap unavailable.\n");
+		dev_err(dev, "Parent regmap unavailable.\n");
 		return -ENXIO;
 	}
 	led->map = map;
 
+	np = dev_of_node(dev);
+
 	ret = of_property_read_u32(np, "reg", &led->reg);
 	if (ret) {
-		dev_err(&pdev->dev, "no register offset specified\n");
+		dev_err(dev, "no register offset specified\n");
 		return -EINVAL;
 	}
 
 	/* Use label else node name */
-	led->cdev.name = of_get_property(np, "label", NULL) ? : np->name;
-	led->cdev.default_trigger =
-		of_get_property(np, "linux,default-trigger", NULL);
 	led->cdev.brightness_set = pm8058_led_set;
 	led->cdev.brightness_get = pm8058_led_get;
 	if (led->ledtype == PM8058_LED_TYPE_COMMON)
@@ -142,14 +143,13 @@ static int pm8058_led_probe(struct platform_device *pdev)
 	    led->ledtype == PM8058_LED_TYPE_FLASH)
 		led->cdev.flags	= LED_CORE_SUSPENDRESUME;
 
-	ret = devm_led_classdev_register(&pdev->dev, &led->cdev);
-	if (ret) {
-		dev_err(&pdev->dev, "unable to register led \"%s\"\n",
-			led->cdev.name);
-		return ret;
-	}
+	init_data.fwnode = of_fwnode_handle(np);
+
+	ret = devm_led_classdev_register_ext(dev, &led->cdev, &init_data);
+	if (ret)
+		dev_err(dev, "Failed to register LED for node %pOF\n", np);
 
-	return 0;
+	return ret;
 }
 
 static const struct of_device_id pm8058_leds_id_table[] = {
@@ -173,7 +173,7 @@ static struct platform_driver pm8058_led_driver = {
 	.probe		= pm8058_led_probe,
 	.driver		= {
 		.name	= "pm8058-leds",
-		.of_match_table = pm8058_leds_id_table,
+		.of_match_table = of_match_ptr(pm8058_leds_id_table),
 	},
 };
 module_platform_driver(pm8058_led_driver);
-- 
2.26.2

