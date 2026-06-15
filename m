Return-Path: <linux-leds+bounces-8599-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BkosBWzqL2rpIwUAu9opvQ
	(envelope-from <linux-leds+bounces-8599-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jun 2026 14:05:00 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 103EE685F4A
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jun 2026 14:04:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=siemens.com header.s=fm2 header.b=aN6lteHj;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8599-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8599-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=siemens.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 161233008FFC
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jun 2026 12:04:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 261933E7BDD;
	Mon, 15 Jun 2026 12:04:19 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528413E5EFB
	for <linux-leds@vger.kernel.org>; Mon, 15 Jun 2026 12:04:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781525059; cv=none; b=eM5GU3hqCJuXnHNxcayNnuJejAjvtrFi/IT2qLN/0gksx7qamnc6FHbQFT8lU8pU7Go2Beyxu6g87ut4vnzHoherKMWmiPg55EENE6LcdeeQhHg1zWpxz2/1wwfc9t3cc5YGYFocWz6yc071cuTytmzbxn7iZj5ZiSUfN8RjeZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781525059; c=relaxed/simple;
	bh=dr54UhYPRBZhshkRcM7IIT7DIAjUQfXxghCTh7tiUj0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qYR/ooIxHqvcOA+G40AvE9Smwjmv6W2NeWOPYn2rYCC6VREyLxwlWF27c+miZkIR/xpnIp4ktkhbV9nX7Z5Twf9UasnP6wB4gopZfCDV6l+POyECjApNeD7gdDpAFPPxHOJMfSi+6pPvrfYYW6Tl3OJ4JhlZdF4ReI9g44x91BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b=aN6lteHj; arc=none smtp.client-ip=185.136.64.227
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202606151203598b478df4e10002071c
        for <linux-leds@vger.kernel.org>;
        Mon, 15 Jun 2026 14:03:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=XjubY+Oh7WrvZuuR0c/SqxZ8wz+Iz0kfD8bDny81Jxs=;
 b=aN6lteHjfYiuU2UfzbzC08aCDT6K7TtaW20De4LNNY21I3pZRU8sSgO9zGNsCbeU1qzDpT
 A66pGhPnrFP8Nt5QgARh1ceqhD+3OZ40SJ0BIoJyQmucal18iMaSf7aEAMsNz38rLQtQu8yS
 6tQ6TqFhl3kfJ4lXm7tphenLnM2GjMqe0KLVWH0t/M9DaaPAFEPwcc31/hHe1OwP/WSrGkFg
 6p//EQLLXe8hfpqEl+tKca3RJqHaKaVu0hkC+whyA+nO6EtSwRlmA0RcJFBfGwN7mhjEov/h
 jX5HmvE4Fn+3Ftmo3hy3YRiZKDhcZCzzVSYAUUUq9pvEDcgDZBBZ2wtw==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: linux-leds@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Andrew Davis <afd@ti.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH 3/3] backlight: lp8864: Convert from LED to backlight class driver
