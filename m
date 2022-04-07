Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64F5D4F7D65
	for <lists+linux-leds@lfdr.de>; Thu,  7 Apr 2022 12:58:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244625AbiDGLA1 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 7 Apr 2022 07:00:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241551AbiDGLA0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 7 Apr 2022 07:00:26 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D1C2EBB86;
        Thu,  7 Apr 2022 03:58:25 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id g24so6928540lja.7;
        Thu, 07 Apr 2022 03:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iXxYhOZovoVWD00T32nm/pWCIlnIIec23xpqqBb7OP8=;
        b=FAbTbKdstycqxjOCCJZtYcql48No9iKM9UoXXOEwpafuiVt8zVYQCX3tPL5m6MLKmK
         QRweaGmfwwykl3FdRfU0FC+7Djmk03IfmJuUlFI7/WM0fggk7ucUOaKDR+9Uj4m1o2IW
         V8Kq55zUtwWAGZcs45YxiiaNSWY9XEvBY203RYSBGSrgkW6Z05aLunTAzAn2Q3LvESZs
         HpT9ysz0RzdojS9MLHrrsA0tyx97uAfBVELpp0eUyCdV+S2sgvF0sohUQqnRuemfwaDd
         hJDA1vl++ANSzVaGeYOPXHx1DXQw5/+nc4EdBv9bUrpt6u/zg8H1JmvcTXGPY0lITqex
         sDVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iXxYhOZovoVWD00T32nm/pWCIlnIIec23xpqqBb7OP8=;
        b=KCPnQ6kxZae0dC3QhLaACttv+S40E/MI2+FBrlkFEZfqb45VPiEIyJAz8rwjdKhuu6
         4JksljUMOufl8TFWW8+lgCXt/YiQPTpRTjxwt/rvr2W+7tWkxJY265tEhu83URBry/en
         n48RarLbR3yUqtTyYOJwVmzCYxvlP5V+z2X8FuWAEUzxSLyZu86bnHldSbqSRrQVCPFZ
         zFxXnaSFY+PSMOE6WAMqA7Qp1Eg+N+8xeyKNcH06RLhQzLESjgkbQu5ZrRusxpzaKEEn
         cOvPLz3U6CxVk2DYRp2cAkr55UQZYGMnNwItr1NsuW3EUGgaf1AXNNQJV6rnIyFMsBr6
         q+8Q==
X-Gm-Message-State: AOAM530UxuncHTP0FQEW1QFRo+JpB8/h9aB1+37zwLeIMz9SwaKnpLBL
        5Y/AZ1+uWd0ZhWTx7FuMPZo535udPRk=
X-Google-Smtp-Source: ABdhPJwaFfHyqPIHKY9XOkj6PS/AOzRcoD0k4Bw93Vk5eubjZ/x/MiKqpCfJl7yxR34zx8FHMVtAMg==
X-Received: by 2002:a2e:80d7:0:b0:24b:bd8:b89e with SMTP id r23-20020a2e80d7000000b0024b0bd8b89emr8032743ljg.174.1649329103242;
        Thu, 07 Apr 2022 03:58:23 -0700 (PDT)
Received: from nergzd-desktop.localdomain ([194.39.226.133])
        by smtp.gmail.com with ESMTPSA id k18-20020ac24572000000b0044ae25d47d7sm1990273lfm.143.2022.04.07.03.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 03:58:22 -0700 (PDT)
From:   Markuss Broks <markuss.broks@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Markuss Broks <markuss.broks@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: leds: convert ktd2692 bindings to yaml
Date:   Thu,  7 Apr 2022 13:58:08 +0300
Message-Id: <20220407105810.20399-2-markuss.broks@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220407105810.20399-1-markuss.broks@gmail.com>
References: <20220407105810.20399-1-markuss.broks@gmail.com>
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

