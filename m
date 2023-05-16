Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 517F2705169
	for <lists+linux-leds@lfdr.de>; Tue, 16 May 2023 17:02:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233629AbjEPPCW (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 16 May 2023 11:02:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233585AbjEPPCQ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 16 May 2023 11:02:16 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5D8D5B85
        for <linux-leds@vger.kernel.org>; Tue, 16 May 2023 08:02:15 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-96aa0cab88dso831944966b.1
        for <linux-leds@vger.kernel.org>; Tue, 16 May 2023 08:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684249334; x=1686841334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VePVeWeMN4U523V4h2u5VAkH2pemNZtifrJeB9imluE=;
        b=tHUblVWXjbga/qyXdtscen1tQezhSIXXVDcOhHoYCWA8pD+7Ch8fNZrlCR6OyBxGoL
         P47/t4DREklIq5kERQ8XdLUcTUHnnIxxCFthqIXt/qw3b8VwDt/0umoWi1C/f5sysnQs
         GKx2jUgHj4NvB2L4Sw8xmGzEI5JCh2X1NNU0t6GJbdwB3GhPOWbdANoP3Vn8zKmvzQ6U
         1sCwX9ZoxY6MotNdE9zuO0fQPDWqielOVTjcf10m4Cb9TMoe/hWBi8L+r93oNWbv5g0n
         nagoRYaQk2E4XhGlehnUuCY8iWoMF5AIQvWPKdILKn/VrS+Llm9OLO7efFUs4uLMp7z8
         VrYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684249334; x=1686841334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VePVeWeMN4U523V4h2u5VAkH2pemNZtifrJeB9imluE=;
        b=eiBdCFXuzy7elQIePHmfEIJjnsia53kHwQKg95WivhRn6g87+2O8OWK15AdAVhNipg
         f+Il5rOoyb+Wit4odlUKTZaZGtfk/R/f3b/OT4iIT06GcOaS6cvoTniaEWcXKhHdoWcj
         Q0I9px87+LkbA942WtuIqiw2ChYaqxjZObGk/KwErozYltbe3qxL3di7XGTK32ZXpDTe
         Ya99yKIe05Pe3/g8vWhiwXH3620MDomaNjm1WXZ3lGdDT2HRm10Q+H21jzmYspU4tnNZ
         bprTqfaZATiG13erv1xQd3afweS44ytrYZpjSr3TJzpVTNHBhsoYwK6LlRZzYuSTjZ/l
         +dEA==
X-Gm-Message-State: AC+VfDyzmUwwwryWq0HKmWvNRln48oatX9gp8nFEp79NwsQ2BE5Gwxw5
        yO6fToXN/KWLJB+Uz2/iv0Pxwg==
X-Google-Smtp-Source: ACHHUZ5VH9AGY5veDnFd4MlMOrguGe+tiiK2Z58ztuVDR7pEcisRKFXyJPLhKkTJ6Zzsc1k7+szcEA==
X-Received: by 2002:a17:907:961d:b0:966:6056:a7c1 with SMTP id gb29-20020a170907961d00b009666056a7c1mr32801710ejc.74.1684249333756;
        Tue, 16 May 2023 08:02:13 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:77d1:16a1:abe1:84fc])
        by smtp.gmail.com with ESMTPSA id q24-20020a170906541800b0096aa7d25a65sm6361810ejo.23.2023.05.16.08.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 08:02:13 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Fenglin Wu <quic_fenglinw@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Neil Armstrong <neil.armstrong@linaro.org>,
        "Signed-off-by : Abel Vesa" <abel.vesa@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/3] arm64: dts: qcom: sm8550-qrd: add flash LEDs
Date:   Tue, 16 May 2023 17:02:02 +0200
Message-Id: <20230516150202.188655-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230516150202.188655-1-krzysztof.kozlowski@linaro.org>
References: <20230516150202.188655-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Enable PM8550 PMIC flash LED controller and add two flash LEDs using
four current outputs.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Context in the patch depends on:
https://lore.kernel.org/linux-arm-msm/20230516133011.108093-1-krzysztof.kozlowski@linaro.org/T/#t
---
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index 88b7d3ecdbc9..30b36a149125 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sm8550.dtsi"
 #include "pm8010.dtsi"
@@ -451,6 +452,30 @@ &pcie0_phy {
 	status = "okay";
 };
 
+&pm8550_flash {
+	status = "okay";
+
+	led-0 {
+		function = LED_FUNCTION_FLASH;
+		color = <LED_COLOR_ID_YELLOW>;
+		led-sources = <1>, <4>;
+		led-max-microamp = <500000>;
+		flash-max-microamp = <2000000>;
+		flash-max-timeout-us = <1280000>;
+		function-enumerator = <0>;
+	};
+
+	led-1 {
+		function = LED_FUNCTION_FLASH;
+		color = <LED_COLOR_ID_WHITE>;
+		led-sources = <2>, <3>;
+		led-max-microamp = <500000>;
+		flash-max-microamp = <2000000>;
+		flash-max-timeout-us = <1280000>;
+		function-enumerator = <1>;
+	};
+};
+
 &pm8550b_eusb2_repeater {
 	vdd18-supply = <&vreg_l15b_1p8>;
 	vdd3-supply = <&vreg_l5b_3p1>;
-- 
2.34.1

