Return-Path: <linux-leds+bounces-4338-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2E0A6B844
	for <lists+linux-leds@lfdr.de>; Fri, 21 Mar 2025 10:58:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38F4C188F3A9
	for <lists+linux-leds@lfdr.de>; Fri, 21 Mar 2025 09:58:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C11A1C5F1B;
	Fri, 21 Mar 2025 09:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tpCespX7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/N57qXRe";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tpCespX7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/N57qXRe"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9EB1E9B3D
	for <linux-leds@vger.kernel.org>; Fri, 21 Mar 2025 09:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742551118; cv=none; b=Rhlg/Js5qZQUQe35GoFHQPTh5aZaxvKXcgcj9oOQYI8dh61ChWKPqXvBPiz9QFMIFWwD28PYUbplMa1hLI0hWmTXeoIr1U2nUsAx9hCNH4UJ+3Q0vKrHovgVVlB5fSDoKs4Iys2hX2dpLb2FWE+iBepjOVMCMzF3LG0DRofZ0Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742551118; c=relaxed/simple;
	bh=RjjXUe0VFqFjiGGPRqBi07ZJLR/XN0zMLZJwwtsScvs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iXZw9Git8hQdj6LeQfYnjaB+DHDsAXBSL5DnuCugDg4Rq1YoWyG4hxAqp/EUqTLx9b231OVaCO7di/9hXyzHGYDgZz3Yj7Sj9KN9LhShClZ9tCDW+/cyz+eiB0nu1gdbbg5W1ylzMoqgExEtra8+9Trs7iGSoMEzvumim3tQE8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tpCespX7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/N57qXRe; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tpCespX7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/N57qXRe; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BE8DC21959;
	Fri, 21 Mar 2025 09:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742551113; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xPeOly0HT7ZPjdQU+yOjPEwvef+CJXfIxFnbJjbKTCo=;
	b=tpCespX7B5K5BX/2T7eCLLgFfWjUSb7i1J4NqGlz7m4ENyveJIEs5ljgh47YqDYyDl7Tsf
	mTFuDvI3uwz1PMulo4pwfTg7dcAaw8ut5JdhxNlL0IVvqqxs3vf2ONkt52GGfbzWvWPUz0
	uWIYSraS9cd+YG+TirEGxXJk8Yh0Rsc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742551113;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xPeOly0HT7ZPjdQU+yOjPEwvef+CJXfIxFnbJjbKTCo=;
	b=/N57qXReTMVjOaeUy+SCZwUAU78kyMFQIDqO9qVs0kxPAxXmXGMNJnIyOLfsscMRCa+uAZ
	Ye8pgxpLMX8rBuCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742551113; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xPeOly0HT7ZPjdQU+yOjPEwvef+CJXfIxFnbJjbKTCo=;
	b=tpCespX7B5K5BX/2T7eCLLgFfWjUSb7i1J4NqGlz7m4ENyveJIEs5ljgh47YqDYyDl7Tsf
	mTFuDvI3uwz1PMulo4pwfTg7dcAaw8ut5JdhxNlL0IVvqqxs3vf2ONkt52GGfbzWvWPUz0
	uWIYSraS9cd+YG+TirEGxXJk8Yh0Rsc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742551113;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xPeOly0HT7ZPjdQU+yOjPEwvef+CJXfIxFnbJjbKTCo=;
	b=/N57qXReTMVjOaeUy+SCZwUAU78kyMFQIDqO9qVs0kxPAxXmXGMNJnIyOLfsscMRCa+uAZ
	Ye8pgxpLMX8rBuCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 73C87139AA;
	Fri, 21 Mar 2025 09:58:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qOIEG0k43Wd9JAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 21 Mar 2025 09:58:33 +0000
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
Subject: [PATCH v4 02/11] fbdev: Track display blanking state
Date: Fri, 21 Mar 2025 10:53:55 +0100
Message-ID: <20250321095517.313713-3-tzimmermann@suse.de>
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
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	FREEMAIL_TO(0.00)[kernel.org,ucw.cz,gmail.com,gmx.de,ffwll.ch];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[11];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Spam-Flag: NO
X-Spam-Level: 

Store the display's blank status in struct fb_info.blank and track
it in fb_blank(). As an extra, the status is now available from the
sysfs blank attribute.

