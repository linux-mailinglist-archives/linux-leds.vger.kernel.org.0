Return-Path: <linux-leds+bounces-8596-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YZmECljrL2ohJAUAu9opvQ
	(envelope-from <linux-leds+bounces-8596-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jun 2026 14:08:56 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 926B068600B
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jun 2026 14:08:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=siemens.com header.s=fm2 header.b=lGYvKlmS;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8596-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8596-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=siemens.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F0B08307A0D1
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jun 2026 12:04:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21E1B3E5EC5;
	Mon, 15 Jun 2026 12:04:12 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BC73E5EFB
	for <linux-leds@vger.kernel.org>; Mon, 15 Jun 2026 12:04:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781525052; cv=none; b=AeIyRZGmGEVqZeVZr3JtmV8wrnQXqAuobUq8ZW/6yXe9QUYF7MLarz/qN1sDwuCcHQV4/c1OuWk+eQ/GsE1AHiROclFDF9yO+IA/1q4idazBsQVSSZaLpHppfwOl9YlSV5DYF+CoCNRyiZeiFxz3JHW+f1PDa/7wCWbYPjNaRfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781525052; c=relaxed/simple;
	bh=sWlMr/SC9/o1ef7nUsKbQ7R1KXehA1OX6f8zErz0EV8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LXScv7e2zE7fud4ZM9n16TQyIqFe8BnuDK5W1y4HJYEqwWeCGXTXTqUKurzNLEI1ZNLiL8++y0vMy2GctanIVLCnYDrIMVVsSxHCqN0VBdcrJt/3/2yuEBiw7RALieWextFeHtAs066Lyb/LRJpsZVqObMotz9rJ+IxYfiaYNmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b=lGYvKlmS; arc=none smtp.client-ip=185.136.65.225
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20260615120358efd907aedc000207af
        for <linux-leds@vger.kernel.org>;
        Mon, 15 Jun 2026 14:03:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=kfviCFmmVXESKpqwYOHN1tzc25WNDVOaT5tGn2iOj50=;
 b=lGYvKlmSoizJac/jQQQED7veF6GXTVcUrAb6xb0R1eFO3C0jINpA8+xBcM1WZQl1+H8Y5G
 /Mc1kTJDpHNUnzgwv8vDvyIfb72piXQQXt8XBUCjxYmwd8TcKqn4XZhzS2JXBKu+ncBhnRBI
 OeiquP2ZjhRzS2mnI48REWmfE5dzbJjDZF8mHkU8hfnEZlCW/D26tVZxucdOxVvZYqx/8TU/
 KoQxiYnHPPpsCnl+14OcB/YrwrH9exy0v+WbiB3yzl3mDW6/++HxrrWNxCu6Po3SpmemhZQm
 n4IZLGmH4f4/ZI8GRiFlPTknXkfJWDIqpnQk+vsUOMG9L/uh4G39YvDA==;
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
Subject: [PATCH 2/3] leds: lp8864: Rename struct lp8864_led and local variables
Date: Mon, 15 Jun 2026 14:03:48 +0200
Message-ID: <20260615120353.3409035-3-alexander.sverdlin@siemens.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-8596-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[siemens.com:dkim,siemens.com:email,siemens.com:mid,siemens.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 926B068600B

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Rename struct lp8864_led to struct lp8864 and the local variable 'led'
to 'priv' throughout the driver. The LED functionality will become
optional in a subsequent patch that adds backlight class support, so
having the driver's private data structure and variables named after
LED-specifics is misleading.

No functional change.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
 drivers/leds/leds-lp8864.c | 70 +++++++++++++++++++-------------------
 1 file changed, 35 insertions(+), 35 deletions(-)

diff --git a/drivers/leds/leds-lp8864.c b/drivers/leds/leds-lp8864.c
index 3afd729d2f8a6..d05211b970c94 100644
--- a/drivers/leds/leds-lp8864.c
+++ b/drivers/leds/leds-lp8864.c
@@ -69,32 +69,32 @@ static const char *const lp8864_led_status_msg[] = {
 };
 
 /**
- * struct lp8864_led
+ * struct lp8864
  * @client: Pointer to the I2C client
  * @led_dev: led class device pointer
  * @regmap: Devices register map
  * @led_status_mask: Helps to report LED fault only once
  */
-struct lp8864_led {
+struct lp8864 {
 	struct i2c_client *client;
 	struct led_classdev led_dev;
 	struct regmap *regmap;
 	u16 led_status_mask;
 };
 
-static int lp8864_fault_check(struct lp8864_led *led)
+static int lp8864_fault_check(struct lp8864 *priv)
 {
 	int ret, i;
 	unsigned int val;
 
-	ret = regmap_read(led->regmap, LP8864_SUPPLY_STATUS, &val);
+	ret = regmap_read(priv->regmap, LP8864_SUPPLY_STATUS, &val);
 	if (ret)
 		goto err;
 
 	/* Odd bits are status bits, even bits are clear bits */
 	for (i = 0; i < ARRAY_SIZE(lp8864_supply_status_msg); i++)
 		if (val & BIT(i * 2 + 1))
-			dev_warn(&led->client->dev, "%s\n", lp8864_supply_status_msg[i]);
+			dev_warn(&priv->client->dev, "%s\n", lp8864_supply_status_msg[i]);
 
 	/*
 	 * Clear bits have an index preceding the corresponding Status bits;
@@ -102,25 +102,25 @@ static int lp8864_fault_check(struct lp8864_led *led)
 	 * Status bit.
 	 */
 	if (val)
-		ret = regmap_write(led->regmap, LP8864_SUPPLY_STATUS, val >> 1 | val);
+		ret = regmap_write(priv->regmap, LP8864_SUPPLY_STATUS, val >> 1 | val);
 	if (ret)
 		goto err;
 
-	ret = regmap_read(led->regmap, LP8864_BOOST_STATUS, &val);
+	ret = regmap_read(priv->regmap, LP8864_BOOST_STATUS, &val);
 	if (ret)
 		goto err;
 
 	/* Odd bits are status bits, even bits are clear bits */
 	for (i = 0; i < ARRAY_SIZE(lp8864_boost_status_msg); i++)
 		if (val & BIT(i * 2 + 1))
-			dev_warn(&led->client->dev, "%s\n", lp8864_boost_status_msg[i]);
+			dev_warn(&priv->client->dev, "%s\n", lp8864_boost_status_msg[i]);
 
 	if (val)
-		ret = regmap_write(led->regmap, LP8864_BOOST_STATUS, val >> 1 | val);
+		ret = regmap_write(priv->regmap, LP8864_BOOST_STATUS, val >> 1 | val);
 	if (ret)
 		goto err;
 
-	ret = regmap_read(led->regmap, LP8864_LED_STATUS, &val);
+	ret = regmap_read(priv->regmap, LP8864_LED_STATUS, &val);
 	if (ret)
 		goto err;
 
@@ -128,31 +128,31 @@ static int lp8864_fault_check(struct lp8864_led *led)
 	 * Clear already reported faults that maintain their value until device
 	 * power-down
 	 */
-	val &= ~led->led_status_mask;
+	val &= ~priv->led_status_mask;
 
 	for (i = 0; i < ARRAY_SIZE(lp8864_led_status_msg); i++)
 		if (lp8864_led_status_msg[i] && val & BIT(i))
-			dev_warn(&led->client->dev, "%s\n", lp8864_led_status_msg[i]);
+			dev_warn(&priv->client->dev, "%s\n", lp8864_led_status_msg[i]);
 
 	/*
 	 * Mark those which maintain their value until device power-down as
 	 * "already reported"
 	 */
-	led->led_status_mask |= val & ~LP8864_LED_STATUS_WR_MASK;
+	priv->led_status_mask |= val & ~LP8864_LED_STATUS_WR_MASK;
 
 	/*
 	 * Only bits 14, 12, 10 have to be cleared here, but others are RO,
 	 * we don't care what we write to them.
 	 */
 	if (val & LP8864_LED_STATUS_WR_MASK)
-		ret = regmap_write(led->regmap, LP8864_LED_STATUS, val >> 1 | val);
+		ret = regmap_write(priv->regmap, LP8864_LED_STATUS, val >> 1 | val);
 	if (ret)
 		goto err;
 
 	return 0;
 
 err:
-	dev_err(&led->client->dev, "Failed to read/clear faults (%pe)\n", ERR_PTR(ret));
+	dev_err(&priv->client->dev, "Failed to read/clear faults (%pe)\n", ERR_PTR(ret));
 
 	return ret;
 }
@@ -160,31 +160,31 @@ static int lp8864_fault_check(struct lp8864_led *led)
 static int lp8864_brightness_set(struct led_classdev *led_cdev,
 				 enum led_brightness brt_val)
 {
-	struct lp8864_led *led = container_of(led_cdev, struct lp8864_led, led_dev);
+	struct lp8864 *priv = container_of(led_cdev, struct lp8864, led_dev);
 	/* Scale 0..LED_FULL into 16-bit HW brightness */
 	unsigned int val = brt_val * 0xffff / LED_FULL;
 	int ret;
 
-	ret = lp8864_fault_check(led);
+	ret = lp8864_fault_check(priv);
 	if (ret)
 		return ret;
 
-	ret = regmap_write(led->regmap, LP8864_BRT_CONTROL, val);
+	ret = regmap_write(priv->regmap, LP8864_BRT_CONTROL, val);
 	if (ret)
-		dev_err(&led->client->dev, "Failed to write brightness value\n");
+		dev_err(&priv->client->dev, "Failed to write brightness value\n");
 
 	return ret;
 }
 
 static enum led_brightness lp8864_brightness_get(struct led_classdev *led_cdev)
 {
-	struct lp8864_led *led = container_of(led_cdev, struct lp8864_led, led_dev);
+	struct lp8864 *priv = container_of(led_cdev, struct lp8864, led_dev);
 	unsigned int val;
 	int ret;
 
-	ret = regmap_read(led->regmap, LP8864_BRT_CONTROL, &val);
+	ret = regmap_read(priv->regmap, LP8864_BRT_CONTROL, &val);
 	if (ret) {
-		dev_err(&led->client->dev, "Failed to read brightness value\n");
+		dev_err(&priv->client->dev, "Failed to read brightness value\n");
 		return ret;
 	}
 
@@ -208,14 +208,14 @@ static void lp8864_disable_gpio(void *data)
 static int lp8864_probe(struct i2c_client *client)
 {
 	int ret;
-	struct lp8864_led *led;
+	struct lp8864 *priv;
 	struct device_node *np = dev_of_node(&client->dev);
 	struct device_node *child_node;
 	struct led_init_data init_data = {};
 	struct gpio_desc *enable_gpio;
 
-	led = devm_kzalloc(&client->dev, sizeof(*led), GFP_KERNEL);
-	if (!led)
+	priv = devm_kzalloc(&client->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
 		return -ENOMEM;
 
 	child_node = of_get_next_available_child(np, NULL);
@@ -237,24 +237,24 @@ static int lp8864_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
-	led->client = client;
-	led->led_dev.brightness_set_blocking = lp8864_brightness_set;
-	led->led_dev.brightness_get = lp8864_brightness_get;
+	priv->client = client;
+	priv->led_dev.brightness_set_blocking = lp8864_brightness_set;
+	priv->led_dev.brightness_get = lp8864_brightness_get;
 
-	led->regmap = devm_regmap_init_i2c(client, &lp8864_regmap_config);
-	if (IS_ERR(led->regmap))
-		return dev_err_probe(&client->dev, PTR_ERR(led->regmap),
+	priv->regmap = devm_regmap_init_i2c(client, &lp8864_regmap_config);
+	if (IS_ERR(priv->regmap))
+		return dev_err_probe(&client->dev, PTR_ERR(priv->regmap),
 				     "Failed to allocate regmap\n");
 
 	/* Control brightness by DISPLAY_BRT register */
-	ret = regmap_update_bits(led->regmap, LP8864_USER_CONFIG1, LP8864_BRT_MODE_MASK,
+	ret = regmap_update_bits(priv->regmap, LP8864_USER_CONFIG1, LP8864_BRT_MODE_MASK,
 								   LP8864_BRT_MODE_REG);
 	if (ret) {
-		dev_err(&led->client->dev, "Failed to set brightness control mode\n");
+		dev_err(&priv->client->dev, "Failed to set brightness control mode\n");
 		return ret;
 	}
 
-	ret = lp8864_fault_check(led);
+	ret = lp8864_fault_check(priv);
 	if (ret)
 		return ret;
 
@@ -262,7 +262,7 @@ static int lp8864_probe(struct i2c_client *client)
 	init_data.devicename = "lp8864";
 	init_data.default_label = ":display_cluster";
 
-	ret = devm_led_classdev_register_ext(&client->dev, &led->led_dev, &init_data);
+	ret = devm_led_classdev_register_ext(&client->dev, &priv->led_dev, &init_data);
 	if (ret)
 		dev_err(&client->dev, "Failed to register LED device (%pe)\n", ERR_PTR(ret));
 
-- 
2.54.0


