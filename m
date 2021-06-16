Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D0333A8DDB
	for <lists+linux-leds@lfdr.de>; Wed, 16 Jun 2021 02:51:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231437AbhFPAyA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 15 Jun 2021 20:54:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231307AbhFPAx7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 15 Jun 2021 20:53:59 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97B1DC061574
        for <linux-leds@vger.kernel.org>; Tue, 15 Jun 2021 17:51:53 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id f70so854295qke.13
        for <linux-leds@vger.kernel.org>; Tue, 15 Jun 2021 17:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=60228.dev; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HeAvsvasPYgmyJH5rrmcjx/ex+12rkfJi6098VAPKqs=;
        b=Eoqwjw1cdVK/46Asknlm44IV9ioTSX4GNintJ4T12HNgPt5R3vf9XQmp5QLi7AYtBV
         5CdJNcFCP6ebK+zO6OK+kSsFlE3s+6eUxMC081X3cwXGnXimXKK1MrqDzxDW9YudtELX
         TvgaKkx4sPfF+8Hxuv4uOyFb0btYmItk7RvvrZ0FwUDD9P3ojm3z782y9IEVb5IDB46M
         Nm9yuGLeh15c3W0RaYkx6b4j0kXqkar9T70F33o9LRdBdjU6NVbgbihVbpQeFkQmw0Rj
         0NiQwUAtq8QGHBVgDETQNaA+ImnA56j8ZkzT18J7/E4Tb37uYS7QAuKlJg2tnuFrrRmx
         +olw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HeAvsvasPYgmyJH5rrmcjx/ex+12rkfJi6098VAPKqs=;
        b=EFsEMpJ4ZDOyfV4wMMaSyoxXE8I+68UYcSz8000SrMqEqlFoY78MRZjz3DfDznwyVE
         yl9IZHedrKGR/sKAnMrbP1wiU7XeN9qFrloYJOHk7/YZw2kA6Vjgy32By8xdIwiD6cng
         mM2yGp2OgL0Wky5GtEyyblgdTQyBJFdWPSUaGp3GfF5k6hen7dY9MIIfPoaT99xUzwkw
         rq7EfxVA270s/tBOxwb27+7HnKze+hgi8eTBpjfjfmhAoPhHPqQWNp2BiJ4yYs9HEJNS
         kFcJyRzeEBn0VhcRxsRqS5x5sGBdvj66Zg27/2tJdd0FD8/oZwq7us6RZDiGdUc/vbAj
         x9cA==
X-Gm-Message-State: AOAM530oF5oAJyJcQOvjXJ2SaMTpIokmC1fUfvdyPfw3yOGIJjJJyvo+
        gEPESFGkysBhzuqSc1vRjTuRxaH/UzbFjCIgOorQjQ==
X-Google-Smtp-Source: ABdhPJz5nE0jdcCY/9pTg3SMcTa2J3z9PD436rJz7K5OzTldj3SYRXadTV5ljgi1EWruFtovOX3Hrw==
X-Received: by 2002:a37:91c2:: with SMTP id t185mr2475204qkd.430.1623804712714;
        Tue, 15 Jun 2021 17:51:52 -0700 (PDT)
Received: from leotop.60228.dev.beta.tailscale.net (cpe-158-222-150-74.nyc.res.rr.com. [158.222.150.74])
        by smtp.gmail.com with ESMTPSA id 7sm553383qkb.86.2021.06.15.17.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 17:51:52 -0700 (PDT)
From:   leo60228 <leo@60228.dev>
To:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org,
        linux-leds@vger.kernel.org
Cc:     leo60228 <leo@60228.dev>
Subject: [PATCH v2] platform/x86: add support for Acer Predator LEDs
Date:   Tue, 15 Jun 2021 20:51:47 -0400
Message-Id: <20210616005147.26212-1-leo@60228.dev>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210615221931.18148-1-leo@60228.dev>
References: <20210615221931.18148-1-leo@60228.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The Acer Predator Helios 500's keyboard has four zones of RGB LEDs.

This driver allows them to be controlled from Linux.

Signed-off-by: leo60228 <leo@60228.dev>
---
In addition to some smaller concerns from review, v2 registers
multicolor LEDs instead of independent red, green, and blue ones.

 MAINTAINERS                     |   6 ++
 drivers/platform/x86/Kconfig    |  13 +++
 drivers/platform/x86/Makefile   |   1 +
 drivers/platform/x86/acer-led.c | 143 ++++++++++++++++++++++++++++++++
 4 files changed, 163 insertions(+)
 create mode 100644 drivers/platform/x86/acer-led.c

diff --git a/MAINTAINERS b/MAINTAINERS
index bc0ceef87..f647ea81c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -327,6 +327,12 @@ S:	Maintained
 W:	http://piie.net/?section=acerhdf
 F:	drivers/platform/x86/acerhdf.c
 
+ACER PREDATOR LAPTOP LEDS
+M:	leo60228 <leo@60228.dev>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/platform/x86/acer-led.c
+
 ACER WMI LAPTOP EXTRAS
 M:	"Lee, Chun-Yi" <jlee@suse.com>
 L:	platform-driver-x86@vger.kernel.org
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 60592fb88..a6d6ed2ac 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -190,6 +190,19 @@ config ACER_WMI
 	  If you have an ACPI-WMI compatible Acer/ Wistron laptop, say Y or M
 	  here.
 
