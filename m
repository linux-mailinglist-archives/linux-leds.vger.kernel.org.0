Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C823C303FA1
	for <lists+linux-leds@lfdr.de>; Tue, 26 Jan 2021 15:05:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405622AbhAZOE5 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 26 Jan 2021 09:04:57 -0500
Received: from mail-40134.protonmail.ch ([185.70.40.134]:13562 "EHLO
        mail-40134.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405609AbhAZOEz (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 26 Jan 2021 09:04:55 -0500
Date:   Tue, 26 Jan 2021 14:04:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1611669852;
        bh=mbQbonKTWOJG/8gSURwb2HOD/90QOtBxSCKvG2gI4So=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=asITbJ20piki8V4dq2FdGySHW4Jz9wuRLKpSqWyrGCxQPMshDoQ/XcALmQeSuyzz4
         P0eiekzy+SfZaNA9+NNENnX04w/6I5M7a2MEm894adRHiGdTYySJLBhQrACjywokPB
         X8I9M7BUJXOly0k33ZSgzwMDhwhXkAUoelhSjv/w=
To:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
From:   =?utf-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= 
        <nfraprado@protonmail.com>
Cc:     linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Brian Masney <masneyb@onstation.org>,
        Luca Weiss <luca@z3ntu.xyz>,
        Russell King <linux@armlinux.org.uk>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        lkcamp@lists.libreplanetbr.org, andrealmeid@collabora.com
Reply-To: =?utf-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= 
          <nfraprado@protonmail.com>
Subject: [PATCH v2 1/4] dt-bindings: leds: Add binding for qcom-spmi-flash
Message-ID: <20210126140240.1517044-2-nfraprado@protonmail.com>
In-Reply-To: <20210126140240.1517044-1-nfraprado@protonmail.com>
References: <20210126140240.1517044-1-nfraprado@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add devicetree binding for QCOM SPMI Flash LEDs, which are part of
PM8941, and are used both as lantern and camera flash.

Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@protonmail.com>
---
Changes in v2:
- Add this commit

 .../bindings/leds/leds-qcom-spmi-flash.yaml   | 94 +++++++++++++++++++
 .../dt-bindings/leds/leds-qcom-spmi-flash.h   | 15 +++
 2 files changed, 109 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-qcom-spmi-f=
lash.yaml
 create mode 100644 include/dt-bindings/leds/leds-qcom-spmi-flash.h

diff --git a/Documentation/devicetree/bindings/leds/leds-qcom-spmi-flash.ya=
ml b/Documentation/devicetree/bindings/leds/leds-qcom-spmi-flash.yaml
new file mode 100644
index 000000000000..169716e14f67
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-qcom-spmi-flash.yaml
@@ -0,0 +1,94 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/leds-qcom-spmi-flash.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SPMI Flash LEDs
+
+maintainers:
+  - N=C3=ADcolas F. R. A. Prado <nfraprado@protonmail.com>
+
+description: |
+  The Qualcomm SPMI Flash LEDs are part of Qualcomm PMICs and are used pri=
marily
+  as a camera or video flash. They can also be used as a lantern when on t=
orch
+  mode.
+  The PMIC is connected to Host processor via SPMI bus.
+
+properties:
+  compatible:
+    const: qcom,spmi-flash
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
+patternProperties:
+  "^led[0-1]$":
+    type: object
+    $ref: common.yaml#
+
+    properties:
+      qcom,clamp-curr:
+        description: current to clamp at, in uA
+        $ref: /schemas/types.yaml#definitions/uint32
+
+      qcom,headroom:
+        description: |
+          headroom to use. Use one of QCOM_SPMI_FLASH_HEADROOM_* defined i=
n
+          include/dt-bindings/leds/leds-qcom-spmi-flash.h
+        $ref: /schemas/types.yaml#definitions/uint32
+        minimum: 0
+        maximum: 3
+
+      qcom,startup-dly:
+        description: |
+          delay before flashing. Use one of QCOM_SPMI_FLASH_STARTUP_DLY_*
+          defined in include/dt-bindings/leds/leds-qcom-spmi-flash.h
+        $ref: /schemas/types.yaml#definitions/uint32
+        minimum: 0
+        maximum: 3
+
+      qcom,safety-timer:
+        description: include for safety timer use, otherwise watchdog time=
r will be used
+        type: boolean
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
+    #include <dt-bindings/leds/leds-qcom-spmi-flash.h>
+
+    qcom,leds@d300 {
+        compatible =3D "qcom,spmi-flash";
+        reg =3D <0xd300 0x100>;
+        flash-boost-supply =3D <&pm8941_5vs1>;
+        torch-boost-supply =3D <&pm8941_5v>;
+
+        led0 {
+            led-sources =3D <0>;
+            function =3D LED_FUNCTION_FLASH;
+            color =3D <LED_COLOR_ID_WHITE>;
+            led-max-microamp =3D <200000>;
+            flash-max-microamp =3D <1000000>;
+            flash-max-timeout-us =3D <1280000>;
+            default-state =3D "off";
+            qcom,clamp-curr =3D <200000>;
+            qcom,headroom =3D <QCOM_SPMI_FLASH_HEADROOM_500MV>;
+            qcom,startup-dly =3D <QCOM_SPMI_FLASH_STARTUP_DLY_128US>;
+            qcom,safety-timer;
+        };
+    };
+...
diff --git a/include/dt-bindings/leds/leds-qcom-spmi-flash.h b/include/dt-b=
indings/leds/leds-qcom-spmi-flash.h
new file mode 100644
index 000000000000..8bd54a8e831d
--- /dev/null
+++ b/include/dt-bindings/leds/leds-qcom-spmi-flash.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _DT_BINDINGS_LEDS_QCOM_SPMI_FLASH_H
+#define _DT_BINDINGS_LEDS_QCOM_SPMI_FLASH_H
+
+#define QCOM_SPMI_FLASH_HEADROOM_250MV=090
+#define QCOM_SPMI_FLASH_HEADROOM_300MV=091
+#define QCOM_SPMI_FLASH_HEADROOM_400MV=092
+#define QCOM_SPMI_FLASH_HEADROOM_500MV=093
+
+#define QCOM_SPMI_FLASH_STARTUP_DLY_10US=090
+#define QCOM_SPMI_FLASH_STARTUP_DLY_32US=091
+#define QCOM_SPMI_FLASH_STARTUP_DLY_64US=092
+#define QCOM_SPMI_FLASH_STARTUP_DLY_128US=093
+
+#endif
--=20
2.30.0


