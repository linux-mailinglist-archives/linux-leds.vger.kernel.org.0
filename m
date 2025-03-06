Return-Path: <linux-leds+bounces-4167-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 55051A54D42
	for <lists+linux-leds@lfdr.de>; Thu,  6 Mar 2025 15:14:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D604175A1F
	for <lists+linux-leds@lfdr.de>; Thu,  6 Mar 2025 14:13:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B18E1519A5;
	Thu,  6 Mar 2025 14:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="doAnn8cW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4vsKVJgd"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EE1151990
	for <linux-leds@vger.kernel.org>; Thu,  6 Mar 2025 14:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741270408; cv=none; b=XCo3uTJAYXCVXjgLMsc0pLfE0+1K1vvydms+8ch8EQx+AkroJHAF3pi4LldSsSij3aheUfkH+OHC0rk/3nU8ywg+R+iDkM64PRztRR7BXLYlFapFUkdcmscMMdVB/dSZ8rfwpaIEKPNXed43jpptTxaT2iEYU5oJZBwLrrAiAMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741270408; c=relaxed/simple;
	bh=bCyCvFUNgazUsYzoBDQvZpXsp+PgXdjcwIYP/Sh5gFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OHO4t0jonmysfmv7d+dEbkwVRI2iwsikn5yobOuAAUkdtLZ572ktRT29niv8kHp2ug+RgXToF+KhfwrMznN0CjMVuXZlB52lvkPoVYlXYc3F5Q4fsf9Sy9kLVl7Q+BYmI7BV8N4bcH5smHXc6Jsc1kyCBesR106TwXQH4RfFeaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=doAnn8cW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4vsKVJgd; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CCF7A211C6;
	Thu,  6 Mar 2025 14:13:10 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741270390; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zgDvqUdwLhdUvH7pT0MEgdzzLVp6J0w2nBCTIPIypCA=;
	b=doAnn8cWSrpE3bOYPtqZTB9TCveFrMaJ8Lmkx50sszqbyx0GJ8wIngZ2D9+0XyC+C8XT6J
	+kCbPIxLJ327aWiQQigAqy41P+t/1q/xAknT4x2AGNncScW/w8Cg/Inx0E0zG4ifLwNvzf
	S2qIEvophAw/C2edJlbdBPCJCQI6kOU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741270390;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zgDvqUdwLhdUvH7pT0MEgdzzLVp6J0w2nBCTIPIypCA=;
	b=4vsKVJgdw0ZCvw63HJjlYQ8g0AJhPDcJvKMF9ilPdwF9MltVKKnbuBXXzA6eUJqmK3iR8T
	cFQwRO+ZbreKQYDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 828D213AC9;
	Thu,  6 Mar 2025 14:13:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8PKUHnatyWeveQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 06 Mar 2025 14:13:10 +0000
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
Subject: [PATCH v3 04/11] backlight: Implement fbdev tracking with blank state from event
Date: Thu,  6 Mar 2025 15:05:46 +0100
Message-ID: <20250306140947.580324-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306140947.580324-1-tzimmermann@suse.de>
References: <20250306140947.580324-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: CCF7A211C6
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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


