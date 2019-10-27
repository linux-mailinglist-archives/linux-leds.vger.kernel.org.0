Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E9FCE62F5
	for <lists+linux-leds@lfdr.de>; Sun, 27 Oct 2019 15:10:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726690AbfJ0OKH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 27 Oct 2019 10:10:07 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:46498 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726541AbfJ0OKG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 27 Oct 2019 10:10:06 -0400
Received: by mail-pl1-f193.google.com with SMTP id q21so3986262plr.13;
        Sun, 27 Oct 2019 07:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=0LJUQCa0XqM3LSeg59c6mc8H83Nn1U3hKP+zHOPkdA4=;
        b=HX0Z0miTJ0jKmGMleWZkLNMjboGc/zmziD+mKvCQ+XkX2CB7yUSpcwBzCuEMg0D6qd
         2O5SF98DMQk4wPFvFBVZULNyzLwQjDu7xWmg3vtaFh0m0Wp28QtBhirnjecduhnlH5rt
         KUeCGsNDjH+ATF46RRSl+m6pG1YIBhNWBT7B/GpAAl1mTFIiiXjUgoj/eZYznUjZ1ZHL
         th7ruXW131kyb36Q5fD+GQ+/OCh1FPIdwAdvdpP72fD+acoeOkKLXGjTruqvbdAF4gXB
         d87nBIX9Ux3gagSvAEPSG4q2t+JPskSh0yaICRj79EmtWjPYm88CD1IJvvLPq6/eZzyP
         PcJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=0LJUQCa0XqM3LSeg59c6mc8H83Nn1U3hKP+zHOPkdA4=;
        b=g4qqyEYowLRuOBJn667J6HM4lnniVeAp6DrxyVdDQY5gCW4HxmEz9PWI20/QPxgLk+
         Lb1cpZlt9ZO/ZM0Gp1bOWfQmVL0jJYH6Rs6hXas3mn6S7bZdQZeoIFsUVDY9T8NxK6rl
         OjtrhxyE87o8Zr079mlC9X9weKyAtRc+E+1Ga8+IQ1ej2+WcrbSZMyBbwFaROPIIehSS
         4sQMAsVMcKJ/iB/bL5RBkMQ2r+Xfn/So4/bx+L4V0UHkAkreFSP4yu3BtipfaaHAWT7H
         3bx9US+sxVXTXljTBEC8XFZ6gp7uyDKPVVgQv6wJiSQOisgTJwG4tPtJ2vTVN4NdCjgk
         imjA==
X-Gm-Message-State: APjAAAV8I/3QVDNIh7Fl0GTtzBXmCC2LRkih2vtSpoiV7Kv5uy8CU3Ka
        5hcuuip6UUCKE8ZltgUH33JXqayY
X-Google-Smtp-Source: APXvYqzalo1cof1vBLrjEDEzyL9S13wqpvQJIP9nP3/93jlYpz1bFS2qugRJwpiVBiRkq8XlQICa9w==
X-Received: by 2002:a17:902:5985:: with SMTP id p5mr14712160pli.259.1572185405625;
        Sun, 27 Oct 2019 07:10:05 -0700 (PDT)
Received: from localhost.localdomain ([240f:34:212d:1:368e:e048:68f1:84e7])
        by smtp.gmail.com with ESMTPSA id v10sm6514702pfg.11.2019.10.27.07.10.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sun, 27 Oct 2019 07:10:05 -0700 (PDT)
From:   Akinobu Mita <akinobu.mita@gmail.com>
To:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Akinobu Mita <akinobu.mita@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Bjorn Andersson <bjorn@kryo.se>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Jean-Jacques Hiblot <jjhiblot@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v2 2/2] leds: Add generic LED level meter driver
Date:   Sun, 27 Oct 2019 23:09:39 +0900
Message-Id: <1572185379-21537-3-git-send-email-akinobu.mita@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572185379-21537-1-git-send-email-akinobu.mita@gmail.com>
References: <1572185379-21537-1-git-send-email-akinobu.mita@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This introduces a new LED driver that enables us to create a virtual LED
level meter device that consists of multiple LED devices by different
drivers.

