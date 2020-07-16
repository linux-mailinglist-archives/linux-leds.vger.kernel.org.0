Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88E23222AE5
	for <lists+linux-leds@lfdr.de>; Thu, 16 Jul 2020 20:21:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729614AbgGPSVT (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 16 Jul 2020 14:21:19 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:58772 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728402AbgGPSVT (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 16 Jul 2020 14:21:19 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06GIL1YV014873;
        Thu, 16 Jul 2020 13:21:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1594923661;
        bh=P76IZRkED7dQ4c2udzasJMAbjx+227B6ANM3Dbv8Q3M=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=gci00rTMlSvGSXDxb1nlWX94wr6n7N6NyEBLUKat98vRwB7IZvMVDL10OfbgIEaBX
         LKdJDPLOmjDnFGLMnHwkIxWLPUDLVCKFr/1fgs0v5XCCkAmDho4wLKARQ4ypRAH0H/
         hxoJzDIMomawfudfiHa1i9XLRVzm6W7QJNGajNvc=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06GIL1bg087578
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 16 Jul 2020 13:21:01 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 16
 Jul 2020 13:21:01 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 16 Jul 2020 13:21:01 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06GIL1Ql127714;
        Thu, 16 Jul 2020 13:21:01 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh@kernel.org>,
        <marek.behun@nic.cz>
CC:     <devicetree@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Dan Murphy <dmurphy@ti.com>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
Subject: [PATCH v31 11/12] ARM: dts: imx6dl-yapp4: Add reg property to the lp5562 channel node
Date:   Thu, 16 Jul 2020 13:20:06 -0500
Message-ID: <20200716182007.18389-12-dmurphy@ti.com>
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

Add the reg property to each channel node.  This update is
to accommodate the multicolor framework.  In addition to the
accommodation this allows the LEDs to be placed on any channel
and allow designs to skip channels as opposed to requiring
sequential order.

Acked-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Dan Murphy <dmurphy@ti.com>
CC: Shawn Guo <shawnguo@kernel.org>
CC: Sascha Hauer <s.hauer@pengutronix.de>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>
CC: Fabio Estevam <festevam@gmail.com>
CC: NXP Linux Team <linux-imx@nxp.com>
---
 arch/arm/boot/dts/imx6dl-yapp4-common.dtsi | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/imx6dl-yapp4-common.dtsi b/arch/arm/boot/dts/imx6dl-yapp4-common.dtsi
index 2b9423d55c37..77aa90640052 100644
--- a/arch/arm/boot/dts/imx6dl-yapp4-common.dtsi
+++ b/arch/arm/boot/dts/imx6dl-yapp4-common.dtsi
@@ -258,29 +258,35 @@ leds: led-controller@30 {
 		reg = <0x30>;
 		clock-mode = /bits/ 8 <1>;
 		status = "disabled";
+		#address-cells = <1>;
+		#size-cells = <0>;
 
-		chan0 {
+		chan@0 {
 			chan-name = "R";
 			led-cur = /bits/ 8 <0x20>;
 			max-cur = /bits/ 8 <0x60>;
+			reg = <0>;
 		};
 
-		chan1 {
+		chan@1 {
 			chan-name = "G";
 			led-cur = /bits/ 8 <0x20>;
 			max-cur = /bits/ 8 <0x60>;
+			reg = <1>;
 		};
 
-		chan2 {
+		chan@2 {
 			chan-name = "B";
 			led-cur = /bits/ 8 <0x20>;
 			max-cur = /bits/ 8 <0x60>;
+			reg = <2>;
 		};
 
-		chan3 {
+		chan@3 {
 			chan-name = "W";
 			led-cur = /bits/ 8 <0x0>;
 			max-cur = /bits/ 8 <0x0>;
+			reg = <3>;
 		};
 	};
 
-- 
2.27.0

