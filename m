Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DD3D11C410
	for <lists+linux-leds@lfdr.de>; Thu, 12 Dec 2019 04:42:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727801AbfLLDkJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 11 Dec 2019 22:40:09 -0500
Received: from mx2.suse.de ([195.135.220.15]:58662 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727783AbfLLDkI (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 11 Dec 2019 22:40:08 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id E4FFBAD7B;
        Thu, 12 Dec 2019 03:40:06 +0000 (UTC)
From:   =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
To:     linux-realtek-soc@lists.infradead.org, linux-leds@vger.kernel.org
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [RFC 21/25] arm64: dts: realtek: rtd1295-xnano-x5: Add display to FD628
Date:   Thu, 12 Dec 2019 04:39:48 +0100
Message-Id: <20191212033952.5967-22-afaerber@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191212033952.5967-1-afaerber@suse.de>
References: <20191212033952.5967-1-afaerber@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add a child node for 4-digit 7-segment display.

Signed-off-by: Andreas Färber <afaerber@suse.de>
---
 arch/arm64/boot/dts/realtek/rtd1295-xnano-x5.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/realtek/rtd1295-xnano-x5.dts b/arch/arm64/boot/dts/realtek/rtd1295-xnano-x5.dts
index 9d678b300c7b..07de95427874 100644
--- a/arch/arm64/boot/dts/realtek/rtd1295-xnano-x5.dts
+++ b/arch/arm64/boot/dts/realtek/rtd1295-xnano-x5.dts
@@ -47,6 +47,10 @@
 			#address-cells = <2>;
 			#size-cells = <0>;
 
+			display@0,8 {
+				reg = <0 8>, <0 7>, <0 6>, <0 5>;
+			};
+
 			apps@1,4 {
 				reg = <1 4>;
 				color = <LED_COLOR_ID_WHITE>;
-- 
2.16.4

