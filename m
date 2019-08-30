Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B768A39E7
	for <lists+linux-leds@lfdr.de>; Fri, 30 Aug 2019 17:08:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727809AbfH3PIY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 30 Aug 2019 11:08:24 -0400
Received: from mga17.intel.com ([192.55.52.151]:25478 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727603AbfH3PIY (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 30 Aug 2019 11:08:24 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Aug 2019 08:08:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,447,1559545200"; 
   d="scan'208";a="265345408"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 30 Aug 2019 08:08:22 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 60F7743; Fri, 30 Aug 2019 18:08:21 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 2/2] leds: trigger: gpio: Convert to use kstrtox()
Date:   Fri, 30 Aug 2019 18:08:20 +0300
Message-Id: <20190830150820.63450-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20190830150820.63450-1-andriy.shevchenko@linux.intel.com>
References: <20190830150820.63450-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

sscanf() is a heavy one and moreover requires additional boundary checks.
Convert driver to use kstrtox() and replace kstrtoul() by kstrtobool()
in gpio_trig_inverted_store().

While here, check the desired brightness against maximum defined for
a certain LED.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
- check against max_brightness (Jacek)
 drivers/leds/trigger/ledtrig-gpio.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-gpio.c b/drivers/leds/trigger/ledtrig-gpio.c
index dc64679b1a92..2d70c35588cb 100644
--- a/drivers/leds/trigger/ledtrig-gpio.c
+++ b/drivers/leds/trigger/ledtrig-gpio.c
@@ -60,10 +60,10 @@ static ssize_t gpio_trig_brightness_store(struct device *dev,
 	unsigned desired_brightness;
 	int ret;
 
-	ret = sscanf(buf, "%u", &desired_brightness);
-	if (ret < 1 || desired_brightness > 255) {
+	ret = kstrtouint(buf, 10, &desired_brightness);
+	if (ret || desired_brightness > gpio_data->led->max_brightness) {
 		dev_err(dev, "invalid value\n");
-		return -EINVAL;
+		return ret ? ret : -EINVAL;
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

