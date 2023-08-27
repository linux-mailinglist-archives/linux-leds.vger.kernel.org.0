Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CECC6789A06
	for <lists+linux-leds@lfdr.de>; Sun, 27 Aug 2023 03:00:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229853AbjH0BAD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 26 Aug 2023 21:00:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229905AbjH0A7c (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 26 Aug 2023 20:59:32 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B00341A6
        for <linux-leds@vger.kernel.org>; Sat, 26 Aug 2023 17:59:29 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-500aed06ffcso1673465e87.0
        for <linux-leds@vger.kernel.org>; Sat, 26 Aug 2023 17:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693097968; x=1693702768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u1RH0IG0rrFXei9V7mpYpuNzaTfiQ9cfBSSJRkGF8B0=;
        b=WPTkgF/oKrcptq3JFfbWQUp8kL4FayufKCYEg6hl45lY+Vm8Vx1QIFM9N4RQts7qYG
         yTLs3QjTuv+na9F5SPge5L1xUOIEpDnEGuF9qlGrfD6D5R9eNG1YCj2Xz803XZ+dMFBc
         7tgn/JthHBoRCRf2BpwUF/GTT1+3slkvaecvZrlL6WRCiZpL43VlWOMbbGHxkJZdnY2k
         N1oOE4DZ+c1+t1qwFmy7gtzCm2Z0E7nNX7ktFsXVlZPppOLMqLNysbuIg6ktRTI67QDj
         wrKk05vefMjIJDXnxEV+VZbfjnBB7SYPlZXv3JuNzxwD6Fu7f3vO1I8rIOBk0nRR5LMd
         rSXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693097968; x=1693702768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u1RH0IG0rrFXei9V7mpYpuNzaTfiQ9cfBSSJRkGF8B0=;
        b=cEtdKyPO3aW+3WjKSWVJNyw2yUJo9Eo4u0vjnU5jj/GdMVfRjSOdVgBycvSMq3Y2ZY
         BgEJ0i2uZTPb8XTg0f1DkosyeJwNqxAFEcnB1kRxrybA+zSpLpgFgmywt14nzLMwr0nT
         TC99cnryb9tAmPQduOY12gQcYcXOWreCv7uxyQGwcfY0+YcR4vrpv8HB4j9wxXgc5UEx
         bdS3sf4uadsH9Vx4Vgi7oF+sQa3O29MNaNHH1tBCWPoBkuRnuoobjFg7ikhjD6+hEPiH
         YH6N0yL1TZpZJY3l3eONGnOm8dO/8B5Ml80lLc/8zCUBIq7Ewmk17VFyH/S+t8irkqTB
         lmkw==
X-Gm-Message-State: AOJu0Yx+dy9F6kgApkOuqkhdP8Iq1tX9c3mIbTFiz5JVsUrFBAXPOKNl
        cZ90LIHFQp5rQjFZTX1hJuS5fQ==
X-Google-Smtp-Source: AGHT+IHTlUrGfN4ZCiOYUm0JG3rQbGvG55k+pxI/2Whuw2SkDErDuoYJFfEJX2aU+U1p3XL8hhtSEg==
X-Received: by 2002:a05:6512:ad5:b0:4f8:5604:4b50 with SMTP id n21-20020a0565120ad500b004f856044b50mr17067292lfu.64.1693097967980;
        Sat, 26 Aug 2023 17:59:27 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id p18-20020ac246d2000000b00500a08e42e7sm917729lfo.124.2023.08.26.17.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 17:59:27 -0700 (PDT)
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
Subject: [PATCH v4 06/38] ARM: dts: qcom: msm8660-surf: use keypad label directly
Date:   Sun, 27 Aug 2023 03:58:48 +0300
Message-Id: <20230827005920.898719-7-dmitry.baryshkov@linaro.org>
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

Directly use pm8058_keypad to declare keypad properties instead of
referencing pm8058 top-level node.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-msm8660-surf.dts | 50 ++++++++++----------
 1 file changed, 24 insertions(+), 26 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8660-surf.dts b/arch/arm/boot/dts/qcom/qcom-msm8660-surf.dts
index be18f1be29a1..86fbb6dfdc2a 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8660-surf.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8660-surf.dts
@@ -34,32 +34,30 @@ &gsbi12_serial {
 	status = "okay";
 };
 
-&pm8058 {
-	keypad@148 {
-		linux,keymap = <
-			MATRIX_KEY(0, 0, KEY_FN_F1)
-			MATRIX_KEY(0, 1, KEY_UP)
-			MATRIX_KEY(0, 2, KEY_LEFT)
-			MATRIX_KEY(0, 3, KEY_VOLUMEUP)
-			MATRIX_KEY(1, 0, KEY_FN_F2)
-			MATRIX_KEY(1, 1, KEY_RIGHT)
-			MATRIX_KEY(1, 2, KEY_DOWN)
-			MATRIX_KEY(1, 3, KEY_VOLUMEDOWN)
-			MATRIX_KEY(2, 3, KEY_ENTER)
-			MATRIX_KEY(4, 0, KEY_CAMERA_FOCUS)
-			MATRIX_KEY(4, 1, KEY_UP)
-			MATRIX_KEY(4, 2, KEY_LEFT)
-			MATRIX_KEY(4, 3, KEY_HOME)
-			MATRIX_KEY(4, 4, KEY_FN_F3)
-			MATRIX_KEY(5, 0, KEY_CAMERA)
-			MATRIX_KEY(5, 1, KEY_RIGHT)
-			MATRIX_KEY(5, 2, KEY_DOWN)
-			MATRIX_KEY(5, 3, KEY_BACK)
-			MATRIX_KEY(5, 4, KEY_MENU)
-			>;
-		keypad,num-rows = <6>;
-		keypad,num-columns = <5>;
-	};
+&pm8058_keypad {
+	linux,keymap = <
+		MATRIX_KEY(0, 0, KEY_FN_F1)
+		MATRIX_KEY(0, 1, KEY_UP)
+		MATRIX_KEY(0, 2, KEY_LEFT)
+		MATRIX_KEY(0, 3, KEY_VOLUMEUP)
+		MATRIX_KEY(1, 0, KEY_FN_F2)
+		MATRIX_KEY(1, 1, KEY_RIGHT)
+		MATRIX_KEY(1, 2, KEY_DOWN)
+		MATRIX_KEY(1, 3, KEY_VOLUMEDOWN)
+		MATRIX_KEY(2, 3, KEY_ENTER)
+		MATRIX_KEY(4, 0, KEY_CAMERA_FOCUS)
+		MATRIX_KEY(4, 1, KEY_UP)
+		MATRIX_KEY(4, 2, KEY_LEFT)
+		MATRIX_KEY(4, 3, KEY_HOME)
+		MATRIX_KEY(4, 4, KEY_FN_F3)
+		MATRIX_KEY(5, 0, KEY_CAMERA)
+		MATRIX_KEY(5, 1, KEY_RIGHT)
+		MATRIX_KEY(5, 2, KEY_DOWN)
+		MATRIX_KEY(5, 3, KEY_BACK)
+		MATRIX_KEY(5, 4, KEY_MENU)
+		>;
+	keypad,num-rows = <6>;
+	keypad,num-columns = <5>;
 };
 
 /* eMMC */
-- 
2.39.2

