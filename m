Return-Path: <linux-leds+bounces-2584-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEB59699FE
	for <lists+linux-leds@lfdr.de>; Tue,  3 Sep 2024 12:20:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C23D3282128
	for <lists+linux-leds@lfdr.de>; Tue,  3 Sep 2024 10:20:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6829B1AD249;
	Tue,  3 Sep 2024 10:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T29iSn/5"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A7419F435
	for <linux-leds@vger.kernel.org>; Tue,  3 Sep 2024 10:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725358805; cv=none; b=qMegdoodiBcf3iBsgh33svlUCZcagPvRGhXrAjsa6OgcdykFOfDyn9yjmcwBrEX8PST+C9sUvlPNyQt0mur9YlzSl99CD+spOwoyFKg3Y/5D87l5XP3XwVIoplqdn73HfrufI3hYfCGyO8JiIOK+4Y8v7vOdQohzzQLHLJFzE5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725358805; c=relaxed/simple;
	bh=NK/TT5OqMs1dsGjnXcgm28W50L0C2qoW/LJb3JFVXqY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=afsZn0mo9XZLP146lThm4YxBWPZGNTdRyOV0bUIvLwoIVzK0aqtQPX62PhkowVwLDrrXQIV0Nn/KW1AJEBL+cnI4kH+eP5b5u6Ve8f2OB7Jw0w5knIuuV++uzv47MsXsEwlk74Oq/K3AdOdpgLiZXFI03n4V4mv5me7ZULGpu6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T29iSn/5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07AF2C4CEC5;
	Tue,  3 Sep 2024 10:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725358804;
	bh=NK/TT5OqMs1dsGjnXcgm28W50L0C2qoW/LJb3JFVXqY=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=T29iSn/51vFe1gZUpv50QfqwzApZyFGOA+vZKsUeleWS7XsbmNZFbZ5PWsG8ou5Qe
	 kVPO74sbzmUGB7ZD8POIorz38MPTHhG/woZcBsnkQLaCAxhv8iVM1tIx8VgH+08be+
	 sA+Q02dLmh08vhZNclv38mnfM350YzFfb/vLgc88eYw8RxrWwG9ZwUXzVRln7FOROM
	 PmXE3nAPBv3NevUS5+WMSGzPm8x2E/AfmWwmgLpR02brUN2659R3aexPdTiWNqEgSH
	 4qo/bFvLEgFXuNoXN5y05/6U6P9XDZok+C0u22qm4ErAOmeXoZMuQHAMlMVSd3Inc9
	 h0g3Wx87xf+Ug==
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
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH leds v2 09/11] leds: turris-omnia: Use uppercase first letter in all comments
Date: Tue,  3 Sep 2024 12:19:28 +0200
Message-ID: <20240903101930.16251-10-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240903101930.16251-1-kabel@kernel.org>
References: <20240903101930.16251-1-kabel@kernel.org>
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
index 857dba811d5e..58c3f3afbca5 100644
--- a/drivers/leds/leds-turris-omnia.c
+++ b/drivers/leds/leds-turris-omnia.c
@@ -235,13 +235,13 @@ static int omnia_led_register(struct i2c_client *client, struct omnia_led *led,
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
@@ -455,10 +455,10 @@ static void omnia_leds_remove(struct i2c_client *client)
 	if (leds->brightness_kn)
 		sysfs_put(leds->brightness_kn);
 
-	/* put all LEDs into default (HW triggered) mode */
+	/* Put all LEDs into default (HW triggered) mode */
 	omnia_cmd_write_u8(client, OMNIA_CMD_LED_MODE, OMNIA_CMD_LED_MODE_LED(OMNIA_BOARD_LEDS));
 
-	/* set all LEDs color to [255, 255, 255] */
+	/* Set all LEDs color to [255, 255, 255] */
 	omnia_cmd_set_color(client, OMNIA_BOARD_LEDS, 255, 255, 255);
 }
 
-- 
2.44.2


