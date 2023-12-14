Return-Path: <linux-leds+bounces-415-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEAB813A27
	for <lists+linux-leds@lfdr.de>; Thu, 14 Dec 2023 19:41:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F1151F214A1
	for <lists+linux-leds@lfdr.de>; Thu, 14 Dec 2023 18:41:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4CC560B84;
	Thu, 14 Dec 2023 18:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H7MHMM6/"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ED46111;
	Thu, 14 Dec 2023 10:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702579260; x=1734115260;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tzobM1VNBQfa71tbk5guQU+1z1I5o1Ve5XDjWlrKIeY=;
  b=H7MHMM6/7Qck/xw8bbwtm4m2q0mfAbrb+FobfXH3FajSTLlx1B+tZI9e
   foRfZqGuQDQwcOC8Y0uY/N4PrHYAVHmlL8YbbvfMjWw5Ebkqw8eBHrMxU
   oCTOmJ6wdUYlIyLMyOa4VMY6TAIuQGsqJU2jyJFfbhgeb2n/laJZ++F5r
   hRqFs1LwTeEBFKpijS6MJQrXWWM7X3LGSi496PPNEkvURY4kUJZWzSXjn
   8ox0lDF8zAXYdrV0YFZseb7ndmSfOsoQVRBw3hAsqxXXDLa2p2ggjU8X7
   dwjiuMD4TX8UZe2aFIv42xa+ErUAkx5IpNQnS75+JF47Y8Vzh9/E/lmYZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="385582275"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; 
   d="scan'208";a="385582275"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 10:40:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="840374565"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; 
   d="scan'208";a="840374565"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 14 Dec 2023 10:40:56 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 2BCD23AE; Thu, 14 Dec 2023 20:40:53 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>
Subject: [PATCH v1 2/4] leds: max5970: Make use of device properties
Date: Thu, 14 Dec 2023 20:40:09 +0200
Message-ID: <20231214184050.1272848-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231214184050.1272848-1-andriy.shevchenko@linux.intel.com>
References: <20231214184050.1272848-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the module to be property provider agnostic and allow
it to be used on non-OF platforms.

Add mod_devicetable.h include.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/leds/leds-max5970.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/leds/leds-max5970.c b/drivers/leds/leds-max5970.c
index 7959d079ae94..de57b385b4f6 100644
--- a/drivers/leds/leds-max5970.c
+++ b/drivers/leds/leds-max5970.c
@@ -9,8 +9,9 @@
 
 #include <linux/leds.h>
 #include <linux/mfd/max5970.h>
-#include <linux/of.h>
+#include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 
 #define ldev_to_maxled(c)       container_of(c, struct max5970_led, cdev)
@@ -40,25 +41,24 @@ static int max5970_led_set_brightness(struct led_classdev *cdev,
 
 static int max5970_led_probe(struct platform_device *pdev)
 {
+	struct fwnode_handle *led_node, *child;
 	struct device *dev = &pdev->dev;
-	struct device_node *np = dev_of_node(dev->parent);
 	struct regmap *regmap;
-	struct device_node *led_node, *child;
 	struct max5970_led *ddata;
 	int ret = -ENODEV;
 
-	regmap = dev_get_regmap(pdev->dev.parent, NULL);
+	regmap = dev_get_regmap(dev->parent, NULL);
 	if (!regmap)
 		return -ENODEV;
 
-	led_node = of_get_child_by_name(np, "leds");
+	led_node = device_get_named_child_node(dev->parent, "leds");
 	if (!led_node)
 		return -ENODEV;
 
-	for_each_available_child_of_node(led_node, child) {
+	fwnode_for_each_available_child_node(led_node, child) {
 		u32 reg;
 
-		if (of_property_read_u32(child, "reg", &reg))
+		if (fwnode_property_read_u32(child, "reg", &reg))
 			continue;
 
 		if (reg >= MAX5970_NUM_LEDS) {
@@ -68,7 +68,7 @@ static int max5970_led_probe(struct platform_device *pdev)
 
 		ddata = devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
 		if (!ddata) {
-			of_node_put(child);
+			fwnode_handle_put(child);
 			return -ENOMEM;
 		}
 
@@ -76,8 +76,8 @@ static int max5970_led_probe(struct platform_device *pdev)
 		ddata->regmap = regmap;
 		ddata->dev = dev;
 
-		if (of_property_read_string(child, "label", &ddata->cdev.name))
-			ddata->cdev.name = child->name;
+		if (fwnode_property_read_string(child, "label", &ddata->cdev.name))
+			ddata->cdev.name = fwnode_get_name(child);
 
 		ddata->cdev.max_brightness = 1;
 		ddata->cdev.brightness_set_blocking = max5970_led_set_brightness;
@@ -85,7 +85,7 @@ static int max5970_led_probe(struct platform_device *pdev)
 
 		ret = devm_led_classdev_register(dev, &ddata->cdev);
 		if (ret < 0) {
-			of_node_put(child);
+			fwnode_handle_put(child);
 			dev_err(dev, "Failed to initialize LED %u\n", reg);
 			return ret;
 		}
@@ -100,8 +100,8 @@ static struct platform_driver max5970_led_driver = {
 	},
 	.probe = max5970_led_probe,
 };
-
 module_platform_driver(max5970_led_driver);
+
 MODULE_AUTHOR("Patrick Rudolph <patrick.rudolph@9elements.com>");
 MODULE_AUTHOR("Naresh Solanki <Naresh.Solanki@9elements.com>");
 MODULE_DESCRIPTION("MAX5970_hot-swap controller LED driver");
-- 
2.43.0.rc1.1.gbec44491f096


