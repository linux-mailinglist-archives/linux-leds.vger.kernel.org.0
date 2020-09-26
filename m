Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9FAC2799D5
	for <lists+linux-leds@lfdr.de>; Sat, 26 Sep 2020 15:55:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729323AbgIZNzp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 26 Sep 2020 09:55:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729289AbgIZNzo (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 26 Sep 2020 09:55:44 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FB21C0613CE
        for <linux-leds@vger.kernel.org>; Sat, 26 Sep 2020 06:55:44 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id e23so2422862eja.3
        for <linux-leds@vger.kernel.org>; Sat, 26 Sep 2020 06:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Hsp3YCzw8VGmBVnf7GdB1lWY+nEuDfnbfVPKkU5FWMA=;
        b=hmxQRgwYu0MyS2YlBxLlH/v7F0UCgO08jdddDXf5uvOrTAJ/8KDWlhSusDA4szI+P1
         jfo3UJ9LNC7S9bPfkQ3aGLXL+MmJBPn5m6XqO396WNOFpHPBWrD19CGbBdnPYC9L/wdo
         w2eYfzV79oy5qcLfG4sBdsfH+sMMVduSoYxfd6a4S8ncR9twpBvmG8V2NIftKyhmcUdV
         y8W3vcYUJ7v3tPj9fGfgsbjIGOXaWH3DIW8bC/4tLcCsuTwxu01TnMktjcbivnQ1Zgmj
         7cyj1OlAfy0tZqBhIUoPGUcy63taT9L9vgpLdFu9qctvKCv4eyKJCwcv+jk9a0PTr4Z1
         +jkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Hsp3YCzw8VGmBVnf7GdB1lWY+nEuDfnbfVPKkU5FWMA=;
        b=ZksyoCTd/EYufdetdr6Scd+Ko5ED4IWJjW9FQ1UkHUx5SLrPXAPlImmmqWSvEhtbsI
         zrwPUooE5VN0lDjva1TSaBCFg45huRNXcZrf2UA7nxbW7NRN9IXJa2s42eeGXWwzouc6
         tZ5SwOxQw/h7GUQFm9vlGRt7zZFcUd+MNrdmPGmTu85Q+7MAcvANE9rwv3TbUrz3229J
         N38KvAMvmP2WNroyc9pBSNYwLzt+aF3tVHtqYFjhLZbKiqqdiw2I6zjv2kcqygAwz9VV
         Jkt1hNDjB2IzsdPXyi/puOsULV9ntqmUmOp6BjFIWjRULIH3l9uDnAFA84gjgjgCJbGY
         gWKw==
X-Gm-Message-State: AOAM533RTgJ8zwDAvX5ruPtIK5DYBgdlRFGLgh6QgLBc9JvJYVv+xi5X
        HiNZfEZ9foz8Vh5TmGCYicandA==
X-Google-Smtp-Source: ABdhPJz3zlHQHAiZ5M0EsxszT6wgMNA089MS3aQmg5XgVDZXH1U+8Fw/Wm4VB4nXdbdBwHbId76w5A==
X-Received: by 2002:a17:906:2818:: with SMTP id r24mr7903474ejc.100.1601128542927;
        Sat, 26 Sep 2020 06:55:42 -0700 (PDT)
Received: from localhost.localdomain ([2a00:ee2:4b0d:3001:fbc5:498b:ed6d:cfac])
        by smtp.gmail.com with ESMTPSA id oq8sm4165700ejb.32.2020.09.26.06.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 06:55:42 -0700 (PDT)
From:   Luka Kovacic <luka.kovacic@sartura.hr>
To:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-leds@vger.kernel.org
Cc:     lee.jones@linaro.org, pavel@ucw.cz, dmurphy@ti.com,
        robh+dt@kernel.org, jdelvare@suse.com, linux@roeck-us.net,
        andrew@lunn.ch, jason@lakedaemon.net, gregory.clement@bootlin.com,
        luka.perkov@sartura.hr, robert.marko@sartura.hr,
        Luka Kovacic <luka.kovacic@sartura.hr>
Subject: [PATCH v2 4/7] drivers: leds: Add the iEi WT61P803 PUZZLE LED driver
Date:   Sat, 26 Sep 2020 15:55:11 +0200
Message-Id: <20200926135514.26189-5-luka.kovacic@sartura.hr>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200926135514.26189-1-luka.kovacic@sartura.hr>
References: <20200926135514.26189-1-luka.kovacic@sartura.hr>
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
 drivers/leds/Kconfig                    |   8 ++
 drivers/leds/Makefile                   |   1 +
 drivers/leds/leds-iei-wt61p803-puzzle.c | 174 ++++++++++++++++++++++++
 3 files changed, 183 insertions(+)
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
index 000000000000..b9a977575a23
--- /dev/null
+++ b/drivers/leds/leds-iei-wt61p803-puzzle.c
@@ -0,0 +1,174 @@
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
+ * @lock:		General mutex lock for LED operations
+ * @led_power_state:	State of the front panel power LED
+ */
+struct iei_wt61p803_puzzle_led {
+	struct iei_wt61p803_puzzle *mcu;
+	unsigned char *response_buffer;
+	struct mutex lock;
+	int led_power_state;
+};
+
+static inline struct iei_wt61p803_puzzle_led *cdev_to_iei_wt61p803_puzzle_led
+	(struct led_classdev *led_cdev)
+{
+	return dev_get_drvdata(led_cdev->dev->parent);
+}
+
+static int iei_wt61p803_puzzle_led_brightness_set_blocking(struct led_classdev *cdev,
+		enum led_brightness brightness)
+{
+	struct iei_wt61p803_puzzle_led *mcu_led =
+		cdev_to_iei_wt61p803_puzzle_led(cdev);
+	unsigned char led_power_cmd[5] = {
+		IEI_WT61P803_PUZZLE_CMD_HEADER_START,
+		IEI_WT61P803_PUZZLE_CMD_LED,
+		IEI_WT61P803_PUZZLE_CMD_LED_POWER,
+		(char)IEI_LED_OFF
+	};
+	unsigned char *resp_buf = mcu_led->response_buffer;
+	size_t reply_size;
+
+	mutex_lock(&mcu_led->lock);
+	if (brightness == LED_OFF) {
+		led_power_cmd[3] = (char)IEI_LED_OFF;
+		mcu_led->led_power_state = LED_OFF;
+	} else {
+		led_power_cmd[3] = (char)IEI_LED_ON;
+		mcu_led->led_power_state = LED_ON;
+	}
+	mutex_unlock(&mcu_led->lock);
+
+	return iei_wt61p803_puzzle_write_command(mcu_led->mcu, led_power_cmd,
+			sizeof(led_power_cmd), resp_buf, &reply_size);
+}
+
+static enum led_brightness
+iei_wt61p803_puzzle_led_brightness_get(struct led_classdev *cdev)
+{
+	struct iei_wt61p803_puzzle_led *mcu_led =
+		cdev_to_iei_wt61p803_puzzle_led(cdev);
+	int led_state;
+
+	mutex_lock(&mcu_led->lock);
+	led_state = mcu_led->led_power_state;
+	mutex_unlock(&mcu_led->lock);
+
+	return led_state;
+}
+
+static int iei_wt61p803_puzzle_led_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct iei_wt61p803_puzzle *mcu = dev_get_drvdata(dev->parent);
+	struct iei_wt61p803_puzzle_led *mcu_led;
+	struct fwnode_handle *child;
+	const char *label;
+	int ret;
+
+	mcu_led = devm_kzalloc(dev, sizeof(*mcu_led), GFP_KERNEL);
+	if (!mcu_led)
+		return -ENOMEM;
+
+	mcu_led->response_buffer = devm_kzalloc(dev,
+			IEI_WT61P803_PUZZLE_BUF_SIZE, GFP_KERNEL);
+	if (!mcu_led->response_buffer)
+		return -ENOMEM;
+
+	mcu_led->mcu = mcu;
+	mcu_led->led_power_state = 1;
+	mutex_init(&mcu_led->lock);
+	dev_set_drvdata(dev, mcu_led);
+
+	device_for_each_child_node(dev, child) {
+		struct led_classdev *led;
+		u32 reg;
+
+		led = devm_kzalloc(dev, sizeof(*led), GFP_KERNEL);
+		if (!led) {
+			ret = -ENOMEM;
+			goto err_child_node;
+		}
+
+		ret = fwnode_property_read_u32(child, "reg", &reg);
+		if (ret || reg > 1) {
+			dev_err(dev, "Could not register 'reg' (%lu)\n", (unsigned long)reg);
+			ret = -EINVAL;
+			goto err_child_node;
+		}
+
+		if (fwnode_property_read_string(child, "label", &label)) {
+			led->name = "iei-wt61p803-puzzle-led::";
+		} else {
+			led->name = devm_kasprintf(dev, GFP_KERNEL,
+					"iei-wt61p803-puzzle-led:%s", label);
+			if (!led->name) {
+				ret = -ENOMEM;
+				goto err_child_node;
+			}
+		}
+
+		fwnode_property_read_string(child, "linux,default-trigger",
+				&led->default_trigger);
+
+		led->brightness_set_blocking = iei_wt61p803_puzzle_led_brightness_set_blocking;
+		led->brightness_get = iei_wt61p803_puzzle_led_brightness_get;
+		led->max_brightness = 1;
+
+		ret = devm_led_classdev_register(dev, led);
+		if (ret) {
+			dev_err(dev, "Could not register %s\n", led->name);
+			goto err_child_node;
+		}
+	}
+	return 0;
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

