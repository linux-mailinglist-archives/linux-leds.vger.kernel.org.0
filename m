Return-Path: <linux-leds+bounces-1688-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7617B8C9AE5
	for <lists+linux-leds@lfdr.de>; Mon, 20 May 2024 12:01:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A73AF1C208E1
	for <lists+linux-leds@lfdr.de>; Mon, 20 May 2024 10:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D760314290;
	Mon, 20 May 2024 10:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="TygqArYL"
X-Original-To: linux-leds@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD26481C0;
	Mon, 20 May 2024 10:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716199277; cv=none; b=EED6GnGpptxBd8lBiE6GiiLkJuXR70VXqYuXBtCaTomZB043n/LptnokOHl1WE1QcYppGYRN6zvde+oFTr5/QDpBE+Q8fFVqT4AxM/QnRjl1VNlsEmPmLvVn3IV+FjWC0M3VOCyMLHo8XD0oe7Nl+05BqrJn1TePBXL/mh5Fyt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716199277; c=relaxed/simple;
	bh=LQgzJZ0u6W5sHtmqg9J+QaiBUh2lZZOE4L7+eVpQMOI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b/yt8YTRqLNCRry5QM7Thoq53S+7kYnvQcLCT3QnNHBo85ExTk9EYoX4Q1wNM2bJetvRGeWHdWZ2QGOyXPK5SAbieVILtO3tgSiA6HY55oGhdNvqgLQoFn4Poyp8tb60fl3B1n8qSiA3CPNasmAAo1onvxlm9NegNezSXdoQE/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=TygqArYL; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1716199266;
	bh=LQgzJZ0u6W5sHtmqg9J+QaiBUh2lZZOE4L7+eVpQMOI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TygqArYLVeHtdK2h3sRvIdVK52ZJQK0IND3TolwylMPZV/FKjI9uAIeucUkwzxmQ6
	 l3tXNflwU9lMFCXhp1vd4s9ueEfH6SJuoHWtSNH4N7wFVG1ceGjEbSdkpIqWHOPPdR
	 Vn5LQWfgS0dKlO2hxGwRrrBja+66BjdmftUBYlTk=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 20 May 2024 12:00:31 +0200
Subject: [PATCH 3/5] leds: unexport led_colors array
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240520-cros_ec-led-v1-3-4068fc5c051a@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716199265; l=1434;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=LQgzJZ0u6W5sHtmqg9J+QaiBUh2lZZOE4L7+eVpQMOI=;
 b=mhuyi85Pa+ngrmhrZNKoaMWrFmPMGQSJ4CViCdx1N5jA0tMgD+3EOOdCbL5UnqpI9LUsdd2QG
 Y3qr4Ds7kvMCfa98APXsvUSkIFy785WZeO7P7wGpM9FEysjdOjbl0CC
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

There are no external users left, make the array static.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/leds/led-core.c | 3 +--
 drivers/leds/leds.h     | 1 -
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index 04a49958458e..94f8b47fc025 100644
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
2.45.1


