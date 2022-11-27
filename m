Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22D56639CE2
	for <lists+linux-leds@lfdr.de>; Sun, 27 Nov 2022 21:41:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229609AbiK0UlK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 27 Nov 2022 15:41:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbiK0UlI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 27 Nov 2022 15:41:08 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E352DFB9
        for <linux-leds@vger.kernel.org>; Sun, 27 Nov 2022 12:41:07 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id r8so11036959ljn.8
        for <linux-leds@vger.kernel.org>; Sun, 27 Nov 2022 12:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fDL3bxnlhrToJ87AqhpKdM36cndBJ8Gx26Dybv1sMno=;
        b=tS+SpjB3/m1Y20fT1JtVV+5T7NKAGZXGuQ1uFalFM7wjGUMQdCR9doi8Xtw8YIg79s
         muOgrImr6KJL0hzoMTo1Cn3jqQP7XdfbSmuY7zzMRw+Ntj2yyxal99SNWo6BcE4pzCFi
         Ut0fO/xDd9UOa51jgkpWX+1JMHp8bjUnI9DMQOr5aa1K8EjB28dgtt4CLHIyLVofu67e
         5LzM751ss2sWd96qS4++BY9ayDxqMopgzX3V5S7tu0B0jYYF80ozOO2gygKOfUhwOAc3
         6ko+39RoKaEnsxXHT1sGzBH6zeOSkrexbvbTHzlcviwgCwhv+2VIALBNay/8WBdx2Qr/
         0LUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fDL3bxnlhrToJ87AqhpKdM36cndBJ8Gx26Dybv1sMno=;
        b=O1VjW9lZXRQoOrPE8Np4TrpE/0M8JQpT+fOOb2igAFrz1+HPYHOJHKk9/bJjpDjCdw
         6AFUAD7sDsAyeQPo06I77kcP7FEQaC+O0VymUk1gZws0/jR7THNhSprgsbfp+/dDXlKv
         kEbEgeDtHyURQRWLs1fQmsiSh7Hx8EWsJX9umbhf+Dw8BtyOWZYahUdcbQ6ovUTW5udQ
         zrwlWbzaYmRWpx2xcWnnQyZxumD9facZakmeKz6o5wHDJFdklUDlcyZDaU2MrZHHoH+O
         SfHfDiz6E6/8QezMt88M6Cv2aPrfRzIwDU9oq0OBv3VOaTodSbsPCTwlrF4GeUrmI/VL
         +TSQ==
X-Gm-Message-State: ANoB5pncYZha860v09mt1eAZZ3EZAr4llk1DoMK2ijACwgJEcl9us4Oe
        FdrHsiK7nrWTH9dsCNIzmVGqrw==
X-Google-Smtp-Source: AA0mqf7OihlRS/gxN74EB3cI3w/EoGWSf4v88lVbhgM+8UeFTHdNFtfIy1yXQi9S4ztKYo2g1YOa7A==
X-Received: by 2002:a2e:8e23:0:b0:26c:4f23:d346 with SMTP id r3-20020a2e8e23000000b0026c4f23d346mr14263929ljk.304.1669581667031;
        Sun, 27 Nov 2022 12:41:07 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id bi39-20020a05651c232700b002773ac59697sm644607ljb.0.2022.11.27.12.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 12:41:06 -0800 (PST)
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
Subject: [PATCH v2 4/6] dt-bindings: leds: lp55xx: rework to match multi-led
Date:   Sun, 27 Nov 2022 21:40:56 +0100
Message-Id: <20221127204058.57111-5-krzysztof.kozlowski@linaro.org>
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
 .../devicetree/bindings/leds/leds-lp55xx.yaml | 43 ++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml b/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml
index 9a38e5ee43fe..ae607911f1db 100644
--- a/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml
@@ -67,9 +67,50 @@ properties:
     const: 0
 
 patternProperties:
-  "(^led@[0-9a-f]$|led)":
+  '^multi-led@[0-8]$':
+    type: object
+    $ref: leds-class-multicolor.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        maximum: 8
+
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+    patternProperties:
+      "^led@[0-8]$":
+        type: object
+        $ref: common.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          led-cur:
+            $ref: /schemas/types.yaml#/definitions/uint8
+            description: |
+              Current setting at each LED channel (mA x10, 0 if LED is not connected)
+            minimum: 0
+            maximum: 255
+
+          max-cur:
+            $ref: /schemas/types.yaml#/definitions/uint8
+            description: Maximun current at each LED channel.
+
+          reg:
+            maximum: 8
+
+        required:
+          - reg
+
+  "^led@[0-8]$":
     type: object
     $ref: common.yaml#
+    unevaluatedProperties: false
+
     properties:
       led-cur:
         $ref: /schemas/types.yaml#/definitions/uint8
-- 
2.34.1

