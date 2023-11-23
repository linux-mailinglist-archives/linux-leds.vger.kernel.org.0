Return-Path: <linux-leds+bounces-110-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 566DD7F6038
	for <lists+linux-leds@lfdr.de>; Thu, 23 Nov 2023 14:28:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 799DF1C20F92
	for <lists+linux-leds@lfdr.de>; Thu, 23 Nov 2023 13:28:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D851223743;
	Thu, 23 Nov 2023 13:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="YU0iYCwl"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46766D64
	for <linux-leds@vger.kernel.org>; Thu, 23 Nov 2023 05:28:07 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5441ba3e53cso1208292a12.1
        for <linux-leds@vger.kernel.org>; Thu, 23 Nov 2023 05:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1700746086; x=1701350886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QV98IcOEB2mGkUK9HbyaOsyZut+dAy3dRloMdrb/xJo=;
        b=YU0iYCwlFYsueB9XF2q0CXCHuzTNsKnYWHlBTLuRIhRml/EdQH2BSLe5ueAu7TCUCI
         jTuZFXX3zb4nqrEAYvbe9l/jIttZZv/L4PMG5DOwybix84jieNA78gGmpMY/VkHLmaeX
         B6kU3w25WlrrTmbJ0C84BpTWs98YBjTeR0GfLT7BEqv0lUT1AK4GLWOOI6rE9qS9s6d7
         kJzZFRd94abiJVjGxZNSqottPAxP0S/f8Lu6kX6UOHecSnGslNM49AhpZqnjvoLTLdae
         JLNF2jLn05rDmlruNBT3+6mPX5DDC67k9uYewuMI56ZArq4Wdbgcn4CY2RjVuni/tEEd
         EpBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700746086; x=1701350886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QV98IcOEB2mGkUK9HbyaOsyZut+dAy3dRloMdrb/xJo=;
        b=LPEYWtnDMnHBWFB1EwnfnabRhxEFRxrGnL6TVMO3DP+QT15D05ZFCqqdimIyAQ5o4X
         5wfdMFv7oagUcdua2eSLJNC/KCtS3Mbs0T9jKfFiGKYPQvNOuW0O/nEOaGhqUqxh20L3
         Jw0dijF0Z+Hxh0eDEYcyJE3m/8n4cLKX+USyeH514gjg3v4VuF08FgzgX02T9hy4rS1R
         mqHfMFFFhfcVycr6TU0zkJyYmOcM/2j6tKKNfkG6H1bdG/OU8ZZ+YYJKdosN/qwCdmKu
         M7cfDhd4fsq8ijbY2sKg93i4e41iMxUjVftf8+MAPFk1ZkOOPB0lENccBOwksK22oerr
         eNcA==
X-Gm-Message-State: AOJu0YxwOvXHTt52hFM6w+W6GqT8lddGY8W6MwXxT7lwR+oNBgrsmKuv
	/tMDv1Y8mNkDlAQjpmnEiUDqfA==
X-Google-Smtp-Source: AGHT+IG0rIzX/GbTE1ChinuMTNv4LrhiX2EguPkdr14yTXNjoPSPSmIriaidjBWhJKJmbNa6dS4oWg==
X-Received: by 2002:a17:906:2249:b0:9fd:4bed:72af with SMTP id 9-20020a170906224900b009fd4bed72afmr4260455ejr.72.1700746085961;
        Thu, 23 Nov 2023 05:28:05 -0800 (PST)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id q22-20020a1709064c9600b009ae69c303aasm778834eju.137.2023.11.23.05.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 05:28:05 -0800 (PST)
From: Naresh Solanki <naresh.solanki@9elements.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Naresh Solanki <Naresh.Solanki@9elements.com>,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v5] leds: max5970: Add support for max5970
Date: Thu, 23 Nov 2023 13:28:02 +0000
Message-ID: <20231123132803.1107174-1-naresh.solanki@9elements.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Patrick Rudolph <patrick.rudolph@9elements.com>

The MAX5970 is hot swap controller and has 4 indication LED.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
Reviewed-by: Lee Jones <lee@kernel.org>
---
Changes in V5:
- Replace -EPROBE_DEFER with -ENODEV
Changes in V4:
- Compact declaration of variable to single line
- Use sizeof(*ddata) instead of sizeof(struct max5970_led).
- Use the shorter 'dev' version whilst it's available
Changes in V3:
- Drop array for ddata variable.
Changes in V2:
- Add of_node_put before return.
- Code cleanup
- Refactor code & remove max5970_setup_led function.
---
 drivers/leds/Kconfig        |  11 ++++
 drivers/leds/Makefile       |   1 +
 drivers/leds/leds-max5970.c | 109 ++++++++++++++++++++++++++++++++++++
 3 files changed, 121 insertions(+)
 create mode 100644 drivers/leds/leds-max5970.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 6292fddcc55c..da60940d711f 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -638,6 +638,17 @@ config LEDS_ADP5520
 	  To compile this driver as a module, choose M here: the module will
 	  be called leds-adp5520.
 
