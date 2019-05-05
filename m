Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98FD61422F
	for <lists+linux-leds@lfdr.de>; Sun,  5 May 2019 22:00:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727232AbfEEUAt (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 5 May 2019 16:00:49 -0400
Received: from hamsrv800.servertools24.de ([213.238.32.28]:51719 "EHLO
        hamsrv800.servertools24.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726636AbfEEUAt (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 5 May 2019 16:00:49 -0400
Received: from christian-pc.localdomain (p54A59A9B.dip0.t-ipconnect.de [84.165.154.155])
        by hamsrv800.servertools24.de (Postfix) with ESMTPSA id C36082382AB2;
        Sun,  5 May 2019 22:00:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-mauderer.de;
        s=default; t=1557086445;
        bh=hoHVjb7jMiB88CXZsoGR/dggti0Uxqd/YdYEBmyriQk=; l=2990;
        h=From:To:Subject;
        b=c9ZRggkrCwZgTGU4Jxly18iVmDqdmlYtlnw8n3zxUHyCXZmOGutOw969Fer3Ehg6L
         SGzchdDJlISipuxokXU2HpWwl5bmyAnE1eDcDSYYlkUVn1VNfnqoMmHLbp4IFVhfea
         aC7vUtSdHvEPzqVfTgDAeUlacDlS7Iy2Fmd4GsbM=
Authentication-Results: hamsrv800.servertools24.de;
        spf=pass (sender IP is 84.165.154.155) smtp.mailfrom=oss@c-mauderer.de smtp.helo=christian-pc.localdomain
Received-SPF: pass (hamsrv800.servertools24.de: connection is authenticated)
From:   oss@c-mauderer.de
To:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>
Cc:     Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Christian Mauderer <oss@c-mauderer.de>
Subject: [PATCH v3 1/2] dt-bindings: leds: Add binding for spi-byte LED.
Date:   Sun,  5 May 2019 22:00:21 +0200
Message-Id: <20190505200022.32209-1-oss@c-mauderer.de>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <155708644539.6832.12400246364427279861@hamsrv800.servertools24.de>
X-PPP-Vhost: c-mauderer.de
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Christian Mauderer <oss@c-mauderer.de>

This patch adds the binding documentation for a simple SPI based LED
controller which use only one byte for setting the brightness.

Signed-off-by: Christian Mauderer <oss@c-mauderer.de>
---

Changes compared to v2:
- None

Changes compared to v1:
- rename ubnt-spi to leds-spi-byte
- rename "ubnt-spi,off_bright" and "ubnt-spi,max_bright" to
  "leds-spi-byte,off-value" and "leds-spi-byte,max-value" and mark them required
- rename led-controller node to "led-controller"
- extend description
- remove SPI controller
- use "white:status" for the example label


 .../bindings/leds/leds-spi-byte.txt           | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-spi-byte.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-spi-byte.txt b/Documentation/devicetree/bindings/leds/leds-spi-byte.txt
new file mode 100644
index 000000000000..1dd6ab03a56d
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-spi-byte.txt
@@ -0,0 +1,47 @@
+* Single Byte SPI LED Device Driver.
+
+The driver can be used for controllers with a very simple SPI protocol: Only one
+byte will be sent. The value of the byte can be any value between the off-value
+and max-value defined in the properties.
+
+One example where the driver can be used is the controller in Ubiquiti airCube
+ISP devices. That LED controller is based on a 8 bit microcontroller (SONiX
+8F26E611LA) that has been programmed to control the single LED of the device.
+The controller supports four modes depending on the highest two bits in a byte:
+One setting for brightness, the other three provide different blink patterns.
+With the leds-spi-byte driver a basic support for the brightness mode of that
+controller can be easily achieved by setting the minimum and maximum to the
+brightness modes minimum and maximum byte value.
+
+Required properties:
+- compatible:		Should be "leds-spi-byte".
+
+Property rules described in Documentation/devicetree/bindings/spi/spi-bus.txt
+apply. In particular, "reg" and "spi-max-frequency" properties must be given.
+
+The driver currently only supports one LED. The properties of the LED are
+configured in a sub-node in the device node.
+
+LED sub-node properties:
+- label:
+	see Documentation/devicetree/bindings/leds/common.txt
+- leds-spi-byte,off-value:
+	The SPI byte value that should be sent to switch the LED off. Has to be
+	smaller than max-value. Range: 0 to 254.
+- leds-spi-byte,max-value:
+	The SPI byte value that should be sent to set the LED to the maximum
+	brightness. Has to be bigger than off-value. Range: 1 to 255.
+
+Example:
+
+led-controller@0 {
+	compatible = "leds-spi-byte";
+	reg = <0>;
+	spi-max-frequency = <100000>;
+
+	led {
+		label = "white:status";
+		leds-spi-byte,off-value = /bits/ 8 <0>;
+		leds-spi-byte,max-value = /bits/ 8 <63>;
+	};
+};
-- 
2.21.0

