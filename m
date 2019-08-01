Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08BFA7DE8E
	for <lists+linux-leds@lfdr.de>; Thu,  1 Aug 2019 17:14:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727853AbfHAPOe (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 1 Aug 2019 11:14:34 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:39080 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732400AbfHAPOc (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 1 Aug 2019 11:14:32 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x71FEMVs106262;
        Thu, 1 Aug 2019 10:14:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1564672462;
        bh=leg2rOHZ3RydDboOvt8GXTP7raeVqY+8GAyTLFKbYLo=;
        h=From:To:CC:Subject:Date;
        b=A0BnS6wYWNH3lmYHai4jMXDRaU1loJ1RzI5tv4oFJwo7tuQta+VXMP+xjZAtxAorS
         fXpmQCVPri6+EVzioC2ipSkWY8W6d5FkDhYgAaCRx/BPXuyF7MJBg6ZHY1QPOX2g/M
         MGSWlyYNCEvzWy337pnlT9dEfRxuThF87L6t4WiI=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x71FEM3J121647
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 1 Aug 2019 10:14:22 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 1 Aug
 2019 10:14:22 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 1 Aug 2019 10:14:22 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x71FEMRe032738;
        Thu, 1 Aug 2019 10:14:22 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <tony@atomide.com>,
        <sre@kernel.org>, <nekit1000@gmail.com>, <mpartap@gmx.net>,
        <merlijn@wizzup.org>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH 1/3] leds: lm3532: Fix brightness control for i2c mode
Date:   Thu, 1 Aug 2019 10:14:19 -0500
Message-ID: <20190801151421.21486-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Fix the brightness control for I2C mode.  Instead of
changing the full scale current register update the ALS target
register for the appropriate banks.

In addition clean up some code errors and random misspellings found
during coding.

Tested on Droid4 as well as LM3532 EVM connected to a BeagleBoneBlack

Fixes: e37a7f8d77e1 ("leds: lm3532: Introduce the lm3532 LED driver")
Reported-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 drivers/leds/leds-lm3532.c | 78 ++++++++++++++++++++++++--------------
 1 file changed, 50 insertions(+), 28 deletions(-)

diff --git a/drivers/leds/leds-lm3532.c b/drivers/leds/leds-lm3532.c
index 646100724971..ff197adb2f22 100644
--- a/drivers/leds/leds-lm3532.c
+++ b/drivers/leds/leds-lm3532.c
@@ -23,11 +23,11 @@
 #define LM3532_REG_PWM_B_CFG	0x14
 #define LM3532_REG_PWM_C_CFG	0x15
 #define LM3532_REG_ZONE_CFG_A	0x16
-#define LM3532_REG_CTRL_A_BRT	0x17
+#define LM3532_REG_CTRL_A_FS_CURR	0x17
 #define LM3532_REG_ZONE_CFG_B	0x18
-#define LM3532_REG_CTRL_B_BRT	0x19
+#define LM3532_REG_CTRL_B_FS_CURR	0x19
 #define LM3532_REG_ZONE_CFG_C	0x1a
-#define LM3532_REG_CTRL_C_BRT	0x1b
+#define LM3532_REG_CTRL_C_FS_CURR	0x1b
 #define LM3532_REG_ENABLE	0x1d
 #define LM3532_ALS_CONFIG	0x23
 #define LM3532_REG_ZN_0_HI	0x60
@@ -38,9 +38,12 @@
 #define LM3532_REG_ZN_2_LO	0x65
 #define LM3532_REG_ZN_3_HI	0x66
 #define LM3532_REG_ZN_3_LO	0x67
+#define LM3532_REG_ZONE_TRGT_A	0x70
+#define LM3532_REG_ZONE_TRGT_B	0x75
+#define LM3532_REG_ZONE_TRGT_C	0x7a
 #define LM3532_REG_MAX		0x7e
 
-/* Contorl Enable */
+/* Control Enable */
 #define LM3532_CTRL_A_ENABLE	BIT(0)
 #define LM3532_CTRL_B_ENABLE	BIT(1)
 #define LM3532_CTRL_C_ENABLE	BIT(2)
@@ -63,6 +66,8 @@
 #define LM3532_ZONE_2		BIT(3)
 #define LM3532_ZONE_3		(BIT(2) | BIT(3))
 #define LM3532_ZONE_4		BIT(4)
+#define LM3532_BRT_CFG_MASK	(LM3532_I2C_CTRL | LM3532_LINEAR_MAP | \
+				LM3532_ZONE_MASK)
 
 #define LM3532_ENABLE_ALS	BIT(3)
 #define LM3532_ALS_SEL_SHIFT	6
