Return-Path: <linux-leds+bounces-3891-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE2CA2ACCB
	for <lists+linux-leds@lfdr.de>; Thu,  6 Feb 2025 16:41:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 191223A776C
	for <lists+linux-leds@lfdr.de>; Thu,  6 Feb 2025 15:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6C1B236A86;
	Thu,  6 Feb 2025 15:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="d1ytvv7C";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HLilR6NI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="d1ytvv7C";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HLilR6NI"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27BA232384;
	Thu,  6 Feb 2025 15:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738856451; cv=none; b=Pps0vvFgNjIJ0Zue4TIWzkfJwvW66QeR1UuaGxG0SZoZGnDPPcSGjJK3qXdQH4OVa/KMdmwMMjeXwcWQO6xNjrqBpGKgOwTeC8cCuUBB6jl7Rdb3zGb23lLmIThh7cyVshemtGl0GY4JVTCzhJYxYuAqRV2nl3WPozsBAAfCYRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738856451; c=relaxed/simple;
	bh=nL05cqggpuNmmE7DosE9nBxrRGqmdaAxskCKiAcXeRA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZLzh8M1BX1dtz3NjpmcPHl6ncssMsCXTdJmt05Urwe8IHZt94tGM/+4qRJYQVDNOqmzU65a+xd3HWF52qSo6fZt3xj0TyTJCXC9f7fhhBX6vKBTJgi4LOkw7i+Mnxv7yDo4YDi+r6XiN99U+0d+veb9nKLbhiExHHQRvNozsn1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=d1ytvv7C; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HLilR6NI; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=d1ytvv7C; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HLilR6NI; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9F49B1F454;
	Thu,  6 Feb 2025 15:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738856447; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jmbUr2Mf+hr5PVI5lI2Yi5MZ3LHQoo/7YmPQgqxyygk=;
	b=d1ytvv7C+kNRCachad0W4HhP15PLTj7RY9I/ynS2bRZZVy7qBqWYEbbtjpt1Y1rG+2i98L
	hV4KTaMe4LXP/8OIpCktRCYXFwGEH/MTroimdinkZfRVMvkwx8CaJ0ctPtn8HWWI6laGbs
	6QsthArdlKF7CRfLBSzTEzFmtSQN0CM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738856447;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jmbUr2Mf+hr5PVI5lI2Yi5MZ3LHQoo/7YmPQgqxyygk=;
	b=HLilR6NI+dFd8F/ZnNGR4ZtrSeIiMz9diL3mBGO9aSyBcisAbB/RMP8VwguCeVVObXwQlb
	5h/D95oGgKF5G0AQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738856447; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jmbUr2Mf+hr5PVI5lI2Yi5MZ3LHQoo/7YmPQgqxyygk=;
	b=d1ytvv7C+kNRCachad0W4HhP15PLTj7RY9I/ynS2bRZZVy7qBqWYEbbtjpt1Y1rG+2i98L
	hV4KTaMe4LXP/8OIpCktRCYXFwGEH/MTroimdinkZfRVMvkwx8CaJ0ctPtn8HWWI6laGbs
	6QsthArdlKF7CRfLBSzTEzFmtSQN0CM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738856447;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jmbUr2Mf+hr5PVI5lI2Yi5MZ3LHQoo/7YmPQgqxyygk=;
	b=HLilR6NI+dFd8F/ZnNGR4ZtrSeIiMz9diL3mBGO9aSyBcisAbB/RMP8VwguCeVVObXwQlb
	5h/D95oGgKF5G0AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5A4BB13697;
	Thu,  6 Feb 2025 15:40:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EJTYFP/XpGf4PAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 06 Feb 2025 15:40:47 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: pavel@ucw.cz,
	lee@kernel.org,
	danielt@kernel.org,
	jingoohan1@gmail.com,
	deller@gmx.de,
	simona@ffwll.ch
Cc: linux-leds@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 12/13] leds: backlight trigger: Replace fb events with a dedicated function call
Date: Thu,  6 Feb 2025 16:30:31 +0100
Message-ID: <20250206154033.697495-13-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250206154033.697495-1-tzimmermann@suse.de>
References: <20250206154033.697495-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_TO(0.00)[ucw.cz,kernel.org,gmail.com,gmx.de,ffwll.ch];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Spam-Score: -6.80
X-Spam-Flag: NO

Remove support for fb events from the led backlight trigger. Provide the
helper ledtrig_backlight_blank() instead. Call it from fbdev to inform
the trigger of changes to a display's blank state.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/leds/trigger/ledtrig-backlight.c | 31 +++++-------------------
 drivers/video/fbdev/core/fbmem.c         | 21 +++++++++-------
 include/linux/leds.h                     |  6 +++++
 3 files changed, 24 insertions(+), 34 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-backlight.c b/drivers/leds/trigger/ledtrig-backlight.c
index f9317f93483b..e3ae4adc29e3 100644
--- a/drivers/leds/trigger/ledtrig-backlight.c
+++ b/drivers/leds/trigger/ledtrig-backlight.c
@@ -10,7 +10,6 @@
 #include <linux/kernel.h>
 #include <linux/slab.h>
 #include <linux/init.h>
-#include <linux/fb.h>
 #include <linux/leds.h>
 #include "../leds.h"
 
