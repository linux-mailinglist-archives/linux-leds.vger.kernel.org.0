Return-Path: <linux-leds+bounces-3358-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6874E9C1E13
	for <lists+linux-leds@lfdr.de>; Fri,  8 Nov 2024 14:30:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 38BBCB24221
	for <lists+linux-leds@lfdr.de>; Fri,  8 Nov 2024 13:30:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F383A1F130A;
	Fri,  8 Nov 2024 13:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WgPamxqN"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9AD1F12FE;
	Fri,  8 Nov 2024 13:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731072577; cv=none; b=eyjfwo17AvFQ1l3Whk6mM97mz2hmgYO49ATEiD3NbGEOJJIoofosrAOrMSKt03NT1g0v4GM8PMY//kEDBdPl2mMB6khc43lKwbZlffHS/sSvwmgHhPItmELklgPrQIGIcxvwAiSEem238MOFFqm4lec7JP0hET+Ef8SMMe9WuAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731072577; c=relaxed/simple;
	bh=6EykYPmcXwiVe7i1+kENv5nJzw4jRlQsfQ69afgTPII=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eisk6bJGJEwG9NG5JUDojChNbFnv2aUFPHpg7SjtOvB0cHJlfQIzCf7jh7I0F8jjTpzCeIx4U578l6h+g62iybAfWqLLFpI0OO4ky6SpUmvdCNwXKWRm4ILuPf1VZuq04rgEaU34uJ6hDpu+y4S/ZnwytHuWXF0ctSjHbGmKGOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WgPamxqN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22CF1C4CED3;
	Fri,  8 Nov 2024 13:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731072577;
	bh=6EykYPmcXwiVe7i1+kENv5nJzw4jRlQsfQ69afgTPII=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WgPamxqN4fLrujkmSCHphVohMOImVg4/mJODasdyithqRKHLfrU8gThm8A5MVy5ZJ
	 AypURaDHPksq4mD52VBFXX0/V3vx/fvvFySBWJA6LS1tMiJ0bx6IJuL2LG2y7LSq/s
	 /Pa3ujfoYicU3LmSxxLt1IFS2IpeBi6Q/Khfj7Gls7phn1DVrlpuvRwPx38qWv9v2o
	 Rz+deSEMy6JMBxP29tqC+riYALOvQhAMmFf7eAlcmoOmse2AmPM+Wmb8MoifEWQIIz
	 iOeMUgEJvr+Wc7XaN/0mtwO7PXD2qgifpOuByYgbKXNvbrNiFsKIxjiuNQ4d7GbgB3
	 RY8qSDkli4HfA==
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
Subject: [PATCH leds v6 11/12] leds: turris-omnia: Use uppercase first letter in all comments
Date: Fri,  8 Nov 2024 14:28:44 +0100
Message-ID: <20241108132845.31005-12-kabel@kernel.org>
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

Change first letter of 4 more comments to uppercase to make the driver
comments uniform.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/leds/leds-turris-omnia.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
index cee53ef94bc9..2c116abe4de2 100644
--- a/drivers/leds/leds-turris-omnia.c
+++ b/drivers/leds/leds-turris-omnia.c
@@ -253,13 +253,13 @@ static int omnia_led_register(struct i2c_client *client, struct omnia_led *led,
 	 */
 	cdev->default_trigger = omnia_hw_trigger.name;
 
-	/* put the LED into software mode */
+	/* Put the LED into software mode */
 	ret = omnia_cmd_write_u8(client, OMNIA_CMD_LED_MODE, OMNIA_CMD_LED_MODE_LED(led->reg) |
 							     OMNIA_CMD_LED_MODE_USER);
 	if (ret)
 		return dev_err_probe(dev, ret, "Cannot set LED %pOF to software mode\n", np);
 
-	/* disable the LED */
+	/* Disable the LED */
 	ret = omnia_cmd_write_u8(client, OMNIA_CMD_LED_STATE, OMNIA_CMD_LED_STATE_LED(led->reg));
 	if (ret)
 		return dev_err_probe(dev, ret, "Cannot set LED %pOF brightness\n", np);
@@ -519,10 +519,10 @@ static int omnia_leds_probe(struct i2c_client *client)
 
 static void omnia_leds_remove(struct i2c_client *client)
 {
-	/* put all LEDs into default (HW triggered) mode */
+	/* Put all LEDs into default (HW triggered) mode */
 	omnia_cmd_write_u8(client, OMNIA_CMD_LED_MODE, OMNIA_CMD_LED_MODE_LED(OMNIA_BOARD_LEDS));
 
-	/* set all LEDs color to [255, 255, 255] */
+	/* Set all LEDs color to [255, 255, 255] */
 	omnia_cmd_set_color(client, OMNIA_BOARD_LEDS, 255, 255, 255);
 }
 
-- 
2.45.2


