Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6C3A6E4430
	for <lists+linux-leds@lfdr.de>; Mon, 17 Apr 2023 11:43:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229992AbjDQJm3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 17 Apr 2023 05:42:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230426AbjDQJmP (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 17 Apr 2023 05:42:15 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 052255242
        for <linux-leds@vger.kernel.org>; Mon, 17 Apr 2023 02:41:15 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-2f58125b957so1325405f8f.3
        for <linux-leds@vger.kernel.org>; Mon, 17 Apr 2023 02:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1681724440; x=1684316440;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tll4GHwBgwWI+CvDMCVg7zGiU4JG66Dh6Fj+kV8ccKQ=;
        b=Xp2DcHrB8X6Irn+LtLMvce62pvJ+3px8Dc2zuempDPTU6S89mlcOuk8ezAGTnAVCVB
         prpEoKR9GUI4vkzbcCjqIPAGl6hkMcWlqavnaQlnVoSrMVcQNLM2jfLBEDRjpugzjzKp
         xpQCTgxPsOwkEJgwKmJVDTZ8ukVZUL8YlG3CWsxPEIv3uuGFu8Onoi0AfPCvt0HvELEc
         NHgVDn5AJV9SCCKn2EX8LTNPxQBnf8ArkUSF7K+rcCuBqeyupNp3tIYoFsKS5KRvhSS0
         bx+8XEDC9RW6yXiSUMDg+shGyKQqftHhwYC8cEh5U0yxIAPbKH6Kx8M4tct31AvAXG9G
         V0WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681724440; x=1684316440;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tll4GHwBgwWI+CvDMCVg7zGiU4JG66Dh6Fj+kV8ccKQ=;
        b=U6tff+Xm9vfkPLZrNZ1DRppmyrjApP6nMjauIo925coaZjVJIUoziG7eBPYE0D4yse
         cVUhX/3+uAv3t7BbofJ7qW8nqxxhw6Nx+lt2NKGVnR33zQ5GgLsDAskt8b6bNhrgrTfH
         vwRs8/4nXlCcQm3TkyM6Vo0Lwl9/6jz2TSSHl/3u+hMV00Mh4JQhk+QHVVkC1x/sLIaD
         2n6ltQamL75g8t2wpLXnCuLkMIETm74ZuA/8EpdOeizLSCb42YsWLWQkT38ZlLarX3Qx
         xTKsEwt0yzcEluTQKxr+tz0HeBK7gPojEWzs52VBx0oku0WWfsMLU4essHk06IvGacOb
         KpsQ==
X-Gm-Message-State: AAQBX9eFhsuERm08mrJfh90Qdex05wlOq9gagA+A0I7y7BV+6XqNlzRu
        PZyBlEQlzvjm2mu6jrWrJbwKTA==
X-Google-Smtp-Source: AKy350YPz9EL3q0Hg6kH4rQ6/qqpG5z0AHcFtnCt/zxlEEeUHdw4638dzY6rO62KRlkHOMHCRUm/Yg==
X-Received: by 2002:a5d:4a05:0:b0:2f4:30ee:310b with SMTP id m5-20020a5d4a05000000b002f430ee310bmr5360032wrq.26.1681724440447;
        Mon, 17 Apr 2023 02:40:40 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id e16-20020a5d4e90000000b002f2782978d8sm10013226wru.20.2023.04.17.02.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 02:40:40 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: [PATCH v5] leds: max597x: Add support for max597x
Date:   Mon, 17 Apr 2023 11:40:34 +0200
Message-Id: <20230417094035.998965-1-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Patrick Rudolph <patrick.rudolph@9elements.com>

max597x is hot swap controller with indicator LED support.
This driver uses DT property to configure led during boot time &
also provide the LED control in sysfs.

DTS example:
    i2c {
        #address-cells = <1>;
        #size-cells = <0>;
        regulator@3a {
            compatible = "maxim,max5978";
            reg = <0x3a>;
            vss1-supply = <&p3v3>;

            regulators {
                sw0_ref_0: sw0 {
                    shunt-resistor-micro-ohms = <12000>;
                };
            };

            leds {
                #address-cells = <1>;
                #size-cells = <0>;
                led@0 {
                    reg = <0>;
                    label = "ssd0:green";
                    default-state = "on";
                };
                led@1 {
                    reg = <1>;
                    label = "ssd1:green";
                    default-state = "on";
                };
            };
        };
    };

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
...
Changes in V5:
- Update commit message
- Fix comments
- Add necessary new line
Changes in V4:
- Remove unwanted preinitialise
- Remove unneeded line breaks
- Fix variable name to avoid confusion
- Update module description to mention LED driver.
Changes in V3:
- Remove of_node_put as its handled by for loop
- Print error if an LED fails to register.
- Update driver name in Kconfig description
- Remove unneeded variable assignment
- Use devm_led_classdev_register to reget led
Changes in V2:
- Fix regmap update
- Remove devm_kfree
- Remove default-state
- Add example dts in commit message
- Fix whitespace in Kconfig
- Fix comment
---
 drivers/leds/Kconfig        |  11 ++++
 drivers/leds/Makefile       |   1 +
 drivers/leds/leds-max597x.c | 115 ++++++++++++++++++++++++++++++++++++
 3 files changed, 127 insertions(+)
 create mode 100644 drivers/leds/leds-max597x.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 9dbce09eabac..60004cb8c257 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -590,6 +590,17 @@ config LEDS_ADP5520
 	  To compile this driver as a module, choose M here: the module will
 	  be called leds-adp5520.
 
+config LEDS_MAX597X
+	tristate "LED Support for Maxim 597x"
+	depends on LEDS_CLASS
+	depends on MFD_MAX597X
+	help
+	  This option enables support for the Maxim MAX5970 & MAX5978 smart
+	  switch indication LEDs via the I2C bus.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called leds-max597x.
+
 config LEDS_MC13783
 	tristate "LED Support for MC13XXX PMIC"
 	depends on LEDS_CLASS
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index d30395d11fd8..da1192e40268 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -53,6 +53,7 @@ obj-$(CONFIG_LEDS_LP8501)		+= leds-lp8501.o
 obj-$(CONFIG_LEDS_LP8788)		+= leds-lp8788.o
 obj-$(CONFIG_LEDS_LP8860)		+= leds-lp8860.o
 obj-$(CONFIG_LEDS_LT3593)		+= leds-lt3593.o
+obj-$(CONFIG_LEDS_MAX597X)		+= leds-max597x.o
 obj-$(CONFIG_LEDS_MAX77650)		+= leds-max77650.o
 obj-$(CONFIG_LEDS_MAX8997)		+= leds-max8997.o
 obj-$(CONFIG_LEDS_MC13783)		+= leds-mc13783.o
diff --git a/drivers/leds/leds-max597x.c b/drivers/leds/leds-max597x.c
new file mode 100644
index 000000000000..edbd43018822
--- /dev/null
+++ b/drivers/leds/leds-max597x.c
@@ -0,0 +1,115 @@
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
+#include <linux/mfd/max597x.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#define ldev_to_maxled(c)       container_of(c, struct max597x_led, cdev)
+
+struct max597x_led {
+	struct regmap *regmap;
+	struct led_classdev cdev;
+	unsigned int index;
+};
+
+static int max597x_led_set_brightness(struct led_classdev *cdev,
+				      enum led_brightness brightness)
+{
+	struct max597x_led *ddata = ldev_to_maxled(cdev);
+	int ret, val;
+
+	if (!ddata->regmap)
+		return -ENODEV;
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
+static int max597x_setup_led(struct device *dev, struct regmap *regmap, struct device_node *nc,
+			     u32 reg)
+{
+	struct max597x_led *ddata;
+	int ret;
+
+	ddata = devm_kzalloc(dev, sizeof(struct max597x_led), GFP_KERNEL);
+	if (!ddata)
+		return -ENOMEM;
+
+	if (of_property_read_string(nc, "label", &ddata->cdev.name))
+		ddata->cdev.name = nc->name;
+
+	ddata->cdev.max_brightness = 1;
+	ddata->cdev.brightness_set_blocking = max597x_led_set_brightness;
+	ddata->cdev.default_trigger = "none";
+	ddata->index = reg;
+	ddata->regmap = regmap;
+
+	ret = devm_led_classdev_register(dev, &ddata->cdev);
+	if (ret)
+		dev_err(dev, "Error initializing LED %s", ddata->cdev.name);
+
+	return ret;
+}
+
+static int max597x_led_probe(struct platform_device *pdev)
+{
+	struct device_node *np = dev_of_node(pdev->dev.parent);
+	struct regmap *regmap;
+	struct device_node *led_node;
+	struct device_node *child;
+	int ret = 0;
+
+	regmap = dev_get_regmap(pdev->dev.parent, NULL);
+	if (!regmap)
+		return -EPROBE_DEFER;
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
+		if (reg >= MAX597X_NUM_LEDS) {
+			dev_err(&pdev->dev, "invalid LED (%u >= %d)\n", reg,
+				MAX597X_NUM_LEDS);
+			continue;
+		}
+
+		ret = max597x_setup_led(&pdev->dev, regmap, child, reg);
+		if (ret < 0)
+			dev_err(&pdev->dev, "Failed to initialize LED %u\n", reg);
+	}
+
+	return ret;
+}
+
+static struct platform_driver max597x_led_driver = {
+	.driver = {
+		.name = "max597x-led",
+	},
+	.probe = max597x_led_probe,
+};
+
+module_platform_driver(max597x_led_driver);
+MODULE_AUTHOR("Patrick Rudolph <patrick.rudolph@9elements.com>");
+MODULE_DESCRIPTION("MAX5970_hot-swap controller LED driver");
+MODULE_LICENSE("GPL");

base-commit: 9d8d0d98885abba451d7ffc4885236d14ead3c9a
-- 
2.39.1

