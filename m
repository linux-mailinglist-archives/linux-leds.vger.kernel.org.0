Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E75A1BE0E
	for <lists+linux-leds@lfdr.de>; Mon, 13 May 2019 21:33:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726709AbfEMTd3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 13 May 2019 15:33:29 -0400
Received: from hamsrv800.servertools24.de ([213.238.32.28]:57731 "EHLO
        hamsrv800.servertools24.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726290AbfEMTd2 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Mon, 13 May 2019 15:33:28 -0400
Received: from christian-pc.localdomain (p54A59A9B.dip0.t-ipconnect.de [84.165.154.155])
        by hamsrv800.servertools24.de (Postfix) with ESMTPSA id 9C12123813F6;
        Mon, 13 May 2019 21:33:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-mauderer.de;
        s=default; t=1557776005;
        bh=1r7G9sU6R2K90eYESnKaaibFLgG4j3qJgGeL8IZb0zU=; l=7938;
        h=From:To:Subject;
        b=YHZpeTonP1yxmOf42C69pBK702G4HnFPQXmwyBeC3OPUIBoEnpCSnc1WRyNc7VUrX
         KLcyz84T3llmPN36YlwQzeU7FK23Ta6TkCUS2e3KJqS1d2NIgh7nmB8QidHAJibiYI
         lrC0VGXy2Bdb5BmmQi4lGY5JPBmf/1sKAgXiue/0=
Authentication-Results: hamsrv800.servertools24.de;
        spf=pass (sender IP is 84.165.154.155) smtp.mailfrom=oss@c-mauderer.de smtp.helo=christian-pc.localdomain
Received-SPF: pass (hamsrv800.servertools24.de: connection is authenticated)
From:   oss@c-mauderer.de
To:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Christian Mauderer <oss@c-mauderer.de>
Subject: [PATCH v4 2/2] leds: spi-byte: add single byte SPI LED driver
Date:   Mon, 13 May 2019 21:33:07 +0200
Message-Id: <20190513193307.11591-2-oss@c-mauderer.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190513193307.11591-1-oss@c-mauderer.de>
References: <20190513193307.11591-1-oss@c-mauderer.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <155777600499.126863.2137977562803742399@hamsrv800.servertools24.de>
X-PPP-Vhost: c-mauderer.de
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Christian Mauderer <oss@c-mauderer.de>

This driver adds support for simple SPI based LED controller which use
only one byte for setting the brightness.

Signed-off-by: Christian Mauderer <oss@c-mauderer.de>
---

Changes compared to v3:
- remove led_classdev_unregister - not longer necessary due to
  devm_led_classdev_register
- move off_value and max_value to chipdef structure
- reduce intermediate local variables during open firmware parsing
- destroy mutex if devm_led_classdev_register went wrong
- add 'default-state'

Changes compared to v2:
- use "if (ret)" instead of "if (ret != 0)"
- don't initialize ldev-fields with zero
- use devm_led_classdev_register instead of led_classdev_register
- check for error instead of good case with the last if in spi_byte_probe

Changes compared to v1:
- rename ubnt-spi to leds-spi-byte
- rework probe to get all parameters before allocating anything -> error checks
  all collected together and initializing all fields of the device structure is
  more obvious
- fix some unsteady indentations during variable declaration
- rework comment with protocol explanation
- handle case of off_bright > max_bright
- fix spelling in commit message
- mutex_destroy in remove
- change label to use either use the given one without a prefix or a default one

 drivers/leds/Kconfig         |  10 +++
 drivers/leds/Makefile        |   1 +
 drivers/leds/leds-spi-byte.c | 161 +++++++++++++++++++++++++++++++++++
 3 files changed, 172 insertions(+)
 create mode 100644 drivers/leds/leds-spi-byte.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index a72f97fca57b..b6235e7e1482 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -766,6 +766,16 @@ config LEDS_NIC78BX
 	  To compile this driver as a module, choose M here: the module
 	  will be called leds-nic78bx.
 
+config LEDS_SPI_BYTE
+	tristate "LED support for SPI LED controller with a single byte"
+	depends on LEDS_CLASS
+	depends on SPI
+	depends on OF
+	help
+	  This option enables support for LED controller which use a single byte
+	  for controlling the brightness. Currently the following controller is
+	  supported: Ubiquiti airCube ISP microcontroller based LED controller.
+
 comment "LED Triggers"
 source "drivers/leds/trigger/Kconfig"
 
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 4c1b0054f379..1786d7e2c236 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -75,6 +75,7 @@ obj-$(CONFIG_LEDS_PM8058)		+= leds-pm8058.o
 obj-$(CONFIG_LEDS_MLXCPLD)		+= leds-mlxcpld.o
 obj-$(CONFIG_LEDS_MLXREG)		+= leds-mlxreg.o
 obj-$(CONFIG_LEDS_NIC78BX)		+= leds-nic78bx.o
+obj-$(CONFIG_LEDS_SPI_BYTE)		+= leds-spi-byte.o
 obj-$(CONFIG_LEDS_MT6323)		+= leds-mt6323.o
 obj-$(CONFIG_LEDS_LM3692X)		+= leds-lm3692x.o
 obj-$(CONFIG_LEDS_SC27XX_BLTC)		+= leds-sc27xx-bltc.o
diff --git a/drivers/leds/leds-spi-byte.c b/drivers/leds/leds-spi-byte.c
new file mode 100644
index 000000000000..b231b563b7bb
--- /dev/null
+++ b/drivers/leds/leds-spi-byte.c
@@ -0,0 +1,161 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2019 Christian Mauderer <oss@c-mauderer.de>
+
+/*
+ * The driver supports controllers with a very simple SPI protocol:
+ * - one LED is controlled by a single byte on MOSI
+ * - the value of the byte gives the brightness between two values (lowest to
+ *   highest)
+ * - no return value is necessary (no MISO signal)
+ *
+ * The value for minimum and maximum brightness depends on the device
+ * (compatible string).
+ *
+ * Supported devices:
+ * - "ubnt,acb-spi-led": Microcontroller (SONiX 8F26E611LA) based device used
+ *   for example in Ubiquiti airCube ISP. Reverse engineered protocol for this
+ *   controller:
+ *   * Higher two bits set a mode. Lower six bits are a parameter.
+ *   * Mode: 00 -> set brightness between 0x00 (min) and 0x3F (max)
+ *   * Mode: 01 -> pulsing pattern (min -> max -> min) with an interval. From
+ *     some tests, the period is about (50ms + 102ms * parameter). There is a
+ *     slightly different pattern starting from 0x10 (longer gap between the
+ *     pulses) but the time still follows that calculation.
+ *   * Mode: 10 -> same as 01 but with only a ramp from min to max. Again a
+ *     slight jump in the pattern at 0x10.
+ *   * Mode: 11 -> blinking (off -> 25% -> off -> 25% -> ...) with a period of
+ *     (105ms * parameter)
+ *   NOTE: This driver currently only supports mode 00.
+ */
+
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/spi/spi.h>
+#include <linux/mutex.h>
+#include <uapi/linux/uleds.h>
+
+struct spi_byte_chipdef {
+	/* SPI byte that will be send to switch the LED off */
+	u8	off_value;
+	/* SPI byte that will be send to switch the LED to maximum brightness */
+	u8	max_value;
+};
+
+struct spi_byte_led {
+	struct led_classdev		ldev;
+	struct spi_device		*spi;
+	char				name[LED_MAX_NAME_SIZE];
+	struct mutex			mutex;
+	const struct spi_byte_chipdef	*cdef;
+};
+
+static const struct spi_byte_chipdef ubnt_acb_spi_led_cdef = {
+	.off_value = 0x0,
+	.max_value = 0x3F,
+};
+
+static const struct of_device_id spi_byte_dt_ids[] = {
+	{ .compatible = "ubnt,acb-spi-led", .data = &ubnt_acb_spi_led_cdef },
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, spi_byte_dt_ids);
+
+static int spi_byte_brightness_set_blocking(struct led_classdev *dev,
+					    enum led_brightness brightness)
+{
+	struct spi_byte_led *led = container_of(dev, struct spi_byte_led, ldev);
+	u8 value;
+	int ret;
+
+	value = (u8) brightness + led->cdef->off_value;
+
+	mutex_lock(&led->mutex);
+	ret = spi_write(led->spi, &value, sizeof(value));
+	mutex_unlock(&led->mutex);
+
+	return ret;
+}
+
+static int spi_byte_probe(struct spi_device *spi)
+{
+	const struct of_device_id *of_dev_id;
+	struct device_node *child;
+	struct device *dev = &spi->dev;
+	struct spi_byte_led *led;
+	const char *name = "leds-spi-byte::";
+	const char *state;
+	int ret;
+
+	of_dev_id = of_match_device(spi_byte_dt_ids, dev);
+	if (!of_dev_id)
+		return -EINVAL;
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
+	of_property_read_string(child, "label", &name);
+	strlcpy(led->name, name, sizeof(led->name));
+	led->spi = spi;
+	mutex_init(&led->mutex);
+	led->cdef = of_dev_id->data;
+	led->ldev.name = led->name;
+	led->ldev.brightness = LED_OFF;
+	led->ldev.max_brightness = led->cdef->max_value - led->cdef->off_value;
+	led->ldev.brightness_set_blocking = spi_byte_brightness_set_blocking;
+
+	state = of_get_property(child, "default-state", NULL);
+	if (state) {
+		if (!strcmp(state, "on")) {
+			led->ldev.brightness = led->ldev.max_brightness;
+		} else if (strcmp(state, "off")) {
+			/* all other cases except "off" */
+			dev_err(dev, "default-state can only be 'on' or 'off'");
+			return -EINVAL;
+		}
+	}
+	spi_byte_brightness_set_blocking(&led->ldev,
+					 led->ldev.brightness);
+
+	ret = devm_led_classdev_register(&spi->dev, &led->ldev);
+	if (ret) {
+		mutex_destroy(&led->mutex);
+		return ret;
+	}
+	spi_set_drvdata(spi, led);
+
+	return 0;
+}
+
+static int spi_byte_remove(struct spi_device *spi)
+{
+	struct spi_byte_led	*led = spi_get_drvdata(spi);
+
+	mutex_destroy(&led->mutex);
+
+	return 0;
+}
+
+static struct spi_driver spi_byte_driver = {
+	.probe		= spi_byte_probe,
+	.remove		= spi_byte_remove,
+	.driver = {
+		.name		= KBUILD_MODNAME,
+		.of_match_table	= spi_byte_dt_ids,
+	},
+};
+
+module_spi_driver(spi_byte_driver);
+
+MODULE_AUTHOR("Christian Mauderer <oss@c-mauderer.de>");
+MODULE_DESCRIPTION("single byte SPI LED driver");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("spi:leds-spi-byte");
-- 
2.21.0

