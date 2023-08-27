Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60C95789A89
	for <lists+linux-leds@lfdr.de>; Sun, 27 Aug 2023 03:02:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230157AbjH0BAM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 26 Aug 2023 21:00:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230167AbjH0BAB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 26 Aug 2023 21:00:01 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E53419A
        for <linux-leds@vger.kernel.org>; Sat, 26 Aug 2023 17:59:59 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2bd0a5a5abbso1595351fa.0
        for <linux-leds@vger.kernel.org>; Sat, 26 Aug 2023 17:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693097997; x=1693702797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yrAjsdbjqNoZfzO46ca2VQOrSbv12nquDzMHZ51VtI0=;
        b=ZTXVy8Hx20VshMMq/5c/Cl+D8HtTzwbgKAw8qCWDiZiVrONWfa4kKfP5YQMvWzKaQN
         IQK+J+1UtHVfOCeI8lsBf2sXE743CmZJFWsvpUJEBMnGl1/8XN4KStduHsprOtx+YrVf
         3NPLMOldQ+r0A+flfS5GTxvJNb4C8v6dR0BgmInpZv22vlCUO4ooPZ58dxR7pl9w7/cI
         3+D9dAkQko8++xJFq3SzNjYmyVFNSio+fEKxmYOr5Dz5wHFLNRJAPYOPCH9jvJjSZsQz
         XyP5KTc1cmY6XciZ33D/1PGnPIr0iwVQy2orlXz7B53bfA+XEtoT4KZpHPYmbW850FyJ
         mtuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693097997; x=1693702797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yrAjsdbjqNoZfzO46ca2VQOrSbv12nquDzMHZ51VtI0=;
        b=V46tYLGiSAXZ3vlrH0+UHLoC4QkhRuL+/MzFPee6ieYXTjhkJ6nwU3A/vvrAxn5UyL
         WyU7r3nTeLDKH972nQbuwibyhK/zmRreXmBQYIK+Gf7a0jahh2Zcs6/3t6Sr1kv9m2PV
         lu0kP/XL9lVa3TeF5PvE1HpIqdsbn7Oy3tyoEocSCAR430grPv9DFITfRCKqEFZW+k8h
         wMg4WOWctSDx+5XYB74c4w3T9HumLKffFJebuxkeNTYzLoWvDMRzvY8VMDLpa9Nz1dpY
         FYMJB/O7QFjnRimy3OlcmYPa2HDDZpibq5f8ASAWGl8sVlKBUWyvyDMlx2ELZDTZxcN3
         BlWA==
X-Gm-Message-State: AOJu0Yz/3i2nKsJz9sOoxLHC/QjvviFv9cn855xeUfmW6LwBmaA6gC/F
        bf1KVF8qL3NbJnMibWMIXWwl3w==
X-Google-Smtp-Source: AGHT+IGECDpJF0uJit+3kcAkFCS7p5Gq8/B52s39t0w0Omv+qAw/gwgn/0e6bSRrDUixQrNsXCY8bw==
X-Received: by 2002:a05:6512:3411:b0:4f8:586a:8af6 with SMTP id i17-20020a056512341100b004f8586a8af6mr17284216lfr.4.1693097997463;
        Sat, 26 Aug 2023 17:59:57 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id p18-20020ac246d2000000b00500a08e42e7sm917729lfo.124.2023.08.26.17.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 17:59:55 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     devicetree@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        linux-iio@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        linux-leds@vger.kernel.org
Subject: [PATCH v4 29/38] ARM: dts: qcom: pm8058: switch to interrupts-extended
Date:   Sun, 27 Aug 2023 03:59:11 +0300
Message-Id: <20230827005920.898719-30-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230827005920.898719-1-dmitry.baryshkov@linaro.org>
References: <20230827005920.898719-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Merge interrups and interrupt-parent properties into a single
interrupts-extended property.

Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/pm8058.dtsi | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/pm8058.dtsi b/arch/arm/boot/dts/qcom/pm8058.dtsi
index 3683d7b60918..984b79777984 100644
--- a/arch/arm/boot/dts/qcom/pm8058.dtsi
+++ b/arch/arm/boot/dts/qcom/pm8058.dtsi
@@ -11,9 +11,8 @@ pm8058: pmic {
 		pwrkey@1c {
 			compatible = "qcom,pm8058-pwrkey";
 			reg = <0x1c>;
-			interrupt-parent = <&pm8058>;
-			interrupts = <50 IRQ_TYPE_EDGE_RISING>,
-				     <51 IRQ_TYPE_EDGE_RISING>;
+			interrupts-extended = <&pm8058 50 IRQ_TYPE_EDGE_RISING>,
+					      <&pm8058 51 IRQ_TYPE_EDGE_RISING>;
 			debounce = <15625>;
 			pull-up;
 		};
@@ -61,9 +60,8 @@ pm8058_led133: led@133 {
 		pm8058_keypad: keypad@148 {
 			compatible = "qcom,pm8058-keypad";
 			reg = <0x148>;
-			interrupt-parent = <&pm8058>;
-			interrupts = <74 IRQ_TYPE_EDGE_RISING>,
-				     <75 IRQ_TYPE_EDGE_RISING>;
+			interrupts-extended = <&pm8058 74 IRQ_TYPE_EDGE_RISING>,
+					      <&pm8058 75 IRQ_TYPE_EDGE_RISING>;
 			debounce = <15>;
 			scan-delay = <32>;
 			row-hold = <91500>;
@@ -136,8 +134,7 @@ ref_muxoff: adc-channel@f {
 		rtc@1e8 {
 			compatible = "qcom,pm8058-rtc";
 			reg = <0x1e8>;
-			interrupt-parent = <&pm8058>;
-			interrupts = <39 IRQ_TYPE_EDGE_RISING>;
+			interrupts-extended = <&pm8058 39 IRQ_TYPE_EDGE_RISING>;
 			allow-set-time;
 		};
 	};
-- 
2.39.2

