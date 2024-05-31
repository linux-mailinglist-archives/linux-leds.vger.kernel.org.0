Return-Path: <linux-leds+bounces-1781-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B10488D66FA
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 18:35:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 574691F26FDD
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 16:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22AA817E44F;
	Fri, 31 May 2024 16:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="YEQ6ODVG"
X-Original-To: linux-leds@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F28917D8AE;
	Fri, 31 May 2024 16:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717173225; cv=none; b=S3OATbg7oREKh87CPDA+4GfxaLt7Kr/bP3Axh+m5vxTGVit3Dwty+OTAiIk8iSNFjIu+BVF5cMD6eT9I3oVi/iCj4etVY/qki2tPaSMAAbeLMpbsMVUqcG3WAjyA02ZBT0nzqu36m1S1eikj9Kkfr9Zs/XudDbiY3kabhONnwJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717173225; c=relaxed/simple;
	bh=6P/REFXkRfn4bWBytnGVypd3XVcWLfHX/2SwBqbZM9Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ftK+mJEgA/TG/8WR2iooN2OPkfpnTK0rMc1FH8pxt1sLkaMzPRZ7zU88fJumN3jjNg0qsgYE5tyNsEMmPlhksYIc0wzCQfINSWPTpVo9U6uekmsitVto9fOPmiPtZXEcM4bl31dxCIm5WjvL68tIma4vKvY1tkhsA41eg37RWuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=YEQ6ODVG; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1717173219;
	bh=6P/REFXkRfn4bWBytnGVypd3XVcWLfHX/2SwBqbZM9Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YEQ6ODVG2g70bMj47WPgcisRwtBaGQFnP3v2Uml2Cy82LqBpt8HdqykhnjvqLltDb
	 p0fcQZFZmV5uh/j6+btGH8ARK7Yn31hogxbSyYAAfFJ29RulPHhLavjbgHLeG5nNcJ
	 vQPteVPR2iLp98JUWjdg3A8YSuGl316+xqDaytf8=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Fri, 31 May 2024 18:33:33 +0200
Subject: [PATCH v2 3/5] leds: core: Unexport led_colors[] array
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240531-cros_ec-led-v2-3-6cc34408b40d@weissschuh.net>
References: <20240531-cros_ec-led-v2-0-6cc34408b40d@weissschuh.net>
In-Reply-To: <20240531-cros_ec-led-v2-0-6cc34408b40d@weissschuh.net>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas@weissschuh.net>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 chrome-platform@lists.linux.dev, Dustin Howett <dustin@howett.net>, 
 Mario Limonciello <mario.limonciello@amd.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717173219; l=1434;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=6P/REFXkRfn4bWBytnGVypd3XVcWLfHX/2SwBqbZM9Y=;
 b=KgPBSTNMPiQRBdNPmlr2NPQyoeK81ZrR1G/EpJlPPAoyHUvUMqmQLYQFh+BGjRmm0lZl2TT03
 TWsmqHGjsPdAVVyFdKqus3ybt2CR/OzuuTjN6yTMTzcvRBTNeM8+QI3
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
2.45.1


