Return-Path: <linux-leds+bounces-3376-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F049C3B9B
	for <lists+linux-leds@lfdr.de>; Mon, 11 Nov 2024 11:04:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 08697B20A83
	for <lists+linux-leds@lfdr.de>; Mon, 11 Nov 2024 10:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90E57170A2C;
	Mon, 11 Nov 2024 10:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ajb3KZA5"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6605515C15A;
	Mon, 11 Nov 2024 10:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731319457; cv=none; b=C8snQg0Aczmi9b0+2QiHlP7NoKdFHpWQyYbvOLZ874FhljVWnomNT1676YRrn4SAuAf7nV72Zuft4Oqzo94zctItsaen/CyXwlQLKSBzBOHY42vGjzItXmV/tTJZJ0k4rACFJ9ERd/orxV5zE7DvkmwzSzV3o9x9dQWWe9JfY6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731319457; c=relaxed/simple;
	bh=+BaD6yzWcHU4DwqJoicMokFjifwQXkQ4xTT2A5vPyxs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AQF5gUNp0sRvK1amHejuSHLT3zQ3s3o7NXxXQSFnVWFpzQvodYKkApDqsRiMsz/UqVbscIvgMdI+Obb7ZyvaTSWE1x6pWB2EjOG/PJdH9gHYXXRYKlhIk7zIs6BVnAbai81cyCDVuUotQP6IkKShj1p3BkyaAMojoIPlfovi7S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ajb3KZA5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7E55C4CED0;
	Mon, 11 Nov 2024 10:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731319457;
	bh=+BaD6yzWcHU4DwqJoicMokFjifwQXkQ4xTT2A5vPyxs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ajb3KZA5R7Q5qdZhcItvxFApMWQWwx2xF3PGtAev+l1KEiWUb1cyRp/SygIHTFQ9S
	 LRhhpS9sBH5NTgv9/ZGnUYdgc5KpjGh/ILuHrc4uvLeHR7yOAHudqbFV5jmyhC466U
	 T25RaqrdQ5s7iddVHfiEQCpOa3MwEeRAgvhbG4aapvaJOjztLlSmu2k20sXn1uOb9q
	 42AdcjYe7CQqNHzWAMsyn3Bu63K/T39wUn54wlSOhybKxPfex/kvZGiJq2mPjTnSR7
	 2Wz/sJJAPBaSlkPTKZxkrhYXzpcJoKA0BDFO7DRJ6ReIL1ZLoPjV5uf22aPkwvw8lK
	 iE3tt3bX3CMjg==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH leds v7 04/11] leds: turris-omnia: Use global header for MCU command definitions
Date: Mon, 11 Nov 2024 11:03:48 +0100
Message-ID: <20241111100355.6978-5-kabel@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241111100355.6978-1-kabel@kernel.org>
References: <20241111100355.6978-1-kabel@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The global turris-omnia-mcu-interface.h header file contains the
definitions for MCU commands. Drop the driver-internal definitions and
use the global ones.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/leds/leds-turris-omnia.c | 71 +++++++++++---------------------
 1 file changed, 23 insertions(+), 48 deletions(-)

diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
index 00cd3bb86703..50fef4389c93 100644
--- a/drivers/leds/leds-turris-omnia.c
+++ b/drivers/leds/leds-turris-omnia.c
@@ -16,30 +16,8 @@
 #define OMNIA_BOARD_LEDS	12
 #define OMNIA_LED_NUM_CHANNELS	3
 
