Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 623221F2009
	for <lists+linux-leds@lfdr.de>; Mon,  8 Jun 2020 21:39:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726592AbgFHTjg (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 8 Jun 2020 15:39:36 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:43398 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726406AbgFHTje (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 8 Jun 2020 15:39:34 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 058JdTVH057076;
        Mon, 8 Jun 2020 14:39:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1591645169;
        bh=Ris2/4w6GDy898Yv1LyxocRRHlnY97ZT12syvx8SG/4=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=fMYYag4jzrFdARFfieAFNkv7IFNBrXGcZP7Se2aRYDhxEU8vVTGV0Vo2GjOt9GPhI
         MJ/9kObuusKjQRrTT5kgq5JJho5Jh/dZocJxpRr3Sg8xlmTADbuTBolm27g9j+KT7O
         AK6IpdP05ozxXqmjf1m6PVsR5vBwrlsp/smG523U=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 058JdTsF028391
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 8 Jun 2020 14:39:29 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 8 Jun
 2020 14:39:29 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 8 Jun 2020 14:39:29 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 058JdTAn050919;
        Mon, 8 Jun 2020 14:39:29 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <devicetree@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v27 01/15] dt: bindings: Add multicolor class dt bindings documention
Date:   Mon, 8 Jun 2020 14:39:03 -0500
Message-ID: <20200608193917.13084-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200608193917.13084-1-dmurphy@ti.com>
References: <20200608193917.13084-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add DT bindings for the LEDs multicolor class framework.
Add multicolor ID to the color ID list for device tree bindings.

CC: Rob Herring <robh@kernel.org>
Acked-by: Pavel Machek <pavel@ucw.cz>
Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 .../bindings/leds/leds-class-multicolor.yaml  | 37 +++++++++++++++++++
 include/dt-bindings/leds/common.h             |  3 +-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml b/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
new file mode 100644
index 000000000000..b55e1f1308a4
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/leds-class-multicolor.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Common properties for the multicolor LED class.
+
+maintainers:
+  - Dan Murphy <dmurphy@ti.com>
+
+description: |
+  Bindings for multi color LEDs show how to describe current outputs of
+  either integrated multi-color LED elements (like RGB, RGBW, RGBWA-UV
+  etc.) or standalone LEDs, to achieve logically grouped multi-color LED
+  modules. This is achieved by adding multi-led nodes layer to the
+  monochrome LED bindings.
+  The nodes and properties defined in this document are unique to the multicolor
+  LED class.  Common LED nodes and properties are inherited from the common.txt
+  within this documentation directory.
+
+patternProperties:
+  "^multi-led@([0-9a-f])$":
+    type: object
+    description: Represents the LEDs that are to be grouped.
+    properties:
+      color:
+        const: 8  # LED_COLOR_ID_MULTI
+        description: |
+          For multicolor LED support this property should be defined as
+          LED_COLOR_ID_MULTI which can be found in include/linux/leds/common.h.
+
+    $ref: "common.yaml#"
+
+    required:
+      - color
+...
diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds/common.h
index 0ce7dfc00dcb..a463ce6a8794 100644
--- a/include/dt-bindings/leds/common.h
+++ b/include/dt-bindings/leds/common.h
@@ -30,7 +30,8 @@
 #define LED_COLOR_ID_VIOLET	5
 #define LED_COLOR_ID_YELLOW	6
 #define LED_COLOR_ID_IR		7
-#define LED_COLOR_ID_MAX	8
+#define LED_COLOR_ID_MULTI	8
+#define LED_COLOR_ID_MAX	9
 
 /* Standard LED functions */
 /* Keyboard LEDs, usually it would be input4::capslock etc. */
-- 
2.26.2

