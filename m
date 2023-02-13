Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A900B69463B
	for <lists+linux-leds@lfdr.de>; Mon, 13 Feb 2023 13:47:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230257AbjBMMrj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 13 Feb 2023 07:47:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231263AbjBMMrV (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 13 Feb 2023 07:47:21 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3D8E1ADCC
        for <linux-leds@vger.kernel.org>; Mon, 13 Feb 2023 04:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676292375;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9kYeGxTRwqFcjnOzEmR+sAqoC2Q5sZ/YlnuDF8OVH+Y=;
        b=FAOCUGk15SP/056fPLWafQNejwTO1bnSe13ZgEroOWHKRKzscKHDOJ0yjlONvITKS0Hq6W
        ofKQCC7xaHhlzLpzvAx+pOP0oOaJXIQJ2Q7h85M/0MQ8uFXzf3FRU4PjPNG2GkHdK8DO8l
        h9IH4kpUJldDheymVxPcuy5yrcfaI3Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-331-LINbC_WiNEKqgXIYuQteXg-1; Mon, 13 Feb 2023 07:46:12 -0500
X-MC-Unique: LINbC_WiNEKqgXIYuQteXg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA5B485A5A3;
        Mon, 13 Feb 2023 12:46:11 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.24.132])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4EB83403D0CF;
        Mon, 13 Feb 2023 12:46:05 +0000 (UTC)
From:   Kate Hsuan <hpa@redhat.com>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Daniel Scally <djrscally@gmail.com>,
        Mark Gross <markgross@kernel.org>
Cc:     Kate Hsuan <hpa@redhat.com>
Subject: [RESEND PATCH 3/3] leds: tps68470: Add LED control for tps68470
Date:   Mon, 13 Feb 2023 20:45:20 +0800
Message-Id: <20230213124520.1635257-4-hpa@redhat.com>
In-Reply-To: <20230213124520.1635257-1-hpa@redhat.com>
References: <20230213124520.1635257-1-hpa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

There are two LED controllers, LEDA indicator LED and LEDB flash LED for
tps68470. LEDA can be enabled by setting TPS68470_ILEDCTL_ENA. Moreover,
tps68470 provides 4 levels of power status for LEDB, so after setting
TPS68470_ILEDCTL_ENB, the current status field (TPS68470_ILEDCTL_CTRLB)
should also be set according to the brightness value from user space.
These two LEDs can be controlled through the LED class of sysfs
(tps68470-leda and tps68470-ledb).

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 drivers/leds/Kconfig         |  12 +++
 drivers/leds/Makefile        |   1 +
 drivers/leds/leds-tps68470.c | 170 +++++++++++++++++++++++++++++++++++
 3 files changed, 183 insertions(+)
 create mode 100644 drivers/leds/leds-tps68470.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 499d0f215a8b..453404cb1329 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -846,6 +846,18 @@ config LEDS_TPS6105X
 	  It is a single boost converter primarily for white LEDs and
 	  audio amplifiers.
 
+config LEDS_TPS68470
+	tristate "LED support for TI TPS68470"
+	depends on LEDS_CLASS
+	depends on INTEL_SKL_INT3472
+	help
+	  This driver supports TPS68470 PMIC with LED chip.
+	  It provide two LED controllers, including an indicator LED
+	  and a flash LED.
+
+	  To compile this driver as a module, choose M and it will be
+	  called leds-tps68470
+
 config LEDS_IP30
 	tristate "LED support for SGI Octane machines"
 	depends on LEDS_CLASS
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 4fd2f92cd198..0a2ec01e27d9 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -86,6 +86,7 @@ obj-$(CONFIG_LEDS_TURRIS_OMNIA)		+= leds-turris-omnia.o
 obj-$(CONFIG_LEDS_WM831X_STATUS)	+= leds-wm831x-status.o
 obj-$(CONFIG_LEDS_WM8350)		+= leds-wm8350.o
 obj-$(CONFIG_LEDS_WRAP)			+= leds-wrap.o
+obj-$(CONFIG_LEDS_TPS68470)		+= leds-tps68470.o
 
 # LED SPI Drivers
 obj-$(CONFIG_LEDS_CR0014114)		+= leds-cr0014114.o
