Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB9DF789E36
	for <lists+linux-leds@lfdr.de>; Sun, 27 Aug 2023 15:27:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230257AbjH0N0S (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 27 Aug 2023 09:26:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230009AbjH0NZo (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 27 Aug 2023 09:25:44 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79ED0CD5
        for <linux-leds@vger.kernel.org>; Sun, 27 Aug 2023 06:25:37 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-50078e52537so3580384e87.1
        for <linux-leds@vger.kernel.org>; Sun, 27 Aug 2023 06:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693142736; x=1693747536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wblF4wah6BmHW/8HH3+se0OjDANdbSlRJHajeFa81aM=;
        b=YHcUUrRC28KR8w7s5F9qTMJ1jgOFqHcB3bgP7DurRisHJuxxeybXUwtlag5fVmMSkG
         uo2c7XX5MdXGvoiFqqfJrjdkuqDPC8APkEZmBf3stj8FITYG+k38vCYcXbiXqLZQegd+
         IFsJrAc8pJw5Vhxmrja/rYje92X4xmDvdes6NnC13BWvPmNgFmQftMaRSgj4iq93byWO
         TSenRS1n0TVBqr2L281AVmKAYs4pxzXFiwovRoJ8R5+95FcliAnfOnauAK2Bkn4EhEGo
         Xe7LfjlKDzbJ2MyJrDKIs5mee9M7MzAku4Sx8pd9OKLA9pfSL9XtPfm40AcqYZNMUT4X
         aVmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693142736; x=1693747536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wblF4wah6BmHW/8HH3+se0OjDANdbSlRJHajeFa81aM=;
        b=dJ/p2I+1ywnqWp8hWf5jQQuFTqpdwqgc2kSDD9uasa3D0PETbTNX8qbQmerfLk6mHT
         eWMIpZe8ToQEeaMkSQdIRB6Ox5coXpBH+ghXuGrIPIFp/wsCtAumvhakt8DmM7moYAyd
         sAm6yuFb7LHECiPiTungxk5wCh18QPCkIAwTxtctXd2GBBETXAj3FsxLnmBDPAFkfZBr
         AKg7oU9jY99Lq6on0n1fOij8hKTDbvwg/91+MqD+a/CE+J2mF2n0DQxg98dIxKWlHEpp
         cSthUgqOF8qa2IH3fZYqL5MznCYDjjlSQFodFpNrSQlwRV6rN34/jFVbTWXFeTMToVyE
         aoQQ==
X-Gm-Message-State: AOJu0Yy6l8cuu4qawQAJ1mYtQekVlvE7Pf4hKCV/7GJa/uCoJAxEuOK9
        IbqdqC6ibtjId1gN0xjn7FSM6A==
X-Google-Smtp-Source: AGHT+IFrUvvK1xvOctp+Te+KrtKd5TSuL3Y1H1Ji8eYULGskIoqBEu+gpP8PcRJx2mQeShYsBw5h4g==
X-Received: by 2002:a05:6512:a8f:b0:4fe:8c01:32ac with SMTP id m15-20020a0565120a8f00b004fe8c0132acmr22066839lfu.41.1693142735810;
        Sun, 27 Aug 2023 06:25:35 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t9-20020ac243a9000000b004faa2de9877sm1142040lfl.286.2023.08.27.06.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 06:25:35 -0700 (PDT)
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
Subject: [PATCH v5 11/37] ARM: dts: qcom: msm8660: fix PMIC node labels
Date:   Sun, 27 Aug 2023 16:24:59 +0300
Message-Id: <20230827132525.951475-12-dmitry.baryshkov@linaro.org>
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

Change PM8058 node labels to start with pm8058_ prefix, following other
Qualcomm PMIC device nodes.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../boot/dts/qcom/qcom-apq8060-dragonboard.dts   |  4 ++--
 arch/arm/boot/dts/qcom/qcom-msm8660.dtsi         | 16 ++++++++--------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts b/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts
index db4c791b2e2f..48fd1a1feea3 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts
@@ -72,7 +72,7 @@ cm3605 {
 		/* Trig on both edges - getting close or far away */
 		interrupts-extended = <&pm8058_gpio 34 IRQ_TYPE_EDGE_BOTH>;
 		/* MPP05 analog input to the XOADC */
-		io-channels = <&xoadc 0x00 0x05>;
+		io-channels = <&pm8058_xoadc 0x00 0x05>;
 		io-channel-names = "aout";
 		pinctrl-names = "default";
 		pinctrl-0 = <&dragon_cm3605_gpios>, <&dragon_cm3605_mpps>;
@@ -945,7 +945,7 @@ irq-pins {
 	};
 };
 
-&xoadc {
+&pm8058_xoadc {
 	/* Reference voltage 2.2 V */
 	xoadc-ref-supply = <&pm8058_l18>;
 
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8660.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8660.dtsi
index 78023ed2fdf7..9217ced108c4 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8660.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8660.dtsi
@@ -80,13 +80,13 @@ sleep-clk {
 	 */
 	iio-hwmon {
 		compatible = "iio-hwmon";
-		io-channels = <&xoadc 0x00 0x01>, /* Battery */
-			    <&xoadc 0x00 0x02>, /* DC in (charger) */
-			    <&xoadc 0x00 0x04>, /* VPH the main system voltage */
-			    <&xoadc 0x00 0x0b>, /* Die temperature */
-			    <&xoadc 0x00 0x0c>, /* Reference voltage 1.25V */
-			    <&xoadc 0x00 0x0d>, /* Reference voltage 0.625V */
-			    <&xoadc 0x00 0x0e>; /* Reference voltage 0.325V */
+		io-channels = <&pm8058_xoadc 0x00 0x01>, /* Battery */
+			      <&pm8058_xoadc 0x00 0x02>, /* DC in (charger) */
+			      <&pm8058_xoadc 0x00 0x04>, /* VPH the main system voltage */
+			      <&pm8058_xoadc 0x00 0x0b>, /* Die temperature */
+			      <&pm8058_xoadc 0x00 0x0c>, /* Reference voltage 1.25V */
+			      <&pm8058_xoadc 0x00 0x0d>, /* Reference voltage 0.625V */
+			      <&pm8058_xoadc 0x00 0x0e>; /* Reference voltage 0.325V */
 	};
 
 	soc: soc {
@@ -390,7 +390,7 @@ pm8058_keypad: keypad@148 {
 					row-hold = <91500>;
 				};
 
-				xoadc: xoadc@197 {
+				pm8058_xoadc: xoadc@197 {
 					compatible = "qcom,pm8058-adc";
 					reg = <0x197>;
 					interrupts-extended = <&pm8058 76 IRQ_TYPE_EDGE_RISING>;
-- 
2.39.2

