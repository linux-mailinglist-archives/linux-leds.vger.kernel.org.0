Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7521DC4BD
	for <lists+linux-leds@lfdr.de>; Fri, 18 Oct 2019 14:26:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2633756AbfJRM02 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 18 Oct 2019 08:26:28 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:40352 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2633710AbfJRM0C (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 18 Oct 2019 08:26:02 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9ICPu3s078643;
        Fri, 18 Oct 2019 07:25:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571401556;
        bh=IhBf76ZkV825gD29NdnMc9uoR76ENOTa4bPn385iiJ0=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=NUYJvGnQRMKfSoaZYbR9LYmw6K0iOY4qYyi78GqF0oSWyaYawn51TSawID0OWK3CP
         3a3D9qI4TfxmCCPRG5N2dBZUpVGBap217CbUHrk70AnOmS/gkAyHDusScIh06N0ZFA
         qdr3PfFYiBMOaoTaqO4u+uFG6nPJzXTJXdvmA5xw=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9ICPuEp091729;
        Fri, 18 Oct 2019 07:25:56 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 18
 Oct 2019 07:25:48 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 18 Oct 2019 07:25:48 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9ICPuC2012272;
        Fri, 18 Oct 2019 07:25:56 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>, Tony Lindgren <tony@atomide.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>
Subject: [PATCH v14 09/19] ARM: dts: n900: Add reg property to the LP5523 channel node
Date:   Fri, 18 Oct 2019 07:25:11 -0500
Message-ID: <20191018122521.6757-10-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
In-Reply-To: <20191018122521.6757-1-dmurphy@ti.com>
References: <20191018122521.6757-1-dmurphy@ti.com>
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
accomodation this allows the LEDs to be placed on any channel
and allow designs to skip channels as opposed to requiring
sequential order.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
Acked-by: Tony Lindgren <tony@atomide.com>
CC: Tony Lindgren <tony@atomide.com>
CC: "Benoît Cousson" <bcousson@baylibre.com>
---
 arch/arm/boot/dts/omap3-n900.dts | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/omap3-n900.dts b/arch/arm/boot/dts/omap3-n900.dts
index 84a5ade1e865..643f35619246 100644
--- a/arch/arm/boot/dts/omap3-n900.dts
+++ b/arch/arm/boot/dts/omap3-n900.dts
@@ -607,63 +607,74 @@
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
2.22.0.214.g8dca754b1e

