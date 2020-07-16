Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D3F7222AF1
	for <lists+linux-leds@lfdr.de>; Thu, 16 Jul 2020 20:21:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729675AbgGPSVi (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 16 Jul 2020 14:21:38 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:40308 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729376AbgGPSUl (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 16 Jul 2020 14:20:41 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06GIKPSb062340;
        Thu, 16 Jul 2020 13:20:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1594923625;
        bh=juBiQZHxMAoRN/W87kLa4mglUiBZbwNotHQKJ8N1fLk=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=JU4H56qNUzsnm1CrVwau8bsRgabnsZAKn4y15bvDVHE3lZC3Obu0oODaM6ayff5s0
         B0vhjBJhfqufuyco+H8O736rCNugxsXgT/pOet57MhplC/clmKEwMpIcxDjvp+t4HW
         VfnxzTQ/ZdmsrutAFDBFhGvSZzCC5ngzi3nYQbsI=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06GIKPP9042814
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 16 Jul 2020 13:20:25 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 16
 Jul 2020 13:20:24 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 16 Jul 2020 13:20:24 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06GIKO2g024794;
        Thu, 16 Jul 2020 13:20:24 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh@kernel.org>,
        <marek.behun@nic.cz>
CC:     <devicetree@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v31 04/12] dt-bindings: leds: Convert leds-lp55xx to yaml
Date:   Thu, 16 Jul 2020 13:19:59 -0500
Message-ID: <20200716182007.18389-5-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200716182007.18389-1-dmurphy@ti.com>
References: <20200716182007.18389-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Convert the leds-lp55xx.txt to yaml binding.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 .../devicetree/bindings/leds/leds-lp55xx.txt  | 228 ------------------
 .../devicetree/bindings/leds/leds-lp55xx.yaml | 220 +++++++++++++++++
 2 files changed, 220 insertions(+), 228 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-lp55xx.txt
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lp55xx.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-lp55xx.txt b/Documentation/devicetree/bindings/leds/leds-lp55xx.txt
deleted file mode 100644
index 1b66a413fb9d..000000000000
--- a/Documentation/devicetree/bindings/leds/leds-lp55xx.txt
+++ /dev/null
@@ -1,228 +0,0 @@
-Binding for TI/National Semiconductor LP55xx Led Drivers
-
-Required properties:
-- compatible: one of
-	national,lp5521
-	national,lp5523
-	ti,lp55231
-	ti,lp5562
-	ti,lp8501
-
-- reg: I2C slave address
-- clock-mode: Input clock mode, (0: automode, 1: internal, 2: external)
-
-Each child has own specific current settings
-- led-cur: Current setting at each led channel (mA x10, 0 if led is not connected)
-- max-cur: Maximun current at each led channel.
-
-Optional properties:
-- enable-gpio: GPIO attached to the chip's enable pin
-- label: Used for naming LEDs
-- pwr-sel: LP8501 specific property. Power selection for output channels.
-         0: D1~9 are connected to VDD
-         1: D1~6 with VDD, D7~9 with VOUT
-         2: D1~6 with VOUT, D7~9 with VDD
-         3: D1~9 are connected to VOUT
-
-Alternatively, each child can have a specific channel name and trigger:
-- chan-name (optional): name of channel
-- linux,default-trigger (optional): see
-  Documentation/devicetree/bindings/leds/common.txt
-
-example 1) LP5521
-3 LED channels, external clock used. Channel names are 'lp5521_pri:channel0',
-'lp5521_pri:channel1' and 'lp5521_pri:channel2', with a heartbeat trigger
-on channel 0.
-
-lp5521@32 {
-	compatible = "national,lp5521";
-	reg = <0x32>;
-	label = "lp5521_pri";
-	clock-mode = /bits/ 8 <2>;
-
-	chan0 {
-		led-cur = /bits/ 8 <0x2f>;
-		max-cur = /bits/ 8 <0x5f>;
-		linux,default-trigger = "heartbeat";
-	};
-
-	chan1 {
-		led-cur = /bits/ 8 <0x2f>;
-		max-cur = /bits/ 8 <0x5f>;
-	};
-
-	chan2 {
-		led-cur = /bits/ 8 <0x2f>;
-		max-cur = /bits/ 8 <0x5f>;
-	};
-};
-
-example 2) LP5523
-9 LED channels with specific name. Internal clock used.
-The I2C slave address is configurable with ASEL1 and ASEL0 pins.
-Available addresses are 32/33/34/35h.
-
-ASEL1    ASEL0    Address
--------------------------
- GND      GND       32h
- GND      VEN       33h
- VEN      GND       34h
- VEN      VEN       35h
-
-lp5523@32 {
-	compatible = "national,lp5523";
-	reg = <0x32>;
-	clock-mode = /bits/ 8 <1>;
-
-	chan0 {
-		chan-name = "d1";
-		led-cur = /bits/ 8 <0x14>;
-		max-cur = /bits/ 8 <0x20>;
-	};
-
-	chan1 {
-		chan-name = "d2";
-		led-cur = /bits/ 8 <0x14>;
-		max-cur = /bits/ 8 <0x20>;
-	};
-
-	chan2 {
-		chan-name = "d3";
-		led-cur = /bits/ 8 <0x14>;
-		max-cur = /bits/ 8 <0x20>;
-	};
-
-	chan3 {
-		chan-name = "d4";
-		led-cur = /bits/ 8 <0x14>;
-		max-cur = /bits/ 8 <0x20>;
-	};
-
-	chan4 {
-		chan-name = "d5";
-		led-cur = /bits/ 8 <0x14>;
-		max-cur = /bits/ 8 <0x20>;
-	};
-
-	chan5 {
-		chan-name = "d6";
-		led-cur = /bits/ 8 <0x14>;
-		max-cur = /bits/ 8 <0x20>;
-	};
-
-	chan6 {
-		chan-name = "d7";
-		led-cur = /bits/ 8 <0x14>;
-		max-cur = /bits/ 8 <0x20>;
-	};
-
-	chan7 {
-		chan-name = "d8";
-		led-cur = /bits/ 8 <0x14>;
-		max-cur = /bits/ 8 <0x20>;
-	};
-
-	chan8 {
-		chan-name = "d9";
-		led-cur = /bits/ 8 <0x14>;
-		max-cur = /bits/ 8 <0x20>;
-	};
-};
-
-example 3) LP5562
-4 channels are defined.
-
-lp5562@30 {
-	compatible = "ti,lp5562";
-	reg = <0x30>;
-	clock-mode = /bits/8 <2>;
-
-	chan0 {
-		chan-name = "R";
-		led-cur = /bits/ 8 <0x20>;
-		max-cur = /bits/ 8 <0x60>;
-	};
-
-	chan1 {
-		chan-name = "G";
-		led-cur = /bits/ 8 <0x20>;
-		max-cur = /bits/ 8 <0x60>;
-	};
-
-	chan2 {
-		chan-name = "B";
-		led-cur = /bits/ 8 <0x20>;
-		max-cur = /bits/ 8 <0x60>;
-	};
-
-	chan3 {
-		chan-name = "W";
-		led-cur = /bits/ 8 <0x20>;
-		max-cur = /bits/ 8 <0x60>;
-	};
-};
-
-example 4) LP8501
-9 channels are defined. The 'pwr-sel' is LP8501 specific property.
-Others are same as LP5523.
-
-lp8501@32 {
-	compatible = "ti,lp8501";
-	reg = <0x32>;
-	clock-mode = /bits/ 8 <2>;
-	pwr-sel = /bits/ 8 <3>;	/* D1~9 connected to VOUT */
-
-	chan0 {
-		chan-name = "d1";
-		led-cur = /bits/ 8 <0x14>;
-		max-cur = /bits/ 8 <0x20>;
-	};
-
-	chan1 {
-		chan-name = "d2";
-		led-cur = /bits/ 8 <0x14>;
-		max-cur = /bits/ 8 <0x20>;
-	};
-
-	chan2 {
-		chan-name = "d3";
-		led-cur = /bits/ 8 <0x14>;
-		max-cur = /bits/ 8 <0x20>;
-	};
-
-	chan3 {
-		chan-name = "d4";
-		led-cur = /bits/ 8 <0x14>;
-		max-cur = /bits/ 8 <0x20>;
-	};
-
-	chan4 {
-		chan-name = "d5";
-		led-cur = /bits/ 8 <0x14>;
-		max-cur = /bits/ 8 <0x20>;
-	};
-
-	chan5 {
-		chan-name = "d6";
-		led-cur = /bits/ 8 <0x14>;
-		max-cur = /bits/ 8 <0x20>;
-	};
-
-	chan6 {
-		chan-name = "d7";
-		led-cur = /bits/ 8 <0x14>;
-		max-cur = /bits/ 8 <0x20>;
-	};
-
-	chan7 {
-		chan-name = "d8";
-		led-cur = /bits/ 8 <0x14>;
-		max-cur = /bits/ 8 <0x20>;
-	};
-
-	chan8 {
-		chan-name = "d9";
-		led-cur = /bits/ 8 <0x14>;
-		max-cur = /bits/ 8 <0x20>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml b/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml
new file mode 100644
index 000000000000..b1bb3feb0f4d
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml
@@ -0,0 +1,220 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/leds-lp55xx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI/National Semiconductor LP55xx and LP8501 LED Drivers
+
+maintainers:
+  - Jacek Anaszewski <jacek.anaszewski@gmail.com>
+  - Pavel Machek <pavel@ucw.cz>
+
+description: |
+  Bindings for the TI/National Semiconductor LP55xx and LP8501 multi channel
+  LED Drivers.
+
+  For more product information please see the link below:
+    https://www.ti.com/lit/gpn/lp5521
+    https://www.ti.com/lit/gpn/lp5523
+    https://www.ti.com/lit/gpn/lp55231
+    https://www.ti.com/lit/gpn/lp5562
+    https://www.ti.com/lit/gpn/lp8501
+
+properties:
+  compatible:
+    enum:
+      - national,lp5521
+      - national,lp5523
+      - ti,lp55231
+      - ti,lp5562
+      - ti,lp8501
+
+  reg:
+    maxItems: 1
+    description: I2C slave address
+
+  clock-mode:
+    $ref: /schemas/types.yaml#definitions/uint8
+    description: |
+      Input clock mode
+    enum:
+      - 0 # automode
+      - 1 # internal
+      - 2 # external
+
+  enable-gpio:
+    maxItems: 1
+    description: |
+      GPIO attached to the chip's enable pin
+
+  pwr-sel:
+    $ref: /schemas/types.yaml#definitions/uint8
+    description: |
+      LP8501 specific property. Power selection for output channels.
+    enum:
+      - 0 # D1~9 are connected to VDD
+      - 1 # D1~6 with VDD, D7~9 with VOUT
+      - 2 # D1~6 with VOUT, D7~9 with VDD
+      - 3 # D1~9 are connected to VOUT
+
+patternProperties:
+  "(^led@[0-9a-f]$|led)":
+    type: object
+    $ref: common.yaml#
+    properties:
+      led-cur:
+        $ref: /schemas/types.yaml#definitions/uint8
+        description: |
+          Current setting at each LED channel (mA x10, 0 if LED is not connected)
+        minimum: 0
+        maximum: 255
+
+      max-cur:
+        $ref: /schemas/types.yaml#definitions/uint8
+        description: Maximun current at each LED channel.
+
+      reg:
+        description: |
+          Output channel for the LED.  This is zero based channel identifier and
+          the data sheet is a one based channel identifier.
+          reg value to output to LED output number
+        enum:
+          - 0 # LED output D1
+          - 1 # LED output D2
+          - 2 # LED output D3
+          - 3 # LED output D4
+          - 4 # LED output D5
+          - 5 # LED output D6
+          - 6 # LED output D7
+          - 7 # LED output D8
+          - 8 # LED output D9
+
+      chan-name:
+        $ref: /schemas/types.yaml#definitions/string
+        description: name of channel
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+   #include <dt-bindings/leds/common.h>
+
+   i2c {
+       #address-cells = <1>;
+       #size-cells = <0>;
+
+       led-controller@32 {
+           #address-cells = <1>;
+           #size-cells = <0>;
+           compatible = "ti,lp8501";
+           reg = <0x32>;
+           clock-mode = /bits/ 8 <2>;
+           pwr-sel = /bits/ 8 <3>;	/* D1~9 connected to VOUT */
+
+           led@0 {
+               reg = <0>;
+               chan-name = "d1";
+               led-cur = /bits/ 8 <0x14>;
+               max-cur = /bits/ 8 <0x20>;
+           };
+
+           led@1 {
+               reg = <1>;
+               chan-name = "d2";
+               led-cur = /bits/ 8 <0x14>;
+               max-cur = /bits/ 8 <0x20>;
+           };
+
+           led@2 {
+               reg = <2>;
+               chan-name = "d3";
+               led-cur = /bits/ 8 <0x14>;
+               max-cur = /bits/ 8 <0x20>;
+           };
+
+           led@3 {
+               reg = <3>;
+               chan-name = "d4";
+               led-cur = /bits/ 8 <0x14>;
+               max-cur = /bits/ 8 <0x20>;
+           };
+
+           led@4 {
+               reg = <4>;
+               chan-name = "d5";
+               led-cur = /bits/ 8 <0x14>;
+               max-cur = /bits/ 8 <0x20>;
+           };
+
+           led@5 {
+               reg = <5>;
+               chan-name = "d6";
+               led-cur = /bits/ 8 <0x14>;
+               max-cur = /bits/ 8 <0x20>;
+           };
+
+           led@6 {
+               reg = <6>;
+               chan-name = "d7";
+               led-cur = /bits/ 8 <0x14>;
+               max-cur = /bits/ 8 <0x20>;
+           };
+
+           led@7 {
+               reg = <7>;
+               chan-name = "d8";
+               led-cur = /bits/ 8 <0x14>;
+               max-cur = /bits/ 8 <0x20>;
+           };
+
+           led@8 {
+               reg = <8>;
+               chan-name = "d9";
+               led-cur = /bits/ 8 <0x14>;
+               max-cur = /bits/ 8 <0x20>;
+           };
+        };
+
+       led-controller@33 {
+           #address-cells = <1>;
+           #size-cells = <0>;
+           compatible = "national,lp5523";
+           reg = <0x33>;
+           clock-mode = /bits/ 8 <0>;
+
+           multi-led@2 {
+               #address-cells = <1>;
+               #size-cells = <0>;
+               reg = <0x2>;
+               color = <LED_COLOR_ID_MULTI>;
+               function = LED_FUNCTION_STANDBY;
+               linux,default-trigger = "heartbeat";
+
+               led@0 {
+                   led-cur = /bits/ 8 <50>;
+                   max-cur = /bits/ 8 <100>;
+                   reg = <0x0>;
+                   color = <LED_COLOR_ID_GREEN>;
+               };
+
+               led@1 {
+                   led-cur = /bits/ 8 <50>;
+                   max-cur = /bits/ 8 <100>;
+                   reg = <0x1>;
+                   color = <LED_COLOR_ID_BLUE>;
+               };
+
+               led@6 {
+                   led-cur = /bits/ 8 <50>;
+                   max-cur = /bits/ 8 <100>;
+                   reg = <0x6>;
+                   color = <LED_COLOR_ID_RED>;
+               };
+            };
+        };
+    };
+
+...
-- 
2.27.0

