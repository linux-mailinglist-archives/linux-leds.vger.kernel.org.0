Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E86EE11C409
	for <lists+linux-leds@lfdr.de>; Thu, 12 Dec 2019 04:42:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727733AbfLLDkF (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 11 Dec 2019 22:40:05 -0500
Received: from mx2.suse.de ([195.135.220.15]:58692 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727685AbfLLDkE (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 11 Dec 2019 22:40:04 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id D71ADAF37;
        Thu, 12 Dec 2019 03:40:02 +0000 (UTC)
From:   =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
To:     linux-realtek-soc@lists.infradead.org, linux-leds@vger.kernel.org
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [RFC 13/25] arm64: dts: realtek: rtd1295-xnano-x5: Add FD628 LED controller
Date:   Thu, 12 Dec 2019 04:39:40 +0100
Message-Id: <20191212033952.5967-14-afaerber@suse.de>
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

Signed-off-by: Andreas Färber <afaerber@suse.de>
---
 arch/arm64/boot/dts/realtek/rtd1295-xnano-x5.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/realtek/rtd1295-xnano-x5.dts b/arch/arm64/boot/dts/realtek/rtd1295-xnano-x5.dts
index d7878ff942e6..ea9e9a96f1d3 100644
--- a/arch/arm64/boot/dts/realtek/rtd1295-xnano-x5.dts
+++ b/arch/arm64/boot/dts/realtek/rtd1295-xnano-x5.dts
@@ -5,6 +5,8 @@
 
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
+
 #include "rtd1295.dtsi"
 
 / {
@@ -23,6 +25,26 @@
 	chosen {
 		stdout-path = "serial0:115200n8";
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
+		fd628: led-controller@0 {
+			compatible = "fdhisi,fd628";
+			reg = <0>;
+			spi-3wire;
+			spi-lsb-first;
+			spi-rx-delay-us = <1>;
+			spi-max-frequency = <500000>;
+			#grids = <7>;
+		};
+	};
 };
 
 &uart0 {
-- 
2.16.4

