Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24D7953F7A8
	for <lists+linux-leds@lfdr.de>; Tue,  7 Jun 2022 09:53:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237948AbiFGHxC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 7 Jun 2022 03:53:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237914AbiFGHxB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 7 Jun 2022 03:53:01 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D2BD48308
        for <linux-leds@vger.kernel.org>; Tue,  7 Jun 2022 00:52:53 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id fu3so31985950ejc.7
        for <linux-leds@vger.kernel.org>; Tue, 07 Jun 2022 00:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aprS9X8nJPy56dhP+0+YmHZ8qAW2AqStnDlxa+L0eRs=;
        b=NeMKZrOwFgGtjfg+GbeUTesQ0NUlmx4r273/BmHlsGArm5hT6ZEhO9zITU9pz8Mac8
         xt9PyavMJkGJHm3tDOp2VZH0GtqlubH5i3Yx8+yToakQU52wO+EdEkSwbE4QpQ/tFFVx
         9OJxcTAHd4+J3l1OpBv1h8cTLYNcjtAPqMbG2VTvbQYlizO5kN4y4LOQ80tffkhX0cBC
         UBrEETR1UQ0DPdjoKd6l2FtJdgkkrTKXWfdEZYI2nJjcWCn3J2nIpQACvQsIYnEYOIkq
         SSuB9DovSNETJwICs6UJRBtAKREwcYdtRG0mQ0HDrtr1Sbdo6YCefbmXLVl4Ac6j+ssE
         +0cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aprS9X8nJPy56dhP+0+YmHZ8qAW2AqStnDlxa+L0eRs=;
        b=Ul1x5SSdzHSq+7LZJkHQWDeWR+QLZetn7lL01F3EaYYscMzadm3kW5G1nGFvUSvl4+
         iiGEDD7PZ5197ykh2juIYctPKiJn7z4NyZdxDit7Y7d3xJaO1jRKw7qe5XcslHF01LdT
         PmZMTlnwWtD7HYOdoRVy7kjep9VZ+ZgpKag5qetRiiSPRCjbEdYzCZV871Jehz27WaTp
         4/ijhA0lVg81HdNmskPSxrXq8vUVioaJwO767cwyJ53JXj/6nEzqWc7hNw6nC6IbRu/J
         jjyRlervsxl/oFtPubaazy3QgfdkjZu9dzC1HmJZ+pQbqe+KdAdxDgLbcZgQvCi3O5kA
         49EA==
X-Gm-Message-State: AOAM533WRJbr2I81reaUN50I1ZvjNbC5amUVeANitO6gd/mQjOCT3vPt
        OQARcCzQktgs3gsSFRy3DiZo+Q==
X-Google-Smtp-Source: ABdhPJwNBamchoIXF5CsgvWHC6hVe7DDhlLGk8xj0EHpCzIT5LgAR/pBGaGJamPEzPWvYKMYvG/tQQ==
X-Received: by 2002:a17:907:94c1:b0:6ff:7dc9:ac22 with SMTP id dn1-20020a17090794c100b006ff7dc9ac22mr25028515ejc.768.1654588371498;
        Tue, 07 Jun 2022 00:52:51 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id m3-20020aa7c483000000b0042de29d8fc0sm9773731edq.94.2022.06.07.00.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 00:52:51 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Dan Murphy <dmurphy@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Sven Schwermer <sven.schwermer@disruptive-technologies.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Kyle Swenson <kyle.swenson@est.tech>
Subject: [PATCH v3 2/2] dt-bindings: leds: fix indentation in examples
Date:   Tue,  7 Jun 2022 09:52:47 +0200
Message-Id: <20220607075247.58048-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607075247.58048-1-krzysztof.kozlowski@linaro.org>
References: <20220607075247.58048-1-krzysztof.kozlowski@linaro.org>
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

The examples were mixing 4-space with 2- and 3-space indentations, so
correct them to use 4-space one.  No functional change.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>

---

Changes since v2:
1. Add Rb tag.

Changes since v1:
1. None

