Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9AF129311E
	for <lists+linux-leds@lfdr.de>; Tue, 20 Oct 2020 00:19:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388014AbgJSWT2 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 19 Oct 2020 18:19:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387424AbgJSWT2 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 19 Oct 2020 18:19:28 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF1D5C0613D0
        for <linux-leds@vger.kernel.org>; Mon, 19 Oct 2020 15:19:27 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id dt13so1207588ejb.12
        for <linux-leds@vger.kernel.org>; Mon, 19 Oct 2020 15:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RR8Nr+xk+QEPqp6m6g6RlkRiz8BiFUghM6ZNheBBB3U=;
        b=BHdCUbG7genEjsAIqDRmPikfazw931eqSKq8tm5TtTbDJgbr+svMLw0A7kiYlTPro/
         y2xi9CeYivJijua9jGu8QvNmwQ1qnTrNf4hMURC33j8dvphux5i4tkvGBN4A47orx8MF
         nLIo35kgIxIdrsYIAZjF7h3cTrYENvkUgFyHp+/wVcEL8cyT/w8ImflgxOvbkrlC9/yI
         A2cQN52zGHSH0sbDbQe25GvrJIOPeJ38jlo87gbpbtCETR0VB0YPepkFDluZJsfprkSH
         coqbvFjpLKn+2a7cMPc/qTqpXzUg4zbhbU5J73sS/7ynHlbSH+vpL9Wh5qM4ZND7WeCv
         XnMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RR8Nr+xk+QEPqp6m6g6RlkRiz8BiFUghM6ZNheBBB3U=;
        b=gyc/FTms4E8oFF0qL7Dt4cyMzZN03pu7uUBUrLerlCj+f5O7/gTG51PaBw4VQaEY7O
         sJv+SqZqH7Ap8rjKzv4W1Bn7g5vAYflkm0+HwuUjLcpNu3bYDRe4KH5tp8KLvyBIHmXZ
         +TMKqOx61kSVNa7MvuQTOmzUjVxIZEpSR40w7Ycs8EnsKi7qtlP+fnbsDfaypuGDmzcZ
         gOKls1MjQ/MD3v06+453TgJ7XRoBzJt/Ofr+CoDi8jKTuwULMd1U9xY2IB4TuOcTRlWx
         EsxdSEDexZPZbMOfRNepgk8i0l+oMBkNp5gLvGaiA+8h6k0yh6Oq+sxUaL6shQGpSDej
         4CJw==
X-Gm-Message-State: AOAM5318H28WxhGzhYBMxuj8g1KdZYLXVVhO2fU2u72YF9qQY7pV0xWm
        +WUNcYflIWyxeMr7h8Ews1ZnVw==
X-Google-Smtp-Source: ABdhPJwekWaGdc7eut7TI9hd2lDls8YTuZuVXj4d2nHwj230jID2xYH0L/QbTn04NE7mvY2QmuiaQA==
X-Received: by 2002:a17:906:118f:: with SMTP id n15mr10212eja.394.1603145966587;
        Mon, 19 Oct 2020 15:19:26 -0700 (PDT)
Received: from localhost.localdomain ([2a00:ee2:4b0d:3001:fbc5:498b:ed6d:cfac])
        by smtp.gmail.com with ESMTPSA id e17sm1645400ejh.64.2020.10.19.15.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 15:19:25 -0700 (PDT)
From:   Luka Kovacic <luka.kovacic@sartura.hr>
To:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Cc:     lee.jones@linaro.org, pavel@ucw.cz, dmurphy@ti.com,
        robh+dt@kernel.org, jdelvare@suse.com, linux@roeck-us.net,
        marek.behun@nic.cz, luka.perkov@sartura.hr,
        andy.shevchenko@gmail.com, robert.marko@sartura.hr,
        Luka Kovacic <luka.kovacic@sartura.hr>
Subject: [PATCH v6 4/6] drivers: leds: Add the iEi WT61P803 PUZZLE LED driver
Date:   Tue, 20 Oct 2020 00:18:57 +0200
Message-Id: <20201019221859.56680-5-luka.kovacic@sartura.hr>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201019221859.56680-1-luka.kovacic@sartura.hr>
References: <20201019221859.56680-1-luka.kovacic@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add support for the iEi WT61P803 PUZZLE LED driver.
Currently only the front panel power LED is supported,
since it is the only LED on this board wired through the
MCU.

