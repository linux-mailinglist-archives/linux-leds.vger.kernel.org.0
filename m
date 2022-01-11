Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2D3448B478
	for <lists+linux-leds@lfdr.de>; Tue, 11 Jan 2022 18:51:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344740AbiAKRvC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 11 Jan 2022 12:51:02 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:33042
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1344731AbiAKRvB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Tue, 11 Jan 2022 12:51:01 -0500
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9448B3F31F
        for <linux-leds@vger.kernel.org>; Tue, 11 Jan 2022 17:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1641923460;
        bh=kbLoQxnt4voM3VUH+Yi44nd1ZrFyriuSpnp8itMYMGk=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=tfFEC5Cx4EHXBtKSc/qWDT2+uH8R/FtfwajFiv8qSs7u8m4d72EOhKL96kdcKQZNA
         tFFtcs7p4bYcgizF0zfL98EY+iAueuJ2Oy5Mn+t1zjDbci3KZj87Hub2pUOyyeX+RA
         IJfj/RyfAAqcxjr42p2B+uisvixD4qlqn8c3fS6qX6dW6Ht82OsZzwpw8nCZdxER3l
         up0BsoucHCjf42WULZPh3RKScPhiC7Bivv0IBaKLkaK9IHYTw5sgX3be6aIKfLZkDL
         ny9p6bkZXIPSKMlBHZoGCKxRBHmziEm1VhZpWtIX9w2I9k0nJr3KEWVdvSMjVVlB5p
         Lb4Xj7LhTXLJA==
Received: by mail-ed1-f71.google.com with SMTP id z8-20020a056402274800b003f8580bfb99so14011394edd.11
        for <linux-leds@vger.kernel.org>; Tue, 11 Jan 2022 09:51:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kbLoQxnt4voM3VUH+Yi44nd1ZrFyriuSpnp8itMYMGk=;
        b=fEWmhOIhKuLgSogtOtEhu+ZzCVz8W+YyHebEVNvVPlSNQeCbMhOkTEV3Un7SXbSYti
         oeC7OsfjAm1nvk5bDuil1A5AwU/H42U/kdRJJblbaHjMQba2VShs2ev/d6Dw/bhawKhT
         IKoc4sROjliD36jlIPM3gt/gy1xusVN2jLfR4RBwV9R+hddOta9g6lFpSppGM4iwAbT8
         dMla6IMLBZ6IOS1OeHcwa8zu8L+b5L0XJqLaKna1pIxRUfg/MpZ5vNKOpT6xww3PDZST
         GmAgsnORLMHKuR5jgKoDexlOzBCcZmLm7em8B1GeY/xOBsfCMuW4rmdV3Vic6RQyB8n3
         BZMQ==
X-Gm-Message-State: AOAM533htFpmWMMLZ35PL2Xg0YlsognPqQm+en4VNMbbWYQUvcR5ijiD
        44y6taQL//hpJeNjLAwy5sh1mIqHgP3axCwi/n98c55SdGZAnyXWUay/W7kPFvU71OyNHiSqeKh
        oWkN7JoQyxeQ2UXnSqoBxCTzvN7+WI2el2LkuQJA=
X-Received: by 2002:a05:6402:35cc:: with SMTP id z12mr5385816edc.285.1641923460238;
        Tue, 11 Jan 2022 09:51:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxGoi7rwv7h3DqMi1xIc0ME7EWIpmE0crWbGW94+J4maRho3HvgHFARa19XOpGWJyhmc042tw==
X-Received: by 2002:a05:6402:35cc:: with SMTP id z12mr5385799edc.285.1641923460054;
        Tue, 11 Jan 2022 09:51:00 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id p25sm5265160edw.75.2022.01.11.09.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 09:50:59 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org
Cc:     Rob Herring <robh@kernel.org>
Subject: [PATCH v2 2/4] dt-bindings: power: supply: maxim,max77693: convert to dtschema
Date:   Tue, 11 Jan 2022 18:50:15 +0100
Message-Id: <20220111175017.223966-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220111175017.223966-1-krzysztof.kozlowski@canonical.com>
References: <20220111175017.223966-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Convert the Charger bindings of Maxim MAX77693 MUIC to DT schema format.
The existing bindings were defined in ../bindings/mfd/max77693.txt.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/power/supply/maxim,max77693.yaml | 70 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/supply/maxim,max77693.yaml

diff --git a/Documentation/devicetree/bindings/power/supply/maxim,max77693.yaml b/Documentation/devicetree/bindings/power/supply/maxim,max77693.yaml
new file mode 100644
index 000000000000..a21dc1a8890f
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/supply/maxim,max77693.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/supply/maxim,max77693.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim MAX77693 MicroUSB and Companion Power Management IC Charger
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+
+description: |
+  This is a part of device tree bindings for Maxim MAX77693 MicroUSB Integrated
+  Circuit (MUIC).
+
+  See also Documentation/devicetree/bindings/mfd/maxim,max77693.yaml for
+  additional information and example.
+
+properties:
+  compatible:
+    const: maxim,max77693-charger
+
+  maxim,constant-microvolt:
+    description: |
+      Battery constant voltage in uV. The charger will operate in fast
+      charge constant current mode till battery voltage reaches this level.
+      Then the charger will switch to fast charge constant voltage mode.
+      Also vsys (system voltage) will be set to this value when DC power is
+      supplied but charger is not enabled.
+      Valid values: 3650000 - 4400000, step by 25000 (rounded down)
+    minimum: 3650000
+    maximum: 4400000
+    default: 4200000
+
+  maxim,min-system-microvolt:
+    description: |
+      Minimal system voltage in uV.
+    enum: [3000000, 3100000, 3200000, 3300000, 3400000, 3500000,
+           3600000, 3700000]
+    default: 3600000
+
+  maxim,thermal-regulation-celsius:
+    description: |
+      Temperature in Celsius for entering high temperature charging mode.
+      If die temperature exceeds this value the charging current will be
+      reduced by 105 mA/Celsius.
+    enum: [70, 85, 100, 115]
+    default: 100
+
+  maxim,battery-overcurrent-microamp:
+    description: |
+      Overcurrent protection threshold in uA (current from battery to
+      system).
+      Valid values: 2000000 - 3500000, step by 250000 (rounded down)
+    minimum: 2000000
+    maximum: 3500000
+    default: 3500000
+
+  maxim,charge-input-threshold-microvolt:
+    description: |
+      Threshold voltage in uV for triggering input voltage regulation loop.
+      If input voltage decreases below this value, the input current will
+      be reduced to reach the threshold voltage.
+    enum: [4300000, 4700000, 4800000, 4900000]
+    default: 4300000
+
+required:
+  - compatible
+
+additionalProperties: false
diff --git a/MAINTAINERS b/MAINTAINERS
index b5e4f14f6768..ead08768fb78 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11681,6 +11681,7 @@ M:	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
 M:	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
 L:	linux-pm@vger.kernel.org
 S:	Supported
+F:	Documentation/devicetree/bindings/power/supply/maxim,max77693.yaml
 F:	drivers/power/supply/max14577_charger.c
 F:	drivers/power/supply/max77693_charger.c
 
-- 
2.32.0

