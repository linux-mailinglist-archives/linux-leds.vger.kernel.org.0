Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE71A5522F8
	for <lists+linux-leds@lfdr.de>; Mon, 20 Jun 2022 19:50:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239180AbiFTRup (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 20 Jun 2022 13:50:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241943AbiFTRun (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 20 Jun 2022 13:50:43 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3E7FBF5A
        for <linux-leds@vger.kernel.org>; Mon, 20 Jun 2022 10:50:40 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id fu3so22575366ejc.7
        for <linux-leds@vger.kernel.org>; Mon, 20 Jun 2022 10:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vawR+AKsr/69UkXXi73qth6MiAdc5ZxxVTAr6kwXEOY=;
        b=J4yOAnnI91X+Vinzvn0WwG64HhjEEIaLZLVcAXEQP9eVWDDTyo9uudAc8SEK3Msyh9
         ZxgBvxacfdSKgn9V+y6EMfLDSx31r7gS+JbXmocuUqlEqcHFuWULm/DR/VhgQ1zDbEvh
         yUiykLGAjjhnuqikmH59MnJERXN/zvkc8U6wKIJICWyXPLRRk6Pp9f4xypyJf7W6r9Zh
         2IXY9qKReCE7zYW6G6N4++QxVPIPQ7llQMulHDvXXX7S+V0t0i+T5FItVF9+btU0CnYW
         4Y4yvZm1PUhzLSNRy1QQcNIxOuZZyVf69tPSC2A/CU8P74twQ+8yPTf+tpXQjtmc5enr
         VBUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vawR+AKsr/69UkXXi73qth6MiAdc5ZxxVTAr6kwXEOY=;
        b=0O27bveshZ9/iodm/mrzaQicZG/1WiQUpj/IAKBmGhhHcwf8f8AyLqfbDfkq91kxTl
         zukob/X7VOeRUL2CS4q6pNsZ1EwtSmlZLAut614Hbl3va47+dJ30VUR2Ckm9mEDjVw8B
         vO0qhCF68ZEs/hWeQz971n51lC13joV4JUwnvKrQv/GQUWZfgpIzeyZsIwHMIk/gz9+v
         RW+1DPDNBijA4G7VaGYZQJR4mYbYjhuEE7t0INg0OI0EBXZLuuQCgRf/9hbNyxi5DnXK
         YFd45K7uzA6+bOa3nJDicTYjrDZUzsVreEzgJG7bZPPpx2wOxLAvgTD/v3eFoBBr/3d8
         YMEA==
X-Gm-Message-State: AJIora8v7XedEnqFAWFGib4z0Xrde2MFRpIbVeahb6TR6I5etwLMLP5j
        lUUhOf1dJg8ivyETcEGzP03BVw==
X-Google-Smtp-Source: AGRyM1t/5tJyjuc7r045NqsNdhCJ7jAP96f2MPgVeZfCzLGEwgBY51/w/4SQBTbISEMawxJtUWfbaw==
X-Received: by 2002:a17:907:7da8:b0:722:ca29:b58e with SMTP id oz40-20020a1709077da800b00722ca29b58emr3989638ejc.732.1655747440374;
        Mon, 20 Jun 2022 10:50:40 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id d13-20020a170906304d00b00704757b1debsm6346056ejd.9.2022.06.20.10.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 10:50:39 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 2/3] ARM: dts: exynos: align aat1290 flash LED node with bindings in Galaxy S3
Date:   Mon, 20 Jun 2022 19:50:32 +0200
Message-Id: <20220620175033.130468-3-krzysztof.kozlowski@linaro.org>
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

The bindings expect aat1290 flash LED child node to be named "led".

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi b/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
index aa7de6de8e19..46640b490a8c 100644
--- a/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
+++ b/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
@@ -25,7 +25,7 @@ led-controller {
 		pinctrl-1 = <&camera_flash_host>;
 		pinctrl-2 = <&camera_flash_isp>;
 
-		flash-led {
+		led {
 			label = "flash";
 			led-max-microamp = <520833>;
 			flash-max-microamp = <1012500>;
-- 
2.34.1

