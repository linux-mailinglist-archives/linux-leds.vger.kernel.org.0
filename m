Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B455C1C2C5D
	for <lists+linux-leds@lfdr.de>; Sun,  3 May 2020 14:43:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728688AbgECMlc (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 3 May 2020 08:41:32 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:42830 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728683AbgECMlb (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 3 May 2020 08:41:31 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 043CfK56047243;
        Sun, 3 May 2020 07:41:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1588509680;
        bh=NphKBmNNOtBLN+eDmPxKyREpLd3vrj96FQZmoP1LpuE=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=XK3re8C6VCyQIpbQicspDIakhtzUbSahIbsiYBhf/PVlK8sgR0NSD5XVOzBPSuJWn
         AvC9uhiBdTmLIj63zhHb/H6vdZ1YSusrT76UQ28fV6VM4X3SJXJxdjQkkdBDiy2qQ2
         wKiZQ+FuQmkJj7/SS8hehniDaC3jDM+IZtU7Zipg=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 043CfKmZ017994;
        Sun, 3 May 2020 07:41:20 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Sun, 3 May
 2020 07:41:19 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Sun, 3 May 2020 07:41:19 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 043CfJad013399;
        Sun, 3 May 2020 07:41:19 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
Subject: [PATCH v24 08/16] ARM: dts: imx6dl-yapp4: Add reg property to the lp5562 channel node
Date:   Sun, 3 May 2020 07:32:07 -0500
Message-ID: <20200503123215.6449-9-dmurphy@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200503123215.6449-1-dmurphy@ti.com>
References: <20200503123215.6449-1-dmurphy@ti.com>
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
2.25.1

