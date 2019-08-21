Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C994398119
	for <lists+linux-leds@lfdr.de>; Wed, 21 Aug 2019 19:17:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729318AbfHURRb (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 21 Aug 2019 13:17:31 -0400
Received: from mga06.intel.com ([134.134.136.31]:16561 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726330AbfHURRb (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 21 Aug 2019 13:17:31 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 Aug 2019 10:17:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,412,1559545200"; 
   d="scan'208";a="181092239"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 21 Aug 2019 10:17:29 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 71DBB96; Wed, 21 Aug 2019 20:17:28 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/2] leds: trigger: gpio: GPIO 0 is valid
Date:   Wed, 21 Aug 2019 20:17:26 +0300
Message-Id: <20190821171727.87886-1-andriy.shevchenko@linux.intel.com>
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
 drivers/leds/trigger/ledtrig-gpio.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-gpio.c b/drivers/leds/trigger/ledtrig-gpio.c
index 33cc99a1a16a..31f456dd4417 100644
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
@@ -181,7 +181,7 @@ static void gpio_trig_deactivate(struct led_classdev *led)
 {
 	struct gpio_trig_data *gpio_data = led_get_trigger_data(led);
 
-	if (gpio_data->gpio != 0)
+	if (gpio_is_valid(gpio_data->gpio))
 		free_irq(gpio_to_irq(gpio_data->gpio), led);
 	kfree(gpio_data);
 }
-- 
2.23.0.rc1

