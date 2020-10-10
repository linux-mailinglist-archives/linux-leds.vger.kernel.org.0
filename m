Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07AE7289C95
	for <lists+linux-leds@lfdr.de>; Sat, 10 Oct 2020 02:10:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728692AbgJJAKR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 9 Oct 2020 20:10:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728661AbgJJAHU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 9 Oct 2020 20:07:20 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 339C2C0613D5
        for <linux-leds@vger.kernel.org>; Fri,  9 Oct 2020 17:07:19 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id k18so11359425wmj.5
        for <linux-leds@vger.kernel.org>; Fri, 09 Oct 2020 17:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QS8xDYwZFTAq/mhXLU8tsIze5WcXF70j6DsRUzissHY=;
        b=13U9FYP7YuaVaNNl90WCGV5Uqc332yzGGzu8DlOl6UThXhzr6R7vFYaJ/cMbCfbthC
         yMShnZWiSIR1Y3pJbokCis3TvUSfFKNIcPFBLIhvHKe1NXCsj3ANYCI4QoJbBeawHhvv
         U/NQVBbLJCwdyrceOz48C5IKOGhVRcXJUbATgQ2/pqhAo03mh42Ym0MkRtH2ZFcoY5bc
         zGQR/wRLiTBq1Qau3HsFwx0y5wD78Wygr2D67GqBucE7K8ZlA+WK7VldwZAl1B4wFPXE
         NH3048E3z5hftvkx7qdRVGXbPDdCQLhl6iw9yeg4IErgpy3y4p0Uc2LUS3Ah96R7LA6F
         WuGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QS8xDYwZFTAq/mhXLU8tsIze5WcXF70j6DsRUzissHY=;
        b=nnKXbapQTkoil67Qfswo7EkN76TbSNdwyV6Jj8GPBKF1iDLgL3ORTuUYU35AjIn9mC
         8JlGPf01aC/vOF3+CRWATB1XHDAyjWQuIuexns7EOb8SH/IaVnEeKujH0BW3ro7ixDDJ
         7ntsK3nldRmm9B/CREH4NZkvXXUUR+dCzyg4QPHcjtu4nb9zuYx5pEChGPRXpIb0XrCR
         vpC9gyGQLO7eR2kv5LUTZ41yj2fJuUPJG0cnyXfPbuzgrdLaDVE02MHGfOOYGf6wOG1y
         zCW5g6YD07uoCC7D5KctPqVAMcuPO1oIBl+FRgQDYXltMNkqqWkTP3MSNiRRg5qFoC7o
         yAKg==
X-Gm-Message-State: AOAM531m0ly7zy14FHHavm2HWeVjbviOyqJl+0+lOFRclw0+fWXBmSCk
        ce2eqe/2oNfNShAh0baBIMNOXKXXkzcyjg==
X-Google-Smtp-Source: ABdhPJwUhQuAgbVTlIdUYnpBJYTOfEda12EzRPj/nfIjOoo3Mc3HO9RJeZb+PVDdiCLYc9381z6oqA==
X-Received: by 2002:a1c:1f12:: with SMTP id f18mr331178wmf.15.1602288437871;
        Fri, 09 Oct 2020 17:07:17 -0700 (PDT)
Received: from localhost.localdomain ([2a00:ee2:4b0d:3001:fbc5:498b:ed6d:cfac])
        by smtp.gmail.com with ESMTPSA id z15sm14425326wrq.24.2020.10.09.17.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 17:07:16 -0700 (PDT)
From:   Luka Kovacic <luka.kovacic@sartura.hr>
To:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-leds@vger.kernel.org, pavel@ucw.cz
Cc:     lee.jones@linaro.org, dmurphy@ti.com, robh+dt@kernel.org,
        jdelvare@suse.com, linux@roeck-us.net, marek.behun@nic.cz,
        luka.perkov@sartura.hr, robert.marko@sartura.hr,
        Luka Kovacic <luka.kovacic@sartura.hr>
