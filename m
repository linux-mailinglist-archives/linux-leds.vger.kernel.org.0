Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 670453F5E41
	for <lists+linux-leds@lfdr.de>; Tue, 24 Aug 2021 14:46:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237408AbhHXMri (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 24 Aug 2021 08:47:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237381AbhHXMrf (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 24 Aug 2021 08:47:35 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A41AC06129E
        for <linux-leds@vger.kernel.org>; Tue, 24 Aug 2021 05:46:50 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id l7-20020a1c2507000000b002e6be5d86b3so2231401wml.3
        for <linux-leds@vger.kernel.org>; Tue, 24 Aug 2021 05:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y7XVmNtUHcirytMFNhQwNXF7iiYbnCyuCnpJ15AR8Ds=;
        b=RDNjDQuqBK/2+S+Swkj6n/EQUnaPiRP1ORqRLpI3kPPv9wM2DVWD4R6l7iYXezIrCX
         bBD3PXO4bnzY6I6tVY2ZdffxVBnKYjEZBDVKEf8uf9B2AmHefOEJBGLQVRVJDm/Ik6Fe
         lQxEtvOEwNQVNBwMcEqY7m8Q4O8yGBgrWsKwZbOE2GxMoALP2oJcyoBvM5S33qKmqChv
         Rj3paaSljv2en6HOk9WlpI9KN2ATVOiusYcEyDlv7wzXwIm/jajDifrPjLvHXszUPC40
         EG5UaD/I4z+7QGZYQVpCT1PNNl0PDJcREJG6dbhiiW2fn8XBwjWGkslhkE8K4ZFH70ap
         bxAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y7XVmNtUHcirytMFNhQwNXF7iiYbnCyuCnpJ15AR8Ds=;
        b=tjrt7WZh5ozLo1xsxx3p3aGefOUGhm5uVWG4ska/WRRruEM9aJ+Z1ahHOfBH0GvHS3
         LOWpTW1i6xds7zP7wmrC4QKPCuaflcvVMYlyYHlMxHuKZEwkiPnVx2zT+/PUsL667Vjh
         Vex+fqJqxBHLoKZ0+tcIW9xU3vUY8CyQdINZZFTmv3+Pd3pOF1h9jRL1FDAuxYUy2Ky6
         LF0saqSdhsxpviit6ppwltTLn6/pJiRM6xfCLR8iwfT/Ix7e/R/4YF6faaTQmu1O5384
         VZwZncnqbn5jA3SOm9NI4cPcFShYLSaT0mK9223CvW1d4x2l+qAvRVGipV1xHebiPLta
         EHjA==
X-Gm-Message-State: AOAM531AWkC6Ize/GEfpKd83DP4gT5HclltDjGHJ9cOjcp9ZLaiROO4U
        2fZoGyNsu3vuABvstJPcBzTZGg==
X-Google-Smtp-Source: ABdhPJxodLcGaQCQ2uB5/ygFlqr1RyHNBrgSt0h4WGFQ2HlsU82sRxfdI0E9xOYUQbFP8HsYHBEf8g==
X-Received: by 2002:a7b:c5c7:: with SMTP id n7mr4075017wmk.5.1629809209029;
        Tue, 24 Aug 2021 05:46:49 -0700 (PDT)
Received: from localhost.localdomain ([2a00:ee2:4b0d:3001:fe74:75c8:e909:251b])
        by smtp.gmail.com with ESMTPSA id i14sm2255454wmq.40.2021.08.24.05.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 05:46:48 -0700 (PDT)
From:   Luka Kovacic <luka.kovacic@sartura.hr>
To:     linux-doc@vger.kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, geert+renesas@glider.be,
        Max.Merchel@tq-group.com, linux@rempel-privat.de, daniel@0x0f.com,
        shawnguo@kernel.org, sam@ravnborg.org, arnd@arndb.de,
        krzysztof.kozlowski@canonical.com, pavo.banicevic@sartura.hr,
        corbet@lwn.net, lee.jones@linaro.org, pavel@ucw.cz,
        robh+dt@kernel.org, linux@roeck-us.net, jdelvare@suse.com,
        goran.medic@sartura.hr, luka.perkov@sartura.hr,
        robert.marko@sartura.hr
Cc:     Luka Kovacic <luka.kovacic@sartura.hr>
Subject: [PATCH v9 4/7] drivers: leds: Add the IEI WT61P803 PUZZLE LED driver
Date:   Tue, 24 Aug 2021 14:44:35 +0200
Message-Id: <20210824124438.14519-5-luka.kovacic@sartura.hr>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210824124438.14519-1-luka.kovacic@sartura.hr>
References: <20210824124438.14519-1-luka.kovacic@sartura.hr>
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
Signed-off-by: Pavo Banicevic <pavo.banicevic@sartura.hr>
Cc: Luka Perkov <luka.perkov@sartura.hr>
Cc: Robert Marko <robert.marko@sartura.hr>
---
 drivers/leds/Kconfig                    |   8 ++
 drivers/leds/Makefile                   |   1 +
 drivers/leds/leds-iei-wt61p803-puzzle.c | 147 ++++++++++++++++++++++++
 3 files changed, 156 insertions(+)
 create mode 100644 drivers/leds/leds-iei-wt61p803-puzzle.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index bdf16180f5ff..702ffd98486b 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -333,6 +333,14 @@ config LEDS_IPAQ_MICRO
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
index 7e604d3028c8..2cae3d7e5b1b 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -35,6 +35,7 @@ obj-$(CONFIG_LEDS_HP6XX)		+= leds-hp6xx.o
 obj-$(CONFIG_LEDS_INTEL_SS4200)		+= leds-ss4200.o
 obj-$(CONFIG_LEDS_IP30)			+= leds-ip30.o
 obj-$(CONFIG_LEDS_IPAQ_MICRO)		+= leds-ipaq-micro.o
+obj-$(CONFIG_LEDS_IEI_WT61P803_PUZZLE)	+= leds-iei-wt61p803-puzzle.o
 obj-$(CONFIG_LEDS_IS31FL319X)		+= leds-is31fl319x.o
 obj-$(CONFIG_LEDS_IS31FL32XX)		+= leds-is31fl32xx.o
 obj-$(CONFIG_LEDS_KTD2692)		+= leds-ktd2692.o
diff --git a/drivers/leds/leds-iei-wt61p803-puzzle.c b/drivers/leds/leds-iei-wt61p803-puzzle.c
new file mode 100644
index 000000000000..67d542d6ac72
--- /dev/null
+++ b/drivers/leds/leds-iei-wt61p803-puzzle.c
@@ -0,0 +1,147 @@
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
+ * @response_buffer	Global MCU response buffer
+ * @lock:		General mutex lock to protect simultaneous R/W access to led_power_state
+ * @led_power_state:	State of the front panel power LED
+ */
+struct iei_wt61p803_puzzle_led {
+	struct led_classdev cdev;
+	struct iei_wt61p803_puzzle *mcu;
+	unsigned char response_buffer[IEI_WT61P803_PUZZLE_BUF_SIZE];
+	struct mutex lock; /* mutex to protect led_power_state */
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
+
+	if (device_get_child_node_count(dev) != 1)
+		return -EINVAL;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->mcu = mcu;
+	priv->led_power_state = 1;
+	mutex_init(&priv->lock);
+	dev_set_drvdata(dev, priv);
+
+	child = device_get_next_child_node(dev, NULL);
+	init_data.fwnode = child;
+
+	priv->cdev.brightness_set_blocking = iei_wt61p803_puzzle_led_brightness_set_blocking;
+	priv->cdev.brightness_get = iei_wt61p803_puzzle_led_brightness_get;
+	priv->cdev.max_brightness = 1;
+
+	ret = devm_led_classdev_register_ext(dev, &priv->cdev, &init_data);
+	if (ret)
+		dev_err(dev, "Could not register LED\n");
+
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
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:leds-iei-wt61p803-puzzle");
-- 
2.31.1

