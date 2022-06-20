Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02277552301
	for <lists+linux-leds@lfdr.de>; Mon, 20 Jun 2022 19:51:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239566AbiFTRur (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 20 Jun 2022 13:50:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243939AbiFTRup (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 20 Jun 2022 13:50:45 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2A78BE10
        for <linux-leds@vger.kernel.org>; Mon, 20 Jun 2022 10:50:42 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id kq6so22534502ejb.11
        for <linux-leds@vger.kernel.org>; Mon, 20 Jun 2022 10:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rKzakFWTWfXnseWFxBBYL7rUhvEO3Gskk+MqcotQ/qY=;
        b=yIVgS9Y91nbzr8uBT04DsbQA9t181ktdKZK1yQ1Jd0jKWaq0vfYcdwzJX+kMCUQgNu
         fCnhGuF9JSDQwTvwhLq7ipEncinHboQIAc/p0/uYRFrsbtH6RqT+7iA3zTfs1cKvJjw5
         5z+d38zbnp//cd0i6KRjv2cljC6IfsNNbUGkJOa8PxUbYC/3abULforXc1xvrhRFDbsJ
         lwyJeYXnbR/teUzWlgtm6WWZ3JrkBL5xPL6DoP3FnsEMdaRa9bD+xBQu0DrYQE6BWTYC
         VeFy+G+h1+OzcF4FLjjJ8RwQU3vPWtlYZ1NbcHBCJ8MYmexvspuYlGU7kJhBAVfDI0Su
         lDqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rKzakFWTWfXnseWFxBBYL7rUhvEO3Gskk+MqcotQ/qY=;
        b=vlKmw6Pxc7bsv+GZXzEqUJ1f6TUH0FBlJXBG5jzA3Bo3ZdhT3tQi89rj89BjEnC4Cx
         7T1cGhpZfvvwxJ0YxK6hw+lVN8vvnCVKk4H3czf92tXmy+Lcp6mtMg5WkB7s7sU3NT2c
         rpo6JjuRuWMoCE4AqJv8UghRC/MyhfW//nvikCd5PFrSE/aYj+z+Z/c4ic2RKiNPCFZJ
         jD4fkBxONH6ZilqTPpVRZI+XflOyXj2dmNACmoJcuZabbkp7Lj6dPgTCAdxFXjeYd9W/
         anEbaw+SR2tkdsMB4pNUqV73jX2HLKK6LxglFU2aFMS7fhgSnGDanyFUUYo9Or0Rllb8
         fwZg==
X-Gm-Message-State: AJIora+LgE1VUoEIGdRA10H7YSxM3UTMlhIEfHyJR6yG9lxZrAOMoylk
        OnlbapOZ4aHWQfQDxCmFZWohoA==
X-Google-Smtp-Source: AGRyM1t9bF4JL2oWNx9ovmlEKyx935aEBmGrCjUM2UYWrD9twYvEViy3XSehfyIez9QJ1xt1hpTghg==
X-Received: by 2002:a17:907:da2:b0:711:f408:f098 with SMTP id go34-20020a1709070da200b00711f408f098mr21972885ejc.208.1655747441492;
        Mon, 20 Jun 2022 10:50:41 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id d13-20020a170906304d00b00704757b1debsm6346056ejd.9.2022.06.20.10.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 10:50:41 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 3/3] ARM: dts: exynos: add function and color to aat1290 flash LED node in Galaxy S3
Date:   Mon, 20 Jun 2022 19:50:33 +0200
Message-Id: <20220620175033.130468-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175033.130468-1-krzysztof.kozlowski@linaro.org>
References: <20220620175033.130468-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add common LED properties - the function and color - to aat1290 flash
LED node in Galaxy S3, so we can drop deprecated label property.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi b/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
index 46640b490a8c..94122e9c6625 100644
--- a/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
+++ b/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
@@ -7,6 +7,7 @@
  */
 
 /dts-v1/;
+#include <dt-bindings/leds/common.h>
 #include "exynos4412-midas.dtsi"
 
 / {
@@ -26,7 +27,8 @@ led-controller {
 		pinctrl-2 = <&camera_flash_isp>;
 
 		led {
-			label = "flash";
+			function = LED_FUNCTION_FLASH;
+			color = <LED_COLOR_ID_WHITE>;
 			led-max-microamp = <520833>;
 			flash-max-microamp = <1012500>;
 			flash-max-timeout-us = <1940000>;
-- 
2.34.1

