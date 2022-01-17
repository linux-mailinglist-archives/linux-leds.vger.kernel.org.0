Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DAD2490DF9
	for <lists+linux-leds@lfdr.de>; Mon, 17 Jan 2022 18:06:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242190AbiAQRGh (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 17 Jan 2022 12:06:37 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:51154 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241455AbiAQRD1 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 17 Jan 2022 12:03:27 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DD443B8115E;
        Mon, 17 Jan 2022 17:03:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC6A0C36AE7;
        Mon, 17 Jan 2022 17:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642439003;
        bh=+8LHjSnLU29NpUoAB6JDaqx9NRAtjYj88z2wYDGDZ98=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ubneuKGySr44UXq1zsXhZhNHIRpgQ1Bu+9eEVxmOp1DjNSZzz34+kofOj0IQCyT9K
         xHW80jQI7w4Zj1XWTdBoGSU0Lgln6AuaaJvPR+WvR5bowwag3eZ1aKJAGo6NHHh4Ei
         yTqecMQTtJppCRK06daSCxui2qweKW6i2yTBUkRgbtD6gdIMkqRidO1PIclFGMiL2w
         2jZkm+E+V6sxsMaAlgGWkUbDFyPhvBs+09bqcLpIOpA0+eaRiUGRaQVb5arJcV9hfj
         FscqdscURXWFljZEXq0AjmCvGd+L1/ZdQ5NGk+4uR+DeA+iLQB7J8S+caMNUyrgLHz
         DEwpPobOnp09w==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        =?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>,
        Rod Whitby <rod@whitby.id.au>, Pavel Machek <pavel@ucw.cz>,
        Sasha Levin <sashal@kernel.org>, linux-leds@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 44/44] leds: leds-fsg: Drop FSG3 LED driver
Date:   Mon, 17 Jan 2022 12:01:27 -0500
Message-Id: <20220117170127.1471115-44-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220117170127.1471115-1-sashal@kernel.org>
References: <20220117170127.1471115-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Linus Walleij <linus.walleij@linaro.org>

[ Upstream commit b7f1ac9bb6413b739ea91bd61bdf23c9130a8007 ]

The board file using this driver has been deleted and the
FSG3 LEDs can be modeled using a system controller and some
register bit LEDs in the device tree so this driver is no
longer needed.

Reported-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Krzysztof Hałasa <khalasa@piap.pl>
Cc: Rod Whitby <rod@whitby.id.au>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/leds/Kconfig    |   7 --
 drivers/leds/Makefile   |   1 -
 drivers/leds/leds-fsg.c | 193 ----------------------------------------
 3 files changed, 201 deletions(-)
 delete mode 100644 drivers/leds/leds-fsg.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index ed800f5da7d88..c262ee4453494 100644
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
index c636ec069612d..36506bddcc303 100644
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
index bc6b420637d61..0000000000000
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
2.34.1

