Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CD7E37A68B
	for <lists+linux-leds@lfdr.de>; Tue, 11 May 2021 14:25:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231509AbhEKM0n (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 11 May 2021 08:26:43 -0400
Received: from polaris.svanheule.net ([84.16.241.116]:35954 "EHLO
        polaris.svanheule.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231534AbhEKM0j (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 11 May 2021 08:26:39 -0400
Received: from terra.local.svanheule.net (unknown [IPv6:2a02:a03f:eafb:ee01:a5bf:613f:4f5:f348])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id A25231FCC21;
        Tue, 11 May 2021 14:25:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1620735931;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=esV9Zuj4EBqnkgQlnJyNxklrX3o+5HTkfxJdnbsza1I=;
        b=lcZvceVVi4TwOBf6l2SFtK5wx/wI4Pe75+Y18Oe3z+s5qN0sSlqZdr2L5z9fDpiEFc2JTe
        6Kn3wLYEk60E/CiM44HZ+7WNN3fpbgu0Sa1W6I49Pziw9HWMkL6SeaNkFYJaeBhgzGXkyE
        SmUlSfNxnw11ZQOVk7f2axXinZF/eH0/535Is24/Paw1oxBlPo1S8HWDAKm+FSdu9m/muF
        nrXLWV4YpXyAhIy0+QSOy6NGg5AUEoeuWFPn5uz7V7FlMvdS7zBNH/iCbQG7eqpETdrPfc
        iiN5iKI+Ub/kYtiwn/bc1ija8ValAWtelz8I/Xf0fJB3nA4orOV6HJXFlFu2Ng==
From:   Sander Vanheule <sander@svanheule.net>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Sander Vanheule <sander@svanheule.net>
Subject: [PATCH 3/5] mfd: Add RTL8231 core device
Date:   Tue, 11 May 2021 14:25:21 +0200
Message-Id: <f6fb81e62f5006a9e7772f5f2840d94b8d0d885d.1620735871.git.sander@svanheule.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1620735871.git.sander@svanheule.net>
References: <cover.1620735871.git.sander@svanheule.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The RTL8231 is implemented as an MDIO device, and provides a regmap
interface for register access by the core and child devices.

The chip can also be a device on an SMI bus, a proprietary I2C-like bus
by Realtek. Since kernel support for SMI is limited, and no real-world
SMI implementations have been encountered for this device, this is
currently unimplemented. The use of the regmap interface should make any
future support relatively straightforward.

After reset, all pins are muxed to GPIO inputs before the pin drivers
are enabled. This is done to prevent accidental system resets, when a
pin is connected to the parent SoC's reset line.

Signed-off-by: Sander Vanheule <sander@svanheule.net>
---
 drivers/mfd/Kconfig         |   9 ++
 drivers/mfd/Makefile        |   1 +
 drivers/mfd/rtl8231.c       | 163 ++++++++++++++++++++++++++++++++++++
 include/linux/mfd/rtl8231.h |  49 +++++++++++
 4 files changed, 222 insertions(+)
 create mode 100644 drivers/mfd/rtl8231.c
 create mode 100644 include/linux/mfd/rtl8231.h

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 5c7f2b100191..0b0cf296aac4 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1076,6 +1076,15 @@ config MFD_RDC321X
 	  southbridge which provides access to GPIOs and Watchdog using the
 	  southbridge PCI device configuration space.
 
+config MFD_RTL8231
+	tristate "Realtek RTL8231 GPIO and LED expander"
+	select MFD_CORE
+	select REGMAP
+	help
+	  Support for the Realtek RTL8231 GPIO and LED expander.
+	  Provides up to 37 GPIOs, 88 LEDs, and one PWM output.
+	  When built as a module, this module will be named rtl8231_expander.
+
 config MFD_RT5033
 	tristate "Richtek RT5033 Power Management IC"
 	depends on I2C
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 4f6d2b8a5f76..4b27c2486ccc 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -234,6 +234,7 @@ obj-$(CONFIG_MFD_MENF21BMC)	+= menf21bmc.o
 obj-$(CONFIG_MFD_HI6421_PMIC)	+= hi6421-pmic-core.o
 obj-$(CONFIG_MFD_HI655X_PMIC)   += hi655x-pmic.o
 obj-$(CONFIG_MFD_DLN2)		+= dln2.o
+obj-$(CONFIG_MFD_RTL8231)	+= rtl8231.o
 obj-$(CONFIG_MFD_RT5033)	+= rt5033.o
 obj-$(CONFIG_MFD_SKY81452)	+= sky81452.o
 
diff --git a/drivers/mfd/rtl8231.c b/drivers/mfd/rtl8231.c
new file mode 100644
index 000000000000..4db3ad23d822
--- /dev/null
+++ b/drivers/mfd/rtl8231.c
@@ -0,0 +1,163 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/bits.h>
+#include <linux/delay.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/rtl8231.h>
+#include <linux/mdio.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+static const struct reg_field RTL8231_FIELD_LED_START = REG_FIELD(RTL8231_REG_FUNC0, 1, 1);
+static const struct reg_field RTL8231_FIELD_READY_CODE = REG_FIELD(RTL8231_REG_FUNC1, 4, 9);
+static const struct reg_field RTL8231_FIELD_SOFT_RESET = REG_FIELD(RTL8231_REG_PIN_HI_CFG, 15, 15);
+
+static const struct mfd_cell rtl8231_cells[] = {
+	{
+		.name = "rtl8231-pinctrl",
+		.of_compatible = "realtek,rtl8231-pinctrl",
+	},
+	{
+		.name = "rtl8231-leds",
+		.of_compatible = "realtek,rtl8231-leds",
+	},
+};
+
+static int rtl8231_init(struct device *dev, struct regmap *map)
+{
+	struct regmap_field *field_ready_code;
+	struct regmap_field *field_soft_reset;
+	unsigned int v;
+	int err = 0;
+
+	field_ready_code = regmap_field_alloc(map, RTL8231_FIELD_READY_CODE);
+	if (IS_ERR(field_ready_code))
+		return PTR_ERR(field_ready_code);
+
+	field_soft_reset = regmap_field_alloc(map, RTL8231_FIELD_SOFT_RESET);
+	if (IS_ERR(field_soft_reset)) {
+		err = PTR_ERR(field_soft_reset);
+		goto init_out;
+	}
+
+	err = regmap_field_read(field_ready_code, &v);
+
+	if (err) {
+		dev_err(dev, "failed to read READY_CODE\n");
+		goto init_out;
+	} else if (v != RTL8231_FUNC1_READY_CODE_VALUE) {
+		dev_err(dev, "RTL8231 not present or ready 0x%x != 0x%x\n",
+			v, RTL8231_FUNC1_READY_CODE_VALUE);
+		err = -ENODEV;
+		goto init_out;
+	}
+
+	// TODO Implement reset-gpios
+	regmap_field_write(field_soft_reset, 1);
+	usleep_range(1000, 10000);
+
+	/* Do not write LED_START before configuring pins */
+	/* Select GPIO functionality for all pins and set to input */
+	regmap_write(map, RTL8231_REG_PIN_MODE0, 0xffff);
+	regmap_write(map, RTL8231_REG_GPIO_DIR0, 0xffff);
+	regmap_write(map, RTL8231_REG_PIN_MODE1, 0xffff);
+	regmap_write(map, RTL8231_REG_GPIO_DIR1, 0xffff);
+	regmap_write(map, RTL8231_REG_PIN_HI_CFG, GENMASK(4, 0) | GENMASK(9, 5));
+
+init_out:
+	regmap_field_free(field_ready_code);
+	regmap_field_free(field_soft_reset);
+	return err;
+}
+
+static int rtl8231_mdio_reg_read(void *ctx, unsigned int reg, unsigned int *val)
+{
+	struct mdio_device *mdiodev = ctx;
+	int ret;
+
+	ret = mdiobus_read(mdiodev->bus, mdiodev->addr, reg);
+	if (ret < 0)
+		return ret;
+
+	*val = ret & 0xffff;
+	return 0;
+}
+
+static int rtl8231_mdio_reg_write(void *ctx, unsigned int reg, unsigned int val)
+{
+	struct mdio_device *mdiodev = ctx;
+
+	return mdiobus_write(mdiodev->bus, mdiodev->addr, reg, val);
+}
+
+static const struct regmap_config rtl8231_regmap_config = {
+	.val_bits = 16,
+	.reg_bits = 5,
+	.max_register = RTL8231_REG_COUNT - 1,
+	.use_single_read = true,
+	.use_single_write = true,
+	.reg_format_endian = REGMAP_ENDIAN_BIG,
+	.val_format_endian = REGMAP_ENDIAN_BIG,
+	.reg_read = rtl8231_mdio_reg_read,
+	.reg_write = rtl8231_mdio_reg_write,
+};
+
+static int rtl8231_mdio_probe(struct mdio_device *mdiodev)
+{
+	struct device *dev = &mdiodev->dev;
+	struct regmap_field *led_start;
+	struct regmap *map;
+	int err;
+
+	map = devm_regmap_init(dev, NULL, mdiodev, &rtl8231_regmap_config);
+
+	if (IS_ERR(map)) {
+		dev_err(dev, "failed to init regmap\n");
+		return PTR_ERR(map);
+	}
+
+	led_start = devm_regmap_field_alloc(dev, map, RTL8231_FIELD_LED_START);
+	if (IS_ERR(led_start))
+		return PTR_ERR(led_start);
+
+	dev_set_drvdata(dev, led_start);
+
+	err = rtl8231_init(dev, map);
+	if (err)
+		return err;
+
+	/* LED_START enables power to output pins, and starts the LED engine */
+	regmap_field_write(led_start, 1);
+
+	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, rtl8231_cells,
+		ARRAY_SIZE(rtl8231_cells), NULL, 0, NULL);
+}
+
+static void rtl8231_mdio_remove(struct mdio_device *mdiodev)
+{
+	struct regmap_field *led_start;
+
+	led_start = dev_get_drvdata(&mdiodev->dev);
+	regmap_field_write(led_start, 0);
+}
+
+static const struct of_device_id rtl8231_of_match[] = {
+	{ .compatible = "realtek,rtl8231" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, rtl8231_of_match);
+
+static struct mdio_driver rtl8231_mdio_driver = {
+	.mdiodrv.driver = {
+		.name = "rtl8231-expander",
+		.of_match_table	= rtl8231_of_match,
+	},
+	.probe = rtl8231_mdio_probe,
+	.remove = rtl8231_mdio_remove,
+};
+mdio_module_driver(rtl8231_mdio_driver);
+
+MODULE_AUTHOR("Sander Vanheule <sander@svanheule.net>");
+MODULE_DESCRIPTION("Realtek RTL8231 GPIO and LED expander");
+MODULE_LICENSE("GPL v2");
diff --git a/include/linux/mfd/rtl8231.h b/include/linux/mfd/rtl8231.h
new file mode 100644
index 000000000000..5af312adbf0b
--- /dev/null
+++ b/include/linux/mfd/rtl8231.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Register definitions the RTL8231 GPIO and LED expander chip
+ */
+
+#ifndef __LINUX_MFD_RTL8231_H
+#define __LINUX_MFD_RTL8231_H
+
+/* Chip control */
+#define RTL8231_REG_FUNC0		0x00
+#define RTL8231_FUNC0_SCAN_MODE		BIT(0)
+#define RTL8231_FUNC0_SCAN_SINGLE	0
+#define RTL8231_FUNC0_SCAN_BICOLOR	BIT(0)
+
+#define RTL8231_REG_FUNC1		0x01
+#define RTL8231_FUNC1_READY_CODE_VALUE	0x37
+
+/* Pin control */
+#define RTL8231_REG_PIN_MODE0		0x02
+#define RTL8231_REG_PIN_MODE1		0x03
+
+#define RTL8231_PIN_MODE_LED		0
+#define RTL8231_PIN_MODE_GPIO		1
+
+/* Pin high config: pin and GPIO control for pins 32-26 */
+#define RTL8231_REG_PIN_HI_CFG		0x04
+
+/* GPIO control registers */
+#define RTL8231_REG_GPIO_DIR0		0x05
+#define RTL8231_REG_GPIO_DIR1		0x06
+#define RTL8231_REG_GPIO_INVERT0	0x07
+#define RTL8231_REG_GPIO_INVERT1	0x08
+
+#define RTL8231_GPIO_DIR_IN		1
+#define RTL8231_GPIO_DIR_OUT		0
+
+/* GPIO data registers */
+#define RTL8231_REG_GPIO_DATA0		0x1c
+#define RTL8231_REG_GPIO_DATA1		0x1d
+#define RTL8231_REG_GPIO_DATA2		0x1e
+
+/* LED control base registers */
+#define RTL8231_REG_LED0_BASE		0x09
+#define RTL8231_REG_LED1_BASE		0x10
+#define RTL8231_REG_LED2_BASE		0x17
+
+#define RTL8231_REG_COUNT		0x1f
+
+#endif /* __LINUX_MFD_RTL8231_H */
-- 
2.31.1

