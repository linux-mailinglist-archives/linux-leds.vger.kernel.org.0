Return-Path: <linux-leds+bounces-4162-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AE591A54D3E
	for <lists+linux-leds@lfdr.de>; Thu,  6 Mar 2025 15:14:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 37E45173320
	for <lists+linux-leds@lfdr.de>; Thu,  6 Mar 2025 14:13:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4794E1509BD;
	Thu,  6 Mar 2025 14:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="012yxRWX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ml+APova"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A03156231
	for <linux-leds@vger.kernel.org>; Thu,  6 Mar 2025 14:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741270395; cv=none; b=YqXB1LtGsj3by+DZCkNFXU2lyOhc4duFaGTmfnL8btA5CImkdC4CX7jgNT0CEvsbf1z5RqRKIWYDtA6uGC1iFfJOGq0ad1tC6bDqnVjfIqgHmlQRmU9+28bbsBbRxedcrMPaw9Mpoj+yjQD6xRLYy1fQOZrLEcQzO987nieXbpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741270395; c=relaxed/simple;
	bh=MK3deRCClPKJMwnY3MZxzmHu0zeIe1KWhrUJmiP1gWY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kpemCbUulMJKohPmrZ4yfWabtGaHJf1e4Ppxe8x3jsRzv2c8No9ZXuTb9zMbxtuvlSyqEwyAgeZh02ituQm5m9lBk5zJwsILOX8ZU+KwDRcxc0pJszcTVf2yibM7Fk3kpDVt29VvHNBA1/+vaXGUZ576ZHpBw2MHzM8/atEJ71M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=012yxRWX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ml+APova; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DB345211BF;
	Thu,  6 Mar 2025 14:13:09 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741270389; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ufj3f9HBl6Twcr7GMVSkl75ka6GAyq+kyVovQlCEnZk=;
	b=012yxRWXGeypHJ/56nEXQOdiGple0CkYlG2r+5ceVtmIu+4YXXrfeuW2FluwcX0k2YTHHb
	YkmGoM6KIh0T8NSJr1VrsJp0iVZ8Fg2ODrGjNQ0iumxHRBLa+xsoCled35/O7XgBUXTo+6
	HXe+m+GxNHXkSF9rdO+oSI8shElQ2sk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741270389;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ufj3f9HBl6Twcr7GMVSkl75ka6GAyq+kyVovQlCEnZk=;
	b=ml+APovaZLygVpNWk36TsZbmwB+snqkPQePqnh4nyTS71Zw42bbxEYrPRrh5IrlMuGsikD
	W+djwCtdtw2tnBCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8E19413A91;
	Thu,  6 Mar 2025 14:13:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UH9pIXWtyWeveQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 06 Mar 2025 14:13:09 +0000
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
Subject: [PATCH v3 01/11] fbdev: Rework fb_blank()
Date: Thu,  6 Mar 2025 15:05:43 +0100
Message-ID: <20250306140947.580324-2-tzimmermann@suse.de>
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
X-Rspamd-Queue-Id: DB345211BF
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 

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


