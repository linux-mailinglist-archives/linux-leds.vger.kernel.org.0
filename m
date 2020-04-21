Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 529321B2FE3
	for <lists+linux-leds@lfdr.de>; Tue, 21 Apr 2020 21:14:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbgDUTOd (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 21 Apr 2020 15:14:33 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:60988 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726100AbgDUTOc (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 21 Apr 2020 15:14:32 -0400
Received: from localhost.localdomain (80-110-124-168.cgn.dynamic.surfer.at [80.110.124.168])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 12403C4CB7;
        Tue, 21 Apr 2020 19:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1587496470; bh=mOLV8x1mo4P72BrSbNMNW0QKdQku/B/uSphwcxsPkns=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=beL8A6cYYL5HNRXvU7KfvfJkPppTqMlfRmrP2DiuLuwZZJJVzj6KJqdBHTloi+45T
         PE04g6RTWgrydlgWbwVEV/Mp0sQMiSlCn5D20D1BFnGOXKrloToIEGbxyIcwaINfE0
         VsaTLUFp8H4tSzTUzBZY8jlVKA5Pm1WGnE5qLXiM=
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
        ~postmarketos/upstreaming@lists.sr.ht, Luca Weiss <luca@z3ntu.xyz>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 1/2] dt-bindings: leds: Add binding for sgm3140
Date:   Tue, 21 Apr 2020 21:13:53 +0200
Message-Id: <20200421191354.1443017-2-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200421191354.1443017-1-luca@z3ntu.xyz>
References: <20200421191354.1443017-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add YAML devicetree binding for SGMICRO SGM3140 charge pump used for
camera flash LEDs.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
Reviewed-by: Dan Murphy <dmurphy@ti.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes since v2:
 - add 'type: object' to led property
 - rename dt node in example from sgm3140 to led-controller to match dt spec

 .../bindings/leds/leds-sgm3140.yaml           | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-sgm3140.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-sgm3140.yaml b/Documentation/devicetree/bindings/leds/leds-sgm3140.yaml
new file mode 100644
index 0000000000000..ecf7ac9ab0673
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-sgm3140.yaml
@@ -0,0 +1,62 @@
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
+    type: object
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
+    led-controller {
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
2.26.1

