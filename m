Return-Path: <linux-leds+bounces-3886-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 758AAA2ACBE
	for <lists+linux-leds@lfdr.de>; Thu,  6 Feb 2025 16:40:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79C29161F8D
	for <lists+linux-leds@lfdr.de>; Thu,  6 Feb 2025 15:40:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CEF9230D37;
	Thu,  6 Feb 2025 15:40:49 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8E6227586;
	Thu,  6 Feb 2025 15:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738856449; cv=none; b=jKO9sLwLSUDr8ZvrVYykLRsiNvHIYCsyClsvb9ag8DHWH8jdSlC92xB0QiRCgaun6PgK8sbmgrxlEVOKHjvwWuliTLOSmjw000pDvUGF1Ju2L+uaIigtj53kfok0LLbzkxPKui6gEEHoD/MZaYLX3bKJhsONUsqJNFYD/4pZbxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738856449; c=relaxed/simple;
	bh=ZcE23XgUxUGrQtvwWbtOpZIEzDrYAMzEu++vODjdMZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WShrANqypJ8EIng/dhfMl6kBfjXbWbmP1g43T+X1fFLsVriJt9bwxu9YcffHqs2TL7WiXoohDWjF6UTCiJc3a2tKrMk/iRBHW6idcgfLUttxlsF7QnxVHbN7KeDBgMOfdR91nwAkznGdfYC+zm8+f3sfu5znltdMB5sfpIk7LRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CE7431F44F;
	Thu,  6 Feb 2025 15:40:45 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8B1A213697;
	Thu,  6 Feb 2025 15:40:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6BW0IP3XpGf4PAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 06 Feb 2025 15:40:45 +0000
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
Subject: [PATCH 06/13] backlight: Replace fb events with a dedicated function call
Date: Thu,  6 Feb 2025 16:30:25 +0100
Message-ID: <20250206154033.697495-7-tzimmermann@suse.de>
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
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU]
X-Spam-Score: -4.00
X-Spam-Flag: NO
X-Rspamd-Queue-Id: CE7431F44F
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

Remove support for fb events from backlight subsystem. Provide the
helper backlight_notify_blank_all() instead. Also export the existing
helper backlight_notify_blank() to update a single backlight device.

In fbdev, call either helper to inform the backlight subsystem of
changes to a display's blank state. If the framebuffer device has a
specific backlight, only update this one; otherwise update all.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/backlight/backlight.c     | 85 ++++---------------------
 drivers/video/fbdev/core/fb_backlight.c | 12 ++++
 drivers/video/fbdev/core/fbmem.c        |  2 +
 include/linux/backlight.h               | 12 ++--
 include/linux/fb.h                      |  4 ++
 5 files changed, 36 insertions(+), 79 deletions(-)

diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
index 1c43f579396f..9dc93c5e480b 100644
--- a/drivers/video/backlight/backlight.c
+++ b/drivers/video/backlight/backlight.c
@@ -15,7 +15,6 @@
 #include <linux/notifier.h>
 #include <linux/ctype.h>
 #include <linux/err.h>
-#include <linux/fb.h>
 #include <linux/slab.h>
 
 #ifdef CONFIG_PMAC_BACKLIGHT
@@ -57,10 +56,10 @@
  * a hot-key to adjust backlight, the driver must notify the backlight
  * core that brightness has changed using backlight_force_update().
  *
- * The backlight driver core receives notifications from fbdev and
- * if the event is FB_EVENT_BLANK and if the value of blank, from the
- * FBIOBLANK ioctrl, results in a change in the backlight state the
- * update_status() operation is called.
+ * Display drives can control the backlight device's status using
+ * backlight_notify_blank() and backlight_notify_blank_all(). If this
+ * results in a change in the backlight state the functions call the
+ * update_status() operation.
  */
 
 static struct list_head backlight_dev_list;
