Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3804F270FE6
	for <lists+linux-leds@lfdr.de>; Sat, 19 Sep 2020 20:03:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726502AbgISSDK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 19 Sep 2020 14:03:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726582AbgISSDK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 19 Sep 2020 14:03:10 -0400
Received: from mail.nic.cz (mail.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F94BC0613D0
        for <linux-leds@vger.kernel.org>; Sat, 19 Sep 2020 11:03:10 -0700 (PDT)
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id BEDA7140A8A;
        Sat, 19 Sep 2020 20:03:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600538586; bh=BZY5knTLwAb/Ziqy33adYq+95Hu0ErbFQLQD9G5cHL4=;
        h=From:To:Date;
        b=j78Cxv2IcVgE8/2NtDHzyP09CEjPhELSsyiUspzRN/thT0XDYbH1u4Na1ijTY/a4b
         KzVgShOKuc8GUdZ9x0fZpR49fgdzelZfRvFRQkeZui7tJkeXZJVb4v5c0/9digmmcW
         efUP3aqrPlQWdBkvr44MKQtvEH12lhVFO4t0j6zg=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
Subject: [PATCH leds v3 9/9] leds: parse linux,default-trigger DT property in LED core
Date:   Sat, 19 Sep 2020 20:03:04 +0200
Message-Id: <20200919180304.2885-10-marek.behun@nic.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200919180304.2885-1-marek.behun@nic.cz>
References: <20200919180304.2885-1-marek.behun@nic.cz>
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

Do the parsing of `linux,default-trigger` DT property to LED core.
Currently it is done in many different drivers and the code is repeated.

This patch removes the parsing from 23 drivers:
  an30259a, aw2013, bcm6328, bcm6358, cr0014114, el15203000, gpio,
  is31fl32xx, lm3532, lm36274, lm3692x, lm3697, lp50xx, lp8860, lt3593,
  max77650, mt6323, ns2, pm8058, pwm, syscon, tlc591xx and turris-omnia.

There is one driver in drivers/input which parses this property on it's
own. I shall send a separate patch there after this is applied.

There are still 8 drivers that parse this property on their own because
they do not pass the led_init_data structure to the registering
function. I will try to refactor those in the future.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
---
 drivers/leds/led-class.c         | 5 +++++
 drivers/leds/leds-an30259a.c     | 3 ---
 drivers/leds/leds-aw2013.c       | 3 ---
 drivers/leds/leds-bcm6328.c      | 4 ----
 drivers/leds/leds-bcm6358.c      | 4 ----
 drivers/leds/leds-cr0014114.c    | 3 ---
 drivers/leds/leds-el15203000.c   | 3 ---
 drivers/leds/leds-gpio.c         | 3 ---
 drivers/leds/leds-is31fl32xx.c   | 3 ---
 drivers/leds/leds-lm3532.c       | 3 ---
 drivers/leds/leds-lm36274.c      | 3 ---
 drivers/leds/leds-lm3692x.c      | 3 ---
 drivers/leds/leds-lm3697.c       | 3 ---
 drivers/leds/leds-lp50xx.c       | 3 ---
 drivers/leds/leds-lp8860.c       | 4 ----
 drivers/leds/leds-lt3593.c       | 3 ---
 drivers/leds/leds-max77650.c     | 3 ---
 drivers/leds/leds-mt6323.c       | 4 ----
 drivers/leds/leds-ns2.c          | 3 ---
 drivers/leds/leds-pm8058.c       | 2 --
 drivers/leds/leds-pwm.c          | 5 -----
 drivers/leds/leds-syscon.c       | 2 --
 drivers/leds/leds-tlc591xx.c     | 3 ---
 drivers/leds/leds-turris-omnia.c | 2 --
 24 files changed, 5 insertions(+), 72 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index cc3929f858b68..131ca83f5fb38 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -354,6 +354,11 @@ int led_classdev_register_ext(struct device *parent,
 		ret = led_compose_name(parent, init_data, composed_name);
 		if (ret < 0)
 			return ret;
+
+		if (init_data->fwnode)
+			fwnode_property_read_string(init_data->fwnode,
+				"linux,default-trigger",
+				&led_cdev->default_trigger);
 	} else {
 		proposed_name = led_cdev->name;
 	}
diff --git a/drivers/leds/leds-an30259a.c b/drivers/leds/leds-an30259a.c
index 9749f1cc3e15f..a0df1fb28774d 100644
--- a/drivers/leds/leds-an30259a.c
+++ b/drivers/leds/leds-an30259a.c
@@ -238,9 +238,6 @@ static int an30259a_dt_init(struct i2c_client *client,
 				led->default_state = STATE_OFF;
 		}
 
-		of_property_read_string(child, "linux,default-trigger",
-					&led->cdev.default_trigger);
-
 		i++;
 	}
 
