Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5D9731CD46
	for <lists+linux-leds@lfdr.de>; Tue, 16 Feb 2021 16:54:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229916AbhBPPyR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 16 Feb 2021 10:54:17 -0500
Received: from mga03.intel.com ([134.134.136.65]:56586 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229585AbhBPPyL (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 16 Feb 2021 10:54:11 -0500
IronPort-SDR: nczbWbgtJppHhkovBM4nEkuUlpQeV1BxXcFhqigf24p3BEgw3bS2/Qyha5vSBsa7Tw7jwN2IeY
 JcxvTNxm539g==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="182993768"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="182993768"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 07:51:01 -0800
IronPort-SDR: ibXDlAKLdROqB+hyM/gkpKKM650rV2hYphsAlXM26EhhXth16q5htTXHqmhc5McMLeh2zWI4sl
 fa0Q4MZLnvTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="580539164"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 16 Feb 2021 07:51:00 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 3A0EF220; Tue, 16 Feb 2021 17:50:59 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>
Subject: [PATCH v1 3/7] leds: lp50xx: Reduce level of dereferences
Date:   Tue, 16 Feb 2021 17:50:46 +0200
Message-Id: <20210216155050.29322-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210216155050.29322-1-andriy.shevchenko@linux.intel.com>
References: <20210216155050.29322-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The priv->dev is effectively the same as &priv->client->dev.
So, drop the latter for the former.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/leds/leds-lp50xx.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
index 19aec80e527a..0723b2688552 100644
--- a/drivers/leds/leds-lp50xx.c
+++ b/drivers/leds/leds-lp50xx.c
@@ -322,7 +322,7 @@ static int lp50xx_brightness_set(struct led_classdev *cdev,
 
 	ret = regmap_write(led->priv->regmap, reg_val, brightness);
 	if (ret) {
-		dev_err(&led->priv->client->dev,
+		dev_err(led->priv->dev,
 			"Cannot write brightness value %d\n", ret);
 		goto out;
 	}
@@ -338,7 +338,7 @@ static int lp50xx_brightness_set(struct led_classdev *cdev,
 		ret = regmap_write(led->priv->regmap, reg_val,
 				   mc_dev->subled_info[i].intensity);
 		if (ret) {
-			dev_err(&led->priv->client->dev,
+			dev_err(led->priv->dev,
 				"Cannot write intensity value %d\n", ret);
 			goto out;
 		}
@@ -404,7 +404,7 @@ static int lp50xx_probe_leds(struct fwnode_handle *child, struct lp50xx *priv,
 
 	if (num_leds > 1) {
 		if (num_leds > priv->chip_info->max_modules) {
-			dev_err(&priv->client->dev, "reg property is invalid\n");
+			dev_err(priv->dev, "reg property is invalid\n");
 			return -EINVAL;
 		}
 
@@ -412,13 +412,13 @@ static int lp50xx_probe_leds(struct fwnode_handle *child, struct lp50xx *priv,
 
 		ret = fwnode_property_read_u32_array(child, "reg", led_banks, num_leds);
 		if (ret) {
-			dev_err(&priv->client->dev, "reg property is missing\n");
+			dev_err(priv->dev, "reg property is missing\n");
 			return ret;
 		}
 
 		ret = lp50xx_set_banks(priv, led_banks);
 		if (ret) {
-			dev_err(&priv->client->dev, "Cannot setup banked LEDs\n");
+			dev_err(priv->dev, "Cannot setup banked LEDs\n");
 			return ret;
 		}
 
@@ -426,12 +426,12 @@ static int lp50xx_probe_leds(struct fwnode_handle *child, struct lp50xx *priv,
 	} else {
 		ret = fwnode_property_read_u32(child, "reg", &led_number);
 		if (ret) {
-			dev_err(&priv->client->dev, "led reg property missing\n");
+			dev_err(priv->dev, "led reg property missing\n");
 			return ret;
 		}
 
 		if (led_number > priv->chip_info->num_leds) {
-			dev_err(&priv->client->dev, "led-sources property is invalid\n");
+			dev_err(priv->dev, "led-sources property is invalid\n");
 			return -EINVAL;
 		}
 
@@ -467,7 +467,7 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
 		led = &priv->leds[i];
 		ret = fwnode_property_count_u32(child, "reg");
 		if (ret < 0) {
-			dev_err(&priv->client->dev, "reg property is invalid\n");
+			dev_err(priv->dev, "reg property is invalid\n");
 			goto child_out;
 		}
 
@@ -507,12 +507,11 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
 		led_cdev = &led->mc_cdev.led_cdev;
 		led_cdev->brightness_set_blocking = lp50xx_brightness_set;
 
-		ret = devm_led_classdev_multicolor_register_ext(&priv->client->dev,
+		ret = devm_led_classdev_multicolor_register_ext(priv->dev,
 						       &led->mc_cdev,
 						       &init_data);
 		if (ret) {
-			dev_err(&priv->client->dev, "led register err: %d\n",
-				ret);
+			dev_err(priv->dev, "led register err: %d\n", ret);
 			goto child_out;
 		}
 		i++;
@@ -575,15 +574,14 @@ static int lp50xx_remove(struct i2c_client *client)
 
 	ret = lp50xx_enable_disable(led, 0);
 	if (ret) {
-		dev_err(&led->client->dev, "Failed to disable chip\n");
+		dev_err(led->dev, "Failed to disable chip\n");
 		return ret;
 	}
 
 	if (led->regulator) {
 		ret = regulator_disable(led->regulator);
 		if (ret)
-			dev_err(&led->client->dev,
-				"Failed to disable regulator\n");
+			dev_err(led->dev, "Failed to disable regulator\n");
 	}
 
 	mutex_destroy(&led->lock);
-- 
2.30.0

