Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABB47FC7A2
	for <lists+linux-leds@lfdr.de>; Thu, 14 Nov 2019 14:33:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727283AbfKNNca (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 14 Nov 2019 08:32:30 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:49008 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727364AbfKNNc3 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 14 Nov 2019 08:32:29 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAEDWJYS067452;
        Thu, 14 Nov 2019 07:32:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573738339;
        bh=Q6v3ZsELVVFaq45xRxLW4voHJAlhEXxHc1kVNsr3mZg=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=vOmmhXVlwKnvPUfLkSWooIe3y7JWhzLjfBCSTtIMlu9QAHzSpF97AmmKY+wagTtnS
         dT7D1YjZpwlFnon+/JJiMEOmPRBNkYRp6dfyjRqHNL7h8zLCBrFU417Do44rgyrKv/
         Y5a4SR5577GXT4LHN1Fm3WvOYUjf33JXb9r1EQvI=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAEDWIsp005410
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 14 Nov 2019 07:32:19 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 14
 Nov 2019 07:32:18 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 14 Nov 2019 07:32:18 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAEDWIVX036579;
        Thu, 14 Nov 2019 07:32:18 -0600
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
Subject: [PATCH v17 10/19] ARM: dts: imx6dl-yapp4: Add reg property to the lp5562 channel node
Date:   Thu, 14 Nov 2019 07:30:14 -0600
Message-ID: <20191114133023.32185-11-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
In-Reply-To: <20191114133023.32185-1-dmurphy@ti.com>
References: <20191114133023.32185-1-dmurphy@ti.com>
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
CC: Shawn Guo <shawnguo@kernel.org>
CC: Sascha Hauer <s.hauer@pengutronix.de>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>
CC: Fabio Estevam <festevam@gmail.com>
CC: NXP Linux Team <linux-imx@nxp.com>
---
 arch/arm/boot/dts/imx6dl-yapp4-common.dtsi | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/imx6dl-yapp4-common.dtsi b/arch/arm/boot/dts/imx6dl-yapp4-common.dtsi
index e8d800fec637..efc466ed1fea 100644
--- a/arch/arm/boot/dts/imx6dl-yapp4-common.dtsi
+++ b/arch/arm/boot/dts/imx6dl-yapp4-common.dtsi
@@ -257,29 +257,35 @@
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
2.22.0.214.g8dca754b1e

