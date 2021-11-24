Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16E0745B901
	for <lists+linux-leds@lfdr.de>; Wed, 24 Nov 2021 12:20:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241058AbhKXLXN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 24 Nov 2021 06:23:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241228AbhKXLXL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 24 Nov 2021 06:23:11 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0758AC061574;
        Wed, 24 Nov 2021 03:20:02 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id l22so6270579lfg.7;
        Wed, 24 Nov 2021 03:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/Re1e9/ibSKRYAR2fDXLaok6Rt2+gi7gRYVNAjMCySI=;
        b=BSWJsG24HdUt8DvNDvuKVAZCDtqVxFmjT0LUZXHh89oI8CflL/jaXHpdqrbfHF8Qqn
         WMQ7GkL7pkXOL1R9z2sIfRMYcij4XusjVDjdHeCuLCIlcdZrxF73X2G7zs9r5fAbuyDg
         SqfIUT/jUSu3bd9ym1jVUK/23rds3PEtX8QXKJ62FpQi83eDGh9VeiVzWOuLL4MzDygO
         c6J2/1Aj87knRPyTLFFXSDjgX4k7skpEfUZJw5hiuj4f9ZfBYtAfZqI795nbKKO8I0Ln
         wFMs1ZsoIztYwiKufL0syduV9V/LuTPBFjwI52iq5SV/IdCV3l93n3/H7zky+67SKsCU
         4fqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/Re1e9/ibSKRYAR2fDXLaok6Rt2+gi7gRYVNAjMCySI=;
        b=OO1zVHu0NZR5lLCz7cy6N1xi1YMht4ufj3qTY00Xk6Cws+GcBmxIrbwxE5ncwj56Xh
         VC0yLMca5mKxOpYEG8RXZrT2iOOKMIFYacw1Ks8KSvirbZNgyu5JQ9FbOfQmJFU47rRd
         rtMNW2nVDwGL/cwsqmHvYNALBwkEMBhE56EX1hfCoMYyKOFetQRKYrkRg0/6SUm3b328
         Dvan9k4tPVO57NOOTYs70DM9tj+514HXQg8/5i/60/X3ZMhL8TC15hXq3mdOo/mZpENn
         HEOi1GPyLD/D2ogn31hqMF5Ki1n2oby7OY4i7IETGXncnAyb4mGeoJRYSb9296TzuZss
         ossg==
X-Gm-Message-State: AOAM5326/cqHBqYPp0RO47Muen8eartoO/mEzOV+sgmPVfc3LrIuJBYQ
        ztyKELSxQWkVwmkITV0o5UWz15DrP3s=
X-Google-Smtp-Source: ABdhPJxvU2TDrLYTbwtnBCEm2SDiTveVUPXXK9bPqThtL9ZhIds8i9PPByzMJiFxwfSH7rWGZ6gEWw==
X-Received: by 2002:a05:6512:b15:: with SMTP id w21mr13486779lfu.11.1637752800284;
        Wed, 24 Nov 2021 03:20:00 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id f15sm1578512lfq.236.2021.11.24.03.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 03:20:00 -0800 (PST)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V2 2/2] leds: bcm63xxx: add support for BCM63138 controller
Date:   Wed, 24 Nov 2021 12:19:52 +0100
Message-Id: <20211124111952.22419-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211124111952.22419-1-zajec5@gmail.com>
References: <20211124111952.22419-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

It's a new controller first introduced in BCM63138 SoC. Later it was
also used in BCM4908, some BCM68xx and some BCM63xxx SoCs.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
V2: Rename to bcm63138
    Improve Kconfig help
    Add defines for magic values
    Support setting brightness
    Make bcm63xxx_leds_create_led() void function
---
 drivers/leds/Kconfig         |  12 ++
 drivers/leds/Makefile        |   1 +
 drivers/leds/leds-bcm63138.c | 314 +++++++++++++++++++++++++++++++++++
 3 files changed, 327 insertions(+)
 create mode 100644 drivers/leds/leds-bcm63138.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index ed800f5da7d8..3bde795f0951 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -122,6 +122,18 @@ config LEDS_BCM6358
 	  This option enables support for LEDs connected to the BCM6358
 	  LED HW controller accessed via MMIO registers.
 
