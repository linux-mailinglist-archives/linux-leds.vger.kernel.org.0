Return-Path: <linux-leds+bounces-4166-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9ACA54D39
	for <lists+linux-leds@lfdr.de>; Thu,  6 Mar 2025 15:14:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2C591898DE3
	for <lists+linux-leds@lfdr.de>; Thu,  6 Mar 2025 14:13:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF946153803;
	Thu,  6 Mar 2025 14:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uxShRukY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TXec5Z0/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uxShRukY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TXec5Z0/"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124D81547F3
	for <linux-leds@vger.kernel.org>; Thu,  6 Mar 2025 14:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741270407; cv=none; b=dT4hYqU6/84xYtdZdue3z+4PuXY8l7nQKuoAkKYwJ5zQJVLzBwO+WkWSVih8lt6mvoK4R3nTqZOUPndJEPtHLCKiQWJ5i9dFTh913bgpuopXAluZxk4ynvWzyfqZHM6mySFvhkavTPHV0dWxjIZyMeaOuKb41QNMSqVdzJDXHjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741270407; c=relaxed/simple;
	bh=QljiSUtK8abn9whBbmA9UmhLSOhLC1dTcUiCTuzlOZI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pb/5XJdQAwW4rHysBXpgsLg2j/pwCzewZ8zBEyf33VYbfGo+kr/Z26zCinN2LjGwkML28nz2K4os3RY9WquekP0g4CFtm9XHRK48U2SStfpZ6+nSaib9TDDsmfBVefrhu+uJbBZhHbEUqj/mErVD2lsF1p0ckUlFjj/0oifV5Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uxShRukY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TXec5Z0/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uxShRukY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TXec5Z0/; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1FB131F747;
	Thu,  6 Mar 2025 14:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741270391; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=twebQLH7CscrhVkTIRmXA+Ze1EMhM2I3mLNZ2UYvzSw=;
	b=uxShRukYWsx9i+673TJnJJicH8FSedMKqxaaki+OHZX3oqdyBFHWcfj8lavEAGxakYkiiQ
	537IYZWPz8eBRL1OxGd9TV5/albA2/GOU3qQih1llUo4Ph+f24Zs9qleoAE1m3in0gtWad
	hXrVYn70LIp2Z1jAqAeIMjJslT3lW2M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741270391;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=twebQLH7CscrhVkTIRmXA+Ze1EMhM2I3mLNZ2UYvzSw=;
	b=TXec5Z0/K2qc/wrO/T3vYxvShbtP5Yqv6Hz6fiH+VCwj1i4ggDdfQSM3pev+9WEuWq0cwT
	sPxrHV2TIOE4CDAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741270391; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=twebQLH7CscrhVkTIRmXA+Ze1EMhM2I3mLNZ2UYvzSw=;
	b=uxShRukYWsx9i+673TJnJJicH8FSedMKqxaaki+OHZX3oqdyBFHWcfj8lavEAGxakYkiiQ
	537IYZWPz8eBRL1OxGd9TV5/albA2/GOU3qQih1llUo4Ph+f24Zs9qleoAE1m3in0gtWad
	hXrVYn70LIp2Z1jAqAeIMjJslT3lW2M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741270391;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=twebQLH7CscrhVkTIRmXA+Ze1EMhM2I3mLNZ2UYvzSw=;
	b=TXec5Z0/K2qc/wrO/T3vYxvShbtP5Yqv6Hz6fiH+VCwj1i4ggDdfQSM3pev+9WEuWq0cwT
	sPxrHV2TIOE4CDAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CF69213ACE;
	Thu,  6 Mar 2025 14:13:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QHJYMXatyWeveQAAD6G6ig
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
Subject: [PATCH v3 05/11] backlight: Move blank-state handling into helper
Date: Thu,  6 Mar 2025 15:05:47 +0100
Message-ID: <20250306140947.580324-6-tzimmermann@suse.de>
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
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
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

Move the handling of blank-state updates into a separate helper,
so that is can be called without the fbdev event. No functional
changes.

As a minor improvement over the original code, the update replaces
manual locking with a guard.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/backlight/backlight.c | 46 +++++++++++++++++------------
 1 file changed, 27 insertions(+), 19 deletions(-)

diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
index bb01f57c4683..1c43f579396f 100644
--- a/drivers/video/backlight/backlight.c
+++ b/drivers/video/backlight/backlight.c
@@ -80,6 +80,30 @@ static const char *const backlight_scale_types[] = {
 
 #if defined(CONFIG_FB_CORE) || (defined(CONFIG_FB_CORE_MODULE) && \
 				defined(CONFIG_BACKLIGHT_CLASS_DEVICE_MODULE))
+static void backlight_notify_blank(struct backlight_device *bd,
+				   struct device *display_dev,
+				   bool fb_on, bool prev_fb_on)
+{
+	guard(mutex)(&bd->ops_lock);
+
+	if (!bd->ops)
+		return;
+	if (bd->ops->controls_device && !bd->ops->controls_device(bd, display_dev))
+		return;
+
+	if (fb_on && (!prev_fb_on || !bd->use_count)) {
+		if (!bd->use_count++) {
+			bd->props.state &= ~BL_CORE_FBBLANK;
+			backlight_update_status(bd);
+		}
+	} else if (!fb_on && prev_fb_on && bd->use_count) {
+		if (!(--bd->use_count)) {
+			bd->props.state |= BL_CORE_FBBLANK;
+			backlight_update_status(bd);
+		}
+	}
+}
+
 /*
  * fb_notifier_callback
  *
@@ -107,31 +131,15 @@ static int fb_notifier_callback(struct notifier_block *self,
 		return 0;
 
 	bd = container_of(self, struct backlight_device, fb_notif);
-	mutex_lock(&bd->ops_lock);
 
-	if (!bd->ops)
-		goto out;
-	if (bd->ops->controls_device && !bd->ops->controls_device(bd, info->device))
-		goto out;
 	if (fb_bd && fb_bd != bd)
-		goto out;
+		return 0;
 
 	fb_on = fb_blank[0] == FB_BLANK_UNBLANK;
 	prev_fb_on = fb_blank[1] == FB_BLANK_UNBLANK;
 
-	if (fb_on && (!prev_fb_on || !bd->use_count)) {
-		if (!bd->use_count++) {
-			bd->props.state &= ~BL_CORE_FBBLANK;
-			backlight_update_status(bd);
-		}
-	} else if (!fb_on && prev_fb_on && bd->use_count) {
-		if (!(--bd->use_count)) {
-			bd->props.state |= BL_CORE_FBBLANK;
-			backlight_update_status(bd);
-		}
-	}
-out:
-	mutex_unlock(&bd->ops_lock);
+	backlight_notify_blank(bd, info->device, fb_on, prev_fb_on);
+
 	return 0;
 }
 
-- 
2.48.1


