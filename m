Return-Path: <linux-leds+bounces-4095-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C8269A45A5F
	for <lists+linux-leds@lfdr.de>; Wed, 26 Feb 2025 10:38:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D8FF416C748
	for <lists+linux-leds@lfdr.de>; Wed, 26 Feb 2025 09:38:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CE3D226D1D;
	Wed, 26 Feb 2025 09:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ehkG7AlV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ExYHKTyI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ehkG7AlV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ExYHKTyI"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B609D226D08
	for <linux-leds@vger.kernel.org>; Wed, 26 Feb 2025 09:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740562717; cv=none; b=i0N13ytUXAFR1b4KdfazyxaLjv7onOD4nHQjsUHDDC+lIBu5idHkaV3ptwDjurf1Nzd+BNvo4GPj7RwqAP88SqcgBOgZIGKFEud08NWNGqOn2JY/lBVcA15peRqGHBjipp91cymiSFZCJF+AfZM4tLZEGCiFqik5cxRVR0ttwqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740562717; c=relaxed/simple;
	bh=6Kg0yQw1wsEX/DMsLgkk1iBQEDJ91SLUCpGQUr7yDzA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h3i/MkUsTpjzuPUJHtrZK/SoFdSwKrfvXwd8oFOBt45eNNnXjWvO2w5HFxylzb4CoJbEO0e+vFm+Put5pu/zk/mC+WWnUClf92FeNgvYd8jCSyinsI7MGsS1a49g59XXi6ZYTZ810g6Sh5I8p5UWTP9H5TA8cu1Zv0S7zf52SDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ehkG7AlV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ExYHKTyI; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ehkG7AlV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ExYHKTyI; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 444FA1F76C;
	Wed, 26 Feb 2025 09:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1740562668; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=euaJJrBEvXrsayPUWNFICMnLQe7WLRzeLyK8ZiHq0ek=;
	b=ehkG7AlV+a9KgdoWyRtzDqmAmG6BPn6RfyW6ueAA46lovtD8UMU+4yyL73o2vi7dxHzM5N
	BXOUPab5G6DG2iFHiBt45ZpyJy11o/Ie9RAAQfGIAhOX78uoMpWaoYqEXMS7JPNJ8JG1aj
	G1tucCl+xW1NMnAA7+a1Ex27SvObuYI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1740562668;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=euaJJrBEvXrsayPUWNFICMnLQe7WLRzeLyK8ZiHq0ek=;
	b=ExYHKTyImBVCMU7pVdhVV+hYa1ofxP1CidKoMLqKzSty8uiW2JQCenecmHOfzqOFqWVGAJ
	bECzx1NWNgHampDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1740562668; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=euaJJrBEvXrsayPUWNFICMnLQe7WLRzeLyK8ZiHq0ek=;
	b=ehkG7AlV+a9KgdoWyRtzDqmAmG6BPn6RfyW6ueAA46lovtD8UMU+4yyL73o2vi7dxHzM5N
	BXOUPab5G6DG2iFHiBt45ZpyJy11o/Ie9RAAQfGIAhOX78uoMpWaoYqEXMS7JPNJ8JG1aj
	G1tucCl+xW1NMnAA7+a1Ex27SvObuYI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1740562668;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=euaJJrBEvXrsayPUWNFICMnLQe7WLRzeLyK8ZiHq0ek=;
	b=ExYHKTyImBVCMU7pVdhVV+hYa1ofxP1CidKoMLqKzSty8uiW2JQCenecmHOfzqOFqWVGAJ
	bECzx1NWNgHampDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F15C813A53;
	Wed, 26 Feb 2025 09:37:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0PWgOevgvmezXQAAD6G6ig
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
Subject: [PATCH v2 10/11] leds: backlight trigger: Replace fb events with a dedicated function call
Date: Wed, 26 Feb 2025 10:31:59 +0100
Message-ID: <20250226093456.147402-11-tzimmermann@suse.de>
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
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
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
X-Spam-Score: -6.80
X-Spam-Flag: NO

Remove support for fb events from the led backlight trigger. Provide
the helper ledtrig_backlight_blank() instead. Call it from fbdev to
inform the trigger of changes to a display's blank state.

Fbdev maintains a list of all installed notifiers. Instead of the fbdev
notifiers, maintain an internal list of led backlight triggers.

v2:
- maintain global list of led backlight triggers (Lee)
- avoid IS_REACHABLE() in source file (Lee)
- notify on changes to blank state instead of display state
- use lock guards
- initialize led list and list mutex

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/leds/trigger/ledtrig-backlight.c | 41 +++++++++---------------
 drivers/video/fbdev/core/fbmem.c         | 19 +++++------
 include/linux/leds.h                     |  6 ++++
 3 files changed, 32 insertions(+), 34 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-backlight.c b/drivers/leds/trigger/ledtrig-backlight.c
index 8e66d55a6c82..2d351de81927 100644
--- a/drivers/leds/trigger/ledtrig-backlight.c
+++ b/drivers/leds/trigger/ledtrig-backlight.c
@@ -10,7 +10,6 @@
 #include <linux/kernel.h>
 #include <linux/slab.h>
 #include <linux/init.h>
-#include <linux/fb.h>
 #include <linux/leds.h>
 #include "../leds.h"
 