The brightness of the LED level meter is proportional to the number of
actual LEDs that are turned on.

For example, the LED level meter with four LEDs can be described by the
following DT node.

    meter-leds {
        compatible = "meter-leds";
        leds = <&led0>, <&led1>, <&led2>, <&led3>;
    };

When the brightness of meter-leds is LED_HALF, the brightness of the led0
and led1 is set to maximum brightness and the brightness of led2 and led3
is set to zero.

We can optionally control the proportionality within a level meter by
specifying the contribution ratio for each LED with the brightness-weights
proporty.

For example, the following brightness-weights proporty provides an
exponential relationship between the number of LEDs turned on and the
brightness of meter-leds.

    meter-leds {
        compatible = "meter-leds";
        leds = <&led0>, <&led1>, <&led2>, <&led3>;
        brightness-weights = <32 32 64 127>;
    };

- No LEDs are turned on if brightness == 0
- led0 is turned on if 0 < brightness <= 32
- led0 and led1 are turned on if 32 < brightness <= 64
- led0, led1, and led2 are turned on if 64 < brightness <= 128
- All LEDs are turned on if 128 < brightness <= 255

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Bjorn Andersson <bjorn@kryo.se>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Jean-Jacques Hiblot <jjhiblot@ti.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Dan Murphy <dmurphy@ti.com>
Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
---
 drivers/leds/Kconfig      |  10 +++
 drivers/leds/Makefile     |   1 +
 drivers/leds/leds-meter.c | 151 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 162 insertions(+)
 create mode 100644 drivers/leds/leds-meter.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 1988de1..feecd2e 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -823,6 +823,16 @@ config LEDS_LM36274
 	  Say Y to enable the LM36274 LED driver for TI LMU devices.
 	  This supports the LED device LM36274.
 
+config LEDS_METER
+	tristate "LED support for generic level meter driver"
+	depends on LEDS_CLASS
+	help
+	  This option enables support for generic LED level meter that
+	  consists of multiple LED devices.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called leds-meter.
+
 comment "LED Triggers"
 source "drivers/leds/trigger/Kconfig"
 
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 41fb073..0fe2a28 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -85,6 +85,7 @@ obj-$(CONFIG_LEDS_LM3601X)		+= leds-lm3601x.o
 obj-$(CONFIG_LEDS_TI_LMU_COMMON)	+= leds-ti-lmu-common.o
 obj-$(CONFIG_LEDS_LM3697)		+= leds-lm3697.o
 obj-$(CONFIG_LEDS_LM36274)		+= leds-lm36274.o
+obj-$(CONFIG_LEDS_METER)		+= leds-meter.o
 
 # LED SPI Drivers
 obj-$(CONFIG_LEDS_CR0014114)		+= leds-cr0014114.o
