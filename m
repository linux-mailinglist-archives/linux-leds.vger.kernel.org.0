Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F381409D12
	for <lists+linux-leds@lfdr.de>; Mon, 13 Sep 2021 21:28:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347540AbhIMT3u (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 13 Sep 2021 15:29:50 -0400
Received: from mail-ot1-f45.google.com ([209.85.210.45]:44660 "EHLO
        mail-ot1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347356AbhIMT3p (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 13 Sep 2021 15:29:45 -0400
Received: by mail-ot1-f45.google.com with SMTP id g66-20020a9d12c8000000b0051aeba607f1so14896290otg.11;
        Mon, 13 Sep 2021 12:28:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MHpaa4YRiyoKZcNCSnJddNfjbYkMIenyPPEeWchVkSo=;
        b=WmF3rR+Q8GM4IdfiVQhKWfOtMVPFSZssyOawXUTCQoiBKGD+sdA6+YG5RZbs1fQpms
         AHzZ0sEa2A10RAyM6XeePirBpNx6Shyh/3Jmj7WsJpH1nDXOJV1pSo3HJ3ZZbinh+CWb
         /MCO+Fsm3T09oBu2aL2FYauO2AP5cs4haudolgS6q2pA2zkmMRv0uc14Y3ZCz5bqxEwe
         wn6xHfAyibaxJPlPNDInyht0cJAeFfVpPEdz11kJ15tzqnJVXsR77VEGs14/6Y1Pp72a
         BzQR3sPTR2fxKqpXRw3Cl4ZYzyLs+28LHN88xun8dubmninI0BlVfNNZo1lSS8S2swzI
         2SNw==
X-Gm-Message-State: AOAM533rLY+v9bQgEGWoy5j6b2Zs+d4qORpCTTqcwdcLGFI050AnaEG7
        aoH+JF+b7/SYDvTijuxS0mX3W2Ghgg==
X-Google-Smtp-Source: ABdhPJzQLlWnj6YMKe81DufzYKnKe3PxqaekAcR1KnQzPQZlNn1Md3zgAjQj1lcrIzrC7g1dNa6mVg==
X-Received: by 2002:a9d:72dc:: with SMTP id d28mr11211442otk.230.1631561308812;
        Mon, 13 Sep 2021 12:28:28 -0700 (PDT)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.googlemail.com with ESMTPSA id m24sm1907838oie.50.2021.09.13.12.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 12:28:28 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, Pavel Machek <pavel@ucw.cz>
Cc:     Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: [PATCH v2 7/8] ARM: dts: arm: Update ICST clock nodes 'reg' and node names
Date:   Mon, 13 Sep 2021 14:28:15 -0500
Message-Id: <20210913192816.1225025-8-robh@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210913192816.1225025-1-robh@kernel.org>
References: <20210913192816.1225025-1-robh@kernel.org>
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

