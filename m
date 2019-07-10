Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E776364666
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jul 2019 14:40:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727465AbfGJMj4 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 10 Jul 2019 08:39:56 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:53308 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726458AbfGJMjt (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 10 Jul 2019 08:39:49 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6ACdfWG104822;
        Wed, 10 Jul 2019 07:39:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1562762381;
        bh=Pk7hnsVKcJGKKe6elo6dBDjGU2lxh03iSzrLZOy1kgU=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=VNrBWkNPOCnHiOPV7FKvFAJC3hRSnSsiiBRZKutIoS9cvXgXbbdi+cpRSKvrTGlq+
         r9yYUT52z8IQN2pNlG3DlEWOAvxxJqo8QqciUqw6A8rrqL2f5ym+GArIwA8oyB9jof
         akzodC8O4/4uNgf2yaVG50nOgb/d+v0bVr/JyGas=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6ACdf9l113538
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 10 Jul 2019 07:39:41 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 10
 Jul 2019 07:39:41 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 10 Jul 2019 07:39:41 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6ACdeT5113704;
        Wed, 10 Jul 2019 07:39:41 -0500
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <lee.jones@linaro.org>,
        <daniel.thompson@linaro.org>, <jingoohan1@gmail.com>
CC:     <dmurphy@ti.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <tomi.valkeinen@ti.com>, Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: [PATCH v3 3/4] dt-bindings: backlight: Add led-backlight binding
Date:   Wed, 10 Jul 2019 14:39:31 +0200
Message-ID: <20190710123932.28244-4-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190710123932.28244-1-jjhiblot@ti.com>
References: <20190710123932.28244-1-jjhiblot@ti.com>
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
index 000000000000..0444eec8efe1
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
+                       into a LED brightness level. if not provided, the
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

