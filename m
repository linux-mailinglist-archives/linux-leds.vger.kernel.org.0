Return-Path: <linux-leds+bounces-3383-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 050C59C3BA9
	for <lists+linux-leds@lfdr.de>; Mon, 11 Nov 2024 11:04:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B06FE1F211F0
	for <lists+linux-leds@lfdr.de>; Mon, 11 Nov 2024 10:04:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A6A8175D34;
	Mon, 11 Nov 2024 10:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JeB31ULG"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CB7149C4D;
	Mon, 11 Nov 2024 10:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731319484; cv=none; b=mvflhRv4THFqBDPidwHGAmEHYhDPA+/t5SBG6KWlXUGOuNY88Z/IHSGF48eVur+O7p7NVsd0pYfF0MIL6EP+0F196bN2Ss5LOrtElpNH9/qFuoVVDh0vfy3wFaw2CQa0sK1Zd3ODUY7KIqi7gOfq1wn0ZI83rO4nCIdeDvQzBvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731319484; c=relaxed/simple;
	bh=kXWKak3NFWbVEuxA3fSpdYQ6LarXKFsQoaxaZk/VptM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s17HJ9TyJRjrrpjOuYIc6f9rR0JAKoO5MKEiG8X2vUT1exd3PHeQVj77ZbWJfV4wUhokprvvddZFy1EERVasWleSY8HVXPxzwSO4prjRug3BwG+E/mpjWVESBeh22rPtLIaY5K6dESpcMupsZoHTZwbx7qUvfjYKih0ogTz0yk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JeB31ULG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2E74C4CEDA;
	Mon, 11 Nov 2024 10:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731319484;
	bh=kXWKak3NFWbVEuxA3fSpdYQ6LarXKFsQoaxaZk/VptM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JeB31ULG6XltmK6J9IIVybD65d8x+SgB7XQD9JeYXa3nUOVgc8wujZvLzLUx9oLke
	 hMkTK2bkMv29QBFF+wXsd92b7UcpHwl14kJaUlv3Hh8x7fOViaUTfZKlje8tHT26vS
	 CEoD348Uu6riXv3+J3VJapXRKiV6l2Dr3kN7JqtcHX7t+cRBdFcr49tU5PcbbOhVwO
	 DgqrNn5GYlmirl4Z6qZnms0Bp/5Vl3r6k/uIIBCjB82dOgHJyIx5jv5g+Lc1o8N351
	 SmTgiMYdGKfjmhdk7hFq67B1PLww3ayUSykegHEdtXo8n2fCzZRdspR2IDRc/EICj5
	 Wtj2MFsCc1yRQ==
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
Subject: [PATCH leds v7 11/11] leds: turris-omnia: Use uppercase first letter in all comments
Date: Mon, 11 Nov 2024 11:03:55 +0100
Message-ID: <20241111100355.6978-12-kabel@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241111100355.6978-1-kabel@kernel.org>
References: <20241111100355.6978-1-kabel@kernel.org>
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
index 4fdd5d9b55fe..b3dd6af769c6 100644
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


