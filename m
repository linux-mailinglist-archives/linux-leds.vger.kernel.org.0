Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A21E13BBDC7
	for <lists+linux-leds@lfdr.de>; Mon,  5 Jul 2021 15:48:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231378AbhGENvG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 5 Jul 2021 09:51:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231394AbhGENuw (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 5 Jul 2021 09:50:52 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC51DC06175F
        for <linux-leds@vger.kernel.org>; Mon,  5 Jul 2021 06:48:14 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id o5so29150882ejy.7
        for <linux-leds@vger.kernel.org>; Mon, 05 Jul 2021 06:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VcpOMuXcShCpD/XoKUlzwQnoFoS0pXoag7BOhoXDaJU=;
        b=jwa55ALpeJXJpzVc9hsCMBD36WwD7YaNiTx9B3lFxS+7mTmRQsj5FQiCEOMm4anzdA
         WCrVRUdAUQ3Te1GW4l3oqnu0f5Rf8AB24XOboTHgmlwaPrqMBlU181los33E1EgagVlo
         /K3CXiXjA5+BXdvZXTNcPA3m9JrfDvw+ooHzS6LJ0ay4GSW/f+AXKwGO523wYW16SYFa
         eWQ40R7qyuG93Q2DCY9QmNS9NOeeANGaEBoFC+Mupeetk3W4Kxr/VdgoupoO/MjZAqCZ
         MueFiLwKE4ywWI3xMV+Yv3K8gP+qMvQ9HvhLfWefOhMIEa7G6P35q1qzuAjMJGpeFUQZ
         NqvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VcpOMuXcShCpD/XoKUlzwQnoFoS0pXoag7BOhoXDaJU=;
        b=V0rVlPjlwWlW2m8LqIX+HmMBCg1u52WreMDhavmvQ+/uvjgnOUtU3Hi80o7K0xy02S
         rxiCqzn+UNPkjDMVlBumhuy6g3KuTMJaVuz4Qz/yj3HXId7Qfr34dIhs7AgGXUG4ElA4
         TXJwIoUz3G9FdgmasiJ6+k9JLuLrLGsOZyAOycB5plpf0LVHw6RNxc1ZGJHPw62v7X3L
         Tq9jfp03Y9cwY5vbOHfOlmHCEM11MTf5NwzfN+w0dHhwCeaRrgURoJxiPWc61oJLw2DB
         JZ7fH/1pFuuDQ9V0uQcWDL1v6MajGI7fyZa17fai/lKSyBnzkdVgDAj7s670bpHrHs+a
         +z/A==
X-Gm-Message-State: AOAM530P7I0RCd0ZSWg3l731/Vo1ZLlvIGj9Zymh8vYF8lcDR8q8Jjeq
        UyRMNcVVKLUraiNbDvLYyDIV4Q==
X-Google-Smtp-Source: ABdhPJw3F/za44qaHw2nPlB9ImCeTx6kAgIAsqq8WeOoXxLmUtoIkS/yOr8Mj0Q8lt2+8Emw+kaKiQ==
X-Received: by 2002:a17:906:974f:: with SMTP id o15mr4136867ejy.476.1625492893246;
        Mon, 05 Jul 2021 06:48:13 -0700 (PDT)
Received: from localhost.localdomain ([89.18.44.40])
        by smtp.gmail.com with ESMTPSA id cf29sm1557637edb.14.2021.07.05.06.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jul 2021 06:48:12 -0700 (PDT)
From:   Pavo Banicevic <pavo.banicevic@sartura.hr>
To:     linux-doc@vger.kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, geert+renesas@glider.be,
        Max.Merchel@tq-group.com, linux@rempel-privat.de, daniel@0x0f.com,
        shawnguo@kernel.org, sam@ravnborg.org, arnd@arndb.de,
        krzysztof.kozlowski@canonical.com, pavo.banicevic@sartura.hr,
        corbet@lwn.net, lee.jones@linaro.org, pavel@ucw.cz,
        robh+dt@kernel.org, linux@roeck-us.net, jdelvare@suse.com,
        goran.medic@sartura.hr, luka.perkov@sartura.hr,
        luka.kovacic@sartura.hr
Cc:     Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v8 4/7] drivers: leds: Add the IEI WT61P803 PUZZLE LED driver
Date:   Mon,  5 Jul 2021 15:49:36 +0200
Message-Id: <20210705134939.28691-5-pavo.banicevic@sartura.hr>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210705134939.28691-1-pavo.banicevic@sartura.hr>
References: <20210705134939.28691-1-pavo.banicevic@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Luka Kovacic <luka.kovacic@sartura.hr>

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
 drivers/leds/leds-iei-wt61p803-puzzle.c | 156 ++++++++++++++++++++++++
 3 files changed, 165 insertions(+)
 create mode 100644 drivers/leds/leds-iei-wt61p803-puzzle.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 49d99cb084db..b6e6c6bc41ec 100644
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
index 000000000000..16beee7e5cd5
--- /dev/null
+++ b/drivers/leds/leds-iei-wt61p803-puzzle.c
@@ -0,0 +1,156 @@
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
+	struct mutex lock /* mutex to protect led_power_state */;
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
+	priv->mcu = mcu;
+	priv->led_power_state = 1;
+	mutex_init(&priv->lock);
+	dev_set_drvdata(dev, priv);
+
+	child = device_get_next_child_node(dev, NULL);
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
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:leds-iei-wt61p803-puzzle");
-- 
2.31.1

