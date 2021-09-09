Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BC2E405EED
	for <lists+linux-leds@lfdr.de>; Thu,  9 Sep 2021 23:31:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346995AbhIIVcm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 9 Sep 2021 17:32:42 -0400
Received: from mail-oi1-f176.google.com ([209.85.167.176]:36431 "EHLO
        mail-oi1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347576AbhIIVcj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 9 Sep 2021 17:32:39 -0400
Received: by mail-oi1-f176.google.com with SMTP id s20so4462965oiw.3;
        Thu, 09 Sep 2021 14:31:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cqIeqU65iovt1/KVYn/OKZzsq19Zz/ArZBTPcmVHg2A=;
        b=0ud1TOZrlwAZ54EM8XchjEMe1/Nwc6UAKSkADh4LHTCk9BlzcbWXl333GhpWTSZlUv
         qYSQ71977Ax1XSzdn9qcX9I4XEdeVLzsMI0lN3PuFnACAcQDMFm0aa6M5U8k4rtf06Lc
         dNDhIJMJ8p+MxE2wvnN6SKChGD8UKUidt3lhY73ZaDDUagxxXpkRHOh1+KlUjprr4K2Y
         K+K3PHgUujlc6YAE+ENEXGKa+0ExJekHrSm3rpx/hty7X2pkdJ3ECT48km6WJlL9iXlX
         EZWG+fvv+PQT/tMkyw0IFeY8NLzFPdXVEjfZPvUzITGq0araW28SdWS5cfG9E6xvrB4l
         Q1rQ==
X-Gm-Message-State: AOAM533o5YW132a1a0H9mWnW23rPARvytf7eDEDUoSHyIJVsKX8mT5Z3
        mpr2EcuH3iXyu+YMM/AF0Q==
X-Google-Smtp-Source: ABdhPJzv0V6ekuW3Ef2XE9Y7lW48puZmZlWSg8z902XDtXPtjJbXhcRaVmUZn8ENgPogypJNAPI7ag==
X-Received: by 2002:a05:6808:642:: with SMTP id z2mr1578778oih.26.1631223088163;
        Thu, 09 Sep 2021 14:31:28 -0700 (PDT)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.googlemail.com with ESMTPSA id m24sm694929oie.50.2021.09.09.14.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 14:31:27 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, Pavel Machek <pavel@ucw.cz>
Cc:     Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: [PATCH 6/8] ARM: dts: arm: Update register-bit-led nodes 'reg' and node names
Date:   Thu,  9 Sep 2021 16:31:16 -0500
Message-Id: <20210909213118.1087083-7-robh@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909213118.1087083-1-robh@kernel.org>
References: <20210909213118.1087083-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add a 'reg' entry for register-bit-led nodes on the Arm Ltd platforms.
The 'reg' entry is the LED control register address. With this, the node
name can be updated to use a generic node name, 'led', and a
unit-address.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/arm/boot/dts/arm-realview-eb.dtsi        | 27 +++++++++++++------
 arch/arm/boot/dts/arm-realview-pb1176.dts     | 27 +++++++++++++------
 arch/arm/boot/dts/arm-realview-pb11mp.dts     | 27 +++++++++++++------
 arch/arm/boot/dts/arm-realview-pbx.dtsi       | 27 +++++++++++++------
 arch/arm/boot/dts/integrator.dtsi             | 23 +++++++++++-----
 arch/arm/boot/dts/mps2.dtsi                   | 10 +++++--
 arch/arm/boot/dts/versatile-ab-ib2.dts        |  6 ++++-
 arch/arm/boot/dts/versatile-ab.dts            | 27 +++++++++++++------
 arch/arm64/boot/dts/arm/juno-motherboard.dtsi | 27 +++++++++++++------
 9 files changed, 144 insertions(+), 57 deletions(-)

diff --git a/arch/arm/boot/dts/arm-realview-eb.dtsi b/arch/arm/boot/dts/arm-realview-eb.dtsi
index 04e8a27ba1eb..56441ef08a55 100644
--- a/arch/arm/boot/dts/arm-realview-eb.dtsi
+++ b/arch/arm/boot/dts/arm-realview-eb.dtsi
@@ -198,61 +198,72 @@ fpga {
 		syscon: syscon@10000000 {
 			compatible = "arm,realview-eb-syscon", "syscon", "simple-mfd";
 			reg = <0x10000000 0x1000>;
+			ranges = <0x0 0x10000000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
 
-			led@08.0 {
+			led@8,0 {
 				compatible = "register-bit-led";
+				reg = <0x08 0x04>;
 				offset = <0x08>;
 				mask = <0x01>;
 				label = "versatile:0";
 				linux,default-trigger = "heartbeat";
 				default-state = "on";
 			};
-			led@08.1 {
+			led@8,1 {
 				compatible = "register-bit-led";
+				reg = <0x08 0x04>;
 				offset = <0x08>;
 				mask = <0x02>;
 				label = "versatile:1";
 				linux,default-trigger = "mmc0";
 				default-state = "off";
 			};
-			led@08.2 {
+			led@8,2 {
 				compatible = "register-bit-led";
+				reg = <0x08 0x04>;
 				offset = <0x08>;
 				mask = <0x04>;
 				label = "versatile:2";
 				linux,default-trigger = "cpu0";
 				default-state = "off";
 			};
-			led@08.3 {
+			led@8,3 {
 				compatible = "register-bit-led";
+				reg = <0x08 0x04>;
 				offset = <0x08>;
 				mask = <0x08>;
 				label = "versatile:3";
 				default-state = "off";
 			};
-			led@08.4 {
+			led@8,4 {
 				compatible = "register-bit-led";
+				reg = <0x08 0x04>;
 				offset = <0x08>;
 				mask = <0x10>;
 				label = "versatile:4";
 				default-state = "off";
 			};
-			led@08.5 {
+			led@8,5 {
 				compatible = "register-bit-led";
+				reg = <0x08 0x04>;
 				offset = <0x08>;
 				mask = <0x20>;
 				label = "versatile:5";
 				default-state = "off";
 			};
-			led@08.6 {
+			led@8,6 {
 				compatible = "register-bit-led";
+				reg = <0x08 0x04>;
 				offset = <0x08>;
 				mask = <0x40>;
 				label = "versatile:6";
 				default-state = "off";
 			};
-			led@08.7 {
+			led@8,7 {
 				compatible = "register-bit-led";
+				reg = <0x08 0x04>;
 				offset = <0x08>;
 				mask = <0x80>;
 				label = "versatile:7";
diff --git a/arch/arm/boot/dts/arm-realview-pb1176.dts b/arch/arm/boot/dts/arm-realview-pb1176.dts
index 366687fb1ee3..df71ee27294d 100644
--- a/arch/arm/boot/dts/arm-realview-pb1176.dts
+++ b/arch/arm/boot/dts/arm-realview-pb1176.dts
@@ -216,61 +216,72 @@ soc {
 		syscon: syscon@10000000 {
 			compatible = "arm,realview-pb1176-syscon", "syscon", "simple-mfd";
 			reg = <0x10000000 0x1000>;
+			ranges = <0x0 0x10000000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
 
-			led@08.0 {
+			led@8,0 {
 				compatible = "register-bit-led";
+				reg = <0x08 0x04>;
 				offset = <0x08>;
 				mask = <0x01>;
 				label = "versatile:0";
 				linux,default-trigger = "heartbeat";
 				default-state = "on";
 			};
-			led@08.1 {
+			led@8,1 {
 				compatible = "register-bit-led";
+				reg = <0x08 0x04>;
 				offset = <0x08>;
 				mask = <0x02>;
 				label = "versatile:1";
 				linux,default-trigger = "mmc0";
 				default-state = "off";
 			};
-			led@08.2 {
+			led@8,2 {
 				compatible = "register-bit-led";
+				reg = <0x08 0x04>;
 				offset = <0x08>;
 				mask = <0x04>;
 				label = "versatile:2";
 				linux,default-trigger = "cpu0";
 				default-state = "off";
 			};
-			led@08.3 {
+			led@8,3 {
 				compatible = "register-bit-led";
+				reg = <0x08 0x04>;
 				offset = <0x08>;
 				mask = <0x08>;
 				label = "versatile:3";
 				default-state = "off";
 			};
-			led@08.4 {
+			led@8,4 {
 				compatible = "register-bit-led";
+				reg = <0x08 0x04>;
 				offset = <0x08>;
 				mask = <0x10>;
 				label = "versatile:4";
 				default-state = "off";
 			};
-			led@08.5 {
+			led@8,5 {
 				compatible = "register-bit-led";
+				reg = <0x08 0x04>;
 				offset = <0x08>;
 				mask = <0x20>;
 				label = "versatile:5";
 				default-state = "off";
 			};
-			led@08.6 {
+			led@8,6 {
 				compatible = "register-bit-led";
+				reg = <0x08 0x04>;
 				offset = <0x08>;
 				mask = <0x40>;
 				label = "versatile:6";
 				default-state = "off";
 			};
-			led@08.7 {
+			led@8,7 {
 				compatible = "register-bit-led";
+				reg = <0x08 0x04>;
 				offset = <0x08>;
 				mask = <0x80>;
 				label = "versatile:7";
diff --git a/arch/arm/boot/dts/arm-realview-pb11mp.dts b/arch/arm/boot/dts/arm-realview-pb11mp.dts
index 228a51a38f95..54d4cbd10bdf 100644
--- a/arch/arm/boot/dts/arm-realview-pb11mp.dts
+++ b/arch/arm/boot/dts/arm-realview-pb11mp.dts
@@ -303,64 +303,75 @@ soc {
 		pb11mp_syscon: syscon@10000000 {
 			compatible = "arm,realview-pb11mp-syscon", "syscon", "simple-mfd";
 			reg = <0x10000000 0x1000>;
+			ranges = <0x0 0x10000000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
 
-			led@08.0 {
+			led@8,0 {
 				compatible = "register-bit-led";
+				reg = <0x08 0x04>;
 				offset = <0x08>;
 				mask = <0x01>;
 				label = "versatile:0";
 				linux,default-trigger = "heartbeat";
 				default-state = "on";
 			};
-			led@08.1 {
+			led@8,1 {
 				compatible = "register-bit-led";
+				reg = <0x08 0x04>;
 				offset = <0x08>;
 				mask = <0x02>;
 				label = "versatile:1";
 				linux,default-trigger = "mmc0";
 				default-state = "off";
 			};
-			led@08.2 {
+			led@8,2 {
 				compatible = "register-bit-led";
+				reg = <0x08 0x04>;
 				offset = <0x08>;
 				mask = <0x04>;
 				label = "versatile:2";
 				linux,default-trigger = "cpu0";
 				default-state = "off";
 			};
-			led@08.3 {
+			led@8,3 {
 				compatible = "register-bit-led";
+				reg = <0x08 0x04>;
 				offset = <0x08>;
 				mask = <0x08>;
 				label = "versatile:3";
 				linux,default-trigger = "cpu1";
 				default-state = "off";
 			};
-			led@08.4 {
+			led@8,4 {
 				compatible = "register-bit-led";
+				reg = <0x08 0x04>;
 				offset = <0x08>;
 				mask = <0x10>;
 				label = "versatile:4";
 				linux,default-trigger = "cpu2";
 				default-state = "off";
 			};
-			led@08.5 {
+			led@8,5 {
 				compatible = "register-bit-led";
+				reg = <0x08 0x04>;
 				offset = <0x08>;
 				mask = <0x20>;
 				label = "versatile:5";
 				linux,default-trigger = "cpu3";
 				default-state = "off";
 			};
-			led@08.6 {
+			led@8,6 {
 				compatible = "register-bit-led";
+				reg = <0x08 0x04>;
 				offset = <0x08>;
 				mask = <0x40>;
 				label = "versatile:6";
 				default-state = "off";
 			};
-			led@08.7 {
+			led@8,7 {
 				compatible = "register-bit-led";
+				reg = <0x08 0x04>;
 				offset = <0x08>;
 				mask = <0x80>;
 				label = "versatile:7";
diff --git a/arch/arm/boot/dts/arm-realview-pbx.dtsi b/arch/arm/boot/dts/arm-realview-pbx.dtsi
index ccf6f756b6ed..9366fecc699b 100644
--- a/arch/arm/boot/dts/arm-realview-pbx.dtsi
+++ b/arch/arm/boot/dts/arm-realview-pbx.dtsi
@@ -220,61 +220,72 @@ soc: soc {
 		syscon: syscon@10000000 {
 			compatible = "arm,realview-pbx-syscon", "syscon", "simple-mfd";
 			reg = <0x10000000 0x1000>;
+			ranges = <0x0 0x10000000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
 
-			led@08.0 {
+			led@8,0 {
 				compatible = "register-bit-led";
+				reg = <0x08 0x04>;
 				offset = <0x08>;
 				mask = <0x01>;
 				label = "versatile:0";
 				linux,default-trigger = "heartbeat";
 				default-state = "on";
 			};
-			led@08.1 {
+			led@8,1 {
 				compatible = "register-bit-led";
+				reg = <0x08 0x04>;
 				offset = <0x08>;
 				mask = <0x02>;
 				label = "versatile:1";
 				linux,default-trigger = "mmc0";
 				default-state = "off";
 			};
-			led@08.2 {
+			led@8,2 {
 				compatible = "register-bit-led";
+				reg = <0x08 0x04>;
 				offset = <0x08>;
 				mask = <0x04>;
 				label = "versatile:2";
 				linux,default-trigger = "cpu0";
 				default-state = "off";
 			};
-			led@08.3 {
+			led@8,3 {
 				compatible = "register-bit-led";
+				reg = <0x08 0x04>;
 				offset = <0x08>;
 				mask = <0x08>;
 				label = "versatile:3";
 				default-state = "off";
 			};
-			led@08.4 {
+			led@8,4 {
 				compatible = "register-bit-led";
+				reg = <0x08 0x04>;
 				offset = <0x08>;
 				mask = <0x10>;
 				label = "versatile:4";
 				default-state = "off";
 			};
-			led@08.5 {
+			led@8,5 {
 				compatible = "register-bit-led";
+				reg = <0x08 0x04>;
 				offset = <0x08>;
 				mask = <0x20>;
 				label = "versatile:5";
 				default-state = "off";
 			};
-			led@08.6 {
+			led@8,6 {
 				compatible = "register-bit-led";
+				reg = <0x08 0x04>;
 				offset = <0x08>;
 				mask = <0x40>;
 				label = "versatile:6";
 				default-state = "off";
 			};
-			led@08.7 {
+			led@8,7 {
 				compatible = "register-bit-led";
+				reg = <0x08 0x04>;
 				offset = <0x08>;
 				mask = <0x80>;
 				label = "versatile:7";
diff --git a/arch/arm/boot/dts/integrator.dtsi b/arch/arm/boot/dts/integrator.dtsi
index 602f74d2c758..ad868cfebc94 100644
--- a/arch/arm/boot/dts/integrator.dtsi
+++ b/arch/arm/boot/dts/integrator.dtsi
@@ -15,10 +15,14 @@ memory {
 	core-module@10000000 {
 		compatible = "arm,core-module-integrator", "syscon", "simple-mfd";
 		reg = <0x10000000 0x200>;
+		ranges = <0x0 0x10000000 0x200>;
+		#address-cells = <1>;
+		#size-cells = <1>;
 
 		/* Use core module LED to indicate CPU load */
-		led@c.0 {
+		led@c,0 {
 			compatible = "register-bit-led";
+			reg = <0x0c 0x04>;
 			offset = <0x0c>;
 			mask = <0x01>;
 			label = "integrator:core_module";
@@ -104,35 +108,42 @@ kmi@19000000 {
 			interrupts = <4>;
 		};
 
-		syscon {
+		syscon@1a000000 {
 			/* Debug registers mapped as syscon */
 			compatible = "syscon", "simple-mfd";
 			reg = <0x1a000000 0x10>;
+			ranges = <0x0 0x1a000000 0x10>;
+			#address-cells = <1>;
+			#size-cells = <1>;
 
-			led@4.0 {
+			led@4,0 {
 				compatible = "register-bit-led";
+				reg = <0x04 0x04>;
 				offset = <0x04>;
 				mask = <0x01>;
 				label = "integrator:green0";
 				linux,default-trigger = "heartbeat";
 				default-state = "on";
 			};
-			led@4.1 {
+			led@4,1 {
 				compatible = "register-bit-led";
+				reg = <0x04 0x04>;
 				offset = <0x04>;
 				mask = <0x02>;
 				label = "integrator:yellow";
 				default-state = "off";
 			};
-			led@4.2 {
+			led@4,2 {
 				compatible = "register-bit-led";
+				reg = <0x04 0x04>;
 				offset = <0x04>;
 				mask = <0x04>;
 				label = "integrator:red";
 				default-state = "off";
 			};
-			led@4.3 {
+			led@4,3 {
 				compatible = "register-bit-led";
+				reg = <0x04 0x04>;
 				offset = <0x04>;
 				mask = <0x08>;
 				label = "integrator:green1";
diff --git a/arch/arm/boot/dts/mps2.dtsi b/arch/arm/boot/dts/mps2.dtsi
index 37f5023f529c..b99577d411b1 100644
--- a/arch/arm/boot/dts/mps2.dtsi
+++ b/arch/arm/boot/dts/mps2.dtsi
@@ -216,8 +216,13 @@ fpgaio@8000 {
 			compatible = "syscon", "simple-mfd";
 			reg = <0x8000 0x10>;
 
-			led0 {
+			ranges = <0x0 0x8000 0x10>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			led@0,0 {
 				compatible = "register-bit-led";
+				reg = <0x00 0x04>;
 				offset = <0x0>;
 				mask = <0x01>;
 				label = "userled:0";
@@ -225,8 +230,9 @@ led0 {
 				default-state = "on";
 			};
 
-			led1 {
+			led@0,1 {
 				compatible = "register-bit-led";
+				reg = <0x00 0x04>;
 				offset = <0x0>;
 				mask = <0x02>;
 				label = "userled:1";
diff --git a/arch/arm/boot/dts/versatile-ab-ib2.dts b/arch/arm/boot/dts/versatile-ab-ib2.dts
index c577ff4bb4be..7ebb0dfd0467 100644
--- a/arch/arm/boot/dts/versatile-ab-ib2.dts
+++ b/arch/arm/boot/dts/versatile-ab-ib2.dts
@@ -13,9 +13,13 @@ / {
 	syscon@27000000 {
 		compatible = "arm,versatile-ib2-syscon", "syscon", "simple-mfd";
 		reg = <0x27000000 0x4>;
+		ranges = <0x0 0x27000000 0x4>;
+		#address-cells = <1>;
+		#size-cells = <1>;
 
-		led@00.4 {
+		led@0,4 {
 			compatible = "register-bit-led";
+			reg = <0x00 0x04>;
 			offset = <0x00>;
 			mask = <0x10>;
 			label = "versatile-ib2:0";
diff --git a/arch/arm/boot/dts/versatile-ab.dts b/arch/arm/boot/dts/versatile-ab.dts
index 151c0220047d..79f7cc241282 100644
--- a/arch/arm/boot/dts/versatile-ab.dts
+++ b/arch/arm/boot/dts/versatile-ab.dts
@@ -70,61 +70,72 @@ vga_con_in: endpoint {
 	core-module@10000000 {
 		compatible = "arm,core-module-versatile", "syscon", "simple-mfd";
 		reg = <0x10000000 0x200>;
+		ranges = <0x0 0x10000000 0x200>;
+		#address-cells = <1>;
+		#size-cells = <1>;
 
-		led@08.0 {
+		led@8,0 {
 			compatible = "register-bit-led";
+			reg = <0x08 0x04>;
 			offset = <0x08>;
 			mask = <0x01>;
 			label = "versatile:0";
 			linux,default-trigger = "heartbeat";
 			default-state = "on";
 		};
-		led@08.1 {
+		led@8,1 {
 			compatible = "register-bit-led";
+			reg = <0x08 0x04>;
 			offset = <0x08>;
 			mask = <0x02>;
 			label = "versatile:1";
 			linux,default-trigger = "mmc0";
 			default-state = "off";
 		};
-		led@08.2 {
+		led@8,2 {
 			compatible = "register-bit-led";
+			reg = <0x08 0x04>;
 			offset = <0x08>;
 			mask = <0x04>;
 			label = "versatile:2";
 			linux,default-trigger = "cpu0";
 			default-state = "off";
 		};
-		led@08.3 {
+		led@8,3 {
 			compatible = "register-bit-led";
+			reg = <0x08 0x04>;
 			offset = <0x08>;
 			mask = <0x08>;
 			label = "versatile:3";
 			default-state = "off";
 		};
-		led@08.4 {
+		led@8,4 {
 			compatible = "register-bit-led";
+			reg = <0x08 0x04>;
 			offset = <0x08>;
 			mask = <0x10>;
 			label = "versatile:4";
 			default-state = "off";
 		};
-		led@08.5 {
+		led@8,5 {
 			compatible = "register-bit-led";
+			reg = <0x08 0x04>;
 			offset = <0x08>;
 			mask = <0x20>;
 			label = "versatile:5";
 			default-state = "off";
 		};
-		led@08.6 {
+		led@8,6 {
 			compatible = "register-bit-led";
+			reg = <0x08 0x04>;
 			offset = <0x08>;
 			mask = <0x40>;
 			label = "versatile:6";
 			default-state = "off";
 		};
-		led@08.7 {
+		led@8,7 {
 			compatible = "register-bit-led";
+			reg = <0x08 0x04>;
 			offset = <0x08>;
 			mask = <0x80>;
 			label = "versatile:7";
diff --git a/arch/arm64/boot/dts/arm/juno-motherboard.dtsi b/arch/arm64/boot/dts/arm/juno-motherboard.dtsi
index 40d95c58b55e..f7afb8faf5de 100644
--- a/arch/arm64/boot/dts/arm/juno-motherboard.dtsi
+++ b/arch/arm64/boot/dts/arm/juno-motherboard.dtsi
@@ -153,64 +153,75 @@ v2m_sysctl: sysctl@20000 {
 				apbregs@10000 {
 					compatible = "syscon", "simple-mfd";
 					reg = <0x010000 0x1000>;
+					ranges = <0x0 0x10000 0x1000>;
+					#address-cells = <1>;
+					#size-cells = <1>;
 
-					led0 {
+					led@8,0 {
 						compatible = "register-bit-led";
+						reg = <0x08 0x04>;
 						offset = <0x08>;
 						mask = <0x01>;
 						label = "vexpress:0";
 						linux,default-trigger = "heartbeat";
 						default-state = "on";
 					};
-					led1 {
+					led@8,1 {
 						compatible = "register-bit-led";
+						reg = <0x08 0x04>;
 						offset = <0x08>;
 						mask = <0x02>;
 						label = "vexpress:1";
 						linux,default-trigger = "mmc0";
 						default-state = "off";
 					};
-					led2 {
+					led@8,2 {
 						compatible = "register-bit-led";
+						reg = <0x08 0x04>;
 						offset = <0x08>;
 						mask = <0x04>;
 						label = "vexpress:2";
 						linux,default-trigger = "cpu0";
 						default-state = "off";
 					};
-					led3 {
+					led@8,3 {
 						compatible = "register-bit-led";
+						reg = <0x08 0x04>;
 						offset = <0x08>;
 						mask = <0x08>;
 						label = "vexpress:3";
 						linux,default-trigger = "cpu1";
 						default-state = "off";
 					};
-					led4 {
+					led@8,4 {
 						compatible = "register-bit-led";
+						reg = <0x08 0x04>;
 						offset = <0x08>;
 						mask = <0x10>;
 						label = "vexpress:4";
 						linux,default-trigger = "cpu2";
 						default-state = "off";
 					};
-					led5 {
+					led@8,5 {
 						compatible = "register-bit-led";
+						reg = <0x08 0x04>;
 						offset = <0x08>;
 						mask = <0x20>;
 						label = "vexpress:5";
 						linux,default-trigger = "cpu3";
 						default-state = "off";
 					};
-					led6 {
+					led@8,6 {
 						compatible = "register-bit-led";
+						reg = <0x08 0x04>;
 						offset = <0x08>;
 						mask = <0x40>;
 						label = "vexpress:6";
 						default-state = "off";
 					};
-					led7 {
+					led@8,7 {
 						compatible = "register-bit-led";
+						reg = <0x08 0x04>;
 						offset = <0x08>;
 						mask = <0x80>;
 						label = "vexpress:7";
-- 
2.30.2

