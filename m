Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D390D9640
	for <lists+linux-leds@lfdr.de>; Wed, 16 Oct 2019 18:01:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405267AbfJPQBa (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 16 Oct 2019 12:01:30 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:48438 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405887AbfJPQAe (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 16 Oct 2019 12:00:34 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9GG0Vuj045895;
        Wed, 16 Oct 2019 11:00:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571241631;
        bh=95PMofJsyIEn3NAsJyz9IppOg+cVPNREQZwHO7yf3yY=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=k7rpbd5Cz5Uhe91DFPdxTxN5t9DZuEajfjc4QSheanWPwBnrYjbzRXfDyiaudT0ii
         muVIL778wrr2BmQh+fNJVQEdbUHL4WaDV32ukT1OOhCwbQPX+2he3zUYzJ2zray1Tb
         8o4xfVj1be1EheQpnX44W02pKVUauojFAvIAv74E=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9GG0V04094826
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 16 Oct 2019 11:00:31 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 16
 Oct 2019 11:00:24 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 16 Oct 2019 11:00:24 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9GG0U1a113265;
        Wed, 16 Oct 2019 11:00:30 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v13 11/18] ARM: dts: ste-href: Add reg property to the LP5521 channel nodes
Date:   Wed, 16 Oct 2019 10:59:47 -0500
Message-ID: <20191016155954.29044-12-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
In-Reply-To: <20191016155954.29044-1-dmurphy@ti.com>
References: <20191016155954.29044-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
CC: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/ste-href.dtsi | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/ste-href.dtsi b/arch/arm/boot/dts/ste-href.dtsi
index 4f6acbd8c040..8a873da102d3 100644
--- a/arch/arm/boot/dts/ste-href.dtsi
+++ b/arch/arm/boot/dts/ste-href.dtsi
@@ -56,16 +56,21 @@
 				reg = <0x33>;
 				label = "lp5521_pri";
 				clock-mode = /bits/ 8 <2>;
-				chan0 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				chan@0 {
+					reg = <0>;
 					led-cur = /bits/ 8 <0x2f>;
 					max-cur = /bits/ 8 <0x5f>;
 					linux,default-trigger = "heartbeat";
 				};
-				chan1 {
+				chan@1 {
+					reg = <1>;
 					led-cur = /bits/ 8 <0x2f>;
 					max-cur = /bits/ 8 <0x5f>;
 				};
-				chan2 {
+				chan@2 {
+					reg = <2>;
 					led-cur = /bits/ 8 <0x2f>;
 					max-cur = /bits/ 8 <0x5f>;
 				};
@@ -75,15 +80,20 @@
 				reg = <0x34>;
 				label = "lp5521_sec";
 				clock-mode = /bits/ 8 <2>;
-				chan0 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				chan@0 {
+					reg = <0>;
 					led-cur = /bits/ 8 <0x2f>;
 					max-cur = /bits/ 8 <0x5f>;
 				};
-				chan1 {
+				chan@1 {
+					reg = <1>;
 					led-cur = /bits/ 8 <0x2f>;
 					max-cur = /bits/ 8 <0x5f>;
 				};
-				chan2 {
+				chan@2 {
+					reg = <2>;
 					led-cur = /bits/ 8 <0x2f>;
 					max-cur = /bits/ 8 <0x5f>;
 				};
-- 
2.22.0.214.g8dca754b1e

