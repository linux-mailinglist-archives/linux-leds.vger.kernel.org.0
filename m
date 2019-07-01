Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3CB75BF6A
	for <lists+linux-leds@lfdr.de>; Mon,  1 Jul 2019 17:16:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730271AbfGAPPC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 1 Jul 2019 11:15:02 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:36212 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730212AbfGAPOn (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 1 Jul 2019 11:14:43 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x61FEWVw124747;
        Mon, 1 Jul 2019 10:14:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1561994072;
        bh=JcG9gVVC9mwkIN0YqGoNDTpuvdgqaymnMY5JFYhSq/s=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=O4tR6/E3/HWD8H/zU7izLsJxcg7wBVDnGv5aKXwvZEgEKxcY0earzKKrNLQ0j8qaG
         EnaNXgC1P88RzAwuCuo90x+1ROuI1p0Wsm5Egb9tdUgnhJXDh8WCvPGpl2BH4RPxxj
         Rhh1Qr/uCaVK5sTWUnej4DWzQLhmNLpGFATPHpO8=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x61FEW75055584
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 1 Jul 2019 10:14:32 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 1 Jul
 2019 10:14:31 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 1 Jul 2019 10:14:31 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x61FEV8U063793;
        Mon, 1 Jul 2019 10:14:31 -0500
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <lee.jones@linaro.org>,
        <daniel.thompson@linaro.org>, <jingoohan1@gmail.com>
CC:     <dmurphy@ti.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <tomi.valkeinen@ti.com>, Jean-Jacques Hiblot <jjhiblot@ti.com>,
        <devicetree@vger.kernel.org>
Subject: [PATCH 4/4] devicetree: Add led-backlight binding
Date:   Mon, 1 Jul 2019 17:14:23 +0200
Message-ID: <20190701151423.30768-5-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190701151423.30768-1-jjhiblot@ti.com>
References: <20190701151423.30768-1-jjhiblot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Tomi Valkeinen <tomi.valkeinen@ti.com>

Add DT binding for led-backlight.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
Cc: devicetree@vger.kernel.org
---
 .../video/backlight/led-backlight.txt         | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/video/backlight/led-backlight.txt

diff --git a/Documentation/devicetree/bindings/video/backlight/led-backlight.txt b/Documentation/devicetree/bindings/video/backlight/led-backlight.txt
new file mode 100644
index 000000000000..216cd52d624a
--- /dev/null
+++ b/Documentation/devicetree/bindings/video/backlight/led-backlight.txt
@@ -0,0 +1,39 @@
+led-backlight bindings
+
+The node of the backlight driver IS the node of the LED.
+
+Required properties:
+  - compatible: "led-backlight"
+  - brightness-levels: Array of distinct LED brightness levels. These
+      are in the range from 0 to 255, passed to the LED class driver.
+  - default-brightness-level: the default brightness level (index into the
+      array defined by the "brightness-levels" property)
+
+Optional properties:
+  - power-supply: regulator for supply voltage
+  - enable-gpios: contains a single GPIO specifier for the GPIO which enables
+                  and disables the backlight (see GPIO binding[0])
+
+[0]: Documentation/devicetree/bindings/gpio/gpio.txt
+
+Example:
+
+led_ctrl {
+	red_led@1 {
+	        label = "red";
+		reg = <1>;
+	}
+
+	backlight_led@2 {
+		function = LED_FUNCTION_BACKLIGHT;
+		reg = <2>;
+
+		compatible = "led-backlight";
+
+		brightness-levels = <0 4 8 16 32 64 128 255>;
+		default-brightness-level = <6>;
+
+		power-supply = <&vdd_bl_reg>;
+		enable-gpios = <&gpio 58 0>;
+	};
+};
-- 
2.17.1

