Return-Path: <linux-leds+bounces-6455-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCA1CD09EF
	for <lists+linux-leds@lfdr.de>; Fri, 19 Dec 2025 16:48:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7A427307154D
	for <lists+linux-leds@lfdr.de>; Fri, 19 Dec 2025 15:47:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF11C33D4ED;
	Fri, 19 Dec 2025 15:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zonque.org header.i=@zonque.org header.b="Abmdoi+o"
X-Original-To: linux-leds@vger.kernel.org
Received: from mailkram.bugwerft.de (mailkram.bugwerft.de [95.216.200.101])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C898433BBBF
	for <linux-leds@vger.kernel.org>; Fri, 19 Dec 2025 15:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.216.200.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766159149; cv=none; b=X6pEuyNSLLb+L9Vb9MzA8W2oLRw/2cbR53Efq9Nh9cPJNkuSaN5La0Z2eSGp7xdoS5c24uFxVQuTT5pAMmnrjgV3FUn0Y4L8TfObb5lL7iEIJFdoNQNM8xPLatcPyZ9Jky0VSu+wPLHjLDi8istCZUXs2IASLY0kXDYq9JYiGB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766159149; c=relaxed/simple;
	bh=5Dp02Nt8uuF0DUcfAC+zeRP3+h56nVIHh1+8VNq/t8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WZqVJaCeBx4qVxww1ytRUqee80xgouwhwh1Q0jcW6v4k6KL5kxgLyoO8KGcl5k07rccgoakWLE+TQ9tJckkoRB5fWA+EVN0vM87MBr5ioptLX+muChXzAhf4GSdUZhK+nXkOx5hp//m6qE7ivETUqncoJYbxxZVaAjPVV6X08CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=zonque.org; spf=pass smtp.mailfrom=zonque.org; dkim=pass (1024-bit key) header.d=zonque.org header.i=@zonque.org header.b=Abmdoi+o; arc=none smtp.client-ip=95.216.200.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=zonque.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zonque.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zonque.org; s=mail;
	t=1766159139; bh=5Dp02Nt8uuF0DUcfAC+zeRP3+h56nVIHh1+8VNq/t8Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Abmdoi+o/3HTdJlMoQzvztuZiAVXW6GZczjQBN8wGBELsDOQINFpG9kF/YHV7VE3x
	 ulJQhmqKQ/wNkRipIcF4Olz9er+PXMF4v0w3VJwjoZhokdioTRJDfuWpnP7Ekw/P+s
	 yYYN54L75FjyO6rlV5x5wfDwgMQkKHqg4NBkXnS0=
Received: from hq-00595.pfsense.f14 (p4ff24940.dip0.t-ipconnect.de [79.242.73.64])
	by mailkram.bugwerft.de (Postfix) with ESMTPSA id 2C050416D2;
	Fri, 19 Dec 2025 15:45:39 +0000 (UTC)
From: Daniel Mack <daniel@zonque.org>
To: linux-leds@vger.kernel.org
Cc: lee@kernel.org,
	Daniel Mack <daniel@zonque.org>
Subject: [PATCH v4 3/3] leds: is31f132xx: add support for is31fl3293
Date: Fri, 19 Dec 2025 16:45:21 +0100
Message-ID: <20251219154521.643312-4-daniel@zonque.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251219154521.643312-1-daniel@zonque.org>
References: <20251219154521.643312-1-daniel@zonque.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This chip supports 3 LED channels with 4096 possible PWM values.

Extend the driver to support this variant:

 * Make brightness steps configurable per device type
 * Handle dual-register brightness updates
 * Allow to specify values to write into the PWM update register
 * Add custom init and shutdown function for 3293 variant
 * Init registers after parsing DT properties

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
v1 -> v2: address styling issues
v3 -> v4: replace another constant with a #define

 drivers/leds/leds-is31fl32xx.c | 138 +++++++++++++++++++++++++++++++--
 1 file changed, 130 insertions(+), 8 deletions(-)

diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index bd5323f2316e..fe07acbb103a 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -34,10 +34,26 @@
 
 #define IS31FL32XX_PWM_FREQUENCY_22KHZ  0x01
 
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
+#define IS31FL3293_MAX_MICROAMP 20000
+
 struct is31fl32xx_priv;
 struct is31fl32xx_led_data {
 	struct led_classdev cdev;
 	u8 channel; /* 1-based, max priv->cdef->channels */
+	u32 max_microamp;
 	struct is31fl32xx_priv *priv;
 };
 
