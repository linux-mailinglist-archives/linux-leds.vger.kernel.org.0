Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 229CD29FA44
	for <lists+linux-leds@lfdr.de>; Fri, 30 Oct 2020 02:07:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726103AbgJ3BHY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 29 Oct 2020 21:07:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725379AbgJ3BHX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 29 Oct 2020 21:07:23 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 403AFC0613D3
        for <linux-leds@vger.kernel.org>; Thu, 29 Oct 2020 18:07:23 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id a7so5727419lfk.9
        for <linux-leds@vger.kernel.org>; Thu, 29 Oct 2020 18:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=svkaYU6ajBWIQXRUuQi7TLrUgDBVVF7XT8RieFVwa5U=;
        b=YsM5NGvjfQTAwilWsl3WGjGM5nIrqb2xs0GpR5M/nggqTK31ASTMPivCMunXBhJDFc
         nIVVfviYGA7kr8STx0QRbSHnsxaB3Ntz7bxgrBHa4RcBG4mRp8z6dwXn8i+FRW8FCYbd
         WhBMO/l/5KtfgWKQz/iCQou4XNNuftoJBuOQeUkF0QUGQuHbmT5bYylATbvNxWRJAWkT
         iNqn/3xrO4w0FsiJO12d6eWoLTOT2ZZFuLKYyxSu6hTXbaLaiZVpt+vDLTig1WVTn2r5
         LNo5FYjCoXu1Rx0YlhjPIB30r2ExP3IwrxRkohvANR0p8cFBq56+XOIVE3l31gZY07w0
         /7Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=svkaYU6ajBWIQXRUuQi7TLrUgDBVVF7XT8RieFVwa5U=;
        b=L914Xg+ygIB5VXL8hVSkpu8mTOAlwka/YjRXau2oQa+NZfSzGJ6px5ijZOIeIchjYy
         1uVsIP2NasEpiy6dEKhCVlC9u7JvaF5via3/+nH9PxbIK5g7VMOtdouVWqhAw1UO5QW7
         RQbr126pAxuUmNcXfx9+HroycMXilPIwBiaW+OfIGoF8hNu6tLVEbMdBd+ge6eZdDRPo
         duHLVoibibx4TRpUbPo9WwmttozC+b8R8EVwEAi2cb6U/rTr0xokyKz3P11SVXzhp98i
         6CyFv20I2OSaXodh382pZn78VavQbl9J8BG9QDex14m15LSZ1ZyFdaYqWQtLfRp/zjp4
         DuSQ==
X-Gm-Message-State: AOAM531F1eZRi3LA/Jp9/85gJU3d7U51ZtqgZxzSAkcF+kJ3jJL5ghhT
        tDjcFapzcAchJz9/cRSNVoZKUQ==
X-Google-Smtp-Source: ABdhPJwMvsOIbT034PQyb3jOThXAm6KgIhvi9Vu+Ryv+A2byeW8wYOnhg/4P67PaGuZ5tcul8vhYag==
X-Received: by 2002:a05:6512:2098:: with SMTP id t24mr2756947lfr.116.1604020041764;
        Thu, 29 Oct 2020 18:07:21 -0700 (PDT)
Received: from eriador.lan ([188.162.64.219])
        by smtp.gmail.com with ESMTPSA id c6sm447130lfm.226.2020.10.29.18.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 18:07:21 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     linux-leds@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 2/5] leds: qcom-lpg: add support for pm8150[bl] leds
Date:   Fri, 30 Oct 2020 04:07:10 +0300
Message-Id: <20201030010713.247009-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201030010713.247009-1-dmitry.baryshkov@linaro.org>
References: <20201030010713.247009-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add support for the LPG/PWM block found on newer PMICs: PM8150B and
PM8150A/L.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/leds/leds-qcom-lpg.c | 68 ++++++++++++++++++++++++++++++++----
 1 file changed, 61 insertions(+), 7 deletions(-)

diff --git a/drivers/leds/leds-qcom-lpg.c b/drivers/leds/leds-qcom-lpg.c
index 86131a65d2c5..4770fc46f312 100644
--- a/drivers/leds/leds-qcom-lpg.c
+++ b/drivers/leds/leds-qcom-lpg.c
@@ -48,6 +48,8 @@ struct lpg_data;
  * @lut_bitmap:	allocation bitmap for LUT entries
  * @triled_base: base address of the TRILED block (optional)
  * @triled_src:	power-source for the TRILED
+ * @triled_has_atc_ctl:	true if there is TRI_LED_ATC_CTL register
+ * @triled_has_src_sel:	true if there is TRI_LED_SRC_SEL register
  * @channels:	list of PWM channels
  * @num_channels: number of @channels
  */
