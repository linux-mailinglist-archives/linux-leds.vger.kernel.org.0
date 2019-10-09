Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADAC0D0A47
	for <lists+linux-leds@lfdr.de>; Wed,  9 Oct 2019 10:52:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730495AbfJIIwU (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 9 Oct 2019 04:52:20 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:43738 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730212AbfJIIwM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 9 Oct 2019 04:52:12 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x998q4H2035244;
        Wed, 9 Oct 2019 03:52:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570611125;
        bh=s5d/szql8fU2uDVYRw2K7PeI4Cnl3Z9+5CQzwG1wYJU=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=usk5TxWfAR6ogFjaJI14GXUZfVYQq2jWISyTbJW95JeDsUsk/EqlSVxie8frZ3npV
         AVZzuMjtOZqj2bNAlKKcAbR5Nme/YxHYxuCP1AwEo0OSEihMKsqNTAmZi/iUoyGOeV
         /Yww1zCQ+FyLtOkBesUAmpSnCFBLe/GGiT/8HpUw=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x998q43U023525
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 9 Oct 2019 03:52:04 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 9 Oct
 2019 03:52:01 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 9 Oct 2019 03:52:04 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x998q3SO099447;
        Wed, 9 Oct 2019 03:52:04 -0500
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <sre@kernel.org>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <lee.jones@linaro.org>, <daniel.thompson@linaro.org>
CC:     <dmurphy@ti.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <tomi.valkeinen@ti.com>, Jean-Jacques Hiblot <jjhiblot@ti.com>,
        <devicetree@vger.kernel.org>
Subject: [PATCH v10 5/6] dt-bindings: backlight: Add led-backlight binding
Date:   Wed, 9 Oct 2019 10:51:26 +0200
Message-ID: <20191009085127.22843-6-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191009085127.22843-1-jjhiblot@ti.com>
References: <20191009085127.22843-1-jjhiblot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add DT binding for led-backlight.

Cc: devicetree@vger.kernel.org
Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>

---

.../leds/backlight/led-backlight.yaml         | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/led-backlight.yaml

diff --git a/Documentation/devicetree/bindings/leds/backlight/led-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/led-backlight.yaml
new file mode 100644
index 000000000000..47ae3d6b4f31
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/led-backlight.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/backlight/led-backlight.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LED-based Backlight Device Tree Bindings
+
+maintainers:
+  - Jean-Jacques Hiblot <jjhiblot@ti.com>
+
+description: |
+  This binding is used to describe a basic backlight device made of LEDs.
+  It can also be used to describe a backlight device controlled by the
+  output of a LED driver.
+
+properties:
+  compatible:
+    const: led-backlight
+
+  leds:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: List of LEDs constitutive of the backlight.
+
+  default-brightness:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Default brightness level on boot.
+    minimum: 0
+
+  brightness-levels:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: Array of distinct brightness levels. The levels must be in
+      the range accepted by the underlying LED devices. This is used to
+      translate a backlight brightness level into a LED brightness level. If
+      it is not provided, the identity mapping is used.
+
+required:
+  - compatible
+  - backlight-leds
+
+examples:
+  - |
+    backlight {
+      compatible = "led-backlight";
+      backlight-leds = <&led1>;
+      brightness-levels = <0 4 8 16 32 64 128 255>;
+      default-brightness = <6>; /*6th level => brightness of the LEDs is 128*/
+    };
+  - |
+    backlight {
+      compatible = "led-backlight";
+      backlight-leds = <&led1>, <&led2>;
+      default-brightness = <255>;
+    };
+...
-- 
2.17.1

