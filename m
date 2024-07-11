Return-Path: <linux-leds+bounces-2251-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D14F192E152
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jul 2024 09:53:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 851902819FD
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jul 2024 07:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EE6C1514CB;
	Thu, 11 Jul 2024 07:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O44X7OdD"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDE814B081;
	Thu, 11 Jul 2024 07:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720684382; cv=none; b=oWzsASJwAziAUZrJKzwmhkhSvmf2Pm1FVqk+/tbJ0sRUGg0+6BgSLB4I36xwco+GdWki1zQTZftgZtPoQOyfShC3zusN3tnkthVBn2sXTZgNOU9GWLtlCK8ZJFwtokyf3wB8voayi3WDG49zZg3oAf7/AlW8LYsolVLMeeYS/Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720684382; c=relaxed/simple;
	bh=PiblUI52yNW9vKaDDeU4Pqtw5WegncIKfin6nXZz0PA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lfut8cCq5r4BdyVPT0J8elV7stCrhT59T9BfHEkjNhJBMOOjBI99hf/vZaSzpWTJu9eB5CVw0uZ7UcEXKxi0W+HEjBfi12p8WBvfAUNMwQJVciWxudIJ+Wptnr8CQfjVOlwh3DEV2YZDfXINYfHaiFWO4Cykj9f9QytfapNxlWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O44X7OdD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 06C93C4AF0E;
	Thu, 11 Jul 2024 07:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720684382;
	bh=PiblUI52yNW9vKaDDeU4Pqtw5WegncIKfin6nXZz0PA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=O44X7OdDYsb1RXrNgJjQNtGV0WkLvjVOmNpYw/sAYMfSB4KCU9ah85Ax24LU9mhVu
	 fVAT67GuLnDpgTNYQAXP/2wtoOei8hsPjpRHj2VNYcxGDFzP7YNk9UUKDMRAftnlqY
	 A0JgF1F3T2H5AAQRlpaOrqDiRmo2vuLW1ug+kF90kqQ3VpxwY3EAgbCBb0XlHry4aa
	 ySnQF/pEGzgy/Z1AO3ebaqdDfS9S5yGPv/CIbB1QRA/onXVV35US131HZibW2AJjzP
	 7TWUqPc5eJXMaYqEzHLnnFidoJJtLYRT1A/RPfFIXndfpKgACwwpwxAP/T+rT5sCCK
	 rYwmwRk/CZUrg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA3E0C3DA41;
	Thu, 11 Jul 2024 07:53:01 +0000 (UTC)
From: Pieterjan Camerlynck via B4 Relay <devnull+pieterjanca.gmail.com@kernel.org>
Date: Thu, 11 Jul 2024 09:52:23 +0200
Subject: [PATCH v3 2/2] leds: leds-pca995x: Add support for NXP PCA9956B
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240711-pca995x-v3-2-a1bf1f3c3f5a@gmail.com>
References: <20240711-pca995x-v3-0-a1bf1f3c3f5a@gmail.com>
In-Reply-To: <20240711-pca995x-v3-0-a1bf1f3c3f5a@gmail.com>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Isai Gaspar <isaiezequiel.gaspar@nxp.com>, Marek Vasut <marex@denx.de>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Pieterjan Camerlynck <pieterjanca@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720684380; l=4818;
 i=pieterjanca@gmail.com; s=20240709; h=from:subject:message-id;
 bh=t3Yv09GE0P6l7FuL2RlQhlG/arL9upBo2x5FcRzdH1U=;
 b=jEfm7fGU3wEmqjDcWRiVPcwpTpGvL3YbMk+MunWV1FV8KuEYKRtlcwbUzIL4pdCXTnJEcxe4P
 RuDad/xDls+DeZnPmnttvpM0zFzEYeXNNtchwZIw9jDzCLWZMl3aB4T
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
 drivers/leds/leds-pca995x.c | 59 ++++++++++++++++++++++++++++++---------------
 1 file changed, 39 insertions(+), 20 deletions(-)

diff --git a/drivers/leds/leds-pca995x.c b/drivers/leds/leds-pca995x.c
index 78215dff1499..02cead01ff95 100644
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
@@ -34,17 +30,38 @@
 #define PCA995X_LDRX_MASK		0x3
 #define PCA995X_LDRX_BITS		2
 
-#define PCA995X_MAX_OUTPUTS		16
+#define PCA995X_MAX_OUTPUTS		24
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
@@ -52,9 +69,9 @@ struct pca995x_led {
 };
 
 struct pca995x_chip {
+	const struct pca995x_chipdef *chipdef;
 	struct regmap *regmap;
 	struct pca995x_led leds[PCA995X_MAX_OUTPUTS];
-	int btype;
 };
 
 static int pca995x_brightness_set(struct led_classdev *led_cdev,
@@ -62,10 +79,11 @@ static int pca995x_brightness_set(struct led_classdev *led_cdev,
 {
 	struct pca995x_led *led = ldev_to_led(led_cdev);
 	struct pca995x_chip *chip = led->chip;
+	const struct pca995x_chipdef *chipdef = chip->chipdef;
 	u8 ledout_addr, pwmout_addr;
 	int shift, ret;
 
-	pwmout_addr = (chip->btype ? PCA9955B_PWM0 : PCA9952_PWM0) + led->led_no;
+	pwmout_addr = chipdef->pwm_base + led->led_no;
 	ledout_addr = PCA995X_LEDOUT0 + (led->led_no / PCA995X_OUTPUTS_PER_REG);
 	shift = PCA995X_LDRX_BITS * (led->led_no % PCA995X_OUTPUTS_PER_REG);
 
@@ -104,11 +122,12 @@ static int pca995x_probe(struct i2c_client *client)
 	struct fwnode_handle *led_fwnodes[PCA995X_MAX_OUTPUTS] = { 0 };
 	struct fwnode_handle *np, *child;
 	struct device *dev = &client->dev;
+	const struct pca995x_chipdef *chipdef;
 	struct pca995x_chip *chip;
 	struct pca995x_led *led;
-	int i, btype, reg, ret;
+	int i, reg, ret;
 
-	btype = (unsigned long)device_get_match_data(&client->dev);
+	chipdef = device_get_match_data(&client->dev);
 
 	np = dev_fwnode(dev);
 	if (!np)
@@ -118,7 +137,7 @@ static int pca995x_probe(struct i2c_client *client)
 	if (!chip)
 		return -ENOMEM;
 
-	chip->btype = btype;
+	chip->chipdef = chipdef;
 	chip->regmap = devm_regmap_init_i2c(client, &pca995x_regmap);
 	if (IS_ERR(chip->regmap))
 		return PTR_ERR(chip->regmap);
@@ -170,21 +189,21 @@ static int pca995x_probe(struct i2c_client *client)
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