Subject: [PATCH v5 4/7] drivers: leds: Add the iEi WT61P803 PUZZLE LED driver
Date:   Sat, 10 Oct 2020 02:06:44 +0200
Message-Id: <20201010000644.36220-1-luka.kovacic@sartura.hr>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <CADZsf3Y=Z9pys=g1QtN=+vhLDV=NVK=rbF14Duv50expF=gzeA@mail.gmail.com>
References: <CADZsf3Y=Z9pys=g1QtN=+vhLDV=NVK=rbF14Duv50expF=gzeA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add support for the iEi WT61P803 PUZZLE LED driver.
Currently only the front panel power LED is supported.

This driver depends on the iEi WT61P803 PUZZLE MFD driver.

Signed-off-by: Luka Kovacic <luka.kovacic@sartura.hr>
Cc: Luka Perkov <luka.perkov@sartura.hr>
Cc: Robert Marko <robert.marko@sartura.hr>
---
Changes for v5:
   - Remove the return before goto to also fwnode_handle_put(child)
when ret is 0.

This change will be added to the patchset changelog.

 drivers/leds/Kconfig                    |   8 ++
 drivers/leds/Makefile                   |   1 +
 drivers/leds/leds-iei-wt61p803-puzzle.c | 155 ++++++++++++++++++++++++
 3 files changed, 164 insertions(+)
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
index 000000000000..4e287572b1f5
--- /dev/null
+++ b/drivers/leds/leds-iei-wt61p803-puzzle.c
@@ -0,0 +1,155 @@
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
+ * @mcu:		MCU struct pointer
+ * @response_buffer	Global MCU response buffer allocation
+ * @lock:		General mutex lock to protect simultaneous R/W access to led_power_state
+ * @led_power_state:	State of the front panel power LED
+ * @cdev:		LED classdev
+ */
+struct iei_wt61p803_puzzle_led {
+	struct iei_wt61p803_puzzle *mcu;
+	unsigned char *response_buffer;
+	struct mutex lock;
+	int led_power_state;
+	struct led_classdev cdev;
+};
+
+static inline struct iei_wt61p803_puzzle_led *cdev_to_iei_wt61p803_puzzle_led
+	(struct led_classdev *led_cdev)
+{
+	return dev_get_drvdata(led_cdev->dev->parent);
+}
+
+static int iei_wt61p803_puzzle_led_brightness_set_blocking(struct led_classdev *cdev,
+							   enum led_brightness brightness)
+{
+	struct iei_wt61p803_puzzle_led *priv = cdev_to_iei_wt61p803_puzzle_led(cdev);
+	unsigned char *resp_buf = priv->response_buffer;
+	unsigned char led_power_cmd[5] = {
+		IEI_WT61P803_PUZZLE_CMD_HEADER_START,
+		IEI_WT61P803_PUZZLE_CMD_LED,
+		IEI_WT61P803_PUZZLE_CMD_LED_POWER,
+		(char)IEI_LED_OFF
+	};
+	size_t reply_size;
+
+	mutex_lock(&priv->lock);
+	if (brightness == LED_OFF) {
+		led_power_cmd[3] = (char)IEI_LED_OFF;
+		priv->led_power_state = LED_OFF;
+	} else {
+		led_power_cmd[3] = (char)IEI_LED_ON;
+		priv->led_power_state = LED_ON;
+	}
+	mutex_unlock(&priv->lock);
+
+	return iei_wt61p803_puzzle_write_command(priv->mcu, led_power_cmd,
+			sizeof(led_power_cmd), resp_buf, &reply_size);
+}
+
+static enum led_brightness
+iei_wt61p803_puzzle_led_brightness_get(struct led_classdev *cdev)
+{
+	struct iei_wt61p803_puzzle_led *priv =
+		cdev_to_iei_wt61p803_puzzle_led(cdev);
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
+		dev_err(dev, "Could not register 'reg' (%lu)\n", (unsigned long)reg);
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

