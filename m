Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5EEE861CED
	for <lists+linux-leds@lfdr.de>; Mon,  8 Jul 2019 12:27:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730085AbfGHK12 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 8 Jul 2019 06:27:28 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:36304 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730078AbfGHK1T (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 8 Jul 2019 06:27:19 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x68ARBXf118524;
        Mon, 8 Jul 2019 05:27:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1562581631;
        bh=lMpw70wzgXRddxylMnjFZez3adtd5wWViru0eP3oWv4=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Vkl7NJT5viByd33Timp5MUb/aoNybG7DPggyp1yNvT4OHO9UMX62sG+CZrQ7h62nb
         plgpHRlqe6ybCKfosDiyeGvVhsFh6ilVM74XTK/TzivuxxcbGejud4gexYWOpIYZb/
         CYTvIRUE6WGgjXum6IrR9PWm2Gk0yQ5DKkfdx5vM=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x68ARBHV009832
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 8 Jul 2019 05:27:11 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 8 Jul
 2019 05:27:10 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 8 Jul 2019 05:27:11 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x68ARAvE027118;
        Mon, 8 Jul 2019 05:27:10 -0500
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <lee.jones@linaro.org>,
        <daniel.thompson@linaro.org>, <jingoohan1@gmail.com>
CC:     <dmurphy@ti.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <tomi.valkeinen@ti.com>, Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: [PATCH v2 3/4] dt-bindings: backlight: Add led-backlight binding
Date:   Mon, 8 Jul 2019 12:26:59 +0200
Message-ID: <20190708102700.23138-4-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190708102700.23138-1-jjhiblot@ti.com>
References: <20190708102700.23138-1-jjhiblot@ti.com>
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
 .../bindings/leds/backlight/led-backlight.txt | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/led-backlight.txt

diff --git a/Documentation/devicetree/bindings/leds/backlight/led-backlight.txt b/Documentation/devicetree/bindings/leds/backlight/led-backlight.txt
new file mode 100644
index 000000000000..4f545316b288
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/led-backlight.txt
@@ -0,0 +1,29 @@
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
+  - brightness-levels: Array of distinct brightness levels. These
+                       are in the range from 0 to 255. The actual brightness
+                       level programmed in each LED will be adjusted based on
+                       its maximum brightness:
+                       led brightness = (level * maximum brightness) / 255
+
+  - default-brightness-level: The default brightness level (index into the
+                              array defined by the "brightness-levels" property).
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

