Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF2C9B6699
	for <lists+linux-leds@lfdr.de>; Wed, 18 Sep 2019 16:58:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731561AbfIRO57 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 18 Sep 2019 10:57:59 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:35620 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731432AbfIRO5x (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 18 Sep 2019 10:57:53 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8IEvjaS084997;
        Wed, 18 Sep 2019 09:57:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568818665;
        bh=dPDBk1Y3qicoCPHxrSR9zQwbWp6dV0NX8yJNHPPSaTk=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=jF9IBC8Q9o1A3hSfq3yilZ2O8StfCgeOtcmZCJTnikFZyX2lZ6fzzX9ZvJxHN+TWa
         oDivgEzb1qSLf+g1nAamLeRx94Ygy3hJYRE+bCT8ccHzAXst3Fpd+Ls8UXGFxWcmlC
         56SCUKI0JWly/o1ek0ovBVc14XCbw+JiEoyXl5lw=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8IEvj0h122465
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 18 Sep 2019 09:57:45 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 18
 Sep 2019 09:57:45 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 18 Sep 2019 09:57:45 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8IEvi1r040639;
        Wed, 18 Sep 2019 09:57:45 -0500
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <lee.jones@linaro.org>,
        <daniel.thompson@linaro.org>
CC:     <dmurphy@ti.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <tomi.valkeinen@ti.com>, <jjhiblot@ti.com>
Subject: [PATCH v7 4/5] dt-bindings: backlight: Add led-backlight binding
Date:   Wed, 18 Sep 2019 16:57:29 +0200
Message-ID: <20190918145730.22805-5-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190918145730.22805-1-jjhiblot@ti.com>
References: <20190918145730.22805-1-jjhiblot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add DT binding for led-backlight.

Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 .../bindings/leds/backlight/led-backlight.txt | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/led-backlight.txt

diff --git a/Documentation/devicetree/bindings/leds/backlight/led-backlight.txt b/Documentation/devicetree/bindings/leds/backlight/led-backlight.txt
new file mode 100644
index 000000000000..4c7dfbe7f67a
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/led-backlight.txt
@@ -0,0 +1,28 @@
+led-backlight bindings
+
+This binding is used to describe a basic backlight device made of LEDs.
+It can also be used to describe a backlight device controlled by the output of
+a LED driver.
+
+Required properties:
+  - compatible: "led-backlight"
+  - leds: a list of LEDs
+
+Optional properties:
+  - brightness-levels: Array of distinct brightness levels. The levels must be
+                       in the range accepted by the underlying LED devices.
+                       This is used to translate a backlight brightness level
+                       into a LED brightness level. If it is not provided, the
+                       identity mapping is used.
+
+  - default-brightness-level: The default brightness level.
+
+Example:
+
+	backlight {
+		compatible = "led-backlight";
+
+		leds = <&led1>, <&led2>;
+		brightness-levels = <0 4 8 16 32 64 128 255>;
+		default-brightness-level = <6>;
+	};
-- 
2.17.1

