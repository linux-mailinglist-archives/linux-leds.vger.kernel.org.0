Return-Path: <linux-leds+bounces-4090-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A90A45A59
	for <lists+linux-leds@lfdr.de>; Wed, 26 Feb 2025 10:38:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 730167A7A50
	for <lists+linux-leds@lfdr.de>; Wed, 26 Feb 2025 09:37:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87A5A238170;
	Wed, 26 Feb 2025 09:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2FoeceZN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eW7PvPHu";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2FoeceZN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eW7PvPHu"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3530238179
	for <linux-leds@vger.kernel.org>; Wed, 26 Feb 2025 09:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740562688; cv=none; b=GpHk+9dr8hvdkJFEk0sM62Fyhgn3FRs1ZoZv13/nrcnKfzRRimHDCHtRJYuut7GsKvp0tdCEG4kxULkhIwmOS5SUUwx+76g6V5O6DzCjzjLCrG4FxbF5X2kwHbumiykQkh9+Yxqcas7cZHvdG2kzQnUeJoL7k1O1o56wASDZM9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740562688; c=relaxed/simple;
	bh=IsAu7JdKBnglMwM2CePvGx1UPXBBwWznIbT4Ckx6N7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DpdDyA+98TUF5ZJbcMQt+eG72Wxyy0KELG0rw4d9u1TBsOqxToUSkuuO59tjyzkSJ7nPMDfoVRXMSRa2T66MaChuvPPm0m2b1FCpn1cjkSAtLHl7FQQTDjrofzZAi248ptN2FYrOTZt9jcDGOI8NrGTDq2aeP7R2k4UxGVtlRWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2FoeceZN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eW7PvPHu; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2FoeceZN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eW7PvPHu; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 921402119C;
	Wed, 26 Feb 2025 09:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1740562668; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PFr8H+hCTUTRF1jOy94qiEOja/muVDhbuvTUu0DRKIA=;
	b=2FoeceZN/1smE7rS61qAGw5nDOqeX0HJ3+m2aAiMANHmYeCGCk7+XMwc6rXvp+Wp/DLGVR
	91mNt1+TzKm1E97ONaYdHyZNbTOdM+GWKljiP/YeDzsdvRiDT0QBRLIaAFKj8flUPlrBTn
	LRiISxHhFwEnTf7CxrugVLZCEJtFyjY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1740562668;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PFr8H+hCTUTRF1jOy94qiEOja/muVDhbuvTUu0DRKIA=;
	b=eW7PvPHuZ09E3PmIHRjog/16cdTevbr6x/Ho+LMHcziwMqWMyiR5zG2J22gp0FPG8YgNXw
	jwshVqSwJ32Q7vDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1740562668; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PFr8H+hCTUTRF1jOy94qiEOja/muVDhbuvTUu0DRKIA=;
	b=2FoeceZN/1smE7rS61qAGw5nDOqeX0HJ3+m2aAiMANHmYeCGCk7+XMwc6rXvp+Wp/DLGVR
	91mNt1+TzKm1E97ONaYdHyZNbTOdM+GWKljiP/YeDzsdvRiDT0QBRLIaAFKj8flUPlrBTn
	LRiISxHhFwEnTf7CxrugVLZCEJtFyjY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1740562668;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PFr8H+hCTUTRF1jOy94qiEOja/muVDhbuvTUu0DRKIA=;
	b=eW7PvPHuZ09E3PmIHRjog/16cdTevbr6x/Ho+LMHcziwMqWMyiR5zG2J22gp0FPG8YgNXw
	jwshVqSwJ32Q7vDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4B8E813A82;
	Wed, 26 Feb 2025 09:37:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aOglEezgvmezXQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Wed, 26 Feb 2025 09:37:48 +0000
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
Subject: [PATCH v2 11/11] fbdev: Remove constants of unused events
Date: Wed, 26 Feb 2025 10:32:00 +0100
Message-ID: <20250226093456.147402-12-tzimmermann@suse.de>
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
X-Spam-Score: -6.80
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.995];
	MIME_GOOD(-0.10)[text/plain];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
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
X-Spam-Flag: NO
X-Spam-Level: 

The constants FB_EVENT_MODE_CHANGE and FB_EVENT_BLANK are unused.
Remove them from the header file.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 include/linux/fb.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/include/linux/fb.h b/include/linux/fb.h
index bebf279c8bc6..c272c0fc074d 100644
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


