Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C70BE88AA
	for <lists+linux-leds@lfdr.de>; Tue, 29 Oct 2019 13:48:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732715AbfJ2MsD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 29 Oct 2019 08:48:03 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:38550 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728735AbfJ2MsD (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 29 Oct 2019 08:48:03 -0400
Received: by mail-lj1-f195.google.com with SMTP id q78so15136787lje.5;
        Tue, 29 Oct 2019 05:48:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=MW/Su+hF7dOeuK9WS3oBbH9tajAn0tgnLxRJ4/XFN9Q=;
        b=ChT+ORuun49NLo/yPJpOidUMGrXSOxeo+/ubEQ9187frsGe1ql2ZXbw6768bBqc468
         bDxlvKIBsbKYcLGfwqt8cPCmshKKfPFwDpEdxCGvMqWOCdz/uCeNGokf1N3RHTVafd3v
         pHXmty7cY6YB7LtyWTKfeC6H4rkBDMp1QKR9S9vFNBwe2nt7lm+nh8l0aQBqfVAiywJ4
         ZZeyRWwD+Vit6S+T9kTQR+LGRTTKhLupzLx7bvRZCji08S7zVgzDy7E7ZyNNnFovOaz1
         ZUksa6RAIgmy1RD8R4osLB5uvUSeduZrlx3S+2bqlY2BecaWiXjrw/QDP6Cn5gDbOoZ/
         lOwQ==
X-Gm-Message-State: APjAAAWLvkWT3eTgEJCzh+FFZEqeBfT7SleWuRXq603A+Xa1aE78EHoT
        LGyjpGYk6X/B3c4Yiagq298=
X-Google-Smtp-Source: APXvYqyys4dJFAsnYhczy2DeEgtZdc8W4NThNcMqth7uIe9P7lRHd+5WfD4WJxmgdMCfOUbxXzQ4iA==
X-Received: by 2002:a2e:81c7:: with SMTP id s7mr2587136ljg.40.1572353279815;
        Tue, 29 Oct 2019 05:47:59 -0700 (PDT)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id w20sm9160629lff.46.2019.10.29.05.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 05:47:59 -0700 (PDT)
Date:   Tue, 29 Oct 2019 14:47:48 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     mazziesaccount@gmail.com, matti.vaittinen@fi.rohmeurope.com
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH 3/5] leds: an30259a: Offload DT node locating and parsing
 to core
Message-ID: <4083d9e71fbb17b15ee54e9826b77185bfffa729.1572351774.git.matti.vaittinen@fi.rohmeurope.com>
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
locating and parsing. leds-an30259a was randomly selected from
drivers using 'devm_led_classdev_register_ext' API. No further
study was done :)

This commit HAS NOT BEEN TESTED at all. Only compile tested.
This is only RFC - Eg, request for comments. If people see some
of the ideas as useful then properly tested patch should be
provided.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 drivers/leds/leds-an30259a.c | 181 +++++++++++++++++------------------
 1 file changed, 87 insertions(+), 94 deletions(-)

diff --git a/drivers/leds/leds-an30259a.c b/drivers/leds/leds-an30259a.c
index 250dc9d6f635..3df91866d6a2 100644
--- a/drivers/leds/leds-an30259a.c
+++ b/drivers/leds/leds-an30259a.c
@@ -61,10 +61,33 @@
 
 struct an30259a;
 