diff --git a/drivers/leds/leds-aw2013.c b/drivers/leds/leds-aw2013.c
index 927c5ba32592f..80d937454aeef 100644
--- a/drivers/leds/leds-aw2013.c
+++ b/drivers/leds/leds-aw2013.c
@@ -297,9 +297,6 @@ static int aw2013_probe_dt(struct aw2013 *chip)
 				 "DT property led-max-microamp is missing\n");
 		}
 
-		of_property_read_string(child, "linux,default-trigger",
-					&led->cdev.default_trigger);
-
 		led->cdev.brightness_set_blocking = aw2013_brightness_set;
 		led->cdev.blink_set = aw2013_blink_set;
 
diff --git a/drivers/leds/leds-bcm6328.c b/drivers/leds/leds-bcm6328.c
index d79aeb956c9b6..226d17d253ed3 100644
--- a/drivers/leds/leds-bcm6328.c
+++ b/drivers/leds/leds-bcm6328.c
@@ -346,10 +346,6 @@ static int bcm6328_led(struct device *dev, struct device_node *nc, u32 reg,
 	if (of_property_read_bool(nc, "active-low"))
 		led->active_low = true;
 
-	led->cdev.default_trigger = of_get_property(nc,
-						    "linux,default-trigger",
-						    NULL);
-
 	if (!of_property_read_string(nc, "default-state", &state)) {
 		if (!strcmp(state, "on")) {
 			led->cdev.brightness = LED_FULL;
diff --git a/drivers/leds/leds-bcm6358.c b/drivers/leds/leds-bcm6358.c
index 0fd495103a4d9..9d2e487fa08a3 100644
--- a/drivers/leds/leds-bcm6358.c
+++ b/drivers/leds/leds-bcm6358.c
@@ -110,10 +110,6 @@ static int bcm6358_led(struct device *dev, struct device_node *nc, u32 reg,
 	if (of_property_read_bool(nc, "active-low"))
 		led->active_low = true;
 
-	led->cdev.default_trigger = of_get_property(nc,
-						    "linux,default-trigger",
-						    NULL);
-
 	if (!of_property_read_string(nc, "default-state", &state)) {
 		if (!strcmp(state, "on")) {
 			led->cdev.brightness = LED_FULL;
diff --git a/drivers/leds/leds-cr0014114.c b/drivers/leds/leds-cr0014114.c
index 2da448ae718e9..d03cfd3c0bfbe 100644
--- a/drivers/leds/leds-cr0014114.c
+++ b/drivers/leds/leds-cr0014114.c
@@ -188,9 +188,6 @@ static int cr0014114_probe_dt(struct cr0014114 *priv)
 	device_for_each_child_node(priv->dev, child) {
 		led = &priv->leds[i];
 
-		fwnode_property_read_string(child, "linux,default-trigger",
-					    &led->ldev.default_trigger);
-
 		led->priv			  = priv;
 		led->ldev.max_brightness	  = CR_MAX_BRIGHTNESS;
 		led->ldev.brightness_set_blocking = cr0014114_set_sync;
diff --git a/drivers/leds/leds-el15203000.c b/drivers/leds/leds-el15203000.c
index 298b13e4807a8..6ca47f2a20041 100644
--- a/drivers/leds/leds-el15203000.c
+++ b/drivers/leds/leds-el15203000.c
@@ -263,9 +263,6 @@ static int el15203000_probe_dt(struct el15203000 *priv)
 			return -EINVAL;
 		}
 
-		fwnode_property_read_string(child, "linux,default-trigger",
-					    &led->ldev.default_trigger);
-
 		led->priv			  = priv;
 		led->ldev.max_brightness	  = LED_ON;
 		led->ldev.brightness_set_blocking = el15203000_set_blocking;
diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index cf84096d88cec..93f5b1b60fdec 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -160,9 +160,6 @@ static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
 
 		led_dat->gpiod = led.gpiod;
 
-		fwnode_property_read_string(child, "linux,default-trigger",
-					    &led.default_trigger);
-
 		if (!fwnode_property_read_string(child, "default-state",
 						 &state)) {
 			if (!strcmp(state, "keep"))
diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index ea589d1a89540..2180255ad3393 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -341,9 +341,6 @@ static int is31fl32xx_parse_child_dt(const struct device *dev,
 	}
 	led_data->channel = reg;
 
-	of_property_read_string(child, "linux,default-trigger",
-				&cdev->default_trigger);
-
 	cdev->brightness_set_blocking = is31fl32xx_brightness_set;
 
 	return 0;
diff --git a/drivers/leds/leds-lm3532.c b/drivers/leds/leds-lm3532.c
index 9b6973217cc0b..10ded9192fb13 100644
--- a/drivers/leds/leds-lm3532.c
+++ b/drivers/leds/leds-lm3532.c
@@ -640,9 +640,6 @@ static int lm3532_parse_node(struct lm3532_data *priv)
 			goto child_out;
 		}
 
-		fwnode_property_read_string(child, "linux,default-trigger",
-					    &led->led_dev.default_trigger);
-
 		led->priv = priv;
 		led->led_dev.brightness_set_blocking = lm3532_brightness_set;
 
diff --git a/drivers/leds/leds-lm36274.c b/drivers/leds/leds-lm36274.c
index 10a63b7f2ecce..582c6a821dc85 100644
--- a/drivers/leds/leds-lm36274.c
+++ b/drivers/leds/leds-lm36274.c
@@ -97,9 +97,6 @@ static int lm36274_parse_dt(struct lm36274 *chip,
 		goto err;
 	}
 
-	fwnode_property_read_string(child, "linux,default-trigger",
-				    &chip->led_dev.default_trigger);
-
 	return 0;
 err:
 	fwnode_handle_put(child);
diff --git a/drivers/leds/leds-lm3692x.c b/drivers/leds/leds-lm3692x.c
index 1d7ea1b76a125..e945de45388ca 100644
--- a/drivers/leds/leds-lm3692x.c
+++ b/drivers/leds/leds-lm3692x.c
@@ -433,9 +433,6 @@ static int lm3692x_probe_dt(struct lm3692x_led *led)
 		return -ENODEV;
 	}
 
-	fwnode_property_read_string(child, "linux,default-trigger",
-				    &led->led_dev.default_trigger);
-
 	ret = fwnode_property_read_u32(child, "reg", &led->led_enable);
 	if (ret) {
 		dev_err(&led->client->dev, "reg DT property missing\n");
diff --git a/drivers/leds/leds-lm3697.c b/drivers/leds/leds-lm3697.c
index a7779ce931ab3..64c0794801e6d 100644
--- a/drivers/leds/leds-lm3697.c
+++ b/drivers/leds/leds-lm3697.c
@@ -268,9 +268,6 @@ static int lm3697_probe_dt(struct lm3697 *priv)
 		if (ret)
 			dev_warn(dev, "runtime-ramp properties missing\n");
 
-		fwnode_property_read_string(child, "linux,default-trigger",
-					    &led->led_dev.default_trigger);
-
 		init_data.fwnode = child;
 		init_data.devicename = priv->client->name;
 		/* for backwards compatibility if `label` is not present */
diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
index 47144a37cb945..5fb4f24aeb2e8 100644
--- a/drivers/leds/leds-lp50xx.c
+++ b/drivers/leds/leds-lp50xx.c
@@ -508,9 +508,6 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
 		led_cdev = &led->mc_cdev.led_cdev;
 		led_cdev->brightness_set_blocking = lp50xx_brightness_set;
 
-		fwnode_property_read_string(child, "linux,default-trigger",
-					    &led_cdev->default_trigger);
-
 		ret = devm_led_classdev_multicolor_register_ext(&priv->client->dev,
 						       &led->mc_cdev,
 						       &init_data);
diff --git a/drivers/leds/leds-lp8860.c b/drivers/leds/leds-lp8860.c
index e9b16f3358d6f..f0533a337bc15 100644
--- a/drivers/leds/leds-lp8860.c
+++ b/drivers/leds/leds-lp8860.c
@@ -392,10 +392,6 @@ static int lp8860_probe(struct i2c_client *client,
 	if (!child_node)
 		return -EINVAL;
 
-	led->led_dev.default_trigger = of_get_property(child_node,
-					    "linux,default-trigger",
-					    NULL);
-
 	led->enable_gpio = devm_gpiod_get_optional(&client->dev,
 						   "enable", GPIOD_OUT_LOW);
 	if (IS_ERR(led->enable_gpio)) {
diff --git a/drivers/leds/leds-lt3593.c b/drivers/leds/leds-lt3593.c
index 061f02e3995ae..68e06434ac087 100644
--- a/drivers/leds/leds-lt3593.c
+++ b/drivers/leds/leds-lt3593.c
@@ -86,9 +86,6 @@ static int lt3593_led_probe(struct platform_device *pdev)
 
 	child = device_get_next_child_node(dev, NULL);
 
-	fwnode_property_read_string(child, "linux,default-trigger",
-				    &led_data->cdev.default_trigger);
-
 	if (!fwnode_property_read_string(child, "default-state", &tmp)) {
 		if (!strcmp(tmp, "on"))
 			state = LEDS_GPIO_DEFSTATE_ON;
diff --git a/drivers/leds/leds-max77650.c b/drivers/leds/leds-max77650.c
index acc1174197c35..1eeac56b00146 100644
--- a/drivers/leds/leds-max77650.c
+++ b/drivers/leds/leds-max77650.c
@@ -100,9 +100,6 @@ static int max77650_led_probe(struct platform_device *pdev)
 		led->cdev.brightness_set_blocking = max77650_led_brightness_set;
 		led->cdev.max_brightness = MAX77650_LED_MAX_BRIGHTNESS;
 
-		fwnode_property_read_string(child, "linux,default-trigger",
-					    &led->cdev.default_trigger);
-
 		init_data.fwnode = child;
 		init_data.devicename = "max77650";
 		/* for backwards compatibility if `label` is not present */
diff --git a/drivers/leds/leds-mt6323.c b/drivers/leds/leds-mt6323.c
index a1fceeb41d7e6..f59e0e8bda8bb 100644
--- a/drivers/leds/leds-mt6323.c
+++ b/drivers/leds/leds-mt6323.c
@@ -342,10 +342,6 @@ static int mt6323_led_set_dt_default(struct led_classdev *cdev,
 	const char *state;
 	int ret = 0;
 
-	led->cdev.default_trigger = of_get_property(np,
-						    "linux,default-trigger",
-						    NULL);
-
 	state = of_get_property(np, "default-state", NULL);
 	if (state) {
 		if (!strcmp(state, "keep")) {
diff --git a/drivers/leds/leds-ns2.c b/drivers/leds/leds-ns2.c
index 030f426af3d75..e1ec5cbed07e8 100644
--- a/drivers/leds/leds-ns2.c
+++ b/drivers/leds/leds-ns2.c
@@ -185,9 +185,6 @@ static int ns2_led_register(struct device *dev, struct device_node *np,
 	if (IS_ERR(led->slow))
 		return PTR_ERR(led->slow);
 
-	of_property_read_string(np, "linux,default-trigger",
-				&led->cdev.default_trigger);
-
 	ret = of_property_count_u32_elems(np, "modes-map");
 	if (ret < 0 || ret % 3) {
 		dev_err(dev, "Missing or malformed modes-map for %pOF\n", np);
diff --git a/drivers/leds/leds-pm8058.c b/drivers/leds/leds-pm8058.c
index 5247b04abb7ef..fb2ab72c0c40c 100644
--- a/drivers/leds/leds-pm8058.c
+++ b/drivers/leds/leds-pm8058.c
@@ -117,8 +117,6 @@ static int pm8058_led_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	led->cdev.default_trigger =
-		of_get_property(np, "linux,default-trigger", NULL);
 	led->cdev.brightness_set = pm8058_led_set;
 	led->cdev.brightness_get = pm8058_led_get;
 	if (led->ledtype == PM8058_LED_TYPE_COMMON)
diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index 4a014d2964123..2a16ae0bf022b 100644
--- a/drivers/leds/leds-pwm.c
+++ b/drivers/leds/leds-pwm.c
@@ -20,7 +20,6 @@
 
 struct led_pwm {
 	const char	*name;
-	const char	*default_trigger;
 	u8		active_low;
 	unsigned int	max_brightness;
 };
@@ -70,7 +69,6 @@ static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
 
 	led_data->active_low = led->active_low;
 	led_data->cdev.name = led->name;
-	led_data->cdev.default_trigger = led->default_trigger;
 	led_data->cdev.brightness = LED_OFF;
 	led_data->cdev.max_brightness = led->max_brightness;
 	led_data->cdev.flags = LED_CORE_SUSPENDRESUME;
@@ -124,9 +122,6 @@ static int led_pwm_create_fwnode(struct device *dev, struct led_pwm_priv *priv)
 			return -EINVAL;
 		}
 
-		fwnode_property_read_string(fwnode, "linux,default-trigger",
-					    &led.default_trigger);
-
 		led.active_low = fwnode_property_read_bool(fwnode,
 							   "active-low");
 		fwnode_property_read_u32(fwnode, "max-brightness",
diff --git a/drivers/leds/leds-syscon.c b/drivers/leds/leds-syscon.c
index f54935fa650a7..7eddb8ecb44ec 100644
--- a/drivers/leds/leds-syscon.c
+++ b/drivers/leds/leds-syscon.c
@@ -85,8 +85,6 @@ static int syscon_led_probe(struct platform_device *pdev)
 		return -EINVAL;
 	if (of_property_read_u32(np, "mask", &sled->mask))
 		return -EINVAL;
-	sled->cdev.default_trigger =
-		of_get_property(np, "linux,default-trigger", NULL);
 
 	state = of_get_property(np, "default-state", NULL);
 	if (state) {
diff --git a/drivers/leds/leds-tlc591xx.c b/drivers/leds/leds-tlc591xx.c
index 5e84a0c7aacbd..f24271337bd84 100644
--- a/drivers/leds/leds-tlc591xx.c
+++ b/drivers/leds/leds-tlc591xx.c
@@ -199,9 +199,6 @@ tlc591xx_probe(struct i2c_client *client,
 		led = &priv->leds[reg];
 
 		led->active = true;
-		led->ldev.default_trigger =
-			of_get_property(child, "linux,default-trigger", NULL);
-
 		led->priv = priv;
 		led->led_no = reg;
 		led->ldev.brightness_set_blocking = tlc591xx_brightness_set;
diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
index 117976cf75c8a..8c5bdc3847ee7 100644
--- a/drivers/leds/leds-turris-omnia.c
+++ b/drivers/leds/leds-turris-omnia.c
@@ -121,8 +121,6 @@ static int omnia_led_register(struct i2c_client *client, struct omnia_led *led,
 	cdev->max_brightness = 255;
 	cdev->brightness_set_blocking = omnia_led_brightness_set_blocking;
 
-	of_property_read_string(np, "linux,default-trigger", &cdev->default_trigger);
-
 	/* put the LED into software mode */
 	ret = i2c_smbus_write_byte_data(client, CMD_LED_MODE,
 					CMD_LED_MODE_LED(led->reg) |
-- 
2.26.2

