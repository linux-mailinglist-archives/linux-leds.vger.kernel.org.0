Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C94738C035
	for <lists+linux-leds@lfdr.de>; Tue, 13 Aug 2019 20:12:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728442AbfHMSMM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 13 Aug 2019 14:12:12 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:53536 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728389AbfHMSML (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 13 Aug 2019 14:12:11 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7DIBxGC093394;
        Tue, 13 Aug 2019 13:11:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1565719919;
        bh=6IElY7mu7NaowaOQQQSPP6rPLthYZQitAQKvQcMKjKE=;
        h=From:To:CC:Subject:Date;
        b=JrpWH2mS9kUG9vn0WkYsW2nxuloDCDK1QZkLLHB6wFi3wPsC3mVQUc2/Dh2M22QA5
         qf9tF+9/dgkJpl94W7LpuahhxBumzbUwhJgiMh/gZIu6pabhuJqKR+cGiov0o6yR/z
         Cq3pRGKcjslAiwb/ZujyVwnk4l689bsuju1uDTNs=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7DIBxw8004227
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 13 Aug 2019 13:11:59 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 13
 Aug 2019 13:11:59 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 13 Aug 2019 13:11:59 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7DIBwNM051016;
        Tue, 13 Aug 2019 13:11:59 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <tony@atomide.com>,
        <sre@kernel.org>, <nekit1000@gmail.com>, <mpartap@gmx.net>,
        <merlijn@wizzup.org>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v2 1/4] leds: lm3532: Fix brightness control for i2c mode
Date:   Tue, 13 Aug 2019 13:11:51 -0500
Message-ID: <20190813181154.6614-1-dmurphy@ti.com>
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

v2 - Separated out random fixes and brightness control fix - https://lore.kernel.org/patchwork/patch/1109502/

 drivers/leds/leds-lm3532.c | 56 ++++++++++++++++++++++++--------------
 1 file changed, 36 insertions(+), 20 deletions(-)

diff --git a/drivers/leds/leds-lm3532.c b/drivers/leds/leds-lm3532.c
index 646100724971..b28b7f63198b 100644
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
@@ -38,6 +38,9 @@
 #define LM3532_REG_ZN_2_LO	0x65
 #define LM3532_REG_ZN_3_HI	0x66
 #define LM3532_REG_ZN_3_LO	0x67
+#define LM3532_REG_ZONE_TRGT_A	0x70
+#define LM3532_REG_ZONE_TRGT_B	0x75
+#define LM3532_REG_ZONE_TRGT_C	0x7a
 #define LM3532_REG_MAX		0x7e
 
 /* Contorl Enable */
@@ -116,6 +119,7 @@ struct lm3532_als_data {
  * @priv - Pointer the device data structure
  * @control_bank - Control bank the LED is associated to
  * @mode - Mode of the LED string
+ * @ctrl_brt_pointer - Zone target register that controls the sink
  * @num_leds - Number of LED strings are supported in this array
  * @led_strings - The LED strings supported in this array
  * @label - LED label
@@ -126,6 +130,7 @@ struct lm3532_led {
 
 	int control_bank;
 	int mode;
+	int ctrl_brt_pointer;
 	int num_leds;
 	u32 led_strings[LM3532_MAX_CONTROL_BANKS];
 	char label[LED_MAX_NAME_SIZE];
@@ -168,11 +173,11 @@ static const struct reg_default lm3532_reg_defs[] = {
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
@@ -339,8 +344,8 @@ static int lm3532_brightness_set(struct led_classdev *led_cdev,
 	if (ret)
 		goto unlock;
 
-	brightness_reg = LM3532_REG_CTRL_A_BRT + led->control_bank * 2;
-	brt_val = brt_val / LM3532_BRT_VAL_ADJUST;
+	brightness_reg = LM3532_REG_ZONE_TRGT_A + led->control_bank * 5 +
+			 (led->ctrl_brt_pointer >> 2);
 
 	ret = regmap_write(led->priv->regmap, brightness_reg, brt_val);
 
@@ -356,8 +361,30 @@ static int lm3532_init_registers(struct lm3532_led *led)
 	unsigned int output_cfg_val = 0;
 	unsigned int output_cfg_shift = 0;
 	unsigned int output_cfg_mask = 0;
+	unsigned int brightness_config_reg;
+	unsigned int brightness_config_val;
 	int ret, i;
 
+	if (drvdata->enable_gpio)
+		gpiod_direction_output(drvdata->enable_gpio, 1);
+
+	brightness_config_reg = LM3532_REG_ZONE_CFG_A + led->control_bank * 2;
+	/*
+	 * This could be hard coded to the default value but the control
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
@@ -382,7 +409,6 @@ static int lm3532_als_configure(struct lm3532_data *priv,
 	struct lm3532_als_data *als = priv->als_data;
 	u32 als_vmin, als_vmax, als_vstep;
 	int zone_reg = LM3532_REG_ZN_0_HI;
-	int brightnes_config_reg;
 	int ret;
 	int i;
 
@@ -411,14 +437,7 @@ static int lm3532_als_configure(struct lm3532_data *priv,
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
@@ -634,9 +653,6 @@ static int lm3532_probe(struct i2c_client *client,
 		return ret;
 	}
 
-	if (drvdata->enable_gpio)
-		gpiod_direction_output(drvdata->enable_gpio, 1);
-
 	return ret;
 }
 
-- 
2.22.0.214.g8dca754b1e

