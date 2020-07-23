Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D68C522AFB5
	for <lists+linux-leds@lfdr.de>; Thu, 23 Jul 2020 14:53:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728289AbgGWMx0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 Jul 2020 08:53:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728134AbgGWMx0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 Jul 2020 08:53:26 -0400
Received: from mail.nic.cz (lists.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAB8EC0619E2;
        Thu, 23 Jul 2020 05:53:25 -0700 (PDT)
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 849D21409FC;
        Thu, 23 Jul 2020 14:53:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1595508803; bh=g9VYd6zwE87aZES+pRe4qt8hT60KMG7StUvV1ACXxsM=;
        h=From:To:Date;
        b=xERWZXcqTqBwhbWhl4sJqas86hBCQivv8Hq4BGmjlyA4rRq+oU8J2QfowYvdDT2mF
         2ccVB8drRt7K08PtcF5xypjTrYOVh7L89it84EAt1G5wVLAgI7Jh0WM+GQlPxPA6x7
         RN83xN37AD7TQYIImRmO4A/umaoYfC/omUYIv8sw=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, jacek.anaszewski@gmail.com,
        Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v7 1/3] dt-bindings: leds: add cznic,turris-omnia-leds binding
Date:   Thu, 23 Jul 2020 14:53:18 +0200
Message-Id: <20200723125320.3572-2-marek.behun@nic.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200723125320.3572-1-marek.behun@nic.cz>
References: <20200723125320.3572-1-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Spam-Status: No, score=0.00
X-Spamd-Bar: /
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add device-tree bindings documentation for Turris Omnia RGB LEDs.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Reviewed-by: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
---
 .../leds/cznic,turris-omnia-leds.yaml         | 90 +++++++++++++++++++
 1 file changed, 90 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml

diff --git a/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml b/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
new file mode 100644
index 000000000000..24ad1446445e
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
@@ -0,0 +1,90 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/cznic,turris-omnia-leds.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: CZ.NIC's Turris Omnia LEDs driver
+
+maintainers:
+  - Marek Behún <marek.behun@nic.cz>
+
+description:
+  This module adds support for the RGB LEDs found on the front panel of the
+  Turris Omnia router. There are 12 RGB LEDs that are controlled by a
+  microcontroller that communicates via the I2C bus. Each LED is described
+  as a subnode of this I2C device.
+
+properties:
+  compatible:
+    const: cznic,turris-omnia-leds
+
+  reg:
+    description: I2C slave address of the microcontroller.
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^multi-led[0-9a-f]$":
+    type: object
+    allOf:
+      - $ref: leds-class-multicolor.yaml#
+    description:
+      This node represents one of the RGB LED devices on Turris Omnia.
+      No subnodes need to be added for subchannels since this controller only
+      supports RGB LEDs.
+
+    properties:
+      reg:
+        minimum: 0
+        maximum: 11
+        description:
+          This property identifies one of the LEDs on the front panel of the
+          Turris Omnia router.
+
+    required:
+      - reg
+
+additionalProperties: false
+
+examples:
+  - |
+
+    #include <dt-bindings/leds/common.h>
+
+    i2c0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led-controller@2b {
+            compatible = "cznic,turris-omnia-leds";
+            reg = <0x2b>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            multi-led@0 {
+                /*
+                 * No subnodes are needed, this controller only supports RGB
+                 * LEDs.
+                 */
+                reg = <0>;
+                color = <LED_COLOR_ID_MULTI>;
+                function = LED_FUNCTION_POWER;
+                linux,default-trigger = "heartbeat";
+            };
+
+            multi-led@a {
+                reg = <0xa>;
+                color = <LED_COLOR_ID_MULTI>;
+                function = LED_FUNCTION_INDICATOR;
+                function-enumerator = <1>;
+            };
+        };
+    };
+
+...
-- 
2.26.2

