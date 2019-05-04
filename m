Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F00E139D2
	for <lists+linux-leds@lfdr.de>; Sat,  4 May 2019 14:37:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726962AbfEDMhM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 4 May 2019 08:37:12 -0400
Received: from hamsrv800.servertools24.de ([213.238.32.28]:41007 "EHLO
        hamsrv800.servertools24.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726944AbfEDMhM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 4 May 2019 08:37:12 -0400
Received: from christian-pc.localdomain (p54A59A9B.dip0.t-ipconnect.de [84.165.154.155])
        by hamsrv800.servertools24.de (Postfix) with ESMTPSA id 2E0E82382B7F;
        Sat,  4 May 2019 14:29:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-mauderer.de;
        s=default; t=1556972945;
        bh=twrSIH9u09qyvY05u6CqmGkan+Vq/pIAsiWF9GruoMQ=; l=6031;
        h=From:To:Subject;
        b=Pu6Sjbtisw2v5g9xwb1gopYpZkmQGHKN4v0lgU6Q+ZiJ/s4AoyYMO8cDpe/kyzEbc
         UfXIIIU0xMXW6mbmckG05/Iajlle2AMJT9CSLXgJ5afXzgp6fYAAahaiO+urocA/gH
         AdDSvRBl9SNAJyDRuJgmYRw5wj1Mu5Q2dnY+SogM=
Authentication-Results: hamsrv800.servertools24.de;
        spf=pass (sender IP is 84.165.154.155) smtp.mailfrom=list@c-mauderer.de smtp.helo=christian-pc.localdomain
Received-SPF: pass (hamsrv800.servertools24.de: connection is authenticated)
From:   list@c-mauderer.de
To:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Christian Mauderer <oss@c-mauderer.de>
Subject: [PATCH 2/2] leds: ubnt-spi: Add Ubnt AirCube ISP LED driver
Date:   Sat,  4 May 2019 14:28:25 +0200
Message-Id: <20190504122825.11883-2-list@c-mauderer.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190504122825.11883-1-list@c-mauderer.de>
References: <20190504122825.11883-1-list@c-mauderer.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <155697294554.85427.17299473909412673158@hamsrv800.servertools24.de>
X-PPP-Vhost: c-mauderer.de
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Christian Mauderer <oss@c-mauderer.de>

This driver adds support for the custom LED controller used in Ubiquity
airCube ISP devices and most likely some other simmilar Ubiquity
products.

Signed-off-by: Christian Mauderer <oss@c-mauderer.de>
---
 drivers/leds/Kconfig         |  10 +++
 drivers/leds/Makefile        |   1 +
 drivers/leds/leds-ubnt-spi.c | 140 +++++++++++++++++++++++++++++++++++
 3 files changed, 151 insertions(+)
 create mode 100644 drivers/leds/leds-ubnt-spi.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index a72f97fca57b..e96ab93860ec 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -766,6 +766,16 @@ config LEDS_NIC78BX
 	  To compile this driver as a module, choose M here: the module
 	  will be called leds-nic78bx.
 
+config LEDS_UBNT_SPI
+	tristate "LED support for Ubnt aircube ISP custom SPI LED controller"
+	depends on LEDS_CLASS
+	depends on SPI
+	depends on OF
+	help
+	  This option enables basic support for the LED controller used in
+	  Ubiquity airCube ISP devices. The controller is microcontroller based
+	  and uses a single byte on the SPI to set brightness or blink patterns.
+
 comment "LED Triggers"
 source "drivers/leds/trigger/Kconfig"
 
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 4c1b0054f379..f272bfac109c 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -75,6 +75,7 @@ obj-$(CONFIG_LEDS_PM8058)		+= leds-pm8058.o
 obj-$(CONFIG_LEDS_MLXCPLD)		+= leds-mlxcpld.o
 obj-$(CONFIG_LEDS_MLXREG)		+= leds-mlxreg.o
 obj-$(CONFIG_LEDS_NIC78BX)		+= leds-nic78bx.o
+obj-$(CONFIG_LEDS_UBNT_SPI)		+= leds-ubnt-spi.o
 obj-$(CONFIG_LEDS_MT6323)		+= leds-mt6323.o
 obj-$(CONFIG_LEDS_LM3692X)		+= leds-lm3692x.o
 obj-$(CONFIG_LEDS_SC27XX_BLTC)		+= leds-sc27xx-bltc.o
diff --git a/drivers/leds/leds-ubnt-spi.c b/drivers/leds/leds-ubnt-spi.c
new file mode 100644
index 000000000000..a3cb0dd5b0da
--- /dev/null
+++ b/drivers/leds/leds-ubnt-spi.c
@@ -0,0 +1,140 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2019 Christian Mauderer <oss@c-mauderer.de>
+
+/*
+ *  Custom controller based LED controller used in Ubiquity airCube ISP.
+ *
+ *  Reverse engineered protocol:
+ *  - The device uses only a single byte sent via SPI.
+ *  - The SPI input doesn't contain any relevant information.
+ *  - Higher two bits set a mode. Lower six bits are a parameter.
+ *  - Mode: 00 -> set brightness between 0x00 (min) and 0x3F (max)
+ *  - Mode: 01 -> pulsing pattern (min -> max -> min) with an interval. From
+ *    some tests, the period is about (50ms + 102ms * parameter). There is a
+ *    slightly different pattern starting from 0x100 (longer gap between the
+ *    pulses) but the time still follows that calculation.
+ *  - Mode: 10 -> same as 01 but with only a ramp from min to max. Again a
+ *    slight jump in the pattern at 0x100.
+ *  - Mode: 11 -> blinking (off -> 25% -> off -> 25% -> ...) with a period of
+ *    (105ms * parameter)
+ *
+ *  NOTE: This driver currently only implements mode 00 (brightness).
+ */
+
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/spi/spi.h>
+#include <linux/mutex.h>
+#include <uapi/linux/uleds.h>
+
+#define UBNT_SPI_OFF_BRIGHTNESS	0x0
+#define UBNT_SPI_MAX_BRIGHTNESS	0x3F
+
+struct ubnt_spi_led {
+	struct led_classdev	ldev;
+	struct spi_device	*spi;
+	char			name[LED_MAX_NAME_SIZE];
+	struct mutex		mutex;
+	u8			off_bright;
+	u8			max_bright;
+};
+
+static int ubnt_spi_brightness_set_blocking(struct led_classdev *dev,
+					    enum led_brightness brightness)
+{
+	struct ubnt_spi_led *led = container_of(dev, struct ubnt_spi_led, ldev);
+	u8 value;
+	int ret;
+
+	value = (u8) brightness + led->off_bright;
+
+	mutex_lock(&led->mutex);
+	ret = spi_write(led->spi, &value, sizeof(value));
+	mutex_unlock(&led->mutex);
+
+	return ret;
+}
+
+static int ubnt_spi_probe(struct spi_device *spi)
+{
+	struct device *dev = &spi->dev;
+	struct device_node *child;
+	struct ubnt_spi_led	*led;
+	int ret;
+	const char *tmp;
+	const char *default_name = ":";
+
+	if (!dev->of_node)
+		return -ENODEV;
+
+	if (of_get_child_count(dev->of_node) != 1) {
+		dev_err(dev, "Device must have exactly one LED sub-node.");
+		return -EINVAL;
+	}
+	child = of_get_next_child(dev->of_node, NULL);
+
+	led = devm_kzalloc(dev, sizeof(*led), GFP_KERNEL);
+	if (!led)
+		return -ENOMEM;
+
+	led->spi	= spi;
+
+	ret = of_property_read_string(child, "label", &tmp);
+	if (ret < 0)
+		tmp = default_name;
+	snprintf(led->name, sizeof(led->name), "ubnt-spi-led:%s", tmp);
+
+	ret = of_property_read_u8(child, "ubnt-spi,off_bright",
+				  &led->off_bright);
+	if (ret != 0)
+		led->off_bright = UBNT_SPI_OFF_BRIGHTNESS;
+
+	ret = of_property_read_u8(child, "ubnt-spi,max_bright",
+				  &led->max_bright);
+	if (ret != 0)
+		led->max_bright = UBNT_SPI_MAX_BRIGHTNESS;
+
+	mutex_init(&led->mutex);
+	led->ldev.name = led->name;
+	led->ldev.brightness = LED_OFF;
+	led->ldev.max_brightness = led->max_bright - led->off_bright;
+	led->ldev.brightness_set_blocking = ubnt_spi_brightness_set_blocking;
+	ret = led_classdev_register(&spi->dev, &led->ldev);
+	if (ret >= 0)
+		spi_set_drvdata(spi, led);
+
+	return ret;
+}
+
+static int ubnt_spi_remove(struct spi_device *spi)
+{
+	struct ubnt_spi_led	*led = spi_get_drvdata(spi);
+
+	led_classdev_unregister(&led->ldev);
+
+	return 0;
+}
+
+static const struct of_device_id ubnt_spi_dt_ids[] = {
+	{ .compatible = "ubnt,spi-led", },
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, ubnt_spi_dt_ids);
+
+static struct spi_driver ubnt_spi_driver = {
+	.probe		= ubnt_spi_probe,
+	.remove		= ubnt_spi_remove,
+	.driver = {
+		.name		= KBUILD_MODNAME,
+		.of_match_table	= ubnt_spi_dt_ids,
+	},
+};
+
+module_spi_driver(ubnt_spi_driver);
+
+MODULE_AUTHOR("Christian Mauderer <oss@c-mauderer.de>");
+MODULE_DESCRIPTION("Ubnt AirCube ISP LED driver");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("spi:ubnt-spi-led");
-- 
2.21.0

