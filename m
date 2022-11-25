Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CAF1638C3C
	for <lists+linux-leds@lfdr.de>; Fri, 25 Nov 2022 15:33:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230008AbiKYOdp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 25 Nov 2022 09:33:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229997AbiKYOdm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 25 Nov 2022 09:33:42 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A428130F5F
        for <linux-leds@vger.kernel.org>; Fri, 25 Nov 2022 06:33:38 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id a29so7173074lfj.9
        for <linux-leds@vger.kernel.org>; Fri, 25 Nov 2022 06:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CaRc1qhxO0e/vPCyLXyooIUxaaj3mmT/bRHWf+I1C6o=;
        b=rllN0hiG7XyWbfv7uWGTtFpLbOaOJqhaGBmD9aWBUiNax9tlNEBHXmjSbF9c26/Eba
         +AFHp1UsDS6K6fM2IxVT5aQbKNBiX24WnJMp8ZxYmneEWkvUQ+KOvsSVGCJ4r15DFlaC
         tcWi+TeKmEQzAWT7jIl9mYq+iiHuqC9Hn6/IVGtajINKDRtxLtDdDPL/LdD1MR1GhF5N
         kReqW6p5hY4vk67nh6Sq6Hjeo6nxonhZagdUsgTCW1MRyy05vSSDivLznbS3Tz2Hr0xV
         mHDcs/O02Urjc6LfcyKdla8sW71IbKljr6DuPHBzArdZwZhDWgs2lUcIf5vIt608afAt
         ramQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CaRc1qhxO0e/vPCyLXyooIUxaaj3mmT/bRHWf+I1C6o=;
        b=wF+rztLaGoNAP1JSbbx+jwk2B9JXQgmvHnDf/myFDriN0kaz69JLICcfU49I7BWAkz
         km73lf6woCGMeWcLsdfAQS5gYi8G9UH6ME7jPphZscFqE99Lhf/W0NJbIGJkmvABWlpK
         mO9608IZdm89rJY6mKYdumsOWXyiAFsDTZfRcZ31xxDHjXJGTW+0u+Nlnn3JDSsKi48l
         6W+94fdvd/fQWf0wST4abLKk+LXJgyvUv6G0U1/z/c1mqb8qk4qlfiSpxl7dp03t2Qis
         FnhDLVOdVzLVD0juvN3bJ69HQEfTWEIxHxo+RF9++jhh3HOMuqoH1zSxs1RPU19eemNO
         Cd/g==
X-Gm-Message-State: ANoB5pm4vU/V+MILwTslILDbilcHt3s15Euj1I4ZRNKHjYbURA6oKD/O
        GPQ0wgPPQHbCfjU1RQgl/bUBqg==
X-Google-Smtp-Source: AA0mqf53Qzco4DL39SHCdD1c0ZhnijrR6l5AkaJ+u6t/4ig9X8iPkpH3T2GNwfHRP6Sj0LxMTCX2lA==
X-Received: by 2002:a05:6512:3b0d:b0:4b4:7cb4:f932 with SMTP id f13-20020a0565123b0d00b004b47cb4f932mr8326296lfv.243.1669386818084;
        Fri, 25 Nov 2022 06:33:38 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id k26-20020a05651c10ba00b002798ab42fffsm312966ljn.129.2022.11.25.06.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 06:33:37 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Vincent Knecht <vincent.knecht@mailoo.org>,
        Nikita Travkin <nikitos.tr@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Andrew Davis <afd@ti.com>, Gene Chen <gene_chen@richtek.com>,
        Bjorn Andersson <andersson@kernel.org>,
        ChiYuan Huang <cy_huang@richtek.com>,
        Luca Weiss <luca@z3ntu.xyz>, - NeilBrown <neilb@suse.de>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 4/4] dt-bindings: leds: mt6360: rework to match multi-led
Date:   Fri, 25 Nov 2022 15:33:31 +0100
Message-Id: <20221125143331.473981-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221125143331.473981-1-krzysztof.kozlowski@linaro.org>
References: <20221125143331.473981-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The binding allows two type of LEDs - single and multi-color.  They
differ with properties, so fix the bindings to accept both cases.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/leds/leds-mt6360.yaml | 43 +++++++++++++++++--
 1 file changed, 39 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-mt6360.yaml b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
index 69e579226d9b..d84e28e616d7 100644
--- a/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
@@ -26,11 +26,10 @@ properties:
     const: 0
 
 patternProperties:
-  "^(multi-)?led@[0-5]$":
+  "^multi-led@[0-5]$":
     type: object
-    $ref: common.yaml#
-    description:
-      Properties for a single LED.
+    $ref: leds-class-multicolor.yaml#
+    unevaluatedProperties: false
 
     properties:
       reg:
@@ -43,6 +42,42 @@ patternProperties:
           - 4 # LED output FLASH1
           - 5 # LED output FLASH2
 
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+    patternProperties:
+      "^led@[0-2]$":
+        type: object
+        $ref: common.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          reg:
+            enum: [0, 1, 2]
+
+        required:
+          - reg
+          - color
+
+    required:
+      - reg
+      - "#address-cells"
+      - "#size-cells"
+
+  "^led@[0-5]$":
+    type: object
+    $ref: common.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties for a single LED.
+
+    properties:
+      reg:
+        enum: [0, 1, 2, 3, 4, 5]
+
 required:
   - compatible
   - "#address-cells"
-- 
2.34.1

