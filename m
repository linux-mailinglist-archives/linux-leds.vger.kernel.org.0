Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 698B34BCB2E
	for <lists+linux-leds@lfdr.de>; Sun, 20 Feb 2022 00:58:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230140AbiBSX6j (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 19 Feb 2022 18:58:39 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:49074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229677AbiBSX6i (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 19 Feb 2022 18:58:38 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30D6738A5
        for <linux-leds@vger.kernel.org>; Sat, 19 Feb 2022 15:58:18 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id e8so1520606ljj.2
        for <linux-leds@vger.kernel.org>; Sat, 19 Feb 2022 15:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=davTlAz72/o8PzH0gfbXYTV3qnPMMT+uYMyKepr6G5I=;
        b=gpIzCawQ7726/hWrK4YYTMqxVQSQ+isU4ZSHdyFlx9TkwfZokyi796JG+kQp7csEtL
         iyeCjl9TlHFyuauhIpMANmAcGt/wNX+YNM8mr3A2NKiinY1gGYRmcIXwH+tjg0C7Zzc+
         MbB6xGg/bWmyN57/OdGmbJ2q+WCdkq5+Gnpnetp1Frlvj+hxJSpEZTKm2Yo5wbjdUhjv
         bAP4M8+FImn/IbXBT/2pQaAbxnr9RXIBS+QZmKhvDwwovyTZYvj04DNpsekP63NlQ0Ip
         iV3w8xhQs4OWGlIx6fTA4T+ULsylCnBleh7tNYm47hRfY+D7Qg+Yfa/zoYairLKOO95s
         6VPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=davTlAz72/o8PzH0gfbXYTV3qnPMMT+uYMyKepr6G5I=;
        b=UVoRi3yTq2vbH+VOmhJ4ZreV3vqFtdDAcBgM+VJpuNJSGCDMHIqYwB596WQhChsRf4
         KbPn78dyHLrYdiY1YrxkPG9fcnF99inS/pYNPjVZZQA9U9dZzNOZBZEpto2Ue8lRLIwO
         Y4XlEiMN23LB4y4KqT4dGaBPUZrrMV5oxn45goFGBNZ7xsf8UW7ubpbx5osxwIrikDeP
         yUeH8HwgVkJCZADvKotQzDhtgTy9aPEqP5NVyiET85Sm5Gl4HjKk1W84LyLfmkuUbqqe
         XMzhSkKVc6JqAZ30UFq6xhkHlTVKPGxC5zhMNYVk8KWOpLB1E68QKDU+CbZhvKjU/btB
         obbw==
X-Gm-Message-State: AOAM533spAtHtxbHxbxnz4QXDlywH+wPHzap0jYZQav47J20TXAF+RzP
        TTdG4TCwaPLutR7GyzFe/B1WNw==
X-Google-Smtp-Source: ABdhPJyQFOkTeWyLkS8fTh2/rw4kF64sCDC5TAs3PjIg8YLy+/XN839nIdoHfVIaCJyc1OHZtauocg==
X-Received: by 2002:a05:651c:198f:b0:244:4deb:70d6 with SMTP id bx15-20020a05651c198f00b002444deb70d6mr9980225ljb.167.1645315096519;
        Sat, 19 Feb 2022 15:58:16 -0800 (PST)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id q34sm814106lje.121.2022.02.19.15.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Feb 2022 15:58:16 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, Antonio Ospite <ao2@ao2.it>
Subject: [PATCH 1/3] dt-bindings: leds: Add regulator-led binding
Date:   Sun, 20 Feb 2022 00:56:05 +0100
Message-Id: <20220219235607.1613686-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The regulator is a LED connected directly to a regulator and with
its brightness controlled by the voltage of the regulator.

Cc: devicetree@vger.kernel.org
Cc: Antonio Ospite <ao2@ao2.it>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../bindings/leds/regulator-led.yaml          | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/regulator-led.yaml

diff --git a/Documentation/devicetree/bindings/leds/regulator-led.yaml b/Documentation/devicetree/bindings/leds/regulator-led.yaml
new file mode 100644
index 000000000000..3e020d700c00
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/regulator-led.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/regulator-led.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Device Tree Bindings for Regulator LEDs
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+description: |
+  Regulator LEDs are powered by a single regulator such that they can
+  be turned on or off by enabling or disabling the regulator. The available
+  brightness settings will be inferred from the available voltages on the
+  regulator, and any constraints on the voltage or current will need to be
+  specified on the regulator.
+
+allOf:
+  - $ref: common.yaml#
+
+properties:
+  $nodename:
+    pattern: '^led.*$'
+
+  compatible:
+    const: regulator-led
+
+  vled-supply:
+    description:
+      The regulator controlling the current to the LED.
+
+  function: true
+  color: true
+  linux,default-trigger: true
+  default-state: true
+
+required:
+  - compatible
+  - vled-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/leds/common.h>
+
+    led-heartbeat {
+        compatible = "regulator-led";
+        vled-supply = <&regulator>;
+        function = LED_FUNCTION_STATUS;
+        color = <LED_COLOR_ID_BLUE>;
+        linux,default-trigger = "heartbeat";
+    };
+...
-- 
2.34.1