+config LEDS_MAX5970
+	tristate "LED Support for Maxim 5970"
+	depends on LEDS_CLASS
+	depends on MFD_MAX5970
+	help
+	  This option enables support for the Maxim MAX5970 & MAX5978 smart
+	  switch indication LEDs via the I2C bus.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called leds-max5970.
+
 config LEDS_MC13783
 	tristate "LED Support for MC13XXX PMIC"
 	depends on LEDS_CLASS
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index d7348e8bc019..6eaee0a753c6 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -56,6 +56,7 @@ obj-$(CONFIG_LEDS_LP8501)		+= leds-lp8501.o
 obj-$(CONFIG_LEDS_LP8788)		+= leds-lp8788.o
 obj-$(CONFIG_LEDS_LP8860)		+= leds-lp8860.o
 obj-$(CONFIG_LEDS_LT3593)		+= leds-lt3593.o
+obj-$(CONFIG_LEDS_MAX5970)		+= leds-max5970.o
 obj-$(CONFIG_LEDS_MAX77650)		+= leds-max77650.o
 obj-$(CONFIG_LEDS_MAX8997)		+= leds-max8997.o
 obj-$(CONFIG_LEDS_MC13783)		+= leds-mc13783.o
diff --git a/drivers/leds/leds-max5970.c b/drivers/leds/leds-max5970.c
new file mode 100644
index 000000000000..456a16a47450
--- /dev/null
+++ b/drivers/leds/leds-max5970.c
@@ -0,0 +1,109 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device driver for leds in MAX5970 and MAX5978 IC
+ *
+ * Copyright (c) 2022 9elements GmbH
+ *
+ * Author: Patrick Rudolph <patrick.rudolph@9elements.com>
+ */
+
+#include <linux/leds.h>
+#include <linux/mfd/max5970.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#define ldev_to_maxled(c)       container_of(c, struct max5970_led, cdev)
+
+struct max5970_led {
+	struct device *dev;
+	struct regmap *regmap;
+	struct led_classdev cdev;
+	unsigned int index;
+};
+
+static int max5970_led_set_brightness(struct led_classdev *cdev,
+				      enum led_brightness brightness)
+{
+	struct max5970_led *ddata = ldev_to_maxled(cdev);
+	int ret, val;
+
+	/* Set/clear corresponding bit for given led index */
+	val = !brightness ? BIT(ddata->index) : 0;
+
+	ret = regmap_update_bits(ddata->regmap, MAX5970_REG_LED_FLASH, BIT(ddata->index), val);
+	if (ret < 0)
+		dev_err(cdev->dev, "failed to set brightness %d", ret);
+
+	return ret;
+}
+
+static int max5970_led_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev_of_node(dev->parent);
+	struct regmap *regmap;
+	struct device_node *led_node, *child;
+	struct max5970_led *ddata;
+	int ret = -ENODEV, num_leds = 0;
+
+	regmap = dev_get_regmap(pdev->dev.parent, NULL);
+	if (!regmap)
+		return -ENODEV;
+
+	led_node = of_get_child_by_name(np, "leds");
+	if (!led_node)
+		return -ENODEV;
+
+	for_each_available_child_of_node(led_node, child) {
+		u32 reg;
+
+		if (of_property_read_u32(child, "reg", &reg))
+			continue;
+
+		if (reg >= MAX5970_NUM_LEDS) {
+			dev_err(dev, "invalid LED (%u >= %d)\n", reg, MAX5970_NUM_LEDS);
+			continue;
+		}
+
+		ddata = devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
+		if (!ddata) {
+			of_node_put(child);
+			return -ENOMEM;
+		}
+
+		ddata->index = reg;
+		ddata->regmap = regmap;
+		ddata->dev = dev;
+
+		if (of_property_read_string(child, "label", &ddata->cdev.name))
+			ddata->cdev.name = child->name;
+
+		ddata->cdev.max_brightness = 1;
+		ddata->cdev.brightness_set_blocking = max5970_led_set_brightness;
+		ddata->cdev.default_trigger = "none";
+
+		ret = devm_led_classdev_register(dev, &ddata->cdev);
+		if (ret < 0) {
+			of_node_put(child);
+			dev_err(dev, "Failed to initialize LED %u\n", reg);
+			return ret;
+		}
+		num_leds++;
+	}
+
+	return ret;
+}
+
+static struct platform_driver max5970_led_driver = {
+	.driver = {
+		.name = "max5970-led",
+	},
+	.probe = max5970_led_probe,
+};
+
+module_platform_driver(max5970_led_driver);
+MODULE_AUTHOR("Patrick Rudolph <patrick.rudolph@9elements.com>");
+MODULE_AUTHOR("Naresh Solanki <Naresh.Solanki@9elements.com>");
+MODULE_DESCRIPTION("MAX5970_hot-swap controller LED driver");
+MODULE_LICENSE("GPL");

base-commit: b9604be241587fb29c0f40450e53d0a37dc611b5
-- 
2.41.0


