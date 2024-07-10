Return-Path: <linux-leds+bounces-2239-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7BD92D445
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jul 2024 16:34:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 386A01F23E64
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jul 2024 14:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFC1D193455;
	Wed, 10 Jul 2024 14:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZsDYJGXm"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F2138FA0;
	Wed, 10 Jul 2024 14:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720622069; cv=none; b=rr7GOdlzJG6CBHq1a+XyK1E9c3Vgee86XvXtxwKgC44BoPKHaazi3MV/qzhYAijzIZzc3tE0rZOoEaDekkpAHc3lAGXde5MdMEJlmoPqnkFGA7ERQ0QNgUQLKnb/58pAWwqYKHbKwEwQwaku2RAbPtBfzA/cqnij+r38C/HRaz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720622069; c=relaxed/simple;
	bh=VejpL6iBsOGiwiiOFREePNlf3bxoRqbszo5nhTy7wAo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ASfp4vyNhTGMf/qatzm7jIo1IJYXgdWx+6pEC6pgk6yutjDVX5nboxUtEQttvr2fr6BQL4Y0THNbKLDoyeIu0bZ7TeWp+ZzAC5yv0zOFYqkA3SMITISqB6mxbGlbEhMwr8wqHHxhZexCg10RcuTKtknBsUXgKUmMycXISC/BME4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZsDYJGXm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 790F1C4AF48;
	Wed, 10 Jul 2024 14:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720622069;
	bh=VejpL6iBsOGiwiiOFREePNlf3bxoRqbszo5nhTy7wAo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ZsDYJGXmfGAByyUuQdymwbdzTiQgprtXqVper33v/Yjy4M0LLNgNgaW5fqJSwsI6p
	 AR8lcurBWsByvIssa83QiYqt0XB0zVRwkLzJGCl9OFsslEQ0RIGgq+Y4D6Remp5uTE
	 YIh2EEoZdn2hxgXP/A67dAgPaEAdd2XkGRErL2Jt4FCmmPTBLcN0+cdWeevZrT80H/
	 Fq5f1sF5/fDrvImjv3s8e2tTkp2V77N8gQa4j+4FzpfZCsWPCRDXZzc4lUbVpWHf99
	 OrT1Dty822d2Bc+1AnHkMplq+Dbu49vORisiApr/OPS6xMxhxzOh+XOTpEKMktEKe4
	 Zt4tVR4DSBjVg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6862DC3DA41;
	Wed, 10 Jul 2024 14:34:29 +0000 (UTC)
From: Pieterjan Camerlynck via B4 Relay <devnull+pieterjanca.gmail.com@kernel.org>
Date: Wed, 10 Jul 2024 16:32:42 +0200
Subject: [PATCH v2 2/2] leds: leds-pca995x: Add support for NXP PCA9956B
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240710-pca995x-v2-2-8fafb6e4b7d5@gmail.com>
References: <20240710-pca995x-v2-0-8fafb6e4b7d5@gmail.com>
In-Reply-To: <20240710-pca995x-v2-0-8fafb6e4b7d5@gmail.com>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Isai Gaspar <isaiezequiel.gaspar@nxp.com>, Marek Vasut <marex@denx.de>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Pieterjan Camerlynck <pieterjanca@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720622068; l=6241;
 i=pieterjanca@gmail.com; s=20240709; h=from:subject:message-id;
 bh=Z85WZdaxP1sSEe3jl2W64BocdH9j4g6SDJxd/sUHBWU=;
 b=KN4dgO9XhIm59QCOsySH1C/EmDZWLK1TvaYOlyKf9DKVUhKcCEVAzww3vl1U0TOuNODdSZw7G
 AkicQdxywn7BxQHjFj8edK2AF7WULOUGqQs9oRl5I3pux6j2K2v5OpR
X-Developer-Key: i=pieterjanca@gmail.com; a=ed25519;
 pk=gSAHfvqQjVhNa1MhUClqbt7d3S+fviKz6FdQVaWFRyM=
X-Endpoint-Received: by B4 Relay for pieterjanca@gmail.com/20240709 with
 auth_id=182
X-Original-From: Pieterjan Camerlynck <pieterjanca@gmail.com>
Reply-To: pieterjanca@gmail.com

From: Pieterjan Camerlynck <pieterjanca@gmail.com>

