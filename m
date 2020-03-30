Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8F381984CE
	for <lists+linux-leds@lfdr.de>; Mon, 30 Mar 2020 21:48:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728440AbgC3TsQ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 30 Mar 2020 15:48:16 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:38694 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727714AbgC3TsN (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 30 Mar 2020 15:48:13 -0400
Received: from localhost.localdomain (80-110-124-168.cgn.dynamic.surfer.at [80.110.124.168])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 4928FC44C1;
        Mon, 30 Mar 2020 19:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1585597690; bh=Np0xyG3Mre4RucCm1kr4CA7C/slS6fE9Khmx6Rtwb+E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=cLVsSqbKSBRv+ARK8n5oRXur0fEmhgcmaGTDQKOvIrKH4nvG4BOohAQTrzhhgxVGg
         AZcLkbRzAXYAb4j+lr2a84paMXiAAx9VSynDTsCTFF0ql5xmYIJd8Zzy93PFNGZqTQ
         lPRYXqpvjjyj6hsvHI5upz3ued4EHkLr6Ibu5FIM=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-leds@vger.kernel.org
Cc:     Dan Murphy <dmurphy@ti.com>, Heiko Stuebner <heiko@sntech.de>,
        Icenowy Zheng <icenowy@aosc.io>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, Luca Weiss <luca@z3ntu.xyz>
Subject: [PATCH v2 1/2] dt-bindings: leds: Add binding for sgm3140
Date:   Mon, 30 Mar 2020 21:47:56 +0200
Message-Id: <20200330194757.2645388-2-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200330194757.2645388-1-luca@z3ntu.xyz>
References: <20200330194757.2645388-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add YAML devicetree binding for SGMICRO SGM3140 charge pump used for
camera flash LEDs.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
Changes since v1:
- Add vin-supply
- Add led subnode (common.yaml)

 .../bindings/leds/leds-sgm3140.yaml           | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-sgm3140.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-sgm3140.yaml b/Documentation/devicetree/bindings/leds/leds-sgm3140.yaml
new file mode 100644
index 000000000000..24ca178e5d0a
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-sgm3140.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/leds-sgm3140.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SGMICRO SGM3140 500mA Buck/Boost Charge Pump LED Driver
+
+maintainers:
+  - Luca Weiss <luca@z3ntu.xyz>
+
+description: |
+  The SGM3140 is a current-regulated charge pump which can regulate two current
+  levels for Flash and Torch modes.
+
+  The data sheet can be found at:
+    http://www.sg-micro.com/uploads/soft/20190626/1561535688.pdf
+
+properties:
+  compatible:
+    const: sgmicro,sgm3140
+
+  enable-gpios:
+    maxItems: 1
+    description: A connection to the 'EN' pin.
+
+  flash-gpios:
+    maxItems: 1
+    description: A connection to the 'FLASH' pin.
+
+  vin-supply:
+    description: Regulator providing power to the 'VIN' pin.
+
+  led:
+    allOf:
+      - $ref: common.yaml#
+
+required:
+  - compatible
+  - flash-gpios
+  - enable-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/leds/common.h>
+
+    sgm3140 {
+        compatible = "sgmicro,sgm3140";
+        flash-gpios = <&pio 3 24 GPIO_ACTIVE_HIGH>; /* PD24 */
+        enable-gpios = <&pio 2 3 GPIO_ACTIVE_HIGH>; /* PC3 */
+        vin-supply = <&reg_dcdc1>;
+
+        sgm3140_flash: led {
+            function = LED_FUNCTION_FLASH;
+            color = <LED_COLOR_ID_WHITE>;
+            flash-max-timeout-us = <250000>;
+        };
+    };
-- 
2.26.0

