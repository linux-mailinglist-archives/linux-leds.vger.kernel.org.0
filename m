Return-Path: <linux-leds+bounces-1902-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7479075A0
	for <lists+linux-leds@lfdr.de>; Thu, 13 Jun 2024 16:49:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 343D01F22416
	for <lists+linux-leds@lfdr.de>; Thu, 13 Jun 2024 14:49:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 484F9146585;
	Thu, 13 Jun 2024 14:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="MkQ51ipE"
X-Original-To: linux-leds@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC661448ED;
	Thu, 13 Jun 2024 14:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718290130; cv=none; b=N1mrdTJoTlST0/kwGAQNTsNGIrOKrlveNts+aMtpN+oZDQuex1bg5NSwPDid1N1yrvWqDZzuaqc9CJHdvXH5WfK5Ad36Suo8r9gea0PfuHw1oAk7h6ZJGTeQTjKTJELyu3E1aw+3CUUcD1IE3fKXeOdwU/yr3SAOBi9MXdeFDeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718290130; c=relaxed/simple;
	bh=+TIq9UEk/in9R9arwQHciP7DyhwtaxbN8xJ/tBiBiTI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VVNS+H8jwjSJJo91/mb0gg2iy5olW9VcChz+YXcDG1ulTAxXPTEJY3uaqHUJyXZKPfr4/fflK1gB9HujVzakPRji7aJobmkaqmUKpgQNevPBichYj3awuOo+88XvnDyUX6WBt4FwaNaiTnln/HoAmqtW4R0NMdQpF0Qouv8IORE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=MkQ51ipE; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1718290120;
	bh=+TIq9UEk/in9R9arwQHciP7DyhwtaxbN8xJ/tBiBiTI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MkQ51ipEz8MeoKoDc89T1cX50VehBiQO4LRj0ZEqx6EnVsqZKassbiqk6IIU2eff0
	 1BO9KBA7A00dboxYfFVWTjENI3QncMuf4vGDe8zVAWt3fbN41hlWp0z5Q0ITV1/iln
	 a02RlzNbDjkGq/c87j63WlvyS13xsqfPF/NSJXUQ=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Thu, 13 Jun 2024 16:48:36 +0200
Subject: [PATCH v3 1/5] leds: core: Introduce led_get_color_name() function
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240613-cros_ec-led-v3-1-500b50f41e0f@weissschuh.net>
References: <20240613-cros_ec-led-v3-0-500b50f41e0f@weissschuh.net>
In-Reply-To: <20240613-cros_ec-led-v3-0-500b50f41e0f@weissschuh.net>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas@weissschuh.net>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 chrome-platform@lists.linux.dev, Dustin Howett <dustin@howett.net>, 
 Mario Limonciello <mario.limonciello@amd.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718290119; l=1805;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=+TIq9UEk/in9R9arwQHciP7DyhwtaxbN8xJ/tBiBiTI=;
 b=SE9q7Ag3aDwUioQbinFnnfI+m5tsTa9WLPkcf3osAf2nVkePKJ6RPC9Q68QSvT8ZEjX+9P49F
 6cwR7cqGP8tCVl8bEzR2kGfLZEDsRBE0MQYnIS3LHw9X1LMrgQvO59I
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

This is similar to the existing led_colors[] array but is safer to use and
usable by everyone.

Getting string representations of color ids is useful for drivers
which are handling color IDs anyways, for example for the multicolor API.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/leds/led-core.c |  9 +++++++++
 include/linux/leds.h    | 10 ++++++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index 89c9806cc97f..e0dd2284e84a 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -534,6 +534,15 @@ int led_compose_name(struct device *dev, struct led_init_data *init_data,
 }
 EXPORT_SYMBOL_GPL(led_compose_name);
 
+const char *led_get_color_name(u8 color_id)
+{
+	if (color_id >= ARRAY_SIZE(led_colors))
+		return NULL;
+
+	return led_colors[color_id];
+}
+EXPORT_SYMBOL_GPL(led_get_color_name);
+
 enum led_default_state led_init_default_state_get(struct fwnode_handle *fwnode)
 {
 	const char *state = NULL;
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 6300313c46b7..dedea965afbf 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -427,6 +427,16 @@ void led_sysfs_enable(struct led_classdev *led_cdev);
 int led_compose_name(struct device *dev, struct led_init_data *init_data,
 		     char *led_classdev_name);
 
+/**
+ * led_get_color_name - get string representation of color ID
+ * @color_id: The LED_COLOR_ID_* constant
+ *
+ * Get the string name of a LED_COLOR_ID_* constant.
+ *
+ * Returns: A string constant or NULL on an invalid ID.
+ */
+const char *led_get_color_name(u8 color_id);
+
 /**
  * led_sysfs_is_disabled - check if LED sysfs interface is disabled
  * @led_cdev: the LED to query

-- 
2.45.2


