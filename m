Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D9E8167B88
	for <lists+linux-leds@lfdr.de>; Fri, 21 Feb 2020 12:11:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727095AbgBULLe (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 21 Feb 2020 06:11:34 -0500
Received: from mx2.suse.de ([195.135.220.15]:46068 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726325AbgBULLe (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 21 Feb 2020 06:11:34 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 9205CAD9F;
        Fri, 21 Feb 2020 11:11:31 +0000 (UTC)
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>
Cc:     Dan Murphy <dmurphy@ti.com>, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: [PATCH v4] leds: add SGI IP30 led support
Date:   Fri, 21 Feb 2020 12:11:20 +0100
Message-Id: <20200221111120.28799-1-tbogendoerfer@suse.de>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This patch implemenets a driver to support the front panel LEDs of
SGI Octane (IP30) workstations.

Reviewed-by: Dan Murphy <dmurphy@ti.com>
Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
---
Changes in v4:
  - simplified ip30led_set by using gated value from led framework

Changes in v3:
  - rebased to 5.6-rc2

Changes in v2:
  - use led names conforming to include/dt-bindings/leds/common.h
  - read LED state from firmware
  - leave setting up to user

 drivers/leds/Kconfig     | 11 ++++++
 drivers/leds/Makefile    |  1 +
 drivers/leds/leds-ip30.c | 77 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 89 insertions(+)
 create mode 100644 drivers/leds/leds-ip30.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index d82f1dea3711..c664d84e1667 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -846,6 +846,17 @@ config LEDS_TPS6105X
 	  It is a single boost converter primarily for white LEDs and
 	  audio amplifiers.
 
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
index d7e1107753fb..46bd611a03a9 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -86,6 +86,7 @@ obj-$(CONFIG_LEDS_TI_LMU_COMMON)	+= leds-ti-lmu-common.o
 obj-$(CONFIG_LEDS_LM3697)		+= leds-lm3697.o
 obj-$(CONFIG_LEDS_LM36274)		+= leds-lm36274.o
 obj-$(CONFIG_LEDS_TPS6105X)		+= leds-tps6105x.o
+obj-$(CONFIG_LEDS_IP30)			+= leds-ip30.o
 
 # LED SPI Drivers
 obj-$(CONFIG_LEDS_CR0014114)		+= leds-cr0014114.o
diff --git a/drivers/leds/leds-ip30.c b/drivers/leds/leds-ip30.c
new file mode 100644
index 000000000000..c5853780a31a
--- /dev/null
+++ b/drivers/leds/leds-ip30.c
@@ -0,0 +1,77 @@
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
+	writel(value, led->reg);
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
+	if (num == 0)
+		data->cdev.name = "white:indicator";
+	else
+		data->cdev.name = "red:indicator";
+
+	data->cdev.brightness = readl(data->reg);
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
2.25.0

