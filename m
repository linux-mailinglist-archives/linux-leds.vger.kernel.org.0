Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9D95789E13
	for <lists+linux-leds@lfdr.de>; Sun, 27 Aug 2023 15:26:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230245AbjH0N0N (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 27 Aug 2023 09:26:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229875AbjH0NZi (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 27 Aug 2023 09:25:38 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDA311A3
        for <linux-leds@vger.kernel.org>; Sun, 27 Aug 2023 06:25:31 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-500b3f7f336so1094589e87.1
        for <linux-leds@vger.kernel.org>; Sun, 27 Aug 2023 06:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693142730; x=1693747530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ii+ERiIP/+rN5/93TQF2YXZBm9/0F6AmtInKGYg6uG8=;
        b=Nndiir1OQQ7p/7CLL+lR/kRb9CUERsWcu9dlmakFHvzaIW4syRNedOD8xCtqe3hqjU
         YQuO4bHUVhIxZyPgO9pv9JLqdvjC5tSPs6FQDzG3dQKXUWzkH6yNpWa164UCB1SLsIzO
         qv242zq3UX8BYST8xL1/YGgZdaQHTecGgS9JifRByvZRlDd7Gv8GAbkGuJ90v0pZWi/V
         CAdQ5PkjlcJIWXHZceRaZsT9IjHPecnGpaSncjDZ8sqcj1BWDmNjPr5xzbtIf7jmRPjN
         3GOtOpFH2X8PFqJUKho6Enw/MtD3gSb6ggfaJ4Ycf9sCgOkxF6SsA23tB3tiyVuNt3DJ
         vgHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693142730; x=1693747530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ii+ERiIP/+rN5/93TQF2YXZBm9/0F6AmtInKGYg6uG8=;
        b=WbrQmu9joja8e8/KVpJP2XK+qEukm1jDM01P38joXswtWk0u5jRYEp4dWLqamNp+8f
         V/ZeB21lEZvuPBCp3w0986NoPRAFPNNHV6y+4FUebofaxDE87XLGWd1aweNFhRj45lME
         lOgc89yrQuXleevpKbInip3HuDx/ns0qX68yFj8rkqlxhMvRSd9LDnhwsm7hZPWlWfYY
         NTP4PzDFc+5achF4OEt7IBZjKeKuG/MQISgzv7h8WmHSerCY6spsOvwMdj4K1wRbClLm
         shXcDCL5Y7XJ7BsKxx2jrIpLdr2gvntN2smSwOJdHTOs0eEcKmVJqHfJhQd+PLzV2TRi
         WwwA==
X-Gm-Message-State: AOJu0YzuyLxcVYxrOIAgbHTyF9kVlQnva2cTkgxziuPX2qjmWkFj3RJf
        x+TkOgP7nEdGZCF/r+APfs0RFg==
X-Google-Smtp-Source: AGHT+IGhq0bpnyxKqxSd9Fl56JBgkUGGFQvUfCW1+9wkRnF0gwFyHjGyOhv3NyqP1bhH88dLdegG9A==
X-Received: by 2002:ac2:4c28:0:b0:500:78ed:353d with SMTP id u8-20020ac24c28000000b0050078ed353dmr12514261lfq.58.1693142730294;
        Sun, 27 Aug 2023 06:25:30 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t9-20020ac243a9000000b004faa2de9877sm1142040lfl.286.2023.08.27.06.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 06:25:29 -0700 (PDT)
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
Subject: [PATCH v5 04/37] ARM: dts: qcom: msm8960: introduce label for PMIC keypad
Date:   Sun, 27 Aug 2023 16:24:52 +0300
Message-Id: <20230827132525.951475-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230827132525.951475-1-dmitry.baryshkov@linaro.org>
References: <20230827132525.951475-1-dmitry.baryshkov@linaro.org>
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

To simplify MSM8960 CDP board file, add label to PMIC keypad node.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts | 20 +++++++++-----------
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi    |  2 +-
 2 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
index 6c1bc3818883..4641b4f2195d 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
@@ -88,17 +88,15 @@ clk-pins {
 	};
 };
 
-&pmicintc {
-	keypad@148 {
-		linux,keymap = <
-			MATRIX_KEY(0, 0, KEY_VOLUMEUP)
-			MATRIX_KEY(0, 1, KEY_VOLUMEDOWN)
-			MATRIX_KEY(0, 2, KEY_CAMERA_FOCUS)
-			MATRIX_KEY(0, 3, KEY_CAMERA)
-			>;
-		keypad,num-rows = <1>;
-		keypad,num-columns = <5>;
-	};
+&pm8921_keypad {
+	linux,keymap = <
+		MATRIX_KEY(0, 0, KEY_VOLUMEUP)
+		MATRIX_KEY(0, 1, KEY_VOLUMEDOWN)
+		MATRIX_KEY(0, 2, KEY_CAMERA_FOCUS)
+		MATRIX_KEY(0, 3, KEY_CAMERA)
+		>;
+	keypad,num-rows = <1>;
+	keypad,num-columns = <5>;
 };
 
 &rpm {
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index d13080fcbeea..a34fda93d6a4 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -283,7 +283,7 @@ pwrkey@1c {
 					pull-up;
 				};
 
-				keypad@148 {
+				pm8921_keypad: keypad@148 {
 					compatible = "qcom,pm8921-keypad";
 					reg = <0x148>;
 					interrupt-parent = <&pmicintc>;
-- 
2.39.2

