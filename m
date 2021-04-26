Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0B1036ACD5
	for <lists+linux-leds@lfdr.de>; Mon, 26 Apr 2021 09:19:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232167AbhDZHTN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 26 Apr 2021 03:19:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232172AbhDZHTM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 26 Apr 2021 03:19:12 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 746D0C061574;
        Mon, 26 Apr 2021 00:18:29 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id lt13so17597301pjb.1;
        Mon, 26 Apr 2021 00:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=6RWbIvonEByJpfvCiy66ZaoSzZ4OjH7yQjNFQ9CvawY=;
        b=bRxMljdwsCQS7y6jWqX1ASjdJ/EaPibEQOfYE9HBYNOBnvdtXMC+vAjgzTeyNaLTuc
         jMCPuzAIVFp49Y0BbQTP8g117k69hHOM8PpqNQwFML1cr2DE0FffE7TKByjAyaDC0NSH
         z46+arR16GMbBE22FnfNmeDAPmnwZM+cQJVDv5sESlHsPeNxM7hQ+CHqsRsJ7OlzrZ7U
         IKn+oQAXTCKYcw1okQYtSiDXvqcjLKfj4ICZgWeWdWeua5asVPoi/P/Fjsv8hLfYc44P
         bJyMhl3D8mSp07EfRG6aKoiBiZI5zHLJTE4O5npD+MihOjMArODjumwybiHlCpsxwaJh
         9WJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=6RWbIvonEByJpfvCiy66ZaoSzZ4OjH7yQjNFQ9CvawY=;
        b=lQ9+oHf21CyYaLFom4OBjIvnt78RT0ediD4eBUxEv3VUEpMExejApr1BdgKJdWejJX
         Pqnir5wzwqWf6R5A02uSExqhFIvXRjQUQ2EKd7BlDcZ2YB0IUh6nH4buw3PS+Sq3FR7S
         4hS2h/jZR00MWXkuT6KpkqClQ2s6bdxGeFoHVKpJAIsNBr4c5yyo6GeCm/0pSnGA0t0k
         ya5PWGIecp02PIDWuKsVb5TTKHnC6bFZqq6xLvr3T/f9tfMeeTLkXv0Un+BneKEd3Ckt
         j2GcLVEn4eBMDPOmmc52ro12C/W6ii9KV/tIr+USQu7kxzOyGrXQogrFHM2m0OjYWTZ5
         H+NQ==
X-Gm-Message-State: AOAM5302iCwaVKk2phlkUGlcS2vyC5krzC9ck3hmHvawD5v+/DxOIx/a
        9B3C17H5BdDFdQa8GBXar6Q=
X-Google-Smtp-Source: ABdhPJz9oU/l7nsklYCyOUk8PRxry7EV053Hh6tqqIUf/PcLLqIJJPzHxQ+RApOHOe7KA/oLknQCmg==
X-Received: by 2002:a17:902:6b0a:b029:ec:9899:6a2 with SMTP id o10-20020a1709026b0ab02900ec989906a2mr17304616plk.31.1619421509387;
        Mon, 26 Apr 2021 00:18:29 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:492:3af5:75cd:677a:81f7:a9fe])
        by smtp.gmail.com with ESMTPSA id u21sm9848952pfm.89.2021.04.26.00.18.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Apr 2021 00:18:28 -0700 (PDT)
From:   cy_huang <u0084500@gmail.com>
To:     lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
        daniel.thompson@linaro.org, jingoohan1@gmail.com,
        b.zolnierkie@samsung.com, pavel@ucw.cz, robh+dt@kernel.org
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, cy_huang@richtek.com
Subject: [RESEND PATCH v6 3/4] mfd: rt4831: Adds DT binding document for Richtek RT4831
Date:   Mon, 26 Apr 2021 15:18:10 +0800
Message-Id: <1619421491-31494-3-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1619421491-31494-1-git-send-email-u0084500@gmail.com>
References: <1619421491-31494-1-git-send-email-u0084500@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: ChiYuan Huang <cy_huang@richtek.com>

Adds DT binding document for Richtek RT4831.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
Resend this v6 patch series to loop devicetree reviewers.
---
 .../devicetree/bindings/mfd/richtek,rt4831.yaml    | 90 ++++++++++++++++++++++
 1 file changed, 90 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/richtek,rt4831.yaml

diff --git a/Documentation/devicetree/bindings/mfd/richtek,rt4831.yaml b/Documentation/devicetree/bindings/mfd/richtek,rt4831.yaml
new file mode 100644
index 00000000..4762eb1
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/richtek,rt4831.yaml
@@ -0,0 +1,90 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/richtek,rt4831.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Richtek RT4831 DSV and Backlight Integrated IC
+
+maintainers:
+  - ChiYuan Huang <cy_huang@richtek.com>
+
+description: |
+  RT4831 is a multifunctional device that can provide power to the LCD display
+  and LCD backlight.
+
+  For Display Bias Voltage DSVP and DSVN, the output range is about 4V to 6.5V.
+  It's sufficient to meet the current LCD power requirement.
+
+  For the LCD backlight, it can provide four channel WLED driving capability.
+  Each channel driving current is up to 30mA
+
+  Datasheet is available at
+  https://www.richtek.com/assets/product_file/RT4831A/DS4831A-05.pdf
+
+properties:
+  compatible:
+    const: richtek,rt4831
+
+  reg:
+    description: I2C device address.
+    maxItems: 1
+
+  enable-gpios:
+    description: |
+      GPIO to enable/disable the chip. It is optional.
+      Some usage directly tied this pin to follow VIO 1.8V power on sequence.
+    maxItems: 1
+
+  regulators:
+    $ref: ../regulator/richtek,rt4831-regulator.yaml
+
+  backlight:
+    $ref: ../leds/backlight/richtek,rt4831-backlight.yaml
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/leds/rt4831-backlight.h>
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      rt4831@11 {
+        compatible = "richtek,rt4831";
+        reg = <0x11>;
+
+        regulators {
+          DSVLCM {
+            regulator-min-microvolt = <4000000>;
+            regulator-max-microvolt = <7150000>;
+            regulator-allow-bypass;
+          };
+          DSVP {
+            regulator-name = "rt4831-dsvp";
+            regulator-min-microvolt = <4000000>;
+            regulator-max-microvolt = <6500000>;
+            regulator-boot-on;
+          };
+          DSVN {
+            regulator-name = "rt4831-dsvn";
+            regulator-min-microvolt = <4000000>;
+            regulator-max-microvolt = <6500000>;
+            regulator-boot-on;
+          };
+        };
+
+        backlight {
+          compatible = "richtek,rt4831-backlight";
+          default-brightness = <1024>;
+          max-brightness = <2048>;
+          richtek,bled-ovp-sel = /bits/ 8 <RT4831_BLOVPLVL_21V>;
+          richtek,channel-use = /bits/ 8 <RT4831_BLED_ALLCHEN>;
+        };
+      };
+    };
-- 
2.7.4