@@ -78,11 +77,8 @@ static const char *const backlight_scale_types[] = {
 	[BACKLIGHT_SCALE_NON_LINEAR]	= "non-linear",
 };
 
-#if defined(CONFIG_FB_CORE) || (defined(CONFIG_FB_CORE_MODULE) && \
-				defined(CONFIG_BACKLIGHT_CLASS_DEVICE_MODULE))
-static void backlight_notify_blank(struct backlight_device *bd,
-				   struct device *display_dev,
-				   bool fb_on, bool prev_fb_on)
+void backlight_notify_blank(struct backlight_device *bd, struct device *display_dev,
+			    bool fb_on, bool prev_fb_on)
 {
 	guard(mutex)(&bd->ops_lock);
 
@@ -103,68 +99,18 @@ static void backlight_notify_blank(struct backlight_device *bd,
 		}
 	}
 }
+EXPORT_SYMBOL(backlight_notify_blank);
 
-/*
- * fb_notifier_callback
- *
- * This callback gets called when something important happens inside a
- * framebuffer driver. The backlight core only cares about FB_BLANK_UNBLANK
- * which is reported to the driver using backlight_update_status()
- * as a state change.
- *
- * There may be several fbdev's connected to the backlight device,
- * in which case they are kept track of. A state change is only reported
- * if there is a change in backlight for the specified fbdev.
- */
-static int fb_notifier_callback(struct notifier_block *self,
-				unsigned long event, void *data)
+void backlight_notify_blank_all(struct device *display_dev, bool fb_on, bool prev_fb_on)
 {
 	struct backlight_device *bd;
-	struct fb_event *evdata = data;
-	struct fb_info *info = evdata->info;
-	const int *fb_blank = evdata->data;
-	struct backlight_device *fb_bd = fb_bl_device(info);
-	bool fb_on, prev_fb_on;
-
-	/* If we aren't interested in this event, skip it immediately ... */
-	if (event != FB_EVENT_BLANK)
-		return 0;
-
-	bd = container_of(self, struct backlight_device, fb_notif);
-
-	if (fb_bd && fb_bd != bd)
-		return 0;
-
-	fb_on = fb_blank[0] == FB_BLANK_UNBLANK;
-	prev_fb_on = fb_blank[1] == FB_BLANK_UNBLANK;
-
-	backlight_notify_blank(bd, info->device, fb_on, prev_fb_on);
-
-	return 0;
-}
-
-static int backlight_register_fb(struct backlight_device *bd)
-{
-	memset(&bd->fb_notif, 0, sizeof(bd->fb_notif));
-	bd->fb_notif.notifier_call = fb_notifier_callback;
 
-	return fb_register_client(&bd->fb_notif);
-}
+	guard(mutex)(&backlight_dev_list_mutex);
 
-static void backlight_unregister_fb(struct backlight_device *bd)
-{
-	fb_unregister_client(&bd->fb_notif);
-}
-#else
-static inline int backlight_register_fb(struct backlight_device *bd)
-{
-	return 0;
+	list_for_each_entry(bd, &backlight_dev_list, entry)
+		backlight_notify_blank(bd, display_dev, fb_on, prev_fb_on);
 }
-
-static inline void backlight_unregister_fb(struct backlight_device *bd)
-{
-}
-#endif /* CONFIG_FB_CORE */
+EXPORT_SYMBOL(backlight_notify_blank_all);
 
 static void backlight_generate_event(struct backlight_device *bd,
 				     enum backlight_update_reason reason)
@@ -455,12 +401,6 @@ struct backlight_device *backlight_device_register(const char *name,
 		return ERR_PTR(rc);
 	}
 
-	rc = backlight_register_fb(new_bd);
-	if (rc) {
-		device_unregister(&new_bd->dev);
-		return ERR_PTR(rc);
-	}
-
 	new_bd->ops = ops;
 
 #ifdef CONFIG_PMAC_BACKLIGHT
