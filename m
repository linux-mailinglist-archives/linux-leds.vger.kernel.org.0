Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7138334A181
	for <lists+linux-leds@lfdr.de>; Fri, 26 Mar 2021 07:14:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229993AbhCZGNu (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 26 Mar 2021 02:13:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229961AbhCZGNW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 26 Mar 2021 02:13:22 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05892C0613AA;
        Thu, 25 Mar 2021 23:13:22 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id v10so3881810pgs.12;
        Thu, 25 Mar 2021 23:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=FVpglB48TyMt0jnMkbTyp/bxOC0GS8GgXej79IhFWLE=;
        b=ZRCjqzMzagAfvqKywj3/EBbX5zUSe5hnwb3W6UBI/IKti2POo2D2KHL8diT8aXMPI4
         T/QqW+SfkShIJTMRxfHCYIWxnS1/ikBCovCQPQBWEaY+y4jH4Qqpunhxvy+FB4NsrCPT
         QPgfqgk9Ym9ELneVqiKYEg3bUdrSY8y3Mm6NVbqiY/yoDLOhGoc5gphD0EUy43OETmw4
         9h4iceAN97FFVQn5a2iEhwEInCoT/WGm2u28jzGvW2bFubdH4qYNPKukjxsd1UuSH6Pj
         +GRxrXQ+ehWpzvHCYOAXTZSzF8ZDMRgVDkUOyvG38/0knPxOiAvUhqbSh3uvKv7v032F
         XznA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=FVpglB48TyMt0jnMkbTyp/bxOC0GS8GgXej79IhFWLE=;
        b=jp1XqqrFx9ZHqJW1hhicl1aQH6ifTgkROGygZg5XepC8EVWn0KDS2faNaEMpqPwpz1
         LOHQF0JVcik6j40fg2F0EqtJu0k68Hh3BcoXF4T0Yn0rDLjvxZR4CQ0p868i2lXExXba
         qfR08Z1poci5AJWirfT4nNFToqoieGqzF4ifOD0rnu5rz7wuHpWHLmryxRVjubik/iMn
         s6YIUX1GTRhgy8me6uEVGWbRch0SFVN4rcIk6X0h9iSme0yukTn8XhFqEKDk1r08jBRn
         qmRdkZmFDwMJq/lC21u3FDmyQUePZlU/J0OcCIB7EYgelHHF2a0G1HXtIrBNp5OlQM3p
         41zg==
X-Gm-Message-State: AOAM533W4CjASfW5XRFhzOIhMKxmhM+7pz20GFVWxEbhd38yRRQZWLRy
        EAxLzKEQLayh949b4XKoKIc=
X-Google-Smtp-Source: ABdhPJxTcECHg8Tdvgh1MaMN0+wUROiguJ2yVk0Xnhn7PByGzjvzoyDnuTVWvaYP+64dGbBeYUD+Ag==
X-Received: by 2002:a62:1a08:0:b029:220:da90:9173 with SMTP id a8-20020a621a080000b0290220da909173mr7372604pfa.65.1616739201440;
        Thu, 25 Mar 2021 23:13:21 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:586:ffd8:317d:716e:dd72:9482])
        by smtp.gmail.com with ESMTPSA id 192sm7853684pfa.122.2021.03.25.23.13.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Mar 2021 23:13:20 -0700 (PDT)
From:   cy_huang <u0084500@gmail.com>
To:     pavel@ucw.cz, dmurphy@ti.com, robh+dt@kernel.org
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        cy_huang@richtek.com, devicetree@vger.kernel.org
Subject: [PATCH v3 1/2] leds: rt4505: Add DT binding document for Richtek RT4505
Date:   Fri, 26 Mar 2021 14:13:07 +0800
Message-Id: <1616739188-17719-1-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: ChiYuan Huang <cy_huang@richtek.com>

Add DT binding document for Richtek RT4505 flash LED controller.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes since v3
- Port this patch to led for-next tree.
- Merge Acks in the commit context.
- Reorder the patch series from the docs first.

Changes since v2

- Create flash directory into drvers/leds.
- Coding style fix to meet 80 charactors per line limit.
- Refine the description in the Kconfig help text.
- Change all descriptions for 'led' text to uppercase 'LED'.
---
 .../devicetree/bindings/leds/leds-rt4505.yaml      | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-rt4505.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-rt4505.yaml b/Documentation/devicetree/bindings/leds/leds-rt4505.yaml
new file mode 100644
index 00000000..5b0c74a
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
+  The RT4505 is a flash LED driver that can support up to 375mA and 1.5A for
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

