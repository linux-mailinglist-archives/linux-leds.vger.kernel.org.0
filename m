Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1186347317
	for <lists+linux-leds@lfdr.de>; Wed, 24 Mar 2021 08:58:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235959AbhCXH5v (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 24 Mar 2021 03:57:51 -0400
Received: from smtp2.axis.com ([195.60.68.18]:32629 "EHLO smtp2.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235974AbhCXH5d (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 24 Mar 2021 03:57:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1616572653;
  x=1648108653;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mFdWLTGtRF/mvjQCBNmal6km7ou+oaXMQ5r2PDBTfKI=;
  b=GEbU7jKOWpjYTH7rx6T81Kf0xbZUjKBqrRvBfYkdj74Rr3oG42xWvEU1
   KiIDtkMIbW7IG9d/yXCZEB1W08LdcxVMNJLQ0MR0JuXzMiY71nWQmJWlD
   /ahWLGdvyU3RHb5BNzScJkn7C9JpbykCtHwU3HO2Ny8COVWoPDouzCLfh
   uck0GAUa082TgNRIk2jNzhrYlVXlR+q8xKUC9E/+SuUYhOJypHclqL6KV
   lAWe0HoJAvneMUdUb3zuKvqObGL7r5c+9ghg3DKAF4a1uZadpOoli8rOl
   PGiZhI9cgKa1xyND3FTauK6QtQJXY2hQZPX6Q7HJC/90CScrEUwx2S6LB
   Q==;
From:   Hermes Zhang <chenhui.zhang@axis.com>
To:     <pavel@ucw.cz>, <dmurphy@ti.com>, <robh+dt@kernel.org>
CC:     <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <chenhuiz@axis.com>,
        <lkml@axis.com>, <kernel@axis.com>
Subject: [PATCH 2/2] dt-binding: leds: Document leds-multi-gpio bindings
Date:   Wed, 24 Mar 2021 15:56:31 +0800
Message-ID: <20210324075631.5004-3-chenhui.zhang@axis.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210324075631.5004-1-chenhui.zhang@axis.com>
References: <20210324075631.5004-1-chenhui.zhang@axis.com>
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
 .../bindings/leds/leds-multi-gpio.yaml        | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-multi-gpio.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-multi-gpio.yaml b/Documentation/devicetree/bindings/leds/leds-multi-gpio.yaml
new file mode 100644
index 000000000000..6f2b47487b90
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
+    maxItems: 16 # Should be enough
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

