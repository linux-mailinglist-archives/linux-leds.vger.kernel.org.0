Return-Path: <linux-leds+bounces-4344-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E983A6B863
	for <lists+linux-leds@lfdr.de>; Fri, 21 Mar 2025 11:00:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8B5F3B230A
	for <lists+linux-leds@lfdr.de>; Fri, 21 Mar 2025 09:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BB741F151A;
	Fri, 21 Mar 2025 09:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eZ+mxGfU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="v2sbXtNa";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eZ+mxGfU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="v2sbXtNa"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42031F1517
	for <linux-leds@vger.kernel.org>; Fri, 21 Mar 2025 09:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742551137; cv=none; b=PabccximlgLWEA9p9jujtHj226x+EIpynLnn4ldMrjr9z1Zq+ERH+1X9M1invI4PkPoAFqu5AFFH+5dUqeEFXUFQSqIU31MiEVlvYrheccdhheSQjT+bWzrzUNIck2xgJxlyWTEb7IPhcqNOXC3DUX3/tnntbwDo3zLks7YgJCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742551137; c=relaxed/simple;
	bh=1UZT9w5fxpfVYZnLnBrIsRP5ppF4DIq90z27cbDDtu4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I0j3QVHvH5E1i4465U2p3hF4h0Xks8E/kVKCY0bspj94oLyPAU//R0QX1wBaS0SBRoNzwT62eNqGlrqEUqo5tfzOKqr0dOC9QccKVFCCyaTtV1jABm0IuMcvt3E0P+AwEtcS5yUdI3GIcER3oIfjeSffDPSWdm0aKDg4SmK9g18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eZ+mxGfU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=v2sbXtNa; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eZ+mxGfU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=v2sbXtNa; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C5ECC21A43;
	Fri, 21 Mar 2025 09:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742551116; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d50oW/Sd93WRzzeGOWxeD1YVHgh4ve2AiEZqei8Bj6c=;
	b=eZ+mxGfUKhJNvAwIiNAYBrQ8SrJrhQ49dmPbIKJP9eGQ+D6KLE9KbYVGAjoevCbo9IsoeZ
	74A8ZP3lX7cxb9n9ckyB6GS6iJORlZh8FtL745FSrSCMml26iwD7bM1Uma+Mu/h1lIJ/KX
	2AgODMtNTLtoU8foznjKN3WzE5b6tNo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742551116;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d50oW/Sd93WRzzeGOWxeD1YVHgh4ve2AiEZqei8Bj6c=;
	b=v2sbXtNaMB6DI808seay3if1FSyo1eGbgs9q3ZSIL6BJrsRr3qMDNIbzGbhmx222dk03jx
	OO63fRex5iiLn7Bw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=eZ+mxGfU;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=v2sbXtNa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742551116; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d50oW/Sd93WRzzeGOWxeD1YVHgh4ve2AiEZqei8Bj6c=;
	b=eZ+mxGfUKhJNvAwIiNAYBrQ8SrJrhQ49dmPbIKJP9eGQ+D6KLE9KbYVGAjoevCbo9IsoeZ
	74A8ZP3lX7cxb9n9ckyB6GS6iJORlZh8FtL745FSrSCMml26iwD7bM1Uma+Mu/h1lIJ/KX
	2AgODMtNTLtoU8foznjKN3WzE5b6tNo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742551116;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d50oW/Sd93WRzzeGOWxeD1YVHgh4ve2AiEZqei8Bj6c=;
	b=v2sbXtNaMB6DI808seay3if1FSyo1eGbgs9q3ZSIL6BJrsRr3qMDNIbzGbhmx222dk03jx
	OO63fRex5iiLn7Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7A3B713A68;
	Fri, 21 Mar 2025 09:58:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CN2jHEw43Wd9JAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 21 Mar 2025 09:58:36 +0000
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
Subject: [PATCH v4 11/11] fbdev: Remove constants of unused events
Date: Fri, 21 Mar 2025 10:54:04 +0100
Message-ID: <20250321095517.313713-12-tzimmermann@suse.de>
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
X-Rspamd-Queue-Id: C5ECC21A43
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	R_RATELIMIT(0.00)[to_ip_from(RLa7dkhshwamq1oe933z1pzp6m)];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

The constants FB_EVENT_MODE_CHANGE and FB_EVENT_BLANK are unused.
Remove them from the header file.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Simona Vetter <simona.vetter@ffwll.ch>
---
 include/linux/fb.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/include/linux/fb.h b/include/linux/fb.h
index d45bd220cb8f..2497321e30bb 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -129,18 +129,12 @@ struct fb_cursor_user {
  * Register/unregister for framebuffer events
  */
 
-/*	The resolution of the passed in fb_info about to change */
-#define FB_EVENT_MODE_CHANGE		0x01
-
 #ifdef CONFIG_GUMSTIX_AM200EPD
 /* only used by mach-pxa/am200epd.c */
 #define FB_EVENT_FB_REGISTERED          0x05
 #define FB_EVENT_FB_UNREGISTERED        0x06
 #endif
 
-/*      A display blank is requested       */
-#define FB_EVENT_BLANK                  0x09
-
 struct fb_event {
 	struct fb_info *info;
 	void *data;
-- 
2.48.1


