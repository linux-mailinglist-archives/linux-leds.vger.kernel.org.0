Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 219F63837ED
	for <lists+linux-leds@lfdr.de>; Mon, 17 May 2021 17:46:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244071AbhEQPrY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 17 May 2021 11:47:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344267AbhEQPoJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 17 May 2021 11:44:09 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8B2AC04314D;
        Mon, 17 May 2021 07:36:22 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id k5so3797157pjj.1;
        Mon, 17 May 2021 07:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=tVgAkGBFVimZZBUracvErIwvpUEHqs66nyqdBflm5/U=;
        b=YBH3amJiMJnrbPOp7sVB3I1m+0RcelfLdyqqN2hTYxW4p4RBQiYvBQ7qcpMRCqx2mv
         G1jpwj+gIiHynxXIBaw0PThQ3tMHtcGC0krAoZFtD0GSVEVX80WTZzACN3APXdaq2Dhc
         OrjADuOzor1n/YJ0ms+Hot2PFrjz5RtG7j2Nt+a5q3UtnP3Eyu5kMvoh2wQWE0iYOE8E
         6lOkIos/8mWxHa5AYBe9nF7fvGa6XMGRrho/fgg6gwADyXvY1Y+c549wwFAmoXtsl4B1
         c6JYSWzmKvmER1oqZjiw1Esg2cJl2bh1De67ew+SAhhSHNyoNAUBbsxqqLNr8MYsVe74
         qoGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=tVgAkGBFVimZZBUracvErIwvpUEHqs66nyqdBflm5/U=;
        b=JMa9Wjf5jskXDbDhg06b/DBjh42mC9a5HXa7zEDlppm9Guk6RzWqmtENPwtnG6c52G
         qO2EsmTzcOlWidi5igjwCL+Yn9XY9YbmpwM2wGL3Esf/xlsTyxKDX3fbBpnXjAoKkDaN
         CC/iFaLP0YseXaiu0Hm085Vw7E7xVkQasJ59eGwHyzwZEH7B7UrAdYfvubrqs4BzX6yU
         BjwB62oNxvMGhYjVvxtvDnEC/i7Fq9pqSXHlrVQS/QvTgqNj5qIDy5aB0Qoq0W3yWnsV
         DNX3JVqjG6uoLED0igA2li84krfiXDqigd204C6E3me9pKF4IhRvcDrfyvjbSbyD5f/u
         +AcQ==
X-Gm-Message-State: AOAM530OQ7uN9F3RI0Cz/YbZZyUAI7wjpex4vUDGjPGZ1S42q/ohyqi2
        voHbpIQ6ThQG0yruyFYCAbg=
X-Google-Smtp-Source: ABdhPJyYzVlYxSXt+guqxsJKMRKd9MOJDoF6khl6nCKsHjuU2j3kVogEewBRLBVnnaQVscAvVLfiFw==
X-Received: by 2002:a17:903:30c4:b029:f0:ad43:4ca with SMTP id s4-20020a17090330c4b02900f0ad4304camr130663plc.70.1621262182190;
        Mon, 17 May 2021 07:36:22 -0700 (PDT)
Received: from localhost.localdomain (1-171-3-209.dynamic-ip.hinet.net. [1.171.3.209])
        by smtp.gmail.com with ESMTPSA id f5sm13880259pjp.37.2021.05.17.07.36.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 May 2021 07:36:21 -0700 (PDT)
From:   cy_huang <u0084500@gmail.com>
To:     lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
        daniel.thompson@linaro.org, jingoohan1@gmail.com,
        b.zolnierkie@samsung.com, pavel@ucw.cz, robh+dt@kernel.org
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, cy_huang@richtek.com
Subject: [PATCH v7 3/4] mfd: rt4831: Adds DT binding document for Richtek RT4831
Date:   Mon, 17 May 2021 22:36:00 +0800
Message-Id: <1621262161-9972-3-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1621262161-9972-1-git-send-email-u0084500@gmail.com>
References: <1621262161-9972-1-git-send-email-u0084500@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: ChiYuan Huang <cy_huang@richtek.com>

Adds DT binding document for Richtek RT4831.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
Reviewed-by: Rob Herring <robh@kernel.org>
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

