Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37949139D4
	for <lists+linux-leds@lfdr.de>; Sat,  4 May 2019 14:37:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726944AbfEDMhN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 4 May 2019 08:37:13 -0400
Received: from hamsrv800.servertools24.de ([213.238.32.28]:46923 "EHLO
        hamsrv800.servertools24.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726694AbfEDMhN (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 4 May 2019 08:37:13 -0400
X-Greylist: delayed 485 seconds by postgrey-1.27 at vger.kernel.org; Sat, 04 May 2019 08:37:11 EDT
Received: from christian-pc.localdomain (p54A59A9B.dip0.t-ipconnect.de [84.165.154.155])
        by hamsrv800.servertools24.de (Postfix) with ESMTPSA id 6D2DC2382B7B;
        Sat,  4 May 2019 14:29:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-mauderer.de;
        s=default; t=1556972945;
        bh=HLLBJwzV2pGt8lnuFwJSi/sRGwJWRHH+ce3ZMNvAZhU=; l=2992;
        h=From:To:Subject;
        b=nIR0kJV2Eb+NDA9mrkcxBkYXa/OUqqmIvpkvfo96/Mi63Pb7nQCgGIBqWzbW5yYxV
         HETKMTufs2LBJkxjO7Xuf509c3IhFpAdpOKrnL3WXM3A8SHnqvJfwdRkRnxqGrLXZO
         xbS2XL+c8qZWdkr6dFS53o5Sypn5MIx9yxmCcfFc=
Authentication-Results: hamsrv800.servertools24.de;
        spf=pass (sender IP is 84.165.154.155) smtp.mailfrom=list@c-mauderer.de smtp.helo=christian-pc.localdomain
Received-SPF: pass (hamsrv800.servertools24.de: connection is authenticated)
From:   list@c-mauderer.de
To:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Christian Mauderer <oss@c-mauderer.de>
Subject: [PATCH 1/2] dt-bindings: leds: Add binding for ubnt-spi LED.
Date:   Sat,  4 May 2019 14:28:24 +0200
Message-Id: <20190504122825.11883-1-list@c-mauderer.de>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <155697294482.85380.6896766246519651555@hamsrv800.servertools24.de>
X-PPP-Vhost: c-mauderer.de
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Christian Mauderer <oss@c-mauderer.de>

This patch adds the binding documentation for the LED controller found
in Ubiquity airCube ISP devices.

Signed-off-by: Christian Mauderer <oss@c-mauderer.de>
---

I tested the patches with a 4.14 and a 4.19 kernel on the current OpenWRT.
Although I didn't get the kernel running due to file system problems they build
fine with a 5.1-rc7.

I shortly described the protocol of the controller in a comment in the driver
file in the second patch.

Checkpatch gives the following warning for both patches:

  WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

To be honest: I don't know what to do with it. Please excuse my ignorance here.
It's the first driver that I want to add to the Linux kernel.

Please point me to some documentation if I did miss some big points for
submitting patches.


 .../bindings/leds/leds-ubnt-spi.txt           | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-ubnt-spi.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-ubnt-spi.txt b/Documentation/devicetree/bindings/leds/leds-ubnt-spi.txt
new file mode 100644
index 000000000000..ab1478cdc139
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-ubnt-spi.txt
@@ -0,0 +1,49 @@
+Binding for the controller based LED found in Ubiquity airCube ISP and most
+likely some other Ubiquity devices.
+
+The protocol of the controller is quite simple. Only one byte will be sent. The
+value of the byte can be between the ubnt-spi,off_bright value and the
+ubnt-spi,max_bright value.
+
+The driver maybe can be used for other devices with a similar protocol too.
+
+Required properties:
+- compatible:		Should be "ubnt,spi-led".
+- spi-max-frequency:	Should be <100000> for this device.
+
+Optional sub-node properties:
+- ubnt-spi,off_bright:	The value that will be sent if the LED should be
+			switched off. Default value is 0.
+- ubnt-spi,max_bright:	Value for the maximum brightness. Default value for that
+			is 63.
+- label:		A label for the LED. If one is given, the LED will be
+			named "ubnt-spi:<label>" or "ubnt-spi::" otherwise.
+
+Being a SPI device this driver should be a sub-node of a SPI controller. The
+controller only supports one LED. For consistence with other controllers, the
+LED is defined as a sub-node.
+
+Example for the airCube ISP (with SPI controller matching that device):
+
+led_spi {
+	compatible = "spi-gpio";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	gpio-sck = <&gpio 3 GPIO_ACTIVE_HIGH>;
+	gpio-mosi = <&gpio 2 GPIO_ACTIVE_HIGH>;
+	cs-gpios = <&gpio 1 GPIO_ACTIVE_HIGH>;
+	num-chipselects = <1>;
+
+	led_ubnt@0 {
+		compatible = "ubnt,spi-led";
+		reg = <0>;
+		spi-max-frequency = <100000>;
+
+		led {
+			label = "system";
+			/* keep the LED slightly on to show powered device */
+			ubnt-spi,off_bright = /bits/ 8 <4>;
+		};
+	};
+};
-- 
2.21.0

