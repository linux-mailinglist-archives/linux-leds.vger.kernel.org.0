Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5E19969C8
	for <lists+linux-leds@lfdr.de>; Tue, 20 Aug 2019 21:53:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730701AbfHTTx3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 20 Aug 2019 15:53:29 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:60928 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729833AbfHTTx2 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 20 Aug 2019 15:53:28 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7KJrIXt074392;
        Tue, 20 Aug 2019 14:53:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566330798;
        bh=1Y9+XjYRFLbflyvbX9e5HxjQ1hWCEl4/iaqYE2kemX4=;
        h=From:To:CC:Subject:Date;
        b=Rb+6JZPYr59IO1UO6kJUW1G9u+WIezIgkmGJuujLw/QMXUDwpdkciaY78ySDKNmOF
         dKLVesqMW2FI3JZbe1o5hGvZJkoar2+vi1zu3C7aPuHNpMgsiH7nmUYVpCHzT+B9Fi
         +DIQzVPvz4WZqJXC7ToQJELFfk/7B6iVdjUY+1uE=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7KJrHIq116193
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 20 Aug 2019 14:53:18 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 20
 Aug 2019 14:53:17 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 20 Aug 2019 14:53:17 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7KJrHx3070705;
        Tue, 20 Aug 2019 14:53:17 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <tony@atomide.com>,
        <sre@kernel.org>, <nekit1000@gmail.com>, <mpartap@gmx.net>,
        <merlijn@wizzup.org>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v3 1/5] leds: lm3532: Fix brightness control for i2c mode
Date:   Tue, 20 Aug 2019 14:53:03 -0500
Message-ID: <20190820195307.27590-1-dmurphy@ti.com>
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

v3 - Removed register define updates - https://lore.kernel.org/patchwork/patch/1114542/

 drivers/leds/leds-lm3532.c | 44 ++++++++++++++++++++++++++------------
 1 file changed, 30 insertions(+), 14 deletions(-)

diff --git a/drivers/leds/leds-lm3532.c b/drivers/leds/leds-lm3532.c
index 646100724971..8132d05f7add 100644
--- a/drivers/leds/leds-lm3532.c
+++ b/drivers/leds/leds-lm3532.c
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