+/*
+ * RFC_NOTE: What would be the correct way to match the DT node with driver?
+ * This may not work for leds-an30259a.c as the DT entries may not be exactly
+ * what is used in dt-binding example. For _new_ drivers we could either fix the
+ * node names (?) can we or introduce some "led-compatible" property (like
+ * regulators had regulator-compatible prior switching to node-names). But if we
+ * wish to convert old drivers to use this new API (I suggested merging the
+ * led_classdev_register_ext and led_classdev_register_dt into one in order to
+ * not create yet another LED class registration API) we may need to add some
+ * of_match_cb call-back in led_init_data so that old drivers can implement own
+ * DT matching mechanism and LED core just calls that for each child node. I'd
+ * prefer not having such as ideally drivers should not need to care about DT
+ * nodes unless they have driver specific properties. Core should handle generic
+ * LED properties.
+ */
+static const char *of_led_names[AN30259A_MAX_LEDS] = {
+	"led1", "led2", "led3",
+};
+
 struct an30259a_led {
 	struct an30259a *chip;
 	struct fwnode_handle *fwnode;
-	struct led_classdev cdev;
+/*
+ * RFC_NOTE: We give ownership of led_classdev to LED core. LED driver should
+ * not really need it for anything?
+ */
+	struct led_init_data init_data;
 	u32 num;
 	u32 default_state;
 	bool sloping;
@@ -85,7 +108,7 @@ static int an30259a_brightness_set(struct led_classdev *cdev,
 	int ret;
 	unsigned int led_on;
 
-	led = container_of(cdev, struct an30259a_led, cdev);
+	led = container_of(cdev->init_data, struct an30259a_led, init_data);
 	mutex_lock(&led->chip->mutex);
 
 	ret = regmap_read(led->chip->regmap, AN30259A_REG_LED_ON, &led_on);
@@ -132,7 +155,7 @@ static int an30259a_blink_set(struct led_classdev *cdev,
 	unsigned int led_on;
 	unsigned long off = *delay_off, on = *delay_on;
 
-	led = container_of(cdev, struct an30259a_led, cdev);
+	led = container_of(cdev->init_data, struct an30259a_led, init_data);
 
 	mutex_lock(&led->chip->mutex);
 	num = led->num;
@@ -199,56 +222,76 @@ static int an30259a_blink_set(struct led_classdev *cdev,
 	return ret;
 }
 
-static int an30259a_dt_init(struct i2c_client *client,
-			    struct an30259a *chip)
+static int of_check_reg(struct led_classdev *ld, struct fwnode_handle *fw,
+			struct led_properties *props)
 {
-	struct device_node *np = client->dev.of_node, *child;
-	int count, ret;
-	int i = 0;
+	u32 source;
+	int ret;
+	struct an30259a *chip;
 	const char *str;
-	struct an30259a_led *led;
+	unsigned int led_on;
+	struct an30259a_led *led = container_of(ld->init_data,
+						struct an30259a_led, init_data);
 
-	count = of_get_child_count(np);
-	if (!count || count > AN30259A_MAX_LEDS)
+	chip = led->chip;
+
+	ret = fwnode_property_read_u32(fw, "reg", &source);
+	if (ret != 0 || !source || source > AN30259A_MAX_LEDS) {
+		dev_err(&chip->client->dev, "Couldn't read LED address: %d\n",
+			ret);
 		return -EINVAL;
+	}
+	led->num = source;
+	chip->num_leds++;
+
+	/*
+	 * RFC_NOTE: We need to add default-state = "keep" handling here
+	 * if we don't implement get_brightness and keep support in core
+	 */
+	if (!fwnode_property_read_string(fw, "default-state", &str)) {
+		if (!strcmp(str, "keep"))
+			ret = regmap_read(chip->regmap, AN30259A_REG_LED_ON,
+					  &led_on);
+		if (ret)
+			return ret;
 
-	for_each_available_child_of_node(np, child) {
-		u32 source;
+		if (!(led_on & AN30259A_LED_EN(led->num)))
+			ld->brightness = LED_OFF;
+		else
+			regmap_read(chip->regmap, AN30259A_REG_LEDCC(led->num),
+			    &ld->brightness);
+	}
 
-		ret = of_property_read_u32(child, "reg", &source);
-		if (ret != 0 || !source || source > AN30259A_MAX_LEDS) {
-			dev_err(&client->dev, "Couldn't read LED address: %d\n",
-				ret);
-			count--;
-			continue;
-		}
+	return 0;
+}
 
-		led = &chip->leds[i];
+const static struct led_ops an30259a_ops = {
+	.brightness_set_blocking = an30259a_brightness_set,
+	.blink_set = an30259a_blink_set,
+};
 
-		led->num = source;
-		led->chip = chip;
-		led->fwnode = of_fwnode_handle(child);
+static int an30259a_dt_init(struct i2c_client *client,
+			    struct an30259a *chip)
+{
+	void *ret;
+	int i = 0;
+	struct an30259a_led *led;
 
-		if (!of_property_read_string(child, "default-state", &str)) {
-			if (!strcmp(str, "on"))
-				led->default_state = STATE_ON;
-			else if (!strcmp(str, "keep"))
-				led->default_state = STATE_KEEP;
-			else
-				led->default_state = STATE_OFF;
-		}
+	for (i = 0; i < AN30259A_MAX_LEDS; i++) {
+		led = &chip->leds[i];
 
-		of_property_read_string(child, "linux,default-trigger",
-					&led->cdev.default_trigger);
+		led->init_data.of_match = of_match_ptr(of_led_names[i]);
+		led->init_data.devicename = AN30259A_NAME;
+		led->init_data.default_label = ":";
+		led->init_data.of_parse_cb = of_check_reg;
+		led->chip = chip;
 
-		i++;
+		ret = devm_led_classdev_register_dt(&client->dev, &an30259a_ops,
+						 &led->init_data);
+		if (IS_ERR(ret))
+			return PTR_ERR(ret);
 	}
 
-	if (!count)
-		return -EINVAL;
-
-	chip->num_leds = i;
-
 	return 0;
 }
 
@@ -258,75 +301,25 @@ static const struct regmap_config an30259a_regmap_config = {
 	.max_register = AN30259A_REG_MAX,
 };
 
-static void an30259a_init_default_state(struct an30259a_led *led)
-{
-	struct an30259a *chip = led->chip;
-	int led_on, err;
-
-	switch (led->default_state) {
-	case STATE_ON:
-		led->cdev.brightness = LED_FULL;
-		break;
-	case STATE_KEEP:
-		err = regmap_read(chip->regmap, AN30259A_REG_LED_ON, &led_on);
-		if (err)
-			break;
-
-		if (!(led_on & AN30259A_LED_EN(led->num))) {
-			led->cdev.brightness = LED_OFF;
-			break;
-		}
-		regmap_read(chip->regmap, AN30259A_REG_LEDCC(led->num),
-			    &led->cdev.brightness);
-		break;
-	default:
-		led->cdev.brightness = LED_OFF;
-	}
-
-	an30259a_brightness_set(&led->cdev, led->cdev.brightness);
-}
-
 static int an30259a_probe(struct i2c_client *client)
 {
 	struct an30259a *chip;
-	int i, err;
+	int err;
 
 	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
 	if (!chip)
 		return -ENOMEM;
 
-	err = an30259a_dt_init(client, chip);
-	if (err < 0)
-		return err;
-
 	mutex_init(&chip->mutex);
 	chip->client = client;
 	i2c_set_clientdata(client, chip);
 
 	chip->regmap = devm_regmap_init_i2c(client, &an30259a_regmap_config);
 
-	for (i = 0; i < chip->num_leds; i++) {
-		struct led_init_data init_data = {};
-
-		an30259a_init_default_state(&chip->leds[i]);
-		chip->leds[i].cdev.brightness_set_blocking =
-			an30259a_brightness_set;
-		chip->leds[i].cdev.blink_set = an30259a_blink_set;
-
-		init_data.fwnode = chip->leds[i].fwnode;
-		init_data.devicename = AN30259A_NAME;
-		init_data.default_label = ":";
-
-		err = devm_led_classdev_register_ext(&client->dev,
-						 &chip->leds[i].cdev,
-						 &init_data);
-		if (err < 0)
-			goto exit;
-	}
-	return 0;
+	err = an30259a_dt_init(client, chip);
+	if (err)
+		mutex_destroy(&chip->mutex);
 
-exit:
-	mutex_destroy(&chip->mutex);
 	return err;
 }
 
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
