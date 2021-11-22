Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94DA0458C43
	for <lists+linux-leds@lfdr.de>; Mon, 22 Nov 2021 11:30:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236289AbhKVKeE (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 22 Nov 2021 05:34:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236184AbhKVKeE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 22 Nov 2021 05:34:04 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD69DC061574
        for <linux-leds@vger.kernel.org>; Mon, 22 Nov 2021 02:30:57 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id b40so78559053lfv.10
        for <linux-leds@vger.kernel.org>; Mon, 22 Nov 2021 02:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7YAPEoMAt+GH+aD0jbwJ0nl1TxsdCrLIfJeBuGFbQas=;
        b=h77sYrIxVnKs+RtgqF6+KmvxB7rQs2ZkkkfJBBD8sIFYHtb5J9VDvMhsy2MkttnUP+
         LR4J+OnSjQD4YGcYUhB44+JziNkiMHQuULcT+dQR6i2GY8gfKPQw75UBZoTFNKqUBgpq
         UkYkvjj5N3ApVWt6c/m1QMw43KvX5h5cfVeMGYIEopLbAF3xsiCns7fSUOnjqP/Stbem
         7CLtLvG578aYRuVf6TkdX7cTA5hP0Zyx8Ytkg463CsBxLV54NfLzq9AlfvHKCjG53g5i
         hQhA8YvgRYa1DqwHWwH89rkwcx+9OZIlGi17/WNc76fLBf3ogTYKaEjM9e1oaBRod7uh
         PDLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7YAPEoMAt+GH+aD0jbwJ0nl1TxsdCrLIfJeBuGFbQas=;
        b=qrUVT10peofJmS//aVOYiI0qNrVeV2ofLuh86tfB0QGhiIMTThV9WHIancyC63JmxH
         +8bGkWMrNKp60Ziqk0WixQt6ONn5hBQBybnFU4K2jZqAnPnQEH0gQ2evuEtvT50/K044
         m0/Be36Ach4kZir1zZ8XCtVBM0/rCX7WU4JFaKB44Awr2IbNre4yMdmNEOE5VnUuNcU5
         mTxVW/qeOyBmB5AleRXT4II2ozxGAEy0kP6beQtk0Hr0Vxv8THt6fUOZ3R/USMBSqjqs
         bjhUR08hC0zXyFhL63Q0r3D7hDYWi6pMpVJiGMHxnfoq9bqlXbjfsO2EitHRVr5+5gGO
         mn/g==
X-Gm-Message-State: AOAM531hfJiZoyVgET+xmrH5sqjlc4H5lcaSPHpGn5EI2I8sA0JoRFig
        t+FSjoit6FaRbTyt3JtDaLBAsA==
X-Google-Smtp-Source: ABdhPJwGI7+ItO7uxuAxV5tvZB91oqiOCC9Flt3bDi05yt/JYAdJx2wT9Uxe+XrvzYrZPzJiy7qMLg==
X-Received: by 2002:ac2:5d67:: with SMTP id h7mr54721891lft.493.1637577056117;
        Mon, 22 Nov 2021 02:30:56 -0800 (PST)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id d23sm912585lfj.263.2021.11.22.02.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 02:30:55 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     linux-leds@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        =?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>,
        Rod Whitby <rod@whitby.id.au>
Subject: [PATCH] leds: leds-fsg: Drop FSG3 LED driver
Date:   Mon, 22 Nov 2021 11:28:51 +0100
Message-Id: <20211122102851.3139238-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The board file using this driver has been deleted and the
FSG3 LEDs can be modeled using a system controller and some
register bit LEDs in the device tree so this driver is no
longer needed.

Reported-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Krzysztof Hałasa <khalasa@piap.pl>
Cc: Rod Whitby <rod@whitby.id.au>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/leds/Kconfig    |   7 --
 drivers/leds/Makefile   |   1 -
 drivers/leds/leds-fsg.c | 193 ----------------------------------------
 3 files changed, 201 deletions(-)
 delete mode 100644 drivers/leds/leds-fsg.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index ed800f5da7d8..c262ee445349 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -260,13 +260,6 @@ config LEDS_NET48XX
 	  This option enables support for the Soekris net4801 and net4826 error
 	  LED.
 
-config LEDS_FSG
-	tristate "LED Support for the Freecom FSG-3"
-	depends on LEDS_CLASS
-	depends on MACH_FSG
-	help
-	  This option enables support for the LEDs on the Freecom FSG-3.
-
 config LEDS_WRAP
 	tristate "LED Support for the WRAP series LEDs"
 	depends on LEDS_CLASS
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index c636ec069612..36506bddcc30 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -26,7 +26,6 @@ obj-$(CONFIG_LEDS_COBALT_RAQ)		+= leds-cobalt-raq.o
 obj-$(CONFIG_LEDS_CPCAP)		+= leds-cpcap.o
 obj-$(CONFIG_LEDS_DA903X)		+= leds-da903x.o
 obj-$(CONFIG_LEDS_DA9052)		+= leds-da9052.o
-obj-$(CONFIG_LEDS_FSG)			+= leds-fsg.o
 obj-$(CONFIG_LEDS_GPIO)			+= leds-gpio.o
 obj-$(CONFIG_LEDS_GPIO_REGISTER)	+= leds-gpio-register.o
 obj-$(CONFIG_LEDS_HP6XX)		+= leds-hp6xx.o
diff --git a/drivers/leds/leds-fsg.c b/drivers/leds/leds-fsg.c
deleted file mode 100644
index bc6b420637d6..000000000000
--- a/drivers/leds/leds-fsg.c
+++ /dev/null
@@ -1,193 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * LED Driver for the Freecom FSG-3
- *
- * Copyright (c) 2008 Rod Whitby <rod@whitby.id.au>
- *
- * Author: Rod Whitby <rod@whitby.id.au>
- *
- * Based on leds-spitz.c
- * Copyright 2005-2006 Openedhand Ltd.
- * Author: Richard Purdie <rpurdie@openedhand.com>
- */
-
-#include <linux/kernel.h>
-#include <linux/platform_device.h>
-#include <linux/leds.h>
-#include <linux/module.h>
-#include <linux/io.h>
-#include <mach/hardware.h>
-
-#define FSG_LED_WLAN_BIT	0
-#define FSG_LED_WAN_BIT		1
-#define FSG_LED_SATA_BIT	2
-#define FSG_LED_USB_BIT		4
-#define FSG_LED_RING_BIT	5
-#define FSG_LED_SYNC_BIT	7
-
-static short __iomem *latch_address;
-static unsigned short latch_value;
-
-
-static void fsg_led_wlan_set(struct led_classdev *led_cdev,
-			     enum led_brightness value)
-{
-	if (value) {
-		latch_value &= ~(1 << FSG_LED_WLAN_BIT);
-		*latch_address = latch_value;
-	} else {
-		latch_value |=  (1 << FSG_LED_WLAN_BIT);
-		*latch_address = latch_value;
-	}
-}
-
-static void fsg_led_wan_set(struct led_classdev *led_cdev,
-			    enum led_brightness value)
-{
-	if (value) {
-		latch_value &= ~(1 << FSG_LED_WAN_BIT);
-		*latch_address = latch_value;
-	} else {
-		latch_value |=  (1 << FSG_LED_WAN_BIT);
-		*latch_address = latch_value;
-	}
-}
-
-static void fsg_led_sata_set(struct led_classdev *led_cdev,
-			     enum led_brightness value)
-{
-	if (value) {
-		latch_value &= ~(1 << FSG_LED_SATA_BIT);
-		*latch_address = latch_value;
-	} else {
-		latch_value |=  (1 << FSG_LED_SATA_BIT);
-		*latch_address = latch_value;
-	}
-}
-
-static void fsg_led_usb_set(struct led_classdev *led_cdev,
-			    enum led_brightness value)
-{
-	if (value) {
-		latch_value &= ~(1 << FSG_LED_USB_BIT);
-		*latch_address = latch_value;
-	} else {
-		latch_value |=  (1 << FSG_LED_USB_BIT);
-		*latch_address = latch_value;
-	}
-}
-
-static void fsg_led_sync_set(struct led_classdev *led_cdev,
-			     enum led_brightness value)
-{
-	if (value) {
-		latch_value &= ~(1 << FSG_LED_SYNC_BIT);
-		*latch_address = latch_value;
-	} else {
-		latch_value |=  (1 << FSG_LED_SYNC_BIT);
-		*latch_address = latch_value;
-	}
-}
-
-static void fsg_led_ring_set(struct led_classdev *led_cdev,
-			     enum led_brightness value)
-{
-	if (value) {
-		latch_value &= ~(1 << FSG_LED_RING_BIT);
-		*latch_address = latch_value;
-	} else {
-		latch_value |=  (1 << FSG_LED_RING_BIT);
-		*latch_address = latch_value;
-	}
-}
-
-
-static struct led_classdev fsg_wlan_led = {
-	.name			= "fsg:blue:wlan",
-	.brightness_set		= fsg_led_wlan_set,
-	.flags			= LED_CORE_SUSPENDRESUME,
-};
-
-static struct led_classdev fsg_wan_led = {
-	.name			= "fsg:blue:wan",
-	.brightness_set		= fsg_led_wan_set,
-	.flags			= LED_CORE_SUSPENDRESUME,
-};
-
-static struct led_classdev fsg_sata_led = {
-	.name			= "fsg:blue:sata",
-	.brightness_set		= fsg_led_sata_set,
-	.flags			= LED_CORE_SUSPENDRESUME,
-};
-
-static struct led_classdev fsg_usb_led = {
-	.name			= "fsg:blue:usb",
-	.brightness_set		= fsg_led_usb_set,
-	.flags			= LED_CORE_SUSPENDRESUME,
-};
-
-static struct led_classdev fsg_sync_led = {
-	.name			= "fsg:blue:sync",
-	.brightness_set		= fsg_led_sync_set,
-	.flags			= LED_CORE_SUSPENDRESUME,
-};
-
-static struct led_classdev fsg_ring_led = {
-	.name			= "fsg:blue:ring",
-	.brightness_set		= fsg_led_ring_set,
-	.flags			= LED_CORE_SUSPENDRESUME,
-};
-
-
-static int fsg_led_probe(struct platform_device *pdev)
-{
-	int ret;
-
-	/* Map the LED chip select address space */
-	latch_address = (unsigned short *) devm_ioremap(&pdev->dev,
-						IXP4XX_EXP_BUS_BASE(2), 512);
-	if (!latch_address)
-		return -ENOMEM;
-
-	latch_value = 0xffff;
-	*latch_address = latch_value;
-
-	ret = devm_led_classdev_register(&pdev->dev, &fsg_wlan_led);
-	if (ret < 0)
-		return ret;
-
-	ret = devm_led_classdev_register(&pdev->dev, &fsg_wan_led);
-	if (ret < 0)
-		return ret;
-
-	ret = devm_led_classdev_register(&pdev->dev, &fsg_sata_led);
-	if (ret < 0)
-		return ret;
-
-	ret = devm_led_classdev_register(&pdev->dev, &fsg_usb_led);
-	if (ret < 0)
-		return ret;
-
-	ret = devm_led_classdev_register(&pdev->dev, &fsg_sync_led);
-	if (ret < 0)
-		return ret;
-
-	ret = devm_led_classdev_register(&pdev->dev, &fsg_ring_led);
-	if (ret < 0)
-		return ret;
-
-	return ret;
-}
-
-static struct platform_driver fsg_led_driver = {
-	.probe		= fsg_led_probe,
-	.driver		= {
-		.name		= "fsg-led",
-	},
-};
-
-module_platform_driver(fsg_led_driver);
-
-MODULE_AUTHOR("Rod Whitby <rod@whitby.id.au>");
-MODULE_DESCRIPTION("Freecom FSG-3 LED driver");
-MODULE_LICENSE("GPL");
-- 
2.31.1

