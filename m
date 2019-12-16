Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C4ED1208B5
	for <lists+linux-leds@lfdr.de>; Mon, 16 Dec 2019 15:33:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728185AbfLPOdI (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 16 Dec 2019 09:33:08 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:36203 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728113AbfLPOdI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 16 Dec 2019 09:33:08 -0500
Received: by mail-qk1-f196.google.com with SMTP id a203so4330767qkc.3;
        Mon, 16 Dec 2019 06:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=I7c0SQN6HuCKKa1ZswlGHD9c4y7pPGDLaDBLm1SC07c=;
        b=NJ9wL9UJux098I9Q6LjQJmmEutCAK4CwgS6ccMZAHJI96aoP04sjxzMIt2EsEszxlp
         CQHHNcOmXs/UI7J0QefHoAHZLpl/2OnNrwzPZtooY4NJ2FWydjukP2yjI8/ySInzdXRl
         CH8vjXRteTOwHoD5eK2STZIoSfef7/L+ieE/JgjUSnG7QSSMqzILRqJPW9vWulpnrK/n
         S7zhM/f89mRSFMaf/14oHqOfZhh+Vfg88O1ivRmhh9ekj4cN2p8jzTikbbmWAZg4uUgo
         6n81PpVBWbErVsTVC5zMKi5Hi1P0QDzelvSBgGwnzNAe0fvJTne1/yvO/pmWdx/nBUKL
         rawg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=I7c0SQN6HuCKKa1ZswlGHD9c4y7pPGDLaDBLm1SC07c=;
        b=ihMlZ50h0MKQkLbef90Poclc+PuqMM5TB3eKTB6hzlDdcsuTXndE+bHVPoSndZeqYB
         TU891aQL/z3fWAW+EfDChpsDV61l3WlGVP7Lh0ZvH6LB2c7oyq/Ba8xuzVq1t3vdtcLW
         /zdCfXitVCBhMnxVsd3QO/hK1xlhFwbsKUiWF2XIfgP3arjs/dqs0eSYfMm2oiqtRy6S
         xnnawdqyPpHWmSsv4Q7JK3Pv7F5VyrNNZAW0489Uu5zB2LeWkLLeFu99xqUd64Nv4Gjh
         d3bImuXD0gbjZ2SaOjHY6zOb6NqFKI1ALNCKLI65u1LTOi4lLQzY/attstMYqNBy7FG7
         dV/A==
X-Gm-Message-State: APjAAAVkP+TCd0A3FTs2WFH5UhOeSu6Ng+DpW06UMbz46Vhz+kX33qjs
        sontNhUzGIDXjUbf7tEw85I=
X-Google-Smtp-Source: APXvYqyZsQPaYeHb53qPQUGeu/sq1imNBkWprUzTTKPFGI5dNu6Tubq33ExNNUpMxK0MeWJtxQeY3g==
X-Received: by 2002:a37:9f57:: with SMTP id i84mr27201376qke.29.1576506786547;
        Mon, 16 Dec 2019 06:33:06 -0800 (PST)
Received: from localhost.localdomain ([72.53.229.209])
        by smtp.gmail.com with ESMTPSA id b3sm6966992qtr.86.2019.12.16.06.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 06:33:06 -0800 (PST)
From:   Sven Van Asbroeck <thesven73@gmail.com>
X-Google-Original-From: Sven Van Asbroeck <TheSven73@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>, Pavel Machek <pavel@ucw.cz>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Grigoryev Denis <grigoryev@fastwel.ru>,
        Axel Lin <axel.lin@ingics.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: [PATCH v6 1/2] leds: tps6105x: add driver for MFD chip LED mode
Date:   Mon, 16 Dec 2019 09:32:58 -0500
Message-Id: <20191216143259.24587-2-TheSven73@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191216143259.24587-1-TheSven73@gmail.com>
References: <20191216143259.24587-1-TheSven73@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This driver adds support for the LED operational mode of the
tps6105x MFD device.

Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Signed-off-by: Sven Van Asbroeck <TheSven73@gmail.com>
---
 drivers/leds/Kconfig         | 10 ++++
 drivers/leds/Makefile        |  1 +
 drivers/leds/leds-tps6105x.c | 89 ++++++++++++++++++++++++++++++++++++
 3 files changed, 100 insertions(+)
 create mode 100644 drivers/leds/leds-tps6105x.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 4b68520ac251..d82f1dea3711 100644
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
+	  This driver supports TPS61050/TPS61052 LED chips.
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
index 000000000000..09fd88a6c8f0
--- /dev/null
+++ b/drivers/leds/leds-tps6105x.c
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2019 Sven Van Asbroeck
+ */
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
+	struct fwnode_handle *fwnode;
+};
+
+static void tps6105x_handle_put(void *data)
+{
+	struct tps6105x_priv *priv = data;
+
+	fwnode_handle_put(priv->fwnode);
+}
+
+static int tps6105x_brightness_set(struct led_classdev *cdev,
+				  enum led_brightness brightness)
+{
+	struct tps6105x_priv *priv = container_of(cdev, struct tps6105x_priv,
+							cdev);
+
+	return regmap_update_bits(priv->regmap, TPS6105X_REG_0,
+				  TPS6105X_REG0_TORCHC_MASK,
+				  brightness << TPS6105X_REG0_TORCHC_SHIFT);
+}
+
+static int tps6105x_led_probe(struct platform_device *pdev)
+{
+	struct tps6105x *tps6105x = dev_get_platdata(&pdev->dev);
+	struct tps6105x_platform_data *pdata = tps6105x->pdata;
+	struct led_init_data init_data = { };
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
+	/* fwnode/devicetree is optional. NULL is allowed for priv->fwnode */
+	priv->fwnode = device_get_next_child_node(pdev->dev.parent, NULL);
+	ret = devm_add_action_or_reset(&pdev->dev, tps6105x_handle_put, priv);
+	if (ret)
+		return ret;
+	priv->regmap = tps6105x->regmap;
+	priv->cdev.brightness_set_blocking = tps6105x_brightness_set;
+	priv->cdev.max_brightness = 7;
+	init_data.devicename = "tps6105x";
+	init_data.default_label = ":torch";
+	init_data.fwnode = priv->fwnode;
+
+	ret = regmap_update_bits(tps6105x->regmap, TPS6105X_REG_0,
+				 TPS6105X_REG0_MODE_MASK |
+					TPS6105X_REG0_TORCHC_MASK,
+				 TPS6105X_REG0_MODE_TORCH <<
+					TPS6105X_REG0_MODE_SHIFT);
+	if (ret)
+		return ret;
+
+	return devm_led_classdev_register_ext(&pdev->dev, &priv->cdev,
+					      &init_data);
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
+MODULE_DESCRIPTION("TPS6105x LED driver");
+MODULE_AUTHOR("Sven Van Asbroeck <TheSven73@gmail.com>");
+MODULE_LICENSE("GPL v2");
-- 
2.17.1

