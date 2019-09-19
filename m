Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF9D0B79D3
	for <lists+linux-leds@lfdr.de>; Thu, 19 Sep 2019 14:53:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390415AbfISMxW (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 19 Sep 2019 08:53:22 -0400
Received: from smtp.220.in.ua ([89.184.67.205]:48136 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390416AbfISMxW (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 19 Sep 2019 08:53:22 -0400
Received: from oleh-pc.lan (unknown [95.67.115.55])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp.220.in.ua (Postfix) with ESMTPSA id 6EAE11A2442C;
        Thu, 19 Sep 2019 15:53:19 +0300 (EEST)
From:   Oleh Kravchenko <oleg@kaa.org.ua>
To:     devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com
Cc:     Oleh Kravchenko <oleg@kaa.org.ua>
Subject: [PATCH v11 1/2] dt-bindings: Add docs for EL15203000
Date:   Thu, 19 Sep 2019 15:53:12 +0300
Message-Id: <20190919125313.24081-2-oleg@kaa.org.ua>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190919125313.24081-1-oleg@kaa.org.ua>
References: <20190919125313.24081-1-oleg@kaa.org.ua>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add documentation and example for dt-bindings EL15203000.
LED board (aka RED LED board) from Crane Merchandising Systems.

Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
---
 .../bindings/leds/leds-el15203000.txt         | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-el15203000.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-el15203000.txt b/Documentation/devicetree/bindings/leds/leds-el15203000.txt
new file mode 100644
index 000000000000..1bcd341967f8
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-el15203000.txt
@@ -0,0 +1,69 @@
+Crane Merchandising System - EL15203000 LED driver
+--------------------------------------------------
+
+This LED Board (aka RED LEDs board) is widely used in
+coffee vending machines produced by Crane Merchandising Systems.
+The board manages 3 LEDs and supports predefined blinking patterns
+for specific leds.
+
+Vending area LED encoded with symbol 'V' (hex code 0x56).
+Doesn't have any hardware blinking pattern.
+
+Screen light tube LED which surrounds vending machine screen and
+encoded with symbol 'S' (hex code 0x53). Supports blinking breathing pattern.
+
+Water Pipe LED encoded with symbol 'P' (hex code 0x50) and
+actually consists from 5 LEDs that exposed by protocol like one LED.
+Supports next patterns:
+- cascade pattern
+- inversed cascade pattern
+- bounce pattern
+- inversed bounce pattern
+
+Required properties:
+- compatible : "crane,el15203000"
+- #address-cells : must be 1
+- #size-cells : must be 0
+
+Property rules described in Documentation/devicetree/bindings/spi/spi-bus.txt
+apply. In particular, "reg" and "spi-max-frequency" properties must be given.
+
+Optional LED sub-node properties:
+- function:
+	see Documentation/devicetree/bindings/leds/common.txt
+- color:
+	see Documentation/devicetree/bindings/leds/common.txt
+
+Example
+-------
+
+#include <dt-bindings/leds/common.h>
+
+led-controller@0 {
+	compatible = "crane,el15203000";
+	reg = <0>;
+	spi-max-frequency = <50000>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	/* water pipe */
+	led@50 {
+		reg = <0x50>;
+		function = "pipe";
+		color = <LED_COLOR_ID_RED>;
+	};
+
+	/* screen frame */
+	led@53 {
+		reg = <0x53>;
+		function = "screen";
+		color = <LED_COLOR_ID_RED>;
+	};
+
+	/* vending area */
+	led@56 {
+		reg = <0x56>;
+		function = "vend";
+		color = <LED_COLOR_ID_RED>;
+	};
+};
-- 
2.21.0

