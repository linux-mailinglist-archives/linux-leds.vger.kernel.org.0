Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BBB316BFB
	for <lists+linux-leds@lfdr.de>; Tue,  7 May 2019 22:13:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726679AbfEGUMQ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 7 May 2019 16:12:16 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:59486 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726225AbfEGUMJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 7 May 2019 16:12:09 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x47KBtQw088558;
        Tue, 7 May 2019 15:11:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1557259915;
        bh=m4RFJ9RmVWrEHlU3lwMVq4m46Orb+tuVXVAz3ATT0Po=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=iqF3ankW/J8HIuIuA/CWAjZmBUTOwdfkCK3y37QCzPumsmjxtBE4xTCwuAV6SqzdG
         Ft5VtePGrm3DoN6HuOQlsXuY5Vb9k2snWH9KGemWH5Q3UrlSQIXJLynn4UCBrgcAZT
         BQWri0G3CGogJFqN7Js3pVKfy0Aib9Npj7mDNDGw=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x47KBtHD108681
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 7 May 2019 15:11:55 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 7 May
 2019 15:11:54 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 7 May 2019 15:11:54 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x47KBsZG013913;
        Tue, 7 May 2019 15:11:54 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <lee.jones@linaro.org>, <rdunlap@infradead.org>,
        <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v4 6/6] leds: lm36274: Introduce the TI LM36274 LED driver
Date:   Tue, 7 May 2019 15:11:59 -0500
Message-ID: <20190507201159.13940-7-dmurphy@ti.com>
X-Mailer: git-send-email 2.21.0.5.gaeb582a983
In-Reply-To: <20190507201159.13940-1-dmurphy@ti.com>
References: <20190507201159.13940-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Introduce the LM36274 LED driver.  This driver uses the ti-lmu
MFD driver to probe this LED driver.  The driver configures only the
LED registers and enables the outputs according to the config file.

The driver utilizes the TI LMU (Lighting Management Unit) LED common
framework to set the brightness bits.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 drivers/leds/Kconfig        |   7 ++
 drivers/leds/Makefile       |   1 +
 drivers/leds/leds-lm36274.c | 174 ++++++++++++++++++++++++++++++++++++
 3 files changed, 182 insertions(+)
 create mode 100644 drivers/leds/leds-lm36274.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 255fdd5e8491..db83a3feca01 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -791,6 +791,13 @@ config LEDS_LM3697
 	  Say Y to enable the LM3697 LED driver for TI LMU devices.
 	  This supports the LED device LM3697.
 
+config LEDS_LM36274
+	tristate "LED driver for LM36274"
+	depends on LEDS_TI_LMU_COMMON
+	help
+	  Say Y to enable the LM36274 LED driver for TI LMU devices.
+	  This supports the LED device LM36274.
+
 comment "LED Triggers"
 source "drivers/leds/trigger/Kconfig"
 
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 8ab825c8b5c3..c229432b7fe7 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -82,6 +82,7 @@ obj-$(CONFIG_LEDS_SC27XX_BLTC)		+= leds-sc27xx-bltc.o
 obj-$(CONFIG_LEDS_LM3601X)		+= leds-lm3601x.o
 obj-$(CONFIG_LEDS_TI_LMU_COMMON)	+= leds-ti-lmu-common.o
 obj-$(CONFIG_LEDS_LM3697)		+= leds-lm3697.o
+obj-$(CONFIG_LEDS_LM36274)		+= leds-lm36274.o
 
 # LED SPI Drivers
 obj-$(CONFIG_LEDS_CR0014114)		+= leds-cr0014114.o
