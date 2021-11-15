Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D62674500E6
	for <lists+linux-leds@lfdr.de>; Mon, 15 Nov 2021 10:11:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230007AbhKOJOL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 15 Nov 2021 04:14:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229944AbhKOJOL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 15 Nov 2021 04:14:11 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B63D7C061766;
        Mon, 15 Nov 2021 01:11:15 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id k37so41732325lfv.3;
        Mon, 15 Nov 2021 01:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LpDcWm5PVVzNg5mB3j8VkHSlSYlXc2aBZ8IPw2RSQwI=;
        b=pyCtbjZbONzI1Ts18fOd3nsr9mFUdHDk6wU05MuKfwnQCWFvHy6d/2AFB7wgfO2Znk
         JuCSiueg0NMINa5kvXAkA602Ew5Ljgd1fyR65SrkXQbgYzr7VcJ3LDpY3RHicfj3KM+F
         yGwYIUGuNyJmMW+FSLHGj52xuCPjx+YKh78gGwtL3rGU4YQ3MQWNQuSM19Lw56jKJWmR
         fF5fiKXcXErGj7xSRVrFUdXyTNKQo1JDPiBhqlwfw0gSf6BDGIlApSNtZ7+FeUvTC+9f
         vNG9uEdBalKYkuTvjqR2BQ4lwvbSob1NR3dt+QLA+4Zn+EJSXFZNtdc+uZOEQkJPdkOs
         WraQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LpDcWm5PVVzNg5mB3j8VkHSlSYlXc2aBZ8IPw2RSQwI=;
        b=o+sNkHQ12aWQy0SngL8A3w3fWBohzoWc3Cw+cXPd37WLbvhdD1sfy/gq7glx0PaJU3
         yGqwn4rT4oBZi0qCYoO/yKLwzAotKNv0s/o0t4AJy5yscJd9UdaXimCH3JfPiQwOrEQC
         BezBGqbyDCb0gJlghp0MzX5yx2S/EvKP7HDJ6IQB3EizSgqpmRaiyAo8Yuni4Omjci7J
         0Kh0LB5Uez/CPv5nUN0kQQbBD5npBkb8T6bdgiMRLcwPERoX36nDZLo2JMoPB0Q42dw8
         erBv9k8eZqLDCClHJnB6EJZu144G+OqB8S0p9bTTYnyp8ii4UsQF+3kpaVrMmyakMft4
         p2iQ==
X-Gm-Message-State: AOAM531h9ZV5HVxdhYta+YZZUriUv1Aa7pBPrruOFqapPogilInPxK0N
        uZGyJJ//P07i9zFDUv7vi1aLVew8dR0=
X-Google-Smtp-Source: ABdhPJxoc0GxHSVpFd/GVdSjuxuuTDH53jdIKA7Ns0lHsSlu4PT5jmiD5N7py5gxXAkN7pYrbox2YQ==
X-Received: by 2002:a19:c30e:: with SMTP id t14mr33938927lff.375.1636967474089;
        Mon, 15 Nov 2021 01:11:14 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id 18sm503318ljd.73.2021.11.15.01.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 01:11:13 -0800 (PST)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 2/2] leds: bcm63xxx: add support for BCM63xxx controller
Date:   Mon, 15 Nov 2021 10:11:07 +0100
Message-Id: <20211115091107.11737-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211115091107.11737-1-zajec5@gmail.com>
References: <20211115091107.11737-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

It's a new controller used on BCM4908, some BCM68xx and some BCM63xxx
SoCs.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 drivers/leds/Kconfig         |  11 ++
 drivers/leds/Makefile        |   1 +
 drivers/leds/leds-bcm63xxx.c | 299 +++++++++++++++++++++++++++++++++++
 3 files changed, 311 insertions(+)
 create mode 100644 drivers/leds/leds-bcm63xxx.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index ed800f5da7d8..b4a35b58eaae 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -122,6 +122,17 @@ config LEDS_BCM6358
 	  This option enables support for LEDs connected to the BCM6358
 	  LED HW controller accessed via MMIO registers.
 
+config LEDS_BCM63XXX
+	tristate "LED Support for Broadcom BCM63xxx SoCs"
+	depends on LEDS_CLASS
+	depends on ARCH_BCM4908 || BCM63XX || COMPILE_TEST
+	depends on HAS_IOMEM
+	depends on OF
+	default ARCH_BCM4908
+	help
+	  This option enables support for LED controller that is part of
+	  BCM63xxx family SoCs.
+
 config LEDS_CPCAP
 	tristate "LED Support for Motorola CPCAP"
 	depends on LEDS_CLASS
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index c636ec069612..b8f1b30e8398 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -18,6 +18,7 @@ obj-$(CONFIG_LEDS_ASIC3)		+= leds-asic3.o
 obj-$(CONFIG_LEDS_AW2013)		+= leds-aw2013.o
 obj-$(CONFIG_LEDS_BCM6328)		+= leds-bcm6328.o
 obj-$(CONFIG_LEDS_BCM6358)		+= leds-bcm6358.o
