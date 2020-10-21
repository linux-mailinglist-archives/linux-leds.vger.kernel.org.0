Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5651C2954ED
	for <lists+linux-leds@lfdr.de>; Thu, 22 Oct 2020 00:51:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2506927AbgJUWvM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 21 Oct 2020 18:51:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2506932AbgJUWvM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 21 Oct 2020 18:51:12 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08C57C0613D4
        for <linux-leds@vger.kernel.org>; Wed, 21 Oct 2020 15:51:12 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id a9so5169933lfc.7
        for <linux-leds@vger.kernel.org>; Wed, 21 Oct 2020 15:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BwMmGlmMLcmqzYJ99gKjkUq1Wudan5TSJn8Ws/0M4Fo=;
        b=AFKXbTqTffv34MWjRlmq6pP/YfSnDofZEm/D+KKLhKONbksIYGc1G2K56b5zCgeGup
         EVPUY8rg4NznWvX2KPOXW80tNfESY/SKNJnTNI9CsYhrF5I1XBRmZTOc7+XIgofphjD0
         F2ss2OYFSFnbPZypuklUBpuVSUOL+2//a/NEjP9d9ZD3fAkkjm8EkM4NQw9bQkhRlf8l
         me/ZxasKFhzp1uHjwiSzh5jS5iJbd7Q84iHA+oJtSBvZ4/k+kyCknrWJjsSYqjK3PuFI
         pp6rTEB/4NjZXgC2X4Bf+wSg+bajD/4vemUKnhDXB1Ep5tUsgOnlBtN1bEQs6TDkk/af
         PG0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BwMmGlmMLcmqzYJ99gKjkUq1Wudan5TSJn8Ws/0M4Fo=;
        b=db7e1W9l2wq85ypP7zU+UGUJVPkC52WGGCGpXUhGC1D4RQDjZK9sfGZv2NJK07ltAl
         EoC5pDZE4QqVKy+6cYye2Zom/gShgUdORPPgeCmggcvUtDO1YCih6ctvSZMcQHZrDSUf
         azwdo/TMMH81SCJ3KtUKa1fTB36rcxAihUp7aS/k9jtm9S83msnTZbXbBoL+7NG2LAgy
         9z5L0wz8w6jQNHOsyHCtz5qxXlyiDzgM1/S/yw30XqfCWxrD5v3COQ4/O2lPIYnLejmo
         zalmoBdISjU+BoA4fP00ZWoJ5SgjXgK9WWckm2RCtn87tJ5XiRvbCTRaGpNIjPQsAQ68
         yNAA==
X-Gm-Message-State: AOAM531YtdJk1lUxObhvEsPnrz4kYytJntl7ibusfzTKZ4ZVEQgu8TsN
        O6mJMigHAsK2V1xrDU5M+CmHSw==
X-Google-Smtp-Source: ABdhPJzSukJqLpmqudb6P2NeiUqTrUtbcSdjoAloKGndrg3quWc/flHrhTJ4MbVvw19zpqIUezFR9w==
X-Received: by 2002:a05:6512:3053:: with SMTP id b19mr2156595lfb.338.1603320670442;
        Wed, 21 Oct 2020 15:51:10 -0700 (PDT)
Received: from eriador.lan ([188.162.64.195])
        by smtp.gmail.com with ESMTPSA id h11sm652062ljc.21.2020.10.21.15.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2020 15:51:09 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH 3/5] arm64: dts: pm8150b: add Light Pulse Generator device node
Date:   Thu, 22 Oct 2020 01:50:58 +0300
Message-Id: <20201021225100.162795-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201021225100.162795-1-dmitry.baryshkov@linaro.org>
References: <20201021225100.162795-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add device node defining LPG/PWM block on PM8150B PMIC chip.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm8150b.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8150b.dtsi b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
index d6e075f92b1e..30e7a5f19e5f 100644
--- a/arch/arm64/boot/dts/qcom/pm8150b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
@@ -133,5 +133,14 @@ pmic@3 {
 		reg = <0x3 SPMI_USID>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+
+		pm8150b_lpg: lpg {
+			compatible = "qcom,pm8150b-lpg";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
 	};
 };
-- 
2.28.0

