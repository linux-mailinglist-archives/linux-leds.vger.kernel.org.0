Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1644DA39E8
	for <lists+linux-leds@lfdr.de>; Fri, 30 Aug 2019 17:08:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727820AbfH3PIZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 30 Aug 2019 11:08:25 -0400
Received: from mga07.intel.com ([134.134.136.100]:64119 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727603AbfH3PIZ (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 30 Aug 2019 11:08:25 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Aug 2019 08:08:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,447,1559545200"; 
   d="scan'208";a="332882469"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 30 Aug 2019 08:08:22 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 55FA810B; Fri, 30 Aug 2019 18:08:21 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 1/2] leds: trigger: gpio: GPIO 0 is valid
Date:   Fri, 30 Aug 2019 18:08:19 +0300
Message-Id: <20190830150820.63450-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Allow all valid GPIOs to be used in the driver.

Fixes: 17354bfe8527 ("leds: Add gpio-led trigger")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
- set initial GPIO value to -ENOENT (Jacek)
 drivers/leds/trigger/ledtrig-gpio.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-gpio.c b/drivers/leds/trigger/ledtrig-gpio.c
index 33cc99a1a16a..dc64679b1a92 100644
--- a/drivers/leds/trigger/ledtrig-gpio.c
+++ b/drivers/leds/trigger/ledtrig-gpio.c
@@ -131,10 +131,10 @@ static ssize_t gpio_trig_gpio_store(struct device *dev,
 	if (gpio_data->gpio == gpio)
 		return n;
 
-	if (!gpio) {
-		if (gpio_data->gpio != 0)
+	if (!gpio_is_valid(gpio)) {
+		if (gpio_is_valid(gpio_data->gpio))
 			free_irq(gpio_to_irq(gpio_data->gpio), led);
-		gpio_data->gpio = 0;
+		gpio_data->gpio = gpio;
 		return n;
 	}
 
@@ -144,7 +144,7 @@ static ssize_t gpio_trig_gpio_store(struct device *dev,
 	if (ret) {
 		dev_err(dev, "request_irq failed with error %d\n", ret);
 	} else {
-		if (gpio_data->gpio != 0)
+		if (gpio_is_valid(gpio_data->gpio))
 			free_irq(gpio_to_irq(gpio_data->gpio), led);
 		gpio_data->gpio = gpio;
 		/* After changing the GPIO, we need to update the LED. */
@@ -172,6 +172,8 @@ static int gpio_trig_activate(struct led_classdev *led)
 		return -ENOMEM;
 
 	gpio_data->led = led;
+	gpio_data->gpio = -ENOENT;
+
 	led_set_trigger_data(led, gpio_data);
 
 	return 0;
@@ -181,7 +183,7 @@ static void gpio_trig_deactivate(struct led_classdev *led)
 {
 	struct gpio_trig_data *gpio_data = led_get_trigger_data(led);
 
-	if (gpio_data->gpio != 0)
+	if (gpio_is_valid(gpio_data->gpio))
 		free_irq(gpio_to_irq(gpio_data->gpio), led);
 	kfree(gpio_data);
 }
-- 
2.23.0.rc1

