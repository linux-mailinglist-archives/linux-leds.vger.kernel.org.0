Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 582E227F635
	for <lists+linux-leds@lfdr.de>; Thu,  1 Oct 2020 01:48:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732026AbgI3Xr6 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 30 Sep 2020 19:47:58 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:42693 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731987AbgI3Xr5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 30 Sep 2020 19:47:57 -0400
Received: from methusalix.internal.home.lespocky.de ([92.117.51.117]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1Mwfn8-1kdu1f2EiA-00yCgd; Thu, 01 Oct 2020 01:47:33 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.176] helo=lemmy.home.lespocky.de)
        by methusalix.internal.home.lespocky.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <alex@home.lespocky.de>)
        id 1kNloo-0007ZJ-9x; Thu, 01 Oct 2020 01:47:31 +0200
Received: (nullmailer pid 7752 invoked by uid 2001);
        Wed, 30 Sep 2020 23:47:30 -0000
From:   Alexander Dahl <post@lespocky.de>
To:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Alexander Dahl <ada@thorsis.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Alexander Dahl <post@lespocky.de>
Subject: [PATCH v6 2/7] dt-bindings: leds: Convert pwm to yaml
Date:   Thu,  1 Oct 2020 01:46:32 +0200
Message-Id: <20200930234637.7573-3-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200930234637.7573-1-post@lespocky.de>
References: <20200930234637.7573-1-post@lespocky.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scan-Signature: 3e58d80bea5cd590cac74c0f13974345
X-Spam-Score: -2.8 (--)
X-Provags-ID: V03:K1:hfrLk1T8O692sf7nZscqnW4Dj6gvVbgjOMm7r0YveLSarxy1RFM
 lX2vRgrZ1ZnfGVX2N0J7nPfxdWZnjEg9G1Rvwvs4kD+1x77Mv19tpU+MosAML9JaEKv9boW
 SEvUA49l5lJSWvpybP7CocnT9WT703aXxjbHO8dNSe54qawO5DYZywTeoSVAg9st7Culvfe
 bVuUMi5aEcCmLMxUB6DwQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:XTXFdxDXZEM=:eiF/IjUd7CfQR0dARIuICJ
 q9Dus1NJnVUgK/KGLuZwo+x39IZTOx0yMGf424RXRGyDkAcVfUnD3u/UffsvfQBzNXcI2Vtnc
 Du41VAdojZ5HkaoguhR1kZfeTsET6KbQ9/Qfy54jzISjuTFiwASJ5j6lCPCmrk519nFQycTCy
 1v3kOtOJ0Cg8gNMFPQFCjpGYeENC1tXWQSSsTPpQn0njfNblARkTTNIOHkyL5BBWnurWI5ih3
 tpH10pzJ3g76+iynDJXL0PkR/5mfRGtwDMdFyZg0AZR5zvaHODR+FApjMAcdyLUqn2/gPDLLN
 quL6vsZchd9SRaOmIkEu6YW21wt9H44r9W6mBSOFpMtYhEfGJVTS55beaxMzYaMn/PpEUw50o
 sr3HFdJg3jVFYcoRFArx3uVgGl2xk/1Qpl6CAtQVb2dhqiqF4YaA88GHu4soLc9ihISuX+Ea5
 AVe13HFoKqssvMv5W3eA3/SpKY9qgw/cSncM8GIzv4CdTWY/tdK+ixwofvhAVtK1Wmu8hbQz+
 ENGIUuLAIUnozCeJwCtSpDU2wLhDkwZGd6sC8S7tArzf86VCAYW3oQwWK1O8HFfzEm4jntyDj
 aqXpHWUSX60DXAPrp/vkKj3nR7HnwSBCitfET693nNE7NQNahXXIPj0SeWV3qSglN6XJpN8qo
 15OeH8WgahMI1suYSwWhosnkT/e22Xd4qIy0gr4PruuznpvH+YhhXcjvAQ/dg7QADilgt2oPz
 cVMBN+IGXHCZKpf7v39UOtE4bg6RXMuDdan8DL1iRY5oXWsc4I15WfHJiCCUY7/sS9d6w17k7
 DpPqFVI0Idfgei/qcbrDZxqyktzruSXiBg/FcaVJ+TAve8y8685jwwvK/waVp1W6/kWxglx
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The example was adapted in the following ways:

- make use of the now supported 'function' and 'color' properties
- remove pwm nodes, those are documented elsewhere
- tweake node names to be matched by new dtschema rules

License was discussed with the original author.

Suggested-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Signed-off-by: Alexander Dahl <post@lespocky.de>
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
---

Notes:
    v5 -> v6:
      * removed pwm nodes from example (Rob)
      * renamed led-controller node in example (Rob)
    
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

 .../devicetree/bindings/leds/leds-pwm.txt     | 50 -------------
 .../devicetree/bindings/leds/leds-pwm.yaml    | 70 +++++++++++++++++++
 2 files changed, 70 insertions(+), 50 deletions(-)
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
index 000000000000..fe4d5fd25913
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-pwm.yaml
@@ -0,0 +1,70 @@
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
+    led-controller {
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

