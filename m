Return-Path: <linux-leds+bounces-2230-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7750692CAD7
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jul 2024 08:16:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 022DC1F242D9
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jul 2024 06:16:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD5366F31C;
	Wed, 10 Jul 2024 06:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="drMKKM1p"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A146214D;
	Wed, 10 Jul 2024 06:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720592198; cv=none; b=EKq5N0Xebp4LoTTYpTtDEVa9n7WcSHKO/h+sgPGG5sM11I2OQbzLESjmY4E8i4YwzT1lMV98R+c3e7wm7WVBaOBczJHmq798geHYqHKWvGdQfnYS2zJ5+wH1hm/89fKkJ/EBv+pKZc4np9Ml1jAibMaxjf/pxNXIBuI58cXvVw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720592198; c=relaxed/simple;
	bh=w1HAGk/mz2aE96EttCrBnH9QPrQ60Q/GLsd6fME4K9s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LAVVJ4Ddu5uE/iaI32ih2B9NUWawh4aeYdkfXioYDBP6TNE3MofEWSFKamtU0M6jiOAHQgMwUn0kryUIkOGx/kyvfoZN/Y22M1o6klCmi6JqnsIqu4HIUBrwrrLg/RDRFQO2h4SwhQZOAlkG0IVRTJUxy3D2+Fmu0zo/r0iBzzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=drMKKM1p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DB92AC4AF0F;
	Wed, 10 Jul 2024 06:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720592197;
	bh=w1HAGk/mz2aE96EttCrBnH9QPrQ60Q/GLsd6fME4K9s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=drMKKM1pZrtxeWYAxmddwV9LU2AXPkJFv3E5nT7dpHP7x4G8AxFXI5WYZybJxzQeI
	 hST+jKzxkIBhzq3vntJ6DDPocftdLi98ghhHNlO0zx0ddxxZsak+hqqEal4bBtegTG
	 Ml0+ULZzvCWvfOEA3sQUi+LOajxLm/QNNjxr6pAX/ufKJ+djHkoOZ4DUiGyqy19soE
	 /fIjAgr07qtXkrulgbzYTQpvdZrxXR/2sED72q1b7BNZK7Ay8stzqoTsQt45XURaQK
	 27J8KduyMdyY7QlJjlvznwnG9sN57+1L6vXK6pq+3mUvVwa9Ra56aJ7isR6PHyCslp
	 9ImNnOmhqlEQg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDD41C38150;
	Wed, 10 Jul 2024 06:16:37 +0000 (UTC)
From: Pieterjan Camerlynck via B4 Relay <devnull+pieterjanca.gmail.com@kernel.org>
Date: Wed, 10 Jul 2024 08:15:45 +0200
Subject: [PATCH 2/2] leds: leds-pca995x: Add support for NXP PCA9956B
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240710-pca995x-v1-2-545015603000@gmail.com>
References: <20240710-pca995x-v1-0-545015603000@gmail.com>
In-Reply-To: <20240710-pca995x-v1-0-545015603000@gmail.com>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Isai Gaspar <isaiezequiel.gaspar@nxp.com>, Marek Vasut <marex@denx.de>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Pieterjan Camerlynck <pieterjanca@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720592196; l=6318;
 i=pieterjanca@gmail.com; s=20240709; h=from:subject:message-id;
 bh=mq1PsTTh485sVEEY1ZBDdJqiSjiPqk3EQrYCQXfMA50=;
 b=SbQHhVwjSFK9g1cGv36Rm5bUDYoJubQXqDyj3b/2CjQJnXHZhloJhGK6WSBJ31uvPpkFrSkod
 Zbt3mKR/xhlBcznznmCbm4T/iUOpDXZ24/HSw+STNKOT3S8xPWWMS7f
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
 drivers/leds/leds-pca995x.c | 88 ++++++++++++++++++++++++++-------------------
 1 file changed, 52 insertions(+), 36 deletions(-)

diff --git a/drivers/leds/leds-pca995x.c b/drivers/leds/leds-pca995x.c
index 78215dff1499..4cd2828a3f2d 100644
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
@@ -34,17 +30,43 @@
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
 
+enum pca995x_type {
+	pca9952,
+	pca9955b,
+	pca9956b,
+};
+
+struct pca995x_chipdef {
+	unsigned int num_leds;
+	u8 pwm_base;
+	u8 irefall;
+};
+
+static const struct pca995x_chipdef pca995x_chipdefs[] = {
+	[pca9952] = {
+		.num_leds	= 16,
+		.pwm_base	= 0x0a,
+		.irefall	= 0x43,
+	},
+	[pca9955b] = {
+		.num_leds	= 16,
+		.pwm_base	= 0x08,
+		.irefall	= 0x45,
+	},
+	[pca9956b] = {
+		.num_leds	= 24,
+		.pwm_base	= 0x0a,
+		.irefall	= 0x40,
+	},
+};
+
 struct pca995x_led {
 	unsigned int led_no;
 	struct led_classdev ldev;
@@ -52,9 +74,9 @@ struct pca995x_led {
 };
 
 struct pca995x_chip {
+	const struct pca995x_chipdef *chipdef;
 	struct regmap *regmap;
-	struct pca995x_led leds[PCA995X_MAX_OUTPUTS];
-	int btype;
+	struct pca995x_led leds[];
 };
 
 static int pca995x_brightness_set(struct led_classdev *led_cdev,
@@ -62,10 +84,11 @@ static int pca995x_brightness_set(struct led_classdev *led_cdev,
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
 
@@ -101,24 +124,24 @@ static const struct regmap_config pca995x_regmap = {
 
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
@@ -126,41 +149,34 @@ static int pca995x_probe(struct i2c_client *client)
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
 
@@ -170,21 +186,21 @@ static int pca995x_probe(struct i2c_client *client)
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
+	{ "pca9952", .driver_data = (kernel_ulong_t)&pca995x_chipdefs[pca9952] },
+	{ "pca9955b", .driver_data = (kernel_ulong_t)&pca995x_chipdefs[pca9955b] },
+	{ "pca9956b", .driver_data = (kernel_ulong_t)&pca995x_chipdefs[pca9956b] },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, pca995x_id);
 
 static const struct of_device_id pca995x_of_match[] = {
-	{ .compatible = "nxp,pca9952",  .data = (void *)PCA995X_TYPE_NON_B },
-	{ .compatible = "nxp,pca9955b", .data = (void *)PCA995X_TYPE_B },
+	{ .compatible = "nxp,pca9952", .data = &pca995x_chipdefs[pca9952] },
+	{ .compatible = "nxp,pca9955b", . data = &pca995x_chipdefs[pca9955b] },
+	{ .compatible = "nxp,pca9956b", .data = &pca995x_chipdefs[pca9956b] },
 	{},
 };
 MODULE_DEVICE_TABLE(of, pca995x_of_match);

-- 
2.45.2



