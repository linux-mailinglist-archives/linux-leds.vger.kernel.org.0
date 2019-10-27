Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8ED54E62F3
	for <lists+linux-leds@lfdr.de>; Sun, 27 Oct 2019 15:10:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726706AbfJ0OKD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 27 Oct 2019 10:10:03 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:36906 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726541AbfJ0OKD (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 27 Oct 2019 10:10:03 -0400
Received: by mail-pg1-f194.google.com with SMTP id p1so4735500pgi.4;
        Sun, 27 Oct 2019 07:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=GS2AkDqPPAxKrZBWJ/DTM6rgecqBESZUQAWeB+1dpw4=;
        b=n/4I41URnQ/vEd5LUg3dulB6/YtTB6q9IBZxOmc+qOXyOgjSegbMJBXpv+I8/aXMWA
         4gomrD0OprJgiMNtv3ciDSLU9+UdAlZzWYIX8tvgI2pLUtXTNw7dObN8tB/44JTBecw1
         G02x/+iPEBquXiFv/Qya8rHxflwreRd4EqKXTmuCjR7YpfUfPQs7a8RknLBLr5faPt/T
         oEL7G6x33VcLd72TBuTFROIZUKFr+a+vopnBQ5i4TjYahDXrQo3keCbcj3Id5YYy4Ez1
         VGi2PkmXo83oi1kbaQ62TCYlDa+QXqbtZN/lIkaJN+dMTL76ROwPH3pbNEQmgyy6hfbT
         YdMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=GS2AkDqPPAxKrZBWJ/DTM6rgecqBESZUQAWeB+1dpw4=;
        b=UBeDiArEPpq51gPfYplA2HgwEMhH18PCA5aEHyw83IZonUQ4iryQsIZ+TzIrSF6X6N
         ujvX8JVY5K4vrdzvaNH+gd28i+SdHgjUySNdqxCg33/kFwddgwGCn6Z6A3LsYYVeBmV5
         ZxOtWQQDOxoC3kUpAyCSxBeiIoV0tIX8d+8kSfFnSxoxLJ8Pv5M0xJxDrTx0OQlIX37o
         2P5WHHZE8NNEJ+W4nBqO/IXVPdmJhQe+K6Jo+DCfA60ua3k3RnHbNG774QvIn4QgSACx
         cQnS8G+m4X7Ft7q9us/AQqj2joRyD9doDTyMeGSb6Cd1XvmpkkKjywreCmuD1OKTKlWj
         JzCQ==
X-Gm-Message-State: APjAAAVwl/UZYLYiP/GHvpKbtueQbxhKZB7cFL//ueJFJj4njv11mQw7
        RRTdVooTwjrUSEl29h2GD69YZGX8
X-Google-Smtp-Source: APXvYqzbFACXOGSSPEpb68sK1f8k2oJkYtC6O+XpIEQyU5U1vmGq7Ud5exUN2ml0dYZa9JGVcMMamQ==
X-Received: by 2002:a17:90a:3be4:: with SMTP id e91mr584364pjc.56.1572185402520;
        Sun, 27 Oct 2019 07:10:02 -0700 (PDT)
Received: from localhost.localdomain ([240f:34:212d:1:368e:e048:68f1:84e7])
        by smtp.gmail.com with ESMTPSA id v10sm6514702pfg.11.2019.10.27.07.09.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sun, 27 Oct 2019 07:10:02 -0700 (PDT)
From:   Akinobu Mita <akinobu.mita@gmail.com>
To:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Akinobu Mita <akinobu.mita@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Bjorn Andersson <bjorn@kryo.se>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Jean-Jacques Hiblot <jjhiblot@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v2 1/2] dt-bindings: leds: Add leds-meter binding
Date:   Sun, 27 Oct 2019 23:09:38 +0900
Message-Id: <1572185379-21537-2-git-send-email-akinobu.mita@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572185379-21537-1-git-send-email-akinobu.mita@gmail.com>
References: <1572185379-21537-1-git-send-email-akinobu.mita@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add DT binding for generic LED level meter which consists of multiple LED
devices by different drivers.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Bjorn Andersson <bjorn@kryo.se>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Jean-Jacques Hiblot <jjhiblot@ti.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Dan Murphy <dmurphy@ti.com>
Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
---
 .../devicetree/bindings/leds/leds-meter.yaml       | 67 ++++++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-meter.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-meter.yaml b/Documentation/devicetree/bindings/leds/leds-meter.yaml
new file mode 100644
index 0000000..b5fcd98
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-meter.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/leds-meter.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic LED level meter
+
+maintainers:
+  - Akinobu Mita <akinobu.mita@gmail.com>
+
+description:
+  Generic LED level meter consists of multiple LED devices by different drivers.
+
+properties:
+  $nodename:
+    pattern: "^meter-leds(@.*)?"
+
+  compatible:
+    const: meter-leds
+
+  leds:
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: List of phandles to LED node that are members of a level meter.
+
+  brightness-weights:
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: |
+      By default, the brightness of the LED level meter is proportional to the
+      number of actual LEDs that are turned on.  We can optionally specify
+      the contribution ratio for each LED within a level meter by this
+      property.  The example below shows how to setup an exponential
+      relationship between the number of LEDs turned on and the brightness of
+      meter-leds.
+
+required:
+ - compatible
+ - leds
+
+additionalProperties: false
+
+examples:
+  - |
+    // Example 1: LED level meter with four LEDs
+    meter-leds {
+        compatible = "meter-leds";
+        leds = <&led0>, <&led1>, <&led2>, <&led3>;
+    };
+
+    // Example 2: Exponential relationship between the number of LEDs turned on
+    // and the brightness of meter-leds
+    //
+    // When the maximum brightness is 255
+    // - No LEDs are turned on if brightness == 0
+    // - led0 is turned on if 0 < brightness <= 32
+    // - led0 and led1 are turned on if 32 < brightness <= 64
+    // - led0, led1, and led2 are turned on if 64 < brightness <= 128
+    // - All LEDs are turned on if 128 < brightness <= 255
+    meter-leds {
+        compatible = "meter-leds";
+        leds = <&led0>, <&led1>, <&led2>, <&led3>;
+        brightness-weights = <32 32 64 127>;
+    };
+
+...
-- 
2.7.4

