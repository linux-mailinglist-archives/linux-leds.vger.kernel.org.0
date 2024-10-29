Return-Path: <linux-leds+bounces-3193-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDFE9B4B84
	for <lists+linux-leds@lfdr.de>; Tue, 29 Oct 2024 14:57:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 44F361F237BF
	for <lists+linux-leds@lfdr.de>; Tue, 29 Oct 2024 13:57:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FFE220697E;
	Tue, 29 Oct 2024 13:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sVr8asgt"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472C620695A;
	Tue, 29 Oct 2024 13:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730210236; cv=none; b=THwz73urJgpvK6V+xMZ1mPI3fYE4mZERKR+XRQ5etOieMaZaQccAwL6Yn8srYx9ostmilhpa0awqiPWlN4qGGfqXIOUP2hnZBRWA/eASJbT6GKCR7vogPO7jiBkxdV5+ciztN2Znd7RWvJ38cnjRHlCcyzdJM7wgYBsvl7FqsKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730210236; c=relaxed/simple;
	bh=mLMKwJMTWg5EKRK5X4wSqHZxkmJnB9Dd4yvJMwI+P7o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TPvIJXMLJO5yTkSDPYZB6BGFqgzzrI0gJT6I2tuEkIrg6YiNgyq3kjNA5JydHCah/OkcLykq4tbD7ZFxclb3sta6f2E657+pFbnz3586R4Ui/jQPvvDqGw7EdPC4LCISyILBMjn2Urq8u5Ku5kKqFIrffl7IYTk0ZpA1uDOu6P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sVr8asgt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99F49C4CECD;
	Tue, 29 Oct 2024 13:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730210236;
	bh=mLMKwJMTWg5EKRK5X4wSqHZxkmJnB9Dd4yvJMwI+P7o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sVr8asgtIznNiUcCktBMjFbkM+g3TBwhFtDvDx20JTLD3Eh4Q74qrupS4JbMD0tvi
	 LWMXHqranuxO2oFTHjlIjNpaNbJJg4qZ+iq1/pIXwrzLMmHwHtHFZj1Ao8UpVW3YGt
	 njzSOHZevICC7wk6xSKGY7XjyPk2/Y5l8XgFlXYgGVnrKFu/0kgtyX8xt3r9KrtSXC
	 u/YXbr087xI5DJguMue+xMBUhTL+Cb/eXMPklg9hud6728zbHeDprtFCGoDPJwWU78
	 9cHyS1+Sm63kOgTLCy3fMiScGObEFU+GyF5OyEiSyRhGZPS5c8B8BXrFnTh9SGqcTR
	 NQR2GruGEEHbw==
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
Subject: [PATCH leds v4 11/12] leds: turris-omnia: Use uppercase first letter in all comments
Date: Tue, 29 Oct 2024 14:56:20 +0100
Message-ID: <20241029135621.12546-12-kabel@kernel.org>
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

Change first letter of 4 more comments to uppercase to make the driver
comments uniform.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/leds/leds-turris-omnia.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
index 515ba2991cf5..326958e099c9 100644
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
@@ -482,10 +482,10 @@ static void omnia_leds_remove(struct i2c_client *client)
 	if (leds->brightness_knode)
 		sysfs_put(leds->brightness_knode);
 
-	/* put all LEDs into default (HW triggered) mode */
+	/* Put all LEDs into default (HW triggered) mode */
 	omnia_cmd_write_u8(client, OMNIA_CMD_LED_MODE, OMNIA_CMD_LED_MODE_LED(OMNIA_BOARD_LEDS));
 
-	/* set all LEDs color to [255, 255, 255] */
+	/* Set all LEDs color to [255, 255, 255] */
 	omnia_cmd_set_color(client, OMNIA_BOARD_LEDS, 255, 255, 255);
 }
 
-- 
2.45.2


