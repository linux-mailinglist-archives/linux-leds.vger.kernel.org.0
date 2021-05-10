Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C028D378036
	for <lists+linux-leds@lfdr.de>; Mon, 10 May 2021 11:52:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231280AbhEJJw7 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 10 May 2021 05:52:59 -0400
Received: from fgw22-7.mail.saunalahti.fi ([62.142.5.83]:17626 "EHLO
        fgw22-7.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231187AbhEJJwg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Mon, 10 May 2021 05:52:36 -0400
Received: from localhost (88-115-248-186.elisa-laajakaista.fi [88.115.248.186])
        by fgw22.mail.saunalahti.fi (Halon) with ESMTP
        id 44ff04ed-b175-11eb-88cb-005056bdf889;
        Mon, 10 May 2021 12:51:19 +0300 (EEST)
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Pavel Machek <pavel@ucw.cz>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Amireddy Mallikarjuna reddy 
        <mallikarjunax.reddy@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        Abanoub Sameh <abanoubsameh8@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v1 25/28] leds: lt3593: Make use of device properties
Date:   Mon, 10 May 2021 12:50:42 +0300
Message-Id: <20210510095045.3299382-26-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
References: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Device property API allows to gather device resources from different sources,
such as ACPI. Convert the driver to unleash the power of device property API.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/leds/Kconfig       | 1 -
 drivers/leds/leds-lt3593.c | 8 +++-----
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index e3ee3c34d535..9ab706d5ded7 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -616,7 +616,6 @@ config LEDS_LT3593
 	tristate "LED driver for LT3593 controllers"
 	depends on LEDS_CLASS
 	depends on GPIOLIB || COMPILE_TEST
-	depends on OF
 	help
 	  This option enables support for LEDs driven by a Linear Technology
 	  LT3593 controller. This controller uses a special one-wire pulse
diff --git a/drivers/leds/leds-lt3593.c b/drivers/leds/leds-lt3593.c
index 7dab08773a34..d0160fde0f94 100644
--- a/drivers/leds/leds-lt3593.c
+++ b/drivers/leds/leds-lt3593.c
@@ -7,8 +7,9 @@
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/slab.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
+#include <linux/property.h>
 
 #define LED_LT3593_NAME "lt3593"
 
@@ -68,9 +69,6 @@ static int lt3593_led_probe(struct platform_device *pdev)
 	struct led_init_data init_data = {};
 	const char *tmp;
 
-	if (!dev_of_node(dev))
-		return -ENODEV;
-
 	led_data = devm_kzalloc(dev, sizeof(*led_data), GFP_KERNEL);
 	if (!led_data)
 		return -ENOMEM;
@@ -118,7 +116,7 @@ static struct platform_driver lt3593_led_driver = {
 	.probe		= lt3593_led_probe,
 	.driver		= {
 		.name	= "leds-lt3593",
-		.of_match_table = of_match_ptr(of_lt3593_leds_match),
+		.of_match_table = of_lt3593_leds_match,
 	},
 };
 
-- 
2.31.1

