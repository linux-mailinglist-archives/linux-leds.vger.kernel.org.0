Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB7BA270FE4
	for <lists+linux-leds@lfdr.de>; Sat, 19 Sep 2020 20:03:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726511AbgISSDJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 19 Sep 2020 14:03:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726549AbgISSDJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 19 Sep 2020 14:03:09 -0400
Received: from mail.nic.cz (lists.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C88A3C0613CF
        for <linux-leds@vger.kernel.org>; Sat, 19 Sep 2020 11:03:07 -0700 (PDT)
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 8412C140A22;
        Sat, 19 Sep 2020 20:03:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600538585; bh=fCMAH5JtOBkGkPc9vJmWsxLGgsbyXj14D0Vf5a3TOv0=;
        h=From:To:Date;
        b=hf1YhY2Y+ftw3uagjrLsfQ98AdVEEBEXQCqG3XpevIOdL/pxuoSkxKWTBDwXTwAlY
         0owQQHl06CwKYKHFl/NKu14HrmfJdguBXgsxmZRfW72mMX7g5w9N34x3DbDZLhCC+f
         xKvx1SKd1+aP7+sWFGWGXNXP/8Jdz5qVuVA3vTsI=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
Subject: [PATCH leds v3 1/9] leds: lm36274: cosmetic: rename lm36274_data to chip
Date:   Sat, 19 Sep 2020 20:02:56 +0200
Message-Id: <20200919180304.2885-2-marek.behun@nic.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200919180304.2885-1-marek.behun@nic.cz>
References: <20200919180304.2885-1-marek.behun@nic.cz>
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

Rename this variable so that it is easier to read and easier to write in
80 columns. Also rename variable of this type in lm36274_brightness_set
from led to chip, to be consistent.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Dan Murphy <dmurphy@ti.com>
---
 drivers/leds/leds-lm36274.c | 82 ++++++++++++++++++-------------------
 1 file changed, 40 insertions(+), 42 deletions(-)

diff --git a/drivers/leds/leds-lm36274.c b/drivers/leds/leds-lm36274.c
index bfeee03a0053c..4a9f786bb9727 100644
--- a/drivers/leds/leds-lm36274.c
+++ b/drivers/leds/leds-lm36274.c
@@ -41,37 +41,36 @@ struct lm36274 {
 };
 
 static int lm36274_brightness_set(struct led_classdev *led_cdev,
-				enum led_brightness brt_val)
+				  enum led_brightness brt_val)
 {
-	struct lm36274 *led = container_of(led_cdev, struct lm36274, led_dev);
+	struct lm36274 *chip = container_of(led_cdev, struct lm36274, led_dev);
 
-	return ti_lmu_common_set_brightness(&led->lmu_data, brt_val);
+	return ti_lmu_common_set_brightness(&chip->lmu_data, brt_val);
 }
 
-static int lm36274_init(struct lm36274 *lm36274_data)
+static int lm36274_init(struct lm36274 *chip)
 {
 	int enable_val = 0;
 	int i;
 
-	for (i = 0; i < lm36274_data->num_leds; i++)
-		enable_val |= (1 << lm36274_data->led_sources[i]);
+	for (i = 0; i < chip->num_leds; i++)
+		enable_val |= (1 << chip->led_sources[i]);
 
 	if (!enable_val) {
-		dev_err(lm36274_data->dev, "No LEDs were enabled\n");
+		dev_err(chip->dev, "No LEDs were enabled\n");
 		return -EINVAL;
 	}
 
 	enable_val |= LM36274_BL_EN;
 
-	return regmap_write(lm36274_data->regmap, LM36274_REG_BL_EN,
-			    enable_val);
+	return regmap_write(chip->regmap, LM36274_REG_BL_EN, enable_val);
 }
 
