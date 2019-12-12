Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4DA111C3F7
	for <lists+linux-leds@lfdr.de>; Thu, 12 Dec 2019 04:42:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727666AbfLLDkC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 11 Dec 2019 22:40:02 -0500
Received: from mx2.suse.de ([195.135.220.15]:58692 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727598AbfLLDkC (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 11 Dec 2019 22:40:02 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 54FADADBB;
        Thu, 12 Dec 2019 03:40:00 +0000 (UTC)
From:   =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
To:     linux-realtek-soc@lists.infradead.org, linux-leds@vger.kernel.org
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
        Roc He <hepeng@zidoo.tv>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [RFC 08/25] arm64: dts: realtek: rtd129x-zidoo-x9s: Add TM1628 LED controller
Date:   Thu, 12 Dec 2019 04:39:35 +0100
Message-Id: <20191212033952.5967-9-afaerber@suse.de>
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

Add a spi-gpio node and LED controller slave node.

Cc: Roc He <hepeng@zidoo.tv>
Signed-off-by: Andreas Färber <afaerber@suse.de>
---
 arch/arm64/boot/dts/realtek/rtd1295-zidoo-x9s.dts | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/realtek/rtd1295-zidoo-x9s.dts b/arch/arm64/boot/dts/realtek/rtd1295-zidoo-x9s.dts
index 628dfd123fa1..5183acd851a8 100644
--- a/arch/arm64/boot/dts/realtek/rtd1295-zidoo-x9s.dts
+++ b/arch/arm64/boot/dts/realtek/rtd1295-zidoo-x9s.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
 /*
- * Copyright (c) 2016-2017 Andreas Färber
+ * Copyright (c) 2016-2019 Andreas Färber
  */
 
 /dts-v1/;
@@ -42,6 +42,26 @@
 		gpio = <&misc_gpio 16 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
+
+	spi {
+		compatible = "spi-gpio";
+		sck-gpios = <&iso_gpio 4 GPIO_ACTIVE_HIGH>;
+		mosi-gpios = <&iso_gpio 3 GPIO_ACTIVE_HIGH>;
+		cs-gpios = <&iso_gpio 2 GPIO_ACTIVE_LOW>;
+		num-chipselects = <1>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		tm1628: led-controller@0 {
+			compatible = "titanmec,tm1628";
+			reg = <0>;
+			spi-3wire;
+			spi-lsb-first;
+			spi-rx-delay-us = <1>;
+			spi-max-frequency = <500000>;
+			#grids = <7>;
+		};
+	};
 };
 
 &cpu0 {
-- 
2.16.4

