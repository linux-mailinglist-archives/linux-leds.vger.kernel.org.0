Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13F09270AEA
	for <lists+linux-leds@lfdr.de>; Sat, 19 Sep 2020 07:38:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726119AbgISFiE (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 19 Sep 2020 01:38:04 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:44791 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726129AbgISFiE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 19 Sep 2020 01:38:04 -0400
Received: from methusalix.internal.home.lespocky.de ([92.117.44.159]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N7zW7-1kWvQi2etH-0153PC; Sat, 19 Sep 2020 07:32:31 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.176] helo=lemmy.home.lespocky.de)
        by methusalix.internal.home.lespocky.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <alex@home.lespocky.de>)
        id 1kJVU5-0004nW-6N; Sat, 19 Sep 2020 07:32:30 +0200
Received: (nullmailer pid 7654 invoked by uid 2001);
        Sat, 19 Sep 2020 05:32:22 -0000
From:   Alexander Dahl <post@lespocky.de>
To:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        Alexander Dahl <ada@thorsis.com>,
        Alexander Dahl <post@lespocky.de>
Subject: [PATCH v5 3/3] dt-bindings: leds: Convert pwm to yaml
Date:   Sat, 19 Sep 2020 07:31:45 +0200
Message-Id: <20200919053145.7564-4-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200919053145.7564-1-post@lespocky.de>
References: <20200919053145.7564-1-post@lespocky.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scan-Signature: a27db00201996a3601d2552749fb2316
X-Spam-Score: -2.9 (--)
X-Provags-ID: V03:K1:nJ/xLlIVxufSsg7Ct54vQ1SEDfgkWqsDyGl3necXfKB5GwX7DaF
 K/AEJ0zwK9S2aQ8BgkQxrJiOOKndJEqFxm87Xj+2yBpYzmXvYcB1cf0FiXCRbFOWoTC8eZY
 muMNSLWk3XRjNQw4HxoLZCE8HQMM1mdE3lq00+0e6Ddv6ZxfN7UElOhRm2AqRMUGkuYxk/m
 La7EcWOTAgfIAXAmuF/dw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:yqlxubx3gd8=:0X1yDet7cze9r6B/MRGmk6
 hprfL25IPJoErH0yNMPUqg7tvNzgg4xwX/chedJO67vcbSnrugp1LCzyWTz9t3Gl0tqiddWqj
 QBh4rrpWd6NA1JjhjBmGiIk83WA+CEarayMGkoi1PIPSN8y1NEJSsYGolpANbkGV1FyNu3p6U
 1TpDWtOCMRmDAIzMxsm/MqMpRHnF2QQO00Uc3YR0Dpq6yrMdjRw0f39ufqgZ1jwgYxz63eJN4
 0KL/+HjW0+ICeWOLB1nQ7VOLMwl4gd74P+MG8LeFYaDANpn9CYTcMpu/P4RK2Hknjq4cyGWxa
 FR13rLs0xfhIk1h8gqSlpMfaESY5XVDHm6ePG+SdYoBW4hhNkmFyPQeSppsSWAhQPd2p/ocbU
 18cBUA6GLPhIXZh9GUlpj5HUJF+rXqmKjy01sRcHzEEq4fvCv/GG06Dyflnyp7vNYueumWX2/
 6Ca1tELGjLLOcPH+ION9mJu8NXtNQ0fqilNDjJtEN1EXJrpuaLl3+s9ll0EPMp7Yams3x5HPB
 JnWEFUGrtfJykfTi0i2YPf80zgbNPyKySEyyYClgh8UmSztKvgu0rxA7EUkde4qPePeGXaSsZ
 pzfqQvoH+xMM736P3ywNCJ+eCP0TLmr/MEyTgnwiDOA5gnlFgwbwNIpUIrsur0/DZjI8ab4g9
 B8Kok9IjcbLwWHkH3w/1Px7gKZMTvSrz5Kn+GWgc1Jj75A6tZnXyZD669+dk0O5ZBzneZl8Nt
 xv2brN+tus41YJkyoESfuTu7cegB4eW9e0FxPbZL0Ps2GUHjHrMyqq0THNFqb1wfPXZUNjnxH
 eRaRD7glC3prP39b/Y+v1qw6jegvesKzVKcCUPiO80HLZC0tzsgSjQ+Bd5ZOYyor3Vwg5WM
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The example was adapted slightly to make use of the 'function' and
'color' properties.  License discussed with the original author.

Suggested-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Signed-off-by: Alexander Dahl <post@lespocky.de>
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
---

