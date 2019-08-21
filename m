Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4878C9811A
	for <lists+linux-leds@lfdr.de>; Wed, 21 Aug 2019 19:17:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726330AbfHURRb (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 21 Aug 2019 13:17:31 -0400
Received: from mga06.intel.com ([134.134.136.31]:16561 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729309AbfHURRb (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 21 Aug 2019 13:17:31 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 Aug 2019 10:17:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,412,1559545200"; 
   d="scan'208";a="330085235"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 21 Aug 2019 10:17:29 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 7FDA973; Wed, 21 Aug 2019 20:17:28 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/2] leds: trigger: gpio: Convert to use kstrtox()
Date:   Wed, 21 Aug 2019 20:17:27 +0300
Message-Id: <20190821171727.87886-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20190821171727.87886-1-andriy.shevchenko@linux.intel.com>
References: <20190821171727.87886-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

sscanf() is a heavy one and moreover requires additional boundary checks.
Convert driver to use kstrtox() and replace kstrtoul() by kstrtobool() in
gpio_trig_inverted_store()

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/leds/trigger/ledtrig-gpio.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-gpio.c b/drivers/leds/trigger/ledtrig-gpio.c
index 31f456dd4417..b01862b94c99 100644
--- a/drivers/leds/trigger/ledtrig-gpio.c
+++ b/drivers/leds/trigger/ledtrig-gpio.c
@@ -57,13 +57,13 @@ static ssize_t gpio_trig_brightness_store(struct device *dev,
 		struct device_attribute *attr, const char *buf, size_t n)
 {
 	struct gpio_trig_data *gpio_data = led_trigger_get_drvdata(dev);
-	unsigned desired_brightness;
+	u8 desired_brightness;
 	int ret;
 
-	ret = sscanf(buf, "%u", &desired_brightness);
-	if (ret < 1 || desired_brightness > 255) {
+	ret = kstrtou8(buf, 10, &desired_brightness);
+	if (ret) {
 		dev_err(dev, "invalid value\n");
-		return -EINVAL;
+		return ret;
 	}
 
 	gpio_data->desired_brightness = desired_brightness;
@@ -86,16 +86,13 @@ static ssize_t gpio_trig_inverted_store(struct device *dev,
 {
 	struct led_classdev *led = led_trigger_get_led(dev);
 	struct gpio_trig_data *gpio_data = led_trigger_get_drvdata(dev);
-	unsigned long inverted;
+	bool inverted;
 	int ret;
 
-	ret = kstrtoul(buf, 10, &inverted);
-	if (ret < 0)
+	ret = kstrtobool(buf, &inverted);
+	if (ret)
 		return ret;
 
-	if (inverted > 1)
-		return -EINVAL;
-
 	gpio_data->inverted = inverted;
 
 	/* After inverting, we need to update the LED. */
@@ -122,10 +119,10 @@ static ssize_t gpio_trig_gpio_store(struct device *dev,
 	unsigned gpio;
 	int ret;
 
-	ret = sscanf(buf, "%u", &gpio);
-	if (ret < 1) {
+	ret = kstrtouint(buf, 10, &gpio);
+	if (ret) {
 		dev_err(dev, "couldn't read gpio number\n");
-		return -EINVAL;
+		return ret;
 	}
 
 	if (gpio_data->gpio == gpio)
-- 
2.23.0.rc1

