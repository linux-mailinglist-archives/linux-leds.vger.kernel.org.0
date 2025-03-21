Return-Path: <linux-leds+bounces-4337-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C12A6B842
	for <lists+linux-leds@lfdr.de>; Fri, 21 Mar 2025 10:58:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81CA6188C47F
	for <lists+linux-leds@lfdr.de>; Fri, 21 Mar 2025 09:58:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD28D1F1517;
	Fri, 21 Mar 2025 09:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YCadtz7w";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PhcCY13N";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YCadtz7w";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PhcCY13N"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0305A1C5F1B
	for <linux-leds@vger.kernel.org>; Fri, 21 Mar 2025 09:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742551116; cv=none; b=Uum9181SttPQJ7ftQuksC0FmtiWx9Ju09B8ONBaXBB8h0JgRESb2vMWaeCmVIe9y0/5uWHfSrfGD3r84H4I0yVjHS4CmBvlQfMLBZBy5FjZbRZSP/RB+8+rR3tAY3cU7S3zRX/YUQ52562KkldB0b3fjb5TdfbdHzX84So2HLqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742551116; c=relaxed/simple;
	bh=sYTYQsOmYh01xRHlrfqUYbqXMbd4O69Ds2kZQPY3+2U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GUrN5QTZ+2iYEChJ0HStfPcYT4pH/DlTtFxBzvMpWHJ2i3l9qU+QtUbsHIGQ/OjjZj2wDqBHzBoR37M5k8o5xu3ru6r2QBZf4Gev6WZii1BmNrlod2YUTuwwqWfuCyCTrgJWB4mlmytNhigFoDnP2+r+gn4xb7AQvMLjLvR22oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YCadtz7w; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PhcCY13N; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YCadtz7w; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PhcCY13N; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1CA6A1FB61;
	Fri, 21 Mar 2025 09:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742551113; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=uCXBG/+T2WXWSYNFzDGd2Rzeco35M4yA69VIAwbOdMg=;
	b=YCadtz7wnAgiYrSGOKPoELOqS82RMQBMuATWBcO2vvt+3JY3SksQuNdgkgVxD/9ZHu2RM4
	3xgg93CUfjnjre0pi64I6X9yoq6ZSNY+Azc2paXqklDwlRXgqnlGC3s8NrqqWKGED4eyAI
	eRNJu3JvPaZaCbyWS/Vn9OiTbZ2DoXQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742551113;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=uCXBG/+T2WXWSYNFzDGd2Rzeco35M4yA69VIAwbOdMg=;
	b=PhcCY13NEdFVBsT0EI0mX6gxCiWd/e1GFZ1nZlfE/lvWzex9r8GN3Zrevo+T9AUqqkyyyx
	20lZ57Df4iA3FqBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=YCadtz7w;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=PhcCY13N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742551113; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=uCXBG/+T2WXWSYNFzDGd2Rzeco35M4yA69VIAwbOdMg=;
	b=YCadtz7wnAgiYrSGOKPoELOqS82RMQBMuATWBcO2vvt+3JY3SksQuNdgkgVxD/9ZHu2RM4
	3xgg93CUfjnjre0pi64I6X9yoq6ZSNY+Azc2paXqklDwlRXgqnlGC3s8NrqqWKGED4eyAI
	eRNJu3JvPaZaCbyWS/Vn9OiTbZ2DoXQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742551113;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=uCXBG/+T2WXWSYNFzDGd2Rzeco35M4yA69VIAwbOdMg=;
	b=PhcCY13NEdFVBsT0EI0mX6gxCiWd/e1GFZ1nZlfE/lvWzex9r8GN3Zrevo+T9AUqqkyyyx
	20lZ57Df4iA3FqBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C67F0139AA;
	Fri, 21 Mar 2025 09:58:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mKEeL0g43Wd9JAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 21 Mar 2025 09:58:32 +0000
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
Subject: [PATCH v4 00/11] backlight, lcd, led: Remove fbdev dependencies
Date: Fri, 21 Mar 2025 10:53:53 +0100
Message-ID: <20250321095517.313713-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1CA6A1FB61
X-Spam-Score: -3.01
X-Rspamd-Action: no action
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

This series removes the remaining dependencies on fbdev from the
backlight, lcd and led subsystems. Each depends on fbdev events to
track display state. Make fbdev inform each subsystem via a dedicated
interface instead.

Patches 1 to 3 make fbdev track blank state for each display, so that
backlight code doesn't have to.

Patches 4 to 6 remove fbdev event handling from backlight code. Patches
7 and 8 remove fbdev event handling from lcd code and patches 9 and 10
do the same for led's backlight trigger.

The final patch removes the event constants from fbdev.

With the series applied, the three subsystems do no longer depend on
fbdev. It's also a clean up for fbdev. Fbdev used to send out a large
number of events. That mechanism has been deprecated for some time and
converted call to dedicated functions instead.

Testing is very welcome, as I don't have the hardware to test this
series.

v4:
- protect backlight declarations with IS_REACHABLE()
v3:
- export several symbols
- static-inline declare empty placeholders
v2:
- avoid IS_REACHABLE() in source file (Lee)
- simplify several interfaces and helpers
- use lock guards
- initialize global lists and mutices

Thomas Zimmermann (11):
  fbdev: Rework fb_blank()
  fbdev: Track display blanking state
  fbdev: Send old blank state in FB_EVENT_BLANK
  backlight: Implement fbdev tracking with blank state from event
  backlight: Move blank-state handling into helper
  backlight: Replace fb events with a dedicated function call
  backlight: lcd: Move event handling into helpers
  backlight: lcd: Replace fb events with a dedicated function call
  leds: backlight trigger: Move blank-state handling into helper
  leds: backlight trigger: Replace fb events with a dedicated function
    call
  fbdev: Remove constants of unused events

 drivers/leds/trigger/ledtrig-backlight.c |  48 +++++-----
 drivers/video/backlight/backlight.c      |  93 +++++--------------
 drivers/video/backlight/lcd.c            | 108 +++++++++--------------
 drivers/video/fbdev/core/fb_backlight.c  |  12 +++
 drivers/video/fbdev/core/fb_info.c       |   1 +
 drivers/video/fbdev/core/fbmem.c         |  82 ++++++++++++++---
 drivers/video/fbdev/core/fbsysfs.c       |   8 +-
 include/linux/backlight.h                |  32 +++----
 include/linux/fb.h                       |  12 +--
 include/linux/lcd.h                      |  21 ++++-
 include/linux/leds.h                     |   6 ++
 11 files changed, 215 insertions(+), 208 deletions(-)

-- 
2.48.1


