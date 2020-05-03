Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E31941C2C73
	for <lists+linux-leds@lfdr.de>; Sun,  3 May 2020 14:43:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728787AbgECMmP (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 3 May 2020 08:42:15 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:56586 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728631AbgECMl2 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 3 May 2020 08:41:28 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 043CfPcG038609;
        Sun, 3 May 2020 07:41:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1588509685;
        bh=cpHOcxwnjho3INKT3sFhD9XlStpAaDQZ/SjiJomkzhM=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=TBEjeQq+YYj2LF1Df1pX6FQWmHJ+kXkhUGRDOCb72OAvBFbbyTRa9EJd1KDrtY/sK
         vN7ADEaNS6l9qp6atya/f7rvqxTFQr0ay4CXPn3Zc0V1nJVj7S4ImEvzZo6mi10Mmt
         JMj2exrGB5YrFTeBMv6+5jcmYoQHYKzVmVS5Jl1k=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 043CfPu1025731
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sun, 3 May 2020 07:41:25 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Sun, 3 May
 2020 07:41:25 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Sun, 3 May 2020 07:41:25 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 043CfP33019170;
        Sun, 3 May 2020 07:41:25 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v24 09/16] ARM: dts: ste-href: Add reg property to the LP5521 channel nodes
Date:   Sun, 3 May 2020 07:32:08 -0500
Message-ID: <20200503123215.6449-10-dmurphy@ti.com>
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
2.25.1

