Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EBA021DA90
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2020 17:46:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730221AbgGMPqS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 13 Jul 2020 11:46:18 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:55508 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730180AbgGMPqM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 13 Jul 2020 11:46:12 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06DFju71018930;
        Mon, 13 Jul 2020 10:45:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1594655156;
        bh=guAebOmRuPZn0pCzc4snOkbfY7Zfn23fU9q10KQYjVc=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=bKxou/eNtjIIKQ5jUVoAvJGfc6fiscGCgGUNmQgaseFDCnV9viGrZc5MCUDgIHVXl
         GcM1XJf0kf2NJmO0Z9mSZR6j4GRWK/Nf4SJpWFEGFrUvlZFAOSwfRM1hX7BXQGudEo
         DfwH10Uu2enkmyVWMz3t7Iu+APjOKeZKfz2AeI6U=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06DFjuhi066826
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 13 Jul 2020 10:45:56 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 13
 Jul 2020 10:45:56 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 13 Jul 2020 10:45:56 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06DFjukX033617;
        Mon, 13 Jul 2020 10:45:56 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh@kernel.org>,
        <marek.behun@nic.cz>
CC:     <devicetree@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v30 03/16] dt: bindings: Add multicolor class dt bindings documention
Date:   Mon, 13 Jul 2020 10:45:31 -0500
Message-ID: <20200713154544.1683-4-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200713154544.1683-1-dmurphy@ti.com>
References: <20200713154544.1683-1-dmurphy@ti.com>
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
Reviewed-by: Rob Herring <robh@kernel.org>
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
2.27.0

