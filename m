Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A22A10031
	for <lists+linux-leds@lfdr.de>; Tue, 30 Apr 2019 21:18:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727001AbfD3TRi (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 30 Apr 2019 15:17:38 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:35650 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726923AbfD3TRi (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 30 Apr 2019 15:17:38 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3UJHY16074213;
        Tue, 30 Apr 2019 14:17:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1556651854;
        bh=oIAzHTI5a+s+b5rzRKIA6SvH4UyhyshCDOofvkrccxU=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=zGnwgo8bXMjs6EkTDv9xo9fF3VRvqJxfL5ebyMNnZ7rPqbdrMMCelyw+7Jrp+ipQA
         PwRIP4SlVAeiAWx/b5Papk7xMruNKyQuxGo+Sidf7VpVWHu1yabTvvsydbhV+2rSGO
         4XO9DRQZ5WXCdrPksiJdaXfguiToAlLjzd4PK8SU=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3UJHYHC005516
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 30 Apr 2019 14:17:34 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 30
 Apr 2019 14:17:33 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 30 Apr 2019 14:17:33 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3UJHXpE007868;
        Tue, 30 Apr 2019 14:17:33 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh@kernel.org>
Subject: [PATCH v3 2/7] dt-bindings: mfd: LMU: Add the ramp up/down property
Date:   Tue, 30 Apr 2019 14:17:25 -0500
Message-ID: <20190430191730.19450-3-dmurphy@ti.com>
X-Mailer: git-send-email 2.21.0.5.gaeb582a983
In-Reply-To: <20190430191730.19450-1-dmurphy@ti.com>
References: <20190430191730.19450-1-dmurphy@ti.com>
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

v3 - No changes added Reviewed-by Rob - https://lore.kernel.org/patchwork/patch/1058759/

v2 - Fixed commit message as this was not just a modification but adding documentation
https://lore.kernel.org/patchwork/patch/1054504/

 .../devicetree/bindings/mfd/ti-lmu.txt        | 20 ++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/ti-lmu.txt b/Documentation/devicetree/bindings/mfd/ti-lmu.txt
index 86ca786d54fc..adae96c79d39 100644
--- a/Documentation/devicetree/bindings/mfd/ti-lmu.txt
+++ b/Documentation/devicetree/bindings/mfd/ti-lmu.txt
@@ -25,6 +25,12 @@ Required properties:
 
 Optional property:
   - enable-gpios: A GPIO specifier for hardware enable pin.
+  - ramp-up-ms: Current ramping from one brightness level to
+		the a higher brightness level.
+		Range from 2048 us - 117.44 s
+  - ramp-down-ms: Current ramping from one brightness level to
+		  the a lower brightness level.
+		  Range from 2048 us - 117.44 s
 
 Required node:
   - backlight: All LMU devices have backlight child nodes.
@@ -90,7 +96,7 @@ lm3631@29 {
 
 		lcd_bl {
 			led-sources = <0 1>;
-			ramp-up-msec = <300>;
+			ramp-up-ms = <300>;
 		};
 	};
 };
@@ -152,15 +158,15 @@ lm3633@36 {
 		main {
 			label = "main_lcd";
 			led-sources = <1 2>;
-			ramp-up-msec = <500>;
-			ramp-down-msec = <500>;
+			ramp-up-ms = <500>;
+			ramp-down-ms = <500>;
 		};
 
 		front {
 			label = "front_lcd";
 			led-sources = <0>;
-			ramp-up-msec = <1000>;
-			ramp-down-msec = <0>;
+			ramp-up-ms = <1000>;
+			ramp-down-ms = <0>;
 		};
 	};
 
@@ -212,8 +218,8 @@ lm3697@36 {
 
 		lcd {
 			led-sources = <0 1 2>;
-			ramp-up-msec = <200>;
-			ramp-down-msec = <200>;
+			ramp-up-ms = <200>;
+			ramp-down-ms = <200>;
 		};
 	};
 
-- 
2.21.0.5.gaeb582a983

