Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A06A51C43A
	for <lists+linux-leds@lfdr.de>; Thu,  5 May 2022 17:48:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381430AbiEEPvv (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 5 May 2022 11:51:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348946AbiEEPvu (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 5 May 2022 11:51:50 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5799A5A599
        for <linux-leds@vger.kernel.org>; Thu,  5 May 2022 08:48:10 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id c11so6655816wrn.8
        for <linux-leds@vger.kernel.org>; Thu, 05 May 2022 08:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dz2crOFWGnc2tJ+5hQ8HTWioTwYzhB3xpGSgL65wUTY=;
        b=GqeinuOtqa1AEtAicabrscRJxIs3Scd/kwKKyrpshrbaEhyDFuuHVDUT9W0FjGH/O9
         Dzn3F7QwFZ9yUm5LYk7KJPIGzA6iGfQZGrANT/MBD8doRfwQQ9TM9gnFc4ef3A+Ykl99
         HVMn8HKN11pHoAedERmk/JBJwoXydTqvJfIByWYS1Wdm67oy+vXf0t9s3QSEyUAzAYbV
         kv0MVbjlMiO3JrZgfkNZs+5o67kMEW8ka9oCnjpEKkUotqQ4VobwaPHwEsoNRAncRzkZ
         q83vnji0w+UhEoNAhlOEZFEDDROEmoL9/+EqRAt2lpBWx7dPlj7kHW+YfcIJ4vLcf/SJ
         DSCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dz2crOFWGnc2tJ+5hQ8HTWioTwYzhB3xpGSgL65wUTY=;
        b=YFu9jMBwXqLOqBciGi5N5/J57nExasPmINnUiQ6xeqj/d40wOaOWuCpj8Ym/qsQb1h
         V6pnWCFqPrhbikTHOj7sboKpiAV97Ei854/n9jipdrb2Jz6U7gfunQ1VD/2shtz4HRz7
         nkB+QDR3md/GqQxdc3LVlRiXocSONKjnJwja4SRFfGe5PRcsD/j67R9n7MDOCUl5GYPX
         yxFzbqcXJ6/pcSGGbHuh9wcq+UEX73kDw9rIAA4EP8ZAfm0CWa0Fi9d0RfB14Vbu+tEj
         5zQ4SoUMkkkXdVM+Xw/RjHg0fz3Qv+Yh+MxIJFhK7s4AZMlw8sU/RFTnFFUwPr2/COzY
         Pb8A==
X-Gm-Message-State: AOAM5303kFdeIsgR6EMfw3X7peFyWgaiv1yC6LNvkoPiNFf8jBxWKXDq
        8plELM3qSml8qA/9y0iDCaHreA==
X-Google-Smtp-Source: ABdhPJyhm76mmw60HuLdnLYEnXvHtF5RCkTbMn+Kpn9N0N4Ki2TPnopccaMJ6t3VUM1zDG+1gIrq1w==
X-Received: by 2002:adf:fd4a:0:b0:20a:cee3:5abf with SMTP id h10-20020adffd4a000000b0020acee35abfmr21761822wrs.522.1651765688972;
        Thu, 05 May 2022 08:48:08 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id c14-20020adffb0e000000b0020c6fa5a797sm1518956wrr.91.2022.05.05.08.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 08:48:08 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kiran Gunda <kgunda@codeaurora.org>,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] dt-bindings: leds: qcom-wled: fix number of addresses
Date:   Thu,  5 May 2022 17:47:01 +0200
Message-Id: <20220505154702.422108-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
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

On PM660L, PMI8994 and PMI8998, the WLED has two address spaces.  This
also fixes dtbs_check warnings like:

  arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb: leds@d800: reg: [[55296], [55552]] is too long

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/leds/backlight/qcom-wled.yaml    | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
index 5d66c3e4def5..4c15693f7a01 100644
--- a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
+++ b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
@@ -26,7 +26,8 @@ properties:
       - qcom,pm8150l-wled
 
   reg:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
 
   default-brightness:
     description: |
@@ -171,6 +172,9 @@ allOf:
 
     then:
       properties:
+        reg:
+          maxItems: 1
+
         qcom,current-boost-limit:
           enum: [ 105, 385, 525, 805, 980, 1260, 1400, 1680 ]
           default: 805
@@ -189,6 +193,9 @@ allOf:
 
     else:
       properties:
+        reg:
+          minItems: 2
+
         qcom,current-boost-limit:
           enum: [ 105, 280, 450, 620, 970, 1150, 1300, 1500 ]
           default: 970
-- 
2.32.0

