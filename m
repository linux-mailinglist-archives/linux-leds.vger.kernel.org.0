Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B8F637C897
	for <lists+linux-leds@lfdr.de>; Wed, 12 May 2021 18:43:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234465AbhELQLD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 12 May 2021 12:11:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235116AbhELPte (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 12 May 2021 11:49:34 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 713AAC061233;
        Wed, 12 May 2021 08:21:53 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id h16so5994248pfk.0;
        Wed, 12 May 2021 08:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=c+foEbP8Ys0eNzGlzMVThZeYcnahn6T/Ka4KBWcvRdQ=;
        b=lsGoymjiuS8L1lqR1iF+HwlhNFwKfefBsVn5YYo4Ajpr5LNOpOQecnoI6X/UmpoSPN
         ryQ7BaDlF/YV7tR6x+8dddCNmG19qGAbm6fyFd1CVFAWNI5Otxkrl7X5bW3FfD9XWTu/
         gppA3716+TvDZGW3TGbRl6FDsrzMZmwIFxFOwwZhB++mRR+K1pD0//bCdq7TkfiLCCVs
         D15i/yHywgOW3IKqTS0rh5AfMTZ/5bm8wDhLexxa0gtsh+XAxmKFucweRW5zg2oHBQQ9
         EitiBMJEhcUG5hlwWYslgIeILK8EPO8KtN+XftNTAMwgp907Az18o2UloRCaLsQYgFx9
         XNsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=c+foEbP8Ys0eNzGlzMVThZeYcnahn6T/Ka4KBWcvRdQ=;
        b=gjKUsDjaJwMYDt1kZ6w9IeMCSzlwqE0XeKk8yaf6ABTmpk4Ki1WsLDTF1Q0RdfgJpy
         nArmn7L1Gi31V4F+J5BRKgIvXO6agNIMYhc7vHi240a3gvnugRosZ0xmaPcAS2YLG8Y5
         Rsh6T9CRRL+Mzy1iggMuEAthuLPjJ6Z+jr5Pe6EjV4zI6WZrRtcC6zvYqSXlrxey2dCE
         xWQk1G7flAEte4AEU/MRGx1bBbmPXvVkV1I5c+plpAj6K9NFfF9VvW3kxnLUKUQzVRcJ
         IRBkdJ7UslaQ1RgWRelpdt+bxizhIbyJeCfSOzzfCwH7ut2mPuiDZ6zhjvlE/gB1iL/7
         bK8A==
X-Gm-Message-State: AOAM532kugw+XDeSfB7I2Gf+gAkS34tdvTxFZcBpk9nGWcD6mrzx9Obj
        ytYipd9XZDiA37+BtJu1wao=
X-Google-Smtp-Source: ABdhPJwDM/0Ps4RrzDCgoAHI13EfSPQv6Gm/TNn1RsA5CmIs2+S9UMN/Dli8avYcOmXuHBEur9/K5Q==
X-Received: by 2002:a62:4e96:0:b029:2c5:3067:90ab with SMTP id c144-20020a624e960000b02902c5306790abmr13036928pfb.38.1620832912885;
        Wed, 12 May 2021 08:21:52 -0700 (PDT)
Received: from localhost.localdomain (1-171-3-209.dynamic-ip.hinet.net. [1.171.3.209])
        by smtp.gmail.com with ESMTPSA id t133sm228633pgb.0.2021.05.12.08.21.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 May 2021 08:21:52 -0700 (PDT)
From:   cy_huang <u0084500@gmail.com>
To:     lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
        daniel.thompson@linaro.org, jingoohan1@gmail.com,
        b.zolnierkie@samsung.com, pavel@ucw.cz, robh+dt@kernel.org
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, cy_huang@richtek.com
Subject: [PATCH v7 2/4] backlight: rt4831: Adds DT binding document for Richtek RT4831 backlight
Date:   Wed, 12 May 2021 23:21:38 +0800
Message-Id: <1620832900-8347-2-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1620832900-8347-1-git-send-email-u0084500@gmail.com>
References: <1620832900-8347-1-git-send-email-u0084500@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: ChiYuan Huang <cy_huang@richtek.com>

Adds DT binding document for Richtek RT4831 backlight.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
---
since v7
- Add allOf property refer to common.yaml.
- Remove default-brightness/max-brightness description and refer string.
---
 .../leds/backlight/richtek,rt4831-backlight.yaml   | 62 ++++++++++++++++++++++
 include/dt-bindings/leds/rt4831-backlight.h        | 23 ++++++++
 2 files changed, 85 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml
 create mode 100644 include/dt-bindings/leds/rt4831-backlight.h

diff --git a/Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml
new file mode 100644
index 00000000..e0ac686
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/backlight/richtek,rt4831-backlight.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Richtek RT4831 Backlight
+
+maintainers:
+  - ChiYuan Huang <cy_huang@richtek.com>
+
+description: |
+  RT4831 is a mutifunctional device that can provide power to the LCD display
+  and LCD backlight.
+
+  For the LCD backlight, it can provide four channel WLED driving capability.
+  Each channel driving current is up to 30mA
+
+  Datasheet is available at
+  https://www.richtek.com/assets/product_file/RT4831A/DS4831A-05.pdf
+
+allOf:
+  - $ref: common.yaml#
+
+properties:
+  compatible:
+    const: richtek,rt4831-backlight
+
+  default-brightness:
+    minimum: 0
+    maximum: 2048
+
+  max-brightness:
+    minimum: 0
+    maximum: 2048
+
+  richtek,pwm-enable:
+    description: |
+      Specify the backlight dimming following by PWM duty or by SW control.
+    type: boolean
+
+  richtek,bled-ovp-sel:
+    description: |
+      Backlight OVP level selection, currently support 17V/21V/25V/29V.
+    $ref: /schemas/types.yaml#/definitions/uint8
+    default: 1
+    minimum: 0
+    maximum: 3
+
+  richtek,channel-use:
+    description: |
+      Backlight LED channel to be used.
+      BIT 0/1/2/3 is used to indicate led channel 1/2/3/4 enable or disable.
+    $ref: /schemas/types.yaml#/definitions/uint8
+    minimum: 1
+    maximum: 15
+
+required:
+  - compatible
+  - richtek,channel-use
+
+additionalProperties: false
diff --git a/include/dt-bindings/leds/rt4831-backlight.h b/include/dt-bindings/leds/rt4831-backlight.h
new file mode 100644
index 00000000..125c635
--- /dev/null
+++ b/include/dt-bindings/leds/rt4831-backlight.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * This header provides constants for rt4831 backlight bindings.
+ *
+ * Copyright (C) 2020, Richtek Technology Corp.
+ * Author: ChiYuan Huang <cy_huang@richtek.com>
+ */
+
+#ifndef _DT_BINDINGS_RT4831_BACKLIGHT_H
+#define _DT_BINDINGS_RT4831_BACKLIGHT_H
+
+#define RT4831_BLOVPLVL_17V	0
+#define RT4831_BLOVPLVL_21V	1
+#define RT4831_BLOVPLVL_25V	2
+#define RT4831_BLOVPLVL_29V	3
+
+#define RT4831_BLED_CH1EN	(1 << 0)
+#define RT4831_BLED_CH2EN	(1 << 1)
+#define RT4831_BLED_CH3EN	(1 << 2)
+#define RT4831_BLED_CH4EN	(1 << 3)
+#define RT4831_BLED_ALLCHEN	((1 << 4) - 1)
+
+#endif /* _DT_BINDINGS_RT4831_BACKLIGHT_H */
-- 
2.7.4

