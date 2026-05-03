Return-Path: <linux-leds+bounces-7945-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILECMcL49mkyawIAu9opvQ
	(envelope-from <linux-leds+bounces-7945-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 03 May 2026 09:26:58 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 323114B4AE7
	for <lists+linux-leds@lfdr.de>; Sun, 03 May 2026 09:26:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E67563007CAC
	for <lists+linux-leds@lfdr.de>; Sun,  3 May 2026 07:26:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CA2F36E473;
	Sun,  3 May 2026 07:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QOvl7mDy"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E812E11D2
	for <linux-leds@vger.kernel.org>; Sun,  3 May 2026 07:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777793215; cv=none; b=s5XVC7smeBL+ZjYHp0i5Cg8FUS4lIQRxHgka3a4vnZ8vlqSMU46vEQAFg6eH20A5BTe9UBlYgXL8TC7inmVnXXr34LBXVb1+9RTi5TALvC2G5j7UBuH8dC0E1KCpDrMbUsc4AVE7d0ZaCGqWgE6HkUV7A5UIXLyHbwHF70I3M34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777793215; c=relaxed/simple;
	bh=UpoJXL13k7fWNX5kvg8RKcGJAk6mYEmoxDqLy7+7nKs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IQVeIoZGTey0H4fp0s089L1FIoKNQeiwxnXMjorVpV2++k3cJrxk93NLmMhe+anS2k2VrGOrVHfwthQo+K/G0UVOIi1u6zcSTE8PT587C8eBdQ6OFlaZcd0Xb26mCy0PWPfqNTjkP33uzpXSR4rBbXycCmrB+1aHVOs63VxWbBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QOvl7mDy; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-356337f058aso1970538a91.2
        for <linux-leds@vger.kernel.org>; Sun, 03 May 2026 00:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777793213; x=1778398013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/YtxFZp0eNrtQnNfc9ZwPYsuCM0PoH8dZHMhxhkiOR4=;
        b=QOvl7mDy2P3IKQKvaQrbYBWZB+qljo4Q/PMTUbkJbpQtoLOQUHCCmS+yuWItS0SjtH
         50j4wb6386TfWwAiHEfLq1J99PkW+Pfw1tF65o93EzFibHYoS/KOCy6UlJplJymhZI/G
         C3mfGVSrmzl5t3f+KZCPsHxcUs72UZN6CnshWUkQXKErUknHuCQkqN/Re1ALzFYCOba7
         SF8bP2KvEt1pO659F1InnASGXQ6fswquzaeinStBW9jsMmdMhR70xCR6J2eVamoEZ5bs
         Opl9ltgeMeVzq7laG04d/JWwKhlNen9WnbthjUyuelegLVwIEgMjaObouD9xnMnNlqPI
         En4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777793213; x=1778398013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/YtxFZp0eNrtQnNfc9ZwPYsuCM0PoH8dZHMhxhkiOR4=;
        b=FVOvgsVE4i9dpjsbdtRg0vtCAhB9Mf8AcBQIgcl6E0drzjmL2XOTSEQUYHRmOU3uG9
         46SDZTUip1hohzR0VslG2SYQWpIg1edRRJQk4OXeH2MKnQQzSVSjgX8O1/H//OdqRkhI
         S0h85VXfXnF9WD9y6XGEI5Fo6Eh89DoAyOoVXDXqJ/TnfsSI7TAHhNR3OOMW3HoXmhlg
         w48rMbpXVYevJGQCaNWWfKQ7yK+25FawP60ABBofnl6TZTGDAErBWzAZO5MYnp/1ht+/
         F3fWuuxXsuQhoxKU99iPANKkJjsW6qxh0mFSE6bRAiFvRljDVY25WDbaQnBub7reIcaG
         s5ng==
X-Forwarded-Encrypted: i=1; AFNElJ/ppm4j6m6eysnP+usISgLe9GFEYT9YWvHaoLYj2eTKIjpNku7MmEkin4l0LCrisFJUAPNqwXS+hZFC@vger.kernel.org
X-Gm-Message-State: AOJu0YyxCaBrfxu6SoNtKQJyXIyZ0TJlk3HXLyVqEYnxd1BC0r436Sau
	cgZeoQKp9J8H7vgjvjmZgJNRtGTNoKIqVWf7eumShyznBfRBIYFHj3xI
X-Gm-Gg: AeBDievGthMzDI3ov19QbVfoEo8YgWsk9GorXqtcjsnCypkukpWcfyLNGZHlS86hdo/
	WRjOJmj8rJdA8yM08EEQ0QGLsOXZZLCZFeRi8fFoXbPD+naA3ouMpzGSfDYPRomdqYC/Arn66Dw
	wLdOjSZYFy5MK358UVmclkv9fUsy6axITfdvskm4ZEP7F/hzrfJb8jOaa3f8fAQPq89epTa5DHy
	DI07MADoyfO9oga0++qfbc8oZ0O+CRVeSrA/rWtOIuLvFWmyCoyQSlNB7/CYd5DHm2FV7z2Zbpg
	QiJsAX06z4uPLAc+xigdtuUzXcQHxR8Q/8wAyqMjwo3uIwMVXavYRK5hYMwo9/YDw+ECVMr2efe
	G2sdFafqg2N9BIzoDyfiA21X2SxWNHmR1cXJRk0HGSIvgEljnkK0Nm6G5/7HcucEaC1pCB3D/wR
	ApRevyWmeQDVDb4L+OhfFOCxbJXYRegKkIB6UW0jHYwuxT6CiAP27aSlqGo3AaPCoo1n292AoxL
	L+F8ArA
X-Received: by 2002:a17:903:1d1:b0:2b9:fb9a:1103 with SMTP id d9443c01a7336-2b9fb9a1206mr40015365ad.38.1777793213276;
        Sun, 03 May 2026 00:26:53 -0700 (PDT)
Received: from tranquility.wa.lan (60-241-74-71.static.tpgi.com.au. [60.241.74.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae16a9esm64942945ad.50.2026.05.03.00.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 00:26:52 -0700 (PDT)
From: James Ye <jye836@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org,
	lee@kernel.org,
	pavel@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	denis.benato@linux.dev,
	James Ye <jye836@gmail.com>
Subject: [PATCH 0/6] HID: asus: add support for T3304 keyboard
Date: Sun,  3 May 2026 17:26:37 +1000
Message-ID: <20260503072643.2774762-1-jye836@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 323114B4AE7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.dev,gmail.com];
	TAGGED_FROM(0.00)[bounces-7945-lists,linux-leds=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jye836@gmail.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-leds];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

This series adds support for the ASUS Vivobook Slate 13 OLED (T3304)
detachable keyboard. The keyboard is a USB device presenting two
interfaces: keyboard and touchpad. Basic functionality already works
with hid-generic and hid-multitouch, but Fn key chords including media
keys and LEDs do not work.

To add support, bind the keyboard interface to hid-asus. However, the
ASUS-specific report descriptors are on the touchpad interface, so fixup
the descriptor so that hid-asus knows about them. Media keys are also
sent via the touchpad interface, so add MT_CLS_ASUS to this device in
hid-multitouch.

Also included is a fix for a use-after-free in hid-input.c discovered
during development, but technically unrelated to the device.
("HID: input: delete hid_battery on disconnect")

James Ye (6):
  HID: input: delete hid_battery on disconnect
  HID: asus: check feature reports when determining is_vendor
  HID: asus: add support for T3304 detachable keyboard
  HID: multitouch: add support for ASUS T3304 media keys
  HID: asus: add microphone mute LED support for T3304
  leds: led-class: mark classdev as unregistering early

 drivers/hid/hid-asus.c       | 117 ++++++++++++++++++++++++++++++++---
 drivers/hid/hid-ids.h        |   1 +
 drivers/hid/hid-input.c      |   5 ++
 drivers/hid/hid-multitouch.c |  10 +++
 drivers/leds/led-class.c     |   4 +-
 5 files changed, 126 insertions(+), 11 deletions(-)

--
2.54.0

