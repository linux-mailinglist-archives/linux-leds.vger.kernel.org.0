Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14C26B61DD
	for <lists+linux-leds@lfdr.de>; Wed, 18 Sep 2019 12:53:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727302AbfIRKxA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 18 Sep 2019 06:53:00 -0400
Received: from smtp.220.in.ua ([89.184.67.205]:50806 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727254AbfIRKxA (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 18 Sep 2019 06:53:00 -0400
Received: from oleh-pc.lan (unknown [95.67.115.55])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp.220.in.ua (Postfix) with ESMTPSA id 2FA4A1A2442C;
        Wed, 18 Sep 2019 13:52:57 +0300 (EEST)
From:   Oleh Kravchenko <oleg@kaa.org.ua>
To:     devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc:     Oleh Kravchenko <oleg@kaa.org.ua>
Subject: [PATCH v9 1/2] dt-bindings: Add docs for EL15203000
Date:   Wed, 18 Sep 2019 13:52:49 +0300
Message-Id: <20190918105250.22855-2-oleg@kaa.org.ua>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190918105250.22855-1-oleg@kaa.org.ua>
References: <20190918105250.22855-1-oleg@kaa.org.ua>
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
 .../bindings/leds/leds-el15203000.txt         | 147 ++++++++++++++++++
 1 file changed, 147 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-el15203000.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-el15203000.txt b/Documentation/devicetree/bindings/leds/leds-el15203000.txt
new file mode 100644
index 000000000000..4a9b29cc9f46
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-el15203000.txt
@@ -0,0 +1,147 @@
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
+encoded with symbol 'S' (hex code 0x53). Supports blinking breathing pattern:
+
+    ^
+    |
+Max >_____***___________**
+    |    *   *         *
+    |   *     *       *
+    |  *       *     *
+    | *         *   *
+Min >*___________***______
+    |
+    +------^------^------> time (sec)
+    0      4      8
+
+
+Water Pipe LED actually consists from 5 LEDs
+that exposed by protocol like one LED. Supports next patterns:
+
+- cascade pattern
+
+     ^
+     |
+LED0 >*****____________________*****____________________*****
+     |
+LED1 >_____*****____________________*****____________________
+     |
+LED2 >__________*****____________________*****_______________
+     |
+LED3 >_______________*****____________________*****__________
+     |
+LED4 >____________________*****____________________*****_____
+     |
+     +----^----^----^----^----^----^----^----^----^----^----> time (sec)
+     0   0.8  1.6  2.4  3.2   4   4.8  5.6  6.4  7.2   8
+
+- inversed cascade pattern
+
+     ^
+     |
+LED0 >_____********************_____********************_____
+     |
+LED1 >*****_____********************_____********************
+     |
+LED2 >**********_____********************_____***************
+     |
+LED3 >***************_____********************_____**********
+     |
+LED4 >********************_____********************_____*****
+     |
+     +----^----^----^----^----^----^----^----^----^----^----> time (sec)
+     0   0.8  1.6  2.4  3.2   4   4.8  5.6  6.4  7.2   8
+
+- bounce pattern
+
+     ^
+     |
+LED0 >*****________________________________________*****_____
+     |
+LED1 >_____*****______________________________*****_____*****
+     |
+LED2 >__________*****____________________*****_______________
+     |
+LED3 >_______________*****__________*****____________________
+     |
+LED4 >____________________**********_________________________
+     |
+     +----^----^----^----^----^----^----^----^----^----^----> time (sec)
+     0   0.8  1.6  2.4  3.2   4   4.8  5.6  6.4  7.2   8
+
+- inversed bounce pattern
+
+     ^
+     |
+LED0 >_____****************************************_____*****
+     |
+LED1 >*****_____******************************_____*****_____
+     |
+LED2 >**********_____********************_____***************
+     |
+LED3 >***************_____**********_____********************
+     |
+LED4 >********************__________*************************
+     |
+     +----^----^----^----^----^----^----^----^----^----^----> time (sec)
+     0   0.8  1.6  2.4  3.2   4   4.8  5.6  6.4  7.2   8
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
+- label:
+	see Documentation/devicetree/bindings/leds/common.txt (deprecated)
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

