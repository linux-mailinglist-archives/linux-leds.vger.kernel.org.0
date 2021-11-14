Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA5AF44FC5A
	for <lists+linux-leds@lfdr.de>; Sun, 14 Nov 2021 23:54:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231652AbhKNW53 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 14 Nov 2021 17:57:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231496AbhKNW5Y (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 14 Nov 2021 17:57:24 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 561F7C061746;
        Sun, 14 Nov 2021 14:54:29 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id i63so31403200lji.3;
        Sun, 14 Nov 2021 14:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4s7bw72a+4Qe+ggB/EasoDTMUz0gQ/J9xbfgWy5bBUw=;
        b=NKB7rrJVW8qY9W2ONJLBlXIS3mtOCPNfGwx4Ehw+b5REbhR+76eUptQSAP+tTNYNru
         qB513LLV5Jzffzfmv7mxa9+mmIAxiEYJtsxAz8SDKgLQwY1cmNdDBMB1aRTyF30DJrVr
         8jvCU17dAt+pPGFYNEnZv1NEmx+Oylles5ea5xGE7fI0mgLotp85f0R8XXB1rq/uYH0l
         uLBhnthXx81tpFsynLZWbuT5OLXpFZQ+wYH9YDr0rTfe4HudvbwLjC9Jg59cDx/+r3v0
         cDlkOZdY5IgOkf7BM/ENnarDa/oXJDZ/0MIDfKfkHSMW4woc8cjhzUgxKzqClcTXv5J5
         nP2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4s7bw72a+4Qe+ggB/EasoDTMUz0gQ/J9xbfgWy5bBUw=;
        b=itTYayfFTTxj2zMYpyrD9F3Xtezz9DRyzqTdkuEGaAZv4uDjtt8NUJh+QYGGbOxT2l
         wbGVug1jy3xSc4LP0mesR7POHwfMyB1kMgW1Xj9I/xtpfVbQ72Bk78t4VGMKL1YVKjfL
         6ewt2oOQu4/nJdWyEbWQDau2Fl+gKFN26S+fzbJfTkCf0DqHbB/4DDhFYP/ND2YbqTqz
         LzN7LAINstJ4Odw9ezazsHdIVl45XujHNjIt1j4ErhVhaC/Qtf3t63X9H4aYk8pDxPpJ
         U0tZ6NffmpTKH9oFVtbZGlVFP8+0h77gYH79T4/XnrjYzses5h9tx/jaMYlKRNJe2/3N
         m+Zg==
X-Gm-Message-State: AOAM533h0KmFbIKzEe47yHjuz4PObciZw13maOm6Ngikucti2RHtVfm5
        CzAPIUQczpoSAPoNEPdng2wfJzfWhxk=
X-Google-Smtp-Source: ABdhPJy7FOCcUvozb3PvROxlJ7nmzrezYuINym9BgMyz/9Y/ewuleGhAUQ5HdfkLTxsVLntdb0JGcQ==
X-Received: by 2002:a05:651c:907:: with SMTP id e7mr36378263ljq.300.1636930467490;
        Sun, 14 Nov 2021 14:54:27 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id n9sm1336890lji.131.2021.11.14.14.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Nov 2021 14:54:27 -0800 (PST)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] dt-bindings: leds: convert BCM6328 controller to the json-schema
Date:   Sun, 14 Nov 2021 23:54:16 +0100
Message-Id: <20211114225416.3174-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

This helps validating DTS files.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 .../devicetree/bindings/leds/leds-bcm6328.txt | 319 --------------
 .../bindings/leds/leds-bcm6328.yaml           | 403 ++++++++++++++++++
 2 files changed, 403 insertions(+), 319 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-bcm6328.txt
 create mode 100644 Documentation/devicetree/bindings/leds/leds-bcm6328.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-bcm6328.txt b/Documentation/devicetree/bindings/leds/leds-bcm6328.txt
