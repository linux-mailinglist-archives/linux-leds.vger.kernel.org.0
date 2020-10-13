Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A1EA28D34E
	for <lists+linux-leds@lfdr.de>; Tue, 13 Oct 2020 19:50:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbgJMRuv (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 13 Oct 2020 13:50:51 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:36556 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725899AbgJMRuu (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 13 Oct 2020 13:50:50 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09DHoZ8P073278;
        Tue, 13 Oct 2020 12:50:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1602611435;
        bh=JMlBT3SOiTVkNTVQ570eNx88MSuuCsNQRAZUhrNTppg=;
        h=From:To:CC:Subject:Date;
        b=Xx0MnzYph2Nr+1AySAF8M1//FJLZa9FwRxcXo1GIUSfJNiUcMY5xmzubUIBtOqgAl
         oCMJh6rnn9lIpWi0IrHjJY4Aep518D2EmFbiTnlFtki89oJhzIolJ4t/WMGlJqlQ0x
         5PBab+WAow+LpYhzkAUQpe6kveWvTl7x1nofNaRc=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09DHoZsV003382
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 13 Oct 2020 12:50:35 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 13
 Oct 2020 12:50:35 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 13 Oct 2020 12:50:35 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09DHoYTp091558;
        Tue, 13 Oct 2020 12:50:35 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <pavel@ucw.cz>, <robh+dt@kernel.org>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Dan Murphy <dmurphy@ti.com>,
        Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH] dt-bindings: leds: Update devicetree documents for ID_RGB
Date:   Tue, 13 Oct 2020 12:50:34 -0500
Message-ID: <20201013175034.25911-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Update the leds/common.yaml to indicate that the max color ID is 9.
Reflect the same change in the leds-class-multicolor.yaml

Reported-by: Zhen Lei <thunder.leizhen@huawei.com>
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 Documentation/devicetree/bindings/leds/common.yaml       | 2 +-
 .../devicetree/bindings/leds/leds-class-multicolor.yaml  | 9 +++++----
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
index a2a541bca73c..0c9f912dfee6 100644
--- a/Documentation/devicetree/bindings/leds/common.yaml
+++ b/Documentation/devicetree/bindings/leds/common.yaml
@@ -43,7 +43,7 @@ properties:
       LED_COLOR_ID available, add a new one.
     $ref: /schemas/types.yaml#definitions/uint32
     minimum: 0
-    maximum: 8
+    maximum: 9
 
   function-enumerator:
     description:
diff --git a/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml b/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
index b55e1f1308a4..f8032e863ecb 100644
--- a/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
@@ -16,7 +16,7 @@ description: |
   modules. This is achieved by adding multi-led nodes layer to the
   monochrome LED bindings.
   The nodes and properties defined in this document are unique to the multicolor
-  LED class.  Common LED nodes and properties are inherited from the common.txt
+  LED class.  Common LED nodes and properties are inherited from the common.yaml
   within this documentation directory.
 
 patternProperties:
@@ -25,10 +25,11 @@ patternProperties:
     description: Represents the LEDs that are to be grouped.
     properties:
       color:
-        const: 8  # LED_COLOR_ID_MULTI
+        const: 9  # LED_COLOR_ID_RGB
         description: |
-          For multicolor LED support this property should be defined as
-          LED_COLOR_ID_MULTI which can be found in include/linux/leds/common.h.
+          For multicolor LED support this property should be defined as either
+          LED_COLOR_ID_RGB or LED_COLOR_ID_MULTI which can be found in
+          include/linux/leds/common.h.
 
     $ref: "common.yaml#"
 
-- 
2.28.0.585.ge1cfff676549

