Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0647719A96
	for <lists+linux-leds@lfdr.de>; Thu,  1 Jun 2023 13:08:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232820AbjFALI2 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 1 Jun 2023 07:08:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232757AbjFALI0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 1 Jun 2023 07:08:26 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6E6811F;
        Thu,  1 Jun 2023 04:08:23 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id D11656606EC8;
        Thu,  1 Jun 2023 12:08:21 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1685617702;
        bh=qv+0WiyixeUBRHjdz2wlLAG+Q/lJmJitUkVUNS2i3W8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iOqlBbF82XHmx6x8rOsnMmGyYEllSC8sSF4KZxthTkzJJUFoT1FPQA3A1vnStbD5x
         1JEICgqvpdqCyZrZDzxW7by2EL40voP8xYJnLitVz4DhBhHAwRI5rCL6LLUBsA5o0j
         4K/47PxC/8lC8ZRJX+Ux8qLlzXVet1chnIWXr9Lig1rzbWAr+51OLkYy+ddj7MTcon
         olhe94O5rljPTZQtyWTndH8NUsTrB2rqGXhbjipkuIrHvGDgNeaeSqhDEFjH+XE7HA
         yFcjY69cZmX3MZA1FcipcMKL+pwScRYg7I4+CxlFXI/GSNRH30wVTWSJH36k1NZwa8
         YAucVAGsty0dg==
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
To:     pavel@ucw.cz
Cc:     lee@kernel.org, sean.wang@mediatek.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v3 4/8] leds: leds-mt6323: Specify registers and specs in platform data
Date:   Thu,  1 Jun 2023 13:08:09 +0200
Message-Id: <20230601110813.2373764-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230601110813.2373764-1-angelogioacchino.delregno@collabora.com>
References: <20230601110813.2373764-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

In order to enhance the flexibility of this driver and let it support
more than just one MediaTek LEDs IP for more than just one PMIC,
add platform data structure specifying the register offsets and
data that commonly varies between different IPs.

This commit brings no functional changes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Acked-by: Pavel Machek <pavel@ucw.cz>
---
 drivers/leds/leds-mt6323.c | 153 ++++++++++++++++++++++++++++---------
 1 file changed, 115 insertions(+), 38 deletions(-)

diff --git a/drivers/leds/leds-mt6323.c b/drivers/leds/leds-mt6323.c
index 17ee88043f52..65a99c067216 100644
--- a/drivers/leds/leds-mt6323.c
+++ b/drivers/leds/leds-mt6323.c
@@ -33,22 +33,18 @@
  */
 #define MT6323_RG_ISINK_CK_SEL_MASK(i)	(BIT(10) << (i))
 
-/*
- * Register for MT6323_ISINK_CON0 to setup the
- * duty cycle of the blink.
- */
-#define MT6323_ISINK_CON0(i)		(MT6323_ISINK0_CON0 + 0x8 * (i))
+#define MT6323_ISINK_CON(r, i)		(r + 0x8 * (i))
+
+/* ISINK_CON0: Register to setup the duty cycle of the blink. */
 #define MT6323_ISINK_DIM_DUTY_MASK	(0x1f << 8)
 #define MT6323_ISINK_DIM_DUTY(i)	(((i) << 8) & \
-					MT6323_ISINK_DIM_DUTY_MASK)
+				MT6323_ISINK_DIM_DUTY_MASK)
 
-/* Register to setup the period of the blink. */
-#define MT6323_ISINK_CON1(i)		(MT6323_ISINK0_CON1 + 0x8 * (i))
+/* ISINK_CON1: Register to setup the period of the blink. */
 #define MT6323_ISINK_DIM_FSEL_MASK	(0xffff)
 #define MT6323_ISINK_DIM_FSEL(i)	((i) & MT6323_ISINK_DIM_FSEL_MASK)
 
-/* Register to control the brightness. */
-#define MT6323_ISINK_CON2(i)		(MT6323_ISINK0_CON2 + 0x8 * (i))
+/* ISINK_CON2: Register to control the brightness. */
 #define MT6323_ISINK_CH_STEP_SHIFT	12
 #define MT6323_ISINK_CH_STEP_MASK	(0x7 << 12)
 #define MT6323_ISINK_CH_STEP(i)		(((i) << 12) & \
