Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC003AEB85
	for <lists+linux-leds@lfdr.de>; Tue, 10 Sep 2019 15:27:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728759AbfIJN1t (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 10 Sep 2019 09:27:49 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:44064 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727415AbfIJN1t (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 10 Sep 2019 09:27:49 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8ADReoX064322;
        Tue, 10 Sep 2019 08:27:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568122060;
        bh=dPDBk1Y3qicoCPHxrSR9zQwbWp6dV0NX8yJNHPPSaTk=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=HFSKDpJZsrgErm+SiJniWJ9hkZyx8iNVJFYntrvcxxxz3St1cikRZUfcqDqbC17hB
         b5keikBLxKQIzHH0OEfVR9dVZajSJR7P6KNffhctYLs41P/YXpNr3cXHZGM/RRqKt6
         v21sbMFWdLkW2FDN3K6Q7sYzpAyjYVOtyVlc0lIQ=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8ADReQ7002583
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 10 Sep 2019 08:27:40 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 10
 Sep 2019 08:27:40 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 10 Sep 2019 08:27:40 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8ADRdMO013315;
        Tue, 10 Sep 2019 08:27:39 -0500
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <lee.jones@linaro.org>,
        <daniel.thompson@linaro.org>
CC:     <dmurphy@ti.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <tomi.valkeinen@ti.com>, Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: [PATCH v6 3/4] dt-bindings: backlight: Add led-backlight binding
Date:   Tue, 10 Sep 2019 15:27:33 +0200
Message-ID: <20190910132734.9544-4-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190910132734.9544-1-jjhiblot@ti.com>
References: <20190910132734.9544-1-jjhiblot@ti.com>
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

