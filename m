Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D155226E884
	for <lists+linux-leds@lfdr.de>; Fri, 18 Sep 2020 00:34:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726354AbgIQWeb (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 17 Sep 2020 18:34:31 -0400
Received: from mail.nic.cz ([217.31.204.67]:35844 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726361AbgIQWeU (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 17 Sep 2020 18:34:20 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id D6290140A7F;
        Fri, 18 Sep 2020 00:34:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600382043; bh=pLtMtdFnbEp3DRRyAAdbeWVG6uj58PfNKrN6auAX6Fw=;
        h=From:To:Date;
        b=c/V296vkWb1laKWprTexBfzbyCva+6NbrciQZcpgIv33Z+7/lMx6wuPHEUpeMJo5S
         GRhUcg2n258k6YQevqoMtwH5fCNc+TFy8Y2yUNTqQhX/r92ebFELppAjQ4OL3t1lXC
         TEsJDGW3y3T9vySg6OkM7JuykDX1UJ/FrZCLhdeM=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megous@megous.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
Subject: [PATCH leds v2 50/50] leds: parse linux,default-trigger DT property in LED core
Date:   Fri, 18 Sep 2020 00:33:38 +0200
Message-Id: <20200917223338.14164-51-marek.behun@nic.cz>
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

Do parsing of `linux,default-trigger` DT property to LED core. Currently
it is done in many different drivers and the code is repeated.

This patch removes the parsing from 21 drivers:
  an30259a, aw2013, bcm6328, bcm6358, cr0014114, el15203000, gpio,
  is31fl319x, is31fl32xx, lm3532, lm36274, lm3692x, lm3697, lp8860,
  lt3593, max77650, mt6323, ns2, pm8058, tlc591xx and turris-omnia.

There are still 11 drivers that parse this property on their own because
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
 drivers/leds/leds-is31fl319x.c   | 5 -----
 drivers/leds/leds-is31fl32xx.c   | 3 ---
 drivers/leds/leds-lm3532.c       | 3 ---
 drivers/leds/leds-lm36274.c      | 3 ---
 drivers/leds/leds-lm3692x.c      | 3 ---
 drivers/leds/leds-lm3697.c       | 3 ---
 drivers/leds/leds-lp8860.c       | 4 ----
 drivers/leds/leds-lt3593.c       | 3 ---
 drivers/leds/leds-max77650.c     | 3 ---
 drivers/leds/leds-mt6323.c       | 4 ----
 drivers/leds/leds-ns2.c          | 3 ---
 drivers/leds/leds-pm8058.c       | 2 --
 drivers/leds/leds-tlc591xx.c     | 3 ---
 drivers/leds/leds-turris-omnia.c | 2 --
 22 files changed, 5 insertions(+), 67 deletions(-)

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
index 38bf820372528..f89ca2143b95d 100644
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
index 71c49d5fa811f..aabf68d276216 100644
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
index a2f5638eda5f7..e0be7603d4791 100644
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
index bcd13a7fc9d02..f8a56ebd87060 100644
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
index aa740267eb232..09fd6b1e8fc38 100644
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
diff --git a/drivers/leds/leds-is31fl319x.c b/drivers/leds/leds-is31fl319x.c
index ef5b3e08c7313..23616dded8284 100644
--- a/drivers/leds/leds-is31fl319x.c
+++ b/drivers/leds/leds-is31fl319x.c
@@ -293,11 +293,6 @@ static int is31fl319x_led_register(struct device *dev,
 		return -EEXIST;
 	}
 
-	ret = of_property_read_string(np, "linux,default-trigger",
-				      &led->cdev.default_trigger);
-	if (ret < 0 && ret != -EINVAL) /* is optional */
-		return ret;
-
 	led->configured = true;
 	led->chip = is31;
 	led->cdev.brightness_set_blocking = is31fl319x_brightness_set;
diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index 279f52931a177..d21b333a17e8e 100644
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
index 3670cc64eee7b..610168dc7ad77 100644
--- a/drivers/leds/leds-lm3532.c
+++ b/drivers/leds/leds-lm3532.c
@@ -643,9 +643,6 @@ static int lm3532_parse_node(struct lm3532_data *priv)
 			goto child_out;
 		}
 
-		fwnode_property_read_string(child, "linux,default-trigger",
-					    &led->led_dev.default_trigger);
-
 		ret = fwnode_property_read_string(child, "label", &name);
 		if (ret)
 			snprintf(led->label, sizeof(led->label),
diff --git a/drivers/leds/leds-lm36274.c b/drivers/leds/leds-lm36274.c
index b61c97ed26603..b49b85207fd8a 100644
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
index ba535ee8fd252..27327bf6ea025 100644
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
index 0c5c29730c407..50338ae0b7857 100644
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
diff --git a/drivers/leds/leds-lp8860.c b/drivers/leds/leds-lp8860.c
index b69ed81d52ab4..f9b8abaac6b73 100644
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
index bed620fc1b82e..169686a205000 100644
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
index 5119dcc0aef24..b46661b4c36b2 100644
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
index b021e94d512c9..d033c4e08d45b 100644
--- a/drivers/leds/leds-ns2.c
+++ b/drivers/leds/leds-ns2.c
@@ -189,9 +189,6 @@ static int ns2_led_register(struct device *dev, struct device_node *np,
 	if (IS_ERR(led->slow))
 		return PTR_ERR(led->slow);
 
-	of_property_read_string(np, "linux,default-trigger",
-				&led->cdev.default_trigger);
-
 	ret = of_property_count_u32_elems(np, "modes-map");
 	if (ret < 0 || ret % 3) {
 		dev_err(dev, "Missing or malformed modes-map for %pOF\n", np);
diff --git a/drivers/leds/leds-pm8058.c b/drivers/leds/leds-pm8058.c
index 80db7e2de420c..bcb0a214f6eff 100644
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
index c276969137d7f..ad941dd1484fa 100644
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

