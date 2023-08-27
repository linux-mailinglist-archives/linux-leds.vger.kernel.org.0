Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD222789E7F
	for <lists+linux-leds@lfdr.de>; Sun, 27 Aug 2023 15:28:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230156AbjH0N0d (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 27 Aug 2023 09:26:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230158AbjH0NZ4 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 27 Aug 2023 09:25:56 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB1E3CC2
        for <linux-leds@vger.kernel.org>; Sun, 27 Aug 2023 06:25:50 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-500b6456c7eso568799e87.2
        for <linux-leds@vger.kernel.org>; Sun, 27 Aug 2023 06:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693142749; x=1693747549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dm6eWdkXRtbkiE6yiEQEBoDe5iM/WM4eQNZl22nI37Q=;
        b=dqk6Qr9ZRSqA+tKI1INi3WqSpVe2SXSxKx1gQJSn26GvzVgTCa/8YKE/FDXHcTNO3r
         D6dhDM7FvPQaiRQFwJGKJdF9lyHpaQkbuGrJXRQKryLNriMIyZI9TDXEwgJRIoLhVIIv
         nwja2OIgZJic3NpnLcpqDoDDeyD/Yo7DjlbK86liSsIctMBpPhU9PaCx/4Y/24WevI4a
         +x4C8UH0/gcTycf4HL36ORe8pmBE7yUYHyGDI9DTzd4V0ykkV0t0yIotGrNNDSeHwr5A
         wP3PsgfVZ+3Hb/rsztqLEQBlSyKbjlGo1M03LzeHNZZ/zjrwlQC1z9PedkAITndGCF7x
         y11A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693142749; x=1693747549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dm6eWdkXRtbkiE6yiEQEBoDe5iM/WM4eQNZl22nI37Q=;
        b=b5xBPHh2ZlXrxW2BCmFQB5csjCxiPRzZLbdekANSiPpRSqtdQbpPJj8GXaDuwX8pAJ
         UhuXZ2fkvqj/jnnoKppF8iyXlmuTNVJF5P0aBtmBhqMJzi9PZEIuJiKnU0ebN42BuA7U
         ioh77WTkVx0uODI0z3BrIs/QelO+G+78G9R3SFUEm2MhTZoW9NXbeS3zHYNVo9Tvy9UW
         ZQ1IAlEPfGvNuTNBtO0qJyCAy+k3V4olUomRMwIylHdaIMLzE2bUx1WdVTP0rz8I+Dz1
         VivG/iN6AUZ/8qFxCDkeJ2QlQ2zHj9Wgsy5rFMVuCWch2w2yez+FXYXu9+ZzicfvyNhQ
         T/HA==
X-Gm-Message-State: AOJu0YwOcaKYzocGvJYrcNl1thBXhBgHRNxQ2JnQwgD8eX0Z5a846TjK
        jynSLPrGjqPA8eU071n11WCx3Q==
X-Google-Smtp-Source: AGHT+IFZLM8m93w13h3W/Jbu8529JG6FuleG4K0czIlLFKdRMl3G2ngaNb/FU/26NyHLAInnyeu6jw==
X-Received: by 2002:ac2:5e7a:0:b0:500:7fc1:414b with SMTP id a26-20020ac25e7a000000b005007fc1414bmr12718991lfr.25.1693142749287;
        Sun, 27 Aug 2023 06:25:49 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t9-20020ac243a9000000b004faa2de9877sm1142040lfl.286.2023.08.27.06.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 06:25:48 -0700 (PDT)
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
Subject: [PATCH v5 27/37] ARM: dts: qcom: pm8018: switch to interrupts-extended
Date:   Sun, 27 Aug 2023 16:25:15 +0300
Message-Id: <20230827132525.951475-28-dmitry.baryshkov@linaro.org>
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

Merge interrups and interrupt-parent properties into a single
interrupts-extended property.

Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/pm8018.dtsi | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/pm8018.dtsi b/arch/arm/boot/dts/qcom/pm8018.dtsi
index 85ab36b6d006..22f3c7bac522 100644
--- a/arch/arm/boot/dts/qcom/pm8018.dtsi
+++ b/arch/arm/boot/dts/qcom/pm8018.dtsi
@@ -18,9 +18,8 @@ pwrkey@1c {
 			compatible = "qcom,pm8018-pwrkey",
 				     "qcom,pm8921-pwrkey";
 			reg = <0x1c>;
-			interrupt-parent = <&pm8018>;
-			interrupts = <50 IRQ_TYPE_EDGE_RISING>,
-				     <51 IRQ_TYPE_EDGE_RISING>;
+			interrupts-extended = <&pm8018 50 IRQ_TYPE_EDGE_RISING>,
+					      <&pm8018 51 IRQ_TYPE_EDGE_RISING>;
 			debounce = <15625>;
 			pull-up;
 		};
@@ -38,8 +37,7 @@ pm8018_mpps: mpps@50 {
 		rtc@11d {
 			compatible = "qcom,pm8018-rtc", "qcom,pm8921-rtc";
 			reg = <0x11d>;
-			interrupt-parent = <&pm8018>;
-			interrupts = <39 IRQ_TYPE_EDGE_RISING>;
+			interrupts-extended = <&pm8018 39 IRQ_TYPE_EDGE_RISING>;
 			allow-set-time;
 		};
 
-- 
2.39.2