+config LEDS_BCM63138
+	tristate "LED Support for Broadcom BCM63138 SoC"
+	depends on LEDS_CLASS
+	depends on ARCH_BCM4908 || BCM63XX || COMPILE_TEST
+	depends on HAS_IOMEM
+	depends on OF
+	default ARCH_BCM4908
+	help
+	  This option enables support for LED controller that is part of
+	  BCM63138 SoC. The same hardware block is known to be also used
+	  in BCM4908, BCM6848, BCM6858, BCM63148, BCM63381 and BCM68360.
+
 config LEDS_CPCAP
 	tristate "LED Support for Motorola CPCAP"
 	depends on LEDS_CLASS
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index c636ec069612..c986630ce782 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -18,6 +18,7 @@ obj-$(CONFIG_LEDS_ASIC3)		+= leds-asic3.o
 obj-$(CONFIG_LEDS_AW2013)		+= leds-aw2013.o
 obj-$(CONFIG_LEDS_BCM6328)		+= leds-bcm6328.o
 obj-$(CONFIG_LEDS_BCM6358)		+= leds-bcm6358.o
+obj-$(CONFIG_LEDS_BCM63138)		+= leds-bcm63138.o
 obj-$(CONFIG_LEDS_BD2802)		+= leds-bd2802.o
 obj-$(CONFIG_LEDS_BLINKM)		+= leds-blinkm.o
 obj-$(CONFIG_LEDS_CLEVO_MAIL)		+= leds-clevo-mail.o
