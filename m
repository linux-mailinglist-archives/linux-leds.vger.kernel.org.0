Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CF5C252C92
	for <lists+linux-leds@lfdr.de>; Wed, 26 Aug 2020 13:38:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728989AbgHZLii (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 26 Aug 2020 07:38:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729018AbgHZLh5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 26 Aug 2020 07:37:57 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18F91C0613ED;
        Wed, 26 Aug 2020 04:37:35 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id v16so758328plo.1;
        Wed, 26 Aug 2020 04:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Vt41UNzwhd7H8iOJWWQaJ2po5o89qJA4//y1ixZpDJA=;
        b=f2B57zh/EGUaA7PQLarcSXY8LmHSM4t/5IYJRkigwlX2JbvU4mCjJbK99OdAz5Fx9I
         xjmHmh9I8H1AHvVdd2PwLXb0gFNV/mooRXS2OwqCi5+sGqi39TovZMUZfMDS286/VsS/
         xMJzF+yEA+5BhFqoAotNw/qi5ik02UPO+cDWl6MH0W9R0uiTGXjliFJEZbh91OL0MA4k
         kWvRguE7ObqrX2wgJUeHpv0AKoGz+KLfMXfSCDMOjfUCVsmql4n3K7H7olz/rVwk1Hzi
         ZmAeKUuIDxvF7WPhTifjjM4xGxN5zt8G9UJZVmK6p65sCH7wHudUKFXNZ8yM/VUC28qN
         ewgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Vt41UNzwhd7H8iOJWWQaJ2po5o89qJA4//y1ixZpDJA=;
        b=STciMdolYsDbj5UxKTYrb3KEILfAsQvaWioFYnyPVW9IXo6waLKL+Jry8RtQniJfr9
         tDr+N9TABaWGC0ywahSeTELhpG1XuQHCYn9dTNPAxVhUwW8rDwQVtRjvgpZy/cssz1K4
         1vPsPB1cNyMYKxhrKxKlgXVlAkowKmOvkpW77aXJNJSGv1/CLoBOk0uMO/9CxaNOqJh7
         rx983QArY6YSYwz2Yky07QO1vZwIyEZAG1FOA9+TbveYezvjZstHSWmdivMcX6vVL6vs
         wFSajKUom0mfZvagZPmSstgYZ89gPLrxyr4wy3z6Jpi+wai1txkNoeGmMOetTAj1bZxc
         0ffA==
X-Gm-Message-State: AOAM531Qfll3PYHZwBj/s8L06OR+nrkLPOMcM7gHpyc7kQq+n/tY+agd
        ViKEtld11htoOS7ZtSw5CPD+c59MI0I=
X-Google-Smtp-Source: ABdhPJzBGZnfnxqRta01CVr9x9ijWsljVtnE050DIPGOxgcWkmTkxadvUO5k7vIIYadCfhHoJ3ZuRg==
X-Received: by 2002:a17:90a:9483:: with SMTP id s3mr5694994pjo.98.1598441854639;
        Wed, 26 Aug 2020 04:37:34 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:56a:2197:d2eb:7e49:dfa1:a882])
        by smtp.gmail.com with ESMTPSA id x5sm2591047pfj.1.2020.08.26.04.37.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Aug 2020 04:37:34 -0700 (PDT)
From:   Gene Chen <gene.chen.richtek@gmail.com>
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz, matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: [PATCH 2/2] dt-bindings: leds: Add bindings for MT6360 LED
Date:   Wed, 26 Aug 2020 19:37:20 +0800
Message-Id: <1598441840-15226-3-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598441840-15226-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1598441840-15226-1-git-send-email-gene.chen.richtek@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Gene Chen <gene_chen@richtek.com>

Add bindings document for LED support on MT6360 PMIC

Signed-off-by: Gene Chen <gene_chen@richtek.com>
---
 .../devicetree/bindings/leds/leds-mt6360.yaml      | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-mt6360.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-mt6360.yaml b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
new file mode 100644
index 0000000..4598be5
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/leds-mt6360.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LED driver for MT6360 PMIC from MediaTek Integrated.
+
+maintainers:
+  - Gene Chen <gene_chen@richtek.com>
+
+description: |
+  This module is part of the MT6360 MFD device. For more details
+  see Documentation/devicetree/bindings/mfd/mt6360.yaml.
+
+  The LED controller is represented as a sub-node of the PMIC node on
+  the device tree.
+
+  This device has six current sinks.
+
+properties:
+  compatible:
+    const: mediatek,mt6360-led
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^led@[0-5]$":
+    type: object
+    description: |
+      Properties for a single LED.
+
+    properties:
+      reg:
+        description:
+          Index of the LED.
+        minimum: 0
+        maximum: 5
+
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+additionalProperties: false
+
+...
-- 
2.7.4

