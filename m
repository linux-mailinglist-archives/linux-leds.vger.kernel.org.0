Return-Path: <linux-leds+bounces-4346-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3899A6B85D
	for <lists+linux-leds@lfdr.de>; Fri, 21 Mar 2025 11:00:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21443481502
	for <lists+linux-leds@lfdr.de>; Fri, 21 Mar 2025 09:59:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61EA41F190E;
	Fri, 21 Mar 2025 09:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ns0H4aLA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AtRxDrs+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ns0H4aLA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AtRxDrs+"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6AC1C5F1B
	for <linux-leds@vger.kernel.org>; Fri, 21 Mar 2025 09:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742551148; cv=none; b=T44+JqrmM4rg0cxGi8AA30fZUJU0f3zS9nyP75slRBIsWNXEn6624qYvKV7+Slyf7YzLyK4p3L1Shae1VzQNZQqoIAxMvU/sCKOx/uRNk4IXRdxWRLQdBwWRAZ0jecH+7v/7F9ZZ84s8jYUWvv+EFZmCXr56vi0gRT7k/eTh3qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742551148; c=relaxed/simple;
	bh=7Y90RtWxKfkCgcOzRE8EoIavunLqkGiQ6SenRMWGDZs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l4b44bCLEjDMhOgANqg7/3lnAB/R0FzLMCbqU+0OiFuRGVWL4r0nf5S1UYTPJXJ/FPhZjZDXo9oJ1cCrfAnKNjhYPPiiTpmuMMO4dW69skFSSEBXGS9HmRfT/DUm+7226o1fMSbq9npmPGzHk1ijp91OycUqXgGmEl9xVpykzio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ns0H4aLA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AtRxDrs+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ns0H4aLA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AtRxDrs+; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 714421FB95;
	Fri, 21 Mar 2025 09:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742551115; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AUi+AHCEeaou6CiBnK3eQcsIRzoIFBHkfpyskO0Vc9Y=;
	b=Ns0H4aLAypi1QyTOZIvTdJ3z5gzr1rVGE3BN9b9tO2egmCLNXgguaC1XEif0BuaNLVYYAk
	vGnL0DGx6u6Nbxx95ac3lyyFY1hWBQ2OYgT4SUAJRWsLysCX0D5cb8/0EEK5RRHl3Cdc8R
	jdjznrmpplhmcFxJBQlsATy32szxISA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742551115;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AUi+AHCEeaou6CiBnK3eQcsIRzoIFBHkfpyskO0Vc9Y=;
	b=AtRxDrs+DCcxbEnDlf+DESjvirYpW2PGviqc2WCltzI7So+8ywJgePsdlywnOXLuQ0U96J
	+70zjta/TnhprEBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742551115; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AUi+AHCEeaou6CiBnK3eQcsIRzoIFBHkfpyskO0Vc9Y=;
	b=Ns0H4aLAypi1QyTOZIvTdJ3z5gzr1rVGE3BN9b9tO2egmCLNXgguaC1XEif0BuaNLVYYAk
	vGnL0DGx6u6Nbxx95ac3lyyFY1hWBQ2OYgT4SUAJRWsLysCX0D5cb8/0EEK5RRHl3Cdc8R
	jdjznrmpplhmcFxJBQlsATy32szxISA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742551115;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AUi+AHCEeaou6CiBnK3eQcsIRzoIFBHkfpyskO0Vc9Y=;
	b=AtRxDrs+DCcxbEnDlf+DESjvirYpW2PGviqc2WCltzI7So+8ywJgePsdlywnOXLuQ0U96J
	+70zjta/TnhprEBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2668A13A68;
	Fri, 21 Mar 2025 09:58:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CJ7tB0s43Wd9JAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 21 Mar 2025 09:58:35 +0000
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
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona.vetter@ffwll.ch>
Subject: [PATCH v4 07/11] backlight: lcd: Move event handling into helpers
Date: Fri, 21 Mar 2025 10:54:00 +0100
Message-ID: <20250321095517.313713-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250321095517.313713-1-tzimmermann@suse.de>
References: <20250321095517.313713-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	FREEMAIL_TO(0.00)[kernel.org,ucw.cz,gmail.com,gmx.de,ffwll.ch];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[11];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	R_RATELIMIT(0.00)[to_ip_from(RLyg698ibz7joe4egepamx3qut)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Spam-Score: -2.80
X-Spam-Flag: NO

Move the handling of display updates to separate helper functions.
There is code for handling fbdev blank events and fbdev mode changes.
The code currently runs from fbdev event notifiers, which will be
replaced.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>
Acked-by: Simona Vetter <simona.vetter@ffwll.ch>
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