@@ -63,12 +59,9 @@
 #define MT6323_ISINK_CH_EN_MASK(i)	BIT(i)
 #define MT6323_ISINK_CH_EN(i)		BIT(i)
 
-#define MT6323_MAX_PERIOD		10000
-#define MT6323_MAX_LEDS			4
-#define MT6323_MAX_BRIGHTNESS		6
-#define MT6323_UNIT_DUTY		3125
-#define MT6323_CAL_HW_DUTY(o, p)	DIV_ROUND_CLOSEST((o) * 100000ul,\
-					(p) * MT6323_UNIT_DUTY)
+#define MAX_SUPPORTED_LEDS		8
+#define MT6323_CAL_HW_DUTY(o, p, u)	DIV_ROUND_CLOSEST((o) * 100000ul,\
+					(p) * (u))
 
 struct mt6323_leds;
 
@@ -86,12 +79,59 @@ struct mt6323_led {
 	enum led_brightness	current_brightness;
 };
 
+/**
+ * struct mt6323_regs - register spec for the LED device
+ * @top_ckpdn:		Offset to ISINK_CKPDN[0..x] registers
+ * @num_top_ckpdn:	Number of ISINK_CKPDN registers
+ * @top_ckcon:		Offset to ISINK_CKCON[0..x] registers
+ * @num_top_ckcon:	Number of ISINK_CKCON registers
+ * @isink_con:		Offset to ISINKx_CON[0..x] registers
+ * @num_isink_con:	Number of ISINKx_CON registers
+ * @isink_max_regs:	Number of ISINK[0..x] registers
+ * @isink_en_ctrl:	Offset to ISINK_EN_CTRL register
+ */
+struct mt6323_regs {
+	const u16 *top_ckpdn;
+	u8 num_top_ckpdn;
+	const u16 *top_ckcon;
+	u8 num_top_ckcon;
+	const u16 *isink_con;
+	u8 num_isink_con;
+	u8 isink_max_regs;
+	u16 isink_en_ctrl;
+};
+
+/**
+ * struct mt6323_hwspec - hardware specific parameters
+ * @max_period:		Maximum period for all LEDs
+ * @max_leds:		Maximum number of supported LEDs
+ * @max_brightness:	Maximum brightness for all LEDs
+ * @unit_duty:		Steps of duty per period
+ */
+struct mt6323_hwspec {
+	u16 max_period;
+	u8 max_leds;
+	u16 max_brightness;
+	u16 unit_duty;
+};
+
+/**
+ * struct mt6323_data - device specific data
+ * @regs:		Register spec for this device
+ * @spec:		Hardware specific parameters
+ */
+struct mt6323_data {
+	const struct mt6323_regs *regs;
+	const struct mt6323_hwspec *spec;
+};
+
 /**
  * struct mt6323_leds -	state container for holding LED controller
  *			of the driver
  * @dev:		the device pointer
  * @hw:			the underlying hardware providing shared
  *			bus for the register operations
+ * @pdata:		device specific data
  * @lock:		the lock among process context
  * @led:		the array that contains the state of individual
  *			LED device
@@ -99,9 +139,10 @@ struct mt6323_led {
 struct mt6323_leds {
 	struct device		*dev;
 	struct mt6397_chip	*hw;
+	const struct mt6323_data *pdata;
 	/* protect among process context */
 	struct mutex		lock;
