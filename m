Return-Path: <linux-leds+bounces-1687-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB288C9AE1
	for <lists+linux-leds@lfdr.de>; Mon, 20 May 2024 12:01:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09C691F2125B
	for <lists+linux-leds@lfdr.de>; Mon, 20 May 2024 10:01:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10FC64D135;
	Mon, 20 May 2024 10:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="YSIi45ZR"
X-Original-To: linux-leds@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E44B481CE;
	Mon, 20 May 2024 10:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716199276; cv=none; b=bEs8VVeCgP3xlzWY1DRwiqKyhJ1pLVLC8OxVnJICCdHlfsJA+c2g+TvrPvbtM0HpiLglWomffzS7V0VpaTGA09vy+sxUkyYhfFAIEfrIKDWcKUTrKQqtMj1PWa+ZCeGR71mG0lHKCxL7vvPozHTc9M0NtJt/3qtrNbh/CsSAKdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716199276; c=relaxed/simple;
	bh=Rf0pRVyMBzjhJ6DOcgU1r/DeZA59QefuS6EJvAEoqp0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ipxKz3RwhTYlx7ZtFMDWxUKftvLO39+yO+ASzbQGBrxW7uyzYx/O5zXDP1iFtZ0JguivSXHP0ylEhHoNx/k0f6+6dyEW2l/nxRCZ28BUlenqXbriayCeYTw+h76UGOkq+psl4zBm7go5C2BKuh6x1fm2Vik/+4SEBAyR3OY2OoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=YSIi45ZR; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1716199266;
	bh=Rf0pRVyMBzjhJ6DOcgU1r/DeZA59QefuS6EJvAEoqp0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YSIi45ZRwpIZD0B/wcPrKTSpy6S4qpGKAm6pyvN4VrvgZGCx8tCAOk/Yw7PB2fknP
	 mCGTbgmCsyu9Jd6DAs87K5vQDRisNaIGcK1btfPATOwXYirgceVb++ZririOjPONoH
	 N0YV4ze1BF0okdBKYT/JtwN1kCynmB8ZFuBqeGpE=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 20 May 2024 12:00:29 +0200
Subject: [PATCH 1/5] leds: introduce led_color_name function
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240520-cros_ec-led-v1-1-4068fc5c051a@weissschuh.net>
References: <20240520-cros_ec-led-v1-0-4068fc5c051a@weissschuh.net>
In-Reply-To: <20240520-cros_ec-led-v1-0-4068fc5c051a@weissschuh.net>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas@weissschuh.net>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 chrome-platform@lists.linux.dev, Dustin Howett <dustin@howett.net>, 
 Mario Limonciello <mario.limonciello@amd.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716199265; l=1785;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=Rf0pRVyMBzjhJ6DOcgU1r/DeZA59QefuS6EJvAEoqp0=;
 b=y+XCEet8JP8ljO5zdUixzxW3CRR+uCsN4T+I5VQfLBmS3UCUE+iS14kKo8vvreQ19ZhrWaKul
 3chr3drQwKWDU+r8TSFhd7oGAxR2skbY0ubJIZtm9LRUXAwrIU6Ql0K
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

This is similar to the existing led_colors array but is safer to use and
usable by everyone.
Getting string representations of color ids is useful for drivers
which are handling color ids anyways, for example for the multicolor API.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/leds/led-core.c |  9 +++++++++
 include/linux/leds.h    | 10 ++++++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index 89c9806cc97f..04a49958458e 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -534,6 +534,15 @@ int led_compose_name(struct device *dev, struct led_init_data *init_data,
 }
 EXPORT_SYMBOL_GPL(led_compose_name);
 
+const char *led_color_name(u8 color_id)
+{
+	if (color_id >= ARRAY_SIZE(led_colors))
+		return NULL;
+
+	return led_colors[color_id];
+}
+EXPORT_SYMBOL_GPL(led_color_name);
+
 enum led_default_state led_init_default_state_get(struct fwnode_handle *fwnode)
 {
 	const char *state = NULL;
diff --git a/include/linux/leds.h b/include/linux/leds.h
index db6b114bb3d9..0f1b955fa3f7 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -427,6 +427,16 @@ void led_sysfs_enable(struct led_classdev *led_cdev);
 int led_compose_name(struct device *dev, struct led_init_data *init_data,
 		     char *led_classdev_name);
 
+/**
+ * led_color_name - get string representation of color id
+ * @color_id: The LED_COLOR_ID_* constant
+ *
+ * Get the string name of a LED_COLOR_ID_* constant.
+ *
+ * Returns: A string constant or NULL on an invalid ID.
+ */
+const char *led_color_name(u8 color_id);
+
 /**
  * led_sysfs_is_disabled - check if LED sysfs interface is disabled
  * @led_cdev: the LED to query

-- 
2.45.1


