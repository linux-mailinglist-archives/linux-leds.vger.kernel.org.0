Return-Path: <linux-leds+bounces-5531-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE1AB81DA7
	for <lists+linux-leds@lfdr.de>; Wed, 17 Sep 2025 23:03:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07FB43BD46D
	for <lists+linux-leds@lfdr.de>; Wed, 17 Sep 2025 21:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7ADC286D57;
	Wed, 17 Sep 2025 21:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="dQgWyPrY"
X-Original-To: linux-leds@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D81928488F;
	Wed, 17 Sep 2025 21:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758143024; cv=none; b=bBGu5+R1s++qe83Wu05TElHTOJMkjwUtZENLSu2Lx1AgTtfIIs8D4me3ssUmQR1AWDlb50xEPi92iXGBgCpq0TQqS0Os3zoIls36X4c6kaN3SFweUdhe6cOocuFl73/+2YF7ExWRMqibSdBC7EojoYEkz2NubWjd258GA6ws54k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758143024; c=relaxed/simple;
	bh=IwFFZCXQOLVb7GZ4/qN58iqaw9529gFbX/J7lxnDmvo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oGqnb75mBquL3ILYGkqyLHSlSMIRJuHu6tg3phAqf545r9zSeDHpKsWOwI2Jyja87GV3LoZY6+gnIAPkYYMmhfxHF0msjPnl0BNRXHW2Ktjvjl3hpNfQvDDkjx0t9bSQL7llnHpcSArLJRfyYlB5QvTzQ9B0cqLFgnSUheE3aFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=dQgWyPrY; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1758143023; x=1789679023;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IwFFZCXQOLVb7GZ4/qN58iqaw9529gFbX/J7lxnDmvo=;
  b=dQgWyPrY4r8hKi4gKM6R+W1Nz+ORQcB/h6kzvvKvdYDMsMiGxhbRZU2m
   kzcTw80j6PjuLMq/eK0mQ5vYVYg14eBiUgDDtDat8CVvY13tGE1tzzH+q
   Mxk6RftMDoagzja9KXbQ9qNYXEDnv6wqIs83hsly676sX96r6fXohNEj7
   SPrmb848Ve+H30YIr3nhrqJInJwkQXAMQv/akmXRgZbDe8fr06jEVvlwV
   6LNIJqjHIxTUrnCRkLOLyL+AXkidFr7HDBRqCcF6FnH3fJOcyRhxErjhD
   7JXPfO9wP3f9wHoAjBXgbSEiMqWuwkF7Dws65HmwCK3Kd7jHQDTUqrW7c
   g==;
X-CSE-ConnectionGUID: CmOguM3+R+yjf+NdgD1gwA==
X-CSE-MsgGUID: +CrTMq7GRbqgNcYR2svHqQ==
X-IronPort-AV: E=Sophos;i="6.18,273,1751266800"; 
   d="scan'208";a="47182889"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 17 Sep 2025 14:03:42 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 17 Sep 2025 14:03:28 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 17 Sep 2025 14:03:28 -0700
From: <Ryan.Wanner@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-leds@vger.kernel.org>, Ryan Wanner
	<Ryan.Wanner@microchip.com>
Subject: [PATCH v2] ARM: dts: microchip: sama7d65: Add GPIO buttons and LEDs
Date: Wed, 17 Sep 2025 14:04:08 -0700
Message-ID: <20250917210409.503830-1-Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Ryan Wanner <Ryan.Wanner@microchip.com>

Add the USER button as a GPIO input as well as add the LEDs and enable
the blue LED as a heartbeat.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
Changes v1 -> v2:
- Remove the label node in the LEDs.
- Use properties color and function to describe the LEDs.
- Add phandles for the LEDs.

 .../dts/microchip/at91-sama7d65_curiosity.dts | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
index f091cc40a9f0..927c27260b6c 100644
--- a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
+++ b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
@@ -11,6 +11,8 @@
 #include "sama7d65-pinfunc.h"
 #include "sama7d65.dtsi"
 #include <dt-bindings/mfd/atmel-flexcom.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/at91.h>
 
 / {
@@ -26,6 +28,43 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_key_gpio_default>;
+
+		button {
+			label = "PB_USER";
+			gpios = <&pioa PIN_PC10 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_PROG1>;
+			wakeup-source;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_led_gpio_default>;
+
+		led0: led-red {
+			color = <LED_COLOR_ID_RED>;
+			gpios = <&pioa PIN_PB17 GPIO_ACTIVE_HIGH>; /* Conflict with pwm. */
+		};
+
+		led1: led-green {
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&pioa PIN_PB15 GPIO_ACTIVE_HIGH>; /* Conflict with pwm. */
+		};
+
+		led2: led-blue {
+			color = <LED_COLOR_ID_BLUE>;
+			function = LED_FUNCTION_HEARTBEAT;
+			gpios = <&pioa PIN_PA21 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+		};
+	};
+
 	memory@60000000 {
 		device_type = "memory";
 		reg = <0x60000000 0x40000000>;
@@ -352,6 +391,18 @@ pinctrl_i2c10_default: i2c10-default {
 		bias-pull-up;
 	};
 
+	pinctrl_key_gpio_default: key-gpio-default {
+		pinmux = <PIN_PC10__GPIO>;
+		bias-pull-up;
+	};
+
+	pinctrl_led_gpio_default: led-gpio-default {
+		pinmux = <PIN_PB15__GPIO>,
+			 <PIN_PB17__GPIO>,
+			 <PIN_PA21__GPIO>;
+		bias-pull-up;
+	};
+
 	pinctrl_sdmmc1_default: sdmmc1-default {
 		cmd-data {
 			pinmux = <PIN_PB22__SDMMC1_CMD>,
-- 
2.43.0