-	struct mt6323_led	*led[MT6323_MAX_LEDS];
+	struct mt6323_led	*led[MAX_SUPPORTED_LEDS];
 };
 
 static int mt6323_led_hw_brightness(struct led_classdev *cdev,
@@ -109,6 +150,7 @@ static int mt6323_led_hw_brightness(struct led_classdev *cdev,
 {
 	struct mt6323_led *led = container_of(cdev, struct mt6323_led, cdev);
 	struct mt6323_leds *leds = led->parent;
+	const struct mt6323_regs *regs = leds->pdata->regs;
 	struct regmap *regmap = leds->hw->regmap;
 	u32 con2_mask = 0, con2_val = 0;
 	int ret;
@@ -124,7 +166,7 @@ static int mt6323_led_hw_brightness(struct led_classdev *cdev,
 		     MT6323_ISINK_SFSTR0_TC(2) |
 		     MT6323_ISINK_SFSTR0_EN;
 
-	ret = regmap_update_bits(regmap, MT6323_ISINK_CON2(led->id),
+	ret = regmap_update_bits(regmap, MT6323_ISINK_CON(regs->isink_con[2], led->id),
 				 con2_mask, con2_val);
 	return ret;
 }
@@ -133,18 +175,19 @@ static int mt6323_led_hw_off(struct led_classdev *cdev)
 {
 	struct mt6323_led *led = container_of(cdev, struct mt6323_led, cdev);
 	struct mt6323_leds *leds = led->parent;
+	const struct mt6323_regs *regs = leds->pdata->regs;
 	struct regmap *regmap = leds->hw->regmap;
 	unsigned int status;
 	int ret;
 
 	status = MT6323_ISINK_CH_EN(led->id);
-	ret = regmap_update_bits(regmap, MT6323_ISINK_EN_CTRL,
+	ret = regmap_update_bits(regmap, regs->isink_en_ctrl,
 				 MT6323_ISINK_CH_EN_MASK(led->id), ~status);
 	if (ret < 0)
 		return ret;
 
 	usleep_range(100, 300);
-	ret = regmap_update_bits(regmap, MT6323_TOP_CKPDN2,
+	ret = regmap_update_bits(regmap, regs->top_ckpdn[2],
 				 MT6323_RG_ISINK_CK_PDN_MASK(led->id),
 				 MT6323_RG_ISINK_CK_PDN(led->id));
 	if (ret < 0)
@@ -158,25 +201,26 @@ mt6323_get_led_hw_brightness(struct led_classdev *cdev)
 {
 	struct mt6323_led *led = container_of(cdev, struct mt6323_led, cdev);
 	struct mt6323_leds *leds = led->parent;
+	const struct mt6323_regs *regs = leds->pdata->regs;
 	struct regmap *regmap = leds->hw->regmap;
 	unsigned int status;
 	int ret;
 
-	ret = regmap_read(regmap, MT6323_TOP_CKPDN2, &status);
+	ret = regmap_read(regmap, regs->top_ckpdn[2], &status);
 	if (ret < 0)
 		return ret;
 
 	if (status & MT6323_RG_ISINK_CK_PDN_MASK(led->id))
 		return 0;
 
-	ret = regmap_read(regmap, MT6323_ISINK_EN_CTRL, &status);
+	ret = regmap_read(regmap, regs->isink_en_ctrl, &status);
 	if (ret < 0)
 		return ret;
 
 	if (!(status & MT6323_ISINK_CH_EN(led->id)))
 		return 0;
 
-	ret = regmap_read(regmap, MT6323_ISINK_CON2(led->id), &status);
+	ret = regmap_read(regmap, MT6323_ISINK_CON(regs->isink_con[2], led->id), &status);
 	if (ret < 0)
 		return ret;
 
@@ -189,6 +233,7 @@ static int mt6323_led_hw_on(struct led_classdev *cdev,
 {
 	struct mt6323_led *led = container_of(cdev, struct mt6323_led, cdev);
 	struct mt6323_leds *leds = led->parent;
+	const struct mt6323_regs *regs = leds->pdata->regs;
 	struct regmap *regmap = leds->hw->regmap;
 	unsigned int status;
 	int ret;
@@ -198,13 +243,13 @@ static int mt6323_led_hw_on(struct led_classdev *cdev,
 	 * clock and channel and let work with continuous blink as
 	 * the default.
 	 */
-	ret = regmap_update_bits(regmap, MT6323_TOP_CKCON1,
+	ret = regmap_update_bits(regmap, regs->top_ckcon[1],
 				 MT6323_RG_ISINK_CK_SEL_MASK(led->id), 0);
 	if (ret < 0)
 		return ret;
 
 	status = MT6323_RG_ISINK_CK_PDN(led->id);
-	ret = regmap_update_bits(regmap, MT6323_TOP_CKPDN2,
+	ret = regmap_update_bits(regmap, regs->top_ckpdn[2],
 				 MT6323_RG_ISINK_CK_PDN_MASK(led->id),
 				 ~status);
 	if (ret < 0)
@@ -212,7 +257,7 @@ static int mt6323_led_hw_on(struct led_classdev *cdev,
 
 	usleep_range(100, 300);
 
-	ret = regmap_update_bits(regmap, MT6323_ISINK_EN_CTRL,
+	ret = regmap_update_bits(regmap, regs->isink_en_ctrl,
 				 MT6323_ISINK_CH_EN_MASK(led->id),
 				 MT6323_ISINK_CH_EN(led->id));
 	if (ret < 0)
@@ -222,13 +267,13 @@ static int mt6323_led_hw_on(struct led_classdev *cdev,
 	if (ret < 0)
 		return ret;
 
-	ret = regmap_update_bits(regmap, MT6323_ISINK_CON0(led->id),
+	ret = regmap_update_bits(regmap, MT6323_ISINK_CON(regs->isink_con[0], led->id),
 				 MT6323_ISINK_DIM_DUTY_MASK,
 				 MT6323_ISINK_DIM_DUTY(31));
 	if (ret < 0)
 		return ret;
 
-	ret = regmap_update_bits(regmap, MT6323_ISINK_CON1(led->id),
+	ret = regmap_update_bits(regmap, MT6323_ISINK_CON(regs->isink_con[1], led->id),
 				 MT6323_ISINK_DIM_FSEL_MASK,
 				 MT6323_ISINK_DIM_FSEL(1000));
 	if (ret < 0)
@@ -243,6 +288,8 @@ static int mt6323_led_set_blink(struct led_classdev *cdev,
 {
 	struct mt6323_led *led = container_of(cdev, struct mt6323_led, cdev);
 	struct mt6323_leds *leds = led->parent;
+	const struct mt6323_regs *regs = leds->pdata->regs;
+	const struct mt6323_hwspec *spec = leds->pdata->spec;
 	struct regmap *regmap = leds->hw->regmap;
 	unsigned long period;
 	u8 duty_hw;
@@ -265,14 +312,14 @@ static int mt6323_led_set_blink(struct led_classdev *cdev,
 	 */
 	period = *delay_on + *delay_off;
 
-	if (period > MT6323_MAX_PERIOD)
+	if (period > spec->max_period)
 		return -EINVAL;
 
 	/*
 	 * Calculate duty_hw based on the percentage of period during
 	 * which the led is ON.
 	 */
-	duty_hw = MT6323_CAL_HW_DUTY(*delay_on, period);
+	duty_hw = MT6323_CAL_HW_DUTY(*delay_on, period, spec->unit_duty);
 
 	/* hardware doesn't support zero duty cycle. */
 	if (!duty_hw)
@@ -290,13 +337,13 @@ static int mt6323_led_set_blink(struct led_classdev *cdev,
 		led->current_brightness = cdev->max_brightness;
 	}
 
-	ret = regmap_update_bits(regmap, MT6323_ISINK_CON0(led->id),
+	ret = regmap_update_bits(regmap, MT6323_ISINK_CON(regs->isink_con[0], led->id),
 				 MT6323_ISINK_DIM_DUTY_MASK,
 				 MT6323_ISINK_DIM_DUTY(duty_hw - 1));
 	if (ret < 0)
 		goto out;
 
-	ret = regmap_update_bits(regmap, MT6323_ISINK_CON1(led->id),
+	ret = regmap_update_bits(regmap, MT6323_ISINK_CON(regs->isink_con[1], led->id),
 				 MT6323_ISINK_DIM_FSEL_MASK,
 				 MT6323_ISINK_DIM_FSEL(period - 1));
 out:
@@ -369,6 +416,8 @@ static int mt6323_led_probe(struct platform_device *pdev)
 	struct mt6397_chip *hw = dev_get_drvdata(dev->parent);
 	struct mt6323_leds *leds;
 	struct mt6323_led *led;
+	const struct mt6323_regs *regs;
+	const struct mt6323_hwspec *spec;
 	int ret;
 	unsigned int status;
 	u32 reg;
@@ -379,6 +428,9 @@ static int mt6323_led_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, leds);
 	leds->dev = dev;
+	leds->pdata = device_get_match_data(dev);
+	regs = leds->pdata->regs;
+	spec = leds->pdata->spec;
 
 	/*
 	 * leds->hw points to the underlying bus for the register
@@ -388,11 +440,11 @@ static int mt6323_led_probe(struct platform_device *pdev)
 	mutex_init(&leds->lock);
 
 	status = MT6323_RG_DRV_32K_CK_PDN;
-	ret = regmap_update_bits(leds->hw->regmap, MT6323_TOP_CKPDN0,
+	ret = regmap_update_bits(leds->hw->regmap, regs->top_ckpdn[0],
 				 MT6323_RG_DRV_32K_CK_PDN_MASK, ~status);
 	if (ret < 0) {
 		dev_err(leds->dev,
-			"Failed to update MT6323_TOP_CKPDN0 Register\n");
+			"Failed to update TOP_CKPDN0 Register\n");
 		return ret;
 	}
 
@@ -405,7 +457,8 @@ static int mt6323_led_probe(struct platform_device *pdev)
 			goto put_child_node;
 		}
 
-		if (reg >= MT6323_MAX_LEDS || leds->led[reg]) {
+		if (reg >= spec->max_leds || reg >= MAX_SUPPORTED_LEDS ||
+		    leds->led[reg]) {
 			dev_err(dev, "Invalid led reg %u\n", reg);
 			ret = -EINVAL;
 			goto put_child_node;
@@ -419,7 +472,7 @@ static int mt6323_led_probe(struct platform_device *pdev)
 
 		leds->led[reg] = led;
 		leds->led[reg]->id = reg;
-		leds->led[reg]->cdev.max_brightness = MT6323_MAX_BRIGHTNESS;
+		leds->led[reg]->cdev.max_brightness = spec->max_brightness;
 		leds->led[reg]->cdev.brightness_set_blocking =
 					mt6323_led_set_brightness;
 		leds->led[reg]->cdev.blink_set = mt6323_led_set_blink;
@@ -454,13 +507,14 @@ static int mt6323_led_probe(struct platform_device *pdev)
 static int mt6323_led_remove(struct platform_device *pdev)
 {
 	struct mt6323_leds *leds = platform_get_drvdata(pdev);
+	const struct mt6323_regs *regs = leds->pdata->regs;
 	int i;
 
 	/* Turn the LEDs off on driver removal. */
 	for (i = 0 ; leds->led[i] ; i++)
 		mt6323_led_hw_off(&leds->led[i]->cdev);
 
-	regmap_update_bits(leds->hw->regmap, MT6323_TOP_CKPDN0,
+	regmap_update_bits(leds->hw->regmap, regs->top_ckpdn[0],
 			   MT6323_RG_DRV_32K_CK_PDN_MASK,
 			   MT6323_RG_DRV_32K_CK_PDN);
 
@@ -469,8 +523,31 @@ static int mt6323_led_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct mt6323_regs mt6323_registers = {
+	.top_ckpdn = (const u16[]){ 0x102, 0x106, 0x10e },
+	.num_top_ckpdn = 3,
+	.top_ckcon = (const u16[]){ 0x120, 0x126 },
+	.num_top_ckcon = 2,
+	.isink_con = (const u16[]){ 0x330, 0x332, 0x334 },
+	.num_isink_con = 3,
+	.isink_max_regs = 4, /* ISINK[0..3] */
+	.isink_en_ctrl = 0x356,
+};
+
+static const struct mt6323_hwspec mt6323_spec = {
+	.max_period = 10000,
+	.max_leds = 4,
+	.max_brightness = 6,
+	.unit_duty = 3125,
+};
+
+static const struct mt6323_data mt6323_pdata = {
+	.regs = &mt6323_registers,
+	.spec = &mt6323_spec,
+};
+
 static const struct of_device_id mt6323_led_dt_match[] = {
-	{ .compatible = "mediatek,mt6323-led" },
+	{ .compatible = "mediatek,mt6323-led", .data = &mt6323_pdata},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mt6323_led_dt_match);
-- 
2.40.1

