Return-Path: <linux-leds+bounces-7860-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CAVnLLMA8GnYNAEAu9opvQ
	(envelope-from <linux-leds+bounces-7860-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 02:34:59 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C53647C276
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 02:34:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 385F33022914
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 00:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 987BD2264B0;
	Tue, 28 Apr 2026 00:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EmxLK7DS"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35301E8320
	for <linux-leds@vger.kernel.org>; Tue, 28 Apr 2026 00:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777336490; cv=none; b=l49lcJOtvFkCm0eEHedT+kR7aYCHLDyV4TDsv6agS2lYfqd2hlSxRYwC3jJQss53nsW1fsJWpNaUlxysbOB95xkPqyb+728nL2HoaGWiTPrxqKnAl+QDH7PfSRWWFGSRRCNLgH+n4wijIntNFm4ZxY8yCyiyb4Vsuv3k6B/SYqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777336490; c=relaxed/simple;
	bh=Km22mwMXYXlDRybVxMfI3OhoMB8ev9WSoq/jpg4uxys=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QiilViP+Ght7R4jqYbZFT8bD+4qLPr7Vje3LiYcoz8TyfHWRmD1tmh+uqg55wCQkNshst6+TQWvCryg24EvgT090YSMrKSQbZ7UJFcs4tLP3+ngZTIEla01wyXSv8RR6ZlSGLxuVKLZB9rqkBp00maVmQ/QFlnx/pWpLUZhf7fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EmxLK7DS; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-12dcdcd54adso411701c88.1
        for <linux-leds@vger.kernel.org>; Mon, 27 Apr 2026 17:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777336488; x=1777941288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=khvD6LA49QvJDWglizbk1eKiZMgbOeJmUSdTokzGJAw=;
        b=EmxLK7DSXzUJp2p2eDhDQe8QCl7jjum9EW1JZsPclsmiMgbFQOHuJTSClcW57v5KJ/
         MENEUq0fLIrqPCMHuYTxpJKWhGex+M9KWy9HBUjj5TzYQbDLINUnOPRb4VnwdjaoHiwR
         kfDigiNdbO5U2/lQpMI+zAI/JQknTVW4jAPp08PosdehI/yQsLS1OT6mIpZSclPp/+31
         UdRLwsVncx3GAVyjsC5Vz4J5ZK7GGesja5N42td9zK0ladKRNNUhWakeeEP/7RScoVJY
         cdfS0Uq8Bx0XgYFOO4Ehek6E3atd0B5pDIwUF/JWM1KB0l9/pLyHkuKzpfmsKVNrjsei
         56vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777336488; x=1777941288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=khvD6LA49QvJDWglizbk1eKiZMgbOeJmUSdTokzGJAw=;
        b=ebHI7Rn+8GuHthiV4zTdV1uq9NdhIR3w4lzPj3cH+kwQIZ5JJh4EYYvnUycEuxtg5C
         jPaESjvQG9DRfEkv6PeOOGkmQBUA2mhU6XuQu8IDW68uohSJAAVmUROWI/hdnbujWZAC
         fdqJNpq453NmIXWof0YCHXhlzK0JGbq6hw2ms9FZM5n669nv+/0liqe8aDZVy7m3Hddx
         HBxzN6LArO3zVhpSeJHMyMLOwHKvemlGmn9ytLp7RFmqCn7GuktDpAT07PGMjKFEixqu
         wBYGrrdi6SP4Ai43q3m0E9plTYUfel0p5PtqhQUqxBrIqGhs3XuAISZGwzmDBFdU91jm
         ieqQ==
X-Forwarded-Encrypted: i=1; AFNElJ9zCtorHrqZMci32l2mVk1lUBzL11q5hqnOUCfguwQzPVFTyURjJsR85xSbCuspUWm4kn+qNB8UfDZO@vger.kernel.org
X-Gm-Message-State: AOJu0YxJoH/VsA93nV/aZYJhEittGPdlt60UT726eHk9TM8RBT+14Y7j
	vbvyl+Xm5NtnGiF9kmLlLxGC2fkulU/OPhwT4KY0NUW4I9RiRiSHcx1R
X-Gm-Gg: AeBDiesw/KHosJPdkN+seHlcOEY4cPEPl6NN6i/vOejZg5vLkGrAR7c+4tjYHzeREkZ
	mu87WgwL1wjs861vOMXCHgHH6ZTwti1PSIreu/nefRIViNxk7amJ33gHDiLE6WINGyNdXEIs1x9
	Qyd17Y7mgA4u5HPZwNASvfI1tGMoanp1X5lxwSEIR4mtoysOIp9WSlRjp6L0eNTIPKMBKZ/b2eB
	3VR4xM4f+ixq18XCy2poAy/MoTw6vNAVxhlULW6FjgFTpu3kLgV5OG8FoTljeBt4mRn0VZs+EuD
	l5oVKDvjw9Hgi6ipjewtwAkiznVukKH4iMs8VeHIu2LGFruBAJynyLAUUlLXN2UQHV2EJoEcwtJ
	T3o35i0uHSaZO7I2O8ODM+SNuqNAsP8hcZnVfkPKyFQzL3f4KwjHj+zgG/bCc7H700OPjItRR4h
	cEcJ7NHMR8YziqVxZoRMxe+7/v6yyEAIc=
X-Received: by 2002:a05:701b:2415:b0:12d:de3e:86ac with SMTP id a92af1059eb24-12dde3e88camr62174c88.42.1777336487616;
        Mon, 27 Apr 2026 17:34:47 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a59:55d1::1002])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ddd927bbbsm957144c88.2.2026.04.27.17.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 17:34:46 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org
Cc: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	luccafachinetti@gmail.com,
	pzalewski@thegoodpenguin.co.uk,
	daniel@zonque.org,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH v1 RESEND 0/5] leds: Add shutdown gpio for is31fl32xx
Date: Tue, 28 Apr 2026 08:34:07 +0800
Message-ID: <20260428003412.322032-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1C53647C276
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,thegoodpenguin.co.uk,zonque.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-7860-lists,linux-leds=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[jerrysteve1101@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[controller.it:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

This patch series primarily adds the shutdown-gpios support
for the IS31FL32xx controller.It also includes a fix and
dt-bindings updates derived from previous attempts [1].

Patch 1 and patch 2 are based on a previous attempt [1].
The driver-related updates in patch 2 have already been merged.

Patch 3 and Patch 4 add support for the shutdown-gpios property,
which corresponds to the SDB pin of the IS31FL32xx series chips.
This pin is used to enter and exit the hardware shutdown mode.

Patch 5 fixes errors introduced by previous changes. It impacts
the brightness control function of the IS31FL3236.

[1] https://lore.kernel.org/linux-leds/20250723-leds-is31fl3236a-v6-0-210328058625@thegoodpenguin.co.uk/

Jun Yan (5):
  dt-bindings: leds: is31fl32xx: convert the binding to yaml
  dt-bindings: leds: leds-is31fl32xx: add support for is31fl3236a
  dt-bindings: leds: leds-is31fl32xx: Add shutdown-gpios property
  leds: is31fl32xx: Add shutdown pin to exit hardware shutdown mode
  leds: is31f132xx: Fix missing brightness_steps for is31f13236

 .../bindings/leds/issl,is31fl32xx.yaml        | 200 ++++++++++++++++++
 .../bindings/leds/leds-is31fl32xx.txt         |  53 -----
 drivers/leds/leds-is31fl32xx.c                |   7 +
 3 files changed, 207 insertions(+), 53 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt

-- 
2.53.0


