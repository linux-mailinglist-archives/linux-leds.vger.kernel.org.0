Return-Path: <linux-leds+bounces-6136-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CAAC5C6B6
	for <lists+linux-leds@lfdr.de>; Fri, 14 Nov 2025 11:02:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 904DA355AD3
	for <lists+linux-leds@lfdr.de>; Fri, 14 Nov 2025 09:54:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAF642D73A3;
	Fri, 14 Nov 2025 09:54:42 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.bugwerft.de (mail.bugwerft.de [46.23.86.59])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F22C63081D3
	for <linux-leds@vger.kernel.org>; Fri, 14 Nov 2025 09:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.23.86.59
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763114082; cv=none; b=fxqb3cUzE/sTCroyFRd62Ay/6u69u6Z2000K5AzBjVAplQOI8afxB9fqERH/Ii8HwoPbkRJWwoiMtftGreSq2DnLjyr2gpc5aV7CVv3OTPwIClKJVAgLZX/MrsIguZ5s2ONJaj6rXg33aJ7pP1GUOg9tbwa5J0lreBXwLZ5xEDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763114082; c=relaxed/simple;
	bh=nts1wg+fsxUUJOvq7cE0xtyuq0rbpOBJW1Mtv7As1m0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nTGyStApGbNXSPBGsysohT9LMkxd81yc7yjUVSiPkHGxAa+TJXBXwf6maWsiT2kmb279JviVt27ej1oip7WwR/yOiPohtDJ5Cct1cgdKsrZh+mp6Afi3m4n0KTBl/JaJuMPMyai3FecekXZO6uQa9+IyKdLrcrJZGpnF/29Fouc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=holoplot.com; spf=fail smtp.mailfrom=holoplot.com; arc=none smtp.client-ip=46.23.86.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=holoplot.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=holoplot.com
Received: from hq-00595.pfsense.f14 (p4ff24940.dip0.t-ipconnect.de [79.242.73.64])
	by mail.bugwerft.de (Postfix) with ESMTPSA id ED4B2281EBF;
	Fri, 14 Nov 2025 09:46:49 +0000 (UTC)
From: Daniel Mack <daniel.mack@holoplot.com>
To: linux-leds@vger.kernel.org
Cc: pavel@kernel.org,
	lee@kernel.org,
	robh@kernel.org,
	devicetree@vger.kernel.org,
	Daniel Mack <daniel@zonque.org>
Subject: [PATCH v2 2/3] leds: is31f132xx: add support for is31fl3293
Date: Fri, 14 Nov 2025 10:46:39 +0100
Message-ID: <20251114094640.4096054-3-daniel.mack@holoplot.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251114094640.4096054-1-daniel.mack@holoplot.com>
References: <20251114094640.4096054-1-daniel.mack@holoplot.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel Mack <daniel@zonque.org>

This chip supports 3 LED channels with 4096 possible PWM values.

Extend the driver to support this variant:

 * Make brightness steps configurable per device type
 * Handle dual-register brightness updates
 * Allow to specify values to write into the PWM update register
 * Add custom init and shutdown function for 3293 variant
 * Init registers after parsing DT properties

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 drivers/leds/leds-is31fl32xx.c | 140 +++++++++++++++++++++++++++++++--
 1 file changed, 132 insertions(+), 8 deletions(-)

diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index 8793330dd414..26664fad91ae 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -32,10 +32,25 @@
 #define IS31FL3216_CONFIG_SSD_ENABLE  BIT(7)
 #define IS31FL3216_CONFIG_SSD_DISABLE 0
 
+/* Registers for IS31FL3293 */
+#define IS31FL3293_SHUTDOWN_REG 0x01
+#define IS31FL3293_SHUTDOWN_SSD_DISABLE  BIT(0)
+#define IS31FL3293_SHUTDOWN_EN1 BIT(4)
+#define IS31FL3293_SHUTDOWN_EN2 BIT(5)
+#define IS31FL3293_SHUTDOWN_EN3 BIT(6)
+#define IS31FL3293_GCC_REG 0x03
+#define IS31FL3293_GCC_LEVEL_MAX 0x3f
+#define IS31FL3293_CL_REG 0x10
+#define IS31FL3293_COLOR_UPDATE_REG 0x27
+#define IS31FL3293_COLOR_UPDATE_MAGIC 0xc5
+#define IS31FL3293_RESET_REG 0x3c
+#define IS31FL3293_RESET_MAGIC 0xc5
+
 struct is31fl32xx_priv;
 struct is31fl32xx_led_data {
 	struct led_classdev cdev;
 	u8 channel; /* 1-based, max priv->cdef->channels */
+	u32 max_microamp;
 	struct is31fl32xx_priv *priv;
 };
 
