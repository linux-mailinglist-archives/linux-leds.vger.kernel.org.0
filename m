Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7EF91E2785
	for <lists+linux-leds@lfdr.de>; Tue, 26 May 2020 18:48:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728598AbgEZQri (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 26 May 2020 12:47:38 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:46410 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388690AbgEZQri (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 26 May 2020 12:47:38 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04QGlUlY056039;
        Tue, 26 May 2020 11:47:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1590511650;
        bh=ImlFYf5QGCH7PcwOqYVdrICvX8qjrx/mlmRBIsjna5I=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=MaVtbCr1pi4AzSN32wTsiG0lntDR0lOauPYqEZkyT9TniSFLhFMpesU9JVySJZiVy
         JK5trw50FLptDWD/6gcDDW/SzWYYZbz6Ca++T/NwtgKv2c8wH2x99QHVUw+0aj0XJz
         qmoi0uk7jwoIlX5kjrC/w0SmkJNlqOPc2YcjFaZw=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04QGlUc9039262
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 26 May 2020 11:47:30 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 26
 May 2020 11:47:30 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 26 May 2020 11:47:30 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04QGlUHG047318;
        Tue, 26 May 2020 11:47:30 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Dan Murphy <dmurphy@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>
Subject: [PATCH v25 07/16] ARM: dts: n900: Add reg property to the LP5523 channel node
Date:   Tue, 26 May 2020 11:46:43 -0500
Message-ID: <20200526164652.2331-8-dmurphy@ti.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200526164652.2331-1-dmurphy@ti.com>
References: <20200526164652.2331-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add the reg property to each channel node.  This update is
to accomodate the multicolor framework.  In addition to the
accommodation this allows the LEDs to be placed on any channel
and allow designs to skip channels as opposed to requiring
sequential order.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
Acked-by: Tony Lindgren <tony@atomide.com>
CC: Tony Lindgren <tony@atomide.com>
CC: "Benoît Cousson" <bcousson@baylibre.com>
Acked-by: Pavel Machek <pavel@ucw.cz>
---
 arch/arm/boot/dts/omap3-n900.dts | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/omap3-n900.dts b/arch/arm/boot/dts/omap3-n900.dts
index 4089d97405c9..ebe93b06b4f7 100644
--- a/arch/arm/boot/dts/omap3-n900.dts
+++ b/arch/arm/boot/dts/omap3-n900.dts
@@ -618,63 +618,74 @@ indicator {
 	};
 
 	lp5523: lp5523@32 {
+		#address-cells = <1>;
+		#size-cells = <0>;
 		compatible = "national,lp5523";
 		reg = <0x32>;
 		clock-mode = /bits/ 8 <0>; /* LP55XX_CLOCK_AUTO */
 		enable-gpio = <&gpio2 9 GPIO_ACTIVE_HIGH>; /* 41 */
 
-		chan0 {
+		chan@0 {
 			chan-name = "lp5523:kb1";
 			led-cur = /bits/ 8 <50>;
 			max-cur = /bits/ 8 <100>;
+			reg = <0>;
 		};
 
-		chan1 {
+		chan@1 {
 			chan-name = "lp5523:kb2";
 			led-cur = /bits/ 8 <50>;
 			max-cur = /bits/ 8 <100>;
+			reg = <1>;
 		};
 
-		chan2 {
+		chan@2 {
 			chan-name = "lp5523:kb3";
 			led-cur = /bits/ 8 <50>;
 			max-cur = /bits/ 8 <100>;
+			reg = <2>;
 		};
 
-		chan3 {
+		chan@3 {
 			chan-name = "lp5523:kb4";
 			led-cur = /bits/ 8 <50>;
 			max-cur = /bits/ 8 <100>;
+			reg = <3>;
 		};
 
-		chan4 {
+		chan@4 {
 			chan-name = "lp5523:b";
 			led-cur = /bits/ 8 <50>;
 			max-cur = /bits/ 8 <100>;
+			reg = <4>;
 		};
 
-		chan5 {
+		chan@5 {
 			chan-name = "lp5523:g";
 			led-cur = /bits/ 8 <50>;
 			max-cur = /bits/ 8 <100>;
+			reg = <5>;
 		};
 
-		chan6 {
+		chan@6 {
 			chan-name = "lp5523:r";
 			led-cur = /bits/ 8 <50>;
 			max-cur = /bits/ 8 <100>;
+			reg = <6>;
 		};
 
-		chan7 {
+		chan@7 {
 			chan-name = "lp5523:kb5";
 			led-cur = /bits/ 8 <50>;
 			max-cur = /bits/ 8 <100>;
+			reg = <7>;
 		};
 
-		chan8 {
+		chan@8 {
 			chan-name = "lp5523:kb6";
 			led-cur = /bits/ 8 <50>;
 			max-cur = /bits/ 8 <100>;
+			reg = <8>;
 		};
 	};
 
-- 
2.25.1