diff --git a/drivers/leds/leds-bcm63138.c b/drivers/leds/leds-bcm63138.c
new file mode 100644
index 000000000000..160c9282deda
--- /dev/null
+++ b/drivers/leds/leds-bcm63138.c
@@ -0,0 +1,314 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2021 Rafał Miłecki <rafal@milecki.pl>
+ */
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/pinctrl/consumer.h>
+#include <linux/platform_device.h>
+#include <linux/spinlock.h>
+
+#define BCM63138_MAX_LEDS				32
+
+#define BCM63138_LED_BITS				4				/* how many bits control a single LED */
+#define BCM63138_LED_MASK				((1 << BCM63138_LED_BITS) - 1)	/* 0xf */
+#define BCM63138_LEDS_PER_REG				(32 / BCM63138_LED_BITS)	/* 8 */
+
+#define BCM63138_GLB_CTRL				0x00
+#define  BCM63138_GLB_CTRL_SERIAL_LED_DATA_PPOL		0x00000002
+#define  BCM63138_GLB_CTRL_SERIAL_LED_EN_POL		0x00000008
+#define BCM63138_MASK					0x04
+#define BCM63138_HW_LED_EN				0x08
+#define BCM63138_SERIAL_LED_SHIFT_SEL			0x0c
+#define BCM63138_FLASH_RATE_CTRL1			0x10
+#define BCM63138_FLASH_RATE_CTRL2			0x14
+#define BCM63138_FLASH_RATE_CTRL3			0x18
+#define BCM63138_FLASH_RATE_CTRL4			0x1c
+#define BCM63138_BRIGHT_CTRL1				0x20
+#define BCM63138_BRIGHT_CTRL2				0x24
+#define BCM63138_BRIGHT_CTRL3				0x28
+#define BCM63138_BRIGHT_CTRL4				0x2c
+#define BCM63138_POWER_LED_CFG				0x30
+#define BCM63138_HW_POLARITY				0xb4
+#define BCM63138_SW_DATA				0xb8
+#define BCM63138_SW_POLARITY				0xbc
+#define BCM63138_PARALLEL_LED_POLARITY			0xc0
+#define BCM63138_SERIAL_LED_POLARITY			0xc4
+#define BCM63138_HW_LED_STATUS				0xc8
+#define BCM63138_FLASH_CTRL_STATUS			0xcc
+#define BCM63138_FLASH_BRT_CTRL				0xd0
+#define BCM63138_FLASH_P_LED_OUT_STATUS			0xd4
+#define BCM63138_FLASH_S_LED_OUT_STATUS			0xd8
+
+struct bcm63138_leds {
+	struct device *dev;
+	void __iomem *base;
+	spinlock_t lock;
+};
+
+struct bcm63138_led {
+	struct bcm63138_leds *leds;
+	struct led_classdev cdev;
+	u32 pin;
+	bool active_low;
+};
+
+/*
+ * I/O access
+ */
+
+static void bcm63138_leds_write(struct bcm63138_leds *leds, unsigned int reg,
+				u32 data)
+{
+	writel(data, leds->base + reg);
+}
+
+static unsigned long bcm63138_leds_read(struct bcm63138_leds *leds,
+					unsigned int reg)
+{
+	return readl(leds->base + reg);
+}
+
+static void bcm63138_leds_update_bits(struct bcm63138_leds *leds,
+				      unsigned int reg, u32 mask, u32 val)
+{
+	WARN_ON(val & ~mask);
+
+	bcm63138_leds_write(leds, reg, (bcm63138_leds_read(leds, reg) & ~mask) | (val & mask));
+}
+
+/*
+ * Helpers
+ */
+
+static void bcm63138_leds_set_flash_rate(struct bcm63138_leds *leds,
+					 struct bcm63138_led *led,
+					 u8 value)
+{
+	int reg_offset = (led->pin >> fls((BCM63138_LEDS_PER_REG - 1))) * 4;
+	int shift = (led->pin & (BCM63138_LEDS_PER_REG - 1)) * BCM63138_LED_BITS;
+
+	bcm63138_leds_update_bits(leds, BCM63138_FLASH_RATE_CTRL1 + reg_offset,
+				  BCM63138_LED_MASK << shift, value << shift);
+}
+
+static void bcm63138_leds_set_bright(struct bcm63138_leds *leds,
+				     struct bcm63138_led *led,
+				     u8 value)
+{
+	int reg_offset = (led->pin >> fls((BCM63138_LEDS_PER_REG - 1))) * 4;
+	int shift = (led->pin & (BCM63138_LEDS_PER_REG - 1)) * BCM63138_LED_BITS;
+
+	bcm63138_leds_update_bits(leds, BCM63138_BRIGHT_CTRL1 + reg_offset,
+				  BCM63138_LED_MASK << shift, value << shift);
+}
+
+static void bcm63138_leds_enable_led(struct bcm63138_leds *leds,
+				     struct bcm63138_led *led,
+				     enum led_brightness value)
+{
+	u32 bit = BIT(led->pin);
+
+	bcm63138_leds_update_bits(leds, BCM63138_SW_DATA, bit,
+				  value == LED_OFF ? 0 : bit);
+}
+
+/*
+ * API callbacks
+ */
+
+static void bcm63138_leds_brightness_set(struct led_classdev *led_cdev,
+					 enum led_brightness value)
+{
+	struct bcm63138_led *led = container_of(led_cdev, struct bcm63138_led, cdev);
+	struct bcm63138_leds *leds = led->leds;
+	unsigned long flags;
+
+	spin_lock_irqsave(&leds->lock, flags);
+
+	bcm63138_leds_enable_led(leds, led, value);
+	if (value == LED_OFF)
+		bcm63138_leds_set_flash_rate(leds, led, 0);
+	else
+		bcm63138_leds_set_bright(leds, led, (value >> 5) + 1);
+
+	spin_unlock_irqrestore(&leds->lock, flags);
+}
+
+static int bcm63138_leds_blink_set(struct led_classdev *led_cdev,
+				   unsigned long *delay_on,
+				   unsigned long *delay_off)
+{
+	struct bcm63138_led *led = container_of(led_cdev, struct bcm63138_led, cdev);
+	struct bcm63138_leds *leds = led->leds;
+	unsigned long flags;
+	u8 value;
+
+	if (!*delay_on && !*delay_off) {
+		*delay_on = 640;
+		*delay_off = 640;
+	}
+
+	if (*delay_on != *delay_off) {
+		dev_dbg(led_cdev->dev, "Blinking at unequal delays is not supported\n");
+		return -EINVAL;
+	}
+
+	switch (*delay_on) {
+	case 1152 ... 1408: /* 1280 ms ± 10% */
+		value = 0x7;
+		break;
+	case 576 ... 704: /* 640 ms ± 10% */
+		value = 0x6;
+		break;
+	case 288 ... 352: /* 320 ms ± 10% */
+		value = 0x5;
+		break;
+	case 126 ... 154: /* 140 ms ± 10% */
+		value = 0x4;
+		break;
+	case 59 ... 72: /* 65 ms ± 10% */
+		value = 0x3;
+		break;
+	default:
+		dev_dbg(led_cdev->dev, "Blinking delay value %lu is unsupported\n",
+			*delay_on);
+		return -EINVAL;
+	}
+
+	spin_lock_irqsave(&leds->lock, flags);
+
+	bcm63138_leds_enable_led(leds, led, LED_FULL);
+	bcm63138_leds_set_flash_rate(leds, led, value);
+
+	spin_unlock_irqrestore(&leds->lock, flags);
+
+	return 0;
+}
+
+/*
+ * LED driver
+ */
+
+static void bcm63138_leds_create_led(struct bcm63138_leds *leds,
+				     struct device_node *np)
+{
+	struct led_init_data init_data = {
+		.fwnode = of_fwnode_handle(np),
+	};
+	struct device *dev = leds->dev;
+	struct bcm63138_led *led;
+	struct pinctrl *pinctrl;
+	const char *state;
+	u32 bit;
+	int err;
+
+	led = devm_kzalloc(dev, sizeof(*led), GFP_KERNEL);
+	if (!led)
+		return;
+
+	led->leds = leds;
+
+	if (of_property_read_u32(np, "reg", &led->pin)) {
+		dev_err(dev, "Missing \"reg\" property in %pOF\n", np);
+		goto err_free;
+	}
+
+	if (led->pin >= BCM63138_MAX_LEDS) {
+		dev_err(dev, "Invalid \"reg\" value %d\n", led->pin);
+		goto err_free;
+	}
+
+	led->active_low = of_property_read_bool(np, "active-low");
+
+	if (!of_property_read_string(np, "default-state", &state)) {
+		if (!strcmp(state, "on"))
+			led->cdev.brightness = LED_FULL;
+		else
+			led->cdev.brightness = LED_OFF;
+	} else {
+		led->cdev.brightness = LED_OFF;
+	}
+
+	led->cdev.brightness_set = bcm63138_leds_brightness_set;
+	led->cdev.blink_set = bcm63138_leds_blink_set;
+
+	err = devm_led_classdev_register_ext(dev, &led->cdev, &init_data);
+	if (err) {
+		dev_err(dev, "Failed to register LED %pOF: %d\n", np, err);
+		goto err_free;
+	}
+
+	pinctrl = devm_pinctrl_get_select_default(led->cdev.dev);
+	if (IS_ERR(pinctrl) && PTR_ERR(pinctrl) != -ENODEV) {
+		dev_warn(led->cdev.dev, "Failed to select %pOF pinctrl: %ld\n",
+			 np, PTR_ERR(pinctrl));
+	}
+
+	bit = BIT(led->pin);
+	bcm63138_leds_update_bits(leds, BCM63138_PARALLEL_LED_POLARITY, bit,
+				  led->active_low ? 0 : bit);
+	bcm63138_leds_update_bits(leds, BCM63138_HW_LED_EN, bit, 0);
+	bcm63138_leds_set_flash_rate(leds, led, 0);
+	bcm63138_leds_enable_led(leds, led, led->cdev.brightness);
+
+	return;
+
+err_free:
+	devm_kfree(dev, led);
+}
+
+static int bcm63138_leds_probe(struct platform_device *pdev)
+{
+	struct device_node *np = dev_of_node(&pdev->dev);
+	struct device *dev = &pdev->dev;
+	struct bcm63138_leds *leds;
+	struct device_node *child;
+
+	leds = devm_kzalloc(dev, sizeof(*leds), GFP_KERNEL);
+	if (!leds)
+		return -ENOMEM;
+
+	leds->dev = dev;
+
+	leds->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(leds->base))
+		return PTR_ERR(leds->base);
+
+	spin_lock_init(&leds->lock);
+
+	bcm63138_leds_write(leds, BCM63138_GLB_CTRL,
+			    BCM63138_GLB_CTRL_SERIAL_LED_DATA_PPOL |
+			    BCM63138_GLB_CTRL_SERIAL_LED_EN_POL);
+	bcm63138_leds_write(leds, BCM63138_HW_LED_EN, 0);
+	bcm63138_leds_write(leds, BCM63138_SERIAL_LED_POLARITY, 0);
+	bcm63138_leds_write(leds, BCM63138_PARALLEL_LED_POLARITY, 0);
+
+	for_each_available_child_of_node(np, child) {
+		bcm63138_leds_create_led(leds, child);
+	}
+
+	return 0;
+}
+
+static const struct of_device_id bcm63138_leds_of_match_table[] = {
+	{ .compatible = "brcm,bcm63138-leds", },
+	{ },
+};
+
+static struct platform_driver bcm63138_leds_driver = {
+	.probe = bcm63138_leds_probe,
+	.driver = {
+		.name = "leds-bcm63xxx",
+		.of_match_table = bcm63138_leds_of_match_table,
+	},
+};
+
+module_platform_driver(bcm63138_leds_driver);
+
+MODULE_AUTHOR("Rafał Miłecki");
+MODULE_LICENSE("GPL");
+MODULE_DEVICE_TABLE(of, bcm63138_leds_of_match_table);
-- 
2.31.1

