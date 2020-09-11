Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3229266306
	for <lists+linux-leds@lfdr.de>; Fri, 11 Sep 2020 18:09:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726636AbgIKQJb (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 11 Sep 2020 12:09:31 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:50601 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726543AbgIKPwk (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 11 Sep 2020 11:52:40 -0400
Received: from methusalix.internal.home.lespocky.de ([109.250.103.56]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MGA0o-1kK4Z30yom-00GafJ; Fri, 11 Sep 2020 17:41:05 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.176] helo=lemmy.home.lespocky.de)
        by methusalix.internal.home.lespocky.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <alex@home.lespocky.de>)
        id 1kGlAc-00013I-Pk; Fri, 11 Sep 2020 17:41:03 +0200
Received: (nullmailer pid 28469 invoked by uid 2001);
        Fri, 11 Sep 2020 15:41:02 -0000
From:   Alexander Dahl <post@lespocky.de>
To:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Alexander Dahl <ada@thorsis.com>,
        Alexander Dahl <post@lespocky.de>
Subject: [PATCH v4 3/3] dt-bindings: leds: Convert pwm to yaml
Date:   Fri, 11 Sep 2020 17:40:04 +0200
Message-Id: <20200911154004.28354-4-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200911154004.28354-1-post@lespocky.de>
References: <20200911154004.28354-1-post@lespocky.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scan-Signature: a27db00201996a3601d2552749fb2316
X-Spam-Score: -2.9 (--)
X-Provags-ID: V03:K1:Rc3ucBdQVYvH6p2B5iOmO02x3lqJqnDJA5ydqTPMWrr+j+/QhWs
 68YtQfgrNlfvdAGmhLSRSSxlEUDXwjoOkkGdF82QLXgft6mbX1onkJr5QuV3ThjOdExzG29
 p89l4CbhlKVMM9YZr68X73yyz3zYp+NyK40x4tYNd/zL0AXoBHFxHVbpxuvfSZgqZaf1vEh
 aY2i+mEWpL1iwyrcECLRA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:IH+swAikRnU=:21r7u4idBYz0sqesfkxQoK
 I5E8GY1pbmiQRPUj0Sjcci4U2CxWbUqbpLPMlxbIgt2iY71SRk+xO+a4jEFXuPctfmvnf6yPJ
 KSvZYXlhwkGokPgfn1pcegc26FaQcR1IUomq7hbfXUc4hsdIOq07dma7rbKiqoNECkbSNABk9
 Niz5E+o3BA8V1NCdvg7Ks0T5vOtjslVbSD9w5WUjLoIej9SPD9qKiN291NlXJFJOVEdGyaudU
 fdesmlBj0LQsDMzwrzqHPUeAseTHJ4fO/wF5HbnFR2+mDPWlx0BF4BGsyjoKre74oA67tcmvK
 ajO8xvZ1rzWDqbqWhYpu855Q+8zGUUdbBzs4Nwbb5QQ5dffOXgGn1YG1e+MYwRvMVHkIvl21J
 azkJYsosTkIb8vDkaDXJE5WrzlJpJD759OMy2P+kgb0aV8NmISPMNeMl/SvOgEAponCIkLxPA
 rHpcQ+DNCBAOw535LB7O3i0AXjXsd4YBbYMg05eItUhYmddTME+8GEHSqtuoFjs+nfCuH3ivv
 2qAhV04kCs0bHszex3VEFvIE4vMzaPWDDoI/LSjlBviq25MWtPo5n+AoKFIWeab+o5Quua0kM
 xBg2QPA0kyOQb4ZrI36+Z8cTKlF4xv+wompbqIjw4993FsYp/AFgPCgPTrVZK9CD/eGv2rgF7
 duCVCASRr4uxhdheaKCp2gmlCfLa7EcmoIxQsYQtCiBF1gAUvQCJDWN9cTjQDBUPv00AE5mTp
 fBG0mAAOJbj8TqPzf3+QeaPNy1UbjP/x5zTAuDlUvbQjDBwMqaLQ4SsXKHjrWX+8ynb/Sb5ri
 qZfoxBS8qVLNrREFqDnsYPxqCgRuIKotYRn0vnxBN9RXUyhMkUKxlBw6AreM6J6UPq0rr8v
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The example was adapted slightly to make use of the 'function' and
'color' properties.  License discussed with the original author.

Suggested-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Signed-off-by: Alexander Dahl <post@lespocky.de>
Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
---

Notes:
    v3 -> v4:
      * added Cc to original author of the binding
    
    v2 -> v3:
      * changed license identifier to recommended one
      * added Acked-by
    
    v2:
      * added this patch to series (Suggested-by: Jacek Anaszewski)

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

