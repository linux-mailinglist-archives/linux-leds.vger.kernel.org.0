Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DC4D57BB7E
	for <lists+linux-leds@lfdr.de>; Wed, 20 Jul 2022 18:37:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229456AbiGTQhi (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 20 Jul 2022 12:37:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231625AbiGTQhg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 20 Jul 2022 12:37:36 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6809358854
        for <linux-leds@vger.kernel.org>; Wed, 20 Jul 2022 09:37:32 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id bp17so31181978lfb.3
        for <linux-leds@vger.kernel.org>; Wed, 20 Jul 2022 09:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kp8iCiN1Lxt5s2kzJFzxbS/dwJfrlU9B2NVr6P7nJY4=;
        b=cw76WH5XkBndt8XkuIVyL5Z10zdQ9KgHP3PcvXoTiEC3ELZK8dHW/cgRWjpusfaNAP
         yr2HqqYHUgj1WnflMsZa+nxp5qe8ACM2Ao4tsH4SS8NpGRvCJmD3c3XMcSmZoa5gTRV6
         FjF9mG5o4Yui7CqgkyMTD88qrKxhaqwDCbQZrcR/4+kCVj+G3EJ/CfYeiLW2aBFlyVbU
         ffFnGFK9K9hfUS60ffYlTfbs/LSvvZrYWtYzeatqJO3tTxCdQWV4ozrBljSo+pgfrddy
         lKyaQA4mxWe/AYbAYWemtU8efbW921gTgT1oKA/kcWdf0HkrNTVkUmxsDnvXfA7DGrHR
         oZbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kp8iCiN1Lxt5s2kzJFzxbS/dwJfrlU9B2NVr6P7nJY4=;
        b=hgNG+wqe4k+WeKNr1PPgkwMDTLvAzdEMt7HBX0nfme+hmvuxB34g7B1BhTDLcvDbYR
         9+5eGpvSBhiiHKhv4oL+JWqviNJZbsVt3TrW/wrrd+hFlsN+/I0UbjK6GTo32VXCI21/
         veLIHXk9YNCkvUNAErXZpc1yy7HJwgwkQix3YdxPwe9WAEG53KQ4pEyQYVYK+aFzY8Ce
         3U1ZFF9SX8v2rCCJhTfsUSc/g1t7kCRO4XpADScIjOWcL+gAnAh6VnRMNX9Ew9DQv3IC
         +GE4fe7TswsHCioZo4wc1PsfDOKONi0th/fkYUe9LeQR4Fl70eAt+oyuMq3rVUY2g86I
         ZS9g==
X-Gm-Message-State: AJIora9Wpjoa0j9TAL+PFMLehUtoPahxJbdIAiZPGd6ICrKQxIg2k/3U
        F2z5K24QOleCzxuGCSFydHYV8A==
X-Google-Smtp-Source: AGRyM1u7LbBSTLIdP8XMWj8CWDvGif493sK4UA0Un1erHq3+g9Xxi6JABJUt6y0RHWcWjfA3cBeN+w==
X-Received: by 2002:a19:dc06:0:b0:48a:103a:82ee with SMTP id t6-20020a19dc06000000b0048a103a82eemr19275725lfg.87.1658335050731;
        Wed, 20 Jul 2022 09:37:30 -0700 (PDT)
Received: from krzk-bin.. (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id 27-20020ac25f5b000000b0047255d210e4sm3913409lfz.19.2022.07.20.09.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 09:37:30 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kiran Gunda <kgunda@codeaurora.org>,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH RESEND] dt-bindings: leds: qcom-wled: fix number of addresses
Date:   Wed, 20 Jul 2022 18:37:20 +0200
Message-Id: <20220720163720.7099-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On PM660L, PMI8994 and PMI8998, the WLED has two address spaces.  This
also fixes dtbs_check warnings like:

  arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb: leds@d800: reg: [[55296], [55552]] is too long

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
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
2.34.1