@@ -53,6 +69,7 @@ struct is31fl32xx_priv {
  * @channels            : Number of LED channels
  * @shutdown_reg        : address of Shutdown register (optional)
  * @pwm_update_reg      : address of PWM Update register
+ * @pwm_update_value    : value to write to PWM Update register
  * @global_control_reg  : address of Global Control register (optional)
  * @reset_reg           : address of Reset register (optional)
  * @output_frequency_setting_reg: address of output frequency register (optional)
@@ -60,6 +77,7 @@ struct is31fl32xx_priv {
  * @pwm_registers_reversed: : true if PWM registers count down instead of up
  * @led_control_register_base : address of first LED control register (optional)
  * @enable_bits_per_led_control_register: number of LEDs enable bits in each
+ * @brightness_steps    : number of brightness steps supported by the chip
  * @reset_func          : pointer to reset function
  * @sw_shutdown_func    : pointer to software shutdown function
  *
@@ -77,6 +95,7 @@ struct is31fl32xx_chipdef {
 	u8	channels;
 	u8	shutdown_reg;
 	u8	pwm_update_reg;
+	u8	pwm_update_value;
 	u8	global_control_reg;
 	u8	reset_reg;
 	u8	output_frequency_setting_reg;
@@ -84,6 +103,7 @@ struct is31fl32xx_chipdef {
 	bool	pwm_registers_reversed;
 	u8	led_control_register_base;
 	u8	enable_bits_per_led_control_register;
+	u16	brightness_steps;
 	int (*reset_func)(struct is31fl32xx_priv *priv);
 	int (*sw_shutdown_func)(struct is31fl32xx_priv *priv, bool enable);
 };
@@ -152,6 +172,62 @@ static int is31fl3216_software_shutdown(struct is31fl32xx_priv *priv,
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
+		int microamp = max(led_data->max_microamp, IS31FL3293_MAX_MICROAMP);
+		int current_level = (microamp * 0xff) / IS31FL3293_MAX_MICROAMP;
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
@@ -190,13 +266,36 @@ static int is31fl32xx_brightness_set(struct led_classdev *led_cdev,
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
@@ -295,6 +394,8 @@ static int is31fl32xx_parse_child_dt(const struct device *dev,
 	}
 	led_data->channel = reg;
 
+	of_property_read_u32(child, "led-max-microamp", &led_data->max_microamp);
+
 	cdev->brightness_set_blocking = is31fl32xx_brightness_set;
 
 	return 0;
@@ -339,6 +440,7 @@ static int is31fl32xx_parse_dt(struct device *dev,
 		const struct is31fl32xx_led_data *other_led_data;
 
 		led_data->priv = priv;
+		led_data->cdev.max_brightness = priv->cdef->brightness_steps - 1;
 
 		ret = is31fl32xx_parse_child_dt(dev, child, led_data);
 		if (ret)
@@ -391,6 +493,7 @@ static const struct is31fl32xx_chipdef is31fl3236a_cdef = {
 	.pwm_register_base			= 0x01,
 	.led_control_register_base		= 0x26,
 	.enable_bits_per_led_control_register	= 1,
+	.brightness_steps			= 256,
 };
 
 static const struct is31fl32xx_chipdef is31fl3235_cdef = {
@@ -403,6 +506,7 @@ static const struct is31fl32xx_chipdef is31fl3235_cdef = {
 	.pwm_register_base			= 0x05,
 	.led_control_register_base		= 0x2a,
 	.enable_bits_per_led_control_register	= 1,
+	.brightness_steps			= 256,
 };
 
 static const struct is31fl32xx_chipdef is31fl3218_cdef = {
@@ -415,6 +519,7 @@ static const struct is31fl32xx_chipdef is31fl3218_cdef = {
 	.pwm_register_base			= 0x01,
 	.led_control_register_base		= 0x13,
 	.enable_bits_per_led_control_register	= 6,
+	.brightness_steps			= 256,
 };
 
 static const struct is31fl32xx_chipdef is31fl3216_cdef = {
@@ -430,9 +535,25 @@ static const struct is31fl32xx_chipdef is31fl3216_cdef = {
 	.enable_bits_per_led_control_register	= 8,
 	.reset_func				= is31fl3216_reset,
 	.sw_shutdown_func			= is31fl3216_software_shutdown,
+	.brightness_steps			= 256,
+};
+
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
 
 static const struct of_device_id of_is31fl32xx_match[] = {
+	{ .compatible = "issi,is31fl3293",  .data = &is31fl3293_cdef, },
 	{ .compatible = "issi,is31fl3236",  .data = &is31fl3236_cdef, },
 	{ .compatible = "issi,is31fl3236a", .data = &is31fl3236a_cdef, },
 	{ .compatible = "issi,is31fl3235",  .data = &is31fl3235_cdef, },
@@ -468,11 +589,11 @@ static int is31fl32xx_probe(struct i2c_client *client)
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
 
@@ -495,6 +616,7 @@ static void is31fl32xx_remove(struct i2c_client *client)
  * even though it is not used for DeviceTree based instantiation.
  */
 static const struct i2c_device_id is31fl32xx_id[] = {
+	{ "is31fl3293" },
 	{ "is31fl3236" },
 	{ "is31fl3236a" },
 	{ "is31fl3235" },
-- 
2.52.0