Date: Mon, 15 Jun 2026 14:03:49 +0200
Message-ID: <20260615120353.3409035-4-alexander.sverdlin@siemens.com>
In-Reply-To: <20260615120353.3409035-1-alexander.sverdlin@siemens.com>
References: <20260615120353.3409035-1-alexander.sverdlin@siemens.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[siemens.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[siemens.com:s=fm2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-8599-lists,linux-leds=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[siemens.com,kernel.org,gmail.com,gmx.de,ti.com,lists.freedesktop.org,vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[alexander.sverdlin@siemens.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linux-leds@vger.kernel.org,m:alexander.sverdlin@siemens.com,m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:deller@gmx.de,m:afd@ti.com,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexander.sverdlin@siemens.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[siemens.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,ti.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 103EE685F4A

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Move the TI LP8864/LP8866 driver from drivers/leds/ to
drivers/video/backlight/ and convert it to register a backlight class
device as its primary interface.

The motivation is a use case on a hot-pluggable segment of an I2C bus.
The generic led-backlight driver (drivers/video/backlight/led_bl.c) is a
platform driver and as such inherently non-hotpluggable. It cannot react
to dynamic appearance/disappearance of the underlying I2C device. By
making the LP8864 driver directly register a backlight class device, it
becomes a native I2C driver that properly supports hot-plug/unplug
events on the I2C bus.

Key changes:
- Register a backlight class device using
  devm_backlight_device_register() as the primary interface
- Implement backlight_ops (update_status, get_brightness)
- The hardware 16-bit brightness register (0x0000-0xFFFF) is directly
  exposed as the backlight brightness range
- Support DT properties "default-brightness" and "max-brightness"
  from the backlight common binding
- Include BL_CORE_SUSPENDRESUME for proper power management integration
- Preserve backward-compatible LED class device registration: if the
  "led" child node is present in the DT, an LED class device is also
  registered (same as the original driver behavior)
- Preserve the CONFIG_LEDS_LP8864 Kconfig symbol name so that existing
  kernel configurations are not affected
- Update MAINTAINERS to reflect the new file location

This will be noticeable for applications which already used the LP8864
as a backend for the generic led-backlight platform driver, as a
backlight device will now appear directly in addition to the LED class
device. However, no in-tree device-trees reference this driver, so
there is no mainline impact.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
 MAINTAINERS                                   |   2 +-
 drivers/leds/Kconfig                          |  12 --
 drivers/leds/Makefile                         |   1 -
 drivers/video/backlight/Kconfig               |  15 +++
 drivers/video/backlight/Makefile              |   1 +
 .../backlight/lp8864_bl.c}                    | 111 ++++++++++++++----
 6 files changed, 106 insertions(+), 36 deletions(-)
 rename drivers/{leds/leds-lp8864.c => video/backlight/lp8864_bl.c} (70%)

diff --git a/MAINTAINERS b/MAINTAINERS
index dbd4552236e64..250e8b1ed4bb5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26481,7 +26481,7 @@ M:	Alexander Sverdlin <alexander.sverdlin@siemens.com>
 L:	linux-leds@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
-F:	drivers/leds/leds-lp8864.c
+F:	drivers/video/backlight/lp8864_bl.c
 
 TEXAS INSTRUMENTS' SYSTEM CONTROL INTERFACE (TISCI) PROTOCOL DRIVER
 M:	Nishanth Menon <nm@ti.com>
diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index f4a0a3c8c8705..990cb9ef18c1e 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -529,18 +529,6 @@ config LEDS_LP8860
 	  on the LP8860 4 channel LED driver using the I2C communication
 	  bus.
 
-config LEDS_LP8864
-	tristate "LED support for the TI LP8864/LP8866 4/6 channel LED drivers"
-	depends on LEDS_CLASS && I2C && OF
-	select REGMAP_I2C
-	help
-	  If you say yes here you get support for the TI LP8864-Q1,
-	  LP8864S-Q1, LP8866-Q1, LP8866S-Q1 4/6 channel LED backlight
-	  drivers with I2C interface.
-
-	  To compile this driver as a module, choose M here: the
-	  module will be called leds-lp8864.
-
 config LEDS_CLEVO_MAIL
 	tristate "Mail LED on Clevo notebook"
 	depends on LEDS_CLASS && BROKEN
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 8fdb45d5b4393..5e624a48aa2a5 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -59,7 +59,6 @@ obj-$(CONFIG_LEDS_LP55XX_COMMON)	+= leds-lp55xx-common.o
 obj-$(CONFIG_LEDS_LP8501)		+= leds-lp8501.o
 obj-$(CONFIG_LEDS_LP8788)		+= leds-lp8788.o
 obj-$(CONFIG_LEDS_LP8860)		+= leds-lp8860.o
-obj-$(CONFIG_LEDS_LP8864)		+= leds-lp8864.o
 obj-$(CONFIG_LEDS_LT3593)		+= leds-lt3593.o
 obj-$(CONFIG_LEDS_MAX5970)		+= leds-max5970.o
 obj-$(CONFIG_LEDS_MAX77650)		+= leds-max77650.o
diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
index a7a3fbaf7c29e..82ecd7e46236d 100644
--- a/drivers/video/backlight/Kconfig
+++ b/drivers/video/backlight/Kconfig
@@ -514,6 +514,21 @@ config BACKLIGHT_LED
 	  If you have a LCD backlight adjustable by LED class driver, say Y
 	  to enable this driver.
 
+config LEDS_LP8864
+	tristate "Backlight driver for TI LP8864/LP8866 4/6 channel LED drivers"
+	depends on I2C && OF
+	select REGMAP_I2C
+	select NEW_LEDS
+	select LEDS_CLASS
+	help
+	  If you say yes here you get support for the TI LP8864-Q1,
+	  LP8864S-Q1, LP8866-Q1, LP8866S-Q1 4/6 channel LED backlight
+	  drivers with I2C interface. The driver registers a backlight
+	  class device and optionally an LED class device.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called lp8864_bl.
+
 endif # BACKLIGHT_CLASS_DEVICE
 
 endmenu
diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
index 794820a98ed49..6a7287d01d81b 100644
--- a/drivers/video/backlight/Makefile
+++ b/drivers/video/backlight/Makefile
@@ -62,3 +62,4 @@ obj-$(CONFIG_BACKLIGHT_WM831X)		+= wm831x_bl.o
 obj-$(CONFIG_BACKLIGHT_ARCXCNN) 	+= arcxcnn_bl.o
 obj-$(CONFIG_BACKLIGHT_RAVE_SP)		+= rave-sp-backlight.o
 obj-$(CONFIG_BACKLIGHT_LED)		+= led_bl.o
+obj-$(CONFIG_LEDS_LP8864)		+= lp8864_bl.o
diff --git a/drivers/leds/leds-lp8864.c b/drivers/video/backlight/lp8864_bl.c
similarity index 70%
rename from drivers/leds/leds-lp8864.c
rename to drivers/video/backlight/lp8864_bl.c
index d05211b970c94..67b28f7daedd2 100644
--- a/drivers/leds/leds-lp8864.c
+++ b/drivers/video/backlight/lp8864_bl.c
@@ -1,12 +1,13 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * TI LP8864/LP8866 4/6 Channel LED Driver
+ * TI LP8864/LP8866 4/6 Channel LED Backlight Driver
  *
- * Copyright (C) 2024 Siemens AG
+ * Copyright (C) 2024-2026 Siemens AG
  *
  * Based on LP8860 driver by Dan Murphy <dmurphy@ti.com>
  */
 
+#include <linux/backlight.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
@@ -27,6 +28,8 @@
 #define LP8864_LED_STATUS		0x12
 #define   LP8864_LED_STATUS_WR_MASK	GENMASK(14, 9)	/* Writeable bits in the LED_STATUS reg */
 
+#define LP8864_MAX_BRIGHTNESS		0xffff
+
 /* Textual meaning for status bits, starting from bit 1 */
 static const char *const lp8864_supply_status_msg[] = {
 	"Vin under-voltage fault",
@@ -71,13 +74,15 @@ static const char *const lp8864_led_status_msg[] = {
 /**
  * struct lp8864
  * @client: Pointer to the I2C client
- * @led_dev: led class device pointer
+ * @led_dev: optional led class device pointer
+ * @bl: backlight device pointer
  * @regmap: Devices register map
  * @led_status_mask: Helps to report LED fault only once
  */
 struct lp8864 {
 	struct i2c_client *client;
-	struct led_classdev led_dev;
+	struct led_classdev *led_dev;
+	struct backlight_device *bl;
 	struct regmap *regmap;
 	u16 led_status_mask;
 };
@@ -157,28 +162,59 @@ static int lp8864_fault_check(struct lp8864 *priv)
 	return ret;
 }
 
-static int lp8864_brightness_set(struct led_classdev *led_cdev,
-				 enum led_brightness brt_val)
+static int lp8864_brightness_set(struct lp8864 *priv, unsigned int brightness)
 {
-	struct lp8864 *priv = container_of(led_cdev, struct lp8864, led_dev);
-	/* Scale 0..LED_FULL into 16-bit HW brightness */
-	unsigned int val = brt_val * 0xffff / LED_FULL;
 	int ret;
 
 	ret = lp8864_fault_check(priv);
 	if (ret)
 		return ret;
 
-	ret = regmap_write(priv->regmap, LP8864_BRT_CONTROL, val);
+	ret = regmap_write(priv->regmap, LP8864_BRT_CONTROL, brightness);
 	if (ret)
 		dev_err(&priv->client->dev, "Failed to write brightness value\n");
 
 	return ret;
 }
 
-static enum led_brightness lp8864_brightness_get(struct led_classdev *led_cdev)
+static int lp8864_backlight_update_status(struct backlight_device *bl)
+{
+	return lp8864_brightness_set(bl_get_data(bl), backlight_get_brightness(bl));
+}
+
+static int lp8864_backlight_get_brightness(struct backlight_device *bl)
 {
-	struct lp8864 *priv = container_of(led_cdev, struct lp8864, led_dev);
+	struct lp8864 *priv = bl_get_data(bl);
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(priv->regmap, LP8864_BRT_CONTROL, &val);
+	if (ret) {
+		dev_err(&priv->client->dev, "Failed to read brightness value\n");
+		return ret;
+	}
+
+	return val;
+}
+
+static const struct backlight_ops lp8864_backlight_ops = {
+	.options = BL_CORE_SUSPENDRESUME,
+	.update_status = lp8864_backlight_update_status,
+	.get_brightness = lp8864_backlight_get_brightness,
+};
+
+static int lp8864_led_brightness_set(struct led_classdev *led_cdev,
+				     enum led_brightness brt_val)
+{
+	struct lp8864 *priv = dev_get_drvdata(led_cdev->dev->parent);
+
+	/* Scale 0..LED_FULL into 16-bit HW brightness */
+	return lp8864_brightness_set(priv, brt_val * 0xffff / LED_FULL);
+}
+
+static enum led_brightness lp8864_led_brightness_get(struct led_classdev *led_cdev)
+{
+	struct lp8864 *priv = dev_get_drvdata(led_cdev->dev->parent);
 	unsigned int val;
 	int ret;
 
@@ -212,18 +248,15 @@ static int lp8864_probe(struct i2c_client *client)
 	struct device_node *np = dev_of_node(&client->dev);
 	struct device_node *child_node;
 	struct led_init_data init_data = {};
+	struct backlight_device *bl;
+	struct backlight_properties props;
 	struct gpio_desc *enable_gpio;
+	u32 val;
 
 	priv = devm_kzalloc(&client->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
-	child_node = of_get_next_available_child(np, NULL);
-	if (!child_node) {
-		dev_err(&client->dev, "No LED function defined\n");
-		return -EINVAL;
-	}
-
 	ret = devm_regulator_get_enable_optional(&client->dev, "vled");
 	if (ret && ret != -ENODEV)
 		return dev_err_probe(&client->dev, ret, "Failed to enable vled regulator\n");
@@ -238,8 +271,7 @@ static int lp8864_probe(struct i2c_client *client)
 		return ret;
 
 	priv->client = client;
-	priv->led_dev.brightness_set_blocking = lp8864_brightness_set;
-	priv->led_dev.brightness_get = lp8864_brightness_get;
+	i2c_set_clientdata(client, priv);
 
 	priv->regmap = devm_regmap_init_i2c(client, &lp8864_regmap_config);
 	if (IS_ERR(priv->regmap))
@@ -258,11 +290,46 @@ static int lp8864_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
+	/* Register backlight class device */
+	memset(&props, 0, sizeof(props));
+	props.type = BACKLIGHT_RAW;
+	props.max_brightness = LP8864_MAX_BRIGHTNESS;
+	props.brightness = LP8864_MAX_BRIGHTNESS;
+	props.scale = BACKLIGHT_SCALE_LINEAR;
+
+	if (!device_property_read_u32(&client->dev, "max-brightness", &val))
+		props.max_brightness = val;
+
+	if (!device_property_read_u32(&client->dev, "default-brightness", &val))
+		props.brightness = val;
+
+	bl = devm_backlight_device_register(&client->dev, "lp8864-backlight",
+					    &client->dev, priv,
+					    &lp8864_backlight_ops, &props);
+	if (IS_ERR(bl))
+		return dev_err_probe(&client->dev, PTR_ERR(bl),
+				     "Failed to register backlight device\n");
+
+	priv->bl = bl;
+	backlight_update_status(bl);
+
+	/* Register LED class device if "led" child node is present */
+	child_node = of_get_available_child_by_name(np, "led");
+	if (!child_node)
+		return 0;
+
+	priv->led_dev = devm_kzalloc(&client->dev, sizeof(*priv->led_dev), GFP_KERNEL);
+	if (!priv->led_dev)
+		return -ENOMEM;
+
+	priv->led_dev->brightness_set_blocking = lp8864_led_brightness_set;
+	priv->led_dev->brightness_get = lp8864_led_brightness_get;
+
 	init_data.fwnode = of_fwnode_handle(child_node);
 	init_data.devicename = "lp8864";
 	init_data.default_label = ":display_cluster";
 
-	ret = devm_led_classdev_register_ext(&client->dev, &priv->led_dev, &init_data);
+	ret = devm_led_classdev_register_ext(&client->dev, priv->led_dev, &init_data);
 	if (ret)
 		dev_err(&client->dev, "Failed to register LED device (%pe)\n", ERR_PTR(ret));
 
@@ -291,6 +358,6 @@ static struct i2c_driver lp8864_driver = {
 };
 module_i2c_driver(lp8864_driver);
 
-MODULE_DESCRIPTION("Texas Instruments LP8864/LP8866 LED driver");
+MODULE_DESCRIPTION("Texas Instruments LP8864/LP8866 LED Backlight driver");
 MODULE_AUTHOR("Alexander Sverdlin <alexander.sverdlin@siemens.com>");
 MODULE_LICENSE("GPL");
-- 
2.54.0


