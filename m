Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D4B71BC4A0
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2020 18:11:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728103AbgD1QKM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 28 Apr 2020 12:10:12 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:43744 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728454AbgD1QKL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 28 Apr 2020 12:10:11 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03SGA5BZ043205;
        Tue, 28 Apr 2020 11:10:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1588090205;
        bh=JVuHq7/5uZf9v1Kex9j0T50EFcRdC8TXzYwYmMtLpyk=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=zLj/3Sw11cI9/jaKMGmjUVXa5WJxd8uGdDvZ+AEAEvS89sIHVO53j5Yfd9qdnpDu7
         ei+bIth4hNcTzRnUtE1+X0PWwxOd+mMTdivd3dihODZqKkT/YLVs4yk3Zh/WS1XquE
         ZQIy+RI5mb75P3gBAKhojj3MEun1n0tOnkGfq8qg=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03SGA5dk060813
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 28 Apr 2020 11:10:05 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 28
 Apr 2020 11:10:04 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 28 Apr 2020 11:10:04 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03SGA4Wq069653;
        Tue, 28 Apr 2020 11:10:04 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>, Tony Lindgren <tony@atomide.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>
Subject: [PATCH v21 07/16] ARM: dts: n900: Add reg property to the LP5523 channel node
Date:   Tue, 28 Apr 2020 11:03:29 -0500
Message-ID: <20200428160338.2793-8-dmurphy@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200428160338.2793-1-dmurphy@ti.com>
References: <20200428160338.2793-1-dmurphy@ti.com>
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

