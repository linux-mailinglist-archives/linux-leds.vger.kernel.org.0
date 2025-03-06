Return-Path: <linux-leds+bounces-4163-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1624AA54D3F
	for <lists+linux-leds@lfdr.de>; Thu,  6 Mar 2025 15:14:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 89EE3174061
	for <lists+linux-leds@lfdr.de>; Thu,  6 Mar 2025 14:13:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FE2814F9C4;
	Thu,  6 Mar 2025 14:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WfArmqXL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RzuCEZF6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EicSSCmw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WXBSIavq"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA4416130C
	for <linux-leds@vger.kernel.org>; Thu,  6 Mar 2025 14:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741270395; cv=none; b=YBf+I2MRaPnuiYJ6WVE8fEpVDAFl6dm4USTh94bLvITQlSOBHGqSTcVDVL/5Euan139dkUB1HO5W7vVvENwoduMRBJf4P8dCvqHZtTwhr1co4Nky7gg4zhKYB34QvPxLIERhZhm3dQG2h3MiAqw+J5w2FUy/kRBFRiu6RULLX5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741270395; c=relaxed/simple;
	bh=bNK5J6k2U2thEKx262eoKdy7ndV8qc8cdT7Obv8RsBE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WLNMDaFRgVGScGEkYtISjgLSn8lVllf+zqyLY1iAErkruLmc/lcF2vUwTmvPpRQgfbHkoePw27IlGAZhoBExyn1xbsXVwW1kS3h0IkWQYugS8fB+IppichTmls4VVVKyqn01kAWE+Xyz9GuxeG0V6LDWQX+2dbcNIm/7ia7eRD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WfArmqXL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RzuCEZF6; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EicSSCmw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WXBSIavq; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 887DD1F45E;
	Thu,  6 Mar 2025 14:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741270390; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=9iImtIJVQ2vQCwmVHx7rSwwOm8Ymo0bN7pYHn8SbPOQ=;
	b=WfArmqXLI/WjuQKWjLSR+N4SZeQmXxA6VCP3RDX3iicnCET0a/zX+6WQgaJnDgXQ8e2drV
	jKzqgIsNrUshJQmnQnmaz/D+NjxoDQaGRJvCSQC6tFGrbc6eR5Ynu9+sfFL8H4UqgSulgO
	g8BPsFBSOPOFdg7HwPwKNkdsNxnDmlU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741270390;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=9iImtIJVQ2vQCwmVHx7rSwwOm8Ymo0bN7pYHn8SbPOQ=;
	b=RzuCEZF6RB112EN/gq5fdMI1XXbFrru2wYbd0qOhg5SkkXNc/gUsPrftQWmnVMcOp8ICxl
	f7f49eb3sQyY0BBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741270389; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=9iImtIJVQ2vQCwmVHx7rSwwOm8Ymo0bN7pYHn8SbPOQ=;
	b=EicSSCmw6pO3/zsvmouAdSOrvWpRqLfFkCz1UFP6rFxLlLiyldjypWnnZyIE5gmbceHpYx
	dvOjwx2c6+PhsRZObjjh7vPyV+AYvx71NHJXWwYjAEqArozDEhwAY/xFey+et5SQ0DDIhy
	dOiJb01pcatOqFaAk0V6ENeeCL5dR2Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741270389;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=9iImtIJVQ2vQCwmVHx7rSwwOm8Ymo0bN7pYHn8SbPOQ=;
	b=WXBSIavqRsO0rBEpTmkRZ4NpIKM/Xrqjz0tTyBd/AyJYOkzkt5k/drgTnUc4n91XgjDlpP
	5sjqsBSHNqddaYBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3F35213676;
	Thu,  6 Mar 2025 14:13:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id vfMcDnWtyWeveQAAD6G6ig
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
Subject: [PATCH v3 00/11] backlight, lcd, led: Remove fbdev dependencies
Date: Thu,  6 Mar 2025 15:05:42 +0100
Message-ID: <20250306140947.580324-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid];
	FREEMAIL_TO(0.00)[kernel.org,ucw.cz,gmail.com,gmx.de,ffwll.ch];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[10];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
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
 include/linux/backlight.h                |  22 ++---
 include/linux/fb.h                       |  12 +--
 include/linux/lcd.h                      |  21 ++++-
 include/linux/leds.h                     |   6 ++
 11 files changed, 205 insertions(+), 208 deletions(-)

-- 
2.48.1


