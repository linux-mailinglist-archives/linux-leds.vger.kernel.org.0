Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0F2513C23B
	for <lists+linux-leds@lfdr.de>; Wed, 15 Jan 2020 14:05:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726100AbgAONFt (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 15 Jan 2020 08:05:49 -0500
Received: from mx2.suse.de ([195.135.220.15]:35516 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726071AbgAONFt (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 15 Jan 2020 08:05:49 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 82A9FAD66;
        Wed, 15 Jan 2020 13:05:46 +0000 (UTC)
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: [PATCH] leds: add SGI IP30 led support
Date:   Wed, 15 Jan 2020 14:05:35 +0100
Message-Id: <20200115130536.11453-1-tbogendoerfer@suse.de>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This patch implemenets a driver to support the front panel LEDs of
SGI Octane (IP30) workstations.

Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
---
 drivers/leds/Kconfig     | 11 ++++++
 drivers/leds/Makefile    |  1 +
 drivers/leds/leds-ip30.c | 82 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 94 insertions(+)
 create mode 100644 drivers/leds/leds-ip30.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 4b68520ac251..8ef0fe900928 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -836,6 +836,17 @@ config LEDS_LM36274
 	  Say Y to enable the LM36274 LED driver for TI LMU devices.
 	  This supports the LED device LM36274.
 
+config LEDS_IP30
+	tristate "LED support for SGI Octane machines"
+	depends on LEDS_CLASS
+	depends on SGI_MFD_IOC3
+	help
+	  This option enables support for the Red and White LEDs of
+	  SGI Octane machines.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called leds-ip30.
+
 comment "LED Triggers"
 source "drivers/leds/trigger/Kconfig"
 
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 2da39e896ce8..89a527ac8ab6 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -85,6 +85,7 @@ obj-$(CONFIG_LEDS_LM3601X)		+= leds-lm3601x.o
 obj-$(CONFIG_LEDS_TI_LMU_COMMON)	+= leds-ti-lmu-common.o
 obj-$(CONFIG_LEDS_LM3697)		+= leds-lm3697.o
 obj-$(CONFIG_LEDS_LM36274)		+= leds-lm36274.o
+obj-$(CONFIG_LEDS_IP30)			+= leds-ip30.o
 
 # LED SPI Drivers
 obj-$(CONFIG_LEDS_CR0014114)		+= leds-cr0014114.o
diff --git a/drivers/leds/leds-ip30.c b/drivers/leds/leds-ip30.c
new file mode 100644
index 000000000000..b0a83f78c439
--- /dev/null
+++ b/drivers/leds/leds-ip30.c
@@ -0,0 +1,82 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * LED Driver for SGI Octane machines
+ */
+
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/platform_device.h>
+#include <linux/leds.h>
+
+struct ip30_led {
+	struct led_classdev cdev;
+	u32 __iomem *reg;
+};
+
+static void ip30led_set(struct led_classdev *led_cdev,
+			enum led_brightness value)
+{
+	struct ip30_led *led = container_of(led_cdev, struct ip30_led, cdev);
+
+	if (value)
+		writel(1, led->reg);
+	else
+		writel(0, led->reg);
+}
+
+static int ip30led_create(struct platform_device *pdev, int num)
+{
+	struct resource *res;
+	struct ip30_led *data;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, num);
+	if (!res)
+		return -EBUSY;
+
+	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->reg = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(data->reg))
+		return PTR_ERR(data->reg);
+
+
+	if (num == 0) {
+		data->cdev.name = "ip30:white";
+		data->cdev.default_trigger = "default-on";
+	} else {
+		data->cdev.name = "ip30:red";
+		data->cdev.default_trigger = "panic";
+		writel(0, data->reg);
+	}
+	data->cdev.max_brightness = 1;
+	data->cdev.brightness_set = ip30led_set;
+
+	return devm_led_classdev_register(&pdev->dev, &data->cdev);
+}
+
+static int ip30led_probe(struct platform_device *pdev)
+{
+	int ret;
+
+	ret = ip30led_create(pdev, 0);
+	if (ret < 0)
+		return ret;
+
+	return ip30led_create(pdev, 1);
+}
+
+static struct platform_driver ip30led_driver = {
+	.probe		= ip30led_probe,
+	.driver		= {
+		.name		= "ip30-leds",
+	},
+};
+
+module_platform_driver(ip30led_driver);
+
+MODULE_AUTHOR("Thomas Bogendoerfer <tbogendoerfer@suse.de>");
+MODULE_DESCRIPTION("SGI Octane LED driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:ip30-leds");
-- 
2.24.1

