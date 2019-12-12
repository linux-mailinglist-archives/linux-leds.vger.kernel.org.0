Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41C9B11C402
	for <lists+linux-leds@lfdr.de>; Thu, 12 Dec 2019 04:42:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727697AbfLLDkD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 11 Dec 2019 22:40:03 -0500
Received: from mx2.suse.de ([195.135.220.15]:58662 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727594AbfLLDkD (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 11 Dec 2019 22:40:03 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id D1D8BAF21;
        Thu, 12 Dec 2019 03:39:59 +0000 (UTC)
From:   =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
To:     linux-realtek-soc@lists.infradead.org, linux-leds@vger.kernel.org
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
        zypeng@titanmec.com
Subject: [RFC 07/25] leds: Add Titan Micro Electronics TM1628
Date:   Thu, 12 Dec 2019 04:39:34 +0100
Message-Id: <20191212033952.5967-8-afaerber@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191212033952.5967-1-afaerber@suse.de>
References: <20191212033952.5967-1-afaerber@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add a driver for TM1628 LED controller.

Cc: zypeng@titanmec.com
Signed-off-by: Andreas Färber <afaerber@suse.de>
---
 drivers/leds/Kconfig       |  11 ++
 drivers/leds/Makefile      |   1 +
 drivers/leds/leds-tm1628.c | 420 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 432 insertions(+)
 create mode 100644 drivers/leds/leds-tm1628.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 4b68520ac251..f3afb419a9a1 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -836,6 +836,17 @@ config LEDS_LM36274
 	  Say Y to enable the LM36274 LED driver for TI LMU devices.
 	  This supports the LED device LM36274.
 
+config LEDS_TM1628
+	tristate "LED driver for TM1628"
+	depends on LEDS_CLASS
+	depends on SPI
+	depends on OF || COMPILE_TEST
+	help
+	  Say Y to enable support for Titan Micro Electronics TM1628
+	  LED controllers.
+	  They are 3-wire SPI devices controlling a two-dimensional grid of
+	  LEDs. Dimming is applied to all outputs through an internal PWM.
+
 comment "LED Triggers"
 source "drivers/leds/trigger/Kconfig"
 
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 2da39e896ce8..4c931002ef44 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -90,6 +90,7 @@ obj-$(CONFIG_LEDS_LM36274)		+= leds-lm36274.o
 obj-$(CONFIG_LEDS_CR0014114)		+= leds-cr0014114.o
 obj-$(CONFIG_LEDS_DAC124S085)		+= leds-dac124s085.o
 obj-$(CONFIG_LEDS_EL15203000)		+= leds-el15203000.o
+obj-$(CONFIG_LEDS_TM1628)		+= leds-tm1628.o
 
 # LED Userspace Drivers
 obj-$(CONFIG_LEDS_USER)			+= uleds.o
diff --git a/drivers/leds/leds-tm1628.c b/drivers/leds/leds-tm1628.c
new file mode 100644
index 000000000000..319bf34ce835
--- /dev/null
+++ b/drivers/leds/leds-tm1628.c
@@ -0,0 +1,420 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Titan Micro Electronics TM1628 LED controller
+ *
+ * Copyright (c) 2019 Andreas Färber
+ */
+
+#include <linux/bitops.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/property.h>
+#include <linux/pwm.h>
+#include <linux/spi/spi.h>
+
+#define TM1628_CMD_MASK			GENMASK(7, 6)
+#define TM1628_CMD_DISPLAY_MODE		(0x0 << 6)
+#define TM1628_CMD_DATA_SETTING		(0x1 << 6)
+#define TM1628_CMD_DISPLAY_CTRL		(0x2 << 6)
+#define TM1628_CMD_ADDRESS_SETTING	(0x3 << 6)
+
+#define TM1628_DISPLAY_MODE_MODE_MASK	GENMASK(1, 0)
+
+#define TM1628_DATA_SETTING_MODE_MASK	GENMASK(1, 0)
+#define TM1628_DATA_SETTING_WRITE_DATA	0x0
+#define TM1628_DATA_SETTING_READ_DATA	0x2
+#define TM1628_DATA_SETTING_FIXED_ADDR	BIT(2)
+#define TM1628_DATA_SETTING_TEST_MODE	BIT(3)
+
+#define TM1628_DISPLAY_CTRL_PW_MASK	GENMASK(2, 0)
+
+#define TM1628_DISPLAY_CTRL_DISPLAY_ON	BIT(3)
+
+struct tm1628_mode {
+	u8	grid_mask;
+	u16	seg_mask;
+};
+
+struct tm1628_info {
+	u8				grid_mask;
+	u16				seg_mask;
+	const struct tm1628_mode	*modes;
+	int				default_mode;
+	const struct pwm_capture	*pwm_map;
+	int				default_pwm;
+};
+
+struct tm1628_led {
+	struct led_classdev	leddev;
+	struct tm1628		*ctrl;
+	u32			grid;
+	u32			seg;
+};
+
+struct tm1628 {
+	struct spi_device		*spi;
+	const struct tm1628_info	*info;
+	u32				grids;
+	unsigned int			segments;
+	int				mode_index;
+	int				pwm_index;
+	u8				data[14];
+	unsigned int			num_leds;
+	struct tm1628_led		leds[];
+};
+
+/* Command 1: Display Mode Setting */
+static int tm1628_set_display_mode(struct spi_device *spi, u8 grid_mode)
+{
+	u8 cmd = TM1628_CMD_DISPLAY_MODE;
+
+	if (unlikely(grid_mode & ~TM1628_DISPLAY_MODE_MODE_MASK))
+		return -EINVAL;
+
+	cmd |= grid_mode;
+
+	return spi_write(spi, &cmd, 1);
+}
+
+/* Command 2: Data Setting */
+static int tm1628_write_data(struct spi_device *spi, const u8 *data, unsigned int len)
+{
+	u8 cmd = TM1628_CMD_DATA_SETTING | TM1628_DATA_SETTING_WRITE_DATA;
+	struct spi_transfer xfers[] = {
+		{
+			.tx_buf = &cmd,
+			.len = 1,
+		},
+		{
+			.tx_buf = data,
+			.len = len,
+		},
+	};
+
+	if (len > 14)
+		return -EINVAL;
+
+	return spi_sync_transfer(spi, xfers, ARRAY_SIZE(xfers));
+}
+
+/* Command 3: Address Setting */
+static int tm1628_set_address(struct spi_device *spi, u8 addr)
+{
+	u8 cmd = TM1628_CMD_ADDRESS_SETTING;
+
+	cmd |= (addr & GENMASK(3, 0));
+
+	return spi_write(spi, &cmd, 1);
+}
+
+/* Command 4: Display Control */
+static int tm1628_set_display_ctrl(struct spi_device *spi, bool on, u8 pwm_index)
+{
+	u8 cmd = TM1628_CMD_DISPLAY_CTRL;
+
+	if (on)
+		cmd |= TM1628_DISPLAY_CTRL_DISPLAY_ON;
+
+	if (pwm_index & ~TM1628_DISPLAY_CTRL_PW_MASK)
+		return -EINVAL;
+
+	cmd |= pwm_index;
+
+	return spi_write(spi, &cmd, 1);
+}
+
+static inline bool tm1628_is_valid_grid(struct tm1628 *s, unsigned int grid)
+{
+	return s->info->modes[s->mode_index].grid_mask & BIT(grid);
+}
+
+static inline bool tm1628_is_valid_seg(struct tm1628 *s, unsigned int seg)
+{
+	return s->info->modes[s->mode_index].seg_mask & BIT(seg);
+}
+
+static int tm1628_get_led_offset(struct tm1628 *s,
+	unsigned int grid, unsigned int seg, int *poffset, int *pbit)
+{
+	int offset, bit;
+
+	if (grid == 0 || grid > 7 || seg == 0 || seg > 16)
+		return -EINVAL;
+
+	offset = (grid - 1) * 2;
+	bit = seg - 1;
+	if (bit >= 8) {
+		bit -= 8;
+		offset++;
+	}
+
+	*poffset = offset;
+	if (pbit)
+		*pbit = bit;
+
+	return 0;
+}
+
+static int tm1628_get_led(struct tm1628 *s,
+	unsigned int grid, unsigned int seg, bool *on)
+{
+	int offset, bit;
+	int ret;
+
+	ret = tm1628_get_led_offset(s, grid, seg, &offset, &bit);
+	if (ret)
+		return ret;
+
+	*on = !!(s->data[offset] & BIT(bit));
+
+	return 0;
+}
+
+static int tm1628_set_led(struct tm1628 *s,
+	unsigned int grid, unsigned int seg, bool on)
+{
+	int offset, bit;
+	int ret;
+
+	ret = tm1628_get_led_offset(s, grid, seg, &offset, &bit);
+	if (ret)
+		return ret;
+
+	if (on)
+		s->data[offset] |=  BIT(bit);
+	else
+		s->data[offset] &= ~BIT(bit);
+
+	return 0;
+}
+
+static int tm1628_led_set_brightness(struct led_classdev *led_cdev,
+	enum led_brightness brightness)
+{
+	struct tm1628_led *led = container_of(led_cdev, struct tm1628_led, leddev);
+	struct tm1628 *s = led->ctrl;
+	int ret, offset;
+
+	ret = tm1628_set_led(s, led->grid, led->seg, brightness != LED_OFF);
+	if (ret)
+		return ret;
+
+	ret = tm1628_get_led_offset(s, led->grid, led->seg, &offset, NULL);
+	if (unlikely(ret))
+		return ret;
+
+	ret = tm1628_set_address(s->spi, offset);
+	if (ret)
+		return ret;
+
+	return tm1628_write_data(s->spi, s->data + offset, 1);
+}
+
+static enum led_brightness tm1628_led_get_brightness(struct led_classdev *led_cdev)
+{
+	struct tm1628_led *led = container_of(led_cdev, struct tm1628_led, leddev);
+	struct tm1628 *s = led->ctrl;
+	bool on;
+	int ret;
+
+	ret = tm1628_get_led(s, led->grid, led->seg, &on);
+	if (ret)
+		return ret;
+
+	return on ? LED_ON : LED_OFF;
+}
+
+static int tm1628_register_led(struct tm1628 *s,
+	struct fwnode_handle *node, u32 grid, u32 seg, struct tm1628_led *led)
+{
+	struct device *dev = &s->spi->dev;
+	struct led_init_data init_data = {0};
+
+	if (!tm1628_is_valid_grid(s, grid) || !tm1628_is_valid_seg(s, seg)) {
+		dev_warn(dev, "%s reg out of range\n", fwnode_get_name(node));
+		return -EINVAL;
+	}
+
+	led->ctrl = s;
+	led->grid = grid;
+	led->seg  = seg;
+	led->leddev.max_brightness = LED_ON;
+	led->leddev.brightness_set_blocking = tm1628_led_set_brightness;
+	led->leddev.brightness_get = tm1628_led_get_brightness;
+
+	fwnode_property_read_string(node, "linux,default-trigger", &led->leddev.default_trigger);
+
+	init_data.fwnode = node;
+	init_data.devicename = "tm1628";
+
+	return devm_led_classdev_register_ext(dev, &led->leddev, &init_data);
+}
+
+/* Work around __builtin_popcount() */
+static u32 tm1628_grid_popcount(u8 grid_mask)
+{
+	int i, n = 0;
+
+	while (grid_mask) {
+		i = __ffs(grid_mask);
+		grid_mask &= ~BIT(i);
+		n++;
+	}
+
+	return n;
+}
+
+static int tm1628_spi_probe(struct spi_device *spi)
+{
+	struct tm1628 *s;
+	struct fwnode_handle *child;
+	u32 grids;
+	u32 reg[2];
+	size_t leds;
+	int ret, i;
+
+	leds = device_get_child_node_count(&spi->dev);
+
+	s = devm_kzalloc(&spi->dev, struct_size(s, leds, leds), GFP_KERNEL);
+	if (!s)
+		return -ENOMEM;
+
+	s->spi = spi;
+
+	s->info = device_get_match_data(&spi->dev);
+	if (!s->info)
+		return -EINVAL;
+
+	s->pwm_index = s->info->default_pwm;
+
+	ret = tm1628_set_display_ctrl(spi, false, s->pwm_index);
+	if (ret) {
+		dev_err(&spi->dev, "Turning display off failed (%d)\n", ret);
+		return ret;
+	}
+
+	ret = device_property_read_u32(&spi->dev, "#grids", &grids);
+	if (ret && ret != -EINVAL) {
+		dev_err(&spi->dev, "Error reading #grids property (%d)\n", ret);
+		return ret;
+	}
+
+	s->mode_index = -1;
+	for (i = 0; i < 4; i++) {
+		if (tm1628_grid_popcount(s->info->modes[i].grid_mask) != grids)
+			continue;
+		s->mode_index = i;
+		break;
+	}
+	if (s->mode_index == -1) {
+		dev_err(&spi->dev, "#grids out of range (%u)\n", grids);
+		return -EINVAL;
+	}
+
+	spi_set_drvdata(spi, s);
+
+	device_for_each_child_node(&spi->dev, child) {
+		ret = fwnode_property_read_u32_array(child, "reg", reg, 2);
+		if (ret) {
+			dev_err(&spi->dev, "Reading %s reg property failed (%d)\n",
+				fwnode_get_name(child), ret);
+			fwnode_handle_put(child);
+			return ret;
+		}
+
+		if (fwnode_property_count_u32(child, "reg") == 2) {
+			ret = tm1628_register_led(s, child, reg[0], reg[1], &s->leds[i++]);
+			if (ret && ret != -EINVAL) {
+				dev_err(&spi->dev, "Failed to register LED %s (%d)\n",
+					fwnode_get_name(child), ret);
+				fwnode_handle_put(child);
+				return ret;
+			}
+			s->num_leds++;
+		}
+	}
+
+	ret = tm1628_set_address(spi, 0x0);
+	if (ret) {
+		dev_err(&spi->dev, "Setting address failed (%d)\n", ret);
+		return ret;
+	}
+
+	ret = tm1628_write_data(spi, s->data, sizeof(s->data));
+	if (ret) {
+		dev_err(&spi->dev, "Writing data failed (%d)\n", ret);
+		return ret;
+	}
+
+	ret = tm1628_set_display_mode(spi, s->mode_index);
+	if (ret) {
+		dev_err(&spi->dev, "Setting display mode failed (%d)\n", ret);
+		return ret;
+	}
+
+	ret = tm1628_set_display_ctrl(spi, true, s->pwm_index);
+	if (ret) {
+		dev_err(&spi->dev, "Turning display on failed (%d)\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct pwm_capture tm1628_pwm_map[8] = {
+	{ .duty_cycle =  1, .period = 16 },
+	{ .duty_cycle =  2, .period = 16 },
+	{ .duty_cycle =  4, .period = 16 },
+	{ .duty_cycle = 10, .period = 16 },
+	{ .duty_cycle = 11, .period = 16 },
+	{ .duty_cycle = 12, .period = 16 },
+	{ .duty_cycle = 13, .period = 16 },
+	{ .duty_cycle = 14, .period = 16 },
+};
+
+static const struct tm1628_mode tm1628_modes[4] = {
+	{
+		.grid_mask = GENMASK(4, 1),
+		.seg_mask = GENMASK(14, 12) | GENMASK(10, 1),
+	},
+	{
+		.grid_mask = GENMASK(5, 1),
+		.seg_mask = GENMASK(13, 12) | GENMASK(10, 1),
+	},
+	{
+		.grid_mask = GENMASK(6, 1),
+		.seg_mask = BIT(12) | GENMASK(10, 1),
+	},
+	{
+		.grid_mask = GENMASK(7, 1),
+		.seg_mask = GENMASK(10, 1),
+	},
+};
+
+static const struct tm1628_info tm1628_info = {
+	.grid_mask = GENMASK(7, 1),
+	.seg_mask = GENMASK(14, 12) | GENMASK(10, 1),
+	.modes = tm1628_modes,
+	.default_mode = 3,
+	.pwm_map = tm1628_pwm_map,
+	.default_pwm = 0,
+};
+
+static const struct of_device_id tm1628_spi_of_matches[] = {
+	{ .compatible = "titanmec,tm1628", .data = &tm1628_info },
+	{}
+};
+MODULE_DEVICE_TABLE(of, tm1628_spi_of_matches);
+
+static struct spi_driver tm1628_spi_driver = {
+	.probe = tm1628_spi_probe,
+	.driver = {
+		.name = "tm1628",
+		.of_match_table = tm1628_spi_of_matches,
+	},
+};
+module_spi_driver(tm1628_spi_driver);
+
+MODULE_DESCRIPTION("TM1628 LED controller driver");
+MODULE_AUTHOR("Andreas Färber");
+MODULE_LICENSE("GPL");
-- 
2.16.4

