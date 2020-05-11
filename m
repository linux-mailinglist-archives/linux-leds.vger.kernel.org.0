Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 994381CD757
	for <lists+linux-leds@lfdr.de>; Mon, 11 May 2020 13:12:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729439AbgEKLMi (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 11 May 2020 07:12:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725993AbgEKLMh (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Mon, 11 May 2020 07:12:37 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF021C061A0C;
        Mon, 11 May 2020 04:12:36 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id v5so3055343lfp.13;
        Mon, 11 May 2020 04:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pkr+IhGoxSKRTkwbFYF/J9fJ7I9LmIIqclNwQQn9boY=;
        b=ASByneVyqS6GGPi7PjOhOpJR6CfvRyN80E4nXBDlq1z0B++sV0+0/uc/iEXMGBnii2
         PEWxHT+2gsWx6opIbgqVqM3vybFWGxq8OF7OR93fg5oBNnyL8GpBQmsNQXKilTTdcpTp
         lmw+xq2ZqJzMIhHGBEG/uKLy/9MYAOuWRN2O5y56//+LRKgQymGp0ZrHJ3jEJ+mvtMcV
         FM/UYZ/pKod372buiKW+kzImQGFDRUH7RbVoe9/EzTt3Rd70he8tq5vdFPucAIQUaPCU
         4/749Zn4yhGK5d00gN+D0tqW6L12vrtxBukT7CXr5510i0Udxlwl5QmrPRRNwNPPkjOE
         5tqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pkr+IhGoxSKRTkwbFYF/J9fJ7I9LmIIqclNwQQn9boY=;
        b=bprX/BtqVwugxfz10EHFppuiizqYDWFA2pTFsjrFMojaTHl3ZyvlaR+BdpPwal3yOi
         n+zM0BBsRfpC5j19loqN7rCnP7+YpcZGLPHuxXJRbgGmA/lwZ6ZgRrxsJmvmHTuKt++z
         CQYNl71Dsqd/LBbBF+lNOQe2wOZRyKPItB0C5DBGML6SLxf6eKNcKxNYKhgj0yI/3fIP
         xfQ3rniiof420XoNEuYI4tbHWMHbO96kR9t2i6HSO6tAx1gKGFnsm1llElZndGBF4j03
         rgWbLs0mfBAbwccQ6jp5oqVHIpf6lrOo99nhdFqnR1mRm2kdqOmf1GjK/y/nCZEwFSOh
         xgRw==
X-Gm-Message-State: AOAM533Vw3BeBo6ONkl03X/C3sI95YMB2f6vwnZ6z69qg7DVn6Pjbxh3
        H/9h/mPo4xqQXNYcOSueWyE=
X-Google-Smtp-Source: ABdhPJwjivak7f+HwH1+Cx59NzQaFGlLotYAN3x3o6kJfOPX1axJ3Mg/tmwvrtkznWR5AqwUWDDJvA==
X-Received: by 2002:a19:cc07:: with SMTP id c7mr10778072lfg.163.1589195555425;
        Mon, 11 May 2020 04:12:35 -0700 (PDT)
Received: from localhost.localdomain ([2a01:540:28d4:e600:cdb2:b5ce:8f29:26b7])
        by smtp.gmail.com with ESMTPSA id a10sm9498128ljp.16.2020.05.11.04.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 04:12:34 -0700 (PDT)
From:   nikitos.tr@gmail.com
To:     pavel@ucw.cz
Cc:     dmurphy@ti.com, robh+dt@kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Nikita Travkin <nikitos.tr@gmail.com>
Subject: [PATCH v2 2/3] dt-bindings: leds: Add binding for aw2013
Date:   Mon, 11 May 2020 16:11:27 +0500
Message-Id: <20200511111128.16210-2-nikitos.tr@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200511111128.16210-1-nikitos.tr@gmail.com>
References: <20200511111128.16210-1-nikitos.tr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Nikita Travkin <nikitos.tr@gmail.com>

Add YAML devicetree binding for AWINIC AW2013 3-channel led driver

Signed-off-by: Nikita Travkin <nikitos.tr@gmail.com>
---
 .../devicetree/bindings/leds/leds-aw2013.yaml | 91 +++++++++++++++++++
 1 file changed, 91 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-aw2013.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-aw2013.yaml b/Documentation/devicetree/bindings/leds/leds-aw2013.yaml
new file mode 100644
index 000000000000..f118721df1e8
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-aw2013.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/leds-aw2013.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AWINIC AW2013 3-channel LED Driver
+
+maintainers:
+  - Nikita Travkin <nikitos.tr@gmail.com>
+
+description: |
+  The AW2013 is a 3-channel LED driver with I2C interface. It can control
+  LED brightness with PWM output.
+
+properties:
+  compatible:
+    const: awinic,aw2013
+
+  reg:
+    maxItems: 1
+
+  vcc-supply:
+    description: Regulator providing power to the "VCC" pin.
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^led@[0-2]$":
+    type: object
+    allOf:
+      - $ref: common.yaml#
+
+    properties:
+      reg:
+        description: Index of the LED.
+        minimum: 0
+        maximum: 2
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/leds/common.h>
+
+    i2c0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led-controller@45 {
+            compatible = "awinic,aw2013";
+            reg = <0x45>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            vcc-supply = <&pm8916_l17>;
+
+            led@0 {
+                reg = <0>;
+                led-max-microamp = <5000>;
+                function = LED_FUNCTION_INDICATOR;
+                color = <LED_COLOR_ID_RED>;
+            };
+
+            led@1 {
+                reg = <1>;
+                led-max-microamp = <5000>;
+                function = LED_FUNCTION_INDICATOR;
+                color = <LED_COLOR_ID_GREEN>;
+            };
+
+            led@2 {
+                reg = <2>;
+                led-max-microamp = <5000>;
+                function = LED_FUNCTION_INDICATOR;
+                color = <LED_COLOR_ID_BLUE>;
+            };
+        };
+    };
+...
-- 
2.20.1

