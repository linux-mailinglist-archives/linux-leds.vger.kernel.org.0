Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAA3311C3FF
	for <lists+linux-leds@lfdr.de>; Thu, 12 Dec 2019 04:42:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727631AbfLLDkC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 11 Dec 2019 22:40:02 -0500
Received: from mx2.suse.de ([195.135.220.15]:58596 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726759AbfLLDkB (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 11 Dec 2019 22:40:01 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 0861BAE57;
        Thu, 12 Dec 2019 03:39:59 +0000 (UTC)
From:   =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
To:     linux-realtek-soc@lists.infradead.org, linux-leds@vger.kernel.org
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
        zypeng@titanmec.com, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [RFC 06/25] dt-bindings: leds: Add Titan Micro Electronics TM1628
Date:   Thu, 12 Dec 2019 04:39:33 +0100
Message-Id: <20191212033952.5967-7-afaerber@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191212033952.5967-1-afaerber@suse.de>
References: <20191212033952.5967-1-afaerber@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add a YAML schema binding for TM1628 LED controller.

Cc: zypeng@titanmec.com
Signed-off-by: Andreas Färber <afaerber@suse.de>
---
 @Rob: How could we express constraints on two-cell reg value ranges here?
       Should we also model constraints on reg range by #grids property?
 
 .../devicetree/bindings/leds/titanmec,tm1628.yaml  | 80 ++++++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/titanmec,tm1628.yaml

diff --git a/Documentation/devicetree/bindings/leds/titanmec,tm1628.yaml b/Documentation/devicetree/bindings/leds/titanmec,tm1628.yaml
new file mode 100644
index 000000000000..024875656e79
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/titanmec,tm1628.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/titanmec,tm1628.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Titan Micro Electronics TM1628 LED controller
+
+maintainers:
+  - Andreas Färber <afaerber@suse.de>
+
+properties:
+  compatible:
+    enum:
+    - titanmec,tm1628
+
+  reg:
+    maxItems: 1
+
+  "#grids":
+    description: |
+      Number of GRID output lines to use.
+      This limits the number of available SEG output lines.
+    minimum: 4
+    maximum: 7
+
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+
+patternProperties:
+  "^.*@[1-7],([1-9]|1[02-4])$":
+    type: object
+    description: |
+      Properties for a single LED.
+
+    properties:
+      reg:
+        description: |
+          1-based grid number, followed by 1-based segment number.
+        maxItems: 1
+
+      linux,default-trigger: true
+
+    required:
+      - reg
+
+examples:
+  - |
+    #include <dt-bindings/leds/common.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led-controller@0 {
+            compatible = "titanmec,tm1628";
+            reg = <0>;
+            spi-3-wire;
+            spi-lsb-first;
+            spi-max-frequency = <500000>;
+            #grids = <7>;
+            #address-cells = <2>;
+            #size-cells = <0>;
+
+            colon@5,4 {
+                reg = <5 4>;
+                color = <LED_COLOR_ID_WHITE>;
+                function = LED_FUNCTION_INDICATOR;
+                linux,default-trigger = "heartbeat";
+            };
+        };
+    };
+...
-- 
2.16.4

