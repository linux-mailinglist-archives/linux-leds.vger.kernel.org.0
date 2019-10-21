Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19AEADEC9B
	for <lists+linux-leds@lfdr.de>; Mon, 21 Oct 2019 14:44:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728843AbfJUMol (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 21 Oct 2019 08:44:41 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:50333 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728812AbfJUMoj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 21 Oct 2019 08:44:39 -0400
Received: by mail-wm1-f68.google.com with SMTP id q13so3121868wmj.0
        for <linux-leds@vger.kernel.org>; Mon, 21 Oct 2019 05:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FbliBa1VhrZKjwZZgo9YBYBDBnz5mW0Jl/y78vfYK5s=;
        b=F3itfG7P2iJu2uSiO8bPUCz6gsXDwqCg0me7nWNSzccPfO5Hp9zVtAy0JTy1saMUQU
         +MXwhaDxQJDkVLy3su6qApGJbYl6b9dbLLplqvdcW639yTFkfAP4jaltm6hiNZ0QVBMG
         ZAbeBxJA85I53xdhArLrj4rQ0lnrNcEjmLFLfS7A0VoXGwqo+MuAUI82jEAq5Z5w2BaI
         EnD1SPa/VVJ1vLRw+TMabY2R0BmM73646gEvjT1aNuNiA/N5eXN6lds654GfaqCpZPy6
         9YAY9aEcK2eH6mil9R0AXHRsM81nvAchF20MHBBafpUDvGe1nKMCvFmbk9eUJRNbV2MC
         V/bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FbliBa1VhrZKjwZZgo9YBYBDBnz5mW0Jl/y78vfYK5s=;
        b=B9HnJc65um18k8dZh7iZ0bgQTXpQX3t9gh2iQgPZ6voLhKjiZniQra5IYC5YNQeb3k
         Wmv6YknRxm20HdXLWabKdRk7M8raLA9go5EZ4/DiOJVRM6Bn2zMiqultpQuLKtM/wC2A
         ERUNuvH7XrXRAH267TAx8EsscfxTPNo/wvXnKdsuPCXAYrj3LtuW457uFPaYzEzA4lGK
         0hxf42HJHlPNv3wcm3h0b17Z/AG9/qaghSMM5cHMw79TU1YHKxwcnPAOFw+KIUB0lYfl
         hOFqmeMeZdN1PrbwWC/HTyV/NUQG2oRegV0SPbgAVt8GbZdI7Sn2oqpR9NqsOWp8aEYB
         xoFw==
X-Gm-Message-State: APjAAAVS5BMk1OhfqOl75XFJ8rVtUYxC3wvE01JpIqzhnDUpCebbJVXz
        QN/qg40bua5Fnilv3MzDkDnrcA==
X-Google-Smtp-Source: APXvYqw8PFsmtbUuomL4aBiyNRsZAYhTMftxSHrzusnCImRIZn4IbvSamiKMe9Edc7Z0zhuj/55Jvg==
X-Received: by 2002:a7b:c7c8:: with SMTP id z8mr3574162wmk.29.1571661877315;
        Mon, 21 Oct 2019 05:44:37 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id a17sm10216150wmb.8.2019.10.21.05.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2019 05:44:36 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Lee Jones <lee.jones@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v4 3/6] dt-bindings: power: max77650: convert the binding document to yaml
Date:   Mon, 21 Oct 2019 14:44:25 +0200
Message-Id: <20191021124428.2541-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191021124428.2541-1-brgl@bgdev.pl>
References: <20191021124428.2541-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Convert the binding document for MAX77650 charger module to YAML.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Acked-by: Sebastian Reichel <sre@kernel.org>
---
 .../power/supply/max77650-charger.txt         | 28 ---------------
 .../power/supply/max77650-charger.yaml        | 34 +++++++++++++++++++
 2 files changed, 34 insertions(+), 28 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/power/supply/max77650-charger.txt
 create mode 100644 Documentation/devicetree/bindings/power/supply/max77650-charger.yaml

diff --git a/Documentation/devicetree/bindings/power/supply/max77650-charger.txt b/Documentation/devicetree/bindings/power/supply/max77650-charger.txt
deleted file mode 100644
index e6d0fb6ff94e..000000000000
--- a/Documentation/devicetree/bindings/power/supply/max77650-charger.txt
+++ /dev/null
@@ -1,28 +0,0 @@
-Battery charger driver for MAX77650 PMIC from Maxim Integrated.
-
-This module is part of the MAX77650 MFD device. For more details
-see Documentation/devicetree/bindings/mfd/max77650.txt.
-
-The charger is represented as a sub-node of the PMIC node on the device tree.
-
-Required properties:
---------------------
-- compatible:		Must be "maxim,max77650-charger"
-
-Optional properties:
---------------------
-- input-voltage-min-microvolt:	Minimum CHGIN regulation voltage. Must be one
-				of: 4000000, 4100000, 4200000, 4300000,
-				4400000, 4500000, 4600000, 4700000.
-- input-current-limit-microamp:	CHGIN input current limit (in microamps). Must
-				be one of: 95000, 190000, 285000, 380000,
-				475000.
-
-Example:
---------
-
-	charger {
-		compatible = "maxim,max77650-charger";
-		input-voltage-min-microvolt = <4200000>;
-		input-current-limit-microamp = <285000>;
-	};
diff --git a/Documentation/devicetree/bindings/power/supply/max77650-charger.yaml b/Documentation/devicetree/bindings/power/supply/max77650-charger.yaml
new file mode 100644
index 000000000000..deef010ec535
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/supply/max77650-charger.yaml
@@ -0,0 +1,34 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/supply/max77650-charger.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Battery charger driver for MAX77650 PMIC from Maxim Integrated.
+
+maintainers:
+  - Bartosz Golaszewski <bgolaszewski@baylibre.com>
+
+description: |
+  This module is part of the MAX77650 MFD device. For more details
+  see Documentation/devicetree/bindings/mfd/max77650.yaml.
+
+  The charger is represented as a sub-node of the PMIC node on the device tree.
+
+properties:
+  compatible:
+    const: maxim,max77650-charger
+
+  input-voltage-min-microvolt:
+    description:
+      Minimum CHGIN regulation voltage.
+    enum: [ 4000000, 4100000, 4200000, 4300000,
+            4400000, 4500000, 4600000, 4700000 ]
+
+  input-current-limit-microamp:
+    description:
+      CHGIN input current limit (in microamps).
+    enum: [ 95000, 190000, 285000, 380000, 475000 ]
+
+required:
+  - compatible
-- 
2.23.0

