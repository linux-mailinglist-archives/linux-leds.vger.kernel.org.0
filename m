Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26BCA258335
	for <lists+linux-leds@lfdr.de>; Mon, 31 Aug 2020 23:04:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727019AbgHaVEF (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 31 Aug 2020 17:04:05 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:54897 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730190AbgHaVED (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 31 Aug 2020 17:04:03 -0400
Received: from methusalix.internal.home.lespocky.de ([92.117.54.199]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MwxRN-1kX1Re1CqR-00yNfw; Mon, 31 Aug 2020 23:03:49 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.176] helo=lemmy.home.lespocky.de)
        by methusalix.internal.home.lespocky.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <alex@home.lespocky.de>)
        id 1kCqxu-0003pu-KC; Mon, 31 Aug 2020 23:03:47 +0200
Received: (nullmailer pid 28172 invoked by uid 2001);
        Mon, 31 Aug 2020 21:03:46 -0000
From:   Alexander Dahl <post@lespocky.de>
To:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Alexander Dahl <ada@thorsis.com>,
        Alexander Dahl <post@lespocky.de>
Subject: [PATCH v2 2/2] dt-bindings: leds: Convert pwm to yaml
Date:   Mon, 31 Aug 2020 23:02:31 +0200
Message-Id: <20200831210232.28052-3-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200831210232.28052-1-post@lespocky.de>
References: <20200831210232.28052-1-post@lespocky.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scan-Signature: 3731072af39ff8e356c2b9ce22b0e06d
X-Spam-Score: -2.7 (--)
X-Provags-ID: V03:K1:oM53fdvwQ3pKA3Rt7ukIWMzygtco2V05YPSfGJAXJXzKyYpxGyg
 jrkyFd9f4eZjfcAJCgoC4Gfnr6KdFDQZs5CYym7UAM0tN3t2KdOabimbgRe69CzMGs/OGUA
 XYQLxNWNRq469BiaPMxaDePmJ6Tc4GyLHU9q1v2IkWstsN0iG+J+r/Wf68UD/SLlcI8AWg6
 hec/QeHk0FamhHHmQ/CsQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:5dGDGcpVNOc=:PYFERMnt/JdpAHokOqI9Ms
 4k61D8IR5jZ1IR822VQeRMwHBUkQYBRSVuo5VBoVV7Lq2E5akSx1dytaKwZOXMI6vpLwU++2K
 Oyq3Ri3Q6pQ02q3TaRXm5vYZInb1OcoX4SKzLNJgQqBXA6NYHLlR7XaQ28JOviYpJeWvWYJcn
 synTUXE2EcSNDepuIXsQ3+a0QNMYMliEbKvZ0V6+fKmsB70daTjAPj3Q/POEh8IO+iw0TnHLx
 KQYlax/8tZWOZLSKjRfu0r56taXv6o5TQsfxWWcwP9iZjeDsUlSmf+4S5DmwNpe6YzHqmLl/c
 Hf2dodfzBwtlUc8SMTeEpiFTZedsIS5TBNssVne8BalKPnwpGRZqBOkZClOH336iTZFKFum8e
 neoM19KWIz02IRjv/z6sgfvxCXjk9gc/FpZ2BB6nOHtWd9hlgYmy3Tb6luy6Hh2Fu8867dsIo
 Ry1zb+sZBsYMEVCHpL1x+2sYSxLdhwXih6g8zbbRM7PDKpi8xDcym8mp4Hz9qSOgBSETZbnBu
 PIlsrYtA4thXETF0ENcSNfYDMktm/4/0zTySIw5N0WIcf9LMOeJ8M5PVr+9A87OMUESkxVr40
 W7kgCb002ej0XQiC9ljK9NjXqrtpEx4aQ4a5VhTd7OKFGy9KOL7AoK09HeojQ6hQBtLMxqjyw
 MV1tNH9qjAPM8JwryeITW/GpXxISjZ/qw+jke7SFPsLqoIMoT8OnVaff59A9iEsZrcuaaOpvF
 D20d8U+mIH6umKRUVghVqbTwz7Pf+Q/7rvEKVWG5XG7uhUm8fHeTIm/Ti8SStvlbrGHjFtXrM
 PyiQKTU/OX502PLX9VITgYVPWQNuW8w/t35+tg5g0vHkO/CcCsHCMrFoCRtK45onHPi50xH
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The example was adapted slightly to make use of the 'function' and
'color' properties.

Suggested-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Signed-off-by: Alexander Dahl <post@lespocky.de>
---
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
index 000000000000..8c5217f2a9f7
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-pwm.yaml
@@ -0,0 +1,85 @@
+# SPDX-License-Identifier: GPL-2.0-only
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