@@ -65,6 +67,8 @@ struct lpg {
 
 	u32 triled_base;
 	u32 triled_src;
+	bool triled_has_atc_ctl;
+	bool triled_has_src_sel;
 
 	struct lpg_channel *channels;
 	unsigned int num_channels;
@@ -165,6 +169,8 @@ struct lpg_channel_data {
  * @lut_base:		base address of LUT block
  * @lut_size:		number of entries in LUT
  * @triled_base:	base address of TRILED
+ * @triled_has_atc_ctl:	true if there is TRI_LED_ATC_CTL register
+ * @triled_has_src_sel:	true if there is TRI_LED_SRC_SEL register
  * @pwm_9bit_mask:	bitmask for switching from 6bit to 9bit pwm
  * @num_channels:	number of channels in LPG
  * @channels:		list of channel initialization data
@@ -173,6 +179,8 @@ struct lpg_data {
 	unsigned int lut_base;
 	unsigned int lut_size;
 	unsigned int triled_base;
+	bool triled_has_atc_ctl;
+	bool triled_has_src_sel;
 	unsigned int pwm_9bit_mask;
 	int num_channels;
 	struct lpg_channel_data *channels;
@@ -986,18 +994,24 @@ static int lpg_init_triled(struct lpg *lpg)
 		return 0;
 
 	lpg->triled_base = lpg->data->triled_base;
-
-	ret = of_property_read_u32(np, "qcom,power-source", &lpg->triled_src);
-	if (ret || lpg->triled_src == 2 || lpg->triled_src > 3) {
-		dev_err(lpg->dev, "invalid power source\n");
-		return -EINVAL;
+	lpg->triled_has_atc_ctl = lpg->data->triled_has_atc_ctl;
+	lpg->triled_has_src_sel = lpg->data->triled_has_src_sel;
+
+	if (lpg->triled_has_src_sel) {
+		ret = of_property_read_u32(np, "qcom,power-source", &lpg->triled_src);
+		if (ret || lpg->triled_src == 2 || lpg->triled_src > 3) {
+			dev_err(lpg->dev, "invalid power source\n");
+			return -EINVAL;
+		}
 	}
 
 	/* Disable automatic trickle charge LED */
-	regmap_write(lpg->map, lpg->triled_base + TRI_LED_ATC_CTL, 0);
+	if (lpg->triled_has_atc_ctl)
+		regmap_write(lpg->map, lpg->triled_base + TRI_LED_ATC_CTL, 0);
 
 	/* Configure power source */
-	regmap_write(lpg->map, lpg->triled_base + TRI_LED_SRC_SEL, lpg->triled_src);
+	if (lpg->triled_has_src_sel)
+		regmap_write(lpg->map, lpg->triled_base + TRI_LED_SRC_SEL, lpg->triled_src);
 
 	/* Default all outputs to off */
 	regmap_write(lpg->map, lpg->triled_base + TRI_LED_EN_CTL, 0);
@@ -1099,6 +1113,8 @@ static const struct lpg_data pm8941_lpg_data = {
 	.lut_size = 64,
 
 	.triled_base = 0xd000,
+	.triled_has_atc_ctl = true,
+	.triled_has_src_sel = true,
 
 	.pwm_9bit_mask = 3 << 4,
 
@@ -1137,6 +1153,8 @@ static const struct lpg_data pmi8994_lpg_data = {
 	.lut_size = 24,
 
 	.triled_base = 0xd000,
+	.triled_has_atc_ctl = true,
+	.triled_has_src_sel = true,
 
 	.pwm_9bit_mask = BIT(4),
 
@@ -1166,12 +1184,48 @@ static const struct lpg_data pmi8998_lpg_data = {
 	},
 };
 
+static const struct lpg_data pm8150b_lpg_data = {
+	.lut_base = 0xb000,
+	.lut_size = 49,
+
+	.triled_base = 0xd000,
+
+	.pwm_9bit_mask = BIT(4),
+
+	.num_channels = 2,
+	.channels = (struct lpg_channel_data[]) {
+		{ .base = 0xb100, .triled_mask = BIT(7) },
+		{ .base = 0xb200, .triled_mask = BIT(6) },
+	},
+};
+
+static const struct lpg_data pm8150l_lpg_data = {
+	.lut_base = 0xb000,
+	.lut_size = 49,
+
+	.triled_base = 0xd000,
+
+	.pwm_9bit_mask = BIT(4),
+
+	.num_channels = 5,
+	.channels = (struct lpg_channel_data[]) {
+		{ .base = 0xb100, .triled_mask = BIT(7) },
+		{ .base = 0xb200, .triled_mask = BIT(6) },
+		{ .base = 0xb300, .triled_mask = BIT(5) },
+		{ .base = 0xbc00 },
+		{ .base = 0xbd00 },
+
+	},
+};
+
 static const struct of_device_id lpg_of_table[] = {
 	{ .compatible = "qcom,pm8916-pwm", .data = &pm8916_pwm_data },
 	{ .compatible = "qcom,pm8941-lpg", .data = &pm8941_lpg_data },
 	{ .compatible = "qcom,pm8994-lpg", .data = &pm8994_lpg_data },
 	{ .compatible = "qcom,pmi8994-lpg", .data = &pmi8994_lpg_data },
 	{ .compatible = "qcom,pmi8998-lpg", .data = &pmi8998_lpg_data },
+	{ .compatible = "qcom,pm8150b-lpg", .data = &pm8150b_lpg_data },
+	{ .compatible = "qcom,pm8150l-lpg", .data = &pm8150l_lpg_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, lpg_of_table);
-- 
2.28.0

