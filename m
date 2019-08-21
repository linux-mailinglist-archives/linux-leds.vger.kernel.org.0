Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD46198041
	for <lists+linux-leds@lfdr.de>; Wed, 21 Aug 2019 18:36:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728984AbfHUQgV (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 21 Aug 2019 12:36:21 -0400
Received: from mga11.intel.com ([192.55.52.93]:4040 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728620AbfHUQgU (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 21 Aug 2019 12:36:20 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 Aug 2019 09:36:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,412,1559545200"; 
   d="scan'208";a="190251913"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 21 Aug 2019 09:36:18 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id ECD7A96; Wed, 21 Aug 2019 19:36:17 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/2] leds: max77650: Switch to fwnode property API
Date:   Wed, 21 Aug 2019 19:36:16 +0300
Message-Id: <20190821163617.33881-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Switch the max77650 from OF to the fwnode property API.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/leds/leds-max77650.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/leds/leds-max77650.c b/drivers/leds/leds-max77650.c
index 8a8e5c65b157..ae752ec150d9 100644
--- a/drivers/leds/leds-max77650.c
+++ b/drivers/leds/leds-max77650.c
@@ -62,7 +62,7 @@ static int max77650_led_brightness_set(struct led_classdev *cdev,
 
 static int max77650_led_probe(struct platform_device *pdev)
 {
-	struct device_node *of_node, *child;
+	struct fwnode_handle *child;
 	struct max77650_led *leds, *led;
 	struct device *dev;
 	struct regmap *map;
@@ -71,10 +71,6 @@ static int max77650_led_probe(struct platform_device *pdev)
 	u32 reg;
 
 	dev = &pdev->dev;
-	of_node = dev->of_node;
-
-	if (!of_node)
-		return -ENODEV;
 
 	leds = devm_kcalloc(dev, sizeof(*leds),
 			    MAX77650_LED_NUM_LEDS, GFP_KERNEL);
@@ -85,12 +81,12 @@ static int max77650_led_probe(struct platform_device *pdev)
 	if (!map)
 		return -ENODEV;
 
-	num_leds = of_get_child_count(of_node);
+	num_leds = device_get_child_node_count(dev);
 	if (!num_leds || num_leds > MAX77650_LED_NUM_LEDS)
 		return -ENODEV;
 
-	for_each_child_of_node(of_node, child) {
-		rv = of_property_read_u32(child, "reg", &reg);
+	device_for_each_child_node(dev, child) {
+		rv = fwnode_property_read_u32(child, "reg", &reg);
 		if (rv || reg >= MAX77650_LED_NUM_LEDS)
 			return -EINVAL;
 
@@ -101,8 +97,8 @@ static int max77650_led_probe(struct platform_device *pdev)
 		led->cdev.brightness_set_blocking = max77650_led_brightness_set;
 		led->cdev.max_brightness = MAX77650_LED_MAX_BRIGHTNESS;
 
-		label = of_get_property(child, "label", NULL);
-		if (!label) {
+		rv = fwnode_property_read_string(child, "label", &label);
+		if (rv) {
 			led->cdev.name = "max77650::";
 		} else {
 			led->cdev.name = devm_kasprintf(dev, GFP_KERNEL,
@@ -111,10 +107,10 @@ static int max77650_led_probe(struct platform_device *pdev)
 				return -ENOMEM;
 		}
 
-		of_property_read_string(child, "linux,default-trigger",
-					&led->cdev.default_trigger);
+		fwnode_property_read_string(child, "linux,default-trigger",
+					    &led->cdev.default_trigger);
 
-		rv = devm_of_led_classdev_register(dev, child, &led->cdev);
+		rv = devm_of_led_classdev_register(dev, to_of_node(child), &led->cdev);
 		if (rv)
 			return rv;
 
-- 
2.23.0.rc1

