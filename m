Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFBB7222AE9
	for <lists+linux-leds@lfdr.de>; Thu, 16 Jul 2020 20:21:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729648AbgGPSV1 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 16 Jul 2020 14:21:27 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:40388 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728402AbgGPSV0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 16 Jul 2020 14:21:26 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06GIL7sx062632;
        Thu, 16 Jul 2020 13:21:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1594923667;
        bh=AtFpbFN/pk3H2W7tsZe1q1Dl9Qhx5ZausPpl8TMz2w4=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=h+AjHwpyp4eMvnTj4HGj+tpJAeKcUL6O9GmQbCRsX9bpe4dge1SQYtQaSSCAYynp+
         fJ7CnQEYRVLUJ/+2tatpBeZyBsgHUs/7CzZC6V/z5XvmIiIuCBOXUDwngsd+sO3XJb
         BrM6hbvwnWcNJq2Tr7Ze+X5pOpVfDf1ZoZCnJB7g=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06GIL7No122919
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 16 Jul 2020 13:21:07 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 16
 Jul 2020 13:21:06 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 16 Jul 2020 13:21:06 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06GIL6ME128238;
        Thu, 16 Jul 2020 13:21:06 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh@kernel.org>,
        <marek.behun@nic.cz>
CC:     <devicetree@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Dan Murphy <dmurphy@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v31 12/12] ARM: dts: ste-href: Add reg property to the LP5521 channel nodes
Date:   Thu, 16 Jul 2020 13:20:07 -0500
Message-ID: <20200716182007.18389-13-dmurphy@ti.com>
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

Signed-off-by: Dan Murphy <dmurphy@ti.com>
CC: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Pavel Machek <pavel@ucw.cz>
---
 arch/arm/boot/dts/ste-href.dtsi | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/ste-href.dtsi b/arch/arm/boot/dts/ste-href.dtsi
index 33e3b0b3c53d..ff47cbf6ed3b 100644
--- a/arch/arm/boot/dts/ste-href.dtsi
+++ b/arch/arm/boot/dts/ste-href.dtsi
@@ -58,16 +58,21 @@ lp5521@33 {
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
@@ -77,15 +82,20 @@ lp5521@34 {
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
2.27.0