+obj-$(CONFIG_LEDS_BCM63XXX)		+= leds-bcm63xxx.o
 obj-$(CONFIG_LEDS_BD2802)		+= leds-bd2802.o
 obj-$(CONFIG_LEDS_BLINKM)		+= leds-blinkm.o
 obj-$(CONFIG_LEDS_CLEVO_MAIL)		+= leds-clevo-mail.o
diff --git a/drivers/leds/leds-bcm63xxx.c b/drivers/leds/leds-bcm63xxx.c
new file mode 100644
index 000000000000..5128b28b748d
--- /dev/null
+++ b/drivers/leds/leds-bcm63xxx.c
@@ -0,0 +1,299 @@
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
+#define BCM63XXX_MAX_LEDS			32
+
+#define BCM63XXX_GLB_CTRL			0x00
+#define BCM63XXX_MASK				0x04
+#define BCM63XXX_HW_LED_EN			0x08
+#define BCM63XXX_SERIAL_LED_SHIFT_SEL		0x0c
+#define BCM63XXX_FLASH_RATE_CTRL1		0x10
+#define BCM63XXX_FLASH_RATE_CTRL2		0x14
+#define BCM63XXX_FLASH_RATE_CTRL3		0x18
+#define BCM63XXX_FLASH_RATE_CTRL4		0x1c
+#define BCM63XXX_BRIGHT_CTRL1			0x20
+#define BCM63XXX_BRIGHT_CTRL2			0x24
+#define BCM63XXX_BRIGHT_CTRL3			0x28
+#define BCM63XXX_BRIGHT_CTRL4			0x2c
+#define BCM63XXX_POWER_LED_CFG			0x30
+#define BCM63XXX_HW_POLARITY			0xb4
+#define BCM63XXX_SW_DATA			0xb8
+#define BCM63XXX_SW_POLARITY			0xbc
+#define BCM63XXX_PARALLEL_LED_POLARITY		0xc0
+#define BCM63XXX_SERIAL_LED_POLARITY		0xc4
+#define BCM63XXX_HW_LED_STATUS			0xc8
+#define BCM63XXX_FLASH_CTRL_STATUS		0xcc
+#define BCM63XXX_FLASH_BRT_CTRL			0xd0
+#define BCM63XXX_FLASH_P_LED_OUT_STATUS		0xd4
+#define BCM63XXX_FLASH_S_LED_OUT_STATUS		0xd8
+
+struct bcm63xxx_leds {
+	struct device *dev;
+	void __iomem *base;
+	spinlock_t lock;
+};
+
+struct bcm63xxx_led {
+	struct bcm63xxx_leds *leds;
+	struct led_classdev cdev;
+	u32 pin;
+	bool active_low;
+};
+
+/*
+ * I/O access
+ */
+
+static void bcm63xxx_leds_write(struct bcm63xxx_leds *leds, unsigned int reg,
+				u32 data)
+{
+	writel(data, leds->base + reg);
+}
+
+static unsigned long bcm63xxx_leds_read(struct bcm63xxx_leds *leds,
+					unsigned int reg)
+{
+	return readl(leds->base + reg);
+}
+
+static void bcm63xxx_leds_update_bits(struct bcm63xxx_leds *leds,
+				      unsigned int reg, u32 mask, u32 val)
+{
+	WARN_ON(val & ~mask);
+
+	bcm63xxx_leds_write(leds, reg, (bcm63xxx_leds_read(leds, reg) & ~mask) | (val & mask));
+}
+
+/*
+ * Helpers
+ */
+
+static void bcm63xxx_leds_set_flash_rate(struct bcm63xxx_leds *leds,
+					 struct bcm63xxx_led *led,
+					 u8 value)
+{
+	int reg_offset = (led->pin >> 3) * 4;
+	int shift = (led->pin & 0xf) * 4;
+
+	bcm63xxx_leds_update_bits(leds, BCM63XXX_FLASH_RATE_CTRL1 + reg_offset,
+				  0xf << shift, value << shift);
+}
+
+static void bcm63xxx_leds_enable_led(struct bcm63xxx_leds *leds,
+				     struct bcm63xxx_led *led,
+				     enum led_brightness value)
+{
+	u32 bit = BIT(led->pin);
+
+	bcm63xxx_leds_update_bits(leds, BCM63XXX_SW_DATA, bit,
+				  value == LED_OFF ? 0 : bit);
+}
+
+/*
+ * API callbacks
+ */
+
+static void bcm63xxx_leds_brightness_set(struct led_classdev *led_cdev,
+					 enum led_brightness value)
+{
+	struct bcm63xxx_led *led = container_of(led_cdev, struct bcm63xxx_led, cdev);
+	struct bcm63xxx_leds *leds = led->leds;
+	unsigned long flags;
+
+	spin_lock_irqsave(&leds->lock, flags);
+
+	bcm63xxx_leds_enable_led(leds, led, value);
+	if (value == LED_OFF)
+		bcm63xxx_leds_set_flash_rate(leds, led, 0);
+
+	spin_unlock_irqrestore(&leds->lock, flags);
+}
+
+static int bcm63xxx_leds_blink_set(struct led_classdev *led_cdev,
+				   unsigned long *delay_on,
+				   unsigned long *delay_off)
+{
+	struct bcm63xxx_led *led = container_of(led_cdev, struct bcm63xxx_led, cdev);
+	struct bcm63xxx_leds *leds = led->leds;
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
+	bcm63xxx_leds_enable_led(leds, led, LED_FULL);
+	bcm63xxx_leds_set_flash_rate(leds, led, value);
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
+static int bcm63xxx_leds_create_led(struct bcm63xxx_leds *leds, struct device_node *np)
+{
+	struct led_init_data init_data = {
+		.fwnode = of_fwnode_handle(np),
+	};
+	struct device *dev = leds->dev;
+	struct bcm63xxx_led *led;
+	struct pinctrl *pinctrl;
+	const char *state;
+	u32 bit;
+	int err;
+
+	led = devm_kzalloc(dev, sizeof(*led), GFP_KERNEL);
+	if (!led)
+		return -ENOMEM;
+
+	led->leds = leds;
+
+	if (of_property_read_u32(np, "reg", &led->pin)) {
+		dev_err(dev, "Missing \"reg\" property in %pOF\n", np);
+		err = -ENOENT;
+		goto err_out;
+	}
+
+	if (led->pin >= BCM63XXX_MAX_LEDS) {
+		dev_err(dev, "Invalid \"reg\" value %d\n", led->pin);
+		err = -EINVAL;
+		goto err_out;
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
+	led->cdev.brightness_set = bcm63xxx_leds_brightness_set;
+	led->cdev.blink_set = bcm63xxx_leds_blink_set;
+
+	err = devm_led_classdev_register_ext(dev, &led->cdev, &init_data);
+	if (err) {
+		dev_err(dev, "Failed to register LED %pOF: %d\n", np, err);
+		goto err_out;
+	}
+
+	pinctrl = devm_pinctrl_get_select_default(led->cdev.dev);
+	if (IS_ERR(pinctrl) && PTR_ERR(pinctrl) != -ENODEV) {
+		dev_warn(led->cdev.dev, "Failed to select %pOF pinctrl: %ld\n",
+			 np, PTR_ERR(pinctrl));
+	}
+
+	bit = BIT(led->pin);
+	bcm63xxx_leds_update_bits(leds, BCM63XXX_PARALLEL_LED_POLARITY, bit,
+				  led->active_low ? 0 : bit);
+	bcm63xxx_leds_update_bits(leds, BCM63XXX_HW_LED_EN, bit, 0);
+	bcm63xxx_leds_set_flash_rate(leds, led, 0);
+	bcm63xxx_leds_enable_led(leds, led, led->cdev.brightness);
+
+	return 0;
+
+err_out:
+	devm_kfree(dev, led);
+	return err;
+}
+
+static int bcm63xxx_leds_probe(struct platform_device *pdev)
+{
+	struct device_node *np = dev_of_node(&pdev->dev);
+	struct device *dev = &pdev->dev;
+	struct bcm63xxx_leds *leds;
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
+	bcm63xxx_leds_write(leds, BCM63XXX_GLB_CTRL, 0xa);
+	bcm63xxx_leds_write(leds, BCM63XXX_BRIGHT_CTRL1, 0x88888888);
+	bcm63xxx_leds_write(leds, BCM63XXX_BRIGHT_CTRL2, 0x88888888);
+	bcm63xxx_leds_write(leds, BCM63XXX_BRIGHT_CTRL3, 0x88888888);
+	bcm63xxx_leds_write(leds, BCM63XXX_BRIGHT_CTRL4, 0x88888888);
+	bcm63xxx_leds_write(leds, BCM63XXX_HW_LED_EN, 0);
+	bcm63xxx_leds_write(leds, BCM63XXX_SERIAL_LED_POLARITY, 0);
+	bcm63xxx_leds_write(leds, BCM63XXX_PARALLEL_LED_POLARITY, 0);
+
+	for_each_available_child_of_node(np, child) {
+		bcm63xxx_leds_create_led(leds, child);
+	}
+
+	return 0;
+}
+
+static const struct of_device_id bcm63xxx_leds_of_match_table[] = {
+	{ .compatible = "brcm,bcm63xxx-leds", },
+	{ },
+};
+
+static struct platform_driver bcm63xxx_leds_driver = {
+	.probe = bcm63xxx_leds_probe,
+	.driver = {
+		.name = "leds-bcm63xxx",
+		.of_match_table = bcm63xxx_leds_of_match_table,
+	},
+};
+
+module_platform_driver(bcm63xxx_leds_driver);
+
+MODULE_AUTHOR("Rafał Miłecki");
+MODULE_LICENSE("GPL");
+MODULE_DEVICE_TABLE(of, bcm63xxx_leds_of_match_table);
-- 
2.31.1

