Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CADAF10027
	for <lists+linux-leds@lfdr.de>; Tue, 30 Apr 2019 21:17:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727121AbfD3TRj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 30 Apr 2019 15:17:39 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:50940 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726926AbfD3TRj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 30 Apr 2019 15:17:39 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3UJHYG6028256;
        Tue, 30 Apr 2019 14:17:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1556651854;
        bh=DBVpWzS6+eBA2YDAgUhsz0NAmJ+G2vM/BxVVyNYpCHc=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Bn8Jqn+f8SOu8/cNH3P/shqmP5F1OUJMhLnAoDynPSkM3RECt/WwMMTJ8wr9gKA6T
         YxtxKligwAwXA4Q8WklM2or42s6yM2Vzase/mmMIGWibjupe3Es6JYADG9ihVB4/DO
         QK4B7/mu089TwqZOYyAonY+doObJfRHYpD3x5lEc=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3UJHY8w088678
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 30 Apr 2019 14:17:34 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 30
 Apr 2019 14:17:34 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 30 Apr 2019 14:17:34 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3UJHXsw007885;
        Tue, 30 Apr 2019 14:17:34 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh@kernel.org>
Subject: [PATCH v3 3/7] dt-bindings: mfd: LMU: Add ti,brightness-resolution
Date:   Tue, 30 Apr 2019 14:17:26 -0500
Message-ID: <20190430191730.19450-4-dmurphy@ti.com>
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

Add ti,brightness-resolution to the TI LMU binding to define
whether the device uses 8-bit brightness or 11-bit brightness.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---

v3 - No changes added Reviewed-by Rob - https://lore.kernel.org/patchwork/patch/1058763/

v2 - New patch.  Add brightness resolution to ti-lmu.txt.  See patch comments
for context. - https://lore.kernel.org/patchwork/patch/1054501/

 Documentation/devicetree/bindings/mfd/ti-lmu.txt | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/ti-lmu.txt b/Documentation/devicetree/bindings/mfd/ti-lmu.txt
index adae96c79d39..5881929d5f7a 100644
--- a/Documentation/devicetree/bindings/mfd/ti-lmu.txt
+++ b/Documentation/devicetree/bindings/mfd/ti-lmu.txt
@@ -31,6 +31,16 @@ Optional property:
   - ramp-down-ms: Current ramping from one brightness level to
 		  the a lower brightness level.
 		  Range from 2048 us - 117.44 s
+  - ti,brightness-resolution - This determines whether to use 8 bit brightness
+			       mode or 11 bit brightness mode.  If this value is
+			       not set the device is defaulted to the preferred
+			       8bit brightness mode per 7.3.4.1 of the data
+			       sheet.  This setting can either be in the parent
+			       node or as part of the LED child nodes.  This
+			       is determined by the part itself if the strings
+			       have a common brightness register or individual
+			       brightness registers.
+			       The values are 255 (8bit) or 2047 (11bit).
 
 Required node:
   - backlight: All LMU devices have backlight child nodes.
@@ -217,6 +227,7 @@ lm3697@36 {
 		compatible = "ti,lm3697-backlight";
 
 		lcd {
+			ti,brightness-resolution = <255>;
 			led-sources = <0 1 2>;
 			ramp-up-ms = <200>;
 			ramp-down-ms = <200>;
-- 
2.21.0.5.gaeb582a983

