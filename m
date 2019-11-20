Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1E1C103D92
	for <lists+linux-leds@lfdr.de>; Wed, 20 Nov 2019 15:44:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731809AbfKTOoL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 20 Nov 2019 09:44:11 -0500
Received: from mail-qk1-f194.google.com ([209.85.222.194]:39036 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731732AbfKTOoL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 20 Nov 2019 09:44:11 -0500
Received: by mail-qk1-f194.google.com with SMTP id o17so1418645qko.6;
        Wed, 20 Nov 2019 06:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=I0LcG/O5WZIJaQc1faJtadps2n8ne4BjQxwgK76HPIE=;
        b=mAp2XavWKaGaAxbFCRmh//e3U5y10CjxJ8KL2D8E1ZKt0/VBPgX+85eiBgZ2Pxb4pz
         PXyXXhhJjAxPklQFAIKmnY66PQ1rpG6DUYYDZQV+qbkfIsm7oSNr/bzmlbPYPrtDEooa
         wck443SWup8AQA98RYM/384QLf8D9KLmZn3Kq5djMzJnbL2RsS7D1e6xV7mVY3ffhuW9
         eUXuYK5Om5xw2G+b4SQmN6ehiijg/rgQLjDNgeLlfMcNm0XI3kFCdbNl5JT6e2yiJwuw
         U+nRGlkx6JUljXxknBaZURSrgQ/K+zPx6ySxl90wCejgkiiWzFprNDJ7A+aJis5198yg
         7KQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=I0LcG/O5WZIJaQc1faJtadps2n8ne4BjQxwgK76HPIE=;
        b=Ot4IrRppoeNaoSMI+IdK9pvUL2ZI3+K/kBojES5ppnLhtcZgLEu38ET363NMpsfy/c
         pLfTHnmkGAHVll3xxrFt+7iYzLe+t+y3kGXWnQauFAKXgUqkjjVQ0Sa0IK6qWxkQzLta
         PTRnvAlhbKviHjMvB5ulj4XgUjNCq1YrnfR/RiJfZFs3mlsOa+K8FRlzwdBPL7GodBMa
         6ecev8W+CYydiGweBDcizQPbXjbyWdnTvx59dc3NqEfYG4rHHxWPwMc/ONlANxbe8LSW
         TibjD8nPLrti7TzcNiCvsJ6T1nQ2dZ1oKex33/0MyPbGLmp4yX7ALJbTYovJSiInOPe2
         K6mg==
X-Gm-Message-State: APjAAAVKVucmjIIF4qCpPAQnWXnUi6bK6yQM0AbEuLviFvrNfNN0Qf9V
        Y1XbgMD9wxSzOsvR51/uBBQ=
X-Google-Smtp-Source: APXvYqxZv/1fXhHTHlKWQhJyXm7JUn3oxThMVm/nxDcXL+/U/6+rOs1BZHKjsbal8t3C2541BK5+1g==
X-Received: by 2002:a37:67c5:: with SMTP id b188mr2579950qkc.199.1574261049302;
        Wed, 20 Nov 2019 06:44:09 -0800 (PST)
Received: from localhost.localdomain ([72.53.229.209])
        by smtp.gmail.com with ESMTPSA id 62sm953069qkk.102.2019.11.20.06.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2019 06:44:08 -0800 (PST)
From:   Sven Van Asbroeck <thesven73@gmail.com>
X-Google-Original-From: Sven Van Asbroeck <TheSven73@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Grigoryev Denis <grigoryev@fastwel.ru>,
        Axel Lin <axel.lin@ingics.com>, Dan Murphy <dmurphy@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: [PATCH v3 2/3] leds: tps6105x: add driver for mfd chip led mode
Date:   Wed, 20 Nov 2019 09:44:00 -0500
Message-Id: <20191120144401.30452-3-TheSven73@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191120144401.30452-1-TheSven73@gmail.com>
References: <20191120144401.30452-1-TheSven73@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This driver adds support for the led operational mode of the
tps6105x mfd device.

Example usage, devicetree:

i2c0 {
	tps61052@33 {
		compatible = "ti,tps61052";
		reg = <0x33>;

		led {
		};
	};
};

Tree: next-20191118
Signed-off-by: Sven Van Asbroeck <TheSven73@gmail.com>
---
 drivers/leds/Kconfig         | 10 ++++++
 drivers/leds/Makefile        |  1 +
 drivers/leds/leds-tps6105x.c | 67 ++++++++++++++++++++++++++++++++++++
 3 files changed, 78 insertions(+)
 create mode 100644 drivers/leds/leds-tps6105x.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 4b68520ac251..7c7ceaa824a2 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -836,6 +836,16 @@ config LEDS_LM36274
 	  Say Y to enable the LM36274 LED driver for TI LMU devices.
 	  This supports the LED device LM36274.
 
+config LEDS_TPS6105X
+	tristate "LED support for TI TPS6105X"
+	depends on LEDS_CLASS
+	depends on TPS6105X
+	default y if TPS6105X
+	help
+	  This driver supports TPS61050/TPS61052 led chips.
+	  It is a single boost converter primarily for white LEDs and
+	  audio amplifiers.
+
 comment "LED Triggers"
 source "drivers/leds/trigger/Kconfig"
 
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 2da39e896ce8..d7e1107753fb 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -85,6 +85,7 @@ obj-$(CONFIG_LEDS_LM3601X)		+= leds-lm3601x.o
 obj-$(CONFIG_LEDS_TI_LMU_COMMON)	+= leds-ti-lmu-common.o
 obj-$(CONFIG_LEDS_LM3697)		+= leds-lm3697.o
 obj-$(CONFIG_LEDS_LM36274)		+= leds-lm36274.o
+obj-$(CONFIG_LEDS_TPS6105X)		+= leds-tps6105x.o
 
 # LED SPI Drivers
 obj-$(CONFIG_LEDS_CR0014114)		+= leds-cr0014114.o
diff --git a/drivers/leds/leds-tps6105x.c b/drivers/leds/leds-tps6105x.c
new file mode 100644
index 000000000000..44325251b3d6
--- /dev/null
+++ b/drivers/leds/leds-tps6105x.c
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/mfd/tps6105x.h>
+#include <linux/regmap.h>
+
+struct tps6105x_priv {
+	struct regmap *regmap;
+	struct led_classdev cdev;
+};
+
+static int tps6105x_brightness_set(struct led_classdev *cdev,
+				  enum led_brightness brightness)
+{
+	struct tps6105x_priv *priv = container_of(cdev, struct tps6105x_priv,
+							cdev);
+
+	return regmap_update_bits(priv->regmap, TPS6105X_REG_0,
+		TPS6105X_REG0_TORCHC_MASK,
+		brightness << TPS6105X_REG0_TORCHC_SHIFT);
+}
+
+static int tps6105x_led_probe(struct platform_device *pdev)
+{
+	struct tps6105x *tps6105x = dev_get_platdata(&pdev->dev);
+	struct tps6105x_platform_data *pdata = tps6105x->pdata;
+	struct tps6105x_priv *priv;
+	int ret;
+
+	/* This instance is not set for torch mode so bail out */
+	if (pdata->mode != TPS6105X_MODE_TORCH) {
+		dev_info(&pdev->dev,
+			"chip not in torch mode, exit probe");
+		return -EINVAL;
+	}
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+	priv->regmap = tps6105x->regmap;
+	priv->cdev.name = "tps6105x::torch";
+	priv->cdev.brightness_set_blocking = tps6105x_brightness_set;
+	priv->cdev.max_brightness = 7;
+
+	ret = regmap_update_bits(tps6105x->regmap, TPS6105X_REG_0,
+		TPS6105X_REG0_MODE_MASK | TPS6105X_REG0_TORCHC_MASK,
+		TPS6105X_REG0_MODE_TORCH << TPS6105X_REG0_MODE_SHIFT);
+	if (ret)
+		return ret;
+
+	return devm_led_classdev_register(&pdev->dev, &priv->cdev);
+}
+
+static struct platform_driver led_driver = {
+	.probe = tps6105x_led_probe,
+	.driver = {
+		.name = "tps6105x-leds",
+	},
+};
+
+module_platform_driver(led_driver);
+
+MODULE_DESCRIPTION("TPS6105x led driver");
+MODULE_AUTHOR("Sven Van Asbroeck <TheSven73@gmail.com>");
+MODULE_LICENSE("GPL v2");
-- 
2.17.1

