Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54D8B37A68D
	for <lists+linux-leds@lfdr.de>; Tue, 11 May 2021 14:25:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231609AbhEKM0n (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 11 May 2021 08:26:43 -0400
Received: from polaris.svanheule.net ([84.16.241.116]:35970 "EHLO
        polaris.svanheule.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231423AbhEKM0k (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 11 May 2021 08:26:40 -0400
Received: from terra.local.svanheule.net (unknown [IPv6:2a02:a03f:eafb:ee01:a5bf:613f:4f5:f348])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id 169171FCC22;
        Tue, 11 May 2021 14:25:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1620735932;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bj/t+Ko5preUh1rbtCP0o4WD9qj0OBzuV+P6bWVSDyc=;
        b=4uI3B8txOlTUJIiBPZpBYQUfAYHQ4dDVrhiOFASIZ8WzLFTNFbmurk6cLbv0nhTiIlMe3z
        FJ08w4C1sG785u46INPZG9Mjl3QK9dFQz+/JjN4Wt+FHBvSPWDWVSfbLVZKmYffqjYw16G
        VLShdHSVN2P5nlaD0k6+bppgs4w22pUX1Xf/bZb2ngI7nJ0oON6zsmVNJTiMCBks72EsHw
        1vkhmQ3QXyigwKcr4RFyaEPnNb2psaX1h+yYWBVp0AaoGMsr4e02rdbq7fEDdoS1i1Gmxl
        N7ctQUFYiKPtMpB4V2uu07XNX9IR7BUxNuk86fMkG/WeOvLqw5ZfvWzJ5GOfow==
From:   Sander Vanheule <sander@svanheule.net>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Sander Vanheule <sander@svanheule.net>
Subject: [PATCH 4/5] pinctrl: Add RTL8231 pin control and GPIO support
Date:   Tue, 11 May 2021 14:25:22 +0200
Message-Id: <e2975652427f3df79d35e126e814dba6d51de824.1620735871.git.sander@svanheule.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1620735871.git.sander@svanheule.net>
References: <cover.1620735871.git.sander@svanheule.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This driver implements the GPIO and pin muxing features provided by the
RTL8231. The device should be instantiated as an MFD child, where the
parent device has already configured the regmap used for register
access.

Although described in the bindings, pin debouncing and drive strength
selection are currently not implemented. Debouncing is only available
for the six highest GPIOs, and must be emulated when other pins are used
for (button) inputs anyway.

Signed-off-by: Sander Vanheule <sander@svanheule.net>
---
 drivers/pinctrl/Kconfig           |  10 +
 drivers/pinctrl/Makefile          |   1 +
 drivers/pinctrl/pinctrl-rtl8231.c | 497 ++++++++++++++++++++++++++++++
 3 files changed, 508 insertions(+)
 create mode 100644 drivers/pinctrl/pinctrl-rtl8231.c

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index c2c7e7963ed0..5fce23126ae3 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -221,6 +221,16 @@ config PINCTRL_ROCKCHIP
 	help
           This support pinctrl and gpio driver for Rockchip SoCs.
 
+config PINCTRL_RTL8231
+	tristate "Realtek RTL8231 GPIO expander's pin controller"
+	depends on MFD_RTL8231
+	default MFD_RTL8231
+	select GENERIC_PINCONF
+	select PINMUX
+	help
+	  Support for RTL8231 expander's GPIOs and pin controller.
+	  When built as a module, the module will be called rtl8231_pinctrl.
+
 config PINCTRL_SINGLE
 	tristate "One-register-per-pin type device tree based pinctrl driver"
 	depends on OF
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index 5ef5334a797f..239603efb317 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -30,6 +30,7 @@ obj-$(CONFIG_PINCTRL_PALMAS)	+= pinctrl-palmas.o
 obj-$(CONFIG_PINCTRL_PIC32)	+= pinctrl-pic32.o
 obj-$(CONFIG_PINCTRL_PISTACHIO)	+= pinctrl-pistachio.o
 obj-$(CONFIG_PINCTRL_ROCKCHIP)	+= pinctrl-rockchip.o
+obj-$(CONFIG_PINCTRL_RTL8231)	+= pinctrl-rtl8231.o
 obj-$(CONFIG_PINCTRL_SINGLE)	+= pinctrl-single.o
 obj-$(CONFIG_PINCTRL_SX150X)	+= pinctrl-sx150x.o
 obj-$(CONFIG_ARCH_TEGRA)	+= tegra/
diff --git a/drivers/pinctrl/pinctrl-rtl8231.c b/drivers/pinctrl/pinctrl-rtl8231.c
new file mode 100644
index 000000000000..bbfb407e790d
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-rtl8231.c
@@ -0,0 +1,497 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/bitops.h>
+#include <linux/gpio/driver.h>
+#include <linux/mfd/rtl8231.h>
+#include <linux/module.h>
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#define RTL8231_NUM_GPIOS	37
+
+enum rtl8231_gpio_regfield {
+	RTL8231_FIELD_GPIO_DIR0,
+	RTL8231_FIELD_GPIO_DIR1,
+	RTL8231_FIELD_GPIO_DIR2,
+	RTL8231_FIELD_GPIO_DATA0,
+	RTL8231_FIELD_GPIO_DATA1,
+	RTL8231_FIELD_GPIO_DATA2,
+	RTL8231_FIELD_GPIO_MAX
+};
+
+static struct reg_field rtl8231_gpio_fields[RTL8231_FIELD_GPIO_MAX] = {
+	[RTL8231_FIELD_GPIO_DIR0] = REG_FIELD(RTL8231_REG_GPIO_DIR0, 0, 15),
+	[RTL8231_FIELD_GPIO_DIR1] = REG_FIELD(RTL8231_REG_GPIO_DIR1, 0, 15),
+	[RTL8231_FIELD_GPIO_DIR2] = REG_FIELD(RTL8231_REG_PIN_HI_CFG, 5, 9),
+	[RTL8231_FIELD_GPIO_DATA0] = REG_FIELD(RTL8231_REG_GPIO_DATA0, 0, 15),
+	[RTL8231_FIELD_GPIO_DATA1] = REG_FIELD(RTL8231_REG_GPIO_DATA1, 0, 15),
+	[RTL8231_FIELD_GPIO_DATA2] = REG_FIELD(RTL8231_REG_GPIO_DATA2, 0, 4),
+};
+
+struct rtl8231_function {
+	const char *name;
+	unsigned int ngroups;
+	const char **groups;
+};
+
+struct rtl8231_pin_ctrl {
+	/* Pin controller */
+	struct pinctrl_desc pctl_desc;
+	unsigned int nfunctions;
+	struct rtl8231_function *functions;
+	struct regmap *map;
+	/* GPIO controller */
+	struct gpio_chip gc;
+	struct regmap_field *fields[RTL8231_FIELD_GPIO_MAX];
+};
+
+/*
+ * Pin controller functionality
+ */
+static const char * const rtl8231_pin_function_names[] = {
+	"gpio",
+	"led",
+	"pwm",
+};
+
+enum rtl8231_pin_function {
+	RTL8231_PIN_FUNCTION_GPIO = BIT(0),
+	RTL8231_PIN_FUNCTION_LED = BIT(1),
+	RTL8231_PIN_FUNCTION_PWM = BIT(2),
+};
+
+struct rtl8231_pin_desc {
+	unsigned int number;
+	const char *name;
+	enum rtl8231_pin_function functions;
+	u8 reg;
+	u8 offset;
+	u8 gpio_function_value;
+};
+
+#define RTL8231_PIN(_num, _func, _reg, _fld, _val)		\
+	{							\
+		.number = _num,					\
+		.name = "gpio" #_num,				\
+		.functions = RTL8231_PIN_FUNCTION_GPIO | _func,	\
+		.reg = _reg,					\
+		.offset = _fld,					\
+		.gpio_function_value = _val,			\
+	}
+#define RTL8231_GPIO_PIN(_num)					\
+	RTL8231_PIN(_num, 0, 0, 0, 0)
+#define RTL8231_LED_PIN(_num, _reg, _fld)			\
+	RTL8231_PIN(_num, RTL8231_PIN_FUNCTION_LED, _reg, _fld, RTL8231_PIN_MODE_GPIO)
+#define RTL8231_PWM_PIN(_num, _reg, _fld)			\
+	RTL8231_PIN(_num, RTL8231_PIN_FUNCTION_PWM, _reg, _fld, 0)
+
+/* Pins always support GPIO, and may support one alternate function */
+static const struct rtl8231_pin_desc rtl8231_pins[RTL8231_NUM_GPIOS] = {
+	RTL8231_LED_PIN(0, RTL8231_REG_PIN_MODE0, 0),
+	RTL8231_LED_PIN(1, RTL8231_REG_PIN_MODE0, 1),
+	RTL8231_LED_PIN(2, RTL8231_REG_PIN_MODE0, 2),
+	RTL8231_LED_PIN(3, RTL8231_REG_PIN_MODE0, 3),
+	RTL8231_LED_PIN(4, RTL8231_REG_PIN_MODE0, 4),
+	RTL8231_LED_PIN(5, RTL8231_REG_PIN_MODE0, 5),
+	RTL8231_LED_PIN(6, RTL8231_REG_PIN_MODE0, 6),
+	RTL8231_LED_PIN(7, RTL8231_REG_PIN_MODE0, 7),
+	RTL8231_LED_PIN(8, RTL8231_REG_PIN_MODE0, 8),
+	RTL8231_LED_PIN(9, RTL8231_REG_PIN_MODE0, 9),
+	RTL8231_LED_PIN(10, RTL8231_REG_PIN_MODE0, 10),
+	RTL8231_LED_PIN(11, RTL8231_REG_PIN_MODE0, 11),
+	RTL8231_LED_PIN(12, RTL8231_REG_PIN_MODE0, 12),
+	RTL8231_LED_PIN(13, RTL8231_REG_PIN_MODE0, 13),
+	RTL8231_LED_PIN(14, RTL8231_REG_PIN_MODE0, 14),
+	RTL8231_LED_PIN(15, RTL8231_REG_PIN_MODE0, 15),
+	RTL8231_LED_PIN(16, RTL8231_REG_PIN_MODE1, 0),
+	RTL8231_LED_PIN(17, RTL8231_REG_PIN_MODE1, 1),
+	RTL8231_LED_PIN(18, RTL8231_REG_PIN_MODE1, 2),
+	RTL8231_LED_PIN(19, RTL8231_REG_PIN_MODE1, 3),
+	RTL8231_LED_PIN(20, RTL8231_REG_PIN_MODE1, 4),
+	RTL8231_LED_PIN(21, RTL8231_REG_PIN_MODE1, 5),
+	RTL8231_LED_PIN(22, RTL8231_REG_PIN_MODE1, 6),
+	RTL8231_LED_PIN(23, RTL8231_REG_PIN_MODE1, 7),
+	RTL8231_LED_PIN(24, RTL8231_REG_PIN_MODE1, 8),
+	RTL8231_LED_PIN(25, RTL8231_REG_PIN_MODE1, 9),
+	RTL8231_LED_PIN(26, RTL8231_REG_PIN_MODE1, 10),
+	RTL8231_LED_PIN(27, RTL8231_REG_PIN_MODE1, 11),
+	RTL8231_LED_PIN(28, RTL8231_REG_PIN_MODE1, 12),
+	RTL8231_LED_PIN(29, RTL8231_REG_PIN_MODE1, 13),
+	RTL8231_LED_PIN(30, RTL8231_REG_PIN_MODE1, 14),
+	RTL8231_LED_PIN(31, RTL8231_REG_PIN_MODE1, 15),
+	RTL8231_LED_PIN(32, RTL8231_REG_PIN_HI_CFG, 0),
+	RTL8231_LED_PIN(33, RTL8231_REG_PIN_HI_CFG, 1),
+	RTL8231_LED_PIN(34, RTL8231_REG_PIN_HI_CFG, 2),
+	RTL8231_PWM_PIN(35, RTL8231_REG_FUNC1, 3),
+	RTL8231_GPIO_PIN(36),
+};
+
+static int rtl8231_get_groups_count(struct pinctrl_dev *pctldev)
+{
+	return ARRAY_SIZE(rtl8231_pins);
+}
+
+static const char *rtl8231_get_group_name(struct pinctrl_dev *pctldev, unsigned int selector)
+{
+	return rtl8231_pins[selector].name;
+}
+
+static int rtl8231_get_group_pins(struct pinctrl_dev *pctldev, unsigned int selector,
+	const unsigned int **pins, unsigned int *num_pins)
+{
+	if (selector < ARRAY_SIZE(rtl8231_pins)) {
+		*pins = &rtl8231_pins[selector].number;
+		*num_pins = 1;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static const struct pinctrl_ops rtl8231_pinctrl_ops = {
+	.get_groups_count = rtl8231_get_groups_count,
+	.get_group_name = rtl8231_get_group_name,
+	.get_group_pins = rtl8231_get_group_pins,
+	.dt_node_to_map = pinconf_generic_dt_node_to_map_all,
+	.dt_free_map = pinconf_generic_dt_free_map,
+};
+
+static int rtl8231_get_functions_count(struct pinctrl_dev *pctldev)
+{
+	struct rtl8231_pin_ctrl *ctrl = pinctrl_dev_get_drvdata(pctldev);
+
+	return ctrl->nfunctions;
+}
+
+static const char *rtl8231_get_function_name(struct pinctrl_dev *pctldev, unsigned int selector)
+{
+	struct rtl8231_pin_ctrl *ctrl = pinctrl_dev_get_drvdata(pctldev);
+
+	return ctrl->functions[selector].name;
+}
+
+static int rtl8231_get_function_groups(struct pinctrl_dev *pctldev, unsigned int selector,
+	const char * const **groups, unsigned int *num_groups)
+{
+	struct rtl8231_pin_ctrl *ctrl = pinctrl_dev_get_drvdata(pctldev);
+
+	*groups = ctrl->functions[selector].groups;
+	*num_groups = ctrl->functions[selector].ngroups;
+	return 0;
+}
+
+static int rtl8231_set_mux(struct pinctrl_dev *pctldev, unsigned int func_selector,
+	unsigned int group_selector)
+{
+	struct rtl8231_pin_ctrl *ctrl = pinctrl_dev_get_drvdata(pctldev);
+	const struct rtl8231_pin_desc *desc = &rtl8231_pins[group_selector];
+	unsigned int func_flag = BIT(func_selector);
+	unsigned int function_mask;
+	unsigned int gpio_function;
+	int err = 0;
+
+	if (!(desc->functions & func_flag))
+		return -EINVAL;
+
+	function_mask = BIT(desc->offset);
+	gpio_function = desc->gpio_function_value << desc->offset;
+
+	switch (func_flag) {
+	case RTL8231_PIN_FUNCTION_LED:
+	case RTL8231_PIN_FUNCTION_PWM:
+		err = regmap_update_bits(ctrl->map, desc->reg, function_mask, ~gpio_function);
+		break;
+	case RTL8231_PIN_FUNCTION_GPIO:
+		err = regmap_update_bits(ctrl->map, desc->reg, function_mask, gpio_function);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return err;
+}
+
+static int rtl8231_gpio_request_enable(struct pinctrl_dev *pctldev,
+	struct pinctrl_gpio_range *range, unsigned int offset)
+{
+	struct rtl8231_pin_ctrl *ctrl = pinctrl_dev_get_drvdata(pctldev);
+	const struct rtl8231_pin_desc *desc = &rtl8231_pins[offset];
+	unsigned int function_mask;
+	unsigned int gpio_function;
+
+	function_mask = BIT(desc->offset);
+	gpio_function = desc->gpio_function_value << desc->offset;
+
+	return regmap_update_bits(ctrl->map, desc->reg, function_mask, gpio_function);
+}
+
+static const struct pinmux_ops rtl8231_pinmux_ops = {
+	.set_mux = rtl8231_set_mux,
+	.get_functions_count = rtl8231_get_functions_count,
+	.get_function_name = rtl8231_get_function_name,
+	.get_function_groups = rtl8231_get_function_groups,
+	.gpio_request_enable = rtl8231_gpio_request_enable,
+	.strict = true
+};
+
+
+static int rtl8231_pinctrl_init_functions(struct device *dev, struct rtl8231_pin_ctrl *ctrl)
+{
+	struct rtl8231_function *function;
+	const char **group_name;
+	unsigned int f_idx;
+	unsigned int pin;
+
+	ctrl->nfunctions = ARRAY_SIZE(rtl8231_pin_function_names);
+	ctrl->functions = devm_kcalloc(dev, ctrl->nfunctions, sizeof(*ctrl->functions), GFP_KERNEL);
+	if (IS_ERR(ctrl->functions)) {
+		dev_err(dev, "failed to allocate pin function descriptors\n");
+		return PTR_ERR(ctrl->functions);
+	}
+
+	for (f_idx = 0; f_idx < ctrl->nfunctions; f_idx++) {
+		function = &ctrl->functions[f_idx];
+		function->name = rtl8231_pin_function_names[f_idx];
+
+		for (pin = 0; pin < ctrl->pctl_desc.npins; pin++)
+			if (rtl8231_pins[pin].functions & BIT(f_idx))
+				function->ngroups++;
+
+		function->groups = devm_kcalloc(dev, function->ngroups,
+			sizeof(*function->groups), GFP_KERNEL);
+		if (IS_ERR(function->groups)) {
+			dev_err(dev, "failed to allocate pin function group names\n");
+			return PTR_ERR(function->groups);
+		}
+
+		group_name = function->groups;
+		for (pin = 0; pin < ctrl->pctl_desc.npins; pin++)
+			if (rtl8231_pins[pin].functions & BIT(f_idx))
+				*group_name++ = rtl8231_pins[pin].name;
+	}
+
+	return 0;
+}
+
+static int rtl8231_pinctrl_init(struct device *dev, struct rtl8231_pin_ctrl *ctrl)
+{
+	struct pinctrl_dev *pctl;
+	struct pinctrl_pin_desc *pins;
+	unsigned int pin;
+	int err = 0;
+
+	ctrl->pctl_desc.name = "rtl8231-pinctrl",
+	ctrl->pctl_desc.owner = THIS_MODULE,
+	ctrl->pctl_desc.pctlops = &rtl8231_pinctrl_ops,
+	ctrl->pctl_desc.pmxops = &rtl8231_pinmux_ops,
+
+	ctrl->pctl_desc.npins = ARRAY_SIZE(rtl8231_pins);
+	pins = devm_kcalloc(dev, ctrl->pctl_desc.npins, sizeof(*pins), GFP_KERNEL);
+	if (IS_ERR(pins)) {
+		dev_err(dev, "failed to allocate pin descriptors\n");
+		return PTR_ERR(pins);
+	}
+	ctrl->pctl_desc.pins = pins;
+
+	for (pin = 0; pin < ctrl->pctl_desc.npins; pin++) {
+		pins[pin].number = rtl8231_pins[pin].number;
+		pins[pin].name = rtl8231_pins[pin].name;
+	}
+
+	err = rtl8231_pinctrl_init_functions(dev, ctrl);
+	if (err)
+		return err;
+
+	err = devm_pinctrl_register_and_init(dev->parent, &ctrl->pctl_desc, ctrl, &pctl);
+	if (err) {
+		dev_err(dev, "failed to register pin controller\n");
+		return err;
+	}
+
+	err = pinctrl_enable(pctl);
+	if (err)
+		dev_err(dev, "failed to enable pin controller\n");
+
+	return err;
+}
+
+/*
+ * GPIO controller functionality
+ */
+static int rtl8231_pin_read(struct rtl8231_pin_ctrl *ctrl, int base, int offset)
+{
+	int field = base + offset / 16;
+	int bit = offset % 16;
+	unsigned int v;
+	int err;
+
+	err = regmap_field_read(ctrl->fields[field], &v);
+	if (err)
+		return err;
+
+	return !!(v & BIT(bit));
+}
+
+static int rtl8231_pin_write(struct rtl8231_pin_ctrl *ctrl, int base, int offset, int val)
+{
+	int field = base + offset / 16;
+	int bit = offset % 16;
+
+	return regmap_field_update_bits(ctrl->fields[field], BIT(bit), val << bit);
+}
+
+static int rtl8231_direction_input(struct gpio_chip *gc, unsigned int offset)
+{
+	struct rtl8231_pin_ctrl *ctrl = gpiochip_get_data(gc);
+
+	return rtl8231_pin_write(ctrl, RTL8231_FIELD_GPIO_DIR0, offset, RTL8231_GPIO_DIR_IN);
+}
+
+static int rtl8231_direction_output(struct gpio_chip *gc, unsigned int offset, int value)
+{
+	struct rtl8231_pin_ctrl *ctrl = gpiochip_get_data(gc);
+	int err;
+
+	err = rtl8231_pin_write(ctrl, RTL8231_FIELD_GPIO_DIR0, offset, RTL8231_GPIO_DIR_OUT);
+	if (err)
+		return err;
+
+	return rtl8231_pin_write(ctrl, RTL8231_FIELD_GPIO_DATA0, offset, value);
+}
+
+static int rtl8231_get_direction(struct gpio_chip *gc, unsigned int offset)
+{
+	struct rtl8231_pin_ctrl *ctrl = gpiochip_get_data(gc);
+
+	return rtl8231_pin_read(ctrl, RTL8231_FIELD_GPIO_DIR0, offset);
+}
+
+static int rtl8231_gpio_get(struct gpio_chip *gc, unsigned int offset)
+{
+	struct rtl8231_pin_ctrl *ctrl = gpiochip_get_data(gc);
+
+	return rtl8231_pin_read(ctrl, RTL8231_FIELD_GPIO_DATA0, offset);
+}
+
+static void rtl8231_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
+{
+	struct rtl8231_pin_ctrl *ctrl = gpiochip_get_data(gc);
+
+	rtl8231_pin_write(ctrl, RTL8231_FIELD_GPIO_DATA0, offset, value);
+}
+
+static int rtl8231_gpio_get_multiple(struct gpio_chip *gc,
+	unsigned long *mask, unsigned long *bits)
+{
+	struct rtl8231_pin_ctrl *ctrl = gpiochip_get_data(gc);
+	unsigned long sub_mask, bit_value;
+	struct regmap_field **field;
+	unsigned int reg_value;
+	int offset, shift;
+	int read;
+	int err;
+
+	field = &ctrl->fields[RTL8231_FIELD_GPIO_DATA0];
+
+	for (read = 0; read < gc->ngpio; field++, read += 16) {
+		shift = read % BITS_PER_TYPE(*bits);
+		offset = read / BITS_PER_TYPE(*bits);
+		sub_mask = mask[offset] & (0xffffUL << shift);
+		if (sub_mask) {
+			err = regmap_field_read(*field, &reg_value);
+			if (err)
+				return err;
+			bit_value = ((unsigned long) reg_value) << shift;
+			bits[offset] = (bits[offset] & ~sub_mask) | (bit_value & sub_mask);
+		}
+	}
+
+	return err;
+}
+
+static void rtl8231_gpio_set_multiple(struct gpio_chip *gc,
+	unsigned long *mask, unsigned long *bits)
+{
+	struct rtl8231_pin_ctrl *ctrl = gpiochip_get_data(gc);
+	unsigned long sub_mask, value;
+	struct regmap_field **field;
+	int offset, shift;
+	int read;
+
+	field = &ctrl->fields[RTL8231_FIELD_GPIO_DATA0];
+
+	for (read = 0; read < gc->ngpio; field++, read += 16) {
+		shift = read % BITS_PER_TYPE(*bits);
+		offset = read / BITS_PER_TYPE(*bits);
+		sub_mask = (mask[offset] >> shift) & 0xffff;
+		if (sub_mask) {
+			value = bits[offset] >> shift;
+			regmap_field_update_bits(*field, sub_mask, value);
+		}
+	}
+}
+
+static int rtl8231_pinctrl_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct rtl8231_pin_ctrl *ctrl;
+	int err;
+
+	ctrl = devm_kzalloc(dev, sizeof(*ctrl), GFP_KERNEL);
+	if (!ctrl)
+		return -ENOMEM;
+
+	ctrl->map = dev_get_regmap(dev->parent, NULL);
+	if (IS_ERR_OR_NULL(ctrl->map)) {
+		dev_err(dev, "failed to retrieve regmap\n");
+		if (!ctrl->map)
+			return -ENODEV;
+		else
+			return PTR_ERR(ctrl->map);
+	}
+
+	err = devm_regmap_field_bulk_alloc(dev, ctrl->map, ctrl->fields, rtl8231_gpio_fields,
+		ARRAY_SIZE(ctrl->fields));
+	if (err) {
+		dev_err(dev, "unable to allocate gpio regmap fields\n");
+		return err;
+	}
+
+	err = rtl8231_pinctrl_init(dev, ctrl);
+	if (err)
+		return err;
+
+	ctrl->gc.base = -1;
+	ctrl->gc.ngpio = RTL8231_NUM_GPIOS;
+	ctrl->gc.label = pdev->name;
+	ctrl->gc.owner = THIS_MODULE;
+	ctrl->gc.can_sleep = true;
+	ctrl->gc.parent = dev->parent;
+
+	ctrl->gc.set = rtl8231_gpio_set;
+	ctrl->gc.set_multiple = rtl8231_gpio_set_multiple;
+	ctrl->gc.get = rtl8231_gpio_get;
+	ctrl->gc.get_multiple = rtl8231_gpio_get_multiple;
+	ctrl->gc.direction_input = rtl8231_direction_input;
+	ctrl->gc.direction_output = rtl8231_direction_output;
+	ctrl->gc.get_direction = rtl8231_get_direction;
+	ctrl->gc.request = gpiochip_generic_request;
+	ctrl->gc.free = gpiochip_generic_free;
+
+	return devm_gpiochip_add_data(dev, &ctrl->gc, ctrl);
+}
+
+static struct platform_driver rtl8231_pinctrl_driver = {
+	.driver = {
+		.name = "rtl8231-pinctrl",
+	},
+	.probe = rtl8231_pinctrl_probe,
+};
+module_platform_driver(rtl8231_pinctrl_driver);
+
+MODULE_AUTHOR("Sander Vanheule <sander@svanheule.net>");
+MODULE_DESCRIPTION("Realtek RTL8231 pin control and GPIO support");
+MODULE_LICENSE("GPL v2");
-- 
2.31.1

