Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F2F048B4B8
	for <lists+linux-leds@lfdr.de>; Tue, 11 Jan 2022 18:55:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241817AbiAKRzp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 11 Jan 2022 12:55:45 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:54358
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1344973AbiAKRzP (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Tue, 11 Jan 2022 12:55:15 -0500
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id AC3D340036
        for <linux-leds@vger.kernel.org>; Tue, 11 Jan 2022 17:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1641923713;
        bh=yLkZ3N1YGlON76aOjFtdwlmbLegMSMiHS0/fbiZm/ts=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=N1kxdjsWPyNvewboH21gJM9SWvHIh+XjualEATwXqgcIdOVyqVOTmrrdm3Dv0jvBr
         LB3MxFRVe9b2RMcW3cMyJte9/ise/WJJhMsKdK4YaVHy3IgSIlHncnYXU81aMJ38cA
         LUT2iCtWudCHKEuMbUC4yIbG7RjzdEINZV78QsZpTWYaM/4qV1qTrVI33QhoH9sWTY
         lT/8E9q93NvyF8GOyhM7oAX54HUc0iNm6j3MtlaWNJKjVC80gk6G/YBl7vGpHXG+32
         nM+jt+dxpkVEr8iBrkj37COFUZ9KipkW0Um6Zjn4IcF+p62yIHGV5aXsjznECBIq3l
         JiF3isVmSsT2Q==
Received: by mail-ed1-f72.google.com with SMTP id b8-20020a056402350800b003f8f42a883dso13998214edd.16
        for <linux-leds@vger.kernel.org>; Tue, 11 Jan 2022 09:55:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yLkZ3N1YGlON76aOjFtdwlmbLegMSMiHS0/fbiZm/ts=;
        b=wkIJtp0k5vRyyAYSuYegh2VGU7/JLSSlir4HNmByi1xxwwyukCUcw7Svt5GbA5EQz0
         mIbr9P6Opu7DkpwYuGTinXk2aWmkDK0ejYZuvYaQT2ViNRo/dugKGkHVsg6AWRU2krWC
         9XJPrW5iXzNLBHmzJ4wWr9txthkvtCCIlxdoVWgnRDERwOwknwpwpu45D3yapx/kmBwZ
         nPPixtWZC2GQiJkMGyoyeI00q/3DtcWBzKkC4O495GdfUOzBJnNmr28EVoYt+YF4HxZ3
         DwRsS68Nkyd04CFWqhWggSM9nBHdeb9LNWJjlKyxWjrMgMGQ2ELhDeYYnC5A1X5PpFpT
         J41w==
X-Gm-Message-State: AOAM533V3vfU2BYDPnWf+DLZ1XtCca91EpdWWAgR/7G2gCbnKbEC1HP/
        Re5B03/p9dvmogho16BEAjAtMFZwGLrFVcO9LpFHMr9NjxwD/8gyexDW7fO0uILGx3rZGcHFuNZ
        1J04S2sLSslJIzsLaOjx+YL7X6iDKuM/YYDLNzAk=
X-Received: by 2002:a17:907:8694:: with SMTP id qa20mr4701281ejc.378.1641923713216;
        Tue, 11 Jan 2022 09:55:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwGwSaoF6MY7oHvtxLZ7PMNUOIa6JgigH0+R24JIzl2v20ITlookaN2yzo30wfbhgVnIsnf5w==
X-Received: by 2002:a17:907:8694:: with SMTP id qa20mr4701258ejc.378.1641923712931;
        Tue, 11 Jan 2022 09:55:12 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id 7sm3759949ejh.161.2022.01.11.09.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 09:55:10 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Javier Martinez Canillas <javier@dowhile0.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Rob Herring <robh@kernel.org>
Subject: [PATCH v2 2/3] dt-bindings: mfd: maxim,max77802: convert to dtschema
Date:   Tue, 11 Jan 2022 18:54:29 +0100
Message-Id: <20220111175430.224421-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220111175430.224421-1-krzysztof.kozlowski@canonical.com>
References: <20220111175430.224421-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Convert the MFD part of Maxim MAX77802 PMIC to DT schema format.  The
example DTS was copied from existing DTS (exynos5800-peach-pi.dts), so
keep the license as GPL-2.0-only.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/mfd/max77802.txt      |  25 ---
 .../bindings/mfd/maxim,max77802.yaml          | 194 ++++++++++++++++++
 MAINTAINERS                                   |   2 +-
 3 files changed, 195 insertions(+), 26 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mfd/max77802.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/maxim,max77802.yaml

diff --git a/Documentation/devicetree/bindings/mfd/max77802.txt b/Documentation/devicetree/bindings/mfd/max77802.txt
deleted file mode 100644
index 09decac20d91..000000000000
--- a/Documentation/devicetree/bindings/mfd/max77802.txt
+++ /dev/null
@@ -1,25 +0,0 @@
-Maxim MAX77802 multi-function device
-
-The Maxim MAX77802 is a Power Management IC (PMIC) that contains 10 high
-efficiency Buck regulators, 32 Low-DropOut (LDO) regulators used to power
-up application processors and peripherals, a 2-channel 32kHz clock outputs,
-a Real-Time-Clock (RTC) and a I2C interface to program the individual
-regulators, clocks outputs and the RTC.
-
-Bindings for the built-in 32k clock generator block and
-regulators are defined in ../clk/maxim,max77802.txt and
-../regulator/max77802.txt respectively.
-
-Required properties:
-- compatible		: Must be "maxim,max77802"
-- reg			: Specifies the I2C slave address of PMIC block.
-- interrupts		: I2C device IRQ line connected to the main SoC.
-
-Example:
-
-	max77802: pmic@9 {
-		compatible = "maxim,max77802";
-		interrupt-parent = <&intc>;
-		interrupts = <26 IRQ_TYPE_NONE>;
-		reg = <0x09>;
-	};
diff --git a/Documentation/devicetree/bindings/mfd/maxim,max77802.yaml b/Documentation/devicetree/bindings/mfd/maxim,max77802.yaml
new file mode 100644
index 000000000000..baa1346ac5d5
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/maxim,max77802.yaml
@@ -0,0 +1,194 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/maxim,max77802.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim MAX77802 Power Management IC
+
+maintainers:
+  - Javier Martinez Canillas <javier@dowhile0.org>
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+
+description: |
+  This is a part of device tree bindings for Maxim MAX77802 Power Management
+  Integrated Circuit (PMIC).
+
+  The Maxim MAX77802 is a Power Management IC which includes voltage and
+  current regulators (10 high efficiency Buck regulators and 32 Low-DropOut
+  (LDO)), RTC and clock outputs.
+
+  The MAX77802 provides two 32.768khz clock outputs that can be controlled
+  (gated/ungated) over I2C.  The clock IDs are defined as preprocessor macros
+  in dt-bindings/clock/maxim,max77802.h.
+
+properties:
+  compatible:
+    const: maxim,max77802
+
+  '#clock-cells':
+    const: 1
+
+  interrupts:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+  regulators:
+    $ref: /schemas/regulator/maxim,max77802.yaml
+    description:
+      List of child nodes that specify the regulators.
+
+  inb1-supply:
+    description: Power supply for buck1
+  inb2-supply:
+    description: Power supply for buck2
+  inb3-supply:
+    description: Power supply for buck3
+  inb4-supply:
+    description: Power supply for buck4
+  inb5-supply:
+    description: Power supply for buck5
+  inb6-supply:
+    description: Power supply for buck6
+  inb7-supply:
+    description: Power supply for buck7
+  inb8-supply:
+    description: Power supply for buck8
+  inb9-supply:
+    description: Power supply for buck9
+  inb10-supply:
+    description: Power supply for buck10
+
+  inl1-supply:
+    description: Power supply for LDO8, LDO15
+  inl2-supply:
+    description: Power supply for LDO17, LDO27, LDO30, LDO35
+  inl3-supply:
+    description: Power supply for LDO3, LDO5, LDO7, LDO7
+  inl4-supply:
+    description: Power supply for LDO10, LDO11, LDO13, LDO14
+  inl5-supply:
+    description: Power supply for LDO9, LDO19
+  inl6-supply:
+    description: Power supply for LDO4, LDO21, LDO24, LDO33
+  inl7-supply:
+    description: Power supply for LDO18, LDO20, LDO28, LDO29
+  inl9-supply:
+    description: Power supply for LDO12, LDO23, LDO25, LDO26, LDO32, LDO34
+  inl10-supply:
+    description: Power supply for LDO1, LDO2
+
+  wakeup-source: true
+
+required:
+  - compatible
+  - '#clock-cells'
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/regulator/maxim,max77802.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pmic@9 {
+            compatible = "maxim,max77802";
+            interrupt-parent = <&gpx3>;
+            interrupts = <1 IRQ_TYPE_NONE>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&max77802_irq>, <&pmic_selb>,
+                        <&pmic_dvs_1>, <&pmic_dvs_2>, <&pmic_dvs_3>;
+            wakeup-source;
+            reg = <0x9>;
+            #clock-cells = <1>;
+
+            inb1-supply = <&tps65090_dcdc2>;
+            inb2-supply = <&tps65090_dcdc1>;
+            inb3-supply = <&tps65090_dcdc2>;
+            inb4-supply = <&tps65090_dcdc2>;
+            inb5-supply = <&tps65090_dcdc1>;
+            inb6-supply = <&tps65090_dcdc2>;
+            inb7-supply = <&tps65090_dcdc1>;
+            inb8-supply = <&tps65090_dcdc1>;
+            inb9-supply = <&tps65090_dcdc1>;
+            inb10-supply = <&tps65090_dcdc1>;
+
+            inl1-supply = <&buck5_reg>;
+            inl2-supply = <&buck7_reg>;
+            inl3-supply = <&buck9_reg>;
+            inl4-supply = <&buck9_reg>;
+            inl5-supply = <&buck9_reg>;
+            inl6-supply = <&tps65090_dcdc2>;
+            inl7-supply = <&buck9_reg>;
+            inl9-supply = <&tps65090_dcdc2>;
+            inl10-supply = <&buck7_reg>;
+
+            regulators {
+                BUCK1 {
+                    regulator-name = "vdd_mif";
+                    regulator-min-microvolt = <800000>;
+                    regulator-max-microvolt = <1300000>;
+                    regulator-always-on;
+                    regulator-boot-on;
+                    regulator-ramp-delay = <12500>;
+                    regulator-state-mem {
+                        regulator-off-in-suspend;
+                    };
+                };
+
+                BUCK2 {
+                    regulator-name = "vdd_arm";
+                    regulator-min-microvolt = <800000>;
+                    regulator-max-microvolt = <1500000>;
+                    regulator-always-on;
+                    regulator-boot-on;
+                    regulator-ramp-delay = <12500>;
+                    regulator-coupled-with = <&buck3_reg>;
+                    regulator-coupled-max-spread = <300000>;
+                    regulator-state-mem {
+                        regulator-off-in-suspend;
+                    };
+                };
+
+                // ...
+
+                BUCK10 {
+                    regulator-name = "vdd_1v8";
+                    regulator-min-microvolt = <1800000>;
+                    regulator-max-microvolt = <1800000>;
+                    regulator-always-on;
+                    regulator-boot-on;
+                    regulator-state-mem {
+                        regulator-on-in-suspend;
+                    };
+                };
+
+                LDO1 {
+                    regulator-name = "vdd_1v0";
+                    regulator-min-microvolt = <1000000>;
+                    regulator-max-microvolt = <1000000>;
+                    regulator-always-on;
+                    regulator-initial-mode = <MAX77802_OPMODE_NORMAL>;
+                    regulator-state-mem {
+                        regulator-on-in-suspend;
+                        regulator-mode = <MAX77802_OPMODE_LP>;
+                    };
+                };
+
+                // ...
+
+                LDO35 {
+                    regulator-name = "ldo_35";
+                    regulator-min-microvolt = <1200000>;
+                    regulator-max-microvolt = <1200000>;
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 5ea5655a29c3..b5e4f14f6768 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11666,7 +11666,7 @@ MAXIM MAX77802 PMIC REGULATOR DEVICE DRIVER
 M:	Javier Martinez Canillas <javier@dowhile0.org>
 L:	linux-kernel@vger.kernel.org
 S:	Supported
-F:	Documentation/devicetree/bindings/*/*max77802.txt
+F:	Documentation/devicetree/bindings/*/*max77802.yaml
 F:	drivers/regulator/max77802-regulator.c
 F:	include/dt-bindings/*/*max77802.h
 
-- 
2.32.0

