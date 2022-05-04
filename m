Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAC7151A421
	for <lists+linux-leds@lfdr.de>; Wed,  4 May 2022 17:36:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352227AbiEDPkB (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 4 May 2022 11:40:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352537AbiEDPkA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 4 May 2022 11:40:00 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DC8217A9E;
        Wed,  4 May 2022 08:36:23 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id m2-20020a1ca302000000b003943bc63f98so1064598wme.4;
        Wed, 04 May 2022 08:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+g3/kFp2BcJ8klcp8dJ2wc48A2yBJ27fCRVoDzsEKvA=;
        b=VE60Ob8XXNXOcrU2bgAse7cR3hIdCzEJ/NFP+pyENMSWgogm6a+bUW61tDmDQ8Vt1H
         ufB1J4BCQ+MXjHjmDA30u2bD/whHuyla0CSlH6XFX5Y5L8E+ES3+r1JEXKIWlkg1b2R3
         lk9UUtaAIHCwMyMzF8hPnLfdt7z5N36mTt1YR+OqBqIhC4ZKjrRttXPfX9qcb2I9Oq8D
         tRUN4DBA7Y7Stm8onhLV/IQBK/qCAGanhqsWToRpTK2Y4+0p+8rbVI05DlL8r9oP0vUo
         Im7W3Z+Do0X5m9egzXKZv9BGr70UsWg9yzPx33VvBOSm+Jy1FoSagL66QmEYEGaIph+I
         W2Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+g3/kFp2BcJ8klcp8dJ2wc48A2yBJ27fCRVoDzsEKvA=;
        b=sD8o6L6WJ273qgssbPlrrhIbA7EymSdxQO+WpPYZ5+p1NQbn12CTdvfjTEFJxrZydx
         elCkQ+4DNdeYIVcbua4yKGKjNuJ5QYHo0eporhmL6qwRZxJnJSRudBdOx7JyI2vYALvK
         5Rq3q0bDpuf4UynJsBcT6g8/Mai4FA21G1LVKre+XONXlPcgBhMLWHLpVKeZUrKzmjEv
         43lTQ0UpNLLmymJS1z2FPA0PjzLq/2pD9TREZTyhADcqDhlymBN6PhlJrlYQjqCtpQB5
         +y9IT59RR68FMOQNduReJm0UnfGRSrcYWjGmqdwLmM459ISIwJdl/ef/l9tvbhZbv/Vo
         YIbA==
X-Gm-Message-State: AOAM531jMkeZ2JqAqyHOtn9Z3iwoinXNjnzYSOVpumYWZx8g6rR+80F/
        KRVXhMXeDWP4z1VMXsLsA68=
X-Google-Smtp-Source: ABdhPJxW21qgHdkZoXmAPpQ000oQAjvkhsPY7Xqwozjze1JZmItaw4jxIYf3FjJUUMQeE52QPhgz+w==
X-Received: by 2002:a05:600c:2f0f:b0:393:fbd1:cc94 with SMTP id r15-20020a05600c2f0f00b00393fbd1cc94mr35099wmn.162.1651678582216;
        Wed, 04 May 2022 08:36:22 -0700 (PDT)
Received: from nergzd-desktop.localdomain ([194.39.226.133])
        by smtp.gmail.com with ESMTPSA id e13-20020adfa44d000000b0020c5253d8c0sm11955838wra.12.2022.05.04.08.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 08:36:21 -0700 (PDT)
From:   Markuss Broks <markuss.broks@gmail.com>
To:     pavel@ucw.cz
Cc:     Markuss Broks <markuss.broks@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v6 (corrected) 1/2] dt-bindings: leds: convert ktd2692 bindings to yaml
Date:   Wed,  4 May 2022 18:35:33 +0300
Message-Id: <20220504153536.10749-2-markuss.broks@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220504153536.10749-1-markuss.broks@gmail.com>
References: <20220504153536.10749-1-markuss.broks@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This patch converts the leds-ktd2692.txt bindings to modern yaml
style device-tree bindings.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 .../bindings/leds/kinetic,ktd2692.yaml        | 87 +++++++++++++++++++
 .../devicetree/bindings/leds/leds-ktd2692.txt | 50 -----------
 2 files changed, 87 insertions(+), 50 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/kinetic,ktd2692.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-ktd2692.txt

