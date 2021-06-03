Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7380C399E5A
	for <lists+linux-leds@lfdr.de>; Thu,  3 Jun 2021 12:01:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230019AbhFCKDS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 3 Jun 2021 06:03:18 -0400
Received: from polaris.svanheule.net ([84.16.241.116]:33410 "EHLO
        polaris.svanheule.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230039AbhFCKDR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 3 Jun 2021 06:03:17 -0400
Received: from terra.local.svanheule.net (unknown [IPv6:2a02:a03f:eafb:ee01:398f:956e:2c86:f184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id ABD0E208047;
        Thu,  3 Jun 2021 12:01:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1622714492;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7GiS7I+p46F5gZrdyS5UOsRSiK5y9A2I0ifFgJsJuBc=;
        b=C0BYGRMR8FNeT9AIeRs2/jht1vIiWSNnoFkJZmeFFFqzaNKisMPzVAqeXb+rIoQ9AWpkzg
        yRdrt1CxRHfgpZAOcrfTA47z9lzIbh0eAMXsJCTtX6YpdHKAXbBAFf92HuM7cg+cv4E/F1
        krVm9F++jMCkDMDsX/GO9GgWssP4DJ3i/m5bVYYghcaVmgxoeFjFDQHNBjV+QwiiGE4u1+
        CPh3bB5uS8n2ycAR7RdxlJ3kYXcTBDGSOLaHNL2YqFkMTvcCOghhmLT3TUmZ8DPv/Z+ove
        xqhITasXQ6PBZungYXo4nHyfFvJJwstbp7GIaRIe1dZLlEEX64i/OyF3ekQP1Q==
From:   Sander Vanheule <sander@svanheule.net>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Walle <michael@walle.cc>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org
Cc:     Hans de Goede <hdegoede@redhat.com>, Andrew Lunn <andrew@lunn.ch>,
        linux-kernel@vger.kernel.org,
        Sander Vanheule <sander@svanheule.net>
Subject: [PATCH v4 5/5] leds: Add support for RTL8231 LED scan matrix
Date:   Thu,  3 Jun 2021 12:00:44 +0200
Message-Id: <36de68a5848e6cc2a906b0614e3126c76f70fa17.1622713678.git.sander@svanheule.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1622713678.git.sander@svanheule.net>
References: <cover.1622713678.git.sander@svanheule.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Both single and bi-color scanning modes are supported. The driver will
verify that the addresses are valid for the current mode, before
registering the LEDs. LEDs can be turned on, off, or toggled at one of
six predefined rates from 40ms to 1280ms.

Implements a platform device for use as a child device with RTL8231 MFD,
and uses the parent regmap to access the required registers.

Signed-off-by: Sander Vanheule <sander@svanheule.net>

---
v4:
- Rename variable addr_count -> err
- Use -EINVAL instead of -ENODEV

v3:
- Rename 'interval' to 'interval_ms'

v2:
- Use fwnode-calls instead of OF-calls
---
 drivers/leds/Kconfig        |  10 ++
 drivers/leds/Makefile       |   1 +
 drivers/leds/leds-rtl8231.c | 291 ++++++++++++++++++++++++++++++++++++
 3 files changed, 302 insertions(+)
 create mode 100644 drivers/leds/leds-rtl8231.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 49d99cb084db..8cb869e8cd09 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -593,6 +593,16 @@ config LEDS_REGULATOR
 	help
 	  This option enables support for regulator driven LEDs.
 
+config LEDS_RTL8231
+	tristate "RTL8231 LED matrix support"
+	depends on LEDS_CLASS
+	depends on MFD_RTL8231
+	default MFD_RTL8231
+	help
+	  This option enables support for using the LED scanning matrix output
+	  of the RTL8231 GPIO and LED expander chip.
+	  When built as a module, this module will be named leds-rtl8231.
+
 config LEDS_BD2802
 	tristate "LED driver for BD2802 RGB LED"
 	depends on LEDS_CLASS
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 7e604d3028c8..ce0f44a87dee 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -80,6 +80,7 @@ obj-$(CONFIG_LEDS_PM8058)		+= leds-pm8058.o
 obj-$(CONFIG_LEDS_POWERNV)		+= leds-powernv.o
 obj-$(CONFIG_LEDS_PWM)			+= leds-pwm.o
 obj-$(CONFIG_LEDS_REGULATOR)		+= leds-regulator.o
+obj-$(CONFIG_LEDS_RTL8231)		+= leds-rtl8231.o
 obj-$(CONFIG_LEDS_S3C24XX)		+= leds-s3c24xx.o
 obj-$(CONFIG_LEDS_SC27XX_BLTC)		+= leds-sc27xx-bltc.o
 obj-$(CONFIG_LEDS_SGM3140)		+= leds-sgm3140.o
diff --git a/drivers/leds/leds-rtl8231.c b/drivers/leds/leds-rtl8231.c
new file mode 100644
index 000000000000..fb2b1ca419c9
--- /dev/null
+++ b/drivers/leds/leds-rtl8231.c
@@ -0,0 +1,291 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/device.h>
+#include <linux/leds.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+
+#include <linux/mfd/rtl8231.h>
+
+/**
+ * struct led_toggle_rate - description of an LED blinking mode
+ * @interval_ms:	LED toggle rate in milliseconds
+ * @mode:		Register field value used to activate this mode
+ *
+ * For LED hardware accelerated blinking, with equal on and off delay.
+ * Both delays are given by @interval, so the interval at which the LED blinks
+ * (i.e. turn on and off once) is double this value.
+ */
+struct led_toggle_rate {
+	u16 interval_ms;
+	u8 mode;
+};
+
+/**
+ * struct led_modes - description of all LED modes
+ * @toggle_rates:	Array of led_toggle_rate values, sorted by ascending interval
+ * @num_toggle_rates:	Number of elements in @led_toggle_rate
+ * @off:		Register field value to turn LED off
+ * @on:			Register field value to turn LED on
+ */
+struct led_modes {
+	const struct led_toggle_rate *toggle_rates;
+	unsigned int num_toggle_rates;
+	u8 off;
+	u8 on;
+};
+
+struct rtl8231_led {
+	struct led_classdev led;
+	const struct led_modes *modes;
+	struct regmap_field *reg_field;
+};
+#define to_rtl8231_led(_cdev) container_of(_cdev, struct rtl8231_led, led)
+
+#define RTL8231_NUM_LEDS	3
+#define RTL8231_LED_PER_REG	5
+#define RTL8231_BITS_PER_LED	3
+
+static const unsigned int rtl8231_led_port_counts_single[RTL8231_NUM_LEDS] = {32, 32, 24};
+static const unsigned int rtl8231_led_port_counts_bicolor[RTL8231_NUM_LEDS] = {24, 24, 24};
+
+static const unsigned int rtl8231_led_base[RTL8231_NUM_LEDS] = {
+	RTL8231_REG_LED0_BASE,
+	RTL8231_REG_LED1_BASE,
+	RTL8231_REG_LED2_BASE,
+};
+
+#define RTL8231_DEFAULT_TOGGLE_INTERVAL_MS	500
+
+static const struct led_toggle_rate rtl8231_toggle_rates[] = {
+	{  40, 1},
+	{  80, 2},
+	{ 160, 3},
+	{ 320, 4},
+	{ 640, 5},
+	{1280, 6},
+};
+
+static const struct led_modes rtl8231_led_modes = {
+	.off = 0,
+	.on = 7,
+	.num_toggle_rates = ARRAY_SIZE(rtl8231_toggle_rates),
+	.toggle_rates = rtl8231_toggle_rates,
+};
+
+static void rtl8231_led_brightness_set(struct led_classdev *led_cdev,
+	enum led_brightness brightness)
+{
+	struct rtl8231_led *pled = to_rtl8231_led(led_cdev);
+
+	if (brightness)
+		regmap_field_write(pled->reg_field, pled->modes->on);
+	else
+		regmap_field_write(pled->reg_field, pled->modes->off);
+}
+
+static enum led_brightness rtl8231_led_brightness_get(struct led_classdev *led_cdev)
+{
+	struct rtl8231_led *pled = to_rtl8231_led(led_cdev);
+	u32 current_mode = pled->modes->off;
+
+	regmap_field_read(pled->reg_field, &current_mode);
+
+	if (current_mode == pled->modes->off)
+		return LED_OFF;
+	else
+		return LED_ON;
+}
+
+static unsigned int rtl8231_led_current_interval(struct rtl8231_led *pled)
+{
+	unsigned int mode;
+	unsigned int i;
+
+	if (regmap_field_read(pled->reg_field, &mode))
+		return 0;
+
+	for (i = 0; i < pled->modes->num_toggle_rates; i++)
+		if (mode == pled->modes->toggle_rates[i].mode)
+			return pled->modes->toggle_rates[i].interval_ms;
+
+	return 0;
+}
+
+static int rtl8231_led_blink_set(struct led_classdev *led_cdev, unsigned long *delay_on,
+	unsigned long *delay_off)
+{
+	struct rtl8231_led *pled = to_rtl8231_led(led_cdev);
+	const struct led_toggle_rate *rates = pled->modes->toggle_rates;
+	unsigned int num_rates = pled->modes->num_toggle_rates;
+	unsigned int interval_ms;
+	unsigned int i;
+	int err;
+
+	if (*delay_on == 0 && *delay_off == 0) {
+		interval_ms = RTL8231_DEFAULT_TOGGLE_INTERVAL_MS;
+	} else {
+		/*
+		 * If the current mode is blinking, choose the delay that (likely) changed.
+		 * Otherwise, choose the interval that would have the same total delay.
+		 */
+		interval_ms = rtl8231_led_current_interval(pled);
+		if (interval_ms > 0 && interval_ms == *delay_off)
+			interval_ms = *delay_on;
+		else if (interval_ms > 0 && interval_ms == *delay_on)
+			interval_ms = *delay_off;
+		else
+			interval_ms = (*delay_on + *delay_off) / 2;
+	}
+
+	/* Find clamped toggle interval */
+	for (i = 0; i < (num_rates - 1); i++)
+		if (interval_ms > rates[i].interval_ms)
+			break;
+
+	interval_ms = rates[i].interval_ms;
+
+	err = regmap_field_write(pled->reg_field, rates[i].mode);
+	if (err)
+		return err;
+
+	*delay_on = interval_ms;
+	*delay_off = interval_ms;
+
+	return 0;
+}
+
+static int rtl8231_led_read_address(struct fwnode_handle *fwnode, unsigned int *addr_port,
+	unsigned int *addr_led)
+{
+	u32 addr[2];
+	int err;
+
+	err = fwnode_property_count_u32(fwnode, "reg");
+	if (err < 0)
+		return err;
+	if (err != ARRAY_SIZE(addr))
+		return -EINVAL;
+
+	err = fwnode_property_read_u32_array(fwnode, "reg", addr, ARRAY_SIZE(addr));
+	if (err)
+		return err;
+
+	*addr_port = addr[0];
+	*addr_led = addr[1];
+
+	return 0;
+}
+
+static struct reg_field rtl8231_led_get_field(unsigned int port_index, unsigned int led_index)
+{
+	unsigned int offset, shift;
+	struct reg_field field;
+
+	offset = port_index / RTL8231_LED_PER_REG;
+	shift = (port_index % RTL8231_LED_PER_REG) * RTL8231_BITS_PER_LED;
+
+	field.reg = rtl8231_led_base[led_index] + offset;
+	field.lsb = shift;
+	field.msb = shift + RTL8231_BITS_PER_LED - 1;
+
+	return field;
+}
+
+static int rtl8231_led_probe_single(struct device *dev, struct regmap *map,
+	const unsigned int *port_counts, struct fwnode_handle *fwnode)
+{
+	struct led_init_data init_data = {};
+	struct rtl8231_led *pled;
+	unsigned int port_index;
+	unsigned int led_index;
+	struct reg_field field;
+	int err;
+
+	pled = devm_kzalloc(dev, sizeof(*pled), GFP_KERNEL);
+	if (!pled)
+		return -ENOMEM;
+
+	err = rtl8231_led_read_address(fwnode, &port_index, &led_index);
+	if (err) {
+		dev_err(dev, "LED address invalid\n");
+		return err;
+	}
+
+	if (led_index >= RTL8231_NUM_LEDS || port_index >= port_counts[led_index]) {
+		dev_err(dev, "LED address (%d.%d) invalid\n", port_index, led_index);
+		return -EINVAL;
+	}
+
+	field = rtl8231_led_get_field(port_index, led_index);
+	pled->reg_field = devm_regmap_field_alloc(dev, map, field);
+	if (IS_ERR(pled->reg_field))
+		return PTR_ERR(pled->reg_field);
+
+	pled->modes = &rtl8231_led_modes;
+
+	pled->led.max_brightness = 1;
+	pled->led.brightness_get = rtl8231_led_brightness_get;
+	pled->led.brightness_set = rtl8231_led_brightness_set;
+	pled->led.blink_set = rtl8231_led_blink_set;
+
+	init_data.fwnode = fwnode;
+
+	return devm_led_classdev_register_ext(dev, &pled->led, &init_data);
+}
+
+static int rtl8231_led_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	const unsigned int *port_counts;
+	struct fwnode_handle *child;
+	struct regmap *map;
+	int err;
+
+	map = dev_get_regmap(dev->parent, NULL);
+	if (!map)
+		return -ENODEV;
+
+	if (device_property_match_string(dev, "realtek,led-scan-mode", "single-color") >= 0) {
+		port_counts = rtl8231_led_port_counts_single;
+		regmap_update_bits(map, RTL8231_REG_FUNC0,
+			RTL8231_FUNC0_SCAN_MODE, RTL8231_FUNC0_SCAN_SINGLE);
+	} else if (device_property_match_string(dev, "realtek,led-scan-mode", "bi-color") >= 0) {
+		port_counts = rtl8231_led_port_counts_bicolor;
+		regmap_update_bits(map, RTL8231_REG_FUNC0,
+			RTL8231_FUNC0_SCAN_MODE, RTL8231_FUNC0_SCAN_BICOLOR);
+	} else {
+		dev_err(dev, "scan mode missing or invalid\n");
+		return -EINVAL;
+	}
+
+	fwnode_for_each_available_child_node(dev->fwnode, child) {
+		err = rtl8231_led_probe_single(dev, map, port_counts, child);
+		if (err)
+			dev_warn(dev, "failed to register LED %pfwP\n", child);
+	}
+
+	return 0;
+}
+
+static const struct of_device_id of_rtl8231_led_match[] = {
+	{ .compatible = "realtek,rtl8231-leds" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, of_rtl8231_led_match);
+
+static struct platform_driver rtl8231_led_driver = {
+	.driver = {
+		.name = "rtl8231-leds",
+		.of_match_table = of_rtl8231_led_match,
+	},
+	.probe = rtl8231_led_probe,
+};
+module_platform_driver(rtl8231_led_driver);
+
+MODULE_AUTHOR("Sander Vanheule <sander@svanheule.net>");
+MODULE_DESCRIPTION("Realtek RTL8231 LED support");
+MODULE_LICENSE("GPL v2");
-- 
2.31.1