Support for blanking is optional. Therefore framebuffer_alloc()
initializes the state to FB_BLANK_UNBLANK (i.e., the display is
on). If the fb_blank callback has been set, register_framebuffer()
sets the state to FB_BLANK_POWERDOWN. On the first modeset, the
call to fb_blank() will update it to _UNBLANK. This is important,
as listeners to FB_EVENT_BLANK will now see the display being
switched on.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Simona Vetter <simona.vetter@ffwll.ch>
---
 drivers/video/fbdev/core/fb_info.c |  1 +
 drivers/video/fbdev/core/fbmem.c   | 17 ++++++++++++++++-
 drivers/video/fbdev/core/fbsysfs.c |  8 ++++----
 include/linux/fb.h                 |  2 ++
 4 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/core/fb_info.c b/drivers/video/fbdev/core/fb_info.c
index 4847ebe50d7d..52f9bd2c5417 100644
--- a/drivers/video/fbdev/core/fb_info.c
+++ b/drivers/video/fbdev/core/fb_info.c
@@ -42,6 +42,7 @@ struct fb_info *framebuffer_alloc(size_t size, struct device *dev)
 
 	info->device = dev;
 	info->fbcon_rotate_hint = -1;
+	info->blank = FB_BLANK_UNBLANK;
 
 #if IS_ENABLED(CONFIG_FB_BACKLIGHT)
 	mutex_init(&info->bl_curve_mutex);
diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 39e2b81473ad..5d1529d300b7 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -341,6 +341,7 @@ EXPORT_SYMBOL(fb_set_var);
 
 int fb_blank(struct fb_info *info, int blank)
 {
+	int old_blank = info->blank;
 	struct fb_event event;
 	int ret;
 
@@ -353,13 +354,19 @@ int fb_blank(struct fb_info *info, int blank)
 	event.info = info;
 	event.data = &blank;
 
+	info->blank = blank;
+
 	ret = info->fbops->fb_blank(blank, info);
 	if (ret)
-		return ret;
+		goto err;
 
 	fb_notifier_call_chain(FB_EVENT_BLANK, &event);
 
 	return 0;
+
+err:
+	info->blank = old_blank;
+	return ret;
 }
 EXPORT_SYMBOL(fb_blank);
 
@@ -408,6 +415,14 @@ static int do_register_framebuffer(struct fb_info *fb_info)
 	mutex_init(&fb_info->lock);
 	mutex_init(&fb_info->mm_lock);
 
+	/*
+	 * With an fb_blank callback present, we assume that the
+	 * display is blank, so that fb_blank() enables it on the
+	 * first modeset.
+	 */
+	if (fb_info->fbops->fb_blank)
+		fb_info->blank = FB_BLANK_POWERDOWN;
+
 	fb_device_create(fb_info);
 
 	if (fb_info->pixmap.addr == NULL) {
diff --git a/drivers/video/fbdev/core/fbsysfs.c b/drivers/video/fbdev/core/fbsysfs.c
index 1b3c9958ef5c..e337660bce46 100644
--- a/drivers/video/fbdev/core/fbsysfs.c
+++ b/drivers/video/fbdev/core/fbsysfs.c
@@ -242,11 +242,11 @@ static ssize_t store_blank(struct device *device,
 	return count;
 }
 
-static ssize_t show_blank(struct device *device,
-			  struct device_attribute *attr, char *buf)
+static ssize_t show_blank(struct device *device, struct device_attribute *attr, char *buf)
 {
-//	struct fb_info *fb_info = dev_get_drvdata(device);
-	return 0;
+	struct fb_info *fb_info = dev_get_drvdata(device);
+
+	return sysfs_emit(buf, "%d\n", fb_info->blank);
 }
 
 static ssize_t store_console(struct device *device,
diff --git a/include/linux/fb.h b/include/linux/fb.h
index 5ba187e08cf7..f41d3334ac23 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -471,6 +471,8 @@ struct fb_info {
 	struct list_head modelist;      /* mode list */
 	struct fb_videomode *mode;	/* current mode */
 
+	int blank; /* current blanking; see FB_BLANK_ constants */
+
 #if IS_ENABLED(CONFIG_FB_BACKLIGHT)
 	/* assigned backlight device */
 	/* set before framebuffer registration,
-- 
2.48.1


