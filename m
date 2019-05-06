Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E210215441
	for <lists+linux-leds@lfdr.de>; Mon,  6 May 2019 21:16:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726564AbfEFTQ1 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 6 May 2019 15:16:27 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:45156 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726560AbfEFTQ0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 6 May 2019 15:16:26 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x46JG9sb023385;
        Mon, 6 May 2019 14:16:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1557170169;
        bh=UEEu6EW5RKCMxXIvwGPUXJedNiwF4BNlTRlApjnyOo0=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=zR9YyaRARunEBzIGpN27QGOe6JJHXtji4e6efOfNhTMyqdgk+hLti6PSXtdU3ZuLu
         MjD8MNHTYhRaTH90kG1lUbx52aJwmKdtpt9mVfJMjaalTToOTvyrkw+8Qbc+pVjfOW
         QhBXIbPA/VPcIQL7zeIuCFUTp1ojq0EF5iOhGgiM=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x46JG94L099373
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 6 May 2019 14:16:09 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 6 May
 2019 14:16:09 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 6 May 2019 14:16:09 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x46JG9LI090692;
        Mon, 6 May 2019 14:16:09 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <lee.jones@linaro.org>, <rdunlap@infradead.org>,
        <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh@kernel.org>
Subject: [PATCH v4 2/7] dt-bindings: mfd: LMU: Add the ramp up/down property
Date:   Mon, 6 May 2019 14:16:09 -0500
Message-ID: <20190506191614.25051-3-dmurphy@ti.com>
X-Mailer: git-send-email 2.21.0.5.gaeb582a983
In-Reply-To: <20190506191614.25051-1-dmurphy@ti.com>
References: <20190506191614.25051-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Document the ramp-up and ramp-down property in the binding.
Removing the "sec" from the property definition as seconds is
implied.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---

v4 - Change property->properties, changed ramp-up/down-ms to ramp-up/down-us -
https://lore.kernel.org/patchwork/patch/1068614/

v3 - No changes added Reviewed-by Rob - https://lore.kernel.org/patchwork/patch/1058759/
v2 - Fixed commit message as this was not just a modification but adding documentation
https://lore.kernel.org/patchwork/patch/1054504/

 .../devicetree/bindings/mfd/ti-lmu.txt        | 22 ++++++++++++-------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/ti-lmu.txt b/Documentation/devicetree/bindings/mfd/ti-lmu.txt
index 86ca786d54fc..160eb0a5e21a 100644
--- a/Documentation/devicetree/bindings/mfd/ti-lmu.txt
+++ b/Documentation/devicetree/bindings/mfd/ti-lmu.txt
@@ -23,8 +23,14 @@ Required properties:
          0x36 for LM3633, LM3697
          0x63 for LM3695
 
-Optional property:
+Optional properties:
   - enable-gpios: A GPIO specifier for hardware enable pin.
+  - ramp-up-us: Current ramping from one brightness level to
+		the a higher brightness level.
+		Range from 2048 us - 117.44 s
+  - ramp-down-us: Current ramping from one brightness level to
+		  the a lower brightness level.
+		  Range from 2048 us - 117.44 s
 
 Required node:
   - backlight: All LMU devices have backlight child nodes.
@@ -90,7 +96,7 @@ lm3631@29 {
 
 		lcd_bl {
 			led-sources = <0 1>;
-			ramp-up-msec = <300>;
+			ramp-up-us = <300000>;
 		};
 	};
 };
@@ -152,15 +158,15 @@ lm3633@36 {
 		main {
 			label = "main_lcd";
 			led-sources = <1 2>;
-			ramp-up-msec = <500>;
-			ramp-down-msec = <500>;
+			ramp-up-us = <500000>;
+			ramp-down-us = <500000>;
 		};
 
 		front {
 			label = "front_lcd";
 			led-sources = <0>;
-			ramp-up-msec = <1000>;
-			ramp-down-msec = <0>;
+			ramp-up-us = <1000000>;
+			ramp-down-us = <0>;
 		};
 	};
 
@@ -212,8 +218,8 @@ lm3697@36 {
 
 		lcd {
 			led-sources = <0 1 2>;
-			ramp-up-msec = <200>;
-			ramp-down-msec = <200>;
+			ramp-up-us = <200000>;
+			ramp-down-us = <200000>;
 		};
 	};
 
-- 
2.21.0.5.gaeb582a983

