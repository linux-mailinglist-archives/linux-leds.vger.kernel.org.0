Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 012D0789E78
	for <lists+linux-leds@lfdr.de>; Sun, 27 Aug 2023 15:27:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229594AbjH0N0a (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 27 Aug 2023 09:26:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230128AbjH0NZy (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 27 Aug 2023 09:25:54 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C173194
        for <linux-leds@vger.kernel.org>; Sun, 27 Aug 2023 06:25:48 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-500b66f8b27so533515e87.3
        for <linux-leds@vger.kernel.org>; Sun, 27 Aug 2023 06:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693142747; x=1693747547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k892yPv/128pmT+0c+CLRewxWCJSJdHIcCP1VlRPxE4=;
        b=Dcceytd10U+efXAllIQuTl4dE0/FIHG+O1s2ghx3XNFeXn6TRu+owWywlyUFhzFSVq
         EGpd8bxNqCQqGWbUL/17/O6urj+TkCzsXvP7uoO3J70eLF/naaeycIMtr7Gxr3r0WHXp
         lUsEMcXFv2inb5w6YNO1Rl13hcs1uveddl6vJ7mwByMuLdWJDlL/YynItlMl7ZjoYqx1
         zZXZlYEOAeE1xFNsWZrlM8v4fW17iq5lAEHyNwEp64hTM2Z9KqKt9p8RYq3A1aCodgmr
         wbvJ5WVCyhjdMZfLduooCDhJ++ilZguaroxZ6jGOpv2wnGelV/jv7PV8gxNksYV3yt9b
         QmDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693142747; x=1693747547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k892yPv/128pmT+0c+CLRewxWCJSJdHIcCP1VlRPxE4=;
        b=Whdzp5RE1N7m1N8LzcQlV2dEFSmOYRndk+9xlcX1NKibVo+oOP6eepmoYeigVi7ZqX
         BCJvLg1RKxy4ZdS0HEzkvR8AUcqPEwYl64dupBqKxmHuB7kh9h1Fa9DGD+I5PJL1adyu
         XuSE/UTJyeCWtbdvucdsEZAWTylzAhCUfk9gkc334wIBR2TQ758XjrXRSnqporD3HZ0q
         jQYTv51JpeuvdmYyaVvIlu58crnDqc8O1nJFnTVXBwOBLhE1TAeH51+9G1IGqYVyYbPI
         80RQqqxKdGhX6Fq+de2qtDA+2sGfBmDhA5/ePZwPKhSqamiR2j57cEn5lar1iHZjPPAi
         AFyw==
X-Gm-Message-State: AOJu0Yy2xj8wSjjoW2wUy8gO68RJ5qUZc+QHv5Z1auDNJRqTWz/LF1X8
        mkYlDFIBrZiQZcuOZwXFQYnEQQ==
X-Google-Smtp-Source: AGHT+IGsw3Lfewz3MmsX4swNWn9D6sHSk0RwXB5nQr/I1XdwjxgHosQ112QZtklJs5ODaeWxute4Ag==
X-Received: by 2002:a05:6512:1186:b0:4f8:752f:3722 with SMTP id g6-20020a056512118600b004f8752f3722mr15266048lfr.5.1693142746838;
        Sun, 27 Aug 2023 06:25:46 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t9-20020ac243a9000000b004faa2de9877sm1142040lfl.286.2023.08.27.06.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 06:25:46 -0700 (PDT)
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
Subject: [PATCH v5 24/37] ARM: dts: qcom: pm8921: move reg property
Date:   Sun, 27 Aug 2023 16:25:12 +0300
Message-Id: <20230827132525.951475-25-dmitry.baryshkov@linaro.org>
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

Move reg property to come after compatible.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/pm8921.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/pm8921.dtsi b/arch/arm/boot/dts/qcom/pm8921.dtsi
index 4697ca33666f..fa00b57e28b9 100644
--- a/arch/arm/boot/dts/qcom/pm8921.dtsi
+++ b/arch/arm/boot/dts/qcom/pm8921.dtsi
@@ -31,9 +31,9 @@ pm8921_mpps: mpps@50 {
 
 		rtc@11d {
 			compatible = "qcom,pm8921-rtc";
+			reg = <0x11d>;
 			interrupt-parent = <&pm8921>;
 			interrupts = <39 IRQ_TYPE_EDGE_RISING>;
-			reg = <0x11d>;
 			allow-set-time;
 		};
 
-- 
2.39.2

