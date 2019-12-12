Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E08B11C431
	for <lists+linux-leds@lfdr.de>; Thu, 12 Dec 2019 04:42:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728025AbfLLDlQ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 11 Dec 2019 22:41:16 -0500
Received: from mx2.suse.de ([195.135.220.15]:58728 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727605AbfLLDkC (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 11 Dec 2019 22:40:02 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id D7461AF27;
        Thu, 12 Dec 2019 03:40:00 +0000 (UTC)
From:   =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
To:     linux-realtek-soc@lists.infradead.org, linux-leds@vger.kernel.org
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
        Roc He <hepeng@zidoo.tv>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [RFC 09/25] arm64: dts: realtek: rtd1295-zidoo-x9s: Add regular LEDs to TM1628
Date:   Thu, 12 Dec 2019 04:39:36 +0100
Message-Id: <20191212033952.5967-10-afaerber@suse.de>
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

Add a child node for the half-second colon.

Cc: Roc He <hepeng@zidoo.tv>
Signed-off-by: Andreas Färber <afaerber@suse.de>
---
 arch/arm64/boot/dts/realtek/rtd1295-zidoo-x9s.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/realtek/rtd1295-zidoo-x9s.dts b/arch/arm64/boot/dts/realtek/rtd1295-zidoo-x9s.dts
index 5183acd851a8..219b4987412c 100644
--- a/arch/arm64/boot/dts/realtek/rtd1295-zidoo-x9s.dts
+++ b/arch/arm64/boot/dts/realtek/rtd1295-zidoo-x9s.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 
 #include "rtd1295.dtsi"
 
@@ -60,6 +61,15 @@
 			spi-rx-delay-us = <1>;
 			spi-max-frequency = <500000>;
 			#grids = <7>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+
+			colon@5,4 {
+				reg = <5 4>;
+				color = <LED_COLOR_ID_WHITE>;
+				function = LED_FUNCTION_STATUS;
+				function-enumerator = <5>;
+			};
 		};
 	};
 };
-- 
2.16.4

