Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A29F94F1B56
	for <lists+linux-leds@lfdr.de>; Mon,  4 Apr 2022 23:19:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379611AbiDDVUK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 4 Apr 2022 17:20:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380593AbiDDUjY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 4 Apr 2022 16:39:24 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B74026AC8
        for <linux-leds@vger.kernel.org>; Mon,  4 Apr 2022 13:37:27 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id bn33so14506440ljb.6
        for <linux-leds@vger.kernel.org>; Mon, 04 Apr 2022 13:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8EWmhxYeescuoCv2qecY489ZApW2YrepMt4Bje0oQts=;
        b=XtRO6Fx/fmKs2i6b1ODuN/x3OlLed4vBIORJcGplwAGpxWw1rTqHE8UGCgrUN6hJWf
         DCEaidi9c2pAkn5SVhtyfdipWkxcmjvxYAVykmNvQDF4t+dcl86bCqT4ihxGyflR7vVh
         wiUyBLZL4hn6C+hm4UE/lSH2UYTmhBKe/+3Q2vsraTDfwC7wIXbfKRa/xRPxcMxI2Q9Y
         gat4fx2S4J7ToOZI01e9+EDDozAzFFA3pfcZ2UvnVjaAXUnr2wslwNx+2LHwQnPlblq3
         QYwu0Xb2X2/k/kawMBA0Qui59ToLuOkunJj2DOxlXE7GAi9SuekrgVjD2ibAdq74hjqK
         B3jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8EWmhxYeescuoCv2qecY489ZApW2YrepMt4Bje0oQts=;
        b=jT4MiEXscByWgNEJYwkBg2HpvERUR6qSDWVSsfbD2EEf1+25fdwzq0KFJIH0IMVFG+
         bVo6F8fV//Ly/Y3XiEwAdJZO4u+xuAvYYuanuOpkAaN0wCVcNuZS+HcMvrtHWiP5jy29
         hSyMmA9WAQgd77JSFAFU0H47pNcsZ5Ixtiv5tzb//M6T2FvmoUqtHPBgzkkZcmA+OktI
         559w824rWYfmKuRgafNLcex/f3lwlyomkD5LHooCq3sWvQkQDgRxW4y7NgiAzHfTdvJQ
         Upr4ZKBtLSBF54wObpg9Ykwhk2RMqKRWLPdyfCx4sQ6YOoPJFyLQcO3uRdOEvLtGqdsN
         pgMw==
X-Gm-Message-State: AOAM532xrTBpEvayF1iB3pb3inrlnuxK0QR5sjqTqxFeRv3CafrrprU1
        8V65MYZ49PJZitJ8eS0w4KgdWn6eu1dsjA==
X-Google-Smtp-Source: ABdhPJzKHkHsEZI8v4wcxTfaqUyEuS0DxyKN3vdpdKdh60ERXh+ofmvpzf8iLoQyxkGPpsmsri1Z5g==
X-Received: by 2002:a2e:a408:0:b0:246:35dd:c242 with SMTP id p8-20020a2ea408000000b0024635ddc242mr842848ljn.197.1649104645175;
        Mon, 04 Apr 2022 13:37:25 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id m14-20020a2eb6ce000000b0024afbbbb0c3sm1154650ljo.70.2022.04.04.13.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 13:37:24 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, Antonio Ospite <ao2@ao2.it>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH 1/3] dt-bindings: leds: Add regulator-led binding
Date:   Mon,  4 Apr 2022 22:35:20 +0200
Message-Id: <20220404203522.2068071-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
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
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Collect Rob's ACK
- Rebase on v5.18-rc1
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
2.35.1