The LED is wired directly to the on-board MCU controller
and is toggled using an MCU command.

Support for more LEDs is going to be added in case more
boards implement this microcontroller, as LEDs use many
different GPIOs.

This driver depends on the iEi WT61P803 PUZZLE MFD driver.

Signed-off-by: Luka Kovacic <luka.kovacic@sartura.hr>
Cc: Luka Perkov <luka.perkov@sartura.hr>
Cc: Robert Marko <robert.marko@sartura.hr>
---
 drivers/leds/Kconfig                    |   8 ++
 drivers/leds/Makefile                   |   1 +
 drivers/leds/leds-iei-wt61p803-puzzle.c | 147 ++++++++++++++++++++++++
 3 files changed, 156 insertions(+)
 create mode 100644 drivers/leds/leds-iei-wt61p803-puzzle.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 1c181df24eae..8a25fb753dec 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -332,6 +332,14 @@ config LEDS_IPAQ_MICRO
 	  Choose this option if you want to use the notification LED on
 	  Compaq/HP iPAQ h3100 and h3600.
 
+config LEDS_IEI_WT61P803_PUZZLE
+	tristate "LED Support for the iEi WT61P803 PUZZLE MCU"
+	depends on LEDS_CLASS
+	depends on MFD_IEI_WT61P803_PUZZLE
+	help
+	  This option enables support for LEDs controlled by the iEi WT61P803
+	  M801 MCU.
+
 config LEDS_HP6XX
 	tristate "LED Support for the HP Jornada 6xx"
 	depends on LEDS_CLASS
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index c2c7d7ade0d0..cd362437fefd 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -34,6 +34,7 @@ obj-$(CONFIG_LEDS_HP6XX)		+= leds-hp6xx.o
 obj-$(CONFIG_LEDS_INTEL_SS4200)		+= leds-ss4200.o
 obj-$(CONFIG_LEDS_IP30)			+= leds-ip30.o
 obj-$(CONFIG_LEDS_IPAQ_MICRO)		+= leds-ipaq-micro.o
+obj-$(CONFIG_LEDS_IEI_WT61P803_PUZZLE)	+= leds-iei-wt61p803-puzzle.o
 obj-$(CONFIG_LEDS_IS31FL319X)		+= leds-is31fl319x.o
 obj-$(CONFIG_LEDS_IS31FL32XX)		+= leds-is31fl32xx.o
 obj-$(CONFIG_LEDS_KTD2692)		+= leds-ktd2692.o