Add support for PCA9956B chip, which belongs to the same family.

This chip features 24 instead of 16 outputs, so add a chipdef struct to
deal with the different register layouts.

Signed-off-by: Pieterjan Camerlynck <pieterjanca@gmail.com>
---
 drivers/leds/leds-pca995x.c | 82 +++++++++++++++++++++++++--------------------
 1 file changed, 46 insertions(+), 36 deletions(-)

diff --git a/drivers/leds/leds-pca995x.c b/drivers/leds/leds-pca995x.c
index 78215dff1499..d783d643d7e9 100644
--- a/drivers/leds/leds-pca995x.c
+++ b/drivers/leds/leds-pca995x.c
@@ -19,10 +19,6 @@
 #define PCA995X_MODE1			0x00
 #define PCA995X_MODE2			0x01
 #define PCA995X_LEDOUT0			0x02
-#define PCA9955B_PWM0			0x08
-#define PCA9952_PWM0			0x0A
-#define PCA9952_IREFALL			0x43
-#define PCA9955B_IREFALL		0x45
 
 /* Auto-increment disabled. Normal mode */
 #define PCA995X_MODE1_CFG		0x00
@@ -34,17 +30,37 @@
 #define PCA995X_LDRX_MASK		0x3
 #define PCA995X_LDRX_BITS		2
 
-#define PCA995X_MAX_OUTPUTS		16
 #define PCA995X_OUTPUTS_PER_REG		4
 
 #define PCA995X_IREFALL_FULL_CFG	0xFF
 #define PCA995X_IREFALL_HALF_CFG	(PCA995X_IREFALL_FULL_CFG / 2)
 
-#define PCA995X_TYPE_NON_B		0
-#define PCA995X_TYPE_B			1
-
 #define ldev_to_led(c)	container_of(c, struct pca995x_led, ldev)
 
