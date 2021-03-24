Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E28D346FAD
	for <lists+linux-leds@lfdr.de>; Wed, 24 Mar 2021 03:51:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232158AbhCXCtn (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 23 Mar 2021 22:49:43 -0400
Received: from smtp2.axis.com ([195.60.68.18]:36850 "EHLO smtp2.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232078AbhCXCtY (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 23 Mar 2021 22:49:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1616554164;
  x=1648090164;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FqYAXGat8wOi5xlTyUYf8sCt90mXXCBzUhow40r7ORM=;
  b=nzC26m4YHXgL/Kl7zG9OEXOAYqIsCML15OprSSllzpV5FbIwY3rH767N
   JhUanOYHpa2PXilMFznlHZgtO27WG/zmdIePP1u2kDVK00K4buu3wWz6N
   CgyZqBOzHUf14kdCvuxMnm/JTFmhhZZ7XCYHJcECCCmqwDuNC+DGmIVnJ
   P5TGTtmtmDrSmDtVxFEsXrsTb40lMFRxbMnnPtU0m89jW+7WcuKC5CmrO
   ZVBfqllXjM84oRl9EFc1I2OgfG77EzF1rq64CJHHyEc2oyC6A8sJma5v0
   SdbANUiD6Tr+558Jp+nCJdN00+oSq3gg/BuvCkme0suvelbOsrBGf8V1O
   Q==;
From:   Hermes Zhang <chenhui.zhang@axis.com>
To:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Hermes Zhang <chenhuiz@axis.com>
CC:     <kernel@axis.com>, <linux-leds@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3] dt-binding: leds: Document leds-multi-gpio bindings
Date:   Wed, 24 Mar 2021 10:48:43 +0800
Message-ID: <20210324024844.15796-1-chenhui.zhang@axis.com>
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

Notes:
    Add maxItems

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