@@ -127,6 +132,7 @@ struct lm3532_led {
 	int control_bank;
 	int mode;
 	int num_leds;
+	int ctrl_brt_pointer;
 	u32 led_strings[LM3532_MAX_CONTROL_BANKS];
 	char label[LED_MAX_NAME_SIZE];
 };
@@ -161,18 +167,18 @@ struct lm3532_data {
 };
 
 static const struct reg_default lm3532_reg_defs[] = {
-	{LM3532_REG_OUTPUT_CFG, 0xe4},
+	{LM3532_REG_OUTPUT_CFG, 0x24},
 	{LM3532_REG_STARTSHUT_RAMP, 0xc0},
 	{LM3532_REG_RT_RAMP, 0xc0},
 	{LM3532_REG_PWM_A_CFG, 0x82},
 	{LM3532_REG_PWM_B_CFG, 0x82},
 	{LM3532_REG_PWM_C_CFG, 0x82},
 	{LM3532_REG_ZONE_CFG_A, 0xf1},
-	{LM3532_REG_CTRL_A_BRT, 0xf3},
+	{LM3532_REG_CTRL_A_FS_CURR, 0x13},
 	{LM3532_REG_ZONE_CFG_B, 0xf1},
-	{LM3532_REG_CTRL_B_BRT, 0xf3},
+	{LM3532_REG_CTRL_B_FS_CURR, 0x13},
 	{LM3532_REG_ZONE_CFG_C, 0xf1},
-	{LM3532_REG_CTRL_C_BRT, 0xf3},
+	{LM3532_REG_CTRL_C_FS_CURR, 0x13},
 	{LM3532_REG_ENABLE, 0xf8},
 	{LM3532_ALS_CONFIG, 0x44},
 	{LM3532_REG_ZN_0_HI, 0x35},
@@ -302,7 +308,7 @@ static int lm3532_led_disable(struct lm3532_led *led_data)
 	int ret;
 
 	ret = regmap_update_bits(led_data->priv->regmap, LM3532_REG_ENABLE,
-					 ctrl_en_val, ~ctrl_en_val);
+					 ctrl_en_val, 0);
 	if (ret) {
 		dev_err(led_data->priv->dev, "Failed to set ctrl:%d\n", ret);
 		return ret;
@@ -321,7 +327,7 @@ static int lm3532_brightness_set(struct led_classdev *led_cdev,
 
 	mutex_lock(&led->priv->lock);
 
-	if (led->mode == LM3532_BL_MODE_ALS) {
+	if (led->mode == LM3532_ALS_CTRL) {
 		if (brt_val > LED_OFF)
 			ret = lm3532_led_enable(led);
 		else
@@ -339,11 +345,9 @@ static int lm3532_brightness_set(struct led_classdev *led_cdev,
 	if (ret)
 		goto unlock;
 
-	brightness_reg = LM3532_REG_CTRL_A_BRT + led->control_bank * 2;
-	brt_val = brt_val / LM3532_BRT_VAL_ADJUST;
-
+	brightness_reg = LM3532_REG_ZONE_TRGT_A + led->control_bank * 5 +
+			 (led->ctrl_brt_pointer >> 2);
 	ret = regmap_write(led->priv->regmap, brightness_reg, brt_val);
-
 unlock:
 	mutex_unlock(&led->priv->lock);
 	return ret;
@@ -356,8 +360,29 @@ static int lm3532_init_registers(struct lm3532_led *led)
 	unsigned int output_cfg_val = 0;
 	unsigned int output_cfg_shift = 0;
 	unsigned int output_cfg_mask = 0;
+	int brightness_config_reg;
+	int brightness_config_val;
 	int ret, i;
 
+	if (drvdata->enable_gpio)
+		gpiod_direction_output(drvdata->enable_gpio, 1);
+
+	brightness_config_reg = LM3532_REG_ZONE_CFG_A + led->control_bank * 2;
+	/* This could be hard coded to the default value but the control
+	 * brightness register may have changed during boot.
+	 */
+	ret = regmap_read(drvdata->regmap, brightness_config_reg,
+			  &led->ctrl_brt_pointer);
+	if (ret)
+		return ret;
+
+	led->ctrl_brt_pointer &= LM3532_ZONE_MASK;
+	brightness_config_val = led->ctrl_brt_pointer | led->mode;
+	ret = regmap_write(drvdata->regmap, brightness_config_reg,
+			   brightness_config_val);
+	if (ret)
+		return ret;
+
 	for (i = 0; i < led->num_leds; i++) {
 		output_cfg_shift = led->led_strings[i] * 2;
 		output_cfg_val |= (led->control_bank << output_cfg_shift);
@@ -382,7 +407,6 @@ static int lm3532_als_configure(struct lm3532_data *priv,
 	struct lm3532_als_data *als = priv->als_data;
 	u32 als_vmin, als_vmax, als_vstep;
 	int zone_reg = LM3532_REG_ZN_0_HI;
-	int brightnes_config_reg;
 	int ret;
 	int i;
 
@@ -411,14 +435,7 @@ static int lm3532_als_configure(struct lm3532_data *priv,
 	als->config = (als->als_avrg_time | (LM3532_ENABLE_ALS) |
 		(als->als_input_mode << LM3532_ALS_SEL_SHIFT));
 
-	ret = regmap_write(priv->regmap, LM3532_ALS_CONFIG, als->config);
-	if (ret)
-		return ret;
-
-	brightnes_config_reg = LM3532_REG_ZONE_CFG_A + led->control_bank * 2;
-
-	return regmap_update_bits(priv->regmap, brightnes_config_reg,
-				  LM3532_I2C_CTRL, LM3532_ALS_CTRL);
+	return regmap_write(priv->regmap, LM3532_ALS_CONFIG, als->config);
 }
 
 static int lm3532_parse_als(struct lm3532_data *priv)
@@ -542,12 +559,14 @@ static int lm3532_parse_node(struct lm3532_data *priv)
 		}
 
 		if (led->mode == LM3532_BL_MODE_ALS) {
+			led->mode = LM3532_ALS_CTRL;
 			ret = lm3532_parse_als(priv);
 			if (ret)
 				dev_err(&priv->client->dev, "Failed to parse als\n");
 			else
 				lm3532_als_configure(priv, led);
-		}
+		} else
+			led->mode = LM3532_I2C_CTRL;
 
 		led->num_leds = fwnode_property_count_u32(child, "led-sources");
 		if (led->num_leds > LM3532_MAX_LED_STRINGS) {
@@ -587,7 +606,13 @@ static int lm3532_parse_node(struct lm3532_data *priv)
 			goto child_out;
 		}
 
-		lm3532_init_registers(led);
+		ret = lm3532_init_registers(led);
+		if (ret) {
+			dev_err(&priv->client->dev, "register init err: %d\n",
+				ret);
+			fwnode_handle_put(child);
+			goto child_out;
+		}
 
 		i++;
 	}
@@ -634,9 +659,6 @@ static int lm3532_probe(struct i2c_client *client,
 		return ret;
 	}
 
-	if (drvdata->enable_gpio)
-		gpiod_direction_output(drvdata->enable_gpio, 1);
-
 	return ret;
 }
 
-- 
2.22.0.214.g8dca754b1e