diff --git a/drivers/leds/leds-meter.c b/drivers/leds/leds-meter.c
new file mode 100644
index 0000000..3d1d616
--- /dev/null
+++ b/drivers/leds/leds-meter.c
@@ -0,0 +1,151 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+struct meter_led_ref {
+	struct led_classdev *cdev;
+	unsigned int brightness_weight;
+};
+
+struct meter_led_data {
+	struct led_classdev cdev;
+	int num_leds;
+	int total_weight;
+	struct meter_led_ref leds[];
+};
+
+struct leds_fract {
+	unsigned int numerator;
+	unsigned int denominator;
+};
+
+/* Compare two leds_fract structs */
+#define LEDS_FRACT_COMPARE(a, OP, b)			\
+	((u64)(a).numerator * (b).denominator OP	\
+	(u64)(b).numerator * (a).denominator)
+
+static void meter_led_set(struct led_classdev *led_cdev,
+			  enum led_brightness value)
+{
+	struct meter_led_data *meter_led =
+		container_of(led_cdev, struct meter_led_data, cdev);
+	struct leds_fract level = { 0, meter_led->total_weight };
+	struct leds_fract br = { value, LED_FULL };
+	int i;
+
+	for (i = 0; i < meter_led->num_leds; i++) {
+		struct meter_led_ref *led = &meter_led->leds[i];
+
+		if (LEDS_FRACT_COMPARE(br, <=, level))
+			break;
+
+		level.numerator += led->brightness_weight;
+
+		led_set_brightness(led->cdev, led->cdev->max_brightness);
+	}
+
+	for (; i < meter_led->num_leds; i++) {
+		struct meter_led_ref *led = &meter_led->leds[i];
+
+		led_set_brightness(led->cdev, 0);
+	}
+}
+
+static int meter_led_probe(struct platform_device *pdev)
+{
+	int i;
+	int num_leds;
+	int num_weights;
+	struct meter_led_data *meter_led;
+	const char *state;
+	struct led_init_data init_data = {};
+
+	num_leds = of_count_phandle_with_args(pdev->dev.of_node, "leds", NULL);
+	if (num_leds < 0)
+		return num_leds;
+
+	if (num_leds < 1) {
+		dev_err(&pdev->dev, "At least one LED must be specified!\n");
+		return -EINVAL;
+	}
+
+	num_weights = device_property_count_u32(&pdev->dev,
+						"brightness-weights");
+	if (num_weights < 0) {
+		num_weights = 0;
+	} else if (num_weights != num_leds) {
+		dev_err(&pdev->dev,
+			"The number of brightness-weights must be equal to the number of LEDs\n");
+		return -EINVAL;
+	}
+
+	meter_led = devm_kzalloc(&pdev->dev,
+				 struct_size(meter_led, leds, num_leds),
+				 GFP_KERNEL);
+	if (!meter_led)
+		return -ENOMEM;
+
+	for (i = 0; i < num_leds; i++) {
+		meter_led->leds[i].cdev = devm_of_led_get(&pdev->dev, i);
+		if (IS_ERR(meter_led->leds[i].cdev))
+			return PTR_ERR(meter_led->leds[i].cdev);
+
+		if (num_weights) {
+			of_property_read_u32_index(pdev->dev.of_node,
+					"brightness-weights", i,
+					&meter_led->leds[i].brightness_weight);
+		} else {
+			meter_led->leds[i].brightness_weight = 1;
+		}
+
+		meter_led->total_weight += meter_led->leds[i].brightness_weight;
+	}
+
+	meter_led->num_leds = num_leds;
+	meter_led->cdev.brightness_set = meter_led_set;
+	meter_led->cdev.max_brightness = LED_FULL;
+	meter_led->cdev.brightness = LED_OFF;
+
+	device_property_read_string(&pdev->dev, "linux,default-trigger",
+				    &meter_led->cdev.default_trigger);
+
+	if (!device_property_read_string(&pdev->dev, "default-state", &state)) {
+		if (!strcmp(state, "keep"))
+			dev_err(&pdev->dev,
+				"The \"keep\" setting for the default-state property is not supported\n");
+		else if (!strcmp(state, "on"))
+			meter_led->cdev.brightness = LED_FULL;
+	}
+
+	meter_led->cdev.brightness_set(&meter_led->cdev,
+				       meter_led->cdev.brightness);
+
+	platform_set_drvdata(pdev, meter_led);
+	init_data.fwnode = of_fwnode_handle(pdev->dev.of_node);
+
+	return devm_led_classdev_register_ext(&pdev->dev, &meter_led->cdev,
+					      &init_data);
+}
+
+static const struct of_device_id of_meter_leds_match[] = {
+	{ .compatible = "meter-leds", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, of_meter_leds_match);
+
+static struct platform_driver meter_led_driver = {
+	.driver = {
+		.name = "meter-led",
+		.of_match_table = of_meter_leds_match,
+	},
+	.probe = meter_led_probe,
+};
+module_platform_driver(meter_led_driver);
+
+MODULE_AUTHOR("Akinobu Mita");
+MODULE_DESCRIPTION("LED level meter driver");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:leds-meter");
-- 
2.7.4

