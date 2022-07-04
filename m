Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37658564D1A
	for <lists+linux-leds@lfdr.de>; Mon,  4 Jul 2022 07:40:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233027AbiGDFkb (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 4 Jul 2022 01:40:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231436AbiGDFkN (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 4 Jul 2022 01:40:13 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB1CF7667;
        Sun,  3 Jul 2022 22:39:53 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id v126so7964395pgv.11;
        Sun, 03 Jul 2022 22:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZBFds6olkH7qZWoO3BcF5jnp49SAncP60CSiK32nvCU=;
        b=ghNOEPKfW/M7m5HM4dYGeASvfcvcu8tR3I9lSRY/mX2exs/qAsP7+hQu8z0Jq2sH+g
         PevP2yOfgvyAoRpCblNCliFPwxd3Q9GNxuK7ZFQjUSFDA21mWoXzgrUntgBPAfN6rb9z
         tA4ST2OpyzlVrguhxGijOhgZbKrTfC7nTyb50T41oeU2ugCxKrNj73JnoWnssIDSLkL4
         5OH8BZILuCS5slgVW8rQNv2RGNazxPKs172ETLIOuXr4hPqFMz+JMBwe7LAao3IaNVo6
         6pOEVj+V4yHLVv5WWbwqjIURYYhfBJ6s4+vLOO96roMtrpuLOoVPCTAOt2ajZDwKIawC
         TvQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZBFds6olkH7qZWoO3BcF5jnp49SAncP60CSiK32nvCU=;
        b=ILu+gndjm3Flx2VxRmZEDS4JE91gzqEiyTtKPULA+ggbtPKD6xakWNsySvFgct1Z7m
         GvT2v70dR9daLQrCDKL0pt5EQscZ7y5iW3UCLLSlZAgbkh7H5/TvOIYLw0wORnAsYRoe
         8BldX66N6o9LGW8ESgC2K7F8m+oT8tL8hna/n2Tp+ehU8nR6L2CBKZtKb6lhhEGXCJ1E
         QbXf66+p8mT9RJsVzbWLxYnGYOfQn/uo0Mbxmiv3vKifFsu73J1NyrE2oTpo3lfUdHn1
         xoMKyF/3nDqibSbR0shN13tdVKL61HuA9e/l5pxWJF3vFOPimD3fjn6QdRTOLhIHyhLN
         vyVg==
X-Gm-Message-State: AJIora+L+OIVEpCicCALyDPAQsTNrxL9IgtK9RZ+2cKG/eJa7TUOXZcx
        Syv4ldHCukFvs4gT4D36NH4=
X-Google-Smtp-Source: AGRyM1vZ/A+Vp7yMvTtkW1G5gpiZdY17tzZRcpC8TGWh/YaaI0JZwzDLX2rNEOcvJ6ZApE0NroUE6w==
X-Received: by 2002:a05:6a00:140a:b0:4e0:54d5:d01 with SMTP id l10-20020a056a00140a00b004e054d50d01mr34348533pfu.20.1656913192917;
        Sun, 03 Jul 2022 22:39:52 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-4-255.emome-ip.hinet.net. [42.72.4.255])
        by smtp.gmail.com with ESMTPSA id h24-20020a635318000000b0040dffa7e3d7sm13904507pgb.16.2022.07.03.22.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 22:39:52 -0700 (PDT)
From:   ChiaEn Wu <peterwu.pub@gmail.com>
To:     lee.jones@linaro.org, daniel.thompson@linaro.org,
        jingoohan1@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
        sre@kernel.org, chunfeng.yun@mediatek.com,
        gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
        lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, deller@gmx.de
Cc:     chiaen_wu@richtek.com, alice_chen@richtek.com,
        cy_huang@richtek.com, dri-devel@lists.freedesktop.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org,
        szunichen@gmail.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 04/13] dt-bindings: leds: Add Mediatek MT6370 flashlight
Date:   Mon,  4 Jul 2022 13:38:52 +0800
Message-Id: <20220704053901.728-5-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220704053901.728-1-peterwu.pub@gmail.com>
References: <20220704053901.728-1-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Alice Chen <alice_chen@richtek.com>

Add Mediatek MT6370 flashlight binding documentation.

Signed-off-by: Alice Chen <alice_chen@richtek.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/leds/mediatek,mt6370-flashlight.yaml  | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml

diff --git a/Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml b/Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml
new file mode 100644
index 0000000..e9d02ed
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/mediatek,mt6370-flashlight.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Flash LED driver for MT6370 PMIC from MediaTek Integrated.
+
+maintainers:
+  - Alice Chen <alice_chen@richtek.com>
+
+description: |
+  This module is part of the MT6370 MFD device.
+  Add MT6370 flash LED driver include 2-channel flash LED support Torch/Strobe Mode.
+
+properties:
+  compatible:
+    const: mediatek,mt6370-flashlight
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^led@[0-1]$":
+    type: object
+    $ref: common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        enum: [0, 1]
+
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
-- 
2.7.4

