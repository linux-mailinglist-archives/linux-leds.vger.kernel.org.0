Return-Path: <linux-leds+bounces-3192-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F529B4B83
	for <lists+linux-leds@lfdr.de>; Tue, 29 Oct 2024 14:57:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BC313B22529
	for <lists+linux-leds@lfdr.de>; Tue, 29 Oct 2024 13:57:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E01C206962;
	Tue, 29 Oct 2024 13:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iBAiXv4A"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C5420695A;
	Tue, 29 Oct 2024 13:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730210232; cv=none; b=U/xL5iNmllz8fJiA2VUqBYhx4ppXamW0Eug1dXCV+2bXR+brIms6j/rdd3K7I1/syd+/jNu8so87QM1iR/imv88F7lFnRhXjHkI6gRpO2PUAl2tR66xl7/FZDq3LRwYCz0I3gGybj913I7ULlfr2zSuT1PgNp61wA+v1GoRzbiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730210232; c=relaxed/simple;
	bh=UD+3tqchUpRa+12ezJSKWb7rFIQVb01f08TAR0S0Iuo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OobOHA1fuRSLkmb5++Ae8npoM8uPhiVdjrdXfVQV2J6C2raSeWJZK/LQ+TcsRTFoAnzlcT3xiTZI6v6p90td8wRz1Qpi+g9i70OppjK+GuIaRpIDOpmu+oEo6Bv3+zslRxxxPrhntdE9GttX9YbFBcAx4e7KE+wttI0PLsU7uHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iBAiXv4A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C20DDC4CEEB;
	Tue, 29 Oct 2024 13:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730210232;
	bh=UD+3tqchUpRa+12ezJSKWb7rFIQVb01f08TAR0S0Iuo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iBAiXv4AUn25Q16gO/UFkiITJTKHYrDUe9YFXCvN2q1Nn8MIwb6BPUjvmpCUQSUTW
	 SUVmFMh2q3dgrVMqPo4MiFY8/BnYGtpdtcyqPsRIxcioYuBU6ZQqvoT+GPOaEx/oi3
	 LaM1UM94SzYPkHFFo9NsRr/wCMbeyNsaIW9U+1AWIfiL5qfzdLPI8ukVQ02b+y+Bdz
	 UPwTVXtuoHO8I+07EcCNAkmNlwfh8adb6OaWogHAtdQqCT2gSk+qeAbzRwZZZM8rDp
	 fnohabhJFoESZKwg7kDblI/ZwF55KhKD5W0/MzHLBfzDNjpUpU1HRpCIXqwoxmQ3lr
	 82HbUy5KDVi5Q==
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
Subject: [PATCH leds v4 10/12] leds: turris-omnia: Use dev_err_probe() where appropriate
Date: Tue, 29 Oct 2024 14:56:19 +0100
Message-ID: <20241029135621.12546-11-kabel@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241029135621.12546-1-kabel@kernel.org>
References: <20241029135621.12546-1-kabel@kernel.org>
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
index 0b0cf592557a..515ba2991cf5 100644
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
@@ -433,13 +423,10 @@ static int omnia_leds_probe(struct i2c_client *client)
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
@@ -449,11 +436,8 @@ static int omnia_leds_probe(struct i2c_client *client)
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
 
@@ -468,10 +452,8 @@ static int omnia_leds_probe(struct i2c_client *client)
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


