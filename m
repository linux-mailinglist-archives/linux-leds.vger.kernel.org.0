Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 944FDAD382
	for <lists+linux-leds@lfdr.de>; Mon,  9 Sep 2019 09:16:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727307AbfIIHQo (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 9 Sep 2019 03:16:44 -0400
Received: from smtp.220.in.ua ([89.184.67.205]:45537 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727546AbfIIHQn (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 9 Sep 2019 03:16:43 -0400
Received: from oleh-pc.lan (unknown [95.67.115.55])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp.220.in.ua (Postfix) with ESMTPSA id 473341A244A5;
        Mon,  9 Sep 2019 10:16:41 +0300 (EEST)
From:   Oleh Kravchenko <oleg@kaa.org.ua>
To:     devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc:     Oleh Kravchenko <oleg@kaa.org.ua>, Rob Herring <robh@kernel.org>
Subject: [PATCH v7 1/2] dt-bindings: Add docs for EL15203000
Date:   Mon,  9 Sep 2019 10:16:31 +0300
Message-Id: <20190909071632.14392-2-oleg@kaa.org.ua>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190909071632.14392-1-oleg@kaa.org.ua>
References: <20190909071632.14392-1-oleg@kaa.org.ua>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add documentation and example for dt-bindings EL15203000.
LED board (aka RED LED board) from Crane Merchandising Systems.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
---
 .../bindings/leds/leds-el15203000.txt         | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-el15203000.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-el15203000.txt b/Documentation/devicetree/bindings/leds/leds-el15203000.txt
new file mode 100644
index 000000000000..c00e1b55db97
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-el15203000.txt
@@ -0,0 +1,54 @@
+Crane Merchandising System - el15203000 LED driver
+--------------------------------------------------
+
+This LED Board (aka RED LEDs board) is widely used in
+coffee vending machines produced by Crane Merchandising Systems.
+
+Required properties:
+- compatible : "crane,el15203000"
+- reg :
+	see Documentation/devicetree/bindings/spi/spi-bus.txt
+- spi-max-frequency : (optional)
+	see Documentation/devicetree/bindings/spi/spi-bus.txt
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

