Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B62F824272E
	for <lists+linux-leds@lfdr.de>; Wed, 12 Aug 2020 11:07:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726695AbgHLJHW (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 12 Aug 2020 05:07:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727061AbgHLJHW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 12 Aug 2020 05:07:22 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69C7FC061787
        for <linux-leds@vger.kernel.org>; Wed, 12 Aug 2020 02:07:21 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id h19so1362686ljg.13
        for <linux-leds@vger.kernel.org>; Wed, 12 Aug 2020 02:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t7cpfjcHtDHnwaPBBHF6z2YVNppEhyu7a7r8Eo2vTf8=;
        b=XdScEtS9GfoaxLnDQMiuBSmxXLy2IuRtYlnwb+sCkNgVqyATKyej4FweOmqFRX9UiZ
         tW3PZb8EVnA25e7lpon/YDc9+j8mn/iIYnnYzYnaMXU+rVebnu14Y7ngP0+Oo/yZRWdI
         oIzmimPplM4cKANibNhXGBZAcfxUD+x3lEc1/rlmspth1alhZgJN6Uv3E8fkVEPyXZAo
         VAHRsKovjPu7d+FCyxbwSvN0rMXdd5wx8IOrlCdKdZAvCoPLEM6+Q/ZD+3jQTlHMdh9m
         6rB8EQf8byp8cKfMVquuLO+aQ/4WGALOTIUJio3jh4E9Cr0BAqKrXBrhDB/NhnLAAV8a
         gwOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t7cpfjcHtDHnwaPBBHF6z2YVNppEhyu7a7r8Eo2vTf8=;
        b=P8GcCA0/k74vbheYV/vM6opldtYZ05DWRHexGL2SYIF3PBGgeB+vPAGkW5RmNawsu2
         mCe21EWJpIcJYFHy/EnzjjHMR059RaOzU6QqSo2dFYVkjMlFvy6lShD7HdDwVqA+fP+G
         x4NlWCpkxYxdZE/YZ58tBvif974qetXtBZUYXF6XWeqMz1mpq5sVdCzGMviPfH1862zf
         Mqd9emqJOHcNqXQNF8WAiZT7Ua6kGwRex3lZYS1PwBmT8n7evS5SZvh76nQ/m6VEMvlO
         lzN9M5ib0DHSaj/z55NuCS9rRszMcMagZ+TQuU6Uq7/E3sem7U9b/5DUBPSs6KzeM0Fy
         BIPA==
X-Gm-Message-State: AOAM533TtVNbPuY9qrwUqBOWODp8TvwcjvPalN+6BSObCrWh5GvbaZdG
        rKJ0nl8H4kFplWNQg9AhD3pjLQ==
X-Google-Smtp-Source: ABdhPJxBEtVvf5OqH1WJEI9KjtZWUXh4iSaCHjlHFv1XwLfsmWZiGITNhV//KKl5W0tJd+rRXy2CsQ==
X-Received: by 2002:a05:651c:1293:: with SMTP id 19mr4639969ljc.427.1597223239940;
        Wed, 12 Aug 2020 02:07:19 -0700 (PDT)
Received: from localhost.bredbandsbolaget (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id s4sm305346lja.124.2020.08.12.02.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 02:07:19 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     linux-leds@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        newbytee@protonmail.com, Stephan Gerhold <stephan@gerhold.net>,
        devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: leds: Add DT binding for Richtek RT8515
Date:   Wed, 12 Aug 2020 11:07:10 +0200
Message-Id: <20200812090711.2644688-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add a YAML devicetree binding for the Richtek RT8515
dual channel flash/torch LED driver.

Cc: newbytee@protonmail.com
Cc: Stephan Gerhold <stephan@gerhold.net>
Cc: devicetree@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../bindings/leds/richtek,rt8515.yaml         | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/richtek,rt8515.yaml

diff --git a/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml b/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml
new file mode 100644
index 000000000000..579ef8a2e40a
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/richtek,rt8515.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Richtek RT8515 1.5A dual channel LED driver
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+description: |
+  The Richtek RT8515 is a dual channel (two mode) LED driver that
+  supports driving a white LED in flash or torch mode.
+
+properties:
+  compatible:
+    const: richtek,rt8515
+
+  enf-gpios:
+    maxItems: 1
+    description: A connection to the 'ENF' (enable flash) pin.
+
+  ent-gpios:
+    maxItems: 1
+    description: A connection to the 'ENT' (enable torch) pin.
+
+  led:
+    type: object
+    $ref: common.yaml#
+
+required:
+  - compatible
+  - ent-gpios
+  - enf-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/leds/common.h>
+
+    led-controller {
+        compatible = "richtek,rt8515";
+        enf-gpios = <&gpio4 12 GPIO_ACTIVE_HIGH>;
+        ent-gpios = <&gpio4 13 GPIO_ACTIVE_HIGH>;
+
+        led {
+            function = LED_FUNCTION_FLASH;
+            color = <LED_COLOR_ID_WHITE>;
+            flash-max-timeout-us = <250000>;
+        };
+    };
-- 
2.26.2

