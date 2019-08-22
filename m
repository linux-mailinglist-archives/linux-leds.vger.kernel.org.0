Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CB54997FD
	for <lists+linux-leds@lfdr.de>; Thu, 22 Aug 2019 17:20:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388777AbfHVPTc (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 22 Aug 2019 11:19:32 -0400
Received: from mga11.intel.com ([192.55.52.93]:65233 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389528AbfHVPTc (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 22 Aug 2019 11:19:32 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 Aug 2019 08:19:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,417,1559545200"; 
   d="scan'208";a="181415314"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 22 Aug 2019 08:19:30 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 3002D96; Thu, 22 Aug 2019 18:19:29 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 1/2] leds: max77650: Switch to fwnode property API
Date:   Thu, 22 Aug 2019 18:19:27 +0300
Message-Id: <20190822151928.51274-1-andriy.shevchenko@linux.intel.com>
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
index 5a14f9775b0e..4c2d0b3c6dad 100644
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
 		if (rv || reg >= MAX77650_LED_NUM_LEDS) {
 			rv = -EINVAL;
 			goto err_node_put;
@@ -103,8 +99,8 @@ static int max77650_led_probe(struct platform_device *pdev)
 		led->cdev.brightness_set_blocking = max77650_led_brightness_set;
 		led->cdev.max_brightness = MAX77650_LED_MAX_BRIGHTNESS;
 
-		label = of_get_property(child, "label", NULL);
-		if (!label) {
+		rv = fwnode_property_read_string(child, "label", &label);
+		if (rv) {
 			led->cdev.name = "max77650::";
 		} else {
 			led->cdev.name = devm_kasprintf(dev, GFP_KERNEL,
@@ -115,8 +111,8 @@ static int max77650_led_probe(struct platform_device *pdev)
 			}
 		}
 
-		of_property_read_string(child, "linux,default-trigger",
-					&led->cdev.default_trigger);
+		fwnode_property_read_string(child, "linux,default-trigger",
+					    &led->cdev.default_trigger);
 
 		rv = devm_led_classdev_register(dev, &led->cdev);
 		if (rv)
@@ -135,7 +131,7 @@ static int max77650_led_probe(struct platform_device *pdev)
 			    MAX77650_REG_CNFG_LED_TOP,
 			    MAX77650_LED_TOP_DEFAULT);
 err_node_put:
-	of_node_put(child);
+	fwnode_handle_put(child);
 	return rv;
 }
 
-- 
2.23.0.rc1

