Return-Path: <linux-leds+bounces-3267-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6110E9BB788
	for <lists+linux-leds@lfdr.de>; Mon,  4 Nov 2024 15:20:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 675C41C242F4
	for <lists+linux-leds@lfdr.de>; Mon,  4 Nov 2024 14:20:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EBE413C9DE;
	Mon,  4 Nov 2024 14:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DY7Z+Brx"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2232AD0C;
	Mon,  4 Nov 2024 14:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730730017; cv=none; b=WPZFAR7NItsQ48e+JboFMuOTP0+vP5QfF0Z7uCW6lnPhvcy4m2r3GF8uGLYGyjttv5+yydZ5qReN0pjDSyQ2piyupLlKH3uWGVq9tmCY6Jq39a776v2bB6+uDc+BYyTz4kudzMV676ztY0KwVs3daBci/6HXdxRWZdc4A52mYjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730730017; c=relaxed/simple;
	bh=SceZzYvRl3MzrSiPy/Plowa5y9Lt9xq2+UK4lTG9wEU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fw+fp4pSKTBRbsqRCSgAlN3cHJm+m5IAYVK+7ZqKa42tuEpwG07+kn//PQtKEkUk92JtCg2UsrWBXlhRXPF32JH4dCMbBeaxr+TGrEXc5ldFpmx29BmwlE+/KtnO7yNPtM4yYP7a82DSyvKafBeqwknzOF+buw7SOp6khX0ctCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DY7Z+Brx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85B3EC4CED0;
	Mon,  4 Nov 2024 14:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730730017;
	bh=SceZzYvRl3MzrSiPy/Plowa5y9Lt9xq2+UK4lTG9wEU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DY7Z+BrxVohJXPN+lOdq3mHH4rmmsJBpa7ai80p/84EZceB83ep6jYI0YXy0vvVj+
	 ogz374yc4xJfN3/u4VcRrQiqHqZHwVu7IuNiordXX0MKCXlFC8s5GNR9DoT7pN0/xN
	 KT6YkADitoXTOtLDWEjlvQ7JlY2n+3vxlpPCoRljtjjqPPeB/dijpLCvP+vBjg2kMl
	 PNM51OM9WGeW5NgzIgkUXoZ9JPJDfTLsZSNXRCGSox4HiWEfGMzyBcs/YIG9oAcgxl
	 tzpUKDEgsXU9PAhYrBUiKvRHrVLx1NbYuRfuo2axfGUVT0Ku/A+ONYR15kdsubzMiy
	 CPvKJmjh046pw==
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
Subject: [PATCH leds v5 11/12] leds: turris-omnia: Use uppercase first letter in all comments
Date: Mon,  4 Nov 2024 15:19:23 +0100
Message-ID: <20241104141924.18816-12-kabel@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241104141924.18816-1-kabel@kernel.org>
References: <20241104141924.18816-1-kabel@kernel.org>
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
index 51f68252fa2c..e255b911cca7 100644
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
@@ -505,10 +505,10 @@ static void omnia_leds_remove(struct i2c_client *client)
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


