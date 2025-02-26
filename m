Return-Path: <linux-leds+bounces-4085-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C22A45A50
	for <lists+linux-leds@lfdr.de>; Wed, 26 Feb 2025 10:38:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85B8817575A
	for <lists+linux-leds@lfdr.de>; Wed, 26 Feb 2025 09:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FE10238140;
	Wed, 26 Feb 2025 09:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qQxxKPbX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="isDEeJiH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qQxxKPbX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="isDEeJiH"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928D9238143
	for <linux-leds@vger.kernel.org>; Wed, 26 Feb 2025 09:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740562674; cv=none; b=sj04ed5qWrze84lLa6RAR3PNJQa7o1GIDMQIQachd6NTR2dFQBB0bi2lK2k/ybOQcu1fg7wW8QQN1lmKqXE6RFzDdzChhcEc6kJWsxVl09Wmt2bXAqA8l9nKTf603tN5tRbxytYI/YWdjhgqOaLHkhSdDiCgiQcb09rdc3gXbrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740562674; c=relaxed/simple;
	bh=GLx8R6bdm9G4WAMb4Jhs13b2q4oyj7hhHWffR+TC1s4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gzHML24PrTDaRkb50d5zYfQWUqTPQYpxnPWDWeKAH0r16Hkq3aDj/8cvhwEs2GqTdqU657TFwBvRKBtI4HBi8kM/pucKTDR2UUvo9OHrnke0dCj5T+J2S1Itt70gqKSXu5Vn9v8EKSAx7du70FQainuHboGNFg5vHt4ogL5ObYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qQxxKPbX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=isDEeJiH; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qQxxKPbX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=isDEeJiH; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1DB041F388;
	Wed, 26 Feb 2025 09:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1740562665; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=gkSqYOM3VoLV9+IkWYMhqBbtj73nYmqh9dAI7/8y5d4=;
	b=qQxxKPbXB7K2cissEKf9NS11JKRzaByhTPR0FJX2No6aF5leWuwYxw5Keg1/MjKxUfvYD7
	YmgzX2tp6Va6WoaTBCTX5IejO2v84b6zkn9p5FzWFp7eJlGGP6jA5QqbvBRseORduR5FSm
	v25NBOIRCSJc6bZo8Tc2NLsP19ox6bE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1740562665;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=gkSqYOM3VoLV9+IkWYMhqBbtj73nYmqh9dAI7/8y5d4=;
	b=isDEeJiHpP1q2WOTdsV/p1ZNLStUNlctEVDLuRyGS4WZz6LWDgSBDcdR0wviIJ6j6DGyvB
	XXFZ8I5fcrSOErBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1740562665; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=gkSqYOM3VoLV9+IkWYMhqBbtj73nYmqh9dAI7/8y5d4=;
	b=qQxxKPbXB7K2cissEKf9NS11JKRzaByhTPR0FJX2No6aF5leWuwYxw5Keg1/MjKxUfvYD7
	YmgzX2tp6Va6WoaTBCTX5IejO2v84b6zkn9p5FzWFp7eJlGGP6jA5QqbvBRseORduR5FSm
	v25NBOIRCSJc6bZo8Tc2NLsP19ox6bE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1740562665;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=gkSqYOM3VoLV9+IkWYMhqBbtj73nYmqh9dAI7/8y5d4=;
	b=isDEeJiHpP1q2WOTdsV/p1ZNLStUNlctEVDLuRyGS4WZz6LWDgSBDcdR0wviIJ6j6DGyvB
	XXFZ8I5fcrSOErBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C5E9413A53;
	Wed, 26 Feb 2025 09:37:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mDNRLujgvmezXQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Wed, 26 Feb 2025 09:37:44 +0000
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
Subject: [PATCH v2 00/11] backlight, lcd, led: Remove fbdev dependencies
Date: Wed, 26 Feb 2025 10:31:49 +0100
Message-ID: <20250226093456.147402-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
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
	NEURAL_HAM_SHORT(-0.20)[-0.994];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[kernel.org,ucw.cz,gmail.com,gmx.de,ffwll.ch];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Spam-Score: -2.80
X-Spam-Flag: NO

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

 drivers/leds/trigger/ledtrig-backlight.c |  47 +++++-----
 drivers/video/backlight/backlight.c      |  93 +++++---------------
 drivers/video/backlight/lcd.c            | 107 +++++++++--------------
 drivers/video/fbdev/core/fb_backlight.c  |  12 +++
 drivers/video/fbdev/core/fb_info.c       |   1 +
 drivers/video/fbdev/core/fbmem.c         |  82 ++++++++++++++---
 drivers/video/fbdev/core/fbsysfs.c       |   8 +-
 include/linux/backlight.h                |  22 ++---
 include/linux/fb.h                       |  12 +--
 include/linux/lcd.h                      |  21 ++++-
 include/linux/leds.h                     |   6 ++
 11 files changed, 203 insertions(+), 208 deletions(-)

-- 
2.48.1