diff --git a/Documentation/devicetree/bindings/leds/kinetic,ktd2692.yaml b/Documentation/devicetree/bindings/leds/kinetic,ktd2692.yaml
new file mode 100644
index 000000000000..bac95a51afa1
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/kinetic,ktd2692.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/kinetic,ktd2692.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: KTD2692 Flash LED Driver from Kinetic Technologies
+
+maintainers:
+  - Markuss Broks <markuss.broks@gmail.com>
+
+description: |
+  KTD2692 is the ideal power solution for high-power flash LEDs.
+  It uses ExpressWire single-wire programming for maximum flexibility.
+
+  The ExpressWire interface through CTRL pin can control LED on/off and
+  enable/disable the IC, Movie(max 1/3 of Flash current) / Flash mode current,
+  Flash timeout, LVP(low voltage protection).
+
+  Also, When the AUX pin is pulled high while CTRL pin is high,
+  LED current will be ramped up to the flash-mode current level.
+
+properties:
+  compatible:
+    const: kinetic,ktd2692
+
+  ctrl-gpios:
+    maxItems: 1
+    description: Specifier of the GPIO connected to CTRL pin.
+
+  aux-gpios:
+    maxItems: 1
+    description: Specifier of the GPIO connected to CTRL pin.
+
+  vin-supply:
+    description: LED supply (2.7V to 5.5V).
+
+  led:
+    type: object
+    $ref: common.yaml#
+    description: Properties for the LED.
+    properties:
+      function: true
+      color: true
+      flash-max-timeout-us:
+        description: Flash LED maximum timeout.
+
+      led-max-microamp:
+        maximum: 300000
+        description: Minimum Threshold for Timer protection
+          is defined internally (Maximum 300mA).
+
+      flash-max-microamp:
+        maximum: 300000
+        description: Flash LED maximum current
+          Formula - I(uA) = 15000000 / Rset.
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - ctrl-gpios
+  - led
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/leds/common.h>
+
+    ktd2692 {
+      compatible = "kinetic,ktd2692";
+      ctrl-gpios = <&gpc0 1 0>;
+      aux-gpios = <&gpc0 2 0>;
+      vin-supply = <&vbat>;
+
+      led {
+        function = LED_FUNCTION_FLASH;
+        color = <LED_COLOR_ID_WHITE>;
+        flash-max-timeout-us = <250000>;
+        flash-max-microamp = <150000>;
+        led-max-microamp = <25000>;
+      };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/leds/leds-ktd2692.txt b/Documentation/devicetree/bindings/leds/leds-ktd2692.txt
deleted file mode 100644
index 853737452580..000000000000
--- a/Documentation/devicetree/bindings/leds/leds-ktd2692.txt
+++ /dev/null
@@ -1,50 +0,0 @@
-* Kinetic Technologies - KTD2692 Flash LED Driver
-
-KTD2692 is the ideal power solution for high-power flash LEDs.
-It uses ExpressWire single-wire programming for maximum flexibility.
-
-The ExpressWire interface through CTRL pin can control LED on/off and
-enable/disable the IC, Movie(max 1/3 of Flash current) / Flash mode current,
-Flash timeout, LVP(low voltage protection).
-
-Also, When the AUX pin is pulled high while CTRL pin is high,
-LED current will be ramped up to the flash-mode current level.
-
-Required properties:
-- compatible : Should be "kinetic,ktd2692".
-- ctrl-gpios : Specifier of the GPIO connected to CTRL pin.
-- aux-gpios : Specifier of the GPIO connected to AUX pin.
-
-Optional properties:
-- vin-supply : "vin" LED supply (2.7V to 5.5V).
-  See Documentation/devicetree/bindings/regulator/regulator.txt
-
-A discrete LED element connected to the device must be represented by a child
-node - See Documentation/devicetree/bindings/leds/common.txt
-
-Required properties for flash LED child nodes:
-  See Documentation/devicetree/bindings/leds/common.txt
-- led-max-microamp : Minimum Threshold for Timer protection
-  is defined internally (Maximum 300mA).
-- flash-max-microamp : Flash LED maximum current
-  Formula : I(mA) = 15000 / Rset.
-- flash-max-timeout-us : Flash LED maximum timeout.
-
-Optional properties for flash LED child nodes:
-- label : See Documentation/devicetree/bindings/leds/common.txt
-
-Example:
-
-ktd2692 {
-	compatible = "kinetic,ktd2692";
-	ctrl-gpios = <&gpc0 1 0>;
-	aux-gpios = <&gpc0 2 0>;
-	vin-supply = <&vbat>;
-
-	flash-led {
-		label = "ktd2692-flash";
-		led-max-microamp = <300000>;
-		flash-max-microamp = <1500000>;
-		flash-max-timeout-us = <1835000>;
-	};
-};
-- 
2.35.1