+struct pca995x_chipdef {
+	unsigned int num_leds;
+	u8 pwm_base;
+	u8 irefall;
+};
+
+static const struct pca995x_chipdef pca9952_chipdef = {
+	.num_leds	= 16,
+	.pwm_base	= 0x0a,
+	.irefall	= 0x43,
+};
+
+static const struct pca995x_chipdef pca9955b_chipdef = {
+	.num_leds	= 16,
+	.pwm_base	= 0x08,
+	.irefall	= 0x45,
+};
+
+static const struct pca995x_chipdef pca9956b_chipdef = {
+	.num_leds	= 24,
+	.pwm_base	= 0x0a,
+	.irefall	= 0x40,
+};
+
 struct pca995x_led {
 	unsigned int led_no;
 	struct led_classdev ldev;
@@ -52,9 +68,9 @@ struct pca995x_led {
 };
 
 struct pca995x_chip {
+	const struct pca995x_chipdef *chipdef;
 	struct regmap *regmap;
-	struct pca995x_led leds[PCA995X_MAX_OUTPUTS];
-	int btype;
+	struct pca995x_led leds[];
 };
 
 static int pca995x_brightness_set(struct led_classdev *led_cdev,
@@ -62,10 +78,11 @@ static int pca995x_brightness_set(struct led_classdev *led_cdev,
 {
 	struct pca995x_led *led = ldev_to_led(led_cdev);
 	struct pca995x_chip *chip = led->chip;
+	const struct pca995x_chipdef *chipdef = chip->chipdef;
 	u8 ledout_addr, pwmout_addr;
 	int shift, ret;
 
-	pwmout_addr = (chip->btype ? PCA9955B_PWM0 : PCA9952_PWM0) + led->led_no;
+	pwmout_addr = (chipdef->pwm_base) + led->led_no;
 	ledout_addr = PCA995X_LEDOUT0 + (led->led_no / PCA995X_OUTPUTS_PER_REG);
 	shift = PCA995X_LDRX_BITS * (led->led_no % PCA995X_OUTPUTS_PER_REG);
 
@@ -101,24 +118,24 @@ static const struct regmap_config pca995x_regmap = {
 
 static int pca995x_probe(struct i2c_client *client)
 {
-	struct fwnode_handle *led_fwnodes[PCA995X_MAX_OUTPUTS] = { 0 };
 	struct fwnode_handle *np, *child;
 	struct device *dev = &client->dev;
+	const struct pca995x_chipdef *chipdef;
 	struct pca995x_chip *chip;
 	struct pca995x_led *led;
-	int i, btype, reg, ret;
+	int reg, ret;
 
-	btype = (unsigned long)device_get_match_data(&client->dev);
+	chipdef = device_get_match_data(&client->dev);
 
 	np = dev_fwnode(dev);
 	if (!np)
 		return -ENODEV;
 
-	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
+	chip = devm_kzalloc(dev, struct_size(chip, leds, chipdef->num_leds), GFP_KERNEL);
 	if (!chip)
 		return -ENOMEM;
 
-	chip->btype = btype;
+	chip->chipdef = chipdef;
 	chip->regmap = devm_regmap_init_i2c(client, &pca995x_regmap);
 	if (IS_ERR(chip->regmap))
 		return PTR_ERR(chip->regmap);
@@ -126,41 +143,34 @@ static int pca995x_probe(struct i2c_client *client)
 	i2c_set_clientdata(client, chip);
 
 	fwnode_for_each_available_child_node(np, child) {
+		struct led_init_data init_data = {};
+
 		ret = fwnode_property_read_u32(child, "reg", &reg);
 		if (ret) {
 			fwnode_handle_put(child);
 			return ret;
 		}
 
-		if (reg < 0 || reg >= PCA995X_MAX_OUTPUTS || led_fwnodes[reg]) {
+		if (reg < 0 || reg >= chipdef->num_leds) {
 			fwnode_handle_put(child);
 			return -EINVAL;
 		}
 
 		led = &chip->leds[reg];
-		led_fwnodes[reg] = child;
 		led->chip = chip;
 		led->led_no = reg;
 		led->ldev.brightness_set_blocking = pca995x_brightness_set;
 		led->ldev.max_brightness = 255;
-	}
-
-	for (i = 0; i < PCA995X_MAX_OUTPUTS; i++) {
-		struct led_init_data init_data = {};
-
-		if (!led_fwnodes[i])
-			continue;
-
-		init_data.fwnode = led_fwnodes[i];
+		init_data.fwnode = child;
 
 		ret = devm_led_classdev_register_ext(dev,
-						     &chip->leds[i].ldev,
+						     &led->ldev,
 						     &init_data);
 		if (ret < 0) {
 			fwnode_handle_put(child);
 			return dev_err_probe(dev, ret,
 					     "Could not register LED %s\n",
-					     chip->leds[i].ldev.name);
+					     led->ldev.name);
 		}
 	}
 
@@ -170,21 +180,21 @@ static int pca995x_probe(struct i2c_client *client)
 		return ret;
 
 	/* IREF Output current value for all LEDn outputs */
-	return regmap_write(chip->regmap,
-			    btype ? PCA9955B_IREFALL : PCA9952_IREFALL,
-			    PCA995X_IREFALL_HALF_CFG);
+	return regmap_write(chip->regmap, chipdef->irefall, PCA995X_IREFALL_HALF_CFG);
 }
 
 static const struct i2c_device_id pca995x_id[] = {
-	{ "pca9952", .driver_data = (kernel_ulong_t)PCA995X_TYPE_NON_B },
-	{ "pca9955b", .driver_data = (kernel_ulong_t)PCA995X_TYPE_B },
+	{ "pca9952", .driver_data = (kernel_ulong_t)&pca9952_chipdef },
+	{ "pca9955b", .driver_data = (kernel_ulong_t)&pca9955b_chipdef },
+	{ "pca9956b", .driver_data = (kernel_ulong_t)&pca9956b_chipdef },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, pca995x_id);
 
 static const struct of_device_id pca995x_of_match[] = {
-	{ .compatible = "nxp,pca9952",  .data = (void *)PCA995X_TYPE_NON_B },
-	{ .compatible = "nxp,pca9955b", .data = (void *)PCA995X_TYPE_B },
+	{ .compatible = "nxp,pca9952", .data = &pca9952_chipdef },
+	{ .compatible = "nxp,pca9955b", . data = &pca9955b_chipdef },
+	{ .compatible = "nxp,pca9956b", .data = &pca9956b_chipdef },
 	{},
 };
 MODULE_DEVICE_TABLE(of, pca995x_of_match);

-- 
2.45.2



