Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA0A56B3B79
	for <lists+linux-leds@lfdr.de>; Fri, 10 Mar 2023 10:58:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229846AbjCJJ6N (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 10 Mar 2023 04:58:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230387AbjCJJ6I (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 10 Mar 2023 04:58:08 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC46A10868B
        for <linux-leds@vger.kernel.org>; Fri, 10 Mar 2023 01:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678442243;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iE9NYOXEg52ZpYxXc9MNojx9L7At2wdMLIDlFKCdzbg=;
        b=WsYJ1PTSyjTf4u5GXhTr5zHbjkNtbpEIgFxPy1zrtkN6gSUBEbDDkIUXC1h8htii7JPV57
        2dxF6eXWba69eLc3Lo8AgT/5YVJ0lMXjDiWRXVw7mGiMASQwBlIKUutArcn4DG0xIoWBig
        J+jfmV3gI65VJOICiE+FUTBja0PZ+SQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-384-tZzt7KWNM9yLge9yrwFIkg-1; Fri, 10 Mar 2023 04:57:19 -0500
X-MC-Unique: tZzt7KWNM9yLge9yrwFIkg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5105D800B23;
        Fri, 10 Mar 2023 09:57:19 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.24.100])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A94292166B26;
        Fri, 10 Mar 2023 09:57:15 +0000 (UTC)
From:   Kate Hsuan <hpa@redhat.com>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Daniel Scally <djrscally@gmail.com>,
        Mark Gross <markgross@kernel.org>
Cc:     Kate Hsuan <hpa@redhat.com>
Subject: [PATCH v2 3/4] leds: tps68470: Add LED control for tps68470
Date:   Fri, 10 Mar 2023 17:56:34 +0800
Message-Id: <20230310095635.813262-4-hpa@redhat.com>
In-Reply-To: <20230310095635.813262-1-hpa@redhat.com>
References: <20230310095635.813262-1-hpa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
tps68470 provides four levels of power status for LEDB. If the
properties called "ti,ledb-current" can be found, the current will be
set according to the property values. These two LEDs can be controlled
through the LED class of sysfs (tps68470-leda and tps68470-ledb).

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 drivers/leds/Kconfig         |  12 +++
 drivers/leds/Makefile        |   1 +
 drivers/leds/leds-tps68470.c | 182 +++++++++++++++++++++++++++++++++++
 3 files changed, 195 insertions(+)
 create mode 100644 drivers/leds/leds-tps68470.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 9dbce09eabac..fd26036b3c61 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -827,6 +827,18 @@ config LEDS_TPS6105X
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
index d30395d11fd8..b284bc0daa98 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -84,6 +84,7 @@ obj-$(CONFIG_LEDS_TURRIS_OMNIA)		+= leds-turris-omnia.o
 obj-$(CONFIG_LEDS_WM831X_STATUS)	+= leds-wm831x-status.o
 obj-$(CONFIG_LEDS_WM8350)		+= leds-wm8350.o
 obj-$(CONFIG_LEDS_WRAP)			+= leds-wrap.o
+obj-$(CONFIG_LEDS_TPS68470)		+= leds-tps68470.o
 
 # LED SPI Drivers
 obj-$(CONFIG_LEDS_CR0014114)		+= leds-cr0014114.o
