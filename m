Return-Path: <linux-leds+bounces-4341-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1A7A6B860
	for <lists+linux-leds@lfdr.de>; Fri, 21 Mar 2025 11:00:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF6BB3B06C9
	for <lists+linux-leds@lfdr.de>; Fri, 21 Mar 2025 09:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9038D1F1315;
	Fri, 21 Mar 2025 09:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="h/ZyskQp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MRt1+2aC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="h/ZyskQp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MRt1+2aC"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62421F1319
	for <linux-leds@vger.kernel.org>; Fri, 21 Mar 2025 09:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742551128; cv=none; b=JdIzYDYcSA+1IR+Z0xu6+x7ZJvP9BboP82tITKGFb9p8tEA+8j6H4OcfLmesSI2a5U4c6woWmmjDO1uN1Rd88oIo2PCjcko6b/Rf7PajMpOSQrWzvsm5j+pPlfOEzofy2HbZI+O0WnrN4Kn9p8WXaLND9amfgmcHo4ngELgbOM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742551128; c=relaxed/simple;
	bh=VCdx2GuwRI58W1Jg6qMixS6EbHhh6MKYf8PAEtN+5Ec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Klf7h0G8efRZzC3jzMOKPxs6IcPiLVsOqcIy+VLXMvRQxuWNP/86Cs9WXXGmJm8azBHQIxj0fPGcreelO3dZ24Q0jqCVlzl81eqwQI8ymUsEgKFRa+u8ZSctppyRpvJynqOOFE62ErEXMS7UKUtWthp1xXIOGfpi9IB3EkEuZBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=h/ZyskQp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MRt1+2aC; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=h/ZyskQp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MRt1+2aC; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6D2CD1F843;
	Fri, 21 Mar 2025 09:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742551114; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RI1b1gVnDviwlL5IKxsoR7jbteGLDT/r6OxA67nB660=;
	b=h/ZyskQpHAZWlECEGzrdZht9QrKSrYTMFSocUYb1bDKp5/pqzPqsXIh9E7VnRKD3lnoH5f
	qaRsGagJNvcM1VGplSG91xYa1OytoenDM0S+7vBjJy4FzpA5+wOhmNgMd7w00cMCCmK+XK
	Gcywd6ts7XAxSaXJlla9MZw38wzv5nw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742551114;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RI1b1gVnDviwlL5IKxsoR7jbteGLDT/r6OxA67nB660=;
	b=MRt1+2aCPByNmEdF8tE9YGFzXcAzHvFcSOKMFmWo2mvXfUvflXDr2T2DRVUbNPGfzN/fjD
	1rhqV4X/ET7i/WAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742551114; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RI1b1gVnDviwlL5IKxsoR7jbteGLDT/r6OxA67nB660=;
	b=h/ZyskQpHAZWlECEGzrdZht9QrKSrYTMFSocUYb1bDKp5/pqzPqsXIh9E7VnRKD3lnoH5f
	qaRsGagJNvcM1VGplSG91xYa1OytoenDM0S+7vBjJy4FzpA5+wOhmNgMd7w00cMCCmK+XK
	Gcywd6ts7XAxSaXJlla9MZw38wzv5nw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742551114;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RI1b1gVnDviwlL5IKxsoR7jbteGLDT/r6OxA67nB660=;
	b=MRt1+2aCPByNmEdF8tE9YGFzXcAzHvFcSOKMFmWo2mvXfUvflXDr2T2DRVUbNPGfzN/fjD
	1rhqV4X/ET7i/WAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 22B23139AA;
	Fri, 21 Mar 2025 09:58:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OM49B0o43Wd9JAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 21 Mar 2025 09:58:34 +0000
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
Subject: [PATCH v4 04/11] backlight: Implement fbdev tracking with blank state from event
Date: Fri, 21 Mar 2025 10:53:57 +0100
Message-ID: <20250321095517.313713-5-tzimmermann@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
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

Look at the blank state provided by FB_EVENT_BLANK to determine
whether to enable or disable a backlight. Remove the tracking fields
from struct backlight_device.

Tracking requires three variables, fb_on, prev_fb_on and the
backlight's use_count. If fb_on is true, the display has been
unblanked. The backlight needs to be enabled if the display was
blanked before (i.e., prev_fb_on is false) or if use_count is still
at 0. If fb_on is false, the display has been blanked. In this case,
the backlight has to be disabled was unblanked before and the
backlight's use_count is greater than 0.

This change removes fbdev state tracking from blacklight. All the
backlight requires it its own use counter and information about
changes to the display. Removing fbdev internals makes  backlight
drivers easier to integrate into other display drivers, such as DRM.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>
Acked-by: Simona Vetter <simona.vetter@ffwll.ch>
---
 drivers/video/backlight/backlight.c | 14 +++++++-------
 include/linux/backlight.h           | 10 +---------
 2 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
index f699e5827ccb..bb01f57c4683 100644
--- a/drivers/video/backlight/backlight.c
+++ b/drivers/video/backlight/backlight.c
@@ -98,9 +98,9 @@ static int fb_notifier_callback(struct notifier_block *self,
 	struct backlight_device *bd;
 	struct fb_event *evdata = data;
 	struct fb_info *info = evdata->info;
+	const int *fb_blank = evdata->data;
 	struct backlight_device *fb_bd = fb_bl_device(info);
-	int node = info->node;
-	int fb_blank = 0;
+	bool fb_on, prev_fb_on;
 
 	/* If we aren't interested in this event, skip it immediately ... */
 	if (event != FB_EVENT_BLANK)
@@ -116,15 +116,15 @@ static int fb_notifier_callback(struct notifier_block *self,
 	if (fb_bd && fb_bd != bd)
 		goto out;
 
-	fb_blank = *(int *)evdata->data;
-	if (fb_blank == FB_BLANK_UNBLANK && !bd->fb_bl_on[node]) {
-		bd->fb_bl_on[node] = true;
+	fb_on = fb_blank[0] == FB_BLANK_UNBLANK;
+	prev_fb_on = fb_blank[1] == FB_BLANK_UNBLANK;
+
+	if (fb_on && (!prev_fb_on || !bd->use_count)) {
 		if (!bd->use_count++) {
 			bd->props.state &= ~BL_CORE_FBBLANK;
 			backlight_update_status(bd);
 		}
-	} else if (fb_blank != FB_BLANK_UNBLANK && bd->fb_bl_on[node]) {
-		bd->fb_bl_on[node] = false;
+	} else if (!fb_on && prev_fb_on && bd->use_count) {
 		if (!(--bd->use_count)) {
 			bd->props.state |= BL_CORE_FBBLANK;
 			backlight_update_status(bd);
diff --git a/include/linux/backlight.h b/include/linux/backlight.h
index f5652e5a9060..03723a5478f8 100644
--- a/include/linux/backlight.h
+++ b/include/linux/backlight.h
@@ -294,15 +294,7 @@ struct backlight_device {
 	struct device dev;
 
 	/**
-	 * @fb_bl_on: The state of individual fbdev's.
-	 *
-	 * Multiple fbdev's may share one backlight device. The fb_bl_on
-	 * records the state of the individual fbdev.
-	 */
-	bool fb_bl_on[FB_MAX];
-
-	/**
-	 * @use_count: The number of uses of fb_bl_on.
+	 * @use_count: The number of unblanked displays.
 	 */
 	int use_count;
 };
-- 
2.48.1


