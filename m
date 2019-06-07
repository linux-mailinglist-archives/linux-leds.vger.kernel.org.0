Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76C463896E
	for <lists+linux-leds@lfdr.de>; Fri,  7 Jun 2019 13:55:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728736AbfFGLzB (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 7 Jun 2019 07:55:01 -0400
Received: from smtp.220.in.ua ([89.184.67.205]:39053 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727047AbfFGLzB (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 7 Jun 2019 07:55:01 -0400
X-Greylist: delayed 374 seconds by postgrey-1.27 at vger.kernel.org; Fri, 07 Jun 2019 07:55:01 EDT
Received: from oleh-pc.lan (unknown [95.67.115.55])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp.220.in.ua (Postfix) with ESMTPSA id 797FA1A20B8E;
        Fri,  7 Jun 2019 14:48:46 +0300 (EEST)
From:   Oleh Kravchenko <oleg@kaa.org.ua>
To:     devicetree@vger.kernel.org, linux-leds@vger.kernel.org
Cc:     Oleh Kravchenko <oleg@kaa.org.ua>
Subject: [PATCH 1/2] dt-bindings: Add vendor prefix and docs for EL15203000
Date:   Fri,  7 Jun 2019 14:48:22 +0300
Message-Id: <20190607114823.3735-1-oleg@kaa.org.ua>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add documentation and example for dt-bindings EL15203000.

Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
---
 .../bindings/leds/leds-el15203000.txt         | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-el15203000.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-el15203000.txt b/Documentation/devicetree/bindings/leds/leds-el15203000.txt
new file mode 100644
index 000000000000..f47ee91cb419
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-el15203000.txt
@@ -0,0 +1,48 @@
+Crane Merchandising System - el15203000 LED driver
+--------------------------------------------------
+
+This LED Board (aka RED LEDs board) is widely used in coffee vending machines
+produced by Crane Merchandising Systems.
+
+Required properties:
+- compatible: "crane,el15203000"
+
+Property rules described in Documentation/devicetree/bindings/spi/spi-bus.txt
+apply. In particular, "reg" and "spi-max-frequency" properties must be given.
+
+LED sub-node properties:
+- label :
+	see Documentation/devicetree/bindings/leds/common.txt
+- linux,default-trigger : (optional)
+	see Documentation/devicetree/bindings/leds/common.txt
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

