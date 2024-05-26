Return-Path: <linux-leds+bounces-1696-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5DC8CF552
	for <lists+linux-leds@lfdr.de>; Sun, 26 May 2024 20:18:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A0111F211B7
	for <lists+linux-leds@lfdr.de>; Sun, 26 May 2024 18:18:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 273B01EEF8;
	Sun, 26 May 2024 18:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="VSL0TaQR"
X-Original-To: linux-leds@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2E312BF1A;
	Sun, 26 May 2024 18:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716747514; cv=none; b=gAHS6l+0Y+TlwlKAw1e8343KKkg87NaRR02uhyyDAgKyqNbi9oOF8qg9YnMqqMcTYFdm9QQwtb0XXm72hBNCkK9QSDi+GacqvwrqyVflkAB17+g7eQoaJC9JQlybI1H4uY7R5B7g5eUMRa7IK/UNNYVYnDHUGXdS5K6TRodW29Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716747514; c=relaxed/simple;
	bh=RVbMZZPenvcdjoM7tM7SuacRL6z8c0aDQVo/8uG6Iis=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OW3alPaLNvqbh7fltCYGfttyrpzvToHdHhE2VSUkyJRShvwy3JPS1rTBqTsrR07IOZFsYhz9CU/+Dq/pe+eY8dhBFtXYOXu0Q/cJMPi5sHWUcYY3mCqvHu2Mrjp2H3e1CVulNVKbx1e3yh/5rAqeG5O8MHoGoN4pB/JhOx63KB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=VSL0TaQR; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1716747502;
	bh=RVbMZZPenvcdjoM7tM7SuacRL6z8c0aDQVo/8uG6Iis=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VSL0TaQRhrpXHjNGPjby/pUWJmoXOPgBw+zjOdh7jX4asLTeE9bBlss9lm5MTIFh8
	 /lUWK7YnoDkmdcUc8oFINJG5R/sRNm8ISfZ5qe78d3zdRJnnR0ubLa9bbSB3++F6RL
	 MzTLwWVi+5y87v0hcIrmoLF+Xmh7eM3JXPhPMVIs=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 26 May 2024 20:17:15 +0200
Subject: [PATCH v3 1/4] leds: class: warn about name collisions earlier
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240526-cros_ec-kbd-led-framework-v3-1-ee577415a521@weissschuh.net>
References: <20240526-cros_ec-kbd-led-framework-v3-0-ee577415a521@weissschuh.net>
In-Reply-To: <20240526-cros_ec-kbd-led-framework-v3-0-ee577415a521@weissschuh.net>
To: Lee Jones <lee@kernel.org>, Benson Leung <bleung@chromium.org>, 
 Guenter Roeck <groeck@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Pavel Machek <pavel@ucw.cz>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Dustin Howett <dustin@howett.net>, 
 Mario Limonciello <mario.limonciello@amd.com>, linux-leds@vger.kernel.org, 
 Rajas Paranjpe <paranjperajas@gmail.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716747501; l=1430;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=RVbMZZPenvcdjoM7tM7SuacRL6z8c0aDQVo/8uG6Iis=;
 b=jqYgFK1Xd+zJu9VNIlc2yIcfAB75+M4DSKRhePySUcMWt1kXjI0SS7WD0ihcqLtFsSI/HIH4M
 dx+GeS8nWUCDVp+mmtUAjc/us7tEiQTHK1YEazMzpSjNFB7z4Csu0Wu
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Other warnings refer to the name after renaming, which is clearer when
that name is mentioned first.
It is also clearer where "ret" comes from.

While at it, also add the necessary newline to the message and fix the
parameter alignment.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/leds/led-class.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 24fcff682b24..c298355d5b7d 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -503,6 +503,9 @@ int led_classdev_register_ext(struct device *parent,
 	ret = led_classdev_next_name(proposed_name, final_name, sizeof(final_name));
 	if (ret < 0)
 		return ret;
+	else if (ret)
+		dev_warn(parent, "Led %s renamed to %s due to name collision\n",
+			 proposed_name, final_name);
 
 	if (led_cdev->color >= LED_COLOR_ID_MAX)
 		dev_warn(parent, "LED %s color identifier out of range\n", final_name);
@@ -518,10 +521,6 @@ int led_classdev_register_ext(struct device *parent,
 	if (init_data && init_data->fwnode)
 		device_set_node(led_cdev->dev, init_data->fwnode);
 
-	if (ret)
-		dev_warn(parent, "Led %s renamed to %s due to name collision",
-				proposed_name, dev_name(led_cdev->dev));
-
 	if (led_cdev->flags & LED_BRIGHT_HW_CHANGED) {
 		ret = led_add_brightness_hw_changed(led_cdev);
 		if (ret) {

-- 
2.45.1


