Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16AAD29047A
	for <lists+linux-leds@lfdr.de>; Fri, 16 Oct 2020 13:57:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407022AbgJPL5X (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 16 Oct 2020 07:57:23 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:38418 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405338AbgJPL5X (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 16 Oct 2020 07:57:23 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09GBv5HT099566;
        Fri, 16 Oct 2020 06:57:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1602849425;
        bh=4pH+/woBUpBKSK9xeykEFihRWeBGnOvEESWTk+SR7eA=;
        h=From:To:CC:Subject:Date;
        b=VdMjyGZgzEnILaHORr6rJW0ZcWQ+fGDc2XMLTThUNupgPjUn1gFC4LeN48+Ol6HnJ
         S4z3HqkkzwN+RgG07XIKG8ynNLyPL8CB4uPy/3VrTTRsj5IxlKtEVcFBg+LrDBm+UU
         P3nPPTRkg1GLlXFZPdJ6d1DCO0nDMlb+2KsywhWE=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09GBv5hj080755
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 16 Oct 2020 06:57:05 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 16
 Oct 2020 06:57:04 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 16 Oct 2020 06:57:04 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09GBv4Ac004386;
        Fri, 16 Oct 2020 06:57:04 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <pavel@ucw.cz>, <robh+dt@kernel.org>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Dan Murphy <dmurphy@ti.com>,
        Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH v2] dt-bindings: leds: Update devicetree documents for ID_RGB
Date:   Fri, 16 Oct 2020 06:57:03 -0500
Message-ID: <20201016115703.30184-1-dmurphy@ti.com>
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
index b55e1f1308a4..5e2c850ec9c5 100644
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
         description: |
-          For multicolor LED support this property should be defined as
-          LED_COLOR_ID_MULTI which can be found in include/linux/leds/common.h.
+          For multicolor LED support this property should be defined as either
+          LED_COLOR_ID_RGB or LED_COLOR_ID_MULTI which can be found in
+          include/linux/leds/common.h.
+        enum: [ 8, 9 ]
 
     $ref: "common.yaml#"
 
-- 
2.28.0.585.ge1cfff676549