Cc: Kyle Swenson <kyle.swenson@est.tech>
---
 .../devicetree/bindings/leds/leds-lp50xx.yaml | 110 ++++-----
 .../devicetree/bindings/leds/leds-lp55xx.yaml | 222 +++++++++---------
 .../bindings/leds/leds-pwm-multicolor.yaml    |  36 +--
 3 files changed, 184 insertions(+), 184 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml b/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
index 29ce0cb7d449..d11898567313 100644
--- a/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
@@ -78,66 +78,66 @@ additionalProperties: false
 
 examples:
   - |
-   #include <dt-bindings/gpio/gpio.h>
-   #include <dt-bindings/leds/common.h>
-
-   i2c {
-       #address-cells = <1>;
-       #size-cells = <0>;
-
-       led-controller@14 {
-           compatible = "ti,lp5009";
-           reg = <0x14>;
-           #address-cells = <1>;
-           #size-cells = <0>;
-           enable-gpios = <&gpio1 16>;
-
-           multi-led@1 {
-               #address-cells = <1>;
-               #size-cells = <0>;
-               reg = <0x1>;
-               color = <LED_COLOR_ID_RGB>;
-               function = LED_FUNCTION_CHARGING;
-
-               led@0 {
-                   reg = <0x0>;
-                   color = <LED_COLOR_ID_RED>;
-               };
-
-               led@1 {
-                   reg = <0x1>;
-                   color = <LED_COLOR_ID_GREEN>;
-               };
-
-               led@2 {
-                   reg = <0x2>;
-                   color = <LED_COLOR_ID_BLUE>;
-               };
-          };
-
-          multi-led@3 {
-            #address-cells = <1>;
-            #size-cells = <0>;
-            reg = <0x3>, <0x4>, <0x5>;
-            color = <LED_COLOR_ID_RGB>;
-            function = LED_FUNCTION_STANDBY;
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/leds/common.h>
 
-            led@3 {
-              reg = <0x3>;
-              color = <LED_COLOR_ID_RED>;
-            };
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
 
-            led@4 {
-              reg = <0x4>;
-              color = <LED_COLOR_ID_GREEN>;
+        led-controller@14 {
+            compatible = "ti,lp5009";
+            reg = <0x14>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+            enable-gpios = <&gpio1 16>;
+
+            multi-led@1 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <0x1>;
+                color = <LED_COLOR_ID_RGB>;
+                function = LED_FUNCTION_CHARGING;
+
+                led@0 {
+                     reg = <0x0>;
+                     color = <LED_COLOR_ID_RED>;
+                };
+
+                led@1 {
+                     reg = <0x1>;
+                     color = <LED_COLOR_ID_GREEN>;
+                };
+
+                led@2 {
+                     reg = <0x2>;
+                     color = <LED_COLOR_ID_BLUE>;
+                };
             };
 
-            led@5 {
-              reg = <0x5>;
-              color = <LED_COLOR_ID_BLUE>;
+            multi-led@3 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <0x3>, <0x4>, <0x5>;
+                color = <LED_COLOR_ID_RGB>;
+                function = LED_FUNCTION_STANDBY;
+
+                led@3 {
+                    reg = <0x3>;
+                    color = <LED_COLOR_ID_RED>;
+                };
+
+                led@4 {
+                    reg = <0x4>;
+                    color = <LED_COLOR_ID_GREEN>;
+                };
+
+                led@5 {
+                    reg = <0x5>;
+                    color = <LED_COLOR_ID_BLUE>;
+                };
             };
-         };
-       };
+        };
     };
 
 ...
diff --git a/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml b/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml
index f552cd143d5b..7ec676e53851 100644
--- a/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml
@@ -108,119 +108,119 @@ additionalProperties: false
 
 examples:
   - |