+config ACER_LED
+	tristate "Acer Predator Laptop LEDs"
+	depends on ACPI
+	depends on ACPI_WMI
+	depends on LEDS_CLASS_MULTICOLOR
+	depends on NEW_LEDS
+	help
+	  This is a driver for the RGB keyboard LEDs in Acer Predator laptops.
+	  It was designed for the Acer Predator Helios 500.
+
+	  If you choose to compile this driver as a module the module will be
+	  called acer-led.
+
 config AMD_PMC
 	tristate "AMD SoC PMC driver"
 	depends on ACPI && PCI
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index dcc8cdb95..36722207b 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -21,6 +21,7 @@ obj-$(CONFIG_GIGABYTE_WMI)		+= gigabyte-wmi.o
 obj-$(CONFIG_ACERHDF)		+= acerhdf.o
 obj-$(CONFIG_ACER_WIRELESS)	+= acer-wireless.o
 obj-$(CONFIG_ACER_WMI)		+= acer-wmi.o
+obj-$(CONFIG_ACER_LED)		+= acer-led.o
 
 # AMD
 obj-$(CONFIG_AMD_PMC)		+= amd-pmc.o
diff --git a/drivers/platform/x86/acer-led.c b/drivers/platform/x86/acer-led.c
new file mode 100644
index 000000000..d618830e0
--- /dev/null
+++ b/drivers/platform/x86/acer-led.c
@@ -0,0 +1,143 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Acer LED Driver
+ *
+ * Copyright (C) 2021 leo60228
+ */
+
+#include <linux/acpi.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/types.h>
+#include <linux/leds.h>
+#include <linux/led-class-multicolor.h>
+#include <linux/wmi.h>
+
+MODULE_AUTHOR("leo60228");
+MODULE_DESCRIPTION("Acer LED Driver");
+MODULE_LICENSE("GPL");
+
+#define ACER_LED_METHOD_GUID "7A4DDFE7-5B5D-40B4-8595-4408E0CC7F56"
+
+struct acer_led_zone {
+	char name[32];
+	int id;
+	struct mc_subled channels[3];
+	struct led_classdev_mc cdev;
+};
+
+struct acer_led_priv {
+	struct acer_led_zone zones[4];
+};
+
+struct led_zone_set_param {
+	u8 zone;
+	u8 red;
+	u8 green;
+	u8 blue;
+} __packed;
+
+static int acer_led_set(struct led_classdev *lcdev,
+			enum led_brightness value)
+{
+	struct led_classdev_mc *mccdev;
+	struct acer_led_zone *zone;
+	struct led_zone_set_param set_params;
+	struct acpi_buffer set_input;
+	int err;
+	acpi_status status;
+
+	mccdev = lcdev_to_mccdev(lcdev);
+
+	err = led_mc_calc_color_components(mccdev, value);
+	if (err)
+		return err;
+
+	zone = container_of(mccdev, struct acer_led_zone, cdev);
+
+	set_params = (struct led_zone_set_param) {
+		.zone = BIT(zone->id),
+		.red = zone->channels[0].brightness,
+		.green = zone->channels[1].brightness,
+		.blue = zone->channels[2].brightness,
+	};
+	set_input = (struct acpi_buffer) {
+		sizeof(set_params),
+		&set_params
+	};
+
+	status = wmi_evaluate_method(
+		ACER_LED_METHOD_GUID, 0, 0x6, &set_input, NULL);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	return 0;
+}
+
+static int acer_led_setup_zone(struct wmi_device *wdev,
+			       struct acer_led_zone *zone)
+{
+	snprintf(zone->name, sizeof(zone->name), ":kbd_backlight-%d",
+		 zone->id + 1);
+
+	zone->channels[0].color_index = LED_COLOR_ID_RED;
+	zone->channels[0].channel = 0;
+	zone->channels[1].color_index = LED_COLOR_ID_GREEN;
+	zone->channels[1].channel = 1;
+	zone->channels[2].color_index = LED_COLOR_ID_BLUE;
+	zone->channels[2].channel = 2;
+
+	zone->cdev.num_colors = 3;
+	zone->cdev.subled_info = zone->channels;
+
+	zone->cdev.led_cdev.name = zone->name;
+	zone->cdev.led_cdev.max_brightness = 255;
+	zone->cdev.led_cdev.brightness_set_blocking = acer_led_set;
+
+	return devm_led_classdev_multicolor_register(&wdev->dev, &zone->cdev);
+}
+
+static int acer_led_setup(struct wmi_device *wdev)
+{
+	struct acer_led_priv *priv = dev_get_drvdata(&wdev->dev);
+	int i, err = 0;
+
+	for (i = 0; i < ARRAY_SIZE(priv->zones); i++) {
+		priv->zones[i].id = i;
+
+		err = acer_led_setup_zone(wdev, &priv->zones[i]);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
+static int acer_led_probe(struct wmi_device *wdev, const void *context)
+{
+	struct acer_led_priv *priv;
+
+	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+	dev_set_drvdata(&wdev->dev, priv);
+
+	return acer_led_setup(wdev);
+}
+
+static const struct wmi_device_id acer_led_id_table[] = {
+	{ .guid_string = ACER_LED_METHOD_GUID },
+	{ },
+};
+
+static struct wmi_driver acer_led_driver = {
+	.driver = {
+		.name = "acer-led",
+	},
+	.id_table = acer_led_id_table,
+	.probe = acer_led_probe,
+};
+
+module_wmi_driver(acer_led_driver);
+
+MODULE_DEVICE_TABLE(wmi, acer_led_id_table);
-- 
2.28.0

