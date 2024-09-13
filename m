Return-Path: <linux-leds+bounces-2677-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEA2977FFE
	for <lists+linux-leds@lfdr.de>; Fri, 13 Sep 2024 14:31:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C900B1C20905
	for <lists+linux-leds@lfdr.de>; Fri, 13 Sep 2024 12:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 641CD1DA101;
	Fri, 13 Sep 2024 12:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ArTAL3UW"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4F71DA0E4;
	Fri, 13 Sep 2024 12:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726230708; cv=none; b=k6saVR4lEMpwYCtUejW3IP4GWoAC1KLkG6n8R5Lsm9Ny5TEO7DGZu8ONyVX9e7wZE9VnZLFET3uZE+KBYL9aP2IHFSEvrocFQzwrka4Z+U9VAZwmMnhvuwbgY0opi7YTTdR2JNCUVUgv3cGKkPXGp+JPvIMPZXCUkXuMFxrp9OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726230708; c=relaxed/simple;
	bh=mrhLbGM4zoekNVG+dFW0cVAaZNJ+Oig1GARw4aCabIs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dIaomBEjREzRfwurDYkfPaKAtI2ly7pgzNJBhK0w6e1arq6VRXcYgmImyYz8zt877HNbORNnCmX8LvgU0gAtfTOVYmW59U/MgvSqXpyAbfrr/uoQfxxh9yU7LG+lQrhJpJfVYyvS3Sc+1FY/Ad6h26f7djiCrfwn8erUWtDsU+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ArTAL3UW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8558C4CED0;
	Fri, 13 Sep 2024 12:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726230708;
	bh=mrhLbGM4zoekNVG+dFW0cVAaZNJ+Oig1GARw4aCabIs=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=ArTAL3UWlbLLOH4w85SXP9jpoByqVr9vuOi3X5I2pxo4yps4YdPhvpiv4PEGAVK57
	 +xqOWf9PEJl63MPKBnV2z3tcUAvN4/ELH5x5qH74IerXHufnPOyBBoxaeMXAmq+t/J
	 yZTkE1nyRyh4zcZqrQS42FSHj3wB/02ZyUefNQDn0NWb+IUgGmISworgFgqBIpJAfS
	 vCy579CV5iH24Mt9KNCS/+8OvA8XJnbtLFxmQLUzYfYqwwpKGfPIXMTxeQ06r1kv3H
	 qgoMnW6sWhut13vpdSq7XexMfOznmjuMsuGAci4sP2tWZRhpKlEJSQfEpHnFDGfsZk
	 UHLeHd/EPDYmQ==
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
Subject: [PATCH leds v3 10/11] leds: turris-omnia: Use uppercase first letter in all comments
Date: Fri, 13 Sep 2024 14:31:02 +0200
Message-ID: <20240913123103.21226-11-kabel@kernel.org>
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

Change first letter of 4 more comments to uppercase to make the driver
comments uniform.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/leds/leds-turris-omnia.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
index 298bdffd8c40..d7e5f6de0f14 100644
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


