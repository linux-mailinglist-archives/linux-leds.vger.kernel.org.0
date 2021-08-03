Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C66A3DF275
	for <lists+linux-leds@lfdr.de>; Tue,  3 Aug 2021 18:27:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233477AbhHCQ1V (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 3 Aug 2021 12:27:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233464AbhHCQ1V (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 3 Aug 2021 12:27:21 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E0B7C061757;
        Tue,  3 Aug 2021 09:27:10 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2804:14c:1a9:2434:b693:c9:5cb6:b688])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: nfraprado)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 13F7D1F423F0;
        Tue,  3 Aug 2021 17:27:03 +0100 (BST)
From:   =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= 
        <nfraprado@collabora.com>
To:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Brian Masney <masneyb@onstation.org>,
        Luca Weiss <luca@z3ntu.xyz>,
        Russell King <linux@armlinux.org.uk>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, ~lkcamp/patches@lists.sr.ht,
        =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>,
        kernel@collabora.com
Subject: [PATCH v3 1/5] dt-bindings: leds: Add binding for qcom-spmi-flash
Date:   Tue,  3 Aug 2021 13:26:37 -0300
Message-Id: <20210803162641.1525980-2-nfraprado@collabora.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210803162641.1525980-1-nfraprado@collabora.com>
References: <20210803162641.1525980-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add devicetree binding for Qualcomm's SPMI Flash LEDs which are part of
the PM8941 PMIC. These LEDs are used both as lantern and camera flash on
phones based on the MSM8974 SoC, like the Nexus 5.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---

Changes in v3:
- Removed clamp-curr, headroom, startup-dly and safety-timer properties since
  they didn't impact the behavior. They're now hardcoded in the driver (patch 2)
- Added valid ranges for led-max-microamp, flash-max-microamp and
  flash-max-timeout-us
- Removed dt-bindings header file that held some constants (moved to inside the
  driver in patch 2)

Added in v2

 .../bindings/leds/leds-qcom-spmi-flash.yaml   | 93 +++++++++++++++++++
 1 file changed, 93 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-qcom-spmi-flash.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-qcom-spmi-flash.yaml b/Documentation/devicetree/bindings/leds/leds-qcom-spmi-flash.yaml
new file mode 100644
index 000000000000..da674d73c033
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-qcom-spmi-flash.yaml
@@ -0,0 +1,93 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/leds-qcom-spmi-flash.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SPMI Flash LEDs
+
+maintainers:
+  - Nícolas F. R. A. Prado <n@nfraprado.net>
+
+description: |
+  The Qualcomm SPMI Flash LEDs are part of Qualcomm PMICs and are used primarily
+  as a camera or video flash. They can also be used as a lantern when on torch
+  mode.
+  The PMIC is connected to Host processor via SPMI bus.
+
+properties:
+  compatible:
+    const: qcom,spmi-flash-leds
+
+  reg:
+    maxItems: 1
+
+  flash-boost-supply:
+    description: SMBB regulator for LED flash mode
+
+  torch-boost-supply:
+    description: SMBB regulator for LED torch mode
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  "^led@[0-1]$":
+    type: object
+    $ref: common.yaml#
+
+    properties:
+      reg:
+        maxItems: 1
+
+      led-max-microamp:
+        minimum: 12500
+        maximum: 200000
+        multipleOf: 12500
+
+      flash-max-microamp:
+        minimum: 12500
+        maximum: 1000000
+        multipleOf: 12500
+
+      flash-max-timeout-us:
+        minimum: 10000
+        maximum: 1280000
+        multipleOf: 10000
+
+    required:
+      - reg
+
+required:
+  - compatible
+  - reg
+  - flash-boost-supply
+  - torch-boost-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/leds/common.h>
+
+    spmi-flash-leds@d300 {
+        compatible = "qcom,spmi-flash-leds";
+        reg = <0xd300 0x100>;
+        flash-boost-supply = <&pm8941_5vs1>;
+        torch-boost-supply = <&pm8941_5v>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led@0 {
+            reg = <0>;
+            function = LED_FUNCTION_FLASH;
+            color = <LED_COLOR_ID_WHITE>;
+            led-max-microamp = <200000>;
+            flash-max-microamp = <1000000>;
+            flash-max-timeout-us = <1280000>;
+        };
+    };
+...
-- 
2.32.0

