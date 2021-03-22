Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD66D343BD3
	for <lists+linux-leds@lfdr.de>; Mon, 22 Mar 2021 09:33:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbhCVIc3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 22 Mar 2021 04:32:29 -0400
Received: from smtp1.axis.com ([195.60.68.17]:36704 "EHLO smtp1.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229647AbhCVIcV (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 22 Mar 2021 04:32:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1616401942;
  x=1647937942;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=WWBdYwCLBvXlp84iLsNbcu996K9YdjCoBkIe4q9fA74=;
  b=WSO5wb5zeJdLUm5wGg+5521fPYLWBcKRIzl4QEVplC3N50w8qnPDMXi2
   bM47wkUkpzJPEMgMLS7M+YBRPFTpvTy/NhUA7zk4wfnfRJuOxExnC11Y4
   8mTWXEhgg0+fSOCRE9ckR+M4T3mW96wNQnLTRQt5bS2Ek3j+MUsoTXSBe
   Zch+X923EpzCQtdFQ5eliQCqy9RSDRYOGb0GAHiph3ySEl6Ij/zh+SWdt
   0oRKlHNgR2Cr9XF5Xz4ywVC/76YCOAdK/KH/AoXrwoeG/hl+4BE8XEpgv
   LZhwb3g9SEZyDqvt8+OjEritKXfurUqpqQYr6pS2fYshsEteA1Mb+OrUG
   w==;
From:   Hermes Zhang <chenhui.zhang@axis.com>
To:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Hermes Zhang <chenhuiz@axis.com>
CC:     <kernel@axis.com>, <linux-leds@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] dt-binding: leds: Document leds-multi-gpio bindings
Date:   Mon, 22 Mar 2021 16:31:45 +0800
Message-ID: <20210322083145.10919-1-chenhui.zhang@axis.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Hermes Zhang <chenhuiz@axis.com>

Document the device tree bindings of the multiple GPIOs LED driver
Documentation/devicetree/bindings/leds/leds-multi-gpio.yaml.

Signed-off-by: Hermes Zhang <chenhuiz@axis.com>
---
 .../bindings/leds/leds-multi-gpio.yaml        | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-multi-gpio.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-multi-gpio.yaml b/Documentation/devicetree/bindings/leds/leds-multi-gpio.yaml
new file mode 100644
index 000000000000..09e7b60a800e
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-multi-gpio.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/leds-multi-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Multiple GPIOs LED driver
+
+maintainers:
+  - Hermes Zhang <chenhuiz@axis.com>
+
+description:
+  This will support some LED made of multiple GPIOs and the brightness of the
+  LED could map to different states of the GPIOs.
+
+properties:
+  compatible:
+    const: multi-gpio-led
+
+  led-gpios:
+    description: Array of one or more GPIOs pins used to control the LED.
+    minItems: 1
+    maxItems: 8  # Should be enough
+
+  led-states:
+    description: |
+      The array list the supported states here which will map to brightness
+      from 0 to maximum. Each item in the array will present all the GPIOs
+      value by bit.
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    minItems: 1
+
+required:
+  - compatible
+  - led-gpios
+  - led-states
+
+examples:
+  - |
+    gpios-led {
+      compatible = "multi-gpio-led";
+
+      led-gpios = <&gpio0 23 0x1>,
+                  <&gpio0 24 0x1>;
+      led-states = /bit/ 8 <0x00 0x01 0x02 0x03>;
+    };
+...
-- 
2.20.1

