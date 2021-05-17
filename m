Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5CCC3837E5
	for <lists+linux-leds@lfdr.de>; Mon, 17 May 2021 17:46:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244931AbhEQPrV (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 17 May 2021 11:47:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344252AbhEQPnv (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 17 May 2021 11:43:51 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 449F9C043146;
        Mon, 17 May 2021 07:36:15 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id x188so5078750pfd.7;
        Mon, 17 May 2021 07:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=VhyK59CMD+e1FlyVP/nz0DNHuduzhFeXUXxioP1NDGA=;
        b=LEtm0i1UJmElWlbaGeyGj/T7zh0Aml76Cw6NS6nKogLlMxcRq9Cq6GETRajWTsxTP+
         VVv301JduFCdnj4JtrbZ0VerknaEf3zDBF2wM4TApiUuJhkUZGwsNdhG/h58j61Vy2Ze
         aiIq1XpUJBtyGMmieGrHBdzwLfAERvKsfVs2ozdet7nwJ2A7T+aZaxd4JfFDf2sokRyG
         BY5gd+dS/I8GbBr/3m5jUS1N4lcVKr483BtRKqSwVOZ9DGzqgcgH3agkFharct29K/io
         asDKHA088YiaAt6gajqgbt2jOZlyiMBI0GN7vIDVqVYnFTjzaIRrYqUZKwRlgQValgWS
         deCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=VhyK59CMD+e1FlyVP/nz0DNHuduzhFeXUXxioP1NDGA=;
        b=ST1XKeGu6MBCwG4zZqDgTuMArl9fTWNZvfoqEMerOd8MN2CZVrwl3zmVtQuzHstxDf
         Xc+6zsBjiOzfL5jMUCZQjqVZjqVBqjQ/JpN3au3onbEbkLXhuzwFEQJyiLUT2zXgl/dH
         BAj6ecxg71Lb2CYyyVxnNduwhSRVxgj25mCT4Y+iuNko5Dxi7IfI3SfBkBKqg14v6u4i
         DIsk6hCe4YITBYBfQ6qsM7fkNi4Mp8FHIApqtpScq3YSqcyceHMfa/6wH3ERPQRpLkU0
         vTt185GfRyjBVT13wxMYpv75lQrcYZ58s/izkyEsNrg5arbEysAhCvIUUrP95TsEnl45
         DeRQ==
X-Gm-Message-State: AOAM5301pr4eO45tf5/LXUkfHeP8Bi7z4Qs2xm15U2CrlCe9LRNoL7SK
        JwczO+SQTX701NxoFjVThC4=
X-Google-Smtp-Source: ABdhPJy57qCjD4MslISDYuYUUV/yX+09S4Su2cOeQW0N+6g1KyEts3dYkBgTA14+9XlP4Oy6nKCTfQ==
X-Received: by 2002:a65:468d:: with SMTP id h13mr60199280pgr.373.1621262174608;
        Mon, 17 May 2021 07:36:14 -0700 (PDT)
Received: from localhost.localdomain (1-171-3-209.dynamic-ip.hinet.net. [1.171.3.209])
        by smtp.gmail.com with ESMTPSA id f5sm13880259pjp.37.2021.05.17.07.36.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 May 2021 07:36:13 -0700 (PDT)
From:   cy_huang <u0084500@gmail.com>
To:     lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
        daniel.thompson@linaro.org, jingoohan1@gmail.com,
        b.zolnierkie@samsung.com, pavel@ucw.cz, robh+dt@kernel.org
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, cy_huang@richtek.com
Subject: [PATCH v7 1/4] mfd: rt4831: Adds support for Richtek RT4831
Date:   Mon, 17 May 2021 22:35:58 +0800
Message-Id: <1621262161-9972-1-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: ChiYuan Huang <cy_huang@richtek.com>

This adds support Richtek RT4831 core. It includes four channel WLED driver
and Display Bias Voltage outputs.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
- Send the patch series for the wrong mail subject.

The RT4831 regulator patches are already on main stream, and can be referred to
9351ab8b0cb6 regulator: rt4831: Adds support for Richtek RT4831 DSV regulator
934b05e81862 regulator: rt4831: Adds DT binding document for Richtek RT4831 DSV regulator

since v6
- Respin the date from 2020 to 2021.
- Rmove the shutdown routine.
- Change the macro OF_MFD_CELL to MFD_CELL_OF.

since v5
- Rename file name from rt4831-core.c to rt4831.c
- Change RICHTEK_VID to RICHTEK_VENDOR_ID.
- Change gpio_desc nameing from 'enable' to 'enable_gpio' in probe.
- Change variable 'val' to the meaningful name 'chip_id'.
- Refine the error log when vendor id is not matched.
- Remove of_match_ptr.

since v2
- Refine Kconfig descriptions.
- Add copyright.
- Refine error logs in probe.
- Refine comment lines in remove and shutdown.
---
 drivers/mfd/Kconfig  |  10 +++++
 drivers/mfd/Makefile |   1 +
 drivers/mfd/rt4831.c | 115 +++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 126 insertions(+)
 create mode 100644 drivers/mfd/rt4831.c

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 5c7f2b1..49e57c9 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1076,6 +1076,16 @@ config MFD_RDC321X
 	  southbridge which provides access to GPIOs and Watchdog using the
 	  southbridge PCI device configuration space.
 
+config MFD_RT4831
+	tristate "Richtek RT4831 four channel WLED and Display Bias Voltage"
+	depends on I2C
+	select MFD_CORE
+	select REGMAP_I2C
+	help
+	  This enables support for the Richtek RT4831 that includes 4 channel
+	  WLED driving and Display Bias Voltage. It's commonly used to provide
+	  power to the LCD display and LCD backlight.
+
 config MFD_RT5033
 	tristate "Richtek RT5033 Power Management IC"
 	depends on I2C
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 4f6d2b8..eb42bd4 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -234,6 +234,7 @@ obj-$(CONFIG_MFD_MENF21BMC)	+= menf21bmc.o
 obj-$(CONFIG_MFD_HI6421_PMIC)	+= hi6421-pmic-core.o
 obj-$(CONFIG_MFD_HI655X_PMIC)   += hi655x-pmic.o
 obj-$(CONFIG_MFD_DLN2)		+= dln2.o
+obj-$(CONFIG_MFD_RT4831)	+= rt4831.o
 obj-$(CONFIG_MFD_RT5033)	+= rt5033.o
 obj-$(CONFIG_MFD_SKY81452)	+= sky81452.o
 
diff --git a/drivers/mfd/rt4831.c b/drivers/mfd/rt4831.c
new file mode 100644
index 00000000..b169781
--- /dev/null
+++ b/drivers/mfd/rt4831.c
@@ -0,0 +1,115 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (c) 2021 Richtek Technology Corp.
+ *
+ * Author: ChiYuan Huang <cy_huang@richtek.com>
+ */
+
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/kernel.h>
+#include <linux/mfd/core.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+
+#define RT4831_REG_REVISION	0x01
+#define RT4831_REG_ENABLE	0x08
+#define RT4831_REG_I2CPROT	0x15
+
+#define RICHTEK_VENDOR_ID	0x03
+#define RT4831_VID_MASK		GENMASK(1, 0)
+#define RT4831_RESET_MASK	BIT(7)
+#define RT4831_I2CSAFETMR_MASK	BIT(0)
+
+static const struct mfd_cell rt4831_subdevs[] = {
+	MFD_CELL_OF("rt4831-backlight", NULL, NULL, 0, 0, "richtek,rt4831-backlight"),
+	MFD_CELL_NAME("rt4831-regulator")
+};
+
+static bool rt4831_is_accessible_reg(struct device *dev, unsigned int reg)
+{
+	if (reg >= RT4831_REG_REVISION && reg <= RT4831_REG_I2CPROT)
+		return true;
+	return false;
+}
+
+static const struct regmap_config rt4831_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = RT4831_REG_I2CPROT,
+
+	.readable_reg = rt4831_is_accessible_reg,
+	.writeable_reg = rt4831_is_accessible_reg,
+};
+
+static int rt4831_probe(struct i2c_client *client)
+{
+	struct gpio_desc *enable_gpio;
+	struct regmap *regmap;
+	unsigned int chip_id;
+	int ret;
+
+	enable_gpio = devm_gpiod_get_optional(&client->dev, "enable", GPIOD_OUT_HIGH);
+	if (IS_ERR(enable_gpio)) {
+		dev_err(&client->dev, "Failed to get 'enable' GPIO\n");
+		return PTR_ERR(enable_gpio);
+	}
+
+	regmap = devm_regmap_init_i2c(client, &rt4831_regmap_config);
+	if (IS_ERR(regmap)) {
+		dev_err(&client->dev, "Failed to initialize regmap\n");
+		return PTR_ERR(regmap);
+	}
+
+	ret = regmap_read(regmap, RT4831_REG_REVISION, &chip_id);
+	if (ret) {
+		dev_err(&client->dev, "Failed to get H/W revision\n");
+		return ret;
+	}
+
+	if ((chip_id & RT4831_VID_MASK) != RICHTEK_VENDOR_ID) {
+		dev_err(&client->dev, "Chip vendor ID 0x%02x not matched\n", chip_id);
+		return -ENODEV;
+	}
+
+	/*
+	 * Used to prevent the abnormal shutdown.
+	 * If SCL/SDA both keep low for one second to reset HW.
+	 */
+	ret = regmap_update_bits(regmap, RT4831_REG_I2CPROT, RT4831_I2CSAFETMR_MASK,
+				 RT4831_I2CSAFETMR_MASK);
+	if (ret) {
+		dev_err(&client->dev, "Failed to enable I2C safety timer\n");
+		return ret;
+	}
+
+	return devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_AUTO, rt4831_subdevs,
+				    ARRAY_SIZE(rt4831_subdevs), NULL, 0, NULL);
+}
+
+static int rt4831_remove(struct i2c_client *client)
+{
+	struct regmap *regmap = dev_get_regmap(&client->dev, NULL);
+
+	/* Disable WLED and DSV outputs */
+	return regmap_update_bits(regmap, RT4831_REG_ENABLE, RT4831_RESET_MASK, RT4831_RESET_MASK);
+}
+
+static const struct of_device_id __maybe_unused rt4831_of_match[] = {
+	{ .compatible = "richtek,rt4831", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, rt4831_of_match);
+
+static struct i2c_driver rt4831_driver = {
+	.driver = {
+		.name = "rt4831",
+		.of_match_table = rt4831_of_match,
+	},
+	.probe_new = rt4831_probe,
+	.remove = rt4831_remove,
+};
+module_i2c_driver(rt4831_driver);
+
+MODULE_AUTHOR("ChiYuan Huang <cy_huang@richtek.com>");
+MODULE_LICENSE("GPL v2");
-- 
2.7.4

