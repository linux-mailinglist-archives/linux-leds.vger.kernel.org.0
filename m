Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 447CE25F287
	for <lists+linux-leds@lfdr.de>; Mon,  7 Sep 2020 06:35:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725925AbgIGEfq (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 7 Sep 2020 00:35:46 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:42261 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725882AbgIGEfo (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 7 Sep 2020 00:35:44 -0400
Received: from methusalix.internal.home.lespocky.de ([109.250.103.148]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Mo7eX-1kv1HS40OB-00peP4; Mon, 07 Sep 2020 06:35:26 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.176] helo=lemmy.home.lespocky.de)
        by methusalix.internal.home.lespocky.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <alex@home.lespocky.de>)
        id 1kF8sF-0003Dt-8E; Mon, 07 Sep 2020 06:35:24 +0200
Received: (nullmailer pid 3034 invoked by uid 2001);
        Mon, 07 Sep 2020 04:35:22 -0000
From:   Alexander Dahl <post@lespocky.de>
To:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Alexander Dahl <ada@thorsis.com>,
        Alexander Dahl <post@lespocky.de>
Subject: [PATCH v3 2/2] dt-bindings: leds: Convert pwm to yaml
Date:   Mon,  7 Sep 2020 06:34:59 +0200
Message-Id: <20200907043459.2961-3-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200907043459.2961-1-post@lespocky.de>
References: <20200907043459.2961-1-post@lespocky.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scan-Signature: aeccb8aefab59fbde7e356a50a7ae5d4
X-Spam-Score: -2.8 (--)
X-Provags-ID: V03:K1:reAS4raqoeBOUkE3pXwNeoECAwdzbFetknoL5wqhuRmCwuihMnV
 1ZA2QqR121kH2MBavLTZh5DY6h40G7ewnCDnEGkGd4oECGRQupquxnGhOYjoCqgL7HKOwdd
 +dgI10b/DDLjgf8nk4RB7rXRI0bC5SBIOgdsLWbvoYgNnt/rww5lIKPPVM+XVY+v9rp9LLJ
 Iiz0iHLNZ/gdMEZWo8XHA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:rheK7m+48fI=:W/b0BQN9Xwwjub3wYBxRgM
 6w+IjiA/Vu6AnAWXqQLramWgJFksk2/4fwB+Hk3t2jHH5cPk0RLfLvWfX2CtamFssVwLyj+VP
 ARl2gbGvJF49Twxwj2KXdq0JDn4jbWDClvEolYWlAP9eheBl13noNq9xOzKQOfJpIzimPyNRV
 k89WwMMNjmOLio+yNZWKS7WOdN2g/paEwRnBBQdy70kxb4QhLsG7GR01Cjlnr29vYYWUfJCl+
 womAydpDAmOALUsUjewb5jNGTwrPuBW77Z5OrPNBoH565R5Dyy0eeZylDVsq0vQmT7ZE8PqpC
 GpzCRxOqTQCTQfkTFgAlSI7lxUv3jsice0fGPE1eJynlS7jMnp9IL5+PkusqoYyhSI2aOuEil
 1xOIZX4FG8RWtHmuTxbI35OM59eBWu4R3u+o++ZkSmo1M3Y4NKthK2jGk3qBnfOPV9RS3NBy7
 x98OJuwGIyFqWjB0AJIw2qet4YOAfmmkauvYSGVyQ/g9728pQBMNWT5PfxDOiwlusajt7WBVe
 lrkkTBWHn5dsrlxazLTMyW/js1cE1Cyt22N0eX4m5Aoes11aVw/lsfik6t13CLJ10o/jKKDRt
 ObEjjlNGNdiXjMUxlulT8i09mANMajyk6pysEDeir2ubylsP3VOp7N0X4WxUG7uVCYEwsllJx
 XDn8fqwWlygYtJ6nDIKCXMw2jvhlUrvDdlq6T5P3ATUjMZLAlbclPrnMAKfCuiQE/wOFwSNel
 AREp3IncXThZN9zUp7y5PChUd0P91LG5Wx8hixOtYCBjZvXoNB+yRUaFG8MrZu9NoB1lIQRdr
 laYHtDMW48ARNXL1QR9wAI4yzMfYYUZzizB0l+a4REUr82DHQr1AaHtGd3AT6DCBFYptUR1
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The example was adapted slightly to make use of the 'function' and
'color' properties.

Suggested-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Signed-off-by: Alexander Dahl <post@lespocky.de>
Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
---

Notes:
    v2 -> v3:
      * change license identifier to recommended one
      * added Acked-by

 .../devicetree/bindings/leds/leds-pwm.txt     | 50 -----------
 .../devicetree/bindings/leds/leds-pwm.yaml    | 85 +++++++++++++++++++
 2 files changed, 85 insertions(+), 50 deletions(-)
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
index 000000000000..c74867492424
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-pwm.yaml
@@ -0,0 +1,85 @@
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
+  "^pwm-led-([0-9a-f])$":
+    type: object
+
+    $ref: common.yaml#
+
+    properties:
+      pwms:
+        description:
+          "PWM property to point to the PWM device (phandle)/port (id)
+          and to specify the period time to be used:
+          <&phandle id period_ns>;"
+
+      pwm-names:
+        description:
+          "Name to be used by the PWM subsystem for the PWM device For
+          the pwms and pwm-names property please refer to:
+          Documentation/devicetree/bindings/pwm/pwm.txt"
+
+      max-brightness:
+        description:
+          Maximum brightness possible for the LED
+
+      active-low:
+        description:
+          For PWMs where the LED is wired to supply rather than ground.
+
+    required:
+      - pwms
+      - max-brightness
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
+        pwm-led-1 {
+            label = "omap4::keypad";
+            pwms = <&twl_pwm 0 7812500>;
+            max-brightness = <127>;
+        };
+
+        pwm-led-2 {
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