diff --git a/drivers/leds/leds-tps68470.c b/drivers/leds/leds-tps68470.c
new file mode 100644
index 000000000000..98bb56153690
--- /dev/null
+++ b/drivers/leds/leds-tps68470.c
@@ -0,0 +1,182 @@
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
+#define lcdev_to_led(led_cdev) \
+	container_of(led_cdev, struct tps68470_led, lcdev)
+
+#define led_to_tps68470(led, index) \
+	container_of(led, struct tps68470_device, leds[index])
+
+enum tps68470_led_ids {
+	TPS68470_ILED_A,
+	TPS68470_ILED_B,
+	TPS68470_NUM_LEDS
+};
+
+static const char *tps68470_led_names[] = {
+	[TPS68470_ILED_A] = "tps68470-iled_a",
+	[TPS68470_ILED_B] = "tps68470-iled_b",
+};
+
+struct tps68470_led {
+	unsigned int led_id;
+	struct led_classdev lcdev;
+};
+
+struct tps68470_device {
+	struct device *dev;
+	struct regmap *regmap;
+	struct tps68470_led leds[TPS68470_NUM_LEDS];
+};
+
+enum ctrlb_current {
+	CTRLB_2MA	= 0,
+	CTRLB_4MA	= 1,
+	CTRLB_8MA	= 2,
+	CTRLB_16MA	= 3,
+};
+
+static int tps68470_brightness_set(struct led_classdev *led_cdev, enum led_brightness brightness)
+{
+	struct tps68470_led *led = lcdev_to_led(led_cdev);
+	struct tps68470_device *tps68470 = led_to_tps68470(led, led->led_id);
+	struct regmap *regmap = tps68470->regmap;
+
+	switch (led->led_id) {
+	case TPS68470_ILED_A:
+		return regmap_update_bits(regmap, TPS68470_REG_ILEDCTL, TPS68470_ILEDCTL_ENA,
+					  brightness ? TPS68470_ILEDCTL_ENA : 0);
+	case TPS68470_ILED_B:
+		return regmap_update_bits(regmap, TPS68470_REG_ILEDCTL, TPS68470_ILEDCTL_ENB,
+					  brightness ? TPS68470_ILEDCTL_ENB : 0);
+	}
+	return -EINVAL;
+}
+
+static enum led_brightness tps68470_brightness_get(struct led_classdev *led_cdev)
+{
+	struct tps68470_led *led = lcdev_to_led(led_cdev);
+	struct tps68470_device *tps68470 = led_to_tps68470(led, led->led_id);
+	struct regmap *regmap = tps68470->regmap;
+	int ret = 0;
+	int value = 0;
+
+	ret =  regmap_read(regmap, TPS68470_REG_ILEDCTL, &value);
+	if (ret)
+		goto error;
+
+	switch (led->led_id) {
+	case TPS68470_ILED_A:
+		value = value & TPS68470_ILEDCTL_ENA;
+		break;
+	case TPS68470_ILED_B:
+		value = value & TPS68470_ILEDCTL_ENB;
+		break;
+	}
+
+	return value ? LED_ON : LED_OFF;
+
+error:
+	dev_err(led_cdev->dev, "Failed on reading register\n");
+	return -EINVAL;
+}
+
+static int tps68470_leds_probe(struct platform_device *pdev)
+{
+	int i = 0;
+	int ret = 0;
+	unsigned int curr;
+	struct tps68470_device *tps68470;
+	struct tps68470_led *led;
+	struct led_classdev *lcdev;
+
+	tps68470 = devm_kzalloc(&pdev->dev, sizeof(struct tps68470_device),
+				GFP_KERNEL);
+	tps68470->dev = &pdev->dev;
+	tps68470->regmap = dev_get_drvdata(pdev->dev.parent);
+
+	for (i = 0; i < TPS68470_NUM_LEDS; i++) {
+		led = &tps68470->leds[i];
+		lcdev = &led->lcdev;
+
+		led->led_id = i;
+
+		lcdev->name = devm_kasprintf(tps68470->dev, GFP_KERNEL, "%s::%s",
+					     tps68470_led_names[i], LED_FUNCTION_INDICATOR);
+		if (!lcdev->name)
+			return -ENOMEM;
+
+		lcdev->max_brightness = 1;
+		lcdev->brightness = 0;
+		lcdev->brightness_set_blocking = tps68470_brightness_set;
+		lcdev->brightness_get = tps68470_brightness_get;
+		lcdev->dev = &pdev->dev;
+
+		ret = devm_led_classdev_register(tps68470->dev, lcdev);
+		if (ret) {
+			dev_err_probe(tps68470->dev, ret,
+				      "error registering led\n");
+			goto err_exit;
+		}
+	}
+
+	/* configure LEDB current if the properties can be got */
+	if (!device_property_read_u32(&pdev->dev, "ti,ledb-current", &curr)) {
+		switch (curr) {
+		case  2:
+			curr = CTRLB_2MA;
+			break;
+		case  4:
+			curr = CTRLB_4MA;
+			break;
+		case  8:
+			curr = CTRLB_8MA;
+			break;
+		case 16:
+			curr = CTRLB_16MA;
+			break;
+		default:
+			dev_err(&pdev->dev, "Invalid LEDB curr value: %d\n", curr);
+			return -EINVAL;
+		}
+		ret = regmap_update_bits(tps68470->regmap, TPS68470_REG_ILEDCTL,
+					 TPS68470_ILEDCTL_CTRLB, curr);
+	}
+
+err_exit:
+	if (ret) {
+		for (i = 0; i < TPS68470_NUM_LEDS; i++) {
+			if (tps68470->leds[i].lcdev.name)
+				devm_led_classdev_unregister(&pdev->dev,
+							     &tps68470->leds[i].lcdev);
+		}
+	}
+
+	return ret;
+}
+static struct platform_driver tps68470_led_driver = {
+	.driver = {
+		   .name = "tps68470-led",
+	},
+	.probe = tps68470_leds_probe,
+};
+
+module_platform_driver(tps68470_led_driver);
+
+MODULE_ALIAS("platform:tps68470-led");
+MODULE_DESCRIPTION("LED driver for TPS68470 PMIC");
+MODULE_LICENSE("GPL v2");
-- 
2.37.3

