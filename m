Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD33B459FF1
	for <lists+linux-leds@lfdr.de>; Tue, 23 Nov 2021 11:18:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235416AbhKWKVr (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 23 Nov 2021 05:21:47 -0500
Received: from mxout70.expurgate.net ([194.37.255.70]:44787 "EHLO
        mxout70.expurgate.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235411AbhKWKVq (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 23 Nov 2021 05:21:46 -0500
Received: from [127.0.0.1] (helo=localhost)
        by relay.expurgate.net with smtp (Exim 4.92)
        (envelope-from <fe@dev.tdt.de>)
        id 1mpSsk-0003nG-UH; Tue, 23 Nov 2021 11:18:34 +0100
Received: from [195.243.126.94] (helo=securemail.tdt.de)
        by relay.expurgate.net with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <fe@dev.tdt.de>)
        id 1mpSsk-0000IK-AH; Tue, 23 Nov 2021 11:18:34 +0100
Received: from securemail.tdt.de (localhost [127.0.0.1])
        by securemail.tdt.de (Postfix) with ESMTP id F3973240041;
        Tue, 23 Nov 2021 11:18:33 +0100 (CET)
Received: from mail.dev.tdt.de (unknown [10.2.4.42])
        by securemail.tdt.de (Postfix) with ESMTP id 8BF60240040;
        Tue, 23 Nov 2021 11:18:33 +0100 (CET)
Received: from localhost.localdomain (unknown [10.2.3.40])
        by mail.dev.tdt.de (Postfix) with ESMTPSA id E3A4C20F00;
        Tue, 23 Nov 2021 11:18:32 +0100 (CET)
From:   Florian Eckert <fe@dev.tdt.de>
To:     pavel@ucw.cz, robh+dt@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 2/2] dt: bindings: KTD20xx: Introduce the ktd20xx family of RGB drivers
Date:   Tue, 23 Nov 2021 11:18:26 +0100
Message-ID: <20211123101826.9069-3-fe@dev.tdt.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211123101826.9069-1-fe@dev.tdt.de>
References: <20211123101826.9069-1-fe@dev.tdt.de>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.dev.tdt.de
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: 151534::1637662714-00000A80-E2D6E2AE/0/0
X-purgate-type: clean
X-purgate: clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Introduce the bindings for the Kinetic KTD2061/58/59/60RGB LED device
driver. The KTD20xx can control RGB LEDs individually or as part of a
control bank group.

Signed-off-by: Florian Eckert <fe@dev.tdt.de>
---
 .../bindings/leds/leds-ktd20xx.yaml           | 123 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 124 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-ktd20xx.y=
aml

diff --git a/Documentation/devicetree/bindings/leds/leds-ktd20xx.yaml b/D=
ocumentation/devicetree/bindings/leds/leds-ktd20xx.yaml
new file mode 100644
index 000000000000..b10b5fd507db
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-ktd20xx.yaml
@@ -0,0 +1,123 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/leds-ktd20xx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LED driver for KTD20xx RGB LED from Kinetic.
+
+maintainers:
+  - Florian Eckert <fe@dev.tdt.de>
+
+description: |
+  The KTD20XX is multi-channel, I2C RGB LED Drivers that can group RGB L=
EDs into
+  a LED group or control them individually.
+
+  The difference in these RGB LED drivers is I2C address number the devi=
ce is
+  listen on.
+
+properties:
+  compatible:
+    enum:
+      - kinetic,ktd20xx
+
+  reg:
+    maxItems: 1
+    description:
+      I2C slave address
+      ktd2061/58/59/60 0x68 0x69 0x6A 0x6B
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  'kinetic,color-current0':
+    description:
+      Specifies the current selection for the RGB color0.
+      Value 1 must be the current value for the color red.
+      Value 2 must be the current value for the color green.
+      Value 3 must be the current value for the color blue.
+      The current setting range is from 0mA to 24mA with 125uA steps.
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    items:
+      - minItems: 3
+      - maxItems: 3
+
+  'kinetic,color-current1':
+    description:
+      Specifies the current selection for the RGB color0.
+      Value 1 must be the current value for the color red.
+      Value 2 must be the current value for the color green.
+      Value 3 must be the current value for the color blue.
+      The current setting range is from 0mA to 24mA with 125uA steps.
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    items:
+      - minItems: 3
+      - maxItems: 3
+
+patternProperties:
+  '^multi-led@[0-9a-f]$':
+    type: object
+    allOf:
+      - $ref: leds-class-multicolor.yaml#
+    properties:
+      reg:
+        minItems: 1
+        maxItems: 12
+        description:
+          This property denotes the LED module number(s) that is used on=
 the
+          for the child node.
+      'kinetic,color-selection':
+        description:
+          Specifies the color selection for this LED.
+          Value 1 selects the color register for color red.
+          Value 2 selects the color register for color green.
+          Value 3 selects the color register for color blue.
+          The value can be either 0 or 1. If 0, the current for the colo=
r
+          from color register 0 is used. If 1, the current for the color
+          from color register 1 is used.
+     $ref: /schemas/types.yaml#/definitions/uint8-array
+     items:
+       - minItems: 3
+       - maxItems: 3
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+   #include <dt-bindings/leds/common.h>
+
+   i2c {
+       #address-cells =3D <1>;
+       #size-cells =3D <0>;
+
+       led-controller@14 {
+           compatible =3D "ti,lp5009";
+           reg =3D <0x14>;
+           #address-cells =3D <1>;
+           #size-cells =3D <0>;
+           color-current0 =3D [ 00 00 00 ] // Current for RGB is 0mA
+           color-current1 =3D [ 28 28 28 ] // Current for RGB is 5mA
+
+           multi-led@0 {
+               reg =3D <0x0>;
+               color =3D <LED_COLOR_ID_RGB>;
+               function =3D LED_FUNCTION_CHARGING;
+                kinetic,color-selection =3D [ 00 01 00 ]; // Red=3D0mA G=
reen=3D5mA Blue=3D0mA
+          };
+
+          multi-led@2 {
+            reg =3D <0x2>;
+            color =3D <LED_COLOR_ID_RGB>;
+            function =3D LED_FUNCTION_STANDBY;
+         };
+       };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 736d564f7e93..125bae48c2d1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10607,6 +10607,7 @@ KTD20XX LED CONTROLLER DRIVER
 M:	Florian Eckert <fe@dev.tdt.de>
 L:	linux-leds@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/leds/leds-ktd20xx.yaml
 F:	drivers/leds/leds-ktd20xx.c
=20
 KTEST
--=20
2.20.1

