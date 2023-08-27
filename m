Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B11C0789E2B
	for <lists+linux-leds@lfdr.de>; Sun, 27 Aug 2023 15:27:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229947AbjH0N0R (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 27 Aug 2023 09:26:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229998AbjH0NZn (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 27 Aug 2023 09:25:43 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A91C3191
        for <linux-leds@vger.kernel.org>; Sun, 27 Aug 2023 06:25:36 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-500b6456c7eso568681e87.2
        for <linux-leds@vger.kernel.org>; Sun, 27 Aug 2023 06:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693142735; x=1693747535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9TSiCQU8z8gMyHopnKHftqR+4tVxRcnW4JwBU1qA13I=;
        b=y2r1nXWWcVsjgvN41sTFzaMVQyflu0EWv1vldV5SLqaDwgjE2A0sd5/33wSNfGGH9o
         xSq7AbHuE3160O28gYuy70m+8PrSxHu2MUfqq/+gvVCv5ToxOgpzaQF/KQtmlaHIcPAr
         bqM215/8Y/iKuOffKYLadrka71xxCBvOtcL1mSuXA35p7Epj2JnKfx8layroJvJ27CYp
         Vi5nEu5mlHzWsjsYR2jpidK+i49hkze/m3woLX1zxUkiZRqQNG5Xf1LeYPTTNVsksLJV
         DLF1VWzYGJ+IpZI/Jx+GQSiIK0L6h5pavB/3EYqU/0h6pOebjKy4uOwzzEQOqx6nYl0I
         nZPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693142735; x=1693747535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9TSiCQU8z8gMyHopnKHftqR+4tVxRcnW4JwBU1qA13I=;
        b=kzTVZY1yq7kiJZH20GbMftB1HMykD7Z5MOcTXcswsHK8F8YBIhWTcYKM0zx+MlWku5
         uKaPDC+C7MgJuXqMhqN7wGQv11IJ8LX1IRPTZqJHofnVjQFWWOzobPNIGjWGr0iVTAC1
         qY35QpGO/3b5hWnyGasq9spuBMHd+zuxPFtVDQIbCI3OSgU+8TDfpME3AFPtwUMRNuC+
         SKpiHO7nvDSsP8Lc8CBsdBkgfzNkxf6H/78XflX9dMLCB9s2yuxrkRPpuA2W+KB3qSeT
         zFxZbqEubt/gir7C97TP2h4j+8P1iCG64r4F+6rxhzbAGSLIuldQdJK97Vw8+FWrG4cv
         5pOg==
X-Gm-Message-State: AOJu0YzVWT27STEiYspXMIUCJ0ND/Xw+SSlS9P1IOWXZNifzehCJeT6O
        hVvr/yJlDAuhT4yxZqU+Ig1+Qw==
X-Google-Smtp-Source: AGHT+IH00+tV1bGMcXvYwvLyk4oWQk4sL5VjbSn7UBIU7UP3iUASzxqShb0ed+iHa1oDGFOr3aoYMg==
X-Received: by 2002:a05:6512:3151:b0:500:adc6:141d with SMTP id s17-20020a056512315100b00500adc6141dmr2918641lfi.45.1693142735001;
        Sun, 27 Aug 2023 06:25:35 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t9-20020ac243a9000000b004faa2de9877sm1142040lfl.286.2023.08.27.06.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 06:25:34 -0700 (PDT)
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
Subject: [PATCH v5 10/37] ARM: dts: qcom: mdm9615: fix PMIC node labels
Date:   Sun, 27 Aug 2023 16:24:58 +0300
Message-Id: <20230827132525.951475-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230827132525.951475-1-dmitry.baryshkov@linaro.org>
References: <20230827132525.951475-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Change PM8018 node labels to start with pm8018_ prefix, following other
Qualcomm PMIC device nodes.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548.dtsi |  2 +-
 arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi        | 14 +++++++-------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548.dtsi b/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548.dtsi
index 92c8003dac25..dac3aa793f71 100644
--- a/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548.dtsi
@@ -76,7 +76,7 @@ reset-out-pins {
 	};
 };
 
-&pmicgpio {
+&pm8018_gpio {
 	usb_vbus_5v_pins: usb-vbus-5v-state {
 		pins = "gpio4";
 		function = "normal";
diff --git a/arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi b/arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi
index fc4f52f9e9f7..c4cfbdbcdf14 100644
--- a/arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi
@@ -263,7 +263,7 @@ qcom,ssbi@500000 {
 			reg = <0x500000 0x1000>;
 			qcom,controller-type = "pmic-arbiter";
 
-			pmicintc: pmic {
+			pm8018: pmic {
 				compatible = "qcom,pm8018", "qcom,pm8921";
 				interrupts = <GIC_PPI 226 IRQ_TYPE_LEVEL_HIGH>;
 				#interrupt-cells = <2>;
@@ -274,38 +274,38 @@ pmicintc: pmic {
 				pwrkey@1c {
 					compatible = "qcom,pm8018-pwrkey", "qcom,pm8921-pwrkey";
 					reg = <0x1c>;
-					interrupt-parent = <&pmicintc>;
+					interrupt-parent = <&pm8018>;
 					interrupts = <50 IRQ_TYPE_EDGE_RISING>,
 						     <51 IRQ_TYPE_EDGE_RISING>;
 					debounce = <15625>;
 					pull-up;
 				};
 
-				pmicmpp: mpps@50 {
+				pm8018_mpps: mpps@50 {
 					compatible = "qcom,pm8018-mpp", "qcom,ssbi-mpp";
 					interrupt-controller;
 					#interrupt-cells = <2>;
 					reg = <0x50>;
 					gpio-controller;
 					#gpio-cells = <2>;
-					gpio-ranges = <&pmicmpp 0 0 6>;
+					gpio-ranges = <&pm8018_mpps 0 0 6>;
 				};
 
 				rtc@11d {
 					compatible = "qcom,pm8018-rtc", "qcom,pm8921-rtc";
-					interrupt-parent = <&pmicintc>;
+					interrupt-parent = <&pm8018>;
 					interrupts = <39 IRQ_TYPE_EDGE_RISING>;
 					reg = <0x11d>;
 					allow-set-time;
 				};
 
-				pmicgpio: gpio@150 {
+				pm8018_gpio: gpio@150 {
 					compatible = "qcom,pm8018-gpio", "qcom,ssbi-gpio";
 					reg = <0x150>;
 					interrupt-controller;
 					#interrupt-cells = <2>;
 					gpio-controller;
-					gpio-ranges = <&pmicgpio 0 0 6>;
+					gpio-ranges = <&pm8018_gpio 0 0 6>;
 					#gpio-cells = <2>;
 				};
 			};
-- 
2.39.2

