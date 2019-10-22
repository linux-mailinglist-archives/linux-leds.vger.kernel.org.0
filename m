Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8309E0705
	for <lists+linux-leds@lfdr.de>; Tue, 22 Oct 2019 17:07:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732201AbfJVPHS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 22 Oct 2019 11:07:18 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:35623 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732199AbfJVPHR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 22 Oct 2019 11:07:17 -0400
Received: by mail-pg1-f193.google.com with SMTP id c8so5312864pgb.2;
        Tue, 22 Oct 2019 08:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=N3CmjMllKLBytgWPL0cmuY773py4O8b+FX0w9Kg8qQA=;
        b=MAplQwa1rB0bqOKHscMgZ7XrgUelNEFQPdSDazmrSsOTMGovAuSSX8EswURGXzEzzh
         h8QH/2gTA8e+C7xBnFu8Z2nK72KBrbNuXin5ZkMrn4Yp7B701VZmpXK+xNfEQRyiwBmI
         IMwRLN3XEzQmGhk0lmWbgbYp9tcFJaZPd8WojZKaa9xIlF7mNYMph4fmVGTn3AAjHCK1
         0q2Ry03up3mSNMSdJDkvY2zJk46oU9YhIyzfFT/kae+zmf/bTtxRNyEH5xagX+KxP1pL
         PUg9Yt7lqntiKc2kEOhqCU/54QVFxIe7anoQTICapOy8xsifbVx5U2nUp2wHtqVZWtiD
         o42w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=N3CmjMllKLBytgWPL0cmuY773py4O8b+FX0w9Kg8qQA=;
        b=AGE27Djvs2HGhcImrrYNd2hEpMGxoumL39DGQUilNMGggApJL0yI+cvc2qIdevCefj
         j8WACd/2Yla1zOsSTMbgVF7fZ47hcJCh3N45/tleTKj/E+FHdJhwxmgETSp4U/MAGQiV
         k7dlbxt/r3dvSgoBwj9P6xzPPIoFnSYBwFAjzlShOWJY6l6M0/lVh3qJPwoufTZrgyw8
         9Xkwu4fGqZiBhhnHQbHDruU+KKgHMRaQDuKpAa1rC20DLhGE7jcLNCisJFXQcFz0GifE
         uHtc5pDEdT+bHX4+9K0CA4GZh1BRh6cTN/qf3bsGyl+DJcidGmDgyy4tqKuvAKI05eue
         KycA==
X-Gm-Message-State: APjAAAWm//9+rQktJkGAY5bIbHbsxbkVbcZDFcb1w7v/4sDRjY7+OARt
        35grnoE/5BbZPY363jz+LM6wnevX
X-Google-Smtp-Source: APXvYqzpYDKVZXAMoGmPfHfciabkiJhvtkK+jXdaNI0K1V5CeSFImQaWutZjNfhUICcG3ZZCoVRoIw==
X-Received: by 2002:a62:a504:: with SMTP id v4mr4667174pfm.243.1571756836801;
        Tue, 22 Oct 2019 08:07:16 -0700 (PDT)
Received: from localhost.localdomain ([240f:34:212d:1:368e:e048:68f1:84e7])
        by smtp.gmail.com with ESMTPSA id k66sm19882001pjb.11.2019.10.22.08.07.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 22 Oct 2019 08:07:16 -0700 (PDT)
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
Subject: [PATCH 1/2] leds: add LED level meter driver
Date:   Wed, 23 Oct 2019 00:06:51 +0900
Message-Id: <1571756812-19005-2-git-send-email-akinobu.mita@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1571756812-19005-1-git-send-email-akinobu.mita@gmail.com>
References: <1571756812-19005-1-git-send-email-akinobu.mita@gmail.com>
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

We can optionally control the proportionality by overvaluing some of LEDs
with the brightness-weights proporty.

For example, when we assign the weight of led0 to the total weigt of the
rest, only the led0 is turned on if the brightness of meter-leds is within
the range of [1, LED_HALD].

    meter-leds {
        compatible = "meter-leds";
        leds = <&led0>, <&led1>, <&led2>, <&led3>;
        brightness-weights = <3 1 1 1>;
    };

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
 drivers/leds/Kconfig      |  10 ++++
 drivers/leds/Makefile     |   1 +
 drivers/leds/leds-meter.c | 134 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 145 insertions(+)
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
index 0000000..a47b639
--- /dev/null
+++ b/drivers/leds/leds-meter.c
@@ -0,0 +1,134 @@
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
+	num_weights = of_property_count_u32_elems(pdev->dev.of_node,
+						  "brightness-weights");
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

