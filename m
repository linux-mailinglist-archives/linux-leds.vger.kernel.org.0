Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 609BE26CF63
	for <lists+linux-leds@lfdr.de>; Thu, 17 Sep 2020 01:17:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726945AbgIPXQ6 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 16 Sep 2020 19:16:58 -0400
Received: from mail.nic.cz ([217.31.204.67]:53746 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726420AbgIPXQ4 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 16 Sep 2020 19:16:56 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 3EDB91408AF;
        Thu, 17 Sep 2020 01:16:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600298212; bh=AbnPnVWt+Da37oxuFuXapS3hCWqJtAW5p1XQuwmXBVg=;
        h=From:To:Date;
        b=mc52j3ijX0U/PYTbi7tDxZLx3/QfoMABUe4pz4frbfTn1hW3uhjB+MQSQGQVtqzpw
         GyUqITCSnQyqE0BhKNsV5QIJOsLmUN9DwIt4t28oPEBOxLPOeHwvDSNtn+sbstAPv8
         SBRuvxNV28jnv/9yn/LOA5y8OVucIgw89OBlwtbE=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megous@megous.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
Subject: [PATCH leds v1 01/10] leds: parse linux,default-trigger DT property in LED core
Date:   Thu, 17 Sep 2020 01:16:41 +0200
Message-Id: <20200916231650.11484-2-marek.behun@nic.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200916231650.11484-1-marek.behun@nic.cz>
References: <20200916231650.11484-1-marek.behun@nic.cz>
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

This commit removes the parsing only from drivers where the removal is
simple, i.e. those which pass struct led_init_data with fwnode handle to
the LED classdev registering function.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
---
 drivers/leds/led-class.c         | 5 +++++
 drivers/leds/leds-an30259a.c     | 3 ---
 drivers/leds/leds-aw2013.c       | 3 ---
 drivers/leds/leds-cr0014114.c    | 3 ---
 drivers/leds/leds-el15203000.c   | 3 ---
 drivers/leds/leds-gpio.c         | 3 ---
 drivers/leds/leds-lm3532.c       | 3 ---
 drivers/leds/leds-lm3692x.c      | 3 ---
 drivers/leds/leds-lp8860.c       | 4 ----
 drivers/leds/leds-lt3593.c       | 3 ---
 drivers/leds/leds-tlc591xx.c     | 2 --
 drivers/leds/leds-turris-omnia.c | 2 --
 12 files changed, 5 insertions(+), 32 deletions(-)

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
index 82350a28a5644..d8aea64563414 100644
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
index d709cc1f949e3..8be8a185bfa30 100644
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
diff --git a/drivers/leds/leds-lm3532.c b/drivers/leds/leds-lm3532.c
index 946ad67eaecb7..dac037141d445 100644
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
diff --git a/drivers/leds/leds-lp8860.c b/drivers/leds/leds-lp8860.c
index ac2f5d6272dc0..20b463f290431 100644
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
index 9079850e6ea44..da96340271dfe 100644
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
diff --git a/drivers/leds/leds-tlc591xx.c b/drivers/leds/leds-tlc591xx.c
index 1dc14051639c9..de22c28c42a56 100644
--- a/drivers/leds/leds-tlc591xx.c
+++ b/drivers/leds/leds-tlc591xx.c
@@ -204,8 +204,6 @@ tlc591xx_probe(struct i2c_client *client,
 		led = &priv->leds[reg];
 
 		led->active = true;
-		led->ldev.default_trigger =
-			of_get_property(child, "linux,default-trigger", NULL);
 
 		led->priv = priv;
 		led->led_no = reg;
diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
index bb23d8e166144..7ef5ee2c0773e 100644
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

