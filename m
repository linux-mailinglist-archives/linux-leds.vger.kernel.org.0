Return-Path: <linux-leds+bounces-3357-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D599C1E0F
	for <lists+linux-leds@lfdr.de>; Fri,  8 Nov 2024 14:30:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6FBE1C20749
	for <lists+linux-leds@lfdr.de>; Fri,  8 Nov 2024 13:30:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 053DC1F12E8;
	Fri,  8 Nov 2024 13:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q+U+hsBH"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D096B1EF95C;
	Fri,  8 Nov 2024 13:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731072573; cv=none; b=mhkJcxnzjB0dGFSEjwM6a3X39oARXK3h3dp3uguC0SGB0m4B5R9fePdEzXxHLaaLV45E8NaHp+45u7UwAftWFZV3IvSgMOJ/AzvNH58SG4RND/LtRoQOVcGU7Zfwvn5y3LE9ICplpIlYjodDbnzwKnsikLvco19YFyBHu8DJr8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731072573; c=relaxed/simple;
	bh=eSch87CyY3MehjJktN1nlntcOVi3d1d1k+yee2U49tQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=av93P+EHsPjm++30gpbELgHQzr7/Q2q4yJBuxE+wIlVOWIEcMmxDu+KtiYqowAfXQVr7BF5OD3Q42Z+7v2FHofFVmOvS/su+XvOA9CiBlWxCI0V7Tluut/DHhr5X6KgAomytfZQdNKJnWux9+28VqtdZRmKjUCCIpizRT3gt9Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q+U+hsBH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53CE8C4CEDB;
	Fri,  8 Nov 2024 13:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731072573;
	bh=eSch87CyY3MehjJktN1nlntcOVi3d1d1k+yee2U49tQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q+U+hsBHObh5um1syeXDkq6AukWQD8lEgf2wpmHFXqjqJTCE9i2OFIdJeDyu4yFcC
	 eJO22tf0npCtJoSQvg5nqy7RsddgiiZA3r7im/HDjNvZeKQhN/wNYQfvcq83+ooh5I
	 9YDpy9IFCcm2V0LnNOYYob7Ech34N9z7U9ED7O35YTPYE/3HkNBsPt0btj3RGNBlLe
	 HnXlBJgcslnkmNraGdnZZei/UgHMpOBVyORJ+zw+NnSc6UPJ8hCrqNm9mY4RNL14wv
	 0NN8mgWJ22ROV2KAtQYdyUdlTJnp45UAJ9ClFMZmjBNBmsGooDoMTsBXqh6zYZhJ3c
	 qzDSaF5d6/wqw==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH leds v6 10/12] leds: turris-omnia: Use dev_err_probe() where appropriate
Date: Fri,  8 Nov 2024 14:28:43 +0100
Message-ID: <20241108132845.31005-11-kabel@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241108132845.31005-1-kabel@kernel.org>
References: <20241108132845.31005-1-kabel@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use dev_err_probe() instead of dev_err() + separate return where
appropriate.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/leds/leds-turris-omnia.c | 50 ++++++++++----------------------
 1 file changed, 16 insertions(+), 34 deletions(-)

diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
index 503e6e476c45..cee53ef94bc9 100644
--- a/drivers/leds/leds-turris-omnia.c
+++ b/drivers/leds/leds-turris-omnia.c
@@ -256,33 +256,23 @@ static int omnia_led_register(struct i2c_client *client, struct omnia_led *led,
 	/* put the LED into software mode */
 	ret = omnia_cmd_write_u8(client, OMNIA_CMD_LED_MODE, OMNIA_CMD_LED_MODE_LED(led->reg) |
 							     OMNIA_CMD_LED_MODE_USER);
-	if (ret) {
-		dev_err(dev, "Cannot set LED %pOF to software mode: %i\n", np,
-			ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Cannot set LED %pOF to software mode\n", np);
 
 	/* disable the LED */
 	ret = omnia_cmd_write_u8(client, OMNIA_CMD_LED_STATE, OMNIA_CMD_LED_STATE_LED(led->reg));
-	if (ret) {
-		dev_err(dev, "Cannot set LED %pOF brightness: %i\n", np, ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Cannot set LED %pOF brightness\n", np);
 
 	/* Set initial color and cache it */
 	ret = omnia_led_send_color_cmd(client, led);
-	if (ret < 0) {
-		dev_err(dev, "Cannot set LED %pOF initial color: %i\n", np,
-			ret);
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Cannot set LED %pOF initial color\n", np);
 
 	ret = devm_led_classdev_multicolor_register_ext(dev, &led->mc_cdev,
 							&init_data);
-	if (ret < 0) {
-		dev_err(dev, "Cannot register LED %pOF: %i\n", np, ret);
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Cannot register LED %pOF\n", np);
 
 	return 1;
 }
@@ -485,13 +475,10 @@ static int omnia_leds_probe(struct i2c_client *client)
 	int ret, count;
 
 	count = of_get_available_child_count(np);
-	if (!count) {
-		dev_err(dev, "LEDs are not defined in device tree!\n");
-		return -ENODEV;
-	} else if (count > OMNIA_BOARD_LEDS) {
-		dev_err(dev, "Too many LEDs defined in device tree!\n");
-		return -EINVAL;
-	}
+	if (count == 0)
+		return dev_err_probe(dev, -ENODEV, "LEDs are not defined in device tree!\n");
+	if (count > OMNIA_BOARD_LEDS)
+		return dev_err_probe(dev, -EINVAL, "Too many LEDs defined in device tree!\n");
 
 	leds = devm_kzalloc(dev, struct_size(leds, leds, count), GFP_KERNEL);
 	if (!leds)
@@ -501,11 +488,8 @@ static int omnia_leds_probe(struct i2c_client *client)
 	i2c_set_clientdata(client, leds);
 
 	ret = omnia_find_mcu_and_get_features(dev);
-	if (ret < 0) {
-		dev_err(dev, "Cannot determine MCU supported features: %d\n",
-			ret);
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Cannot determine MCU supported features\n");
 
 	leds->has_gamma_correction = ret & OMNIA_FEAT_LED_GAMMA_CORRECTION;
 
@@ -518,10 +502,8 @@ static int omnia_leds_probe(struct i2c_client *client)
 	mutex_init(&leds->lock);
 
 	ret = devm_led_trigger_register(dev, &omnia_hw_trigger);
-	if (ret < 0) {
-		dev_err(dev, "Cannot register private LED trigger: %d\n", ret);
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Cannot register private LED trigger\n");
 
 	led = &leds->leds[0];
 	for_each_available_child_of_node_scoped(np, child) {
-- 
2.45.2


