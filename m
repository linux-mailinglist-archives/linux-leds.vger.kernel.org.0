Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95F5F21D768
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2020 15:41:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729027AbgGMNlV (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 13 Jul 2020 09:41:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728950AbgGMNlU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 13 Jul 2020 09:41:20 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9D6FC061755;
        Mon, 13 Jul 2020 06:41:20 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id a14so6034285pfi.2;
        Mon, 13 Jul 2020 06:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D3zt9kjkbevZZmC6MdHVGbeHHJHRAZ3XmHUdzDfPGas=;
        b=WSvsHlsEPkszGI8TzhwfKwuO591wVL4iIOABsA1mYNoIv1X4GG88NP8uCJEOaM6C8M
         dniPXdS8i+sd1bbbpR5HYz0ekZ1ElS/blqi7npUiWB+ResA2VrDAQxKaVxon4noFWkyr
         zmJV8jy732Zou80AWk1/Bj8igJgsXNHISVyUG+0s3lFbI0PvVNbpyd/lEtUGOYDF7heO
         KimbVTpwn2EDomYAu7apHGYV8bXeDZiBm/sT4ryRBq3OVNcBfDuntiC2kCyYrBv+ezbH
         vn3g+eALZd2bsHBNwQZQ4Ot1xYIexhx3EQZxUpcMS+Wk3YUmbjUZUYH2kTZA4+WTQYwf
         REXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D3zt9kjkbevZZmC6MdHVGbeHHJHRAZ3XmHUdzDfPGas=;
        b=Q/rv4nBII1qCN/ZNDeW6ymafuPO0V/bGuas27kuYYaMj6F2VYlDrHhZK/40mGm6zgI
         QYIkP/ohfeuyZs1QN4G374vxd66wfRx+N7oTN/Hn9jxNb09CVydmpZye6zAIK94wWiyH
         q4CXMAZRLK1lLqN8zopqy9Ro7yK8EphZcmSeoFenQFqLxGeEM3VPBhNKho5yl7m/nBos
         a4iBoxlm27SnXkL+11EBWP4vvlPWqttK3oIk8hgjR4FCnz/ghMVpoK+hIZKebmifzfuT
         9SJN7nOL18Ut4YsW0fZXc8s7AT5dUvqnzF+hgBlaiPO+KfOzB+1AKbpkEHRI7PeLbMzC
         NCDw==
X-Gm-Message-State: AOAM533Rlw24IkvE1ERQ+sHHKCRvALgJcUZWbA1nRLhdf0CfbdHAa7FV
        2UqR2iacbTr0zL7UboVoFxw=
X-Google-Smtp-Source: ABdhPJzIDgEk9c5e/8nX3aOzkM2QHEBSKHD/XvJr6Bk9Agk3KAqe4rUIhDHhdExgKWlBKIwaBBikGg==
X-Received: by 2002:aa7:8557:: with SMTP id y23mr65493642pfn.148.1594647679980;
        Mon, 13 Jul 2020 06:41:19 -0700 (PDT)
Received: from localhost.localdomain ([240d:1a:8f0:6c00:89cb:88d1:b6b2:3345])
        by smtp.gmail.com with ESMTPSA id 17sm11832665pjl.30.2020.07.13.06.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 06:41:18 -0700 (PDT)
From:   Alexandre Courbot <gnurou@gmail.com>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        Alexandre Courbot <gnurou@gmail.com>
Subject: [PATCH] leds: add NCT6795D driver
Date:   Mon, 13 Jul 2020 22:41:14 +0900
Message-Id: <20200713134114.137265-1-gnurou@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add support for the LED feature of the NCT6795D chip found on some
motherboards, notably MSI ones. The LEDs are typically used using a
RGB connector so this driver creates one LED device for each color
component.

Also add self as maintainer.

Signed-off-by: Alexandre Courbot <gnurou@gmail.com>
---
 MAINTAINERS                  |   6 +
 drivers/leds/Kconfig         |   9 +
 drivers/leds/Makefile        |   1 +
 drivers/leds/leds-nct6795d.c | 447 +++++++++++++++++++++++++++++++++++
 4 files changed, 463 insertions(+)
 create mode 100644 drivers/leds/leds-nct6795d.c

diff --git a/MAINTAINERS b/MAINTAINERS
index b4a43a9e7fbc1..118c347ec2990 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11792,6 +11792,12 @@ S:	Maintained
 F:	Documentation/hwmon/nct6775.rst
 F:	drivers/hwmon/nct6775.c
 
+NCT6795D LED CONTROLLER DRIVER
+M:	Alexandre Courbot <gnurou@gmail.com>
+L:	linux-leds@vger.kernel.org
+S:	Maintained
+F:	drivers/leds/leds-nct6795d.c
+
 NETDEVSIM
 M:	Jakub Kicinski <kuba@kernel.org>
 S:	Maintained
diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index ed943140e1fd4..aa41493377947 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -886,6 +886,15 @@ config LEDS_SGM3140
 	  This option enables support for the SGM3140 500mA Buck/Boost Charge
 	  Pump LED Driver.
 
+config LEDS_NCT6795D
+	tristate "LED support for NCT6795D chipsets"
+	depends on LEDS_CLASS
+	help
+	  Enabled support for the leds feature of the NCT6795D chips.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called leds-nct6795d.
+
 comment "LED Triggers"
 source "drivers/leds/trigger/Kconfig"
 
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index d6b8a792c9367..04fcb2bb1e3c6 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -65,6 +65,7 @@ obj-$(CONFIG_LEDS_MIKROTIK_RB532)	+= leds-rb532.o
 obj-$(CONFIG_LEDS_MLXCPLD)		+= leds-mlxcpld.o
 obj-$(CONFIG_LEDS_MLXREG)		+= leds-mlxreg.o
 obj-$(CONFIG_LEDS_MT6323)		+= leds-mt6323.o
+obj-$(CONFIG_LEDS_NCT6795D)		+= leds-nct6795d.o
 obj-$(CONFIG_LEDS_NET48XX)		+= leds-net48xx.o
 obj-$(CONFIG_LEDS_NETXBIG)		+= leds-netxbig.o
 obj-$(CONFIG_LEDS_NIC78BX)		+= leds-nic78bx.o
diff --git a/drivers/leds/leds-nct6795d.c b/drivers/leds/leds-nct6795d.c
new file mode 100644
index 0000000000000..7d3cc7a2c8b4b
--- /dev/null
+++ b/drivers/leds/leds-nct6795d.c
@@ -0,0 +1,447 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright (c) 2020 Alexandre Courbot <gnurou@gmail.com>
+/*
+ * NCT6795D/NCT6797D LED driver
+ *
+ * Driver to control the RGB interfaces found on some MSI motherboards.
+ * This is for the most part a port of the MSI-RGB user-space program
+ * by Simonas Kazlauskas (https://github.com/nagisa/msi-rgb.git) to the Linux
+ * kernel LED interface.
+ *
+ * It is more limited than the original program due to limitations in the LED
+ * interface. For now, only static displays of colors are possible.
+ *
+ * Supported motherboards (a per MSI-RGB's README):
+ * B350 MORTAR ARCTIC
+ * B350 PC MATE
+ * B350 TOMAHAWK
+ * B360M GAMING PLUS
+ * B450 GAMING PLUS AC
+ * B450 MORTAR
+ * B450 TOMAHAWK
+ * B450M GAMING PLUS
+ * H270 MORTAR ARCTIC
+ * H270 TOMAHAWK ARCTIC
+ * X470 GAMING PLUS
+ * X470 GAMING PRO
+ * Z270 GAMING M7
+ * Z270 SLI PLUS
+ * Z370 MORTAR
+ * Z370 PC PRO
+ *
+ */
+
+#include <linux/io.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/ioport.h>
+#include <linux/kernel.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+/* Copied from drivers/hwmon/nct6775.c */
+
+#define SIO_REG_LDSEL 0x07 /* Logical device select */
+#define SIO_REG_DEVID 0x20 /* Device ID (2 bytes) */
+
+static inline void superio_outb(int ioreg, int reg, int val)
+{
+	outb(reg, ioreg);
+	outb(val, ioreg + 1);
+}
+
+static inline int superio_inb(int ioreg, int reg)
+{
+	outb(reg, ioreg);
+	return inb(ioreg + 1);
+}
+
+static inline void superio_select(int ioreg, int ld)
+{
+	outb(SIO_REG_LDSEL, ioreg);
+	outb(ld, ioreg + 1);
+}
+
+static inline int superio_enter(int ioreg)
+{
+	if (!request_muxed_region(ioreg, 2, "NCT6795D LED"))
+		return -EBUSY;
+
+	outb(0x87, ioreg);
+	outb(0x87, ioreg);
+
+	return 0;
+}
+
+static inline void superio_exit(int ioreg)
+{
+	outb(0xaa, ioreg);
+	outb(0x02, ioreg);
+	outb(0x02, ioreg + 1);
+	release_region(ioreg, 2);
+}
+
+/* End copy from drivers/hwmon/nct6775.c */
+
+#define NCT6795D_DEVICE_NAME "nct6795d"
+#define DEFAULT_STEP_DURATION 25
+
+#define NCT6795D_RGB_BANK 0x12
+
+/* Color registers */
+#define NCT6795D_RED_CELL 0xf0
+#define NCT6795D_GREEN_CELL 0xf4
+#define NCT6795D_BLUE_CELL 0xf8
+
+#define NCT6795D_PARAMS_0 0xe4
+/* Enable/disable LED overall */
+#define PARAMS_0_LED_ENABLE(e) ((e) ? 0x0 : 0x1)
+/* Enable/disable smooth pulsing */
+#define PARAMS_0_LED_PULSE_ENABLE(e) ((e) ? 0x08 : 0x0)
+/* Duration between blinks (0 is always on) */
+#define PARAMS_0_BLINK_DURATION(x) ((x) & 0x07)
+
+#define NCT6795D_PARAMS_1 0xfe
+/* Lower part of step duration (9 bits) */
+#define PARAMS_1_STEP_DURATION_LOW(s) ((s) & 0xff)
+
+#define NCT6795D_PARAMS_2 0xff
+/* Enable fade-in effect for specified primitive */
+#define PARAMS_2_FADE_COLOR(r, g, b) (0xe0 ^ (	\
+	((r) ? 0x80 : 0x0) |			\
+	((g) ? 0x40 : 0x0) |			\
+	((b) ? 0x20 : 0x0)))
+/* Whether the specified colors should be inverted */
+#define PARAMS_2_INVERT_COLOR(r, g, b)	(	\
+	((r) ? 0x10 : 0x0) |			\
+	((g) ? 0x08 : 0x0) |			\
+	((b) ? 0x04 : 0x0))
+// Also disable board leds if the LED_DISABLE bit is set.
+#define PARAMS_2_DISABLE_BOARD_LED 0x02
+// MSB (9th bit) of step duration
+#define PARAMS_2_STEP_DURATION_HIGH(s) (((s) >> 8) & 0x01)
+
+enum { RED = 0, GREEN, BLUE, NUM_COLORS };
+#define ALL_COLORS (BIT(RED) | BIT(GREEN) | BIT(BLUE))
+
+static u8 init_vals[NUM_COLORS];
+module_param_named(r, init_vals[RED], byte, 0);
+MODULE_PARM_DESC(r, "Initial red intensity (default 0)");
+module_param_named(g, init_vals[GREEN], byte, 0);
+MODULE_PARM_DESC(g, "Initial green intensity (default 0)");
+module_param_named(b, init_vals[BLUE], byte, 0);
+MODULE_PARM_DESC(b, "Initial blue intensity (default 0)");
+
+static const char *color_names[NUM_COLORS] = {
+	"red:",
+	"green:",
+	"blue:",
+};
+
+struct nct6795d_led {
+	struct device *dev;
+	u16 base_port;
+	struct led_classdev cdev[NUM_COLORS];
+};
+
+enum nct679x_chip {
+	NCT6795D = 0,
+	NCT6797D,
+};
+
+const char *chip_names[] = {
+	"NCT6795D",
+	"NCT6797D",
+};
+
+static enum nct679x_chip nct6795d_led_detect(u16 base_port)
+{
+	int ret;
+	u16 val;
+
+	ret = superio_enter(base_port);
+	if (ret)
+		return ret;
+
+	val = (superio_inb(base_port, SIO_REG_DEVID) << 8) |
+	       superio_inb(base_port, SIO_REG_DEVID + 1);
+
+	switch (val & 0xfff0) {
+	case 0xd350:
+		ret = NCT6795D;
+		break;
+	case 0xd450:
+		ret = NCT6797D;
+		break;
+	default:
+		ret = -ENXIO;
+		break;
+	}
+
+	superio_exit(base_port);
+	return ret;
+}
+
+static int nct6795d_led_setup(const struct nct6795d_led *led)
+{
+	int ret;
+	u16 val;
+
+	ret = superio_enter(led->base_port);
+	if (ret)
+		return ret;
+
+	/* Without this pulsing does not work? */
+	superio_select(led->base_port, 0x09);
+	val = superio_inb(led->base_port, 0x2c);
+	if ((val & 0x10) != 0x10)
+		superio_outb(led->base_port, 0x2c, val | 0x10);
+
+	superio_select(led->base_port, NCT6795D_RGB_BANK);
+
+	/* Check if RGB control enabled */
+	val = superio_inb(led->base_port, 0xe0);
+	if ((val & 0xe0) != 0xe0)
+		superio_outb(led->base_port, 0xe0, val | 0xe0);
+
+	/*
+	 * Set some static parameters: led enabled, no pulse, no blink,
+	 * default step duration, no fading, no inversion. These fancy features
+	 * are not supported by the LED API at the moment.
+	 */
+	superio_outb(led->base_port, NCT6795D_PARAMS_0,
+		     PARAMS_0_LED_ENABLE(true) |
+		     PARAMS_0_LED_PULSE_ENABLE(false) |
+		     PARAMS_0_BLINK_DURATION(0));
+
+	superio_outb(led->base_port, NCT6795D_PARAMS_1,
+		     PARAMS_1_STEP_DURATION_LOW(DEFAULT_STEP_DURATION));
+
+	superio_outb(led->base_port, NCT6795D_PARAMS_2,
+		     PARAMS_2_FADE_COLOR(false, false, false) |
+		     PARAMS_2_INVERT_COLOR(false, false, false) |
+		     PARAMS_2_DISABLE_BOARD_LED |
+		     PARAMS_2_STEP_DURATION_HIGH(DEFAULT_STEP_DURATION));
+
+	superio_exit(led->base_port);
+	return 0;
+}
+
+static void nct6795d_led_commit_color(const struct nct6795d_led *led,
+				      size_t color_cell,
+				      enum led_brightness brightness)
+{
+	int i;
+	/*
+	 * The 8 4-bit nibbles represent brightness intensity for each time
+	 * frame. We set them all to the same value to get a constant color.
+	 */
+	u8 b = (brightness << 4) | brightness;
+
+	for (i = 0; i < 4; i++)
+		superio_outb(led->base_port, color_cell + i, b);
+}
+
+static int nct6795d_led_commit(const struct nct6795d_led *led, u8 color_mask)
+{
+	const struct led_classdev *cdev = led->cdev;
+	int ret;
+
+	dev_dbg(led->dev, "setting values: R=%d G=%d B=%d\n",
+		cdev[RED].brightness, cdev[GREEN].brightness,
+		cdev[BLUE].brightness);
+
+	ret = superio_enter(led->base_port);
+	if (ret)
+		return ret;
+
+	superio_select(led->base_port, NCT6795D_RGB_BANK);
+
+	if (color_mask & BIT(RED))
+		nct6795d_led_commit_color(led, NCT6795D_RED_CELL,
+					  cdev[RED].brightness);
+	if (color_mask & BIT(GREEN))
+		nct6795d_led_commit_color(led, NCT6795D_GREEN_CELL,
+					  cdev[GREEN].brightness);
+	if (color_mask & BIT(BLUE))
+		nct6795d_led_commit_color(led, NCT6795D_BLUE_CELL,
+					  cdev[BLUE].brightness);
+
+	superio_exit(led->base_port);
+	return 0;
+}
+
+static void nct6795d_led_brightness_set_red(struct led_classdev *cdev,
+					    enum led_brightness value)
+{
+	const struct nct6795d_led *led =
+		container_of(cdev, struct nct6795d_led, cdev[RED]);
+	nct6795d_led_commit(led, BIT(RED));
+}
+
+static void nct6795d_led_brightness_set_green(struct led_classdev *cdev,
+					      enum led_brightness value)
+{
+	const struct nct6795d_led *led =
+		container_of(cdev, struct nct6795d_led, cdev[GREEN]);
+	nct6795d_led_commit(led, BIT(GREEN));
+}
+
+static void nct6795d_led_brightness_set_blue(struct led_classdev *cdev,
+					     enum led_brightness value)
+{
+	const struct nct6795d_led *led =
+		container_of(cdev, struct nct6795d_led, cdev[BLUE]);
+	nct6795d_led_commit(led, BIT(BLUE));
+}
+
+static void (*brightness_set[NUM_COLORS])(struct led_classdev *,
+					  enum led_brightness) = {
+	&nct6795d_led_brightness_set_red,
+	&nct6795d_led_brightness_set_green,
+	&nct6795d_led_brightness_set_blue,
+};
+
+static int nct6795d_led_probe(struct platform_device *pdev)
+{
+	struct nct6795d_led *led;
+	const struct resource *res;
+	int ret;
+	int i;
+
+	led = devm_kzalloc(&pdev->dev, sizeof(*led), GFP_KERNEL);
+	if (!led)
+		return -ENOMEM;
+
+	led->dev = &pdev->dev;
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_REG, "io_base");
+	if (IS_ERR(res))
+		return PTR_ERR(res);
+
+	led->base_port = res->start;
+
+	for (i = 0; i < NUM_COLORS; i++) {
+		struct led_classdev *cdev = &led->cdev[i];
+		struct led_init_data init_data = {};
+
+		init_data.devicename = NCT6795D_DEVICE_NAME;
+		init_data.default_label = color_names[i];
+
+		cdev->brightness = init_vals[i];
+		cdev->max_brightness = 0xf;
+		cdev->brightness_set = brightness_set[i];
+		ret = devm_led_classdev_register_ext(&pdev->dev, cdev,
+						     &init_data);
+		if (ret)
+			return ret;
+	}
+
+	dev_set_drvdata(&pdev->dev, led);
+
+	ret = nct6795d_led_setup(led);
+	if (ret)
+		return ret;
+
+	nct6795d_led_commit(led, ALL_COLORS);
+
+	return 0;
+}
+
+#ifdef CONFIG_PM_SLEEP
+static int nct6795d_led_suspend(struct device *dev)
+{
+	return 0;
+}
+
+static int nct6795d_led_resume(struct device *dev)
+{
+	struct nct6795d_led *led = dev_get_drvdata(dev);
+	int ret;
+
+	ret = nct6795d_led_setup(led);
+	if (ret)
+		return ret;
+
+	return nct6795d_led_commit(led, ALL_COLORS);
+}
+#endif
+
+static SIMPLE_DEV_PM_OPS(nct_6795d_led_pm_ops, nct6795d_led_suspend,
+			 nct6795d_led_resume);
+
+static struct platform_driver nct6795d_led_driver = {
+	.driver = {
+		.name = "nct6795d_led",
+		.pm = &nct_6795d_led_pm_ops,
+	},
+	.probe = nct6795d_led_probe,
+};
+
+static struct platform_device *nct6795d_led_pdev;
+
+static int __init nct6795d_led_init(void)
+{
+	static const u16 io_bases[] = { 0x4e, 0x2e };
+	struct resource io_res = {
+		.name = "io_base",
+		.flags = IORESOURCE_REG,
+	};
+	enum nct679x_chip detected_chip;
+	int ret;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(io_bases); i++) {
+		detected_chip = nct6795d_led_detect(io_bases[i]);
+		if (detected_chip >= 0)
+			break;
+	}
+	if (i == ARRAY_SIZE(io_bases)) {
+		pr_err("failed to detect nct6795d chip\n");
+		return -ENXIO;
+	}
+
+	pr_info("%s: found %s chip at address 0x%x\n", KBUILD_MODNAME,
+		chip_names[detected_chip], io_bases[i]);
+
+	ret = platform_driver_register(&nct6795d_led_driver);
+	if (ret)
+		return ret;
+
+	nct6795d_led_pdev = platform_device_alloc(NCT6795D_DEVICE_NAME "_led", 0);
+	if (!nct6795d_led_pdev) {
+		ret = -ENOMEM;
+		goto error_pdev_alloc;
+	}
+
+	io_res.end = io_res.start = io_bases[i];
+	ret = platform_device_add_resources(nct6795d_led_pdev, &io_res, 1);
+	if (ret)
+		goto error_pdev_resource;
+
+	ret = platform_device_add(nct6795d_led_pdev);
+	if (ret)
+		goto error_pdev_resource;
+
+	return 0;
+
+error_pdev_resource:
+	platform_device_del(nct6795d_led_pdev);
+error_pdev_alloc:
+	platform_driver_unregister(&nct6795d_led_driver);
+	return ret;
+}
+
+static void __exit nct6795d_led_exit(void)
+{
+	platform_device_unregister(nct6795d_led_pdev);
+	platform_driver_unregister(&nct6795d_led_driver);
+}
+
+module_init(nct6795d_led_init);
+module_exit(nct6795d_led_exit);
+
+MODULE_AUTHOR("Alexandre Courbot <gnurou@gmail.com>");
+MODULE_DESCRIPTION("LED driver for NCT6795D");
+MODULE_LICENSE("GPL");
-- 
2.27.0