diff --git a/drivers/leds/leds-iei-wt61p803-puzzle.c b/drivers/leds/leds-iei-wt61p803-puzzle.c
new file mode 100644
index 000000000000..ca5c19c9df8c
--- /dev/null
+++ b/drivers/leds/leds-iei-wt61p803-puzzle.c
@@ -0,0 +1,147 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* iEi WT61P803 PUZZLE MCU LED Driver
+ *
+ * Copyright (C) 2020 Sartura Ltd.
+ * Author: Luka Kovacic <luka.kovacic@sartura.hr>
+ */
+
+#include <linux/leds.h>
+#include <linux/mfd/iei-wt61p803-puzzle.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/slab.h>
+
+enum iei_wt61p803_puzzle_led_state {
+	IEI_LED_OFF = 0x30,
+	IEI_LED_ON = 0x31,
+	IEI_LED_BLINK_5HZ = 0x32,
+	IEI_LED_BLINK_1HZ = 0x33,
+};
+
+/**
+ * struct iei_wt61p803_puzzle_led - MCU LED Driver
+ *
+ * @cdev:		LED classdev
+ * @mcu:		MCU struct pointer
+ * @response_buffer	Global MCU response buffer allocation
+ * @lock:		General mutex lock to protect simultaneous R/W access to led_power_state
+ * @led_power_state:	State of the front panel power LED
+ */
+struct iei_wt61p803_puzzle_led {
+	struct led_classdev cdev;
+	struct iei_wt61p803_puzzle *mcu;
+	unsigned char *response_buffer;
+	struct mutex lock;
+	int led_power_state;
+};
+
+static inline struct iei_wt61p803_puzzle_led *cdev_to_iei_wt61p803_puzzle_led
+	(struct led_classdev *led_cdev)
+{
+	return container_of(led_cdev, struct iei_wt61p803_puzzle_led, cdev);
+}
+
+static int iei_wt61p803_puzzle_led_brightness_set_blocking(struct led_classdev *cdev,
+							   enum led_brightness brightness)
+{
+	struct iei_wt61p803_puzzle_led *priv = cdev_to_iei_wt61p803_puzzle_led(cdev);
+	unsigned char *resp_buf = priv->response_buffer;
+	unsigned char led_power_cmd[5] = {};
+	size_t reply_size;
+
+	led_power_cmd[0] = IEI_WT61P803_PUZZLE_CMD_HEADER_START;
+	led_power_cmd[1] = IEI_WT61P803_PUZZLE_CMD_LED;
+	led_power_cmd[2] = IEI_WT61P803_PUZZLE_CMD_LED_POWER;
+	led_power_cmd[3] = brightness == LED_OFF ? IEI_LED_OFF : IEI_LED_ON;
+
+	mutex_lock(&priv->lock);
+	priv->led_power_state = brightness;
+	mutex_unlock(&priv->lock);
+
+	return iei_wt61p803_puzzle_write_command(priv->mcu, led_power_cmd,
+			sizeof(led_power_cmd), resp_buf, &reply_size);
+}
+
+static enum led_brightness iei_wt61p803_puzzle_led_brightness_get(struct led_classdev *cdev)
+{
+	struct iei_wt61p803_puzzle_led *priv = cdev_to_iei_wt61p803_puzzle_led(cdev);
+	int led_state;
+
+	mutex_lock(&priv->lock);
+	led_state = priv->led_power_state;
+	mutex_unlock(&priv->lock);
+
+	return led_state;
+}
+
+static int iei_wt61p803_puzzle_led_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct iei_wt61p803_puzzle *mcu = dev_get_drvdata(dev->parent);
+	struct iei_wt61p803_puzzle_led *priv;
+	struct led_init_data init_data = {};
+	struct fwnode_handle *child;
+	int ret;
+	u32 reg;
+
+	if (device_get_child_node_count(dev) != 1)
+		return -EINVAL;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->response_buffer = devm_kzalloc(dev, IEI_WT61P803_PUZZLE_BUF_SIZE, GFP_KERNEL);
+	if (!priv->response_buffer)
+		return -ENOMEM;
+
+	priv->mcu = mcu;
+	priv->led_power_state = 1;
+	mutex_init(&priv->lock);
+	dev_set_drvdata(dev, priv);
+
+	child = device_get_next_child_node(dev, NULL);
+
+	ret = fwnode_property_read_u32(child, "reg", &reg);
+	if (ret || reg > 1) {
+		dev_err(dev, "Could not register 'reg' (%u)\n", reg);
+		ret = -EINVAL;
+		goto err_child_node;
+	}
+
+	priv->cdev.brightness_set_blocking = iei_wt61p803_puzzle_led_brightness_set_blocking;
+	priv->cdev.brightness_get = iei_wt61p803_puzzle_led_brightness_get;
+	priv->cdev.max_brightness = 1;
+	init_data.fwnode = child;
+
+	ret = devm_led_classdev_register_ext(dev, &priv->cdev, &init_data);
+	if (ret) {
+		dev_err(dev, "Could not register LED\n");
+		goto err_child_node;
+	}
+err_child_node:
+	fwnode_handle_put(child);
+	return ret;
+}
+
+static const struct of_device_id iei_wt61p803_puzzle_led_of_match[] = {
+	{ .compatible = "iei,wt61p803-puzzle-leds" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, iei_wt61p803_puzzle_led_of_match);
+
+static struct platform_driver iei_wt61p803_puzzle_led_driver = {
+	.driver = {
+		.name = "iei-wt61p803-puzzle-led",
+		.of_match_table = iei_wt61p803_puzzle_led_of_match,
+	},
+	.probe = iei_wt61p803_puzzle_led_probe,
+};
+module_platform_driver(iei_wt61p803_puzzle_led_driver);
+
+MODULE_DESCRIPTION("iEi WT61P803 PUZZLE front panel LED driver");
+MODULE_AUTHOR("Luka Kovacic <luka.kovacic@sartura.hr>");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:leds-iei-wt61p803-puzzle");
-- 
2.26.2

