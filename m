Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 978F434A106
	for <lists+linux-leds@lfdr.de>; Fri, 26 Mar 2021 06:29:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229868AbhCZF25 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 26 Mar 2021 01:28:57 -0400
Received: from smtp1.axis.com ([195.60.68.17]:33596 "EHLO smtp1.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229768AbhCZF2u (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 26 Mar 2021 01:28:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1616736530;
  x=1648272530;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=12+QAqTdS5qEp89208RDidsj2Q1eud0YTGtFQmVg0vo=;
  b=JcZMiBPmA9/qy007eOFDfD0y9dirLnQh+es/BeUW4BSToRB23rHkjkFe
   91AjoMBsaUBTTEOeQNvDZMC+mQxIKtI0rAbTv/QFlWZKEcPO7x5EOuGVX
   QJxO35PRAaJ8R9fVfo33Om8ZAYdJuX/x8R1uWwVnYw/Zgo4OXGfOokBUI
   gJVVGLv2Nu3pyMxI/cQY628mZmUL7JUrqtx4yv7WIQkNndvHzcJcNqLQC
   VU4ruOsZJK67k+ojyBkk761mC4nizwnmFfUOJXfdorgYiFN4+GMISd9os
   R40mw6upGfNAQr/fwmroVcHX2cV8fSqthEsFA2Q/WHKMx/OiIbZaYn+iK
   g==;
From:   Hermes Zhang <chenhui.zhang@axis.com>
To:     <pavel@ucw.cz>, <dmurphy@ti.com>, <robh+dt@kernel.org>
CC:     <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <chenhuiz@axis.com>,
        <lkml@axis.com>, <kernel@axis.com>
Subject: [PATCH v2 1/2] dt-binding: leds: Document leds-multi-gpio bindings
Date:   Fri, 26 Mar 2021 13:28:00 +0800
Message-ID: <20210326052801.17666-2-chenhui.zhang@axis.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210326052801.17666-1-chenhui.zhang@axis.com>
References: <20210326052801.17666-1-chenhui.zhang@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Hermes Zhang <chenhuiz@axis.com>

This binding represents LED devices which are controller with
multiple GPIO lines in order to achieve more than two brightness
states.

Signed-off-by: Hermes Zhang <chenhuiz@axis.com>
---
 .../bindings/leds/leds-multi-gpio.yaml        | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-multi-gpio.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-multi-gpio.yaml b/Documentation/devicetree/bindings/leds/leds-multi-gpio.yaml
new file mode 100644
index 000000000000..1549f21e8d6e
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-multi-gpio.yaml
@@ -0,0 +1,50 @@
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
+    maxItems: 256 # Should be enough
+
+required:
+  - compatible
+  - led-gpios
+  - led-states
+
+additionalProperties: false
+
+examples:
+  - |
+    gpios-led {
+      compatible = "multi-gpio-led";
+
+      led-gpios = <&gpio0 23 0x1>,
+                  <&gpio0 24 0x1>;
+      led-states = /bits/ 8 <0x00 0x01 0x02 0x03>;
+    };
+...
-- 
2.20.1

