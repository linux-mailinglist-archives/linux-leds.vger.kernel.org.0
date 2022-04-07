Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7368D4F7E6A
	for <lists+linux-leds@lfdr.de>; Thu,  7 Apr 2022 13:51:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245010AbiDGLxm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 7 Apr 2022 07:53:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245008AbiDGLxl (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 7 Apr 2022 07:53:41 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4FC519EC4D;
        Thu,  7 Apr 2022 04:51:41 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id s13so7116308ljd.5;
        Thu, 07 Apr 2022 04:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iXxYhOZovoVWD00T32nm/pWCIlnIIec23xpqqBb7OP8=;
        b=bG2HiRVZ6ugkT9G97JKobzo+9dWTNwMMSe2ERsuhwJNbfmVXhfNz6yGQIqA7Qr+6G3
         wtxOMTLAv0/0SDqeVIGcpQi06eh37yM23WSXB/vkgDSdilTPI0hGPBjSOCdppKNRjR/p
         ZUuuHRyRn1jB4yjypYmKe3Ig83MacP8/DRmgd4S+CjhRl+Qqa/JXTtd5cMA4ebZj6yN+
         j3VzUJZlkI4bDGW8lLhyD3RGc9JYM4qbL3ccKHPEFfkwz2OZcIdDl9Sa3c+TIesUb+22
         exhmiUAG+izHOT9CxHBAxIOl/lYoquHGcj4rLASN7SxYfhH9EMHx0Uq/n/+PMrvOZ7JQ
         /uRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iXxYhOZovoVWD00T32nm/pWCIlnIIec23xpqqBb7OP8=;
        b=ah849aC4vK1nubdlHYuCsJkWIi2WNIRIkKkeMonYQv690kzstpedOl1W+j4RDSw2T7
         5MNBvRnjSa6k8aDRbWq7UBjptgJ56EILAD/CjgHxXikTaVOgr3W8sJZXhdpqircxv3cW
         Kr/t2WYlWD7eK7WTF/vgtqQaXtnoqV7/7lfJkE+S3/CReEgpWs9FZi45KAjk1ELJUufR
         Ih6BZEsWPM9I+ER1Got7zWUUnJgshpIMvC0u+aKVWcv94kGjM2KjxiNIKjgRIcsBHS0n
         Qi2mFdQkDeFAf04ozSM9a4h6pHl83lM37cKaYsPjgX9g2cAHqAWpHHeun1RRz3MJ+vEa
         DvQQ==
X-Gm-Message-State: AOAM532othtXHUmsLe6wjt0vyUux/wGeptTYpr4sSw5IgSIKCPpzr8Ci
        FmEhuJnwomgUJco6G1I17y8Z1WKr8z4=
X-Google-Smtp-Source: ABdhPJxCKyS0qoxBqqvw0xi7MA3CIWjgtJ+YBiASZflnWHyLXbngv/djaDT6pjH7DZ5uEXvnwyHMWA==
X-Received: by 2002:a2e:a374:0:b0:24b:4344:1440 with SMTP id i20-20020a2ea374000000b0024b43441440mr2042181ljn.380.1649332299951;
        Thu, 07 Apr 2022 04:51:39 -0700 (PDT)
Received: from nergzd-desktop.localdomain ([194.39.226.133])
        by smtp.gmail.com with ESMTPSA id i16-20020a198c50000000b0044a2580a2d3sm2143666lfj.156.2022.04.07.04.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 04:51:39 -0700 (PDT)
From:   Markuss Broks <markuss.broks@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Markuss Broks <markuss.broks@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: leds: convert ktd2692 bindings to yaml
Date:   Thu,  7 Apr 2022 14:51:24 +0300
Message-Id: <20220407115126.69293-2-markuss.broks@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220407115126.69293-1-markuss.broks@gmail.com>
References: <20220407115126.69293-1-markuss.broks@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This patch converts the leds-ktd2692.txt bindings to modern yaml
style device-tree bindings.

Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 .../bindings/leds/kinetic,ktd2692.yaml        | 87 +++++++++++++++++++
 .../devicetree/bindings/leds/leds-ktd2692.txt | 50 -----------
 2 files changed, 87 insertions(+), 50 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/kinetic,ktd2692.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-ktd2692.txt

diff --git a/Documentation/devicetree/bindings/leds/kinetic,ktd2692.yaml b/Documentation/devicetree/bindings/leds/kinetic,ktd2692.yaml
new file mode 100644
index 000000000000..bac95a51afa1
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/kinetic,ktd2692.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/kinetic,ktd2692.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: KTD2692 Flash LED Driver from Kinetic Technologies
+
+maintainers:
+  - Markuss Broks <markuss.broks@gmail.com>
+
+description: |
+  KTD2692 is the ideal power solution for high-power flash LEDs.
+  It uses ExpressWire single-wire programming for maximum flexibility.
+
+  The ExpressWire interface through CTRL pin can control LED on/off and
+  enable/disable the IC, Movie(max 1/3 of Flash current) / Flash mode current,
+  Flash timeout, LVP(low voltage protection).
+
+  Also, When the AUX pin is pulled high while CTRL pin is high,
+  LED current will be ramped up to the flash-mode current level.
+
+properties:
+  compatible:
+    const: kinetic,ktd2692
+
+  ctrl-gpios:
+    maxItems: 1
+    description: Specifier of the GPIO connected to CTRL pin.
+
+  aux-gpios:
+    maxItems: 1
+    description: Specifier of the GPIO connected to CTRL pin.
+
+  vin-supply:
+    description: LED supply (2.7V to 5.5V).
+
+  led:
+    type: object
+    $ref: common.yaml#
+    description: Properties for the LED.
+    properties:
+      function: true
+      color: true
+      flash-max-timeout-us:
+        description: Flash LED maximum timeout.
+
+      led-max-microamp:
+        maximum: 300000
+        description: Minimum Threshold for Timer protection
+          is defined internally (Maximum 300mA).
+
+      flash-max-microamp:
+        maximum: 300000
+        description: Flash LED maximum current
+          Formula - I(uA) = 15000000 / Rset.
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - ctrl-gpios
+  - led
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/leds/common.h>
+
+    ktd2692 {
+      compatible = "kinetic,ktd2692";
+      ctrl-gpios = <&gpc0 1 0>;
+      aux-gpios = <&gpc0 2 0>;
+      vin-supply = <&vbat>;
+
+      led {
+        function = LED_FUNCTION_FLASH;
+        color = <LED_COLOR_ID_WHITE>;
+        flash-max-timeout-us = <250000>;
+        flash-max-microamp = <150000>;
+        led-max-microamp = <25000>;
+      };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/leds/leds-ktd2692.txt b/Documentation/devicetree/bindings/leds/leds-ktd2692.txt
deleted file mode 100644
index 853737452580..000000000000
--- a/Documentation/devicetree/bindings/leds/leds-ktd2692.txt
+++ /dev/null
@@ -1,50 +0,0 @@
-* Kinetic Technologies - KTD2692 Flash LED Driver
-
-KTD2692 is the ideal power solution for high-power flash LEDs.
-It uses ExpressWire single-wire programming for maximum flexibility.
-
-The ExpressWire interface through CTRL pin can control LED on/off and
-enable/disable the IC, Movie(max 1/3 of Flash current) / Flash mode current,
-Flash timeout, LVP(low voltage protection).
-
-Also, When the AUX pin is pulled high while CTRL pin is high,
-LED current will be ramped up to the flash-mode current level.
-
-Required properties:
-- compatible : Should be "kinetic,ktd2692".
-- ctrl-gpios : Specifier of the GPIO connected to CTRL pin.
-- aux-gpios : Specifier of the GPIO connected to AUX pin.
-
-Optional properties:
-- vin-supply : "vin" LED supply (2.7V to 5.5V).
-  See Documentation/devicetree/bindings/regulator/regulator.txt
-
-A discrete LED element connected to the device must be represented by a child
-node - See Documentation/devicetree/bindings/leds/common.txt
-
-Required properties for flash LED child nodes:
-  See Documentation/devicetree/bindings/leds/common.txt
-- led-max-microamp : Minimum Threshold for Timer protection
-  is defined internally (Maximum 300mA).
-- flash-max-microamp : Flash LED maximum current
-  Formula : I(mA) = 15000 / Rset.
-- flash-max-timeout-us : Flash LED maximum timeout.
-
-Optional properties for flash LED child nodes:
-- label : See Documentation/devicetree/bindings/leds/common.txt
-
-Example:
-
-ktd2692 {
-	compatible = "kinetic,ktd2692";
-	ctrl-gpios = <&gpc0 1 0>;
-	aux-gpios = <&gpc0 2 0>;
-	vin-supply = <&vbat>;
-
-	flash-led {
-		label = "ktd2692-flash";
-		led-max-microamp = <300000>;
-		flash-max-microamp = <1500000>;
-		flash-max-timeout-us = <1835000>;
-	};
-};
-- 
2.35.1