-static int lm36274_parse_dt(struct lm36274 *lm36274_data)
+static int lm36274_parse_dt(struct lm36274 *chip)
 {
 	struct fwnode_handle *child = NULL;
 	char label[LED_MAX_NAME_SIZE];
-	struct device *dev = &lm36274_data->pdev->dev;
+	struct device *dev = &chip->pdev->dev;
 	const char *name;
 	int child_cnt;
 	int ret = -EINVAL;
@@ -84,37 +83,37 @@ static int lm36274_parse_dt(struct lm36274 *lm36274_data)
 	device_for_each_child_node(dev, child) {
 		ret = fwnode_property_read_string(child, "label", &name);
 		if (ret)
-			snprintf(label, sizeof(label),
-				"%s::", lm36274_data->pdev->name);
+			snprintf(label, sizeof(label), "%s::",
+				 chip->pdev->name);
 		else
-			snprintf(label, sizeof(label),
-				 "%s:%s", lm36274_data->pdev->name, name);
+			snprintf(label, sizeof(label), "%s:%s",
+				 chip->pdev->name, name);
 
-		lm36274_data->num_leds = fwnode_property_count_u32(child, "led-sources");
-		if (lm36274_data->num_leds <= 0)
+		chip->num_leds = fwnode_property_count_u32(child, "led-sources");
+		if (chip->num_leds <= 0)
 			return -ENODEV;
 
 		ret = fwnode_property_read_u32_array(child, "led-sources",
-						     lm36274_data->led_sources,
-						     lm36274_data->num_leds);
+						     chip->led_sources,
+						     chip->num_leds);
 		if (ret) {
 			dev_err(dev, "led-sources property missing\n");
 			return ret;
 		}
 
 		fwnode_property_read_string(child, "linux,default-trigger",
-					&lm36274_data->led_dev.default_trigger);
+					    &chip->led_dev.default_trigger);
 
 	}
 
-	lm36274_data->lmu_data.regmap = lm36274_data->regmap;
-	lm36274_data->lmu_data.max_brightness = MAX_BRIGHTNESS_11BIT;
-	lm36274_data->lmu_data.msb_brightness_reg = LM36274_REG_BRT_MSB;
-	lm36274_data->lmu_data.lsb_brightness_reg = LM36274_REG_BRT_LSB;
+	chip->lmu_data.regmap = chip->regmap;
+	chip->lmu_data.max_brightness = MAX_BRIGHTNESS_11BIT;
+	chip->lmu_data.msb_brightness_reg = LM36274_REG_BRT_MSB;
+	chip->lmu_data.lsb_brightness_reg = LM36274_REG_BRT_LSB;
 
-	lm36274_data->led_dev.name = label;
-	lm36274_data->led_dev.max_brightness = MAX_BRIGHTNESS_11BIT;
-	lm36274_data->led_dev.brightness_set_blocking = lm36274_brightness_set;
+	chip->led_dev.name = label;
+	chip->led_dev.max_brightness = MAX_BRIGHTNESS_11BIT;
+	chip->led_dev.brightness_set_blocking = lm36274_brightness_set;
 
 	return 0;
 }
@@ -122,39 +121,38 @@ static int lm36274_parse_dt(struct lm36274 *lm36274_data)
 static int lm36274_probe(struct platform_device *pdev)
 {
 	struct ti_lmu *lmu = dev_get_drvdata(pdev->dev.parent);
-	struct lm36274 *lm36274_data;
+	struct lm36274 *chip;
 	int ret;
 
-	lm36274_data = devm_kzalloc(&pdev->dev, sizeof(*lm36274_data),
-				    GFP_KERNEL);
-	if (!lm36274_data)
+	chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
 		return -ENOMEM;
 
-	lm36274_data->pdev = pdev;
-	lm36274_data->dev = lmu->dev;
-	lm36274_data->regmap = lmu->regmap;
-	platform_set_drvdata(pdev, lm36274_data);
+	chip->pdev = pdev;
+	chip->dev = lmu->dev;
+	chip->regmap = lmu->regmap;
+	platform_set_drvdata(pdev, chip);
 
-	ret = lm36274_parse_dt(lm36274_data);
+	ret = lm36274_parse_dt(chip);
 	if (ret) {
-		dev_err(lm36274_data->dev, "Failed to parse DT node\n");
+		dev_err(chip->dev, "Failed to parse DT node\n");
 		return ret;
 	}
 
-	ret = lm36274_init(lm36274_data);
+	ret = lm36274_init(chip);
 	if (ret) {
-		dev_err(lm36274_data->dev, "Failed to init the device\n");
+		dev_err(chip->dev, "Failed to init the device\n");
 		return ret;
 	}
 
-	return led_classdev_register(lm36274_data->dev, &lm36274_data->led_dev);
+	return led_classdev_register(chip->dev, &chip->led_dev);
 }
 
 static int lm36274_remove(struct platform_device *pdev)
 {
-	struct lm36274 *lm36274_data = platform_get_drvdata(pdev);
+	struct lm36274 *chip = platform_get_drvdata(pdev);
 
-	led_classdev_unregister(&lm36274_data->led_dev);
+	led_classdev_unregister(&chip->led_dev);
 
 	return 0;
 }
-- 
2.26.2

