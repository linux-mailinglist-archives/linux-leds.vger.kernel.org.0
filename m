Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13C5A47FDFE
	for <lists+linux-leds@lfdr.de>; Mon, 27 Dec 2021 15:59:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232867AbhL0O7j (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 27 Dec 2021 09:59:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237309AbhL0O7f (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 27 Dec 2021 09:59:35 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24F8CC06173E;
        Mon, 27 Dec 2021 06:59:35 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id h2so24722137lfv.9;
        Mon, 27 Dec 2021 06:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QfHr6tcLL8eJz3IzrG6W+JSAyfLXoB/k3UpPfPZrM2Y=;
        b=o8ooX21IymU+OF8HdeyzP4w7TjTwFeQSaomO1QN0/EbTB7vWSP5mWs5vn0gTNYDr9k
         GQeUIOVLwe80OWr9wErXr7x2LNkAIkmm/Mu1lr7tNATkv98Q0iJa576D1acXyOCuuzXh
         26cxxPFIRgm1qpI2RMkHh0a2HosrcauQPC6gKGgYawEmAVOWYDHH8peNZreLzng7K9WB
         7yeLlURre36jO9vfkPQyqKdCz7P0z60uLUZe8YSQj300/mdI6vbCt5TxdMNb5T8Up8uA
         u6ChwPd3lJtGYZ8SphvkqkVF6H5yoT9X4rCr8ssBhLaqT1e/pEOmt6Slal3MI7Cn3FgM
         SWKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QfHr6tcLL8eJz3IzrG6W+JSAyfLXoB/k3UpPfPZrM2Y=;
        b=gbNzpwKFKjNA1VjVazdE8TLOJ7qIJMR+thIf5RLdGxirko97/YD1ZnxRvIQUv+5ClF
         kfsHu8KJh4KL9eSGmTvLcsKv0XPkC18RAu1a4hKaeQmmEnE/YRNvwkf+jecln6JCXJQQ
         UVTNhb7DgNqT9od1jV9IJDrIcvuTb28CoIeybwWY4qxOwbRovvah4Rw+1kIJmqXyZGCf
         7mUJu5XSJTz/2tHQLURbqizUB8lBwQ7Z3o4Ccy1sO27za9pHonNbURruGv7qHCqsJ8ns
         3BHKen9O8vtV5aXr4dCAnFpbpbdFUGeTkTW5CzdwsgdoFPOFAIO/8AWHLXcN1xXXh7Fk
         qqLg==
X-Gm-Message-State: AOAM533thmbbks+YoAvGqXopSKyv6UFXUIhRt0PCQzYoPLeoO7GLQ/Gc
        yh6A2jrzC38o7lGF7hsKfhc=
X-Google-Smtp-Source: ABdhPJxBK44bIXLCvz9bPZma5rCTCKXtZPbPEjikR5Vf8FjADzar3oeS/f/njYe++VjXgzjpWfES0g==
X-Received: by 2002:ac2:4119:: with SMTP id b25mr15653191lfi.3.1640617173336;
        Mon, 27 Dec 2021 06:59:33 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id o3sm1667766lfo.255.2021.12.27.06.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Dec 2021 06:59:33 -0800 (PST)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V3 2/2] leds: bcm63138: add support for BCM63138 controller
Date:   Mon, 27 Dec 2021 15:59:05 +0100
Message-Id: <20211227145905.2905-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211227145905.2905-1-zajec5@gmail.com>
References: <20211227145905.2905-1-zajec5@gmail.com>
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
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
---
V2: Rename to bcm63138
    Improve Kconfig help
    Add defines for magic values
    Support setting brightness
    Make bcm63xxx_leds_create_led() void function
V3: Move to blink/
    Add bcm63138_leds_create_led() fail dev_err() call
    Drop "default-state" & LED_FULL
---
 drivers/leds/blink/Kconfig         |  12 ++
 drivers/leds/blink/Makefile        |   1 +
 drivers/leds/blink/leds-bcm63138.c | 308 +++++++++++++++++++++++++++++
 3 files changed, 321 insertions(+)
 create mode 100644 drivers/leds/blink/leds-bcm63138.c

diff --git a/drivers/leds/blink/Kconfig b/drivers/leds/blink/Kconfig
index 59ba81e40e85..c680af01b5a9 100644
--- a/drivers/leds/blink/Kconfig
+++ b/drivers/leds/blink/Kconfig
@@ -1,3 +1,15 @@
+config LEDS_BCM63138
+	tristate "LED Support for Broadcom BCM63138 SoC"
+	depends on LEDS_CLASS
+	depends on ARCH_BCM4908 || ARCH_BCM_5301X || BCM63XX || COMPILE_TEST
+	depends on HAS_IOMEM
+	depends on OF
+	default ARCH_BCM4908
+	help
+	  This option enables support for LED controller that is part of
+	  BCM63138 SoC. The same hardware block is known to be also used
+	  in BCM4908, BCM6848, BCM6858, BCM63148, BCM63381 and BCM68360.
+
 config LEDS_LGM
        tristate "LED support for LGM SoC series"
        depends on X86 || COMPILE_TEST
diff --git a/drivers/leds/blink/Makefile b/drivers/leds/blink/Makefile
index fa5d04dccf13..447029f4153a 100644
--- a/drivers/leds/blink/Makefile
+++ b/drivers/leds/blink/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_LEDS_BCM63138)	+= leds-bcm63138.o
 obj-$(CONFIG_LEDS_LGM)	+= leds-lgm-sso.o
diff --git a/drivers/leds/blink/leds-bcm63138.c b/drivers/leds/blink/leds-bcm63138.c
new file mode 100644
index 000000000000..c083cb1332cb
--- /dev/null
+++ b/drivers/leds/blink/leds-bcm63138.c
@@ -0,0 +1,308 @@
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
+#define BCM63138_MAX_BRIGHTNESS				9
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
+	if (!value)
+		bcm63138_leds_set_flash_rate(leds, led, 0);
+	else
+		bcm63138_leds_set_bright(leds, led, value);
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
+	bcm63138_leds_enable_led(leds, led, BCM63138_MAX_BRIGHTNESS);
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
+	u32 bit;
+	int err;
+
+	led = devm_kzalloc(dev, sizeof(*led), GFP_KERNEL);
+	if (!led) {
+		dev_err(dev, "Failed to alloc LED\n");
+		return;
+	}
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
+	led->cdev.max_brightness = BCM63138_MAX_BRIGHTNESS;
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