@@ -21,7 +20,6 @@ struct bl_trig_notifier {
 	struct led_classdev *led;
 	int brightness;
 	int old_status;
-	struct notifier_block notifier;
 	unsigned invert;
 
 	struct list_head entry;
@@ -30,7 +28,7 @@ struct bl_trig_notifier {
 static struct list_head ledtrig_backlight_list;
 static struct mutex ledtrig_backlight_list_mutex;
 
-static void ledtrig_backlight_blank(struct bl_trig_notifier *n, bool on)
+static void __ledtrig_backlight_blank(struct bl_trig_notifier *n, bool on)
 {
 	struct led_classdev *led = n->led;
 	int new_status = !on ? BLANK : UNBLANK;
@@ -48,23 +46,14 @@ static void ledtrig_backlight_blank(struct bl_trig_notifier *n, bool on)
 	n->old_status = new_status;
 }
 
-static int fb_notifier_callback(struct notifier_block *p,
-				unsigned long event, void *data)
+void ledtrig_backlight_blank(bool on)
 {
-	struct bl_trig_notifier *n = container_of(p,
-					struct bl_trig_notifier, notifier);
-	struct fb_event *fb_event = data;
-	int *blank;
-
-	/* If we aren't interested in this event, skip it immediately ... */
-	if (event != FB_EVENT_BLANK)
-		return 0;
-
-	blank = fb_event->data;
+	struct bl_trig_notifier *n;
 
-	ledtrig_backlight_blank(n, !blank[0]);
+	guard(mutex)(&ledtrig_backlight_list_mutex);
 
-	return 0;
+	list_for_each_entry(n, &ledtrig_backlight_list, entry)
+		__ledtrig_backlight_blank(n, on);
 }
 
 static ssize_t bl_trig_invert_show(struct device *dev,
@@ -110,8 +99,6 @@ ATTRIBUTE_GROUPS(bl_trig);
 
 static int bl_trig_activate(struct led_classdev *led)
 {
-	int ret;
-
 	struct bl_trig_notifier *n;
 
 	n = kzalloc(sizeof(struct bl_trig_notifier), GFP_KERNEL);
@@ -122,11 +109,6 @@ static int bl_trig_activate(struct led_classdev *led)
 	n->led = led;
 	n->brightness = led->brightness;
 	n->old_status = UNBLANK;
-	n->notifier.notifier_call = fb_notifier_callback;
-
-	ret = fb_register_client(&n->notifier);
-	if (ret)
-		dev_err(led->dev, "unable to register backlight trigger\n");
 
 	mutex_lock(&ledtrig_backlight_list_mutex);
 	list_add(&n->entry, &ledtrig_backlight_list);
@@ -143,7 +125,6 @@ static void bl_trig_deactivate(struct led_classdev *led)
 	list_del(&n->entry);
 	mutex_unlock(&ledtrig_backlight_list_mutex);
 
-	fb_unregister_client(&n->notifier);
 	kfree(n);
 }
 
diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index fb7ca143a996..92c3fe2a7aff 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -16,6 +16,7 @@
 #include <linux/fb.h>
 #include <linux/fbcon.h>
 #include <linux/lcd.h>
+#include <linux/leds.h>
 
 #include <video/nomodeset.h>
 
@@ -373,11 +374,19 @@ static void fb_lcd_notify_blank(struct fb_info *info)
 #endif
 }
 
+static void fb_ledtrig_backlight_notify_blank(struct fb_info *info)
+{
+#if IS_REACHABLE(CONFIG_LEDS_TRIGGER_BACKLIGHT)
+	if (info->blank == FB_BLANK_UNBLANK)
+		ledtrig_backlight_blank(true);
+	else
+		ledtrig_backlight_blank(false);
+#endif
+}
+
 int fb_blank(struct fb_info *info, int blank)
 {
 	int old_blank = info->blank;
-	struct fb_event event;
-	int data[2];
 	int ret;
 
 	if (!info->fbops->fb_blank)
@@ -386,11 +395,6 @@ int fb_blank(struct fb_info *info, int blank)
 	if (blank > FB_BLANK_POWERDOWN)
 		blank = FB_BLANK_POWERDOWN;
 
-	data[0] = blank;
-	data[1] = old_blank;
-	event.info = info;
-	event.data = data;
-
 	info->blank = blank;
 
 	ret = info->fbops->fb_blank(blank, info);
@@ -399,8 +403,7 @@ int fb_blank(struct fb_info *info, int blank)
 
 	fb_bl_notify_blank(info, old_blank);
 	fb_lcd_notify_blank(info);
-
-	fb_notifier_call_chain(FB_EVENT_BLANK, &event);
+	fb_ledtrig_backlight_notify_blank(info);
 
 	return 0;
 
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 98f9719c924c..8c7c41888f7d 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -640,6 +640,12 @@ static inline void ledtrig_flash_ctrl(bool on) {}
 static inline void ledtrig_torch_ctrl(bool on) {}
 #endif
 
+#if IS_ENABLED(CONFIG_LEDS_TRIGGER_BACKLIGHT)
+void ledtrig_backlight_blank(bool on);
+#else
+static inline void ledtrig_backlight_blank(bool on) {}
+#endif
+
 /*
  * Generic LED platform data for describing LED names and default triggers.
  */
-- 
2.48.1


