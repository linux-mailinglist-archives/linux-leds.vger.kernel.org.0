Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 919D7405EE1
	for <lists+linux-leds@lfdr.de>; Thu,  9 Sep 2021 23:31:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348243AbhIIVcn (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 9 Sep 2021 17:32:43 -0400
Received: from mail-oi1-f180.google.com ([209.85.167.180]:40907 "EHLO
        mail-oi1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347746AbhIIVck (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 9 Sep 2021 17:32:40 -0400
Received: by mail-oi1-f180.google.com with SMTP id h133so4460948oib.7;
        Thu, 09 Sep 2021 14:31:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MHpaa4YRiyoKZcNCSnJddNfjbYkMIenyPPEeWchVkSo=;
        b=gu3+mqDTt9hXFg0CjHTM8NhG9rwdn94uvT4W5IjF1+jNWL+Up6KdURYY5ZBXQX/KeQ
         xI41rSNcKCViB05Z1NfGgJEBuMIwwU6bH0xUaDU556lvE9uqt77hJPma7+LDbbbJ9VIH
         lPaNEk2Uj7ptHfOxbLzzF+ZJNjLl161ZLtlN0tiA61JxU14hjE+kyqRtYx3HX7sOdUOc
         61/mwi22tIJRmSILG9Jrcopjab4BU5IH+JnnNuGvKnDxuRr/BFHzflNiMw3gEmJbAI3e
         knniB0fnMh//q/zQ73/b9XU2pfjaJhVIhBO51nnYWAPCUXOQdK4vJuXslMj2NwAbIWdI
         jxqA==
X-Gm-Message-State: AOAM533prKqShWT4eQNxC1Gn2MHlW++Z3sHAdzNclznnRvWRfn6WTd8t
        iMczqJnmZBLUevdDZPy47w==
X-Google-Smtp-Source: ABdhPJzr/tx3UOszd+SozUeHRRST9/sbI/28tL2cmxVy6jyqwXZlNNsOh+If6n6R3dYjuj3JpXvN2Q==
X-Received: by 2002:a05:6808:211b:: with SMTP id r27mr1662712oiw.132.1631223089833;
        Thu, 09 Sep 2021 14:31:29 -0700 (PDT)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.googlemail.com with ESMTPSA id m24sm694929oie.50.2021.09.09.14.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 14:31:28 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, Pavel Machek <pavel@ucw.cz>
Cc:     Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: [PATCH 7/8] ARM: dts: arm: Update ICST clock nodes 'reg' and node names
Date:   Thu,  9 Sep 2021 16:31:17 -0500
Message-Id: <20210909213118.1087083-8-robh@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909213118.1087083-1-robh@kernel.org>
References: <20210909213118.1087083-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add a 'reg' entry for ICST clock nodes on the Arm Ltd platforms. The 'reg'
entry is the VCO register address. With this, the node name can be updated
to use a generic node name, 'clock-controller', and a unit-address.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/arm/boot/dts/arm-realview-eb.dtsi    | 15 ++++++++++-----
 arch/arm/boot/dts/arm-realview-pb1176.dts | 15 ++++++++++-----
 arch/arm/boot/dts/arm-realview-pb11mp.dts | 21 ++++++++++++++-------
 arch/arm/boot/dts/arm-realview-pbx.dtsi   | 15 ++++++++++-----
 arch/arm/boot/dts/integratorap-im-pd1.dts |  9 +++++++--
 arch/arm/boot/dts/integratorap.dts        | 15 +++++++++++----
 arch/arm/boot/dts/integratorcp.dts        |  9 ++++++---
 7 files changed, 68 insertions(+), 31 deletions(-)

diff --git a/arch/arm/boot/dts/arm-realview-eb.dtsi b/arch/arm/boot/dts/arm-realview-eb.dtsi
index 56441ef08a55..2dfb32bf9d48 100644
--- a/arch/arm/boot/dts/arm-realview-eb.dtsi
+++ b/arch/arm/boot/dts/arm-realview-eb.dtsi
@@ -269,36 +269,41 @@ led@8,7 {
 				label = "versatile:7";
 				default-state = "off";
 			};
-			oscclk0: osc0@0c {
+			oscclk0: clock-controller@c {
 				compatible = "arm,syscon-icst307";
+				reg = <0x0c 0x04>;
 				#clock-cells = <0>;
 				lock-offset = <0x20>;
 				vco-offset = <0x0C>;
 				clocks = <&xtal24mhz>;
 			};
-			oscclk1: osc1@10 {
+			oscclk1: clock-controller@10 {
 				compatible = "arm,syscon-icst307";
+				reg = <0x10 0x04>;
 				#clock-cells = <0>;
 				lock-offset = <0x20>;
 				vco-offset = <0x10>;
 				clocks = <&xtal24mhz>;
 			};
-			oscclk2: osc2@14 {
+			oscclk2: clock-controller@14 {
 				compatible = "arm,syscon-icst307";
+				reg = <0x14 0x04>;
 				#clock-cells = <0>;
 				lock-offset = <0x20>;
 				vco-offset = <0x14>;
 				clocks = <&xtal24mhz>;
 			};
-			oscclk3: osc3@18 {
+			oscclk3: clock-controller@18 {
 				compatible = "arm,syscon-icst307";
+				reg = <0x18 0x04>;
 				#clock-cells = <0>;
 				lock-offset = <0x20>;
 				vco-offset = <0x18>;
 				clocks = <&xtal24mhz>;
 			};
-			oscclk4: osc4@1c {
+			oscclk4: clock-controller@1c {
 				compatible = "arm,syscon-icst307";
+				reg = <0x1c 0x04>;
 				#clock-cells = <0>;
 				lock-offset = <0x20>;
 				vco-offset = <0x1c>;
diff --git a/arch/arm/boot/dts/arm-realview-pb1176.dts b/arch/arm/boot/dts/arm-realview-pb1176.dts
index df71ee27294d..06b8723b09eb 100644
--- a/arch/arm/boot/dts/arm-realview-pb1176.dts
+++ b/arch/arm/boot/dts/arm-realview-pb1176.dts
@@ -287,36 +287,41 @@ led@8,7 {
 				label = "versatile:7";
 				default-state = "off";
 			};
-			oscclk0: osc0@0c {
+			oscclk0: clock-controller@c {
 				compatible = "arm,syscon-icst307";
+				reg = <0x0c 0x04>;
 				#clock-cells = <0>;
 				lock-offset = <0x20>;
 				vco-offset = <0x0C>;
 				clocks = <&xtal24mhz>;
 			};
-			oscclk1: osc1@10 {
+			oscclk1: clock-controller@10 {
 				compatible = "arm,syscon-icst307";
+				reg = <0x10 0x04>;
 				#clock-cells = <0>;
 				lock-offset = <0x20>;
 				vco-offset = <0x10>;
 				clocks = <&xtal24mhz>;
 			};
-			oscclk2: osc2@14 {
+			oscclk2: clock-controller@14 {
 				compatible = "arm,syscon-icst307";
+				reg = <0x14 0x04>;
 				#clock-cells = <0>;
 				lock-offset = <0x20>;
 				vco-offset = <0x14>;
 				clocks = <&xtal24mhz>;
 			};
-			oscclk3: osc3@18 {
+			oscclk3: clock-controller@18 {
 				compatible = "arm,syscon-icst307";
+				reg = <0x18 0x04>;
 				#clock-cells = <0>;
 				lock-offset = <0x20>;
 				vco-offset = <0x18>;
 				clocks = <&xtal24mhz>;
 			};
-			oscclk4: osc4@1c {
+			oscclk4: clock-controller@1c {
 				compatible = "arm,syscon-icst307";
+				reg = <0x1c 0x04>;
 				#clock-cells = <0>;
 				lock-offset = <0x20>;
 				vco-offset = <0x1c>;
diff --git a/arch/arm/boot/dts/arm-realview-pb11mp.dts b/arch/arm/boot/dts/arm-realview-pb11mp.dts
index 54d4cbd10bdf..295aef448123 100644
--- a/arch/arm/boot/dts/arm-realview-pb11mp.dts
+++ b/arch/arm/boot/dts/arm-realview-pb11mp.dts
@@ -378,50 +378,57 @@ led@8,7 {
 				default-state = "off";
 			};
 
-			oscclk0: osc0@0c {
+			oscclk0: clock-controller@c {
 				compatible = "arm,syscon-icst307";
+				reg = <0x0c 0x04>;
 				#clock-cells = <0>;
 				lock-offset = <0x20>;
 				vco-offset = <0x0C>;
 				clocks = <&xtal24mhz>;
 			};
-			oscclk1: osc1@10 {
+			oscclk1: clock-controller@10 {
 				compatible = "arm,syscon-icst307";
+				reg = <0x10 0x04>;
 				#clock-cells = <0>;
 				lock-offset = <0x20>;
 				vco-offset = <0x10>;
 				clocks = <&xtal24mhz>;
 			};
-			oscclk2: osc2@14 {
+			oscclk2: clock-controller@14 {
 				compatible = "arm,syscon-icst307";
+				reg = <0x14 0x04>;
 				#clock-cells = <0>;
 				lock-offset = <0x20>;
 				vco-offset = <0x14>;
 				clocks = <&xtal24mhz>;
 			};
-			oscclk3: osc3@18 {
+			oscclk3: clock-controller@18 {
 				compatible = "arm,syscon-icst307";
+				reg = <0x18 0x04>;
 				#clock-cells = <0>;
 				lock-offset = <0x20>;
 				vco-offset = <0x18>;
 				clocks = <&xtal24mhz>;
 			};
-			oscclk4: osc4@1c {
+			oscclk4: clock-controller@1c {
 				compatible = "arm,syscon-icst307";
+				reg = <0x1c 0x04>;
 				#clock-cells = <0>;
 				lock-offset = <0x20>;
 				vco-offset = <0x1c>;
 				clocks = <&xtal24mhz>;
 			};
-			oscclk5: osc5@d4 {
+			oscclk5: clock-controller@d4 {
 				compatible = "arm,syscon-icst307";
+				reg = <0xd4 0x04>;
 				#clock-cells = <0>;
 				lock-offset = <0x20>;
 				vco-offset = <0xd4>;
 				clocks = <&xtal24mhz>;
 			};
-			oscclk6: osc6@d8 {
+			oscclk6: clock-controller@d8 {
 				compatible = "arm,syscon-icst307";
+				reg = <0xd8 0x04>;
 				#clock-cells = <0>;
 				lock-offset = <0x20>;
 				vco-offset = <0xd8>;
diff --git a/arch/arm/boot/dts/arm-realview-pbx.dtsi b/arch/arm/boot/dts/arm-realview-pbx.dtsi
index 9366fecc699b..6f61f968d689 100644
--- a/arch/arm/boot/dts/arm-realview-pbx.dtsi
+++ b/arch/arm/boot/dts/arm-realview-pbx.dtsi
@@ -291,36 +291,41 @@ led@8,7 {
 				label = "versatile:7";
 				default-state = "off";
 			};
-			oscclk0: osc0@0c {
+			oscclk0: clock-controller@c {
 				compatible = "arm,syscon-icst307";
+				reg = <0x0c 0x04>;
 				#clock-cells = <0>;
 				lock-offset = <0x20>;
 				vco-offset = <0x0C>;
 				clocks = <&xtal24mhz>;
 			};
-			oscclk1: osc1@10 {
+			oscclk1: clock-controller@10 {
 				compatible = "arm,syscon-icst307";
+				reg = <0x10 0x04>;
 				#clock-cells = <0>;
 				lock-offset = <0x20>;
 				vco-offset = <0x10>;
 				clocks = <&xtal24mhz>;
 			};
-			oscclk2: osc2@14 {
+			oscclk2: clock-controller@14 {
 				compatible = "arm,syscon-icst307";
+				reg = <0x14 0x04>;
 				#clock-cells = <0>;
 				lock-offset = <0x20>;
 				vco-offset = <0x14>;
 				clocks = <&xtal24mhz>;
 			};
-			oscclk3: osc3@18 {
+			oscclk3: clock-controller@18 {
 				compatible = "arm,syscon-icst307";
+				reg = <0x18 0x04>;
 				#clock-cells = <0>;
 				lock-offset = <0x20>;
 				vco-offset = <0x18>;
 				clocks = <&xtal24mhz>;
 			};
-			oscclk4: osc4@1c {
+			oscclk4: clock-controller@1c {
 				compatible = "arm,syscon-icst307";
+				reg = <0x1c 0x04>;
 				#clock-cells = <0>;
 				lock-offset = <0x20>;
 				vco-offset = <0x1c>;
diff --git a/arch/arm/boot/dts/integratorap-im-pd1.dts b/arch/arm/boot/dts/integratorap-im-pd1.dts
index 0614f82b808e..d47bfb66d069 100644
--- a/arch/arm/boot/dts/integratorap-im-pd1.dts
+++ b/arch/arm/boot/dts/integratorap-im-pd1.dts
@@ -28,9 +28,13 @@ &lm0 {
 	syscon@0 {
 		compatible = "arm,im-pd1-syscon", "syscon";
 		reg = <0x00000000 0x1000>;
+		ranges;
+		#address-cells = <1>;
+		#size-cells = <1>;
 
-		vco1: vco1-clock {
+		vco1: clock-controller@0 {
 			compatible = "arm,impd1-vco1";
+			reg = <0x00 0x04>;
 			#clock-cells = <0>;
 			lock-offset = <0x08>;
 			vco-offset = <0x00>;
@@ -38,8 +42,9 @@ vco1: vco1-clock {
 			clock-output-names = "IM-PD1-VCO1";
 		};
 
-		vco2: vco2-clock {
+		vco2: clock-controller@4 {
 			compatible = "arm,impd1-vco2";
+			reg = <0x04 0x04>;
 			#clock-cells = <0>;
 			lock-offset = <0x08>;
 			vco-offset = <0x04>;
diff --git a/arch/arm/boot/dts/integratorap.dts b/arch/arm/boot/dts/integratorap.dts
index 67d1f9b24a52..9b652cc27b14 100644
--- a/arch/arm/boot/dts/integratorap.dts
+++ b/arch/arm/boot/dts/integratorap.dts
@@ -88,8 +88,9 @@ cm24mhz: cm24mhz@24M {
 		};
 
 		/* Oscillator on the core module, clocks the CPU core */
-		cmosc: cmosc@24M {
+		cmosc: clock-controller@8 {
 			compatible = "arm,syscon-icst525-integratorap-cm";
+			reg = <0x08 0x04>;
 			#clock-cells = <0>;
 			lock-offset = <0x14>;
 			vco-offset = <0x08>;
@@ -97,8 +98,9 @@ cmosc: cmosc@24M {
 		};
 
 		/* Auxilary oscillator on the core module, 32.369MHz at boot */
-		auxosc: auxosc@24M {
+		auxosc: clock-controller@1c {
 			compatible = "arm,syscon-icst525";
+			reg = <0x1c 0x04>;
 			#clock-cells = <0>;
 			lock-offset = <0x14>;
 			vco-offset = <0x1c>;
@@ -109,13 +111,17 @@ auxosc: auxosc@24M {
 	syscon {
 		compatible = "arm,integrator-ap-syscon", "syscon";
 		reg = <0x11000000 0x100>;
+		ranges = <0x0 0x11000000 0x100>;
+		#size-cells = <1>;
+		#address-cells = <1>;
 
 		/*
 		 * SYSCLK clocks PCIv3 bridge, system controller and the
 		 * logic modules.
 		 */
-		sysclk: apsys@24M {
+		sysclk: clock-controller@4 {
 			compatible = "arm,syscon-icst525-integratorap-sys";
+			reg = <0x04 0x04>;
 			#clock-cells = <0>;
 			lock-offset = <0x1c>;
 			vco-offset = <0x04>;
@@ -123,8 +129,9 @@ sysclk: apsys@24M {
 		};
 
 		/* One-bit control for the PCI bus clock (33 or 25 MHz) */
-		pciclk: pciclk@24M {
+		pciclk: clock-controller@4,8 {
 			compatible = "arm,syscon-icst525-integratorap-pci";
+			reg = <0x04 0x04>;
 			#clock-cells = <0>;
 			lock-offset = <0x1c>;
 			vco-offset = <0x04>;
diff --git a/arch/arm/boot/dts/integratorcp.dts b/arch/arm/boot/dts/integratorcp.dts
index 01fa229e1bd0..38fc7e81bdb6 100644
--- a/arch/arm/boot/dts/integratorcp.dts
+++ b/arch/arm/boot/dts/integratorcp.dts
@@ -92,8 +92,9 @@ cm24mhz: cm24mhz@24M {
 		};
 
 		/* Oscillator on the core module, clocks the CPU core */
-		cmcore: cmosc@24M {
+		cmcore: clock-controller@8 {
 			compatible = "arm,syscon-icst525-integratorcp-cm-core";
+			reg = <0x08 0x04>;
 			#clock-cells = <0>;
 			lock-offset = <0x14>;
 			vco-offset = <0x08>;
@@ -101,8 +102,9 @@ cmcore: cmosc@24M {
 		};
 
 		/* Oscillator on the core module, clocks the memory bus */
-		cmmem: cmosc@24M {
+		cmmem: clock-controller@8,12 {
 			compatible = "arm,syscon-icst525-integratorcp-cm-mem";
+			reg = <0x08 0x04>;
 			#clock-cells = <0>;
 			lock-offset = <0x14>;
 			vco-offset = <0x08>;
@@ -110,8 +112,9 @@ cmmem: cmosc@24M {
 		};
 
 		/* Auxilary oscillator on the core module, clocks the CLCD */
-		auxosc: auxosc@24M {
+		auxosc: clock-controller@1c {
 			compatible = "arm,syscon-icst525";
+			reg = <0x1c 0x04>;
 			#clock-cells = <0>;
 			lock-offset = <0x14>;
 			vco-offset = <0x1c>;
-- 
2.30.2