@@ -547,7 +487,6 @@ void backlight_device_unregister(struct backlight_device *bd)
 	bd->ops = NULL;
 	mutex_unlock(&bd->ops_lock);
 
-	backlight_unregister_fb(bd);
 	device_unregister(&bd->dev);
 }
 EXPORT_SYMBOL(backlight_device_unregister);
diff --git a/drivers/video/fbdev/core/fb_backlight.c b/drivers/video/fbdev/core/fb_backlight.c
index 6fdaa9f81be9..dbed9696f4c5 100644
--- a/drivers/video/fbdev/core/fb_backlight.c
+++ b/drivers/video/fbdev/core/fb_backlight.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 
+#include <linux/backlight.h>
 #include <linux/export.h>
 #include <linux/fb.h>
 #include <linux/mutex.h>
@@ -36,4 +37,15 @@ struct backlight_device *fb_bl_device(struct fb_info *info)
 	return info->bl_dev;
 }
 EXPORT_SYMBOL(fb_bl_device);
+
+void fb_bl_notify_blank(struct fb_info *info, int old_blank)
+{
+	bool on = info->blank == FB_BLANK_UNBLANK;
+	bool prev_on = old_blank == FB_BLANK_UNBLANK;
+
+	if (info->bl_dev)
+		backlight_notify_blank(info->bl_dev, info->device, on, prev_on);
+	else
+		backlight_notify_blank_all(info->device, on, prev_on);
+}
 #endif
diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 997f0bfcdbb6..993fbee602e0 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -363,6 +363,8 @@ int fb_blank(struct fb_info *info, int blank)
 	if (ret)
 		goto err;
 
+	fb_bl_notify_blank(info, old_blank);
+
 	fb_notifier_call_chain(FB_EVENT_BLANK, &event);
 
 	return 0;
diff --git a/include/linux/backlight.h b/include/linux/backlight.h
index 03723a5478f8..7ed99cfd030f 100644
--- a/include/linux/backlight.h
+++ b/include/linux/backlight.h
@@ -12,7 +12,6 @@
 #include <linux/device.h>
 #include <linux/fb.h>
 #include <linux/mutex.h>
-#include <linux/notifier.h>
 #include <linux/types.h>
 
 /**
@@ -278,11 +277,6 @@ struct backlight_device {
 	 */
 	const struct backlight_ops *ops;
 
-	/**
-	 * @fb_notif: The framebuffer notifier block
-	 */
-	struct notifier_block fb_notif;
-
 	/**
 	 * @entry: List entry of all registered backlight devices
 	 */
@@ -400,6 +394,12 @@ struct backlight_device *backlight_device_get_by_type(enum backlight_type type);
 int backlight_device_set_brightness(struct backlight_device *bd,
 				    unsigned long brightness);
 
+void backlight_notify_blank(struct backlight_device *bd,
+			    struct device *display_dev,
+			    bool fb_on, bool prev_fb_on);
+void backlight_notify_blank_all(struct device *display_dev,
+				bool fb_on, bool prev_fb_on);
+
 #define to_backlight_device(obj) container_of(obj, struct backlight_device, dev)
 
 /**
diff --git a/include/linux/fb.h b/include/linux/fb.h
index f41d3334ac23..bebf279c8bc6 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -757,11 +757,15 @@ extern void fb_bl_default_curve(struct fb_info *fb_info, u8 off, u8 min, u8 max)
 
 #if IS_ENABLED(CONFIG_FB_BACKLIGHT)
 struct backlight_device *fb_bl_device(struct fb_info *info);
+void fb_bl_notify_blank(struct fb_info *info, int old_blank);
 #else
 static inline struct backlight_device *fb_bl_device(struct fb_info *info)
 {
 	return NULL;
 }
+
+void fb_bl_notify_blank(struct fb_info *info, int old_blank)
+{ }
 #endif
 
 static inline struct lcd_device *fb_lcd_device(struct fb_info *info)
-- 
2.48.1


