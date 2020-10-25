Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72531297FBE
	for <lists+linux-leds@lfdr.de>; Sun, 25 Oct 2020 02:59:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1766005AbgJYA7z (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 24 Oct 2020 20:59:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1765988AbgJYA7k (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 24 Oct 2020 20:59:40 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 890FEC0613D2
        for <linux-leds@vger.kernel.org>; Sat, 24 Oct 2020 17:59:39 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id z5so8182115ejw.7
        for <linux-leds@vger.kernel.org>; Sat, 24 Oct 2020 17:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pNka07v35n6GgBVGUaqQWih7YFOHx7rnG3PDXmNysho=;
        b=EcpONYT0ZNR8buT9HysoZKNwlGo4hOdFTwyHgjKHQRUx//KMIUOZgwYkNYvRMAx6St
         SpStmG4Uru+Cxy7xuXNBHOUb5ukMc4N/t2O+sMF9D0IlRZmLL0ZDlclvT7l7BLrDWqZC
         kEIVSldHjKsRIaSOYLonAqbln8AmBBfHPZYVt+UnWap+hHb+dH1qvGY50/ppx6tDluJa
         4uQLKJ+d58G/JA7tepNLWmEO2mBA5TxEW/eaQr8r3UQ7xpyC/8hQZLHY+xiQPQ0KMCM/
         JjXhsrri4dkRcYEYAT4ZAz9zh7EoU9zDsKpiA7Ze47E4634dAnGTYBJDniKYBZIdMrSY
         XgUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pNka07v35n6GgBVGUaqQWih7YFOHx7rnG3PDXmNysho=;
        b=DDZqi2luH5xVNB6RHWQFP9zRGIG1M/avT9JCPOZwNrtflvZBeVYXarsektqJKjFctK
         v82vH8NID5B2xINbypcUqTK/riatSWBd2rBmIwkxZKuGyKg4tF0BwhJUC0mnXMzGPCQO
         +LVhI5IIJ1JiDtHAgytrYnkVmz+UEr4uhQaFcZLkEEslMFZKDP/wfCnFSx9GyLK82Jus
         ZMWRhmcHJO4F43enbdlziIYmvTsToDGIsaOoCa60u6TiWrTpwFVMBu+pkVdjsfpnTcFR
         Y6MyFbtT7MtmaxDvWQSuGW2Ms1Tg7mBfYgzApIDDm4Rbeao0Vs6DGiupGLnoN1F9+QoM
         KxRw==
X-Gm-Message-State: AOAM533XRIvLEnLCtIB2P1OhLlDHahqjQmLL9d39qBuFcvolAWeaQK2e
        DNe7hvvK1AIQCuTuqflmiRvhdQ==
X-Google-Smtp-Source: ABdhPJzY+QvHOZ2QjJYNSLdieJ8BD30QoPWiBVY2MBle/4hccJm1XwsxCDi8yIvI1s+/ISzzm4QmCw==
X-Received: by 2002:a17:906:158e:: with SMTP id k14mr8851965ejd.496.1603587576699;
        Sat, 24 Oct 2020 17:59:36 -0700 (PDT)
Received: from localhost.localdomain ([2a00:ee2:4b0d:3001:fbc5:498b:ed6d:cfac])
        by smtp.gmail.com with ESMTPSA id q5sm2797274edt.79.2020.10.24.17.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2020 17:59:36 -0700 (PDT)
From:   Luka Kovacic <luka.kovacic@sartura.hr>
To:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Cc:     lee.jones@linaro.org, pavel@ucw.cz, dmurphy@ti.com,
        robh+dt@kernel.org, jdelvare@suse.com, linux@roeck-us.net,
        marek.behun@nic.cz, luka.perkov@sartura.hr,
        andy.shevchenko@gmail.com, robert.marko@sartura.hr,
        Luka Kovacic <luka.kovacic@sartura.hr>
Subject: [PATCH v7 4/6] drivers: leds: Add the IEI WT61P803 PUZZLE LED driver
Date:   Sun, 25 Oct 2020 02:59:14 +0200
Message-Id: <20201025005916.64747-5-luka.kovacic@sartura.hr>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201025005916.64747-1-luka.kovacic@sartura.hr>
References: <20201025005916.64747-1-luka.kovacic@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add support for the IEI WT61P803 PUZZLE LED driver.
Currently only the front panel power LED is supported,
since it is the only LED on this board wired through the
MCU.

The LED is wired directly to the on-board MCU controller
and is toggled using an MCU command.

Support for more LEDs is going to be added in case more
boards implement this microcontroller, as LEDs use many
different GPIOs.

This driver depends on the IEI WT61P803 PUZZLE MFD driver.

Signed-off-by: Luka Kovacic <luka.kovacic@sartura.hr>
Cc: Luka Perkov <luka.perkov@sartura.hr>
Cc: Robert Marko <robert.marko@sartura.hr>
---
 drivers/leds/Kconfig                    |   8 ++
 drivers/leds/Makefile                   |   1 +
 drivers/leds/leds-iei-wt61p803-puzzle.c | 161 ++++++++++++++++++++++++
 3 files changed, 170 insertions(+)
 create mode 100644 drivers/leds/leds-iei-wt61p803-puzzle.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 1c181df24eae..9028d9bb90b8 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -332,6 +332,14 @@ config LEDS_IPAQ_MICRO
 	  Choose this option if you want to use the notification LED on
 	  Compaq/HP iPAQ h3100 and h3600.
 
+config LEDS_IEI_WT61P803_PUZZLE
+	tristate "LED Support for the IEI WT61P803 PUZZLE MCU"
+	depends on LEDS_CLASS
+	depends on MFD_IEI_WT61P803_PUZZLE
+	help
+	  This option enables support for LEDs controlled by the IEI WT61P803
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
index 000000000000..e52394b9d96c
--- /dev/null
+++ b/drivers/leds/leds-iei-wt61p803-puzzle.c
@@ -0,0 +1,161 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* IEI WT61P803 PUZZLE MCU LED Driver
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
+	int ret;
+
+	led_power_cmd[0] = IEI_WT61P803_PUZZLE_CMD_HEADER_START;
+	led_power_cmd[1] = IEI_WT61P803_PUZZLE_CMD_LED;
+	led_power_cmd[2] = IEI_WT61P803_PUZZLE_CMD_LED_POWER;
+	led_power_cmd[3] = brightness == LED_OFF ? IEI_LED_OFF : IEI_LED_ON;
+
+	ret = iei_wt61p803_puzzle_write_command(priv->mcu, led_power_cmd,
+						sizeof(led_power_cmd),
+						resp_buf,
+						&reply_size);
+	if (ret)
+		return ret;
+
+	if (reply_size != 3)
+		return -EIO;
+
+	if (!(resp_buf[0] == IEI_WT61P803_PUZZLE_CMD_HEADER_START &&
+	      resp_buf[1] == IEI_WT61P803_PUZZLE_CMD_RESPONSE_OK &&
+	      resp_buf[2] == IEI_WT61P803_PUZZLE_CHECKSUM_RESPONSE_OK))
+		return -EIO;
+
+	mutex_lock(&priv->lock);
+	priv->led_power_state = brightness;
+	mutex_unlock(&priv->lock);
+
+	return 0;
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
+MODULE_DESCRIPTION("IEI WT61P803 PUZZLE front panel LED driver");
+MODULE_AUTHOR("Luka Kovacic <luka.kovacic@sartura.hr>");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:leds-iei-wt61p803-puzzle");
-- 
2.26.2

