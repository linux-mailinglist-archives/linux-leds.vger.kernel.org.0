Return-Path: <linux-leds+bounces-4087-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B272A45A4B
	for <lists+linux-leds@lfdr.de>; Wed, 26 Feb 2025 10:38:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E5BC3A7D24
	for <lists+linux-leds@lfdr.de>; Wed, 26 Feb 2025 09:38:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68CA9238152;
	Wed, 26 Feb 2025 09:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="127FUb5x";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ip5jV7SB";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="127FUb5x";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ip5jV7SB"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C43226D1D
	for <linux-leds@vger.kernel.org>; Wed, 26 Feb 2025 09:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740562680; cv=none; b=j1TcsAheihQmHA/1FJzj+Y/5mk+X+LSjYS57o8uCSaCxUAvYPCQpOz4iD7flVa+HlK/L4P8dNjqCc/agZ8edtWyGsA3z4PfygoKhetJYlrqQc1Pq71sjDZ6WX4weBiKY8MTJIgncyB/KgrlsZHktSO898FZXpqQgCOwy5ctd2nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740562680; c=relaxed/simple;
	bh=MK3deRCClPKJMwnY3MZxzmHu0zeIe1KWhrUJmiP1gWY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KU3igunXGxSrkCIwCQsr0obP7iLEwbEO6OTm3zh2yy2DAYPrBXvHJizT2xFsFWONRRfEAC4EuvAGHssX0pnPcC/brnmF450YZjoV87aPblK2To6Y18iEJifgc0p0cKebaK6yEbP9GCvM5QkyuhexKtGOlsix0x7auLdhoo/zNxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=127FUb5x; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ip5jV7SB; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=127FUb5x; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ip5jV7SB; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 688F51F45E;
	Wed, 26 Feb 2025 09:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1740562665; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ufj3f9HBl6Twcr7GMVSkl75ka6GAyq+kyVovQlCEnZk=;
	b=127FUb5x+p0NZXXVN55NZZ9HDmycOF/vMFMgsAUYPIE0/yiiw73JfS1+Z5LhSaEeYpnH3c
	O5AuHDOA9ciJ7ux+SHl/2Di6PxiH5aris9gUTNG3e/gjNjor17Qy2vVsmFkTy53Y2XZTbE
	kZEvin2XAlAYg4FEvTy0GI2qhCjwHkI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1740562665;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ufj3f9HBl6Twcr7GMVSkl75ka6GAyq+kyVovQlCEnZk=;
	b=Ip5jV7SBtm4fVji8NWX07LHekHLu72ljhlzZ7DYHFBJLN229MXmQvqul96KXZ6qNNDLCbS
	0YXXbdapdf7yhlBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1740562665; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ufj3f9HBl6Twcr7GMVSkl75ka6GAyq+kyVovQlCEnZk=;
	b=127FUb5x+p0NZXXVN55NZZ9HDmycOF/vMFMgsAUYPIE0/yiiw73JfS1+Z5LhSaEeYpnH3c
	O5AuHDOA9ciJ7ux+SHl/2Di6PxiH5aris9gUTNG3e/gjNjor17Qy2vVsmFkTy53Y2XZTbE
	kZEvin2XAlAYg4FEvTy0GI2qhCjwHkI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1740562665;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ufj3f9HBl6Twcr7GMVSkl75ka6GAyq+kyVovQlCEnZk=;
	b=Ip5jV7SBtm4fVji8NWX07LHekHLu72ljhlzZ7DYHFBJLN229MXmQvqul96KXZ6qNNDLCbS
	0YXXbdapdf7yhlBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2112413A82;
	Wed, 26 Feb 2025 09:37:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wMnEBungvmezXQAAD6G6ig
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
Subject: [PATCH v2 01/11] fbdev: Rework fb_blank()
Date: Wed, 26 Feb 2025 10:31:50 +0100
Message-ID: <20250226093456.147402-2-tzimmermann@suse.de>
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
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[kernel.org,ucw.cz,gmail.com,gmx.de,ffwll.ch];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Spam-Score: -6.80
X-Spam-Flag: NO

Reimplement fb_blank() to return early on errors. No functional
changes. Prepares the helper for tracking the blanking state in
struct fb_info.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/core/fbmem.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 3c568cff2913..39e2b81473ad 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -339,11 +339,13 @@ fb_set_var(struct fb_info *info, struct fb_var_screeninfo *var)
 }
 EXPORT_SYMBOL(fb_set_var);
 
-int
-fb_blank(struct fb_info *info, int blank)
+int fb_blank(struct fb_info *info, int blank)
 {
 	struct fb_event event;
-	int ret = -EINVAL;
+	int ret;
+
+	if (!info->fbops->fb_blank)
+		return -EINVAL;
 
 	if (blank > FB_BLANK_POWERDOWN)
 		blank = FB_BLANK_POWERDOWN;
@@ -351,13 +353,13 @@ fb_blank(struct fb_info *info, int blank)
 	event.info = info;
 	event.data = &blank;
 
-	if (info->fbops->fb_blank)
-		ret = info->fbops->fb_blank(blank, info);
+	ret = info->fbops->fb_blank(blank, info);
+	if (ret)
+		return ret;
 
-	if (!ret)
-		fb_notifier_call_chain(FB_EVENT_BLANK, &event);
+	fb_notifier_call_chain(FB_EVENT_BLANK, &event);
 
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL(fb_blank);
 
-- 
2.48.1


