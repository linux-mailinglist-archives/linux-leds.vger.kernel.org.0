Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E39BC26E8D2
	for <lists+linux-leds@lfdr.de>; Fri, 18 Sep 2020 00:36:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726792AbgIQWgE (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 17 Sep 2020 18:36:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726291AbgIQWeL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 17 Sep 2020 18:34:11 -0400
Received: from mail.nic.cz (lists.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10697C061353;
        Thu, 17 Sep 2020 15:34:00 -0700 (PDT)
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 5E9ED142047;
        Fri, 18 Sep 2020 00:33:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600382038; bh=kO27Fg+MT9zBd6Q8cGBkhOm5D9hO6342LpulPUFWOrU=;
        h=From:To:Date;
        b=LrvDsyzICRwXELJouQWHAIZXygws0xakvJ1Ff2KVswHb5exzPdpycx3OmUhD+/vJI
         7qJXYNHa+QQ3B4/FsaEaaWANsB63UiYYh7q1F3JfiyIFib3H8UonUPMcUfsjDetWJ+
         hAf+sbokYYuv72YfaQ4+DNWQOj8Xwa4F/Bx2aANA=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megous@megous.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Grant Feng <von81@163.com>
Subject: [PATCH leds v2 28/50] leds: is31fl319x: refactor to register LEDs while parsing DT
Date:   Fri, 18 Sep 2020 00:33:16 +0200
Message-Id: <20200917223338.14164-29-marek.behun@nic.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200917223338.14164-1-marek.behun@nic.cz>
References: <20200917223338.14164-1-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Spam-Status: No, score=0.00
X-Spamd-Bar: /
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Refactor the code so that LEDs are registered while device tree is being
parsed.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: H. Nikolaus Schaller <hns@goldelico.com>
Cc: Grant Feng <von81@163.com>
---
 drivers/leds/leds-is31fl319x.c | 174 ++++++++++++++-------------------
 1 file changed, 76 insertions(+), 98 deletions(-)

diff --git a/drivers/leds/leds-is31fl319x.c b/drivers/leds/leds-is31fl319x.c
index 8e3e02d959989..1dae319b03d60 100644
--- a/drivers/leds/leds-is31fl319x.c
+++ b/drivers/leds/leds-is31fl319x.c
@@ -209,86 +209,6 @@ static u32 is31fl319x_parse_audio_gain(struct device *dev)
 	return result;;
 }
 
-static int is31fl319x_parse_child_dt(const struct device *dev,
-				     const struct device_node *child,
-				     struct is31fl319x_led *led)
-{
-	struct led_classdev *cdev = &led->cdev;
-	int ret;
-
-	if (of_property_read_string(child, "label", &cdev->name))
-		cdev->name = child->name;
-
-	ret = of_property_read_string(child, "linux,default-trigger",
-				      &cdev->default_trigger);
-	if (ret < 0 && ret != -EINVAL) /* is optional */
-		return ret;
-
-	return 0;
-}
-
-static int is31fl319x_parse_dt(struct device *dev,
-			       struct is31fl319x_chip *is31)
-{
-	struct device_node *np = dev_of_node(dev), *child;
-	int count;
-	int ret;
-
-	if (!np)
-		return -ENODEV;
-
-	is31->cdef = device_get_match_data(dev);
-
-	count = of_get_available_child_count(np);
-
-	dev_dbg(dev, "probing with %d leds defined in DT\n", count);
-
-	if (!count || count > is31->cdef->num_leds) {
-		dev_err(dev, "Number of leds defined must be between 1 and %u\n",
-			is31->cdef->num_leds);
-		return -ENODEV;
-	}
-
-	for_each_available_child_of_node(np, child) {
-		struct is31fl319x_led *led;
-		u32 reg;
-
-		ret = of_property_read_u32(child, "reg", &reg);
-		if (ret) {
-			dev_err(dev, "Failed to read led 'reg' property\n");
-			goto put_child_node;
-		}
-
-		if (reg < 1 || reg > is31->cdef->num_leds) {
-			dev_err(dev, "invalid led reg %u\n", reg);
-			ret = -EINVAL;
-			goto put_child_node;
-		}
-
-		led = &is31->leds[reg - 1];
-
-		if (led->configured) {
-			dev_err(dev, "led %u is already configured\n", reg);
-			ret = -EINVAL;
-			goto put_child_node;
-		}
-
-		ret = is31fl319x_parse_child_dt(dev, child, led);
-		if (ret) {
-			dev_err(dev, "led %u DT parsing failed\n", reg);
-			goto put_child_node;
-		}
-
-		led->configured = true;
-	}
-
-	return 0;
-
-put_child_node:
-	of_node_put(child);
-	return ret;
-}
-
 static bool is31fl319x_readable_reg(struct device *dev, unsigned int reg)
 { /* we have no readable registers */
 	return false;
@@ -345,6 +265,78 @@ static inline int is31fl319x_db_to_gain(u32 dezibel)
 	return dezibel / IS31FL319X_AUDIO_GAIN_DB_STEP;
 }
 
+static int is31fl319x_led_register(struct device *dev,
+				   struct is31fl319x_chip *is31,
+				   struct device_node *np)
+{
+	struct is31fl319x_led *led;
+	u32 reg;
+	int ret;
+
+	ret = of_property_read_u32(np, "reg", &reg);
+	if (ret) {
+		dev_err(dev, "Cannot read reg property of %pOF\n", np);
+		return ret;
+	}
+
+	if (reg < 1 || reg > is31->cdef->num_leds) {
+		dev_err(dev, "Node %pOF has invalid reg property\n", np);
+		return -EINVAL;
+	}
+
+	led = &is31->leds[reg - 1];
+
+	if (led->configured) {
+		dev_err(dev, "Node %pOF 'reg' conflicts with another LED\n",
+			np);
+		return -EEXIST;
+	}
+
+	if (of_property_read_string(np, "label", &led->cdev.name))
+		led->cdev.name = np->name;
+
+	ret = of_property_read_string(np, "linux,default-trigger",
+				      &led->cdev.default_trigger);
+	if (ret < 0 && ret != -EINVAL) /* is optional */
+		return ret;
+
+	led->configured = true;
+	led->chip = is31;
+	led->cdev.brightness_set_blocking = is31fl319x_brightness_set;
+
+	ret = devm_led_classdev_register(dev, &led->cdev);
+	if (ret)
+		dev_err(dev, "Failed to register LED for node %pOF\n", np);
+
+	return ret;
+}
+
+static int is31fl319x_parse_and_register(struct device *dev,
+					 struct is31fl319x_chip *is31)
+{
+	struct device_node *np = dev_of_node(dev), *child;
+	int ret, count;
+
+	count = of_get_available_child_count(np);
+	if (count < 1 || count > is31->cdef->num_leds) {
+		dev_err(dev, "Between 1 and %u LEDs have to be defined\n",
+			is31->cdef->num_leds);
+		return -ENODEV;
+	}
+
+	dev_dbg(dev, "probing with %d leds defined in DT\n", count);
+
+	for_each_available_child_of_node(np, child) {
+		ret = is31fl319x_led_register(dev, is31, child);
+		if (ret) {
+			of_node_put(child);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 static int is31fl319x_probe(struct i2c_client *client,
 			    const struct i2c_device_id *id)
 {
@@ -353,7 +345,6 @@ static int is31fl319x_probe(struct i2c_client *client,
 	struct gpio_desc *shutdown_gpio;
 	u32 audio_gain_db;
 	int err;
-	int i = 0;
 	u32 aggregated_led_microamp;
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
@@ -388,11 +379,8 @@ static int is31fl319x_probe(struct i2c_client *client,
 
 	mutex_init(&is31->lock);
 
-	err = is31fl319x_parse_dt(&client->dev, is31);
-	if (err)
-		goto free_mutex;
-
 	is31->client = client;
+	is31->cdef = device_get_match_data(dev);
 	is31->regmap = devm_regmap_init_i2c(client, &regmap_config);
 	if (IS_ERR(is31->regmap)) {
 		dev_err(&client->dev, "failed to allocate register map\n");
@@ -417,19 +405,9 @@ static int is31fl319x_probe(struct i2c_client *client,
 		     is31fl319x_microamp_to_cs(dev, aggregated_led_microamp) |
 		     is31fl319x_db_to_gain(audio_gain_db));
 
-	for (i = 0; i < is31->cdef->num_leds; i++) {
-		struct is31fl319x_led *led = &is31->leds[i];
-
-		if (!led->configured)
-			continue;
-
-		led->chip = is31;
-		led->cdev.brightness_set_blocking = is31fl319x_brightness_set;
-
-		err = devm_led_classdev_register(&client->dev, &led->cdev);
-		if (err < 0)
-			goto free_mutex;
-	}
+	err = is31fl319x_parse_and_register(dev, is31);
+	if (err)
+		goto free_mutex;
 
 	return 0;
 
-- 
2.26.2