diff --git a/drivers/leds/leds-lm36274.c b/drivers/leds/leds-lm36274.c
new file mode 100644
index 000000000000..b47786d36d21
--- /dev/null
+++ b/drivers/leds/leds-lm36274.c
@@ -0,0 +1,174 @@
+// SPDX-License-Identifier: GPL-2.0
+// TI LM36274 LED chip family driver
+// Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
+
+#include <linux/bitops.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/leds.h>
+#include <linux/leds-ti-lmu-common.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+
+#include <linux/mfd/ti-lmu.h>
+#include <linux/mfd/ti-lmu-register.h>
+
+#include <uapi/linux/uleds.h>
+
+#define LM36274_MAX_STRINGS	4
+#define LM36274_BL_EN		BIT(4)
+
+/**
+ * struct lm36274
+ * @pdev: platform device
+ * @led_dev: led class device
+ * @lmu_data: Register and setting values for common code
+ * @regmap: Devices register map
+ * @dev: Pointer to the devices device struct
+ * @led_sources - The LED strings supported in this array
+ * @num_leds - Number of LED strings are supported in this array
+ */
+struct lm36274 {
+	struct platform_device *pdev;
+	struct led_classdev led_dev;
+	struct ti_lmu_bank lmu_data;
+	struct regmap *regmap;
+	struct device *dev;
+
+	u32 led_sources[LM36274_MAX_STRINGS];
+	int num_leds;
+};
+
+static int lm36274_brightness_set(struct led_classdev *led_cdev,
+				enum led_brightness brt_val)
+{
+	struct lm36274 *led = container_of(led_cdev, struct lm36274, led_dev);
+
+	return ti_lmu_common_set_brightness(&led->lmu_data, brt_val);
+}
+
+static int lm36274_init(struct lm36274 *lm36274_data)
+{
+	int enable_val = 0;
+	int i;
+
+	for (i = 0; i < lm36274_data->num_leds; i++)
+		enable_val |= (1 << lm36274_data->led_sources[i]);
+
+	if (!enable_val) {
+		dev_err(lm36274_data->dev, "No LEDs were enabled\n");
+		return -EINVAL;
+	}
+
+	enable_val |= LM36274_BL_EN;
+
+	return regmap_write(lm36274_data->regmap, LM36274_REG_BL_EN,
+			    enable_val);
+}
+
+static int lm36274_parse_dt(struct lm36274 *lm36274_data)
+{
+	struct fwnode_handle *child = NULL;
+	char label[LED_MAX_NAME_SIZE];
+	struct device *dev = &lm36274_data->pdev->dev;
+	const char *name;
+	int child_cnt;
+	int ret = -EINVAL;
+
+	/* There should only be 1 node */
+	child_cnt = device_get_child_node_count(dev);
+	if (child_cnt != 1)
+		return ret;
+
+	device_for_each_child_node(dev, child) {
+		ret = fwnode_property_read_string(child, "label", &name);
+		if (ret)
+			snprintf(label, sizeof(label),
+				"%s::", lm36274_data->pdev->name);
+		else
+			snprintf(label, sizeof(label),
+				 "%s:%s", lm36274_data->pdev->name, name);
+
+		lm36274_data->num_leds = fwnode_property_read_u32_array(child,
+							  "led-sources",
+							  NULL, 0);
+		if (lm36274_data->num_leds <= 0)
+			return -ENODEV;
+
+		ret = fwnode_property_read_u32_array(child, "led-sources",
+						     lm36274_data->led_sources,
+						     lm36274_data->num_leds);
+		if (ret) {
+			dev_err(dev, "led-sources property missing\n");
+			return -EINVAL;
+		}
+
+		fwnode_property_read_string(child, "linux,default-trigger",
+					&lm36274_data->led_dev.default_trigger);
+
+	}
+
+	lm36274_data->lmu_data.regmap = lm36274_data->regmap;
+	lm36274_data->lmu_data.max_brightness = MAX_BRIGHTNESS_11BIT;
+	lm36274_data->lmu_data.msb_brightness_reg = LM36274_REG_BRT_MSB;
+	lm36274_data->lmu_data.lsb_brightness_reg = LM36274_REG_BRT_LSB;
+
+	lm36274_data->led_dev.name = label;
+	lm36274_data->led_dev.max_brightness = MAX_BRIGHTNESS_11BIT;
+	lm36274_data->led_dev.brightness_set_blocking = lm36274_brightness_set;
+
+	return ret;
+}
+
+static int lm36274_probe(struct platform_device *pdev)
+{
+	struct ti_lmu *lmu = dev_get_drvdata(pdev->dev.parent);
+	struct lm36274 *lm36274_data;
+	int ret;
+
+	lm36274_data = devm_kzalloc(&pdev->dev, sizeof(*lm36274_data),
+				    GFP_KERNEL);
+	if (!lm36274_data) {
+		ret = -ENOMEM;
+		return ret;
+	}
+
+	lm36274_data->pdev = pdev;
+	lm36274_data->dev = lmu->dev;
+	lm36274_data->regmap = lmu->regmap;
+	dev_set_drvdata(&pdev->dev, lm36274_data);
+
+	ret = lm36274_parse_dt(lm36274_data);
+	if (ret) {
+		dev_err(lm36274_data->dev, "Failed to parse DT node\n");
+		return ret;
+	}
+
+	ret = lm36274_init(lm36274_data);
+	if (ret) {
+		dev_err(lm36274_data->dev, "Failed to init the device\n");
+		return ret;
+	}
+
+	return devm_led_classdev_register(lm36274_data->dev,
+					 &lm36274_data->led_dev);
+}
+
+static const struct of_device_id of_lm36274_leds_match[] = {
+	{ .compatible = "ti,lm36274-backlight", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, of_lm36274_leds_match);
+
+static struct platform_driver lm36274_driver = {
+	.probe  = lm36274_probe,
+	.driver = {
+		.name = "lm36274-leds",
+	},
+};
+module_platform_driver(lm36274_driver)
+
+MODULE_DESCRIPTION("Texas Instruments LM36274 LED driver");
+MODULE_AUTHOR("Dan Murphy <dmurphy@ti.com>");
+MODULE_LICENSE("GPL v2");
-- 
2.21.0.5.gaeb582a983

