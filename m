Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C201DEC86
	for <lists+linux-leds@lfdr.de>; Mon, 21 Oct 2019 14:44:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727322AbfJUMoh (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 21 Oct 2019 08:44:37 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51203 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728789AbfJUMog (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 21 Oct 2019 08:44:36 -0400
Received: by mail-wm1-f68.google.com with SMTP id q70so5993552wme.1
        for <linux-leds@vger.kernel.org>; Mon, 21 Oct 2019 05:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e45fDRa6lt4TVk/xCaylRrJNDsL4rdRDWffuoxbFC/s=;
        b=dTdIgDUe+rbxw9Er/S+hKUhvyYCM8dFCQpHzM3kQFpdrboIlN4qoBdh6qbSxSGqdJS
         RAHBaQQeY6/e4PpMjOiCwFVSKrK1Jcj9N8PW6zFQhyquISkWjOP8+nLMWJtMu5IosAgx
         A+WuhNAd3CdgaulIrkj0haFeApXmEMa9T+oyRENmW/JLjTmYlCpPVOSzYtVRbtzvAD+w
         W5h3Yj+H9HZZRf2aOZAfOu26WsTrAt0bWrfrthVhdHd/YyPUD9F4WKeQj57Sqb/lZtXS
         ZlS2u8rCz9kPfX0odggBoXQxvar7+TjvPlJycBdAvt99xG5EcG3ua7UdLfUfVMwA0pKb
         EvzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e45fDRa6lt4TVk/xCaylRrJNDsL4rdRDWffuoxbFC/s=;
        b=kxEmLPwlItPr7p2MAVYLGoePjtD1Ppjh23iSQkWaGYdrcarCZ4i/sgaNgIZEj08nrk
         DMnFTVB5aWgj6paUYdBqmZKBLXZV0z18dPu01+tycY2sgHFa6RacN69fzYi/Y3HXWuWm
         ycYRqj30CFRZ6BBi3YSZ4nDmJvJuLmUPm6H2zFwRxa8TM0ZU/8MlqeqI4t2cFES0OEq+
         sMCmM4zwRbTYoboO4lF0lgB0x+XFTWgzIo4Xuuy9+TS3QEhy1eqUlr6Hq5dIZLMsCNI8
         Zjle3jS+dJpfxO0IKd/IjYBW92MBMz0KuM56vsYI3RW4PwHka/NA3RV2gUD8krb8QrLo
         kj/A==
X-Gm-Message-State: APjAAAXTCPjFBAyla1Kq5wxzVyZy7qCkU/bjQz7703MmAXgvU6rxcZQ9
        E+imsa3SiBKMDmIo/jr9VqxuLA==
X-Google-Smtp-Source: APXvYqz/r0eXO3ESbY8W2Yk8YiMyA2wNrEv41SgZfzo1fuCoUgFOhtw1QF8oY/U0ylwTDVWsFvzKxA==
X-Received: by 2002:a1c:4907:: with SMTP id w7mr2508403wma.62.1571661874655;
        Mon, 21 Oct 2019 05:44:34 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id a17sm10216150wmb.8.2019.10.21.05.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2019 05:44:34 -0700 (PDT)
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
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 1/6] dt-bindings: input: max77650: convert the binding document to yaml
Date:   Mon, 21 Oct 2019 14:44:23 +0200
Message-Id: <20191021124428.2541-2-brgl@bgdev.pl>
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

Convert the binding document for MAX77650 onkey module to YAML.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/input/max77650-onkey.txt         | 26 --------------
 .../bindings/input/max77650-onkey.yaml        | 35 +++++++++++++++++++
 2 files changed, 35 insertions(+), 26 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/max77650-onkey.txt
 create mode 100644 Documentation/devicetree/bindings/input/max77650-onkey.yaml

diff --git a/Documentation/devicetree/bindings/input/max77650-onkey.txt b/Documentation/devicetree/bindings/input/max77650-onkey.txt
deleted file mode 100644
index 477dc74f452a..000000000000
--- a/Documentation/devicetree/bindings/input/max77650-onkey.txt
+++ /dev/null
@@ -1,26 +0,0 @@
-Onkey driver for MAX77650 PMIC from Maxim Integrated.
-
-This module is part of the MAX77650 MFD device. For more details
-see Documentation/devicetree/bindings/mfd/max77650.txt.
-
-The onkey controller is represented as a sub-node of the PMIC node on
-the device tree.
-
-Required properties:
---------------------
-- compatible:		Must be "maxim,max77650-onkey".
-
-Optional properties:
-- linux,code:		The key-code to be reported when the key is pressed.
-			Defaults to KEY_POWER.
-- maxim,onkey-slide:	The system's button is a slide switch, not the default
-			push button.
-
-Example:
---------
-
-	onkey {
-		compatible = "maxim,max77650-onkey";
-		linux,code = <KEY_END>;
-		maxim,onkey-slide;
-	};
diff --git a/Documentation/devicetree/bindings/input/max77650-onkey.yaml b/Documentation/devicetree/bindings/input/max77650-onkey.yaml
new file mode 100644
index 000000000000..2f2e0b6ebbbd
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/max77650-onkey.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/max77650-onkey.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Onkey driver for MAX77650 PMIC from Maxim Integrated.
+
+maintainers:
+  - Bartosz Golaszewski <bgolaszewski@baylibre.com>
+
+description: |
+  This module is part of the MAX77650 MFD device. For more details
+  see Documentation/devicetree/bindings/mfd/max77650.yaml.
+
+  The onkey controller is represented as a sub-node of the PMIC node on
+  the device tree.
+
+properties:
+  compatible:
+    const: maxim,max77650-onkey
+
+  linux,code:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The key-code to be reported when the key is pressed. Defaults
+      to KEY_POWER.
+
+  maxim,onkey-slide:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      The system's button is a slide switch, not the default push button.
+
+required:
+  - compatible
-- 
2.23.0

