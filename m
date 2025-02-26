Return-Path: <linux-leds+bounces-4093-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A15A45A58
	for <lists+linux-leds@lfdr.de>; Wed, 26 Feb 2025 10:38:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 489281880726
	for <lists+linux-leds@lfdr.de>; Wed, 26 Feb 2025 09:38:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF8AC226D07;
	Wed, 26 Feb 2025 09:38:25 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FF31E1E18
	for <linux-leds@vger.kernel.org>; Wed, 26 Feb 2025 09:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740562705; cv=none; b=mnoqy6xmOyTXFxWv9o6jCxDzMTeqQpEoAYjZYFAymQzzSl86lG8KMrD4WBUdKKF7tErw0qpFTNnxatGrgy7hHUj6VLqKtkU/aIopAN3rejnRsoMLZmF+SjYbeJcwiKmLCuSvF+zH2OYY5tAApU+HAxxZ49kCQuNvy7SGjZ4hXNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740562705; c=relaxed/simple;
	bh=rhW/P84AgHPcK09qLqNurXUTmdBqqZeK9KdFDD5WNU0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kZ1lCndfNpR80+doY5Y0FjFIjQfOag28hQa8OnaEQv0dFgp1O87cSO8aZ03EafFk53vV7tUwui4FY7PQO0fZJFd3GGalHwAyRy+B/YRQIyQSgKWc7Bx974gFpwoFMupZERfaFodQsuqiolRefJogCgCSMHtFf6B+UYETKJveyaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5167B1F74C;
	Wed, 26 Feb 2025 09:37:47 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0A0E713A82;
	Wed, 26 Feb 2025 09:37:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YE0pAevgvmezXQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Wed, 26 Feb 2025 09:37:47 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org,
	pavel@ucw.cz,
	danielt@kernel.org,
	jingoohan1@gmail.com,
	deller@gmx.de,
	simona@ffwll.ch
Cc: linux-leds@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 07/11] backlight: lcd: Move event handling into helpers
Date: Wed, 26 Feb 2025 10:31:56 +0100
Message-ID: <20250226093456.147402-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250226093456.147402-1-tzimmermann@suse.de>
References: <20250226093456.147402-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 5167B1F74C
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

Move the handling of display updates to separate helper functions.
There is code for handling fbdev blank events and fbdev mode changes.
The code currently runs from fbdev event notifiers, which will be
replaced.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/backlight/lcd.c | 38 ++++++++++++++++++++++++++---------
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/drivers/video/backlight/lcd.c b/drivers/video/backlight/lcd.c
index 3267acf8dc5b..f57ff8bcc2fa 100644
--- a/drivers/video/backlight/lcd.c
+++ b/drivers/video/backlight/lcd.c
@@ -18,6 +18,32 @@
 #include <linux/fb.h>
 #include <linux/slab.h>
 
+static void lcd_notify_blank(struct lcd_device *ld, struct device *display_dev,
+			     int power)
+{
+	guard(mutex)(&ld->ops_lock);
+
+	if (!ld->ops || !ld->ops->set_power)
+		return;
+	if (ld->ops->controls_device && !ld->ops->controls_device(ld, display_dev))
+		return;
+
+	ld->ops->set_power(ld, power);
+}
+
+static void lcd_notify_mode_change(struct lcd_device *ld, struct device *display_dev,
+				   unsigned int width, unsigned int height)
+{
+	guard(mutex)(&ld->ops_lock);
+
+	if (!ld->ops || !ld->ops->set_mode)
+		return;
+	if (ld->ops->controls_device && !ld->ops->controls_device(ld, display_dev))
+		return;
+
+	ld->ops->set_mode(ld, width, height);
+}
+
 #if defined(CONFIG_FB) || (defined(CONFIG_FB_MODULE) && \
 			   defined(CONFIG_LCD_CLASS_DEVICE_MODULE))
 static int to_lcd_power(int fb_blank)
@@ -50,25 +76,17 @@ static int fb_notifier_callback(struct notifier_block *self,
 	struct fb_info *info = evdata->info;
 	struct lcd_device *fb_lcd = fb_lcd_device(info);
 
-	guard(mutex)(&ld->ops_lock);
-
-	if (!ld->ops)
-		return 0;
-	if (ld->ops->controls_device && !ld->ops->controls_device(ld, info->device))
-		return 0;
 	if (fb_lcd && fb_lcd != ld)
 		return 0;
 
 	if (event == FB_EVENT_BLANK) {
 		int power = to_lcd_power(*(int *)evdata->data);
 
-		if (ld->ops->set_power)
-			ld->ops->set_power(ld, power);
+		lcd_notify_blank(ld, info->device, power);
 	} else {
 		const struct fb_videomode *videomode = evdata->data;
 
-		if (ld->ops->set_mode)
-			ld->ops->set_mode(ld, videomode->xres, videomode->yres);
+		lcd_notify_mode_change(ld, info->device, videomode->xres, videomode->yres);
 	}
 
 	return 0;
-- 
2.48.1


