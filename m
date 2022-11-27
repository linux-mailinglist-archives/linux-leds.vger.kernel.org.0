Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3A68639CE7
	for <lists+linux-leds@lfdr.de>; Sun, 27 Nov 2022 21:41:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229731AbiK0UlW (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 27 Nov 2022 15:41:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229730AbiK0UlP (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 27 Nov 2022 15:41:15 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 128D1DFF2
        for <linux-leds@vger.kernel.org>; Sun, 27 Nov 2022 12:41:10 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id f13so14541815lfa.6
        for <linux-leds@vger.kernel.org>; Sun, 27 Nov 2022 12:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CaRc1qhxO0e/vPCyLXyooIUxaaj3mmT/bRHWf+I1C6o=;
        b=YaaN2RQTcFm9ehc3OomVgPJID3UUmIVjbjh+CTy6n8rddMuHsrrJsVgFupJb4bX7dn
         OLgeT30j5o+6DcuTUYFXzHkp9Hnht5ZLR+alchUwHgR9ci7BwLM5uDNkCEX3a5mpuOtN
         g4/rwHTJf+gyxhEG5Y7aIztzRsuOwurKdYyxElv2li+qa1X5f0XR7xflznYRwWnYeWCN
         XrBq2JFslCK+FoN86SML1aRbr//ngmo2/Tu+zJ5BF79vwreaIQ1zb2F+VlJIH2zFex5V
         a3i1f2crNl8u+BfLIOfkcnqy/Wurrj7XUWtXIVqZZkp9q52QwNzHQCukzdikgcvIxUQR
         5xpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CaRc1qhxO0e/vPCyLXyooIUxaaj3mmT/bRHWf+I1C6o=;
        b=B3Jvle0S9pWizlbgDyr68Et0W3sHbfbJKY6ovMb4zvFq869NkYZowO5r0CoV4BzpUc
         y8GFZv4Ffap91XmUSl3olZ1O69SY5V6WktexFUJEUu+Hedo7RQ4jQbTDqb0R2VBQvLuy
         XTLsfX1K1dq3B4OnrsWGIfpmKtAZMjLy0FKRAZnybMmD77fs2GhCEr8ia069bO09mJ92
         wKDPefdq8VceVV7G7zYjOsUyTI2lCYoVOBwaFewsPw3TIj4Ag5dwEs2MWd1YaPE94Uww
         MTS3yF71EJMoHNeVMpHyYNL9H/7DPAfSyEuayeuZS8ofxn2F0u0lXcm/ukTknmTsmq9m
         OmVA==
X-Gm-Message-State: ANoB5pne86viMQNSt6wihlrTBg6oo3t0GvmxPjmxaquGjTh+cf+p4zXy
        1H5r4zHqjbx24Qe2WKP2EXo79Q==
X-Google-Smtp-Source: AA0mqf4kiCEQv/GcWeelmFXWf1koVqKb26tmeRxQzTIETfLrfZpwkqyCr2NjkWpbblurW2uvjucVtQ==
X-Received: by 2002:a19:5f03:0:b0:4a2:67ea:a06 with SMTP id t3-20020a195f03000000b004a267ea0a06mr15601668lfb.580.1669581668369;
        Sun, 27 Nov 2022 12:41:08 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id bi39-20020a05651c232700b002773ac59697sm644607ljb.0.2022.11.27.12.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 12:41:08 -0800 (PST)
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
        Luca Weiss <luca@z3ntu.xyz>, Neil Brown <neilb@suse.de>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 5/6] dt-bindings: leds: mt6360: rework to match multi-led
Date:   Sun, 27 Nov 2022 21:40:57 +0100
Message-Id: <20221127204058.57111-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221127204058.57111-1-krzysztof.kozlowski@linaro.org>
References: <20221127204058.57111-1-krzysztof.kozlowski@linaro.org>
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

