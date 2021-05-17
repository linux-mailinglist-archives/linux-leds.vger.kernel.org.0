Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64D713837E7
	for <lists+linux-leds@lfdr.de>; Mon, 17 May 2021 17:46:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244938AbhEQPrW (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 17 May 2021 11:47:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344258AbhEQPnv (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 17 May 2021 11:43:51 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1FFCC06134C;
        Mon, 17 May 2021 07:36:18 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id b13so1340360pfv.4;
        Mon, 17 May 2021 07:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=c+foEbP8Ys0eNzGlzMVThZeYcnahn6T/Ka4KBWcvRdQ=;
        b=A8aURMCN2xkGHVLH92j6FEt09k2D142xtzBMHk5VE3lM2iER5XUNrMZqRNsObFQJd0
         gTJj/rL4tlNAj/+Hp23TvzcgTiwae89Rpoa6IHgREJMipQs7GW4jYtoI8wgaOmq7IQlF
         VRgTC7iksL0bVyUdbutfhYIo/UX6l2jQTTkiFYAGpnvHtYSAzSYlIOqmPCjp8WhzsAwK
         b4hLXjwz3ewHG+Hllko6guzoem10p++zaSzSygCwTrTr3was66+ludVlwpb4A4khecUJ
         buPENMaB2Jb4a9bYlAThQY3B06YXZCPFr7jKIVmfVOXnbIQdprtR0XisPHrW2mJkR+CN
         KW5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=c+foEbP8Ys0eNzGlzMVThZeYcnahn6T/Ka4KBWcvRdQ=;
        b=CipCKBkwl0Aw+aWhBOVAGqMNf9CczFI7/TaQGWcDf/H64nM7tAs+gwFJDxMkGoS9Fk
         GfZOgNTw2wMwpQB+t0NkZOyTxJp2Vk6GJB4Nj6TW/eFCVQBZRaO5m3kFpP9ahF/YMBcW
         NBN3qR0kWufFJgCaXs0QpHWwr0YQzizFr6JM5hsrxnHuVc9wZIHOOUdaqjXz6GRjjWhy
         k0R9rV/tsTfr+FHW69n3U7aWuT0oHhrJPnz9Pv9zagR/SV9Am2uMalzHMNkbA8k66GDt
         2r6ThvOs2xwSyWAGsMOzjx/y2oxFt9ZoxByKngsBrELHIRKjzLrbuGb4yt/n21F99hOH
         sZWA==
X-Gm-Message-State: AOAM530z+BypTxi1dfbnYaMa0tYccCetHF/NZIGgAUHocFdDDlcmlRoz
        jrfqfWy0eDrj2yxzNDqdtxc=
X-Google-Smtp-Source: ABdhPJx5DmM8IvGVPnYhPuHKzagCDoUajpBuqoDwBZcLadlaMXazUUwlzerbOIk3jlM0SYJcG2nIHA==
X-Received: by 2002:a63:1c6:: with SMTP id 189mr51478088pgb.144.1621262178267;
        Mon, 17 May 2021 07:36:18 -0700 (PDT)
Received: from localhost.localdomain (1-171-3-209.dynamic-ip.hinet.net. [1.171.3.209])
        by smtp.gmail.com with ESMTPSA id f5sm13880259pjp.37.2021.05.17.07.36.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 May 2021 07:36:17 -0700 (PDT)
From:   cy_huang <u0084500@gmail.com>
To:     lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
        daniel.thompson@linaro.org, jingoohan1@gmail.com,
        b.zolnierkie@samsung.com, pavel@ucw.cz, robh+dt@kernel.org
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, cy_huang@richtek.com
Subject: [PATCH v7 2/4] backlight: rt4831: Adds DT binding document for Richtek RT4831 backlight
Date:   Mon, 17 May 2021 22:35:59 +0800
Message-Id: <1621262161-9972-2-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1621262161-9972-1-git-send-email-u0084500@gmail.com>
References: <1621262161-9972-1-git-send-email-u0084500@gmail.com>
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