-   #include <dt-bindings/leds/common.h>
-
-   i2c {
-       #address-cells = <1>;
-       #size-cells = <0>;
-
-       led-controller@32 {
-           #address-cells = <1>;
-           #size-cells = <0>;
-           compatible = "ti,lp8501";
-           reg = <0x32>;
-           clock-mode = /bits/ 8 <2>;
-           pwr-sel = /bits/ 8 <3>;	/* D1~9 connected to VOUT */
-
-           led@0 {
-               reg = <0>;
-               chan-name = "d1";
-               led-cur = /bits/ 8 <0x14>;
-               max-cur = /bits/ 8 <0x20>;
-           };
-
-           led@1 {
-               reg = <1>;
-               chan-name = "d2";
-               led-cur = /bits/ 8 <0x14>;
-               max-cur = /bits/ 8 <0x20>;
-           };
-
-           led@2 {
-               reg = <2>;
-               chan-name = "d3";
-               led-cur = /bits/ 8 <0x14>;
-               max-cur = /bits/ 8 <0x20>;
-           };
-
-           led@3 {
-               reg = <3>;
-               chan-name = "d4";
-               led-cur = /bits/ 8 <0x14>;
-               max-cur = /bits/ 8 <0x20>;
-           };
-
-           led@4 {
-               reg = <4>;
-               chan-name = "d5";
-               led-cur = /bits/ 8 <0x14>;
-               max-cur = /bits/ 8 <0x20>;
-           };
-
-           led@5 {
-               reg = <5>;
-               chan-name = "d6";
-               led-cur = /bits/ 8 <0x14>;
-               max-cur = /bits/ 8 <0x20>;
-           };
-
-           led@6 {
-               reg = <6>;
-               chan-name = "d7";
-               led-cur = /bits/ 8 <0x14>;
-               max-cur = /bits/ 8 <0x20>;
-           };
-
-           led@7 {
-               reg = <7>;
-               chan-name = "d8";
-               led-cur = /bits/ 8 <0x14>;
-               max-cur = /bits/ 8 <0x20>;
-           };
-
-           led@8 {
-               reg = <8>;
-               chan-name = "d9";
-               led-cur = /bits/ 8 <0x14>;
-               max-cur = /bits/ 8 <0x20>;
-           };
+    #include <dt-bindings/leds/common.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led-controller@32 {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            compatible = "ti,lp8501";
+            reg = <0x32>;
+            clock-mode = /bits/ 8 <2>;
+            pwr-sel = /bits/ 8 <3>;	/* D1~9 connected to VOUT */
+
+            led@0 {
+                reg = <0>;
+                chan-name = "d1";
+                led-cur = /bits/ 8 <0x14>;
+                max-cur = /bits/ 8 <0x20>;
+            };
+
+            led@1 {
+                reg = <1>;
+                chan-name = "d2";
+                led-cur = /bits/ 8 <0x14>;
+                max-cur = /bits/ 8 <0x20>;
+            };
+
+            led@2 {
+                reg = <2>;
+                chan-name = "d3";
+                led-cur = /bits/ 8 <0x14>;
+                max-cur = /bits/ 8 <0x20>;
+            };
+
+            led@3 {
+                reg = <3>;
+                chan-name = "d4";
+                led-cur = /bits/ 8 <0x14>;
+                max-cur = /bits/ 8 <0x20>;
+            };
+
+            led@4 {
+                reg = <4>;
+                chan-name = "d5";
+                led-cur = /bits/ 8 <0x14>;
+                max-cur = /bits/ 8 <0x20>;
+            };
+
+            led@5 {
+                reg = <5>;
+                chan-name = "d6";
+                led-cur = /bits/ 8 <0x14>;
+                max-cur = /bits/ 8 <0x20>;
+            };
+
+            led@6 {
+                reg = <6>;
+                chan-name = "d7";
+                led-cur = /bits/ 8 <0x14>;
+                max-cur = /bits/ 8 <0x20>;
+            };
+
+            led@7 {
+                reg = <7>;
+                chan-name = "d8";
+                led-cur = /bits/ 8 <0x14>;
+                max-cur = /bits/ 8 <0x20>;
+            };
+
+            led@8 {
+                reg = <8>;
+                chan-name = "d9";
+                led-cur = /bits/ 8 <0x14>;
+                max-cur = /bits/ 8 <0x20>;
+            };
         };
 
-       led-controller@33 {
-           #address-cells = <1>;
-           #size-cells = <0>;
-           compatible = "national,lp5523";
-           reg = <0x33>;
-           clock-mode = /bits/ 8 <0>;
-
-           multi-led@2 {
-               #address-cells = <1>;
-               #size-cells = <0>;
-               reg = <0x2>;
-               color = <LED_COLOR_ID_RGB>;
-               function = LED_FUNCTION_STANDBY;
-               linux,default-trigger = "heartbeat";
-
-               led@0 {
-                   led-cur = /bits/ 8 <50>;
-                   max-cur = /bits/ 8 <100>;
-                   reg = <0x0>;
-                   color = <LED_COLOR_ID_GREEN>;
-               };
-
-               led@1 {
-                   led-cur = /bits/ 8 <50>;
-                   max-cur = /bits/ 8 <100>;
-                   reg = <0x1>;
-                   color = <LED_COLOR_ID_BLUE>;
-               };
-
-               led@6 {
-                   led-cur = /bits/ 8 <50>;
-                   max-cur = /bits/ 8 <100>;
-                   reg = <0x6>;
-                   color = <LED_COLOR_ID_RED>;
-               };
+        led-controller@33 {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            compatible = "national,lp5523";
+            reg = <0x33>;
+            clock-mode = /bits/ 8 <0>;
+
+            multi-led@2 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <0x2>;
+                color = <LED_COLOR_ID_RGB>;
+                function = LED_FUNCTION_STANDBY;
+                linux,default-trigger = "heartbeat";
+
+                led@0 {
+                    led-cur = /bits/ 8 <50>;
+                    max-cur = /bits/ 8 <100>;
+                    reg = <0x0>;
+                    color = <LED_COLOR_ID_GREEN>;
+                };
+
+                led@1 {
+                    led-cur = /bits/ 8 <50>;
+                    max-cur = /bits/ 8 <100>;
+                    reg = <0x1>;
+                    color = <LED_COLOR_ID_BLUE>;
+                };
+
+                led@6 {
+                    led-cur = /bits/ 8 <50>;
+                    max-cur = /bits/ 8 <100>;
+                    reg = <0x6>;
+                    color = <LED_COLOR_ID_RED>;
+                };
             };
         };
     };
diff --git a/Documentation/devicetree/bindings/leds/leds-pwm-multicolor.yaml b/Documentation/devicetree/bindings/leds/leds-pwm-multicolor.yaml
index 6625a528f727..fdaf04e03a8d 100644
--- a/Documentation/devicetree/bindings/leds/leds-pwm-multicolor.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-pwm-multicolor.yaml
@@ -55,24 +55,24 @@ examples:
         compatible = "pwm-leds-multicolor";
 
         multi-led {
-          color = <LED_COLOR_ID_RGB>;
-          function = LED_FUNCTION_INDICATOR;
-          max-brightness = <65535>;
-
-          led-red {
-              pwms = <&pwm1 0 1000000>;
-              color = <LED_COLOR_ID_RED>;
-          };
-
-          led-green {
-              pwms = <&pwm2 0 1000000>;
-              color = <LED_COLOR_ID_GREEN>;
-          };
-
-          led-blue {
-              pwms = <&pwm3 0 1000000>;
-              color = <LED_COLOR_ID_BLUE>;
-          };
+            color = <LED_COLOR_ID_RGB>;
+            function = LED_FUNCTION_INDICATOR;
+            max-brightness = <65535>;
+
+            led-red {
+                pwms = <&pwm1 0 1000000>;
+                color = <LED_COLOR_ID_RED>;
+            };
+
+            led-green {
+                pwms = <&pwm2 0 1000000>;
+                color = <LED_COLOR_ID_GREEN>;
+            };
+
+            led-blue {
+                pwms = <&pwm3 0 1000000>;
+                color = <LED_COLOR_ID_BLUE>;
+            };
         };
     };
 
-- 
2.34.1