deleted file mode 100644
index a555d94084b7..000000000000
--- a/Documentation/devicetree/bindings/leds/leds-bcm6328.txt
+++ /dev/null
@@ -1,319 +0,0 @@
-LEDs connected to Broadcom BCM6328 controller
-
-This controller is present on BCM6318, BCM6328, BCM6362 and BCM63268.
-In these SoCs it's possible to control LEDs both as GPIOs or by hardware.
-However, on some devices there are Serial LEDs (LEDs connected to a 74x164
-controller), which can either be controlled by software (exporting the 74x164
-as spi-gpio. See Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml),
-or by hardware using this driver.
-Some of these Serial LEDs are hardware controlled (e.g. ethernet LEDs) and
-exporting the 74x164 as spi-gpio prevents those LEDs to be hardware
-controlled, so the only chance to keep them working is by using this driver.
-
-BCM6328 LED controller has a HWDIS register, which controls whether a LED
-should be controlled by a hardware signal instead of the MODE register value,
-with 0 meaning hardware control enabled and 1 hardware control disabled. This
-is usually 1:1 for hardware to LED signals, but through the activity/link
-registers you have some limited control over rerouting the LEDs (as
-explained later in brcm,link-signal-sources). Even if a LED is hardware
-controlled you are still able to make it blink or light it up if it isn't,
-but you can't turn it off if the hardware decides to light it up. For this
-reason, hardware controlled LEDs aren't registered as LED class devices.
-
-Required properties:
-  - compatible : should be "brcm,bcm6328-leds".
-  - #address-cells : must be 1.
-  - #size-cells : must be 0.
-  - reg : BCM6328 LED controller address and size.
-
-Optional properties:
-  - brcm,serial-leds : Boolean, enables Serial LEDs.
-    Default : false
-  - brcm,serial-mux : Boolean, enables Serial LEDs multiplexing.
-    Default : false
-  - brcm,serial-clk-low : Boolean, makes clock signal active low.
-    Default : false
-  - brcm,serial-dat-low : Boolean, makes data signal active low.
-    Default : false
-  - brcm,serial-shift-inv : Boolean, inverts Serial LEDs shift direction.
-    Default : false
-
-Each LED is represented as a sub-node of the brcm,bcm6328-leds device.
-
-LED sub-node required properties:
-  - reg : LED pin number (only LEDs 0 to 23 are valid).
-
-LED sub-node optional properties:
-  a) Optional properties for sub-nodes related to software controlled LEDs:
-    - label : see Documentation/devicetree/bindings/leds/common.txt
-    - active-low : Boolean, makes LED active low.
-      Default : false
-    - default-state : see
-      Documentation/devicetree/bindings/leds/common.txt
-    - linux,default-trigger : see
-      Documentation/devicetree/bindings/leds/common.txt
-
-  b) Optional properties for sub-nodes related to hardware controlled LEDs:
-    - brcm,hardware-controlled : Boolean, makes this LED hardware controlled.
-      Default : false
-    - brcm,link-signal-sources : An array of hardware link
-      signal sources. Up to four link hardware signals can get muxed into
-      these LEDs. Only valid for LEDs 0 to 7, where LED signals 0 to 3 may
-      be muxed to LEDs 0 to 3, and signals 4 to 7 may be muxed to LEDs
-      4 to 7. A signal can be muxed to more than one LED, and one LED can
-      have more than one source signal.
-    - brcm,activity-signal-sources : An array of hardware activity
-      signal sources. Up to four activity hardware signals can get muxed into
-      these LEDs. Only valid for LEDs 0 to 7, where LED signals 0 to 3 may
-      be muxed to LEDs 0 to 3, and signals 4 to 7 may be muxed to LEDs
-      4 to 7. A signal can be muxed to more than one LED, and one LED can
-      have more than one source signal.
-
-Examples:
-Scenario 1 : BCM6328 with 4 EPHY LEDs
-	leds0: led-controller@10000800 {
-		compatible = "brcm,bcm6328-leds";
-		#address-cells = <1>;
-		#size-cells = <0>;
-		reg = <0x10000800 0x24>;
-
-		alarm_red@2 {
-			reg = <2>;
-			active-low;
-			label = "red:alarm";
-		};
-		inet_green@3 {
-			reg = <3>;
-			active-low;
-			label = "green:inet";
-		};
-		power_green@4 {
-			reg = <4>;
-			active-low;
-			label = "green:power";
-			default-state = "on";
-		};
-		ephy0_spd@17 {
-			reg = <17>;
-			brcm,hardware-controlled;
-		};
-		ephy1_spd@18 {
-			reg = <18>;
-			brcm,hardware-controlled;
-		};
-		ephy2_spd@19 {
-			reg = <19>;
-			brcm,hardware-controlled;
-		};
-		ephy3_spd@20 {
-			reg = <20>;
-			brcm,hardware-controlled;
-		};
-	};
-
-Scenario 2 : BCM63268 with Serial/GPHY0 LEDs
-	leds0: led-controller@10001900 {
-		compatible = "brcm,bcm6328-leds";
-		#address-cells = <1>;
-		#size-cells = <0>;
-		reg = <0x10001900 0x24>;
-		brcm,serial-leds;
-		brcm,serial-dat-low;
-		brcm,serial-shift-inv;
-
-		gphy0_spd0@0 {
-			reg = <0>;
-			brcm,hardware-controlled;
-			brcm,link-signal-sources = <0>;
-		};
-		gphy0_spd1@1 {
-			reg = <1>;
-			brcm,hardware-controlled;
-			brcm,link-signal-sources = <1>;
-		};
-		inet_red@2 {
-			reg = <2>;
-			active-low;
-			label = "red:inet";
-		};
-		dsl_green@3 {
-			reg = <3>;
-			active-low;
-			label = "green:dsl";
-		};
-		usb_green@4 {
-			reg = <4>;
-			active-low;
-			label = "green:usb";
-		};
-		wps_green@7 {
-			reg = <7>;
-			active-low;
-			label = "green:wps";
-		};
-		inet_green@8 {
-			reg = <8>;
-			active-low;
-			label = "green:inet";
-		};
-		ephy0_act@9 {
-			reg = <9>;
-			brcm,hardware-controlled;
-		};
-		ephy1_act@10 {
-			reg = <10>;
-			brcm,hardware-controlled;
-		};
-		ephy2_act@11 {
-			reg = <11>;
-			brcm,hardware-controlled;
-		};
-		gphy0_act@12 {
-			reg = <12>;
-			brcm,hardware-controlled;
-		};
-		ephy0_spd@13 {
-			reg = <13>;
-			brcm,hardware-controlled;
-		};
-		ephy1_spd@14 {
-			reg = <14>;
-			brcm,hardware-controlled;
-		};
-		ephy2_spd@15 {
-			reg = <15>;
-			brcm,hardware-controlled;
-		};
-		power_green@20 {
-			reg = <20>;
-			active-low;
-			label = "green:power";
-			default-state = "on";
-		};
-	};
-
-Scenario 3 : BCM6362 with 1 LED for each EPHY
-	leds0: led-controller@10001900 {
-		compatible = "brcm,bcm6328-leds";
-		#address-cells = <1>;
-		#size-cells = <0>;
-		reg = <0x10001900 0x24>;
-
-		usb@0 {
-			reg = <0>;
-			brcm,hardware-controlled;
-			brcm,link-signal-sources = <0>;
-			brcm,activity-signal-sources = <0>;
-			/* USB link/activity routed to USB LED */
-		};
-		inet@1 {
-			reg = <1>;
-			brcm,hardware-controlled;
-			brcm,activity-signal-sources = <1>;
-			/* INET activity routed to INET LED */
-		};
-		ephy0@4 {
-			reg = <4>;
-			brcm,hardware-controlled;
-			brcm,link-signal-sources = <4>;
-			/* EPHY0 link routed to EPHY0 LED */
-		};
-		ephy1@5 {
-			reg = <5>;
-			brcm,hardware-controlled;
-			brcm,link-signal-sources = <5>;
-			/* EPHY1 link routed to EPHY1 LED */
-		};
-		ephy2@6 {
-			reg = <6>;
-			brcm,hardware-controlled;
-			brcm,link-signal-sources = <6>;
-			/* EPHY2 link routed to EPHY2 LED */
-		};
-		ephy3@7 {
-			reg = <7>;
-			brcm,hardware-controlled;
-			brcm,link-signal-sources = <7>;
-			/* EPHY3 link routed to EPHY3 LED */
-		};
-		power_green@20 {
-			reg = <20>;
-			active-low;
-			label = "green:power";
-			default-state = "on";
-		};
-	};
-
-Scenario 4 : BCM6362 with 1 LED for all EPHYs
-	leds0: led-controller@10001900 {
-		compatible = "brcm,bcm6328-leds";
-		#address-cells = <1>;
-		#size-cells = <0>;
-		reg = <0x10001900 0x24>;
-
-		usb@0 {
-			reg = <0>;
-			brcm,hardware-controlled;
-			brcm,link-signal-sources = <0 1>;
-			brcm,activity-signal-sources = <0 1>;
-			/* USB/INET link/activity routed to USB LED */
-		};
-		ephy@4 {
-			reg = <4>;
-			brcm,hardware-controlled;
-			brcm,link-signal-sources = <4 5 6 7>;
-			/* EPHY0/1/2/3 link routed to EPHY0 LED */
-		};
-		power_green@20 {
-			reg = <20>;
-			active-low;
-			label = "green:power";
-			default-state = "on";
-		};
-	};
-
-Scenario 5 : BCM6362 with EPHY LEDs swapped
-	leds0: led-controller@10001900 {
-		compatible = "brcm,bcm6328-leds";
-		#address-cells = <1>;
-		#size-cells = <0>;
-		reg = <0x10001900 0x24>;
-
-		usb@0 {
-			reg = <0>;
-			brcm,hardware-controlled;
-			brcm,link-signal-sources = <0>;
-			brcm,activity-signal-sources = <0 1>;
-			/* USB link/act and INET act routed to USB LED */
-		};
-		ephy0@4 {
-			reg = <4>;
-			brcm,hardware-controlled;
-			brcm,link-signal-sources = <7>;
-			/* EPHY3 link routed to EPHY0 LED */
-		};
-		ephy1@5 {
-			reg = <5>;
-			brcm,hardware-controlled;
-			brcm,link-signal-sources = <6>;
-			/* EPHY2 link routed to EPHY1 LED */
-		};
-		ephy2@6 {
-			reg = <6>;
-			brcm,hardware-controlled;
-			brcm,link-signal-sources = <5>;
-			/* EPHY1 link routed to EPHY2 LED */
-		};
-		ephy3@7 {
-			reg = <7>;
-			brcm,hardware-controlled;
-			brcm,link-signal-sources = <4>;
-			/* EPHY0 link routed to EPHY3 LED */
-		};
-		power_green@20 {
-			reg = <20>;
-			active-low;
-			label = "green:power";
-			default-state = "on";
-		};
-	};
diff --git a/Documentation/devicetree/bindings/leds/leds-bcm6328.yaml b/Documentation/devicetree/bindings/leds/leds-bcm6328.yaml
new file mode 100644
index 000000000000..b7e72feb7a07
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-bcm6328.yaml
@@ -0,0 +1,403 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/leds-bcm6328.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LEDs connected to Broadcom BCM6328 controller
+
+maintainers:
+  - Álvaro Fernández Rojas <noltari@gmail.com>
+
+description: |
+  This controller is present on BCM6318, BCM6328, BCM6362 and BCM63268.
+  In these SoCs it's possible to control LEDs both as GPIOs or by hardware.
+  However, on some devices there are Serial LEDs (LEDs connected to a 74x164
+  controller), which can either be controlled by software (exporting the 74x164
+  as spi-gpio. See
+  Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml), or by hardware
+  using this driver.
+  Some of these Serial LEDs are hardware controlled (e.g. ethernet LEDs) and
+  exporting the 74x164 as spi-gpio prevents those LEDs to be hardware
+  controlled, so the only chance to keep them working is by using this driver.
+
+  BCM6328 LED controller has a HWDIS register, which controls whether a LED
+  should be controlled by a hardware signal instead of the MODE register value,
+  with 0 meaning hardware control enabled and 1 hardware control disabled. This
+  is usually 1:1 for hardware to LED signals, but through the activity/link
+  registers you have some limited control over rerouting the LEDs (as
+  explained later in brcm,link-signal-sources). Even if a LED is hardware
+  controlled you are still able to make it blink or light it up if it isn't,
+  but you can't turn it off if the hardware decides to light it up. For this
+  reason, hardware controlled LEDs aren't registered as LED class devices.
+
+  Each LED is represented as a sub-node of the brcm,bcm6328-leds device.
+
+properties:
+  compatible:
+    const: brcm,bcm6328-leds
+
+  reg:
+    maxItems: 1
+
+  brcm,serial-leds:
+    type: boolean
+    description: Enables Serial LEDs.
+
+  brcm,serial-mux:
+    type: boolean
+    description: Enables Serial LEDs multiplexing.
+
+  brcm,serial-clk-low:
+    type: boolean
+    description: Makes clock signal active low.
+
+  brcm,serial-dat-low:
+    type: boolean
+    description: Makes data signal active low.
+
+  brcm,serial-shift-inv:
+    type: boolean
+    description: Inverts Serial LEDs shift direction.
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "@[a-f0-9]+$":
+    type: object
+
+    $ref: common.yaml#
+
+    properties:
+      reg:
+        maxItems: 1
+        description: LED pin number (only LEDs 0 to 23 are valid).
+
+      active-low:
+        type: boolean
+        description: Makes LED active low.
+
+      brcm,hardware-controlled:
+        type: boolean
+        description: Makes this LED hardware controlled.
+
+      brcm,link-signal-sources:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        minItems: 1
+        maxItems: 4
+        description: >
+          An array of hardware link signal sources. Up to four link hardware
+          signals can get muxed into these LEDs. Only valid for LEDs 0 to 7,
+          where LED signals 0 to 3 may be muxed to LEDs 0 to 3, and signals 4 to
+          7 may be muxed to LEDs 4 to 7. A signal can be muxed to more than one
+          LED, and one LED can have more than one source signal.
+
+      brcm,activity-signal-sources:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        minItems: 1
+        maxItems: 4
+        description: >
+          An array of hardware activity signal sources. Up to four activity
+          hardware signals can get muxed into these LEDs. Only valid for LEDs 0
+          to 7, where LED signals 0 to 3 may be muxed to LEDs 0 to 3, and
+          signals 4 to 7 may be muxed to LEDs 4 to 7. A signal can be muxed to
+          more than one LED, and one LED can have more than one source signal.
+
+    required:
+      - reg
+
+    unevaluatedProperties: false
+
+required:
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    /* BCM6328 with 4 EPHY LEDs */
+    led-controller@10000800 {
+        compatible = "brcm,bcm6328-leds";
+        #address-cells = <1>;
+        #size-cells = <0>;
+        reg = <0x10000800 0x24>;
+
+        alarm_red@2 {
+            reg = <2>;
+            active-low;
+            label = "red:alarm";
+        };
+
+        inet_green@3 {
+            reg = <3>;
+            active-low;
+            label = "green:inet";
+        };
+
+        power_green@4 {
+            reg = <4>;
+            active-low;
+            label = "green:power";
+            default-state = "on";
+        };
+
+        ephy0_spd@17 {
+            reg = <17>;
+            brcm,hardware-controlled;
+        };
+
+        ephy1_spd@18 {
+            reg = <18>;
+            brcm,hardware-controlled;
+        };
+
+        ephy2_spd@19 {
+            reg = <19>;
+            brcm,hardware-controlled;
+        };
+
+        ephy3_spd@20 {
+            reg = <20>;
+            brcm,hardware-controlled;
+        };
+    };
+  - |
+    /* BCM63268 with Serial/GPHY0 LEDs */
+    led-controller@10001900 {
+        compatible = "brcm,bcm6328-leds";
+        #address-cells = <1>;
+        #size-cells = <0>;
+        reg = <0x10001900 0x24>;
+        brcm,serial-leds;
+        brcm,serial-dat-low;
+        brcm,serial-shift-inv;
+
+        gphy0_spd0@0 {
+            reg = <0>;
+            brcm,hardware-controlled;
+            brcm,link-signal-sources = <0>;
+        };
+
+        gphy0_spd1@1 {
+            reg = <1>;
+            brcm,hardware-controlled;
+            brcm,link-signal-sources = <1>;
+        };
+
+        inet_red@2 {
+            reg = <2>;
+            active-low;
+            label = "red:inet";
+        };
+
+        dsl_green@3 {
+            reg = <3>;
+            active-low;
+            label = "green:dsl";
+        };
+
+        usb_green@4 {
+            reg = <4>;
+            active-low;
+            label = "green:usb";
+        };
+
+        wps_green@7 {
+            reg = <7>;
+            active-low;
+            label = "green:wps";
+        };
+
+        inet_green@8 {
+            reg = <8>;
+            active-low;
+            label = "green:inet";
+        };
+
+        ephy0_act@9 {
+            reg = <9>;
+            brcm,hardware-controlled;
+        };
+
+        ephy1_act@10 {
+            reg = <10>;
+            brcm,hardware-controlled;
+        };
+
+        ephy2_act@11 {
+            reg = <11>;
+            brcm,hardware-controlled;
+        };
+
+        gphy0_act@12 {
+            reg = <12>;
+            brcm,hardware-controlled;
+        };
+
+        ephy0_spd@13 {
+            reg = <13>;
+            brcm,hardware-controlled;
+        };
+
+        ephy1_spd@14 {
+            reg = <14>;
+            brcm,hardware-controlled;
+        };
+
+        ephy2_spd@15 {
+            reg = <15>;
+            brcm,hardware-controlled;
+        };
+
+        power_green@20 {
+            reg = <20>;
+            active-low;
+            label = "green:power";
+            default-state = "on";
+        };
+    };
+  - |
+    /* BCM6362 with 1 LED for each EPHY */
+    led-controller@10001900 {
+        compatible = "brcm,bcm6328-leds";
+        #address-cells = <1>;
+        #size-cells = <0>;
+        reg = <0x10001900 0x24>;
+
+        usb@0 {
+            reg = <0>;
+            brcm,hardware-controlled;
+            brcm,link-signal-sources = <0>;
+            brcm,activity-signal-sources = <0>;
+            /* USB link/activity routed to USB LED */
+        };
+
+        inet@1 {
+            reg = <1>;
+            brcm,hardware-controlled;
+            brcm,activity-signal-sources = <1>;
+            /* INET activity routed to INET LED */
+        };
+
+        ephy0@4 {
+            reg = <4>;
+            brcm,hardware-controlled;
+            brcm,link-signal-sources = <4>;
+            /* EPHY0 link routed to EPHY0 LED */
+        };
+
+        ephy1@5 {
+            reg = <5>;
+            brcm,hardware-controlled;
+            brcm,link-signal-sources = <5>;
+            /* EPHY1 link routed to EPHY1 LED */
+        };
+
+        ephy2@6 {
+            reg = <6>;
+            brcm,hardware-controlled;
+            brcm,link-signal-sources = <6>;
+            /* EPHY2 link routed to EPHY2 LED */
+        };
+
+        ephy3@7 {
+            reg = <7>;
+            brcm,hardware-controlled;
+            brcm,link-signal-sources = <7>;
+            /* EPHY3 link routed to EPHY3 LED */
+        };
+
+        power_green@20 {
+            reg = <20>;
+            active-low;
+            label = "green:power";
+            default-state = "on";
+        };
+    };
+  - |
+    /* BCM6362 with 1 LED for all EPHYs */
+    led-controller@10001900 {
+        compatible = "brcm,bcm6328-leds";
+        #address-cells = <1>;
+        #size-cells = <0>;
+        reg = <0x10001900 0x24>;
+
+        usb@0 {
+            reg = <0>;
+            brcm,hardware-controlled;
+            brcm,link-signal-sources = <0 1>;
+            brcm,activity-signal-sources = <0 1>;
+            /* USB/INET link/activity routed to USB LED */
+        };
+
+        ephy@4 {
+            reg = <4>;
+            brcm,hardware-controlled;
+            brcm,link-signal-sources = <4 5 6 7>;
+            /* EPHY0/1/2/3 link routed to EPHY0 LED */
+        };
+
+        power_green@20 {
+            reg = <20>;
+            active-low;
+            label = "green:power";
+            default-state = "on";
+        };
+    };
+  - |
+    /* BCM6362 with EPHY LEDs swapped */
+    led-controller@10001900 {
+        compatible = "brcm,bcm6328-leds";
+        #address-cells = <1>;
+        #size-cells = <0>;
+        reg = <0x10001900 0x24>;
+
+        usb@0 {
+            reg = <0>;
+            brcm,hardware-controlled;
+            brcm,link-signal-sources = <0>;
+            brcm,activity-signal-sources = <0 1>;
+            /* USB link/act and INET act routed to USB LED */
+        };
+
+        ephy0@4 {
+            reg = <4>;
+            brcm,hardware-controlled;
+            brcm,link-signal-sources = <7>;
+            /* EPHY3 link routed to EPHY0 LED */
+        };
+
+        ephy1@5 {
+            reg = <5>;
+            brcm,hardware-controlled;
+            brcm,link-signal-sources = <6>;
+            /* EPHY2 link routed to EPHY1 LED */
+        };
+
+        ephy2@6 {
+            reg = <6>;
+            brcm,hardware-controlled;
+            brcm,link-signal-sources = <5>;
+            /* EPHY1 link routed to EPHY2 LED */
+        };
+
+        ephy3@7 {
+            reg = <7>;
+            brcm,hardware-controlled;
+            brcm,link-signal-sources = <4>;
+            /* EPHY0 link routed to EPHY3 LED */
+        };
+
+        power_green@20 {
+            reg = <20>;
+            active-low;
+            label = "green:power";
+            default-state = "on";
+        };
+    };
-- 
2.31.1

