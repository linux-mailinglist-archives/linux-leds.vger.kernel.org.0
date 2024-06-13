Return-Path: <linux-leds+bounces-1901-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9936990759F
	for <lists+linux-leds@lfdr.de>; Thu, 13 Jun 2024 16:49:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 463F01F2351B
	for <lists+linux-leds@lfdr.de>; Thu, 13 Jun 2024 14:49:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4798F146582;
	Thu, 13 Jun 2024 14:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="EcpfRZ3u"
X-Original-To: linux-leds@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC271448D7;
	Thu, 13 Jun 2024 14:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718290130; cv=none; b=oohGV54frQSGmaLstGIDhfh8TKDOxjPpHlqz0WOCxEWIF6hbRlaamCXwH2je7yi5V8ykKC4ztPfRHYp5U5hx5a3h6TLNZXCtjBwwdhdtDL7cvmrmKM6Hx8Nryapeo9ML5MltMvCFSO3J+eZVf3UNRunVsRiIgA3yeIpidjkslNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718290130; c=relaxed/simple;
	bh=xGK5CAoX3hqfJgz9DdqkUhpIVSEo7t/GIW+AAIYvcaw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RlWAYSLqh1m/LKvoVpngUWaaWQGoAX1+rkxEBJ6HCRuNxb4XAioODdCRBK4UF3youLbv4MzF7vMClt+0X5J3cT/Q0oWvc9Q3S8wd9DesvlJx1G8wPE9cU9WHHkLUe3UCmWW/J7ETWK6t2soIF/2JAM8B/Bb//IHLeV3VzbczxD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=EcpfRZ3u; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1718290120;
	bh=xGK5CAoX3hqfJgz9DdqkUhpIVSEo7t/GIW+AAIYvcaw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EcpfRZ3u6p2ellkVSRyC2XKQq+uCEDAN/awKz4RuhuSd7M6r+wLjGNLqEEKl6JPk0
	 W+SCga4DoL/kque4Vr5ul1j7vfYPrDe2BP+85R0T/7yTyTX6E8Qaw292db1gx40pCl
	 hGyi62zc53wFrvO70bcFhR6cXdhy/q4LjN/Jz6+k=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Thu, 13 Jun 2024 16:48:38 +0200
Subject: [PATCH v3 3/5] leds: core: Unexport led_colors[] array
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240613-cros_ec-led-v3-3-500b50f41e0f@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718290119; l=1434;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=xGK5CAoX3hqfJgz9DdqkUhpIVSEo7t/GIW+AAIYvcaw=;
 b=z65+2JKASgSAQluTrx6XZcnjq4H7Q7ozK0ieb9s0GOlP1gBHSapstFXcUXIojpFv/+gdT9E1o
 W5jI1R/zxMPDKwR+u5F89s2xqK2fqUDP9MtDuR50QqN7rub8Mo8OWaC
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

There are no external users left, make the array static.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/leds/led-core.c | 3 +--
 drivers/leds/leds.h     | 1 -
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index e0dd2284e84a..f2cea4e094f6 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -25,7 +25,7 @@ EXPORT_SYMBOL_GPL(leds_list_lock);
 LIST_HEAD(leds_list);
 EXPORT_SYMBOL_GPL(leds_list);
 
-const char * const led_colors[LED_COLOR_ID_MAX] = {
+static const char * const led_colors[LED_COLOR_ID_MAX] = {
 	[LED_COLOR_ID_WHITE] = "white",
 	[LED_COLOR_ID_RED] = "red",
 	[LED_COLOR_ID_GREEN] = "green",
@@ -42,7 +42,6 @@ const char * const led_colors[LED_COLOR_ID_MAX] = {
 	[LED_COLOR_ID_CYAN] = "cyan",
 	[LED_COLOR_ID_LIME] = "lime",
 };
-EXPORT_SYMBOL_GPL(led_colors);
 
 static int __led_set_brightness(struct led_classdev *led_cdev, unsigned int value)
 {
diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
index 1138e2ab82e5..d7999e7372a4 100644
--- a/drivers/leds/leds.h
+++ b/drivers/leds/leds.h
@@ -30,6 +30,5 @@ ssize_t led_trigger_write(struct file *filp, struct kobject *kobj,
 
 extern struct rw_semaphore leds_list_lock;
 extern struct list_head leds_list;
-extern const char * const led_colors[LED_COLOR_ID_MAX];
 
 #endif	/* __LEDS_H_INCLUDED */

-- 
2.45.2


