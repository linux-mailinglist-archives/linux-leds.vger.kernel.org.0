Return-Path: <linux-leds+bounces-2676-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FDD977FFC
	for <lists+linux-leds@lfdr.de>; Fri, 13 Sep 2024 14:31:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1CA8A1C20ADE
	for <lists+linux-leds@lfdr.de>; Fri, 13 Sep 2024 12:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9A251DA0F7;
	Fri, 13 Sep 2024 12:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O4/N7+8Y"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49AE1DA0F5;
	Fri, 13 Sep 2024 12:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726230704; cv=none; b=oUOIgPLYjmJlob3CWqgmsNds164dpDWwCFgyPgGhbdATjLWdXuYYi3eLMNl9N/zuI5q95HcAHbf8aI1JWwucdFbmpF4vLKOn+EG29uPAD8uTQMUZSZzVqBvvyjUgNlrfQau5FpJTG3rjjAb6EHYlp4dTB7lB0bVg64ZRFxPOagE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726230704; c=relaxed/simple;
	bh=imVY1X0+i7e7P5L16WbNX7ZDN/oDuV3FjYQS+AZWUfE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U7xWXpzHWuajP63fC2PNeXl1m1d+ZA2XPOGElXcIj+tKtqEZKBahZjur1SWCF662YhcYeD8dR6eddTCkttvVTIkPmRAYxiy5mppxXmxljDieRsX4YkiVw41XGesWKJiJJAjtgEIZY+OHdRAoHIVw00bNiw/4SYBFaHrhHVm3r7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O4/N7+8Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E583AC4CEC7;
	Fri, 13 Sep 2024 12:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726230704;
	bh=imVY1X0+i7e7P5L16WbNX7ZDN/oDuV3FjYQS+AZWUfE=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=O4/N7+8YkfNUiBFsvAxC5HYGV+4vv2WvoxivaJCx1yl3siY5G93lEhd5NFe4QHpbR
	 NZPvk/5EUpNqIWg1lMMV/FMpTjbX5NbsO91kJHwIugupH7PiTXUANUInLNbVCQrTgU
	 qtMBxmhwnNQvX8J+24rOvscLQHGDO0VlBL0iCaBqSufUW2dl42erkKMHNVrGFJGbqP
	 QqKrxsUdqnbDCFgIpHPVX/cF3iue1SyH4jCh6Z5hfWTN0zJ2bg/Fl18wZ5klm0qfI6
	 3xyJM7mOSTeqHMBEo02i9Wk0eg5HYbH9wtJlt49WomFOQXpobxbu5h1dVbv2BVMn8W
	 xRt8ciV94sunA==
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
Subject: [PATCH leds v3 09/11] leds: turris-omnia: Use dev_err_probe() where appropriate
Date: Fri, 13 Sep 2024 14:31:01 +0200
Message-ID: <20240913123103.21226-10-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240913123103.21226-1-kabel@kernel.org>
References: <20240913123103.21226-1-kabel@kernel.org>
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
index 570f7a69709c..298bdffd8c40 100644
--- a/drivers/leds/leds-turris-omnia.c
+++ b/drivers/leds/leds-turris-omnia.c
@@ -238,33 +238,23 @@ static int omnia_led_register(struct i2c_client *client, struct omnia_led *led,
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
@@ -406,13 +396,10 @@ static int omnia_leds_probe(struct i2c_client *client)
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
@@ -422,11 +409,8 @@ static int omnia_leds_probe(struct i2c_client *client)
 	i2c_set_clientdata(client, leds);
 
 	ret = omnia_mcu_get_features(client);
-	if (ret < 0) {
-		dev_err(dev, "Cannot determine MCU supported features: %d\n",
-			ret);
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Cannot determine MCU supported features\n");
 
 	leds->has_gamma_correction = ret & OMNIA_FEAT_LED_GAMMA_CORRECTION;
 
@@ -441,10 +425,8 @@ static int omnia_leds_probe(struct i2c_client *client)
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
2.44.2


