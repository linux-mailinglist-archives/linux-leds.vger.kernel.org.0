Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEB4039D02
	for <lists+linux-leds@lfdr.de>; Sat,  8 Jun 2019 13:00:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727131AbfFHLAP (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 8 Jun 2019 07:00:15 -0400
Received: from smtp.220.in.ua ([89.184.67.205]:49460 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726835AbfFHLAP (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 8 Jun 2019 07:00:15 -0400
Received: from oleh-pc.lan (unknown [95.67.115.55])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp.220.in.ua (Postfix) with ESMTPSA id 437661A20425;
        Sat,  8 Jun 2019 14:00:13 +0300 (EEST)
From:   Oleh Kravchenko <oleg@kaa.org.ua>
To:     devicetree@vger.kernel.org, linux-leds@vger.kernel.org
Cc:     Oleh Kravchenko <oleg@kaa.org.ua>
Subject: [PATCH v3 1/2] dt-bindings: Add docs for EL15203000
Date:   Sat,  8 Jun 2019 14:00:03 +0300
Message-Id: <20190608110004.8248-1-oleg@kaa.org.ua>
X-Mailer: git-send-email 2.21.0
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
index 000000000000..64213e3118cb
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-el15203000.txt
@@ -0,0 +1,53 @@
+Crane Merchandising System - el15203000 LED driver
+--------------------------------------------------
+
+This LED Board (aka RED LEDs board) is widely used in coffee vending machines
+produced by Crane Merchandising Systems.
+
+Required properties:
+- compatible : "crane,el15203000"
+- reg :
+	see Documentation/devicetree/bindings/spi/spi-bus.txt
+- spi-max-frequency : (optional)
+	see Documentation/devicetree/bindings/spi/spi-bus.txt
+
+Optional LED sub-node properties:
+- label :
+	see Documentation/devicetree/bindings/leds/common.txt
+- linux,default-trigger :
+	see Documentation/devicetree/bindings/leds/common.txt
+- max-brightness :
+	Specify 2 if LED has special effect. Effects by LED type:
+	- Pipe has leaking
+	- Screen Frame has blinking
+
+Example
+-------
+
+led-controller@0 {
+	compatible = "crane,el15203000";
+	reg = <0>;
+	spi-max-frequency = <50000>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	/* water pipe */
+	pipe@50 {
+		reg = <0x50>;
+		label = "red:pipe";
+		max-brightness = <2>;
+	};
+
+	/* screen frame */
+	screen@53 {
+		reg = <0x53>;
+		label = "red:screen";
+		max-brightness = <2>;
+	};
+
+	/* vending area */
+	vend@56 {
+		reg = <0x56>;
+		label = "red:vend";
+	};
+};
-- 
2.21.0

