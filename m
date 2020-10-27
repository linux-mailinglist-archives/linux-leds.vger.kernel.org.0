Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 656FA29A594
	for <lists+linux-leds@lfdr.de>; Tue, 27 Oct 2020 08:35:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2507797AbgJ0Hen (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 27 Oct 2020 03:34:43 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:43277 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2507771AbgJ0Hem (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 27 Oct 2020 03:34:42 -0400
Received: by mail-pf1-f195.google.com with SMTP id a200so399398pfa.10;
        Tue, 27 Oct 2020 00:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=eo2+2vVFsWFA0TzG1ky3V6m2Zfb0OzFIhXcucK1rJs0=;
        b=RzCAcGGT3alxSYsnL//hPRxSFMdXGl1/d64q9QxfWzLMzsfClw27zuoXlFNro32qgr
         URa5BJL+YMae4eimBcDJiPP6/pFM5CH3tkEl6rzZI+I25wZi/aIBTwHNhu7yCVNaSsNA
         A6btne/z/buTRIIdYMj6SujDfi7XI0zpba/g3oxstul3X463tBxD7uJW94vvT/islgZf
         bl8QoeHZ+gdwlyrAgG+moCL76exyKLEsihMRC/FWQ+N40biKzn7Cq2Bj4Bz1rgexf8Ux
         DVnyi25IGZtJR92vP9pmFYOommv3YWbbqST7S6S9UUKB7eY52rFmv1n0VR7EJDBJ8ypB
         CMFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=eo2+2vVFsWFA0TzG1ky3V6m2Zfb0OzFIhXcucK1rJs0=;
        b=OffhYwAtTzODJOunipf7xhA21LTImt51fGooLJll74duYHd8CYmbJwlYZkvfvIMa71
         djswydVRDJF2BudDQ9f3n70T78BqVoTGRtH6kgigNyQtriTUw9mb/gDOSgcMoDKVIs5m
         0hJoF157GUEZZ4oVPWz0oZ60Si93hZQDOuG9pm/5BispEYczfxzyEmf1Hw80SsDSvqtw
         oxqDSaC4mb+y4gtxxVKuYXPfffhs4gr1VgUy5L6YReoOyeq9hEATC1kB+nFfqHb7T47O
         M1e/NBT1bWui7ob3WUgdgeVWz7H1gAr24/CX9I1Crsi8WuoANendSWHlrLIKhTpGXuAk
         SgZg==
X-Gm-Message-State: AOAM530EVPKNwSYzp58gqwkS30L+e6nd9pTgxTvyMpEwT3ugoKtS6nkZ
        PeWWiFbDq2etqLe7IevBaas=
X-Google-Smtp-Source: ABdhPJyOtOWlgJk/ALONkUxEE89GzpUcSSqzF5PFe2c5a30BCACsTDKSKpUf6lYhHlQ+S7FM0615CA==
X-Received: by 2002:a63:1f0f:: with SMTP id f15mr812802pgf.312.1603784081598;
        Tue, 27 Oct 2020 00:34:41 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:569:28be:d128:652a:6a3e:895a])
        by smtp.gmail.com with ESMTPSA id k7sm1065947pfa.184.2020.10.27.00.34.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2020 00:34:40 -0700 (PDT)
From:   cy_huang <u0084500@gmail.com>
To:     pavel@ucw.cz, dmurphy@ti.com, robh+dt@kernel.org
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        cy_huang@richtek.com, devicetree@vger.kernel.org
Subject: [PATCH v1 2/2] leds: rt4505: Add DT binding document for Richtek RT4505
Date:   Tue, 27 Oct 2020 15:34:29 +0800
Message-Id: <1603784069-24114-2-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1603784069-24114-1-git-send-email-u0084500@gmail.com>
References: <1603784069-24114-1-git-send-email-u0084500@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: ChiYuan Huang <cy_huang@richtek.com>

Add DT binding document for Richtek RT4505 flash led controller.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
 .../devicetree/bindings/leds/leds-rt4505.yaml      | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-rt4505.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-rt4505.yaml b/Documentation/devicetree/bindings/leds/leds-rt4505.yaml
new file mode 100644
index 00000000..da1681a
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-rt4505.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/leds-rt4505.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Richtek RT4505 Single Channel LED Driver
+
+maintainers:
+  - ChiYuan Huang <cy_huang@richtek.com>
+
+description: |
+  The RT4505 is a flash led driver that can support up to 375mA and 1.5A for
+  torch and flash mode, respectively.
+
+  The data sheet can be found at:
+    https://www.richtek.com/assets/product_file/RT4505/DS4505-02.pdf
+
+properties:
+  compatible:
+    const: richtek,rt4505
+
+  reg:
+    description: I2C slave address of the controller.
+    maxItems: 1
+
+  led:
+    type: object
+    $ref: common.yaml#
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/leds/common.h>
+
+    i2c0 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      led-controller@63 {
+        compatible = "richtek,rt4505";
+        reg = <0x63>;
+
+        rt4505_flash: led {
+          function = LED_FUNCTION_FLASH;
+          color = <LED_COLOR_ID_WHITE>;
+          led-max-microamp = <375000>;
+          flash-max-microamp = <1500000>;
+          flash-max-timeout-us = <800000>;
+        };
+      };
+    };
-- 
2.7.4