@@ -21,10 +20,14 @@ struct bl_trig_notifier {
 	struct led_classdev *led;
 	int brightness;
 	int old_status;
-	struct notifier_block notifier;
 	unsigned invert;
+
+	struct list_head entry;
 };
 
+static DEFINE_MUTEX(ledtrig_backlight_list_mutex);
+static LIST_HEAD(ledtrig_backlight_list);
+
 static void ledtrig_backlight_notify_blank(struct bl_trig_notifier *n, int new_status)
 {
 	struct led_classdev *led = n->led;
@@ -42,25 +45,15 @@ static void ledtrig_backlight_notify_blank(struct bl_trig_notifier *n, int new_s
 	n->old_status = new_status;
 }
 
-static int fb_notifier_callback(struct notifier_block *p,
-				unsigned long event, void *data)
+void ledtrig_backlight_blank(bool blank)
 {
-	struct bl_trig_notifier *n = container_of(p,
-					struct bl_trig_notifier, notifier);
-	struct fb_event *fb_event = data;
-	int *blank;
-	int new_status;
-
-	/* If we aren't interested in this event, skip it immediately ... */
-	if (event != FB_EVENT_BLANK)
-		return 0;
-
-	blank = fb_event->data;
-	new_status = *blank ? BLANK : UNBLANK;
+	struct bl_trig_notifier *n;
+	int new_status = blank ? BLANK : UNBLANK;
 
-	ledtrig_backlight_notify_blank(n, new_status);
+	guard(mutex)(&ledtrig_backlight_list_mutex);
 
-	return 0;
+	list_for_each_entry(n, &ledtrig_backlight_list, entry)
+		ledtrig_backlight_notify_blank(n, new_status);
 }
 
 static ssize_t bl_trig_invert_show(struct device *dev,
@@ -106,8 +99,6 @@ ATTRIBUTE_GROUPS(bl_trig);
 
 static int bl_trig_activate(struct led_classdev *led)
 {
-	int ret;
-
 	struct bl_trig_notifier *n;
 
 	n = kzalloc(sizeof(struct bl_trig_notifier), GFP_KERNEL);
@@ -118,11 +109,9 @@ static int bl_trig_activate(struct led_classdev *led)
 	n->led = led;
 	n->brightness = led->brightness;
 	n->old_status = UNBLANK;
-	n->notifier.notifier_call = fb_notifier_callback;
 
-	ret = fb_register_client(&n->notifier);
-	if (ret)
-		dev_err(led->dev, "unable to register backlight trigger\n");
+	guard(mutex)(&ledtrig_backlight_list_mutex);
+	list_add(&n->entry, &ledtrig_backlight_list);
 
 	return 0;
 }
@@ -131,7 +120,9 @@ static void bl_trig_deactivate(struct led_classdev *led)
 {
 	struct bl_trig_notifier *n = led_get_trigger_data(led);
 
-	fb_unregister_client(&n->notifier);
+	guard(mutex)(&ledtrig_backlight_list_mutex);
+	list_del(&n->entry);
+
 	kfree(n);
 }
 
diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 001662c606d7..f089f72ec75a 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -16,6 +16,7 @@
 #include <linux/fb.h>
 #include <linux/fbcon.h>
 #include <linux/lcd.h>
+#include <linux/leds.h>
 
 #include <video/nomodeset.h>
 
@@ -369,11 +370,17 @@ static void fb_lcd_notify_blank(struct fb_info *info)
 	lcd_notify_blank_all(info->device, power);
 }
 
+static void fb_ledtrig_backlight_notify_blank(struct fb_info *info)
+{
+	if (info->blank == FB_BLANK_UNBLANK)
+		ledtrig_backlight_blank(false);
+	else
+		ledtrig_backlight_blank(true);
+}
+
 int fb_blank(struct fb_info *info, int blank)
 {
 	int old_blank = info->blank;
-	struct fb_event event;
-	int data[2];
 	int ret;
 
 	if (!info->fbops->fb_blank)
@@ -382,11 +389,6 @@ int fb_blank(struct fb_info *info, int blank)
 	if (blank > FB_BLANK_POWERDOWN)
 		blank = FB_BLANK_POWERDOWN;
 
-	data[0] = blank;
-	data[1] = old_blank;
-	event.info = info;
-	event.data = data;
-
 	info->blank = blank;
 
 	ret = info->fbops->fb_blank(blank, info);
@@ -395,8 +397,7 @@ int fb_blank(struct fb_info *info, int blank)
 
 	fb_bl_notify_blank(info, old_blank);
 	fb_lcd_notify_blank(info);
-
-	fb_notifier_call_chain(FB_EVENT_BLANK, &event);
+	fb_ledtrig_backlight_notify_blank(info);
 
 	return 0;
 
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 98f9719c924c..b3f0aa081064 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -640,6 +640,12 @@ static inline void ledtrig_flash_ctrl(bool on) {}
 static inline void ledtrig_torch_ctrl(bool on) {}
 #endif
 
+#if IS_REACHABLE(CONFIG_LEDS_TRIGGER_BACKLIGHT)
+void ledtrig_backlight_blank(bool blank);
+#else
+static inline void ledtrig_backlight_blank(bool blank) {}
+#endif
+
 /*
  * Generic LED platform data for describing LED names and default triggers.
  */
-- 
2.48.1


