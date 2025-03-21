Return-Path: <linux-leds+bounces-4340-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9D4A6B84B
	for <lists+linux-leds@lfdr.de>; Fri, 21 Mar 2025 10:58:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85261188449D
	for <lists+linux-leds@lfdr.de>; Fri, 21 Mar 2025 09:58:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E9041C5F1B;
	Fri, 21 Mar 2025 09:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WGUSIAAr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2SwPSc91";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WGUSIAAr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2SwPSc91"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8223F1F1319
	for <linux-leds@vger.kernel.org>; Fri, 21 Mar 2025 09:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742551125; cv=none; b=G7yhowit7t234brHhlg5MifG0VmYSAcLWa12zdHlMkYsNOjRV5RYbHX8RPGznpiYI3+BMbNtAEaQPP9kAMJOPqYSjBtMFArcgWsEYUmeDWjMUa/hCqdH7NwIWr/CJCOB5vkNGsIAeYribZYvWy42wKPi60W+Z9WlYJT6hRcZuR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742551125; c=relaxed/simple;
	bh=NXCOVk2LShx9uBLrBse3o++QRvOS1oTctDx4Mc/8xVU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ethq6/jhkJ1noWFeB7eFnpf75NNzDYORcIk9ChfhiGthClK1/bvmjCxvihaiaEJl6uoMVbTLgu5xpS1s9BZ3AVSPkKx/02bxysnRumhQGIsnogL2kyzryyOln8/OvNzWdmiSzFOIiq4/H9gbrvjAAK5mm6FVYO7psbd9OiGCun8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WGUSIAAr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2SwPSc91; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WGUSIAAr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2SwPSc91; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1BC13219C5;
	Fri, 21 Mar 2025 09:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742551114; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IxhBAN538S1RT3uFsmPSfZA6BAUxIA/He31PWK2A/pU=;
	b=WGUSIAArjKpHeh7zXUOx1QxABfQEfUJSUH86yGnUOIhJdGVcubw0lcsw/A9Q73aUFh6p9c
	kxHhh7Caxrjb5Wnb8HXylim7UadbDXfTiqxddNdDnelxo3SyQYGR3BjfyO4ElWdIV0ixrf
	Jj4I+wM9cHd6Jh++YqgJZd+5rxOzRQ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742551114;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IxhBAN538S1RT3uFsmPSfZA6BAUxIA/He31PWK2A/pU=;
	b=2SwPSc91vS5rxY9UYQstzZxEqOimCg+uoM5lihT4guui8F/GNbDItJAoqEl0l1fZRrbJr5
	IoJaXhtTJmYA9KBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=WGUSIAAr;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=2SwPSc91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742551114; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IxhBAN538S1RT3uFsmPSfZA6BAUxIA/He31PWK2A/pU=;
	b=WGUSIAArjKpHeh7zXUOx1QxABfQEfUJSUH86yGnUOIhJdGVcubw0lcsw/A9Q73aUFh6p9c
	kxHhh7Caxrjb5Wnb8HXylim7UadbDXfTiqxddNdDnelxo3SyQYGR3BjfyO4ElWdIV0ixrf
	Jj4I+wM9cHd6Jh++YqgJZd+5rxOzRQ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742551114;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IxhBAN538S1RT3uFsmPSfZA6BAUxIA/He31PWK2A/pU=;
	b=2SwPSc91vS5rxY9UYQstzZxEqOimCg+uoM5lihT4guui8F/GNbDItJAoqEl0l1fZRrbJr5
	IoJaXhtTJmYA9KBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C4EE813A68;
	Fri, 21 Mar 2025 09:58:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iB/eLkk43Wd9JAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 21 Mar 2025 09:58:33 +0000
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
Subject: [PATCH v4 03/11] fbdev: Send old blank state in FB_EVENT_BLANK
Date: Fri, 21 Mar 2025 10:53:56 +0100
Message-ID: <20250321095517.313713-4-tzimmermann@suse.de>
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
X-Rspamd-Queue-Id: 1BC13219C5
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,ucw.cz,gmail.com,gmx.de,ffwll.ch];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim,suse.de:mid];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

The event FB_EVENT_BLANK sends the new blank state in the event's
data field. Also send the old state. It's an additional field in the
data array; existing receivers won't notice the difference.

The backlight subsystem currently tracks blank state per display per
backlight. That is not optimal as it ties backlight code to fbdev. A
subsystem should not track internal state of another subsystem. With
both, new and old, blank state in FB_EVENT_BLANK, the backlight code
will not require its own state tracker any longer.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Simona Vetter <simona.vetter@ffwll.ch>
---
 drivers/video/fbdev/core/fbmem.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 5d1529d300b7..9650b641d8e8 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -343,6 +343,7 @@ int fb_blank(struct fb_info *info, int blank)
 {
 	int old_blank = info->blank;
 	struct fb_event event;
+	int data[2];
 	int ret;
 
 	if (!info->fbops->fb_blank)
@@ -351,8 +352,10 @@ int fb_blank(struct fb_info *info, int blank)
 	if (blank > FB_BLANK_POWERDOWN)
 		blank = FB_BLANK_POWERDOWN;
 
+	data[0] = blank;
+	data[1] = old_blank;
 	event.info = info;
-	event.data = &blank;
+	event.data = data;
 
 	info->blank = blank;
 
-- 
2.48.1


