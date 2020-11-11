Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4417A2AE55E
	for <lists+linux-leds@lfdr.de>; Wed, 11 Nov 2020 02:14:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732568AbgKKBOZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 10 Nov 2020 20:14:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732123AbgKKBOY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 10 Nov 2020 20:14:24 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1AA5C0613D1
        for <linux-leds@vger.kernel.org>; Tue, 10 Nov 2020 17:14:23 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id r9so844259lfn.11
        for <linux-leds@vger.kernel.org>; Tue, 10 Nov 2020 17:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K9XBUYhR2UM3o5JW2bLsoKZhteJffpc0EMzzkZ12vrU=;
        b=PqWe0YWuTcOTlgUfpZFss7Jov1FIYRzUvvdoVxG+fHvnGDpWZ1V5zg3/Jw4zzy0D7f
         NDLUnTW8HfsM5IfYWcrZj0JTEp+m7RNX23gVM5ZFSojdvUhdswtkQog/NBbSFPoMGdYI
         5d+CrTzDDPzp1kYGLPkkRKoLjc+7iaMFDJwB4ChFPuhqXkMzXf5EQUoWU46nSJEepKm/
         o8o1T+n6AXiHc3IMJ1HAYsI6zVMkUM+ovSw/v6mz/nU0OL4BYPqaCpJrj+G+pkr2TzPR
         /1QTr02v3z5wDsIqrcSWUzcgX7ndIqTqfXTm5j5BkMUs6vNkWlXt0VtTIbr6vOE5qTBY
         COPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K9XBUYhR2UM3o5JW2bLsoKZhteJffpc0EMzzkZ12vrU=;
        b=cFbH//SZ1o+aGKbpK+R355IUCp9cXshqm+u8WhOHKx+DwrUxlKLsapa0p67bTCzhw5
         O7wU1VwlKV3MBc6jQiGF5HLsuWKXynSVXgXgUjPH4crdJbPWc2JonUvEZOS/rUYN+DBw
         hJKbfaHxVXqxui5oqo6AEV6arvyZPRVUsyfrJ4b5kxj6UvtHugfMX9x3RMTPN8q/XMU5
         AiW5qCvt/cy5xgExjQQ5Qf7oP+qxVJr+O+i/jP1GgmByU8zMVdR8h5hzGafliOl2K6HJ
         AXqhRqlAYQTJl8oXFEvAvdaRu23+VVLwebXSz4q+sFgYAX8xCIoQbYcGn9hqTn4qwtJX
         4hTA==
X-Gm-Message-State: AOAM53051Z8kSKwlquv6XED982wjFsHdAJGQlBq/+pdFSsT0rdIERFlZ
        nL2cOGg3rmU5b2o4FazWJJdfzg==
X-Google-Smtp-Source: ABdhPJx/s8//eZsR2mDWaE+/rGMrjsWcZks+Waz1MsuzmfCH+rO72bB0gt+TU3NBkomdrJuAZGx7ig==
X-Received: by 2002:a19:587:: with SMTP id 129mr7610447lff.189.1605057262147;
        Tue, 10 Nov 2020 17:14:22 -0800 (PST)
Received: from localhost.bredbandsbolaget (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id r9sm47836ljd.23.2020.11.10.17.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 17:14:21 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     linux-leds@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Sakari Ailus <sakari.ailus@iki.fi>, newbytee@protonmail.com,
        Stephan Gerhold <stephan@gerhold.net>,
        devicetree@vger.kernel.org
Subject: [PATCH 1/2 v3] dt-bindings: leds: Add DT binding for Richtek RT8515
Date:   Wed, 11 Nov 2020 02:14:16 +0100
Message-Id: <20201111011417.2275501-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add a YAML devicetree binding for the Richtek RT8515
dual channel flash/torch LED driver.

Cc: Sakari Ailus <sakari.ailus@iki.fi>
Cc: newbytee@protonmail.com
Cc: Stephan Gerhold <stephan@gerhold.net>
Cc: devicetree@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v2->v3:
- Add Sakari to CC
- Resend
ChangeLog v1->v2:
- Explicitly inherit function, color and flash-max-timeout-us
  from common.yaml
- Add "led" node as required.
---
 .../bindings/leds/richtek,rt8515.yaml         | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/richtek,rt8515.yaml

diff --git a/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml b/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml
new file mode 100644
index 000000000000..0d8bb635370c
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml
@@ -0,0 +1,59 @@
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
+    properties:
+      function: true
+      color: true
+      flash-max-timeout-us: true
+
+required:
+  - compatible
+  - ent-gpios
+  - enf-gpios
+  - led
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