@@ -51,12 +66,14 @@ struct is31fl32xx_priv {
  * @channels            : Number of LED channels
  * @shutdown_reg        : address of Shutdown register (optional)
  * @pwm_update_reg      : address of PWM Update register
+ * @pwm_update_value    : value to write to PWM Update register
  * @global_control_reg  : address of Global Control register (optional)
  * @reset_reg           : address of Reset register (optional)
  * @pwm_register_base   : address of first PWM register
  * @pwm_registers_reversed: : true if PWM registers count down instead of up
  * @led_control_register_base : address of first LED control register (optional)
  * @enable_bits_per_led_control_register: number of LEDs enable bits in each
+ * @brightness_steps    : number of brightness steps supported by the chip
  * @reset_func          : pointer to reset function
  * @sw_shutdown_func    : pointer to software shutdown function
  *
@@ -74,12 +91,14 @@ struct is31fl32xx_chipdef {
 	u8	channels;
 	u8	shutdown_reg;
 	u8	pwm_update_reg;
+	u8	pwm_update_value;
 	u8	global_control_reg;
 	u8	reset_reg;
 	u8	pwm_register_base;
 	bool	pwm_registers_reversed;
 	u8	led_control_register_base;
 	u8	enable_bits_per_led_control_register;
+	u16	brightness_steps;
 	int (*reset_func)(struct is31fl32xx_priv *priv);
 	int (*sw_shutdown_func)(struct is31fl32xx_priv *priv, bool enable);
 };
@@ -93,6 +112,7 @@ static const struct is31fl32xx_chipdef is31fl3236_cdef = {
 	.pwm_register_base			= 0x01,
 	.led_control_register_base		= 0x26,
 	.enable_bits_per_led_control_register	= 1,
+	.brightness_steps			= 256,
 };
 
 static const struct is31fl32xx_chipdef is31fl3235_cdef = {
@@ -104,6 +124,7 @@ static const struct is31fl32xx_chipdef is31fl3235_cdef = {
 	.pwm_register_base			= 0x05,
 	.led_control_register_base		= 0x2a,
 	.enable_bits_per_led_control_register	= 1,
+	.brightness_steps			= 256,
 };
 
 static const struct is31fl32xx_chipdef is31fl3218_cdef = {
@@ -115,6 +136,7 @@ static const struct is31fl32xx_chipdef is31fl3218_cdef = {
 	.pwm_register_base			= 0x01,
 	.led_control_register_base		= 0x13,
 	.enable_bits_per_led_control_register	= 6,
+	.brightness_steps			= 256,
 };
 
 static int is31fl3216_reset(struct is31fl32xx_priv *priv);
@@ -132,6 +154,24 @@ static const struct is31fl32xx_chipdef is31fl3216_cdef = {
 	.enable_bits_per_led_control_register	= 8,
 	.reset_func				= is31fl3216_reset,
 	.sw_shutdown_func			= is31fl3216_software_shutdown,
+	.brightness_steps			= 256,
+};
+
+static int is31fl3293_reset(struct is31fl32xx_priv *priv);
+static int is31fl3293_software_shutdown(struct is31fl32xx_priv *priv,
+					bool enable);
+static const struct is31fl32xx_chipdef is31fl3293_cdef = {
+	.channels				= 3,
+	.shutdown_reg				= IS31FL32XX_REG_NONE,
+	.pwm_update_reg				= 0x28,
+	.pwm_update_value			= 0xc5,
+	.global_control_reg			= IS31FL32XX_REG_NONE,
+	.reset_reg				= IS31FL32XX_REG_NONE,
+	.pwm_register_base			= 0x19,
+	.led_control_register_base		= IS31FL32XX_REG_NONE,
+	.brightness_steps			= 4096,
+	.reset_func				= is31fl3293_reset,
+	.sw_shutdown_func			= is31fl3293_software_shutdown,
 };
 
 static int is31fl32xx_write(struct is31fl32xx_priv *priv, u8 reg, u8 val)
@@ -198,6 +238,62 @@ static int is31fl3216_software_shutdown(struct is31fl32xx_priv *priv,
 	return is31fl32xx_write(priv, IS31FL3216_CONFIG_REG, value);
 }
 
+/*
+ * Custom Reset function for IS31FL3293. We need to set the global current limit
+ * and write to the color update register once.
+ */
+static int is31fl3293_reset(struct is31fl32xx_priv *priv)
+{
+	int i, ret;
+
+	ret = is31fl32xx_write(priv, IS31FL3293_RESET_REG,
+			       IS31FL3293_RESET_MAGIC);
+	if (ret)
+		return ret;
+
+	/* Set the global current limit to maximum */
+	ret = is31fl32xx_write(priv, IS31FL3293_GCC_REG,
+			       IS31FL3293_GCC_LEVEL_MAX);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < priv->num_leds; i++) {
+		struct is31fl32xx_led_data *led_data = &priv->leds[i];
+		int current_level_reg = IS31FL3293_CL_REG + led_data->channel - 1;
+		int microamp = max(led_data->max_microamp, 20000);
+		int current_level = (microamp * 0xff) / 20000;
+
+		ret = is31fl32xx_write(priv, current_level_reg, current_level);
+		if (ret)
+			return ret;
+	}
+
+	ret = is31fl32xx_write(priv, IS31FL3293_COLOR_UPDATE_REG,
+			       IS31FL3293_COLOR_UPDATE_MAGIC);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/*
+ * Custom Software-Shutdown function for IS31FL3293 because the SHUTDOWN
+ * register of this device also has bits to enable the channels.
+ */
+static int is31fl3293_software_shutdown(struct is31fl32xx_priv *priv,
+					bool enable)
+{
+	u8 value = 0;
+
+	if (!enable)
+		value =	IS31FL3293_SHUTDOWN_SSD_DISABLE |
+			IS31FL3293_SHUTDOWN_EN1 |
+			IS31FL3293_SHUTDOWN_EN2 |
+			IS31FL3293_SHUTDOWN_EN3;
+
+	return is31fl32xx_write(priv, IS31FL3293_SHUTDOWN_REG, value);
+}
+
 /*
  * NOTE: A mutex is not needed in this function because:
  * - All referenced data is read-only after probe()
@@ -236,13 +332,36 @@ static int is31fl32xx_brightness_set(struct led_classdev *led_cdev,
 	else
 		pwm_register_offset = led_data->channel - 1;
 
-	ret = is31fl32xx_write(led_data->priv,
-			       cdef->pwm_register_base + pwm_register_offset,
-			       brightness);
-	if (ret)
-		return ret;
+	switch (cdef->brightness_steps) {
+	case 256:
+		ret = is31fl32xx_write(led_data->priv,
+				       cdef->pwm_register_base + pwm_register_offset,
+				       brightness);
+		if (ret)
+			return ret;
+
+		break;
+	case 4096:
+		/* IS31FL329x devices use two registers to store 12 bits of brightness */
+		pwm_register_offset *= 2;
 
-	return is31fl32xx_write(led_data->priv, cdef->pwm_update_reg, 0);
+		ret = is31fl32xx_write(led_data->priv,
+				       cdef->pwm_register_base + pwm_register_offset,
+				       brightness & 0xff);
+		if (ret)
+			return ret;
+
+		ret = is31fl32xx_write(led_data->priv,
+				       cdef->pwm_register_base + pwm_register_offset + 1,
+				       (brightness >> 8) & 0xf);
+		if (ret)
+			return ret;
+
+		break;
+	}
+
+	return is31fl32xx_write(led_data->priv, cdef->pwm_update_reg,
+				cdef->pwm_update_value);
 }
 
 static int is31fl32xx_reset_regs(struct is31fl32xx_priv *priv)
@@ -341,6 +460,8 @@ static int is31fl32xx_parse_child_dt(const struct device *dev,
 	}
 	led_data->channel = reg;
 
+	of_property_read_u32(child, "led-max-microamp", &led_data->max_microamp);
+
 	cdev->brightness_set_blocking = is31fl32xx_brightness_set;
 
 	return 0;
@@ -372,6 +493,7 @@ static int is31fl32xx_parse_dt(struct device *dev,
 		const struct is31fl32xx_led_data *other_led_data;
 
 		led_data->priv = priv;
+		led_data->cdev.max_brightness = priv->cdef->brightness_steps - 1;
 
 		ret = is31fl32xx_parse_child_dt(dev, child, led_data);
 		if (ret)
@@ -404,6 +526,7 @@ static int is31fl32xx_parse_dt(struct device *dev,
 }
 
 static const struct of_device_id of_is31fl32xx_match[] = {
+	{ .compatible = "issi,is31fl3293", .data = &is31fl3293_cdef, },
 	{ .compatible = "issi,is31fl3236", .data = &is31fl3236_cdef, },
 	{ .compatible = "issi,is31fl3235", .data = &is31fl3235_cdef, },
 	{ .compatible = "issi,is31fl3218", .data = &is31fl3218_cdef, },
@@ -438,11 +561,11 @@ static int is31fl32xx_probe(struct i2c_client *client)
 	priv->cdef = cdef;
 	i2c_set_clientdata(client, priv);
 
-	ret = is31fl32xx_init_regs(priv);
+	ret = is31fl32xx_parse_dt(dev, priv);
 	if (ret)
 		return ret;
 
-	ret = is31fl32xx_parse_dt(dev, priv);
+	ret = is31fl32xx_init_regs(priv);
 	if (ret)
 		return ret;
 
@@ -465,6 +588,7 @@ static void is31fl32xx_remove(struct i2c_client *client)
  * even though it is not used for DeviceTree based instantiation.
  */
 static const struct i2c_device_id is31fl32xx_id[] = {
+	{ "is31fl3293" },
 	{ "is31fl3236" },
 	{ "is31fl3235" },
 	{ "is31fl3218" },
-- 
2.51.1


