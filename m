Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7A3E1BE0D
	for <lists+linux-leds@lfdr.de>; Mon, 13 May 2019 21:33:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726769AbfEMTd2 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 13 May 2019 15:33:28 -0400
Received: from hamsrv800.servertools24.de ([213.238.32.28]:41969 "EHLO
        hamsrv800.servertools24.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726709AbfEMTd2 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Mon, 13 May 2019 15:33:28 -0400
Received: from christian-pc.localdomain (p54A59A9B.dip0.t-ipconnect.de [84.165.154.155])
        by hamsrv800.servertools24.de (Postfix) with ESMTPSA id E2BDC23813EC;
        Mon, 13 May 2019 21:33:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-mauderer.de;
        s=default; t=1557776004;
        bh=OyjVHh04pfCo+DbD/d+lv30rOK89OWjhifClJJWvIJg=; l=2677;
        h=From:To:Subject;
        b=MZQmocQnmvTfgtm5SLhYZ/40NnkXXZvydM78gfGiuqAYCwKbJLxM83idJd2Hyn0E6
         EeFH2kuKCIG1pNUZzZDd4n23nNV+gutz2m3/zOz1jnEZR/+vWCdKqknTRyKhKa+4Is
         WyX1akDO8rNtVOYkPNS9nWZuVkqhEHQeouWA+Ynk=
Authentication-Results: hamsrv800.servertools24.de;
        spf=pass (sender IP is 84.165.154.155) smtp.mailfrom=oss@c-mauderer.de smtp.helo=christian-pc.localdomain
Received-SPF: pass (hamsrv800.servertools24.de: connection is authenticated)
From:   oss@c-mauderer.de
To:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Christian Mauderer <oss@c-mauderer.de>
Subject: [PATCH v4 1/2] dt-bindings: leds: Add binding for spi-byte LED.
Date:   Mon, 13 May 2019 21:33:06 +0200
Message-Id: <20190513193307.11591-1-oss@c-mauderer.de>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <155777600428.126815.1465931990581991995@hamsrv800.servertools24.de>
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

Changes compared to v3:
- rename binding to ubnt,acb-spi-led
- rewrite description to fit the new binding
- remove off-value and max-value - now determined depending on the compatible
  string
- add 'default-state'

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

 .../bindings/leds/leds-spi-byte.txt           | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-spi-byte.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-spi-byte.txt b/Documentation/devicetree/bindings/leds/leds-spi-byte.txt
new file mode 100644
index 000000000000..28b6b2d9091e
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-spi-byte.txt
@@ -0,0 +1,44 @@
+* Single Byte SPI LED Device Driver.
+
+The driver can be used for controllers with a very simple SPI protocol:
+- one LED is controlled by a single byte on MOSI
+- the value of the byte gives the brightness between two values (lowest to
+  highest)
+- no return value is necessary (no MISO signal)
+
+The value for lowest and highest brightness is dependent on the device and
+therefore on the compatible string.
+
+Depending on the compatible string some special functions (like hardware
+accelerated blinking) might can be supported too.
+
+The driver currently only supports one LED. The properties of the LED are
+configured in a sub-node in the device node.
+
+Required properties:
+- compatible: should be one of
+   * "ubnt,acb-spi-led"		microcontroller (SONiX 8F26E611LA) based device
+				used for example in Ubiquiti airCube ISP
+
+Property rules described in Documentation/devicetree/bindings/spi/spi-bus.txt
+apply.
+
+LED sub-node properties:
+- label:
+	see Documentation/devicetree/bindings/leds/common.txt
+- default-state:
+	see Documentation/devicetree/bindings/leds/common.txt
+	Only "on" and "off" are supported.
+
+Example:
+
+led-controller@0 {
+	compatible = "ubnt,acb-spi-led";
+	reg = <0>;
+	spi-max-frequency = <100000>;
+
+	led {
+		label = "white:status";
+		default-state = "on";
+	};
+};
-- 
2.21.0

