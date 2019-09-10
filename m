Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C857AE8C8
	for <lists+linux-leds@lfdr.de>; Tue, 10 Sep 2019 13:01:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392792AbfIJLAO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 10 Sep 2019 07:00:14 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:55964 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729647AbfIJLAC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 10 Sep 2019 07:00:02 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8AAxuVP071833;
        Tue, 10 Sep 2019 05:59:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568113196;
        bh=J37WOYhcIEKzEnO3t8q5TtofJfu6T7iSB8tR2Bkh500=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=czbPDEr+OvH3hBFdUOyqld4eLuWL7baiMvvSfQAf9VV7NMerjSdQET1+1LdEKc6j4
         fcKc9FR1xdet90ONeTo9s0LWV9uGYXe7CVOvWvaDG+TBLTQYg90R/hk5HJLayFzIF0
         dWwj1o/uJ2TOdtCh9B48pjMuHo08U2llzAXfXkjQ=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8AAxuKf034417;
        Tue, 10 Sep 2019 05:59:56 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 10
 Sep 2019 05:59:55 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 10 Sep 2019 05:59:55 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8AAxs7N018253;
        Tue, 10 Sep 2019 05:59:55 -0500
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <lee.jones@linaro.org>,
        <daniel.thompson@linaro.org>
CC:     <dmurphy@ti.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <dridevel@lists.freedesktop.org>,
        <tomi.valkeinen@ti.com>, Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: [PATCH v5 3/4] dt-bindings: backlight: Add led-backlight binding
Date:   Tue, 10 Sep 2019 12:59:45 +0200
Message-ID: <20190910105946.23057-4-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190910105946.23057-1-jjhiblot@ti.com>
References: <20190910105946.23057-1-jjhiblot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add DT binding for led-backlight.

Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
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

