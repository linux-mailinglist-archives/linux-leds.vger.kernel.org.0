Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36B22E88B2
	for <lists+linux-leds@lfdr.de>; Tue, 29 Oct 2019 13:49:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729867AbfJ2Msw (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 29 Oct 2019 08:48:52 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:42816 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729126AbfJ2Msv (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 29 Oct 2019 08:48:51 -0400
Received: by mail-lj1-f196.google.com with SMTP id a21so15105804ljh.9;
        Tue, 29 Oct 2019 05:48:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xBVZsEwVtK814JHViicc5SAg5rQLuwblDReqpeiyxfs=;
        b=B2PmQggIVtkAFdYjftHoHQdw9coBaA6wdTtStdaa7pS56m6mdMptPHBk7QtlX0rnR9
         Bdrm0CGr8J5uRJjR1kw57vxQ9fLAc4kvd69gIudgYdhF7cR9YuB6GLs6bIxazJx2GfTy
         TKiSIDV0Tjw9NzYGa3o5hfvREdozR6+asaOn6f7aFnWdmjEbJmALx37uiFryM6I2Papo
         imFH51lutcrs24Ud5aKIVE7yS54E7K6OExM+Hhd/7ZbNwoVu9KWOUmqLtH2BH6Epg38W
         dDcMqytDX3vandhC7eJnJFLO71nFTTd3Eiiv0q1FMHyqfI/QjClvusFzur8je5pppOWN
         mkmQ==
X-Gm-Message-State: APjAAAXWOapjk5Tx8FZiC7Swow/v7hsHRO2UWIiT90xeBysjv1DG19HA
        aN2E1fF0ulMOuiCJul89/FU=
X-Google-Smtp-Source: APXvYqxChfIwjj7Wc/TmT1HL5bfeXc+1lnmhRvhgbjX2jyrjgKWXLOryfSfpaWPWWzgrUD7+wtYY9Q==
X-Received: by 2002:a2e:91c7:: with SMTP id u7mr2504548ljg.178.1572353328687;
        Tue, 29 Oct 2019 05:48:48 -0700 (PDT)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 12sm11264224lje.92.2019.10.29.05.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 05:48:48 -0700 (PDT)
Date:   Tue, 29 Oct 2019 14:48:36 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     mazziesaccount@gmail.com, matti.vaittinen@fi.rohmeurope.com
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH 5/5] leds: lm3692x: Offload DT node locating and parsing
 to core
Message-ID: <f6420ede481afc4e0a360d937049555400f4417e.1572351774.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572351774.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572351774.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This comment serves as an example how led controller drivers
could be simplified if led-class/led-core would handle DT node
locating and parsing. leds-lm3692x was randomly selected from
drivers using 'devm_led_classdev_register_ext' API. No further
study was done :)

This commit HAS NOT BEEN TESTED at all. Only compile tested.
This is only RFC - Eg, request for comments. If people see some
of the ideas as useful then properly tested patch should be
provided.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 drivers/leds/leds-lm3692x.c | 75 ++++++++++++++++++++-----------------
 1 file changed, 41 insertions(+), 34 deletions(-)