diff --git a/drivers/leds/leds-tps68470.c b/drivers/leds/leds-tps68470.c
new file mode 100644
index 000000000000..6243e7a4a718
--- /dev/null
+++ b/drivers/leds/leds-tps68470.c
@@ -0,0 +1,170 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * LED driver for TPS68470 PMIC
+ *
+ * Copyright (C) 2023 Red Hat
+ *
+ * Authors:
+ *	Kate Hsuan <hpa@redhat.com>
+ */
+
+#include <linux/gpio/driver.h>
+#include <linux/mfd/tps68470.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/leds.h>
+
+struct tps68470_led_data {
+	struct regmap *tps68470_regmap;
+	unsigned int brightness_a;
+	unsigned int brightness_b;
+	struct led_classdev leda_cdev;
+	struct led_classdev ledb_cdev;
+};
+
+enum ctrlb_current {
+	CTRLB_2MA	= 0,
+	CTRLB_4MA	= 1,
+	CTRLB_8MA	= 2,
+	CTRLB_16MA	= 3,
+};
+
+static int set_ledb_current(struct regmap *regmap,
+			    unsigned int *data_brightness,
+			    enum led_brightness brightness)
+{
+	unsigned int ledb_current;
+
+	switch (brightness) {
+	case LED_HALF:
+		ledb_current = CTRLB_8MA;
+		break;
+	case LED_FULL:
+		ledb_current = CTRLB_16MA;
+		break;
+	case LED_ON:
+		ledb_current = CTRLB_4MA;
+		break;
+	case LED_OFF:
+		ledb_current = CTRLB_2MA;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	*data_brightness = brightness;
+	return regmap_update_bits(regmap, TPS68470_REG_ILEDCTL,
+				  TPS68470_ILEDCTL_CTRLB, ledb_current);
+}
+
+static int tps68470_brightness_set(struct led_classdev *led_cdev,
+				   enum led_brightness brightness)
+{
+	struct tps68470_led_data *data;
+	struct regmap *regmap;
+	unsigned int mask;
+	unsigned int value;
+	int ret;
+
+	if (!strncmp(led_cdev->name, "tps68470-ileda", 14)) {
+		data = container_of(led_cdev, struct tps68470_led_data, leda_cdev);
+		regmap = data->tps68470_regmap;
+		data->brightness_a = brightness ? TPS68470_ILEDCTL_ENA : 0;
+		mask = TPS68470_ILEDCTL_ENA;
+		value = data->brightness_a;
+	} else if (!strncmp(led_cdev->name, "tps68470-iledb", 14)) {
+		data = container_of(led_cdev, struct tps68470_led_data, ledb_cdev);
+		regmap = data->tps68470_regmap;
+		mask = TPS68470_ILEDCTL_ENB;
+		value = brightness ? TPS68470_ILEDCTL_ENB : 0;
+		/* Set current state for ledb */
+		ret = set_ledb_current(regmap, &data->brightness_b, brightness);
+		if (ret)
+			goto err_exit;
+	} else
+		return -EINVAL;
+
+	ret = regmap_update_bits(regmap, TPS68470_REG_ILEDCTL, mask, value);
+
+err_exit:
+	return ret;
+}
+
+static enum led_brightness tps68470_brightness_get(struct led_classdev *led_cdev)
+{
+	struct tps68470_led_data *data = container_of(led_cdev,
+						      struct tps68470_led_data,
+						      ledb_cdev);
+
+	if (!strncmp(led_cdev->name, "tps68470-ileda", 14))
+		return data->brightness_a;
+	else if (!strncmp(led_cdev->name, "tps68470-iledb", 14))
+		return data->brightness_b;
+
+	return -EINVAL;
+}
+
+static int tps68470_led_probe(struct platform_device *pdev)
+{
+	int ret = 0;
+	struct tps68470_led_data *tps68470_led;
+
+	tps68470_led = devm_kzalloc(&pdev->dev, sizeof(struct tps68470_led_data),
+				    GFP_KERNEL);
+	if (!tps68470_led)
+		return -ENOMEM;
+
+	tps68470_led->tps68470_regmap = dev_get_drvdata(pdev->dev.parent);
+	tps68470_led->leda_cdev.name = "tps68470-ileda";
+	tps68470_led->leda_cdev.max_brightness = 1;
+	tps68470_led->leda_cdev.brightness_set_blocking = tps68470_brightness_set;
+	tps68470_led->leda_cdev.brightness_get = tps68470_brightness_get;
+	tps68470_led->leda_cdev.dev = &pdev->dev;
+	tps68470_led->brightness_a = 0;
+	ret = led_classdev_register(&pdev->dev, &tps68470_led->leda_cdev);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Failed to register LEDA: %d\n", ret);
+		return ret;
+	}
+
+	tps68470_led->tps68470_regmap = dev_get_drvdata(pdev->dev.parent);
+	tps68470_led->ledb_cdev.name = "tps68470-iledb";
+	tps68470_led->ledb_cdev.max_brightness = 255;
+	tps68470_led->ledb_cdev.brightness_set_blocking = tps68470_brightness_set;
+	tps68470_led->ledb_cdev.brightness_get = tps68470_brightness_get;
+	tps68470_led->ledb_cdev.dev = &pdev->dev;
+	tps68470_led->brightness_b = 0;
+	ret = led_classdev_register(&pdev->dev, &tps68470_led->ledb_cdev);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Failed to register LEDB: %d\n", ret);
+		return ret;
+	}
+
+	platform_set_drvdata(pdev, tps68470_led);
+
+	return ret;
+}
+
+static int tps68470_led_remove(struct platform_device *pdev)
+{
+	struct tps68470_led_data *data = platform_get_drvdata(pdev);
+
+	led_classdev_unregister(&data->leda_cdev);
+	led_classdev_unregister(&data->ledb_cdev);
+
+	return 0;
+}
+
+static struct platform_driver tps68470_led_driver = {
+	.driver = {
+		   .name = "tps68470-led",
+	},
+	.probe = tps68470_led_probe,
+	.remove = tps68470_led_remove,
+};
+module_platform_driver(tps68470_led_driver);
+
+MODULE_ALIAS("platform:tps68470-led");
+MODULE_DESCRIPTION("LED driver for TPS68470 PMIC");
+MODULE_LICENSE("GPL v2");
-- 
2.39.0

