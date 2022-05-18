Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51CFA52B50B
	for <lists+linux-leds@lfdr.de>; Wed, 18 May 2022 10:38:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232862AbiERIW0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 18 May 2022 04:22:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232853AbiERIWY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 18 May 2022 04:22:24 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 635411053E8
        for <linux-leds@vger.kernel.org>; Wed, 18 May 2022 01:22:22 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id s5so1589298ljd.10
        for <linux-leds@vger.kernel.org>; Wed, 18 May 2022 01:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+K0Gm4oZjZxe/Dooym/7C7vy3NCAW4bZ9plmWpGro1w=;
        b=NmFA5XKE+0zH5kijL/xt0L9XzlgWuwTuHK59Y4JqA8ItAZ4l9t0QKcdEidsgJ9z05s
         8ARYAbfnAC34X4XLOHKjWc71r2M+RQj3ONyLHn10tyXc7HeLExdxVr4Kd5LzIFINh4zc
         8rBHkRKIQTQx6s5KYPOqkyLzu1/GcQvYGaVpgGslPIchuOS4lFvPI08z0Qye3KwdBrLB
         EQiXGGxKwXC1ZgxxR3nTnQ8/B3X/VG6/BIQMj9L7tyN6jVCkkXFsIwKg7D+SRP0+BlGV
         jp53haoWzHCF5MBDWmldFDQGUSJ7s6LBao8vSSFID1g09j5FmgII2CgARSjom3uYLnUX
         PQZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+K0Gm4oZjZxe/Dooym/7C7vy3NCAW4bZ9plmWpGro1w=;
        b=f7r+P+EQSBCGHvWJz94iy5V751ucUWimCoLHinyWI9gP8ewy12chSo+xV3/lHmoqAd
         VYyK4Xukr1MAHlzCUu1wogUaeP34uY0lyJtn7SjpD9y5ny9e0561NX5UXfMyKKOLZtvf
         KA2JX58FCigqqaG7UuOdhsMYpCM8snTfsJ48XHHMW9FNw+zdA3sjmN8jq0hV1QSDo5mH
         EMY+B3rCZRM36iS7eAbmrJcMxafxPyldKxyTSDRGA/hkMZ5YOAwiHcTC/uS+fi1Heykp
         Ki6wvzHQJYo/nuGuXpa1eidmWKgk8fTJupe385Otcl1J0GT4wyYy8sqRLZfuM4qwaRax
         zPWA==
X-Gm-Message-State: AOAM532l19mBBq0THxzn9pF5H9kTeet4gtj3S1cdPNvlzxIDWqYI6nJA
        fjwzAYOGraYvnhtlhmaWijKolQ==
X-Google-Smtp-Source: ABdhPJzJE9QEt+Kt7YnGI7zOMBLRIJVIVuj5KA9UqtLWSoVp96XhWbJdNu3NMoBZn/3A4uZFSc1n2g==
X-Received: by 2002:a2e:a552:0:b0:250:6297:8109 with SMTP id e18-20020a2ea552000000b0025062978109mr16356812ljn.504.1652862140654;
        Wed, 18 May 2022 01:22:20 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id t13-20020ac243ad000000b0047255d210dbsm139264lfl.10.2022.05.18.01.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 01:22:20 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Dan Murphy <dmurphy@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Sven Schwermer <sven.schwermer@disruptive-technologies.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Kyle Swenson <kyle.swenson@est.tech>
Subject: [PATCH 2/2] dt-bindings: leds: fix indentation in examples
Date:   Wed, 18 May 2022 10:22:15 +0200
Message-Id: <20220518082215.14358-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220518082215.14358-1-krzysztof.kozlowski@linaro.org>
References: <20220518082215.14358-1-krzysztof.kozlowski@linaro.org>
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

---

Cc: Kyle Swenson <kyle.swenson@est.tech>
---
 .../devicetree/bindings/leds/leds-lp50xx.yaml | 110 ++++-----
 .../devicetree/bindings/leds/leds-lp55xx.yaml | 222 +++++++++---------
 .../bindings/leds/leds-pwm-multicolor.yaml    |  36 +--
 3 files changed, 184 insertions(+), 184 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml b/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
index dc1ac905bb91..986440ceab56 100644
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
-          multi-led@2 {
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
+            multi-led@2 {
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
2.32.0

