Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01F7A102886
	for <lists+linux-leds@lfdr.de>; Tue, 19 Nov 2019 16:47:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728425AbfKSPqY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 19 Nov 2019 10:46:24 -0500
Received: from mail-qt1-f193.google.com ([209.85.160.193]:46837 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728414AbfKSPqX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 19 Nov 2019 10:46:23 -0500
Received: by mail-qt1-f193.google.com with SMTP id r20so25033398qtp.13;
        Tue, 19 Nov 2019 07:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=w8cPO+cbNCUmwN7rgMEyGzTGM0ss35Lqs76ePxu06U8=;
        b=bzyZfXpBsS/nZUuOuAF0bZ1BQ2YMv6MIlX7+NRMGCxKn13/m4JieMqArZZAVF00t+L
         bhLwb8q+EhBG1zwBxI7IM6a1t8MgBH46cPmZth4u8iS3+hy1BF7Ii1rtamSy8Rtj2qja
         fOPKeXWQUtBeRE/CEvBnni0TbU7roiUf3/zHvSqOpDlyqpmqd8pYNfvMti8qzR+lMdm9
         nMOwR+NK3K4CocKaYsyUGNmMND5TVVztc/DleWjnkN3XkjaEebk4A1/ACz4fMPIjvBD7
         3OaxwWr5LSZEyDWB3SmW1mcBuzsvg3I0OoD2Vrnl2lygDmwTSvjB9IQkS0Rv3WTkcRdT
         E7lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=w8cPO+cbNCUmwN7rgMEyGzTGM0ss35Lqs76ePxu06U8=;
        b=pqZF2gGTR73s2VIOdJbsna7XWZ/seRBFhBkW1GwuosFWO7W7fh7HAPsZ0GjKL5TfXN
         Iz7w4hJcorNUwm7agN7uHT0JpX1KcoYad/w1JzYZUK8RMcWqWbsm3uzs5I2CTm+xTgVN
         lVnojiBdFmDTZgBX0/S16oNvRP+b5byBiraVjJbkQYucomf6alpk21ksyP6sRlvqkLtg
         yshxGr2O2l1XKKRNU2J5Len2/1GKGyWHWj2/ku/cO6mf2M3/QTkw921kmkFchTaFIw+5
         WYzll+XQHEArjCuIGHeDcmeWAO5SiVYNhcnzfFN1IAX57e/ZZMwcVh0H94Z68LKREa0R
         /oiw==
X-Gm-Message-State: APjAAAU/0vhhzM7Ip+bKt5A6StVsm5/5dxqFOP+kTlozYS1H5zXNdG+K
        AW5xvy4AUqeRC0CobKHctmNphZ04
X-Google-Smtp-Source: APXvYqzhcoERl29keNJRMditzsNkTg1ANB7CVY8CRz0Fblrv4txNkg7Pv23PLTIf8UCsE8MtlB/N3w==
X-Received: by 2002:ac8:1604:: with SMTP id p4mr34021893qtj.276.1574178381853;
        Tue, 19 Nov 2019 07:46:21 -0800 (PST)
Received: from localhost.localdomain ([72.53.229.209])
        by smtp.gmail.com with ESMTPSA id 50sm12949919qtv.88.2019.11.19.07.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2019 07:46:21 -0800 (PST)
From:   Sven Van Asbroeck <thesven73@gmail.com>
X-Google-Original-From: Sven Van Asbroeck <TheSven73@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Grigoryev Denis <grigoryev@fastwel.ru>,
        Axel Lin <axel.lin@ingics.com>, Dan Murphy <dmurphy@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: [PATCH v2 3/4] leds: tps6105x: add driver for mfd chip led mode
Date:   Tue, 19 Nov 2019 10:46:10 -0500
Message-Id: <20191119154611.29625-4-TheSven73@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191119154611.29625-1-TheSven73@gmail.com>
References: <20191119154611.29625-1-TheSven73@gmail.com>
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
			label = "tps-led";
		};
	};
};

Example usage, platform data in machine layer:

 #include <linux/mfd/tps6105x.h>

 struct tps6105x_platform_data pdata = {
         .mode = TPS6105X_MODE_TORCH,
         .led_label = "tps-led",
 };

Tree: next-20191118
Signed-off-by: Sven Van Asbroeck <TheSven73@gmail.com>
---
 drivers/leds/Kconfig         | 10 +++++
 drivers/leds/Makefile        |  1 +
 drivers/leds/leds-tps6105x.c | 87 ++++++++++++++++++++++++++++++++++++
 include/linux/mfd/tps6105x.h |  1 +
 4 files changed, 99 insertions(+)
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
index 000000000000..87dbe4846df6
--- /dev/null
+++ b/drivers/leds/leds-tps6105x.c
@@ -0,0 +1,87 @@
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
+static const char *label_from_dt(struct device *dev)
+{
+	struct device_node *led =
+		of_get_child_by_name(dev->parent->of_node, "led");
+	const char *label;
+
+	if (!led) {
+		dev_err(dev, "led node not found");
+		return NULL;
+	}
+	if (of_property_read_string(led, "label", &label))
+		label = NULL;
+	of_node_put(led);
+
+	return label;
+}
+
+static int tps6105x_led_probe(struct platform_device *pdev)
+{
+	struct tps6105x *tps6105x = dev_get_platdata(&pdev->dev);
+	struct tps6105x_platform_data *pdata = tps6105x->pdata;
+	struct tps6105x_priv *priv;
+	const char *label;
+	int ret;
+
+	/* This instance is not set for torch mode so bail out */
+	if (pdata->mode != TPS6105X_MODE_TORCH) {
+		dev_info(&pdev->dev,
+			"chip not in torch mode, exit probe");
+		return -EINVAL;
+	}
+
+	label = pdata->led_label ?: label_from_dt(&pdev->dev);
+	label = label ?: "tps6105x";
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+	priv->regmap = tps6105x->regmap;
+	priv->cdev.name = label;
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
diff --git a/include/linux/mfd/tps6105x.h b/include/linux/mfd/tps6105x.h
index b1313411ef09..287a67e004f8 100644
--- a/include/linux/mfd/tps6105x.h
+++ b/include/linux/mfd/tps6105x.h
@@ -78,6 +78,7 @@ enum tps6105x_mode {
 struct tps6105x_platform_data {
 	enum tps6105x_mode mode;
 	struct regulator_init_data *regulator_data;
+	const char *led_label;
 };
 
 /**
-- 
2.17.1

