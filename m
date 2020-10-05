Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F36E284081
	for <lists+linux-leds@lfdr.de>; Mon,  5 Oct 2020 22:17:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729545AbgJEURR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 5 Oct 2020 16:17:17 -0400
Received: from w1.tutanota.de ([81.3.6.162]:57686 "EHLO w1.tutanota.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729424AbgJEURR (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 5 Oct 2020 16:17:17 -0400
Received: from w3.tutanota.de (unknown [192.168.1.164])
        by w1.tutanota.de (Postfix) with ESMTP id 5B74AFA039C;
        Mon,  5 Oct 2020 20:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1601929034;
        s=s1; d=tutanota.com;
        h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:Sender;
        bh=5XkgnlTQd6WOQwVSkuER00n9lY+TXOpzZWQXdMuVeu8=;
        b=3+V/+nnk9UjaeE++DjqVTiDy0cEDRuOWJV+UZ2VVvumti86F02083uk6TM24h0SB
        erg0c9owFXX2ZEz8TLwBsdKc46Wb5gXUvPB90dtFWxqyNc3ibOI5PXQj9fIaEndqYIU
        G6JFNoRTmxCjxegxyjejRCkmcr9KcyIBO8QzGCpRQqXNlT28fyDYWrqKxehtwTUl+Fj
        w5l7P9jzMcruKoYyvCiJgL9vpQB684ME10zwymnhSMFosoxIMKJWRQzNG8eaUoNKDkt
        xfwqJHmHaDQZ8I3c80m935HOi8ZBYbSVm3fhlAWc5ajRBB2JE47UPSMe5B/ZtFCZGIe
        PJ8kLAMuMw==
Date:   Mon, 5 Oct 2020 22:17:14 +0200 (CEST)
From:   ultracoolguy@tutanota.com
To:     Pavel <pavel@ucw.cz>, Dmurphy <dmurphy@ti.com>
Cc:     Marek Behun <kabel@blackhole.sk>,
        Linux Leds <linux-leds@vger.kernel.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>
Message-ID: <MIuPIKy--3-2@tutanota.com>
Subject: [PATCH] lm3697: Rename struct into more appropiate name
MIME-Version: 1.0
Content-Type: multipart/mixed; 
        boundary="----=_Part_71042_2087577313.1601929034359"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

------=_Part_71042_2087577313.1601929034359
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Subject says it all. This rename was briefly discussed in this other patch: https://www.spinics.net/lists/linux-leds/msg16865.html (I don't know another way to link to emails, so I'll just use this archive).

Feel free to suggest another name for the commit; that was just the better name I could come up with :/ .





------=_Part_71042_2087577313.1601929034359
Content-Type: text/x-patch; charset=us-ascii; 
	name=0001-lm3697-Rename-struct-into-more-appropriate-name.patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; 
	filename=0001-lm3697-Rename-struct-into-more-appropriate-name.patch

From 5e0b0aa5f5c1e9a6837151fdeb08b56757c8bc31 Mon Sep 17 00:00:00 2001
From: Gabriel David <ultracoolguy@tutanota.com>
Date: Mon, 5 Oct 2020 15:16:34 -0400
Subject: [PATCH] lm3697: Rename struct into more appropriate name

The mentioned struct is lm3697_led, which is now lm3697_bank.
The pointers referring to it were also renamed.

Signed-off-by: Gabriel David <ultracoolguy@tutanota.com>
---
 drivers/leds/leds-lm3697.c | 78 +++++++++++++++++++-------------------
 1 file changed, 39 insertions(+), 39 deletions(-)

diff --git a/drivers/leds/leds-lm3697.c b/drivers/leds/leds-lm3697.c
index 7d216cdb9..287165097 100644
--- a/drivers/leds/leds-lm3697.c
+++ b/drivers/leds/leds-lm3697.c
@@ -39,7 +39,7 @@
 #define LM3697_MAX_CONTROL_BANKS 2
 
 /**
- * struct lm3697_led -
+ * struct lm3697_bank -
  * @hvled_strings: Array of LED strings associated with a control bank
  * @label: LED label
  * @led_dev: LED class device
@@ -48,7 +48,7 @@
  * @control_bank: Control bank the LED is associated to. 0 is control bank A
  *		   1 is control bank B
  */
-struct lm3697_led {
+struct lm3697_bank {
 	u32 hvled_strings[LM3697_MAX_LED_STRINGS];
 	char label[LED_MAX_NAME_SIZE];
 	struct led_classdev led_dev;
@@ -80,7 +80,7 @@ struct lm3697 {
 	int bank_cfg;
 	int num_banks;
 
-	struct lm3697_led leds[];
+	struct lm3697_bank banks[];
 };
 
 static const struct reg_default lm3697_reg_defs[] = {
@@ -113,32 +113,32 @@ static const struct regmap_config lm3697_regmap_config = {
 static int lm3697_brightness_set(struct led_classdev *led_cdev,
 				enum led_brightness brt_val)
 {
-	struct lm3697_led *led = container_of(led_cdev, struct lm3697_led,
+	struct lm3697_bank *bank = container_of(led_cdev, struct lm3697_bank,
 					      led_dev);
-	int ctrl_en_val = (1 << led->control_bank);
-	struct device *dev = led->priv->dev;
+	int ctrl_en_val = (1 << bank->control_bank);
+	struct device *dev = bank->priv->dev;
 	int ret;
 
-	mutex_lock(&led->priv->lock);
+	mutex_lock(&bank->priv->lock);
 
 	if (brt_val == LED_OFF) {
-		ret = regmap_update_bits(led->priv->regmap, LM3697_CTRL_ENABLE,
+		ret = regmap_update_bits(bank->priv->regmap, LM3697_CTRL_ENABLE,
 					 ctrl_en_val, ~ctrl_en_val);
 		if (ret) {
 			dev_err(dev, "Cannot write ctrl register\n");
 			goto brightness_out;
 		}
 
-		led->enabled = LED_OFF;
+		bank->enabled = LED_OFF;
 	} else {
-		ret = ti_lmu_common_set_brightness(&led->lmu_data, brt_val);
+		ret = ti_lmu_common_set_brightness(&bank->lmu_data, brt_val);
 		if (ret) {
 			dev_err(dev, "Cannot write brightness\n");
 			goto brightness_out;
 		}
 
-		if (!led->enabled) {
-			ret = regmap_update_bits(led->priv->regmap,
+		if (!bank->enabled) {
+			ret = regmap_update_bits(bank->priv->regmap,
 						 LM3697_CTRL_ENABLE,
 						 ctrl_en_val, ctrl_en_val);
 			if (ret) {
@@ -146,19 +146,19 @@ static int lm3697_brightness_set(struct led_classdev *led_cdev,
 				goto brightness_out;
 			}
 
-			led->enabled = brt_val;
+			bank->enabled = brt_val;
 		}
 	}
 
 brightness_out:
-	mutex_unlock(&led->priv->lock);
+	mutex_unlock(&bank->priv->lock);
 	return ret;
 }
 
 static int lm3697_init(struct lm3697 *priv)
 {
 	struct device *dev = priv->dev;
-	struct lm3697_led *led;
+	struct lm3697_bank *bank;
 	int i, ret;
 
 	if (priv->enable_gpio) {
@@ -182,8 +182,8 @@ static int lm3697_init(struct lm3697 *priv)
 		dev_err(dev, "Cannot write OUTPUT config\n");
 
 	for (i = 0; i < priv->num_banks; i++) {
-		led = &priv->leds[i];
-		ret = ti_lmu_common_set_ramp(&led->lmu_data);
+		bank = &priv->banks[i];
+		ret = ti_lmu_common_set_ramp(&bank->lmu_data);
 		if (ret)
 			dev_err(dev, "Setting the ramp rate failed\n");
 	}
@@ -195,7 +195,7 @@ static int lm3697_probe_dt(struct lm3697 *priv)
 {
 	struct fwnode_handle *child = NULL;
 	struct device *dev = priv->dev;
-	struct lm3697_led *led;
+	struct lm3697_bank *bank;
 	int ret = -EINVAL;
 	int control_bank;
 	size_t i = 0;
@@ -230,42 +230,42 @@ static int lm3697_probe_dt(struct lm3697 *priv)
 			goto child_out;
 		}
 
-		led = &priv->leds[i];
+		bank = &priv->banks[i];
 
-		ret = ti_lmu_common_get_brt_res(dev, child, &led->lmu_data);
+		ret = ti_lmu_common_get_brt_res(dev, child, &bank->lmu_data);
 		if (ret)
 			dev_warn(dev,
 				 "brightness resolution property missing\n");
 
-		led->control_bank = control_bank;
-		led->lmu_data.regmap = priv->regmap;
-		led->lmu_data.runtime_ramp_reg = LM3697_CTRL_A_RAMP +
+		bank->control_bank = control_bank;
+		bank->lmu_data.regmap = priv->regmap;
+		bank->lmu_data.runtime_ramp_reg = LM3697_CTRL_A_RAMP +
 						 control_bank;
-		led->lmu_data.msb_brightness_reg = LM3697_CTRL_A_BRT_MSB +
-						   led->control_bank * 2;
-		led->lmu_data.lsb_brightness_reg = LM3697_CTRL_A_BRT_LSB +
-						   led->control_bank * 2;
+		bank->lmu_data.msb_brightness_reg = LM3697_CTRL_A_BRT_MSB +
+						   bank->control_bank * 2;
+		bank->lmu_data.lsb_brightness_reg = LM3697_CTRL_A_BRT_LSB +
+						   bank->control_bank * 2;
 
-		led->num_leds = fwnode_property_count_u32(child, "led-sources");
-		if (led->num_leds > LM3697_MAX_LED_STRINGS) {
+		bank->num_leds = fwnode_property_count_u32(child, "led-sources");
+		if (bank->num_leds > LM3697_MAX_LED_STRINGS) {
 			dev_err(dev, "Too many LED strings defined\n");
 			continue;
 		}
 
 		ret = fwnode_property_read_u32_array(child, "led-sources",
-						    led->hvled_strings,
-						    led->num_leds);
+						    bank->hvled_strings,
+						    bank->num_leds);
 		if (ret) {
 			dev_err(dev, "led-sources property missing\n");
 			fwnode_handle_put(child);
 			goto child_out;
 		}
 
-		for (j = 0; j < led->num_leds; j++)
+		for (j = 0; j < bank->num_leds; j++)
 			priv->bank_cfg |=
-				(led->control_bank << led->hvled_strings[j]);
+				(bank->control_bank << bank->hvled_strings[j]);
 
-		ret = ti_lmu_common_get_ramp_params(dev, child, &led->lmu_data);
+		ret = ti_lmu_common_get_ramp_params(dev, child, &bank->lmu_data);
 		if (ret)
 			dev_warn(dev, "runtime-ramp properties missing\n");
 
@@ -274,11 +274,11 @@ static int lm3697_probe_dt(struct lm3697 *priv)
 		/* for backwards compatibility if `label` is not present */
 		init_data.default_label = ":";
 
-		led->priv = priv;
-		led->led_dev.max_brightness = led->lmu_data.max_brightness;
-		led->led_dev.brightness_set_blocking = lm3697_brightness_set;
+		bank->priv = priv;
+		bank->led_dev.max_brightness = bank->lmu_data.max_brightness;
+		bank->led_dev.brightness_set_blocking = lm3697_brightness_set;
 
-		ret = devm_led_classdev_register_ext(dev, &led->led_dev,
+		ret = devm_led_classdev_register_ext(dev, &bank->led_dev,
 						     &init_data);
 		if (ret) {
 			dev_err(dev, "led register err: %d\n", ret);
@@ -307,7 +307,7 @@ static int lm3697_probe(struct i2c_client *client,
 		return -ENODEV;
 	}
 
-	led = devm_kzalloc(dev, struct_size(led, leds, count), GFP_KERNEL);
+	led = devm_kzalloc(dev, struct_size(led, banks, count), GFP_KERNEL);
 	if (!led)
 		return -ENOMEM;
 
-- 
2.28.0


------=_Part_71042_2087577313.1601929034359--
