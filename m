Return-Path: <linux-leds+bounces-4091-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 112E7A45A5B
	for <lists+linux-leds@lfdr.de>; Wed, 26 Feb 2025 10:38:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C00B17415A
	for <lists+linux-leds@lfdr.de>; Wed, 26 Feb 2025 09:38:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBF26226CF7;
	Wed, 26 Feb 2025 09:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="p1/9hGbt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Cp86ISuw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="p1/9hGbt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Cp86ISuw"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4D8226CF9
	for <linux-leds@vger.kernel.org>; Wed, 26 Feb 2025 09:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740562693; cv=none; b=MvvJ5Rnf+9jzNfTF5vGH8tJ/cnIVxOcVlPKO9s6F0RgWzcs8JyyTklEInWM8vLiYjMnPP89YRHmsn+pe1R12rZ6mK4ATognqT4qTQRrCtlrmG99W5Y3o5U7Koaq3CqUgTqNCLIhSzgkuA1LvjlC0pdVpfVXkFPJu6w4j+SNrtzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740562693; c=relaxed/simple;
	bh=bCyCvFUNgazUsYzoBDQvZpXsp+PgXdjcwIYP/Sh5gFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=okD2ApY4TMGUey9T7OZV4z/1Qx8ttbC+ISz+UvrfgGSJRURr2xtkUl3Lwwi8Wt2QeAfVU3yXcL1EKQR49Wp60Es5zjQ1FTLMMfg/hJIt9GHM22adFe8QOV2j5f6RfF4MxzmzKLEiFzBbsEEqmcCkKmCfWT36vXtpZFOmkcEAjr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=p1/9hGbt; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Cp86ISuw; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=p1/9hGbt; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Cp86ISuw; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5DFF51F6E6;
	Wed, 26 Feb 2025 09:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1740562666; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zgDvqUdwLhdUvH7pT0MEgdzzLVp6J0w2nBCTIPIypCA=;
	b=p1/9hGbtHIiRWai4PXo+6o7qlm3p3f+/BQBpRdgt/Ty8JPVkFZuTJKW1PPCWGdapNSbG/i
	QrmAls/Y3Fb4dC21FJMSGkc0Ndm4lSHV4YLt2W8kzyr+kCRxWzlLHvXhu4ORJ+dma3qCIu
	mJhYaO1JFqrUoBcEzWSMZ97lMpNdPaY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1740562666;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zgDvqUdwLhdUvH7pT0MEgdzzLVp6J0w2nBCTIPIypCA=;
	b=Cp86ISuw/syArh3s3KhWxl6YiU4VdTCHvINhBs9DKguxFaCbu2GLUMHk36IZxYLhf2DFwk
	UVVL10jeo5mgrXCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1740562666; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zgDvqUdwLhdUvH7pT0MEgdzzLVp6J0w2nBCTIPIypCA=;
	b=p1/9hGbtHIiRWai4PXo+6o7qlm3p3f+/BQBpRdgt/Ty8JPVkFZuTJKW1PPCWGdapNSbG/i
	QrmAls/Y3Fb4dC21FJMSGkc0Ndm4lSHV4YLt2W8kzyr+kCRxWzlLHvXhu4ORJ+dma3qCIu
	mJhYaO1JFqrUoBcEzWSMZ97lMpNdPaY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1740562666;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zgDvqUdwLhdUvH7pT0MEgdzzLVp6J0w2nBCTIPIypCA=;
	b=Cp86ISuw/syArh3s3KhWxl6YiU4VdTCHvINhBs9DKguxFaCbu2GLUMHk36IZxYLhf2DFwk
	UVVL10jeo5mgrXCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 177D813A53;
	Wed, 26 Feb 2025 09:37:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iGBtBOrgvmezXQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Wed, 26 Feb 2025 09:37:46 +0000
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
Subject: [PATCH v2 04/11] backlight: Implement fbdev tracking with blank state from event
Date: Wed, 26 Feb 2025 10:31:53 +0100
Message-ID: <20250226093456.147402-5-tzimmermann@suse.de>
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
	NEURAL_HAM_SHORT(-0.20)[-0.993];
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


