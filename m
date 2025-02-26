Return-Path: <linux-leds+bounces-4084-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7595AA45A45
	for <lists+linux-leds@lfdr.de>; Wed, 26 Feb 2025 10:38:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF66B1894EA3
	for <lists+linux-leds@lfdr.de>; Wed, 26 Feb 2025 09:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F76D238144;
	Wed, 26 Feb 2025 09:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fIcZdHQ5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FYAzZ1WQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fIcZdHQ5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FYAzZ1WQ"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FE5226D15
	for <linux-leds@vger.kernel.org>; Wed, 26 Feb 2025 09:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740562669; cv=none; b=Hs3u1CUIhHaoTUubnbBK4iyy/2qNiWqOQbWw6BhFADB2J/MPZJ3ttqGkEamc8WT3qxqe8gt9bLZ0qBEZ+ylxI5RbJLqMxavC8Q5hvVmw5G0eBg7Gkdbtk/4qfRVZTWPEpB+e86jK9O6zzpf1FLXwyIYK2cI08uajxdz/+oM6JPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740562669; c=relaxed/simple;
	bh=v9aErBigVh1hyRlNArcokavGBJlm/BNuJOWtKDkrzWI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XBCpruCeHVpUQYJV9FbTyWWmWAMSsfUpoGjxUdbOyXi9r58pXeSYut7FgtUEU/HKV5GzWE2tOZn7a+gmBWJwSAkv+dY0SmBzyyfqThfBpsSFdiKZRIHBqkT29Y7fXH6gz7o17E2BbuYICqDGytzEImaCkuKfSyaBNFeBWbpiih4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fIcZdHQ5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FYAzZ1WQ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fIcZdHQ5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FYAzZ1WQ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B5B2221193;
	Wed, 26 Feb 2025 09:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1740562665; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jeIgqPwyr/o7iDjCl0qc5W9ZvbMhlJVkiLzBNzf/Z7o=;
	b=fIcZdHQ5ZyDgq4AhgQ2CseiCtkFTAo7o3FJttLCAsnfVn7Aic8139xewfXHHprB2B+kttv
	1q0KBXYVuB8j+4wEFVDh0/jnIcgDHnqe/hpdQKfCFiWmgDuxxBZGKh7nFuCXuqWOf/Q4KN
	HKFKx3kKpejyGEUIo6X2JX1fIam1jlI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1740562665;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jeIgqPwyr/o7iDjCl0qc5W9ZvbMhlJVkiLzBNzf/Z7o=;
	b=FYAzZ1WQXXIE8oW98kdYY953vg1lKirPKVDiJcOLjYVbhP6oWR/OnUZFkUbxocF54uIjUK
	h1WbF+3fZAGqf+AA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1740562665; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jeIgqPwyr/o7iDjCl0qc5W9ZvbMhlJVkiLzBNzf/Z7o=;
	b=fIcZdHQ5ZyDgq4AhgQ2CseiCtkFTAo7o3FJttLCAsnfVn7Aic8139xewfXHHprB2B+kttv
	1q0KBXYVuB8j+4wEFVDh0/jnIcgDHnqe/hpdQKfCFiWmgDuxxBZGKh7nFuCXuqWOf/Q4KN
	HKFKx3kKpejyGEUIo6X2JX1fIam1jlI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1740562665;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jeIgqPwyr/o7iDjCl0qc5W9ZvbMhlJVkiLzBNzf/Z7o=;
	b=FYAzZ1WQXXIE8oW98kdYY953vg1lKirPKVDiJcOLjYVbhP6oWR/OnUZFkUbxocF54uIjUK
	h1WbF+3fZAGqf+AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6F95A13A53;
	Wed, 26 Feb 2025 09:37:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wP3wGengvmezXQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Wed, 26 Feb 2025 09:37:45 +0000
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
Subject: [PATCH v2 02/11] fbdev: Track display blanking state
Date: Wed, 26 Feb 2025 10:31:51 +0100
Message-ID: <20250226093456.147402-3-tzimmermann@suse.de>
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
X-Spam-Score: -6.80
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.993];
	MIME_GOOD(-0.10)[text/plain];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,ucw.cz,gmail.com,gmx.de,ffwll.ch];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6)];
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


