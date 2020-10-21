Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAE402954EA
	for <lists+linux-leds@lfdr.de>; Thu, 22 Oct 2020 00:51:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2506924AbgJUWvL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 21 Oct 2020 18:51:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2506928AbgJUWvK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 21 Oct 2020 18:51:10 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 635BCC0613D4
        for <linux-leds@vger.kernel.org>; Wed, 21 Oct 2020 15:51:10 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id 77so5220823lfl.2
        for <linux-leds@vger.kernel.org>; Wed, 21 Oct 2020 15:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zpjsljtV36eW22jKsBjcgvjXKE5SZZrozCSm2JOo928=;
        b=psxdaokVACpNVNAhX4v+t51isYuTHK2+yjs70ohMFGLi0A/J6RuG4aQrBN2JEjUfuQ
         jUccs4hXrG/Cf17Pl8QaoJVKTz9hK4i2D9sTWVQo4+QvwwCZULhCZyHFLXA/OaCZc6L/
         SifjOGkRULm6oCCcKkGQZt6onbxz4ylRNgr1AiTcPGP5D36sKgS0JOUTA+vwWfV7x4sC
         cuDFE6E1/+wETEoZQl1PvOPfHy8NfCkAtfb6QCWNiuE/OsdLDYt9uXKpwjIsOEeRSLZ8
         V0HelwOprCGlE52v3Rv/cMBCBdpo+Du+ripzg+33RlAk7q/qFQV+AjeGE76F6vozJGVK
         HW6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zpjsljtV36eW22jKsBjcgvjXKE5SZZrozCSm2JOo928=;
        b=Ce+QNfCkM89U4T3SobaqCZrgZzHWJXkBvbRRBTZWg2S26BjYtxe7I+88JlTw7V0p7h
         2O2ktNELDDuLofi3z6GWiGKt7aXq5vd6Hcc4JA1rldYO56IvGig6bAJOKSiG4ANMtDmO
         +ePfGT2uGGNCINetZcRS9+w8RmImIv+rYW3nKkjy6MCwDyVluIgJqiRg7Mzpy19wKQFz
         W7fslZJKddZQTQbddpYL41Kmh72FYiRFQCigkLd2k8gmAKOz3SZrlFro/636feTwx5LB
         9MycmLIC9yA1ogbRE3RrMqqa2Ucv5Y4laxYAm+HJ3g2g3GsHriehSnGjTxfJveGm2woe
         rJVA==
X-Gm-Message-State: AOAM531LHBWaBwN0t7cQQEqNx5cRO/SGjGAEfYOTRtfgtrnp2BfN+M0p
        xy9vsPVi/SWWoMKsfnT9bXM1aA==
X-Google-Smtp-Source: ABdhPJxTqNZ/hzJwrwREs7O1h5n00wULbV3F6fZz2PcHNcdzyMzHzFibUkI/V1L+nt27wa3ZLgDliQ==
X-Received: by 2002:a19:ee14:: with SMTP id g20mr2189420lfb.378.1603320668861;
        Wed, 21 Oct 2020 15:51:08 -0700 (PDT)
Received: from eriador.lan ([188.162.64.195])
        by smtp.gmail.com with ESMTPSA id h11sm652062ljc.21.2020.10.21.15.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2020 15:51:08 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/5] leds: qcom-lpg: add support for pm8150[bl] leds
Date:   Thu, 22 Oct 2020 01:50:57 +0300
Message-Id: <20201021225100.162795-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201021225100.162795-1-dmitry.baryshkov@linaro.org>
References: <20201021225100.162795-1-dmitry.baryshkov@linaro.org>
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
index 86131a65d2c5..4d24e0c973d6 100644
--- a/drivers/leds/leds-qcom-lpg.c
+++ b/drivers/leds/leds-qcom-lpg.c
@@ -48,6 +48,8 @@ struct lpg_data;
  * @lut_bitmap:	allocation bitmap for LUT entries
  * @triled_base: base address of the TRILED block (optional)
  * @triled_src:	power-source for the TRILED
+ * @triled_no_atc_ctl:	true if there is no TRI_LED_ATC_CTL register
+ * @triled_no_src_sel:	true if there is no TRI_LED_SRC_SEL register
  * @channels:	list of PWM channels
  * @num_channels: number of @channels
  */
@@ -65,6 +67,8 @@ struct lpg {
 
 	u32 triled_base;
 	u32 triled_src;
+	bool triled_no_atc_ctl;
+	bool triled_no_src_sel;
 
 	struct lpg_channel *channels;
 	unsigned int num_channels;
@@ -165,6 +169,8 @@ struct lpg_channel_data {
  * @lut_base:		base address of LUT block
  * @lut_size:		number of entries in LUT
  * @triled_base:	base address of TRILED
+ * @triled_no_atc_ctl:	true if there is no TRI_LED_ATC_CTL register
+ * @triled_no_src_sel:	true if there is no TRI_LED_SRC_SEL register
  * @pwm_9bit_mask:	bitmask for switching from 6bit to 9bit pwm
  * @num_channels:	number of channels in LPG
  * @channels:		list of channel initialization data
@@ -173,6 +179,8 @@ struct lpg_data {
 	unsigned int lut_base;
 	unsigned int lut_size;
 	unsigned int triled_base;
+	bool triled_no_atc_ctl;
+	bool triled_no_src_sel;
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
+	lpg->triled_no_atc_ctl = lpg->data->triled_no_atc_ctl;
+	lpg->triled_no_src_sel = lpg->data->triled_no_src_sel;
+
+	if (!lpg->triled_no_src_sel) {
+		ret = of_property_read_u32(np, "qcom,power-source", &lpg->triled_src);
+		if (ret || lpg->triled_src == 2 || lpg->triled_src > 3) {
+			dev_err(lpg->dev, "invalid power source\n");
+			return -EINVAL;
+		}
 	}
 
 	/* Disable automatic trickle charge LED */
-	regmap_write(lpg->map, lpg->triled_base + TRI_LED_ATC_CTL, 0);
+	if (!lpg->triled_no_atc_ctl)
+		regmap_write(lpg->map, lpg->triled_base + TRI_LED_ATC_CTL, 0);
 
 	/* Configure power source */
-	regmap_write(lpg->map, lpg->triled_base + TRI_LED_SRC_SEL, lpg->triled_src);
+	if (!lpg->triled_no_src_sel)
+		regmap_write(lpg->map, lpg->triled_base + TRI_LED_SRC_SEL, lpg->triled_src);
 
 	/* Default all outputs to off */
 	regmap_write(lpg->map, lpg->triled_base + TRI_LED_EN_CTL, 0);
@@ -1166,12 +1180,52 @@ static const struct lpg_data pmi8998_lpg_data = {
 	},
 };
 
+static const struct lpg_data pm8150b_lpg_data = {
+	.lut_base = 0xb000,
+	.lut_size = 49,
+
+	.triled_base = 0xd000,
+	.triled_no_atc_ctl = true,
+	.triled_no_src_sel = true,
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
+	.triled_no_atc_ctl = true,
+	.triled_no_src_sel = true,
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