Notes:
    v4 -> v5:
      * updated based on feedback by Rob Herring
      * removed Acked-by
    
    v3 -> v4:
      * added Cc to original author of the binding
    
    v2 -> v3:
      * changed license identifier to recommended one
      * added Acked-by
    
    v2:
      * added this patch to series (Suggested-by: Jacek Anaszewski)

 .../devicetree/bindings/leds/leds-pwm.txt     | 50 -----------
 .../devicetree/bindings/leds/leds-pwm.yaml    | 82 +++++++++++++++++++
 2 files changed, 82 insertions(+), 50 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-pwm.txt
 create mode 100644 Documentation/devicetree/bindings/leds/leds-pwm.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-pwm.txt b/Documentation/devicetree/bindings/leds/leds-pwm.txt
deleted file mode 100644
index 6c6583c35f2f..000000000000
--- a/Documentation/devicetree/bindings/leds/leds-pwm.txt
+++ /dev/null
@@ -1,50 +0,0 @@
-LED connected to PWM
-
-Required properties:
-- compatible : should be "pwm-leds".
-
-Each LED is represented as a sub-node of the pwm-leds device.  Each
-node's name represents the name of the corresponding LED.
-
-LED sub-node properties:
-- pwms : PWM property to point to the PWM device (phandle)/port (id) and to
-  specify the period time to be used: <&phandle id period_ns>;
-- pwm-names : (optional) Name to be used by the PWM subsystem for the PWM device
-  For the pwms and pwm-names property please refer to:
-  Documentation/devicetree/bindings/pwm/pwm.txt
-- max-brightness : Maximum brightness possible for the LED
-- active-low : (optional) For PWMs where the LED is wired to supply
-  rather than ground.
-- label :  (optional)
-  see Documentation/devicetree/bindings/leds/common.txt
-- linux,default-trigger :  (optional)
-  see Documentation/devicetree/bindings/leds/common.txt
-
-Example:
-
-twl_pwm: pwm {
-	/* provides two PWMs (id 0, 1 for PWM1 and PWM2) */
-	compatible = "ti,twl6030-pwm";
-	#pwm-cells = <2>;
-};
-
-twl_pwmled: pwmled {
-	/* provides one PWM (id 0 for Charing indicator LED) */
-	compatible = "ti,twl6030-pwmled";
-	#pwm-cells = <2>;
-};
-
-pwmleds {
-	compatible = "pwm-leds";
-	kpad {
-		label = "omap4::keypad";
-		pwms = <&twl_pwm 0 7812500>;
-		max-brightness = <127>;
-	};
-
-	charging {
-		label = "omap4:green:chrg";
-		pwms = <&twl_pwmled 0 7812500>;
-		max-brightness = <255>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/leds/leds-pwm.yaml b/Documentation/devicetree/bindings/leds/leds-pwm.yaml
new file mode 100644
index 000000000000..c9316811c7f1
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-pwm.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/leds-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LEDs connected to PWM
+
+maintainers:
+  - Pavel Machek <pavel@ucw.cz>
+
+description:
+  Each LED is represented as a sub-node of the pwm-leds device.  Each
+  node's name represents the name of the corresponding LED.
+
+properties:
+  compatible:
+    const: pwm-leds
+
+patternProperties:
+  "^led(-[0-9a-f]+)?$":
+    type: object
+
+    $ref: common.yaml#
+
+    properties:
+      pwms:
+        maxItems: 1
+
+      pwm-names: true
+
+      max-brightness:
+        description:
+          Maximum brightness possible for the LED
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+      active-low:
+        description:
+          For PWMs where the LED is wired to supply rather than ground.
+        type: boolean
+
+    required:
+      - pwms
+      - max-brightness
+
+additionalProperties: false
+
+examples:
+  - |
+
+    #include <dt-bindings/leds/common.h>
+
+    twl_pwm: pwm {
+        /* provides two PWMs (id 0, 1 for PWM1 and PWM2) */
+        compatible = "ti,twl6030-pwm";
+        #pwm-cells = <2>;
+    };
+
+    twl_pwmled: pwmled {
+        /* provides one PWM (id 0 for Charing indicator LED) */
+        compatible = "ti,twl6030-pwmled";
+        #pwm-cells = <2>;
+    };
+
+    pwm_leds {
+        compatible = "pwm-leds";
+
+        led-1 {
+            label = "omap4::keypad";
+            pwms = <&twl_pwm 0 7812500>;
+            max-brightness = <127>;
+        };
+
+        led-2 {
+            color = <LED_COLOR_ID_GREEN>;
+            function = LED_FUNCTION_CHARGING;
+            pwms = <&twl_pwmled 0 7812500>;
+            max-brightness = <255>;
+        };
+    };
+
+...
-- 
2.20.1

