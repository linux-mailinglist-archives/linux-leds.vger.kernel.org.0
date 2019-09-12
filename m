Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D52E1B162C
	for <lists+linux-leds@lfdr.de>; Fri, 13 Sep 2019 00:11:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727204AbfILWL1 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 12 Sep 2019 18:11:27 -0400
Received: from smtp.220.in.ua ([89.184.67.205]:57440 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727069AbfILWL1 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 12 Sep 2019 18:11:27 -0400
Received: from oleh-pc.lan (unknown [95.67.115.55])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp.220.in.ua (Postfix) with ESMTPSA id 5DB231A2444F;
        Fri, 13 Sep 2019 01:11:22 +0300 (EEST)
From:   Oleh Kravchenko <oleg@kaa.org.ua>
To:     devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc:     Oleh Kravchenko <oleg@kaa.org.ua>
Subject: [PATCH v8 1/2] dt-bindings: Add docs for EL15203000
Date:   Fri, 13 Sep 2019 01:11:14 +0300
Message-Id: <20190912221115.23595-2-oleg@kaa.org.ua>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190912221115.23595-1-oleg@kaa.org.ua>
References: <20190912221115.23595-1-oleg@kaa.org.ua>
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
 .../bindings/leds/leds-el15203000.txt         | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-el15203000.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-el15203000.txt b/Documentation/devicetree/bindings/leds/leds-el15203000.txt
new file mode 100644
index 000000000000..d74b492d28b2
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-el15203000.txt
@@ -0,0 +1,53 @@
+Crane Merchandising System - el15203000 LED driver
+--------------------------------------------------
+
+This LED Board (aka RED LEDs board) is widely used in
+coffee vending machines produced by Crane Merchandising Systems.
+
+Required properties:
+- compatible : "crane,el15203000"
+
+Property rules described in
+Documentation/devicetree/bindings/spi/spi-controller.yaml is apply.
+In particular, "reg" and "spi-max-frequency" properties must be given.
+50KHz is very well tested value for spi-max-frequency.
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

