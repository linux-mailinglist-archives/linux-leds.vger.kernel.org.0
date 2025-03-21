Return-Path: <linux-leds+bounces-4342-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3A9A6B861
	for <lists+linux-leds@lfdr.de>; Fri, 21 Mar 2025 11:00:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A1A13B1302
	for <lists+linux-leds@lfdr.de>; Fri, 21 Mar 2025 09:58:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 236A01C5F1B;
	Fri, 21 Mar 2025 09:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LbRZoeNb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eCSjgv8n";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LbRZoeNb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eCSjgv8n"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925611F193C
	for <linux-leds@vger.kernel.org>; Fri, 21 Mar 2025 09:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742551131; cv=none; b=A8cKEW9ha99ju8CvDIUL2jaSIodbeDRbuKrQbruGZpycUKQ9q5j628rWAmbvKVu/DQKXZ611ZDYwPEnlaSeMH24UxwAr545v6cXO5Hug1RIJEREOIB4oL+u/kKJTD5MwqkVylZUTkwl0Jx7+e1bboY6W2k0DoPpVidXZaEIwWl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742551131; c=relaxed/simple;
	bh=Rg5FWiw55Ucb/raIGa6Y6BmLyph+ggUlgb+OEaSlJc8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k/Dum7SAbI04ZeQnHjwRrH/WlKsgJWvpiqKSV3QEFZ6tCdubjPwt/TkEGIj+bUnP2ExDuYrSgE3n/a/zlMGefnin7eHa8ftAV0sTCgEmud59mlPUGOX4q/+3MepXxx58gyXh3kPjlVKRtvkKErYT6UimvbIURqIMz+CIFp3uX10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LbRZoeNb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eCSjgv8n; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LbRZoeNb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eCSjgv8n; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1FCC7219E8;
	Fri, 21 Mar 2025 09:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742551116; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wz+vrSe8fpCt2AfOLbFiky0SQ9suqdgLe7OUZIJ/sdg=;
	b=LbRZoeNbWxWrUmPGEvop5zh0pOXWDWiGZJdTVgk7U4oFwry0LmunWlq7lrCUg7mWECI11K
	ps/ziubWV0R8js49sWvi9feKeZvUzLpm7AF/bUfJgENQWXIpeoPOLRnUETsLEUoYsY5+6k
	zbPIFiGSThjeFvSAifzZ1L/XOY1c5rA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742551116;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wz+vrSe8fpCt2AfOLbFiky0SQ9suqdgLe7OUZIJ/sdg=;
	b=eCSjgv8nmcfj7HjCr7ZCAEslpuuntFtgUJHpzOsOo+HRayjxO2rsPd8c/+ACqs2bGMXJ7a
	kImz87+COvR320Cg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742551116; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wz+vrSe8fpCt2AfOLbFiky0SQ9suqdgLe7OUZIJ/sdg=;
	b=LbRZoeNbWxWrUmPGEvop5zh0pOXWDWiGZJdTVgk7U4oFwry0LmunWlq7lrCUg7mWECI11K
	ps/ziubWV0R8js49sWvi9feKeZvUzLpm7AF/bUfJgENQWXIpeoPOLRnUETsLEUoYsY5+6k
	zbPIFiGSThjeFvSAifzZ1L/XOY1c5rA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742551116;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wz+vrSe8fpCt2AfOLbFiky0SQ9suqdgLe7OUZIJ/sdg=;
	b=eCSjgv8nmcfj7HjCr7ZCAEslpuuntFtgUJHpzOsOo+HRayjxO2rsPd8c/+ACqs2bGMXJ7a
	kImz87+COvR320Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C7C1D13A68;
	Fri, 21 Mar 2025 09:58:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iEF/L0s43Wd9JAAAD6G6ig
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
Subject: [PATCH v4 09/11] leds: backlight trigger: Move blank-state handling into helper
Date: Fri, 21 Mar 2025 10:54:02 +0100
Message-ID: <20250321095517.313713-10-tzimmermann@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
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

Move the handling of blank-state updates into a separate helper,
so that is can be called without the fbdev event. No functional
changes.

v2:
- rename helper to avoid renaming in a later patch (Lee)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Simona Vetter <simona.vetter@ffwll.ch>
---
 drivers/leds/trigger/ledtrig-backlight.c | 30 ++++++++++++++----------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-backlight.c b/drivers/leds/trigger/ledtrig-backlight.c
index 487577d22cfc..8e66d55a6c82 100644
--- a/drivers/leds/trigger/ledtrig-backlight.c
+++ b/drivers/leds/trigger/ledtrig-backlight.c
@@ -25,12 +25,28 @@ struct bl_trig_notifier {
 	unsigned invert;
 };
 
+static void ledtrig_backlight_notify_blank(struct bl_trig_notifier *n, int new_status)
+{
+	struct led_classdev *led = n->led;
+
+	if (new_status == n->old_status)
+		return;
+
+	if ((n->old_status == UNBLANK) ^ n->invert) {
+		n->brightness = led->brightness;
+		led_set_brightness_nosleep(led, LED_OFF);
+	} else {
+		led_set_brightness_nosleep(led, n->brightness);
+	}
+
+	n->old_status = new_status;
+}
+
 static int fb_notifier_callback(struct notifier_block *p,
 				unsigned long event, void *data)
 {
 	struct bl_trig_notifier *n = container_of(p,
 					struct bl_trig_notifier, notifier);
-	struct led_classdev *led = n->led;
 	struct fb_event *fb_event = data;
 	int *blank;
 	int new_status;
@@ -42,17 +58,7 @@ static int fb_notifier_callback(struct notifier_block *p,
 	blank = fb_event->data;
 	new_status = *blank ? BLANK : UNBLANK;
 
-	if (new_status == n->old_status)
-		return 0;
-
-	if ((n->old_status == UNBLANK) ^ n->invert) {
-		n->brightness = led->brightness;
-		led_set_brightness_nosleep(led, LED_OFF);
-	} else {
-		led_set_brightness_nosleep(led, n->brightness);
-	}
-
-	n->old_status = new_status;
+	ledtrig_backlight_notify_blank(n, new_status);
 
 	return 0;
 }
-- 
2.48.1