-/* MCU controller commands at I2C address 0x2a */
-#define OMNIA_MCU_I2C_ADDR		0x2a
-
-#define CMD_GET_STATUS_WORD		0x01
-#define STS_FEATURES_SUPPORTED		BIT(2)
-
-#define CMD_GET_FEATURES		0x10
-#define FEAT_LED_GAMMA_CORRECTION	BIT(5)
-
-/* LED controller commands at I2C address 0x2b */
-#define CMD_LED_MODE			0x03
-#define CMD_LED_MODE_LED(l)		((l) & 0x0f)
-#define CMD_LED_MODE_USER		0x10
-
-#define CMD_LED_STATE			0x04
-#define CMD_LED_STATE_LED(l)		((l) & 0x0f)
-#define CMD_LED_STATE_ON		0x10
-
-#define CMD_LED_COLOR			0x05
-#define CMD_LED_SET_BRIGHTNESS		0x07
-#define CMD_LED_GET_BRIGHTNESS		0x08
-
-#define CMD_SET_GAMMA_CORRECTION	0x30
-#define CMD_GET_GAMMA_CORRECTION	0x31
+/* MCU controller I2C address 0x2a, needed for detecting MCU features */
+#define OMNIA_MCU_I2C_ADDR	0x2a
 
 struct omnia_led {
 	struct led_classdev_mc mc_cdev;
@@ -60,7 +38,7 @@ struct omnia_leds {
 
 static int omnia_cmd_set_color(const struct i2c_client *client, u8 led, u8 r, u8 g, u8 b)
 {
-	u8 buf[5] = { CMD_LED_COLOR, led, r, g, b };
+	u8 buf[5] = { OMNIA_CMD_LED_COLOR, led, r, g, b };
 
 	return omnia_cmd_write(client, buf, sizeof(buf));
 }
@@ -127,12 +105,12 @@ static int omnia_led_brightness_set_blocking(struct led_classdev *cdev,
 	 * is not being blinked by HW.
 	 */
 	if (!err && !led->hwtrig && !brightness != !led->on) {
-		u8 state = CMD_LED_STATE_LED(led->reg);
+		u8 state = OMNIA_CMD_LED_STATE_LED(led->reg);
 
 		if (brightness)
-			state |= CMD_LED_STATE_ON;
+			state |= OMNIA_CMD_LED_STATE_ON;
 
-		err = omnia_cmd_write_u8(leds->client, CMD_LED_STATE, state);
+		err = omnia_cmd_write_u8(leds->client, OMNIA_CMD_LED_STATE, state);
 		if (!err)
 			led->on = !!brightness;
 	}
@@ -167,8 +145,8 @@ static int omnia_hwtrig_activate(struct led_classdev *cdev)
 
 	if (!err) {
 		/* Put the LED into MCU controlled mode */
-		err = omnia_cmd_write_u8(leds->client, CMD_LED_MODE,
-					 CMD_LED_MODE_LED(led->reg));
+		err = omnia_cmd_write_u8(leds->client, OMNIA_CMD_LED_MODE,
+					 OMNIA_CMD_LED_MODE_LED(led->reg));
 		if (!err)
 			led->hwtrig = true;
 	}
@@ -189,9 +167,8 @@ static void omnia_hwtrig_deactivate(struct led_classdev *cdev)
 	led->hwtrig = false;
 
 	/* Put the LED into software mode */
-	err = omnia_cmd_write_u8(leds->client, CMD_LED_MODE,
-				 CMD_LED_MODE_LED(led->reg) |
-				 CMD_LED_MODE_USER);
+	err = omnia_cmd_write_u8(leds->client, OMNIA_CMD_LED_MODE,
+				 OMNIA_CMD_LED_MODE_LED(led->reg) | OMNIA_CMD_LED_MODE_USER);
 
 	mutex_unlock(&leds->lock);
 
@@ -258,9 +235,8 @@ static int omnia_led_register(struct i2c_client *client, struct omnia_led *led,
 	cdev->default_trigger = omnia_hw_trigger.name;
 
 	/* put the LED into software mode */
-	ret = omnia_cmd_write_u8(client, CMD_LED_MODE,
-				 CMD_LED_MODE_LED(led->reg) |
-				 CMD_LED_MODE_USER);
+	ret = omnia_cmd_write_u8(client, OMNIA_CMD_LED_MODE, OMNIA_CMD_LED_MODE_LED(led->reg) |
+							     OMNIA_CMD_LED_MODE_USER);
 	if (ret) {
 		dev_err(dev, "Cannot set LED %pOF to software mode: %i\n", np,
 			ret);
@@ -268,8 +244,7 @@ static int omnia_led_register(struct i2c_client *client, struct omnia_led *led,
 	}
 
 	/* disable the LED */
-	ret = omnia_cmd_write_u8(client, CMD_LED_STATE,
-				 CMD_LED_STATE_LED(led->reg));
+	ret = omnia_cmd_write_u8(client, OMNIA_CMD_LED_STATE, OMNIA_CMD_LED_STATE_LED(led->reg));
 	if (ret) {
 		dev_err(dev, "Cannot set LED %pOF brightness: %i\n", np, ret);
 		return ret;
@@ -311,7 +286,7 @@ static ssize_t brightness_show(struct device *dev, struct device_attribute *a,
 	u8 reply;
 	int err;
 
-	err = omnia_cmd_read_u8(client, CMD_LED_GET_BRIGHTNESS, &reply);
+	err = omnia_cmd_read_u8(client, OMNIA_CMD_GET_BRIGHTNESS, &reply);
 	if (err < 0)
 		return err;
 
@@ -331,7 +306,7 @@ static ssize_t brightness_store(struct device *dev, struct device_attribute *a,
 	if (brightness > 100)
 		return -EINVAL;
 
-	err = omnia_cmd_write_u8(client, CMD_LED_SET_BRIGHTNESS, brightness);
+	err = omnia_cmd_write_u8(client, OMNIA_CMD_SET_BRIGHTNESS, brightness);
 
 	return err ?: count;
 }
@@ -346,7 +321,7 @@ static ssize_t gamma_correction_show(struct device *dev,
 	int err;
 
 	if (leds->has_gamma_correction) {
-		err = omnia_cmd_read_u8(client, CMD_GET_GAMMA_CORRECTION, &reply);
+		err = omnia_cmd_read_u8(client, OMNIA_CMD_GET_GAMMA_CORRECTION, &reply);
 		if (err < 0)
 			return err;
 	}
@@ -369,7 +344,7 @@ static ssize_t gamma_correction_store(struct device *dev,
 	if (kstrtobool(buf, &val) < 0)
 		return -EINVAL;
 
-	err = omnia_cmd_write_u8(client, CMD_SET_GAMMA_CORRECTION, val);
+	err = omnia_cmd_write_u8(client, OMNIA_CMD_SET_GAMMA_CORRECTION, val);
 
 	return err ?: count;
 }
@@ -387,15 +362,15 @@ static int omnia_mcu_get_features(const struct i2c_client *mcu_client)
 	u16 reply;
 	int err;
 
-	err = omnia_cmd_read_u16(mcu_client, CMD_GET_STATUS_WORD, &reply);
+	err = omnia_cmd_read_u16(mcu_client, OMNIA_CMD_GET_STATUS_WORD, &reply);
 	if (err)
 		return err;
 
-	/* Check whether MCU firmware supports the CMD_GET_FEAUTRES command */
-	if (!(reply & STS_FEATURES_SUPPORTED))
+	/* Check whether MCU firmware supports the OMNIA_CMD_GET_FEAUTRES command */
+	if (!(reply & OMNIA_STS_FEATURES_SUPPORTED))
 		return 0;
 
-	err = omnia_cmd_read_u16(mcu_client, CMD_GET_FEATURES, &reply);
+	err = omnia_cmd_read_u16(mcu_client, OMNIA_CMD_GET_FEATURES, &reply);
 	if (err)
 		return err;
 
@@ -460,7 +435,7 @@ static int omnia_leds_probe(struct i2c_client *client)
 		return ret;
 	}
 
-	leds->has_gamma_correction = ret & FEAT_LED_GAMMA_CORRECTION;
+	leds->has_gamma_correction = ret & OMNIA_FEAT_LED_GAMMA_CORRECTION;
 	if (!leds->has_gamma_correction) {
 		dev_info(dev,
 			 "Your board's MCU firmware does not support the LED gamma correction feature.\n");
@@ -491,7 +466,7 @@ static int omnia_leds_probe(struct i2c_client *client)
 static void omnia_leds_remove(struct i2c_client *client)
 {
 	/* put all LEDs into default (HW triggered) mode */
-	omnia_cmd_write_u8(client, CMD_LED_MODE, CMD_LED_MODE_LED(OMNIA_BOARD_LEDS));
+	omnia_cmd_write_u8(client, OMNIA_CMD_LED_MODE, OMNIA_CMD_LED_MODE_LED(OMNIA_BOARD_LEDS));
 
 	/* set all LEDs color to [255, 255, 255] */
 	omnia_cmd_set_color(client, OMNIA_BOARD_LEDS, 255, 255, 255);
-- 
2.45.2


