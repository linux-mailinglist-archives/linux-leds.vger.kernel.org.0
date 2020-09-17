Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9722326E8AF
	for <lists+linux-leds@lfdr.de>; Fri, 18 Sep 2020 00:35:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726198AbgIQWeM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 17 Sep 2020 18:34:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726112AbgIQWeL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 17 Sep 2020 18:34:11 -0400
Received: from mail.nic.cz (lists.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C74EC061355;
        Thu, 17 Sep 2020 15:34:01 -0700 (PDT)
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 6BE38140A99;
        Fri, 18 Sep 2020 00:33:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600382039; bh=Wotn7e2cgVkVaUKncYL5Az1W3C0Cc2Am3nyHbP1RV1U=;
        h=From:To:Date;
        b=Ouxv4n/tyYy+vN7SHRoHInayco5+mwhXXnMZFwAFsVmzeqm3MukX3mFhaJD8fLUnj
         BBfZkV4fjUhuJDIUMO8/hmJfrJOMrpOU0tqdMTW9nvYr2+u2ooPi9YZVimiAKvs5Cv
         zLPZhuy4YBLRMhFuh9KGXB7zCOEvYebEH8+Huc1Y=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megous@megous.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
Subject: [PATCH leds v2 34/50] leds: lm36274: use struct led_init_data when registering
Date:   Fri, 18 Sep 2020 00:33:22 +0200
Message-Id: <20200917223338.14164-35-marek.behun@nic.cz>
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
  "parent_name::"
For backwards compatibility we therefore set
  init_data->default_label = ":";
so that the LED will not get a different name if `label` property is not
present, nor are `color` and `function`.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Dan Murphy <dmurphy@ti.com>
---
 drivers/leds/leds-lm36274.c | 43 ++++++++++++++++++++++---------------
 1 file changed, 26 insertions(+), 17 deletions(-)

diff --git a/drivers/leds/leds-lm36274.c b/drivers/leds/leds-lm36274.c
index 4282b7392f2b5..294edcc054bea 100644
--- a/drivers/leds/leds-lm36274.c
+++ b/drivers/leds/leds-lm36274.c
@@ -66,12 +66,11 @@ static int lm36274_init(struct lm36274 *chip)
 	return regmap_write(chip->regmap, LM36274_REG_BL_EN, enable_val);
 }
 
-static int lm36274_parse_dt(struct lm36274 *chip)
+static int lm36274_parse_dt(struct lm36274 *chip,
+			    struct led_init_data *init_data)
 {
-	struct fwnode_handle *child = NULL;
-	char label[LED_MAX_NAME_SIZE];
 	struct device *dev = &chip->pdev->dev;
-	const char *name;
+	struct fwnode_handle *child;
 	int ret;
 
 	/* There should only be 1 node */
@@ -80,43 +79,45 @@ static int lm36274_parse_dt(struct lm36274 *chip)
 
 	child = device_get_next_child_node(dev, NULL);
 
-	ret = fwnode_property_read_string(child, "label", &name);
-	if (ret)
-		snprintf(label, sizeof(label), "%s::", chip->pdev->name);
-	else
-		snprintf(label, sizeof(label), "%s:%s", chip->pdev->name, name);
+	init_data->fwnode = child;
+	init_data->devicename = chip->pdev->name;
+	/* for backwards compatibility when `label` property is not present */
+	init_data->default_label = ":";
 
 	chip->num_leds = fwnode_property_count_u32(child, "led-sources");
-	if (chip->num_leds <= 0)
-		return -ENODEV;
+	if (chip->num_leds <= 0) {
+		ret = -ENODEV;
+		goto err;
+	}
 
 	ret = fwnode_property_read_u32_array(child, "led-sources",
 					     chip->led_sources, chip->num_leds);
 	if (ret) {
 		dev_err(dev, "led-sources property missing\n");
-		return ret;
+		goto err;
 	}
 
 	fwnode_property_read_string(child, "linux,default-trigger",
 				    &chip->led_dev.default_trigger);
 
-	fwnode_handle_put(child);
-
 	chip->lmu_data.regmap = chip->regmap;
 	chip->lmu_data.max_brightness = MAX_BRIGHTNESS_11BIT;
 	chip->lmu_data.msb_brightness_reg = LM36274_REG_BRT_MSB;
 	chip->lmu_data.lsb_brightness_reg = LM36274_REG_BRT_LSB;
 
-	chip->led_dev.name = label;
 	chip->led_dev.max_brightness = MAX_BRIGHTNESS_11BIT;
 	chip->led_dev.brightness_set_blocking = lm36274_brightness_set;
 
 	return 0;
+err:
+	fwnode_handle_put(child);
+	return ret;
 }
 
 static int lm36274_probe(struct platform_device *pdev)
 {
 	struct ti_lmu *lmu = dev_get_drvdata(pdev->dev.parent);
+	struct led_init_data init_data = {};
 	struct lm36274 *chip;
 	int ret;
 
@@ -129,7 +130,7 @@ static int lm36274_probe(struct platform_device *pdev)
 	chip->regmap = lmu->regmap;
 	platform_set_drvdata(pdev, chip);
 
-	ret = lm36274_parse_dt(chip);
+	ret = lm36274_parse_dt(chip, &init_data);
 	if (ret) {
 		dev_err(chip->dev, "Failed to parse DT node\n");
 		return ret;
@@ -141,7 +142,15 @@ static int lm36274_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	return devm_led_classdev_register(chip->dev, &chip->led_dev);
+	ret = devm_led_classdev_register_ext(chip->dev, &chip->led_dev,
+					     &init_data);
+	if (ret)
+		dev_err(chip->dev, "Failed to register LED for node %pfw\n",
+			init_data.fwnode);
+
+	fwnode_handle_put(init_data.fwnode);
+
+	return ret;
 }
 
 static const struct of_device_id of_lm36274_leds_match[] = {
-- 
2.26.2