diff --git a/drivers/leds/leds-lm3692x.c b/drivers/leds/leds-lm3692x.c
index 3d381f2f73d0..abe2b1113049 100644
--- a/drivers/leds/leds-lm3692x.c
+++ b/drivers/leds/leds-lm3692x.c
@@ -108,7 +108,7 @@
 struct lm3692x_led {
 	struct mutex lock;
 	struct i2c_client *client;
-	struct led_classdev led_dev;
+	struct led_init_data init_data;
 	struct regmap *regmap;
 	struct gpio_desc *enable_gpio;
 	struct regulator *regulator;
@@ -166,7 +166,8 @@ static int lm3692x_brightness_set(struct led_classdev *led_cdev,
 				enum led_brightness brt_val)
 {
 	struct lm3692x_led *led =
-			container_of(led_cdev, struct lm3692x_led, led_dev);
+			container_of(led_cdev->init_data, struct lm3692x_led,
+				     init_data);
 	int ret;
 	int led_brightness_lsb = (brt_val >> 5);
 
@@ -319,49 +320,56 @@ static int lm3692x_init(struct lm3692x_led *led)
 
 	return ret;
 }
-static int lm3692x_probe_dt(struct lm3692x_led *led)
+
+static int lm3692x_of_parse_cb(struct led_classdev *ld, struct fwnode_handle *fw,
+			       struct led_properties *props)
 {
-	struct fwnode_handle *child = NULL;
-	struct led_init_data init_data = {};
 	int ret;
+	struct lm3692x_led *led = container_of(ld->init_data,
+					       struct lm3692x_led, init_data);
+
+	ret = fwnode_property_read_u32(fw, "reg", &led->led_enable);
+	if (ret)
+		dev_err(&led->client->dev, "reg DT property missing\n");
+
+	return ret;
+}
+
+static const struct led_ops lm3692x_ops = {
+	.brightness_set_blocking = lm3692x_brightness_set,
+};
+
+static int lm3692x_probe_dt(struct lm3692x_led *led)
+{
+	void *ret;
 
 	led->enable_gpio = devm_gpiod_get_optional(&led->client->dev,
 						   "enable", GPIOD_OUT_LOW);
 	if (IS_ERR(led->enable_gpio)) {
-		ret = PTR_ERR(led->enable_gpio);
-		dev_err(&led->client->dev, "Failed to get enable gpio: %d\n",
-			ret);
-		return ret;
+		dev_err(&led->client->dev, "Failed to get enable gpio: %ld\n",
+			PTR_ERR(led->enable_gpio));
+		return PTR_ERR(led->enable_gpio);
 	}
 
 	led->regulator = devm_regulator_get(&led->client->dev, "vled");
 	if (IS_ERR(led->regulator))
 		led->regulator = NULL;
 
-	child = device_get_next_child_node(&led->client->dev, child);
-	if (!child) {
-		dev_err(&led->client->dev, "No LED Child node\n");
-		return -ENODEV;
-	}
-
-	fwnode_property_read_string(child, "linux,default-trigger",
-				    &led->led_dev.default_trigger);
-
-	ret = fwnode_property_read_u32(child, "reg", &led->led_enable);
-	if (ret) {
-		dev_err(&led->client->dev, "reg DT property missing\n");
-		return ret;
-	}
-
-	init_data.fwnode = child;
-	init_data.devicename = led->client->name;
-	init_data.default_label = ":";
-
-	ret = devm_led_classdev_register_ext(&led->client->dev, &led->led_dev,
-					     &init_data);
-	if (ret) {
-		dev_err(&led->client->dev, "led register err: %d\n", ret);
-		return ret;
+	/*
+	 * RFC_NOTE: Do we have fixed node name here or do we need another way to
+	 * do 'match'?
+	 */
+	led->init_data.of_match = of_match_ptr("led_node_name_here");
+	led->init_data.of_parse_cb = lm3692x_of_parse_cb;
+	led->init_data.devicename = led->client->name;
+	led->init_data.default_label = ":";
+
+	ret = devm_led_classdev_register_dt(&led->client->dev, &lm3692x_ops,
+					    &led->init_data);
+	if (IS_ERR(ret)) {
+		dev_err(&led->client->dev, "led register err: %ld\n",
+			PTR_ERR(ret));
+		return PTR_ERR(ret);
 	}
 
 	return 0;
@@ -379,7 +387,6 @@ static int lm3692x_probe(struct i2c_client *client,
 
 	mutex_init(&led->lock);
 	led->client = client;
-	led->led_dev.brightness_set_blocking = lm3692x_brightness_set;
 	led->model_id = id->driver_data;
 	i2c_set_clientdata(client, led);
 
-- 
2.21.0


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 
