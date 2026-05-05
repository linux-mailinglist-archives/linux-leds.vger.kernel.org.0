Return-Path: <linux-leds+bounces-8001-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ADPbA5kE+mkEIgMAu9opvQ
	(envelope-from <linux-leds+bounces-8001-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 05 May 2026 16:54:17 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 021BF4CFC7B
	for <lists+linux-leds@lfdr.de>; Tue, 05 May 2026 16:54:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E7FAF300FCED
	for <lists+linux-leds@lfdr.de>; Tue,  5 May 2026 14:54:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75F1E480948;
	Tue,  5 May 2026 14:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HgGo7my5"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9705B1F03D9
	for <linux-leds@vger.kernel.org>; Tue,  5 May 2026 14:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777992851; cv=none; b=tyXzf/J+uNEABB2/1dixft8ARRdBmWdHBLDvXoq4sJmvANhkcOsT6PqSSkCf3uWjpTBFQ1W/lPooZNsKDili3Vek1FmgWcrVOTtLz82u7KWKr/Jt+/rC4ud1HbkhFtidse5WkejPnpRLnTYmCwx05tJEM8j0XPOyY0TSNryJOT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777992851; c=relaxed/simple;
	bh=iMU3DpYEt6DQC0zDMTljEwIwuTHDhTEQdQhp/5OALpU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tsjxJFW71v7yu5ZCrgHvWHQPjG/d+KLJtGZ9X21H065/xWQUCk/pOtx7OFqBN0Ax6OPg0NEim4tTIgI2tFmgZ4Wf6kXpfzKkb1i+mUzX9LWSivYJSr7Ca2xyRt1wF19g8ZPvuFHQRk8wn8Z6xPykCy25Gvhy2GaAbsFR0hLrF40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HgGo7my5; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2f30a4601bbso2155076eec.1
        for <linux-leds@vger.kernel.org>; Tue, 05 May 2026 07:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777992844; x=1778597644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cEuY3xrF+GY6CciBovDXE63XwQObE7NxSwqBErA+J0g=;
        b=HgGo7my5o0BqXb26qc9zqOraHkN5p1vCrViAuvliAOGR0dFWTG/OKkBbbQhvpH3lro
         SjwDvbtMLvYUwrYvmgRV8TNyZH/R2610YXa1hmxswvRghp981BaP/+PkiWKO6EjNxhEc
         yEb5gqXcowgawUOiZPN1e5S6H5HM0PmLJ2VF8No2rCh7XBEqu7NppFi69sI3oulmJwPg
         YjS5LNcyWWzz9dpt8savMWgT0HiZ5/ohTczTCAjuGDjP9hWYmfbCh/jna1QUbvN8a6Nk
         QnnSvJPGzVbaiKqHwkfblGxydeDW9tGAl5Xh4jJGde8rtjCXLecBeOpTKDLVlfFh+9z7
         Z85A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777992844; x=1778597644;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cEuY3xrF+GY6CciBovDXE63XwQObE7NxSwqBErA+J0g=;
        b=W2xz5HCtaRsFEayLrHyBGz4lSZwaEsuwV3Ws7Un1kfalShDnTVqyWRV5ZzHnYIwbDj
         ka+BmFV5b021nfY8SDjtLt2ttaeediBZ+g0xN1kt1Kbz3OnMCLzSGmFv2uekwuKm/uJV
         bqAEz9N60/8s2+dpoSbpB3abURH5915JwqDVe7Iylkt7II2l8sWLu/LNCR8rmog+ilz0
         /qC/SNtnrY1A31jbWqonJdX1URV1PtNxt3F5NmKAqqqBT96SLytyiFADgrMNZ0udui8F
         NClmpRaHgwYlQDithMxTdLhs6A9jaLx5g9LRQGdNw4HJBN2dEi3FAiRN0tZTGScTLsMx
         1o8g==
X-Forwarded-Encrypted: i=1; AFNElJ9zf1roUuwVJlFVRCU/jHXl83dX/w5/6wOi7qUJOk26yF3sFSvJ7cTeNIg+CnmBbdeH+V7t3NPQVYoX@vger.kernel.org
X-Gm-Message-State: AOJu0YyVuuzLofP/AasnAL2DLggsAs9ZXB4HM31SYOLT5BQWWKCbT9sP
	hC0KXJPmpBcZv6Hbi+ogG/W9aOgshUpwM5sb5kLcVYEoRzkKhVL2YiIV
X-Gm-Gg: AeBDievGUTzS+yNCwopOK11vcCofEQfO5/QHgd1vPHPRaf5YSnNw4KjSX5BgH+0dgLP
	sG1MOUYUT9l2TlIvb/ekECQ8bclnLZjLU2WtzQN3Cu63P50IUdBMkqgOpXOLgMeLr9oqD4TAEBn
	noSE7bi5vYScbdLKGTL6r5ySNe9iHkIT8f9+R06thH/kGky1nTEvac7J9li0HA8Z/ZQS/r/h9Jl
	kh2hEh4qls12jZdDMmRHS+rnSwd7SXenWAChp2+u8/6Ymo40bXjLYxowDSVl6G0kBOgLl2bfjJ0
	Zap83q07vVgL3SE7R01oS6q0T/18J0+ezRpC12CiZkinIK8YFsKwQzGC/2Ba72MU3NcNeILR331
	hSCAdWa0zP+37R1hdBrx2Ehh9T3KIQ1HTnJHYQcG8C7J6kb5rlt4AnmRHKqnWoQinXYpnzi4PZC
	csJK5tgyiG1KwE/HSapE3vKlxXuR39HVM=
X-Received: by 2002:a05:693c:300a:b0:2f3:986d:2d01 with SMTP id 5a478bee46e88-2f3986d9397mr2342431eec.19.1777992843487;
        Tue, 05 May 2026 07:54:03 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a59:55d1::1002])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f3bf67cf8dsm5793545eec.6.2026.05.05.07.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 07:54:03 -0700 (PDT)
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
Subject: [PATCH v4 0/5] leds: Add powerdown gpio for is31fl32xx
Date: Tue,  5 May 2026 22:53:49 +0800
Message-ID: <20260505145354.1267095-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 021BF4CFC7B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,thegoodpenguin.co.uk,zonque.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8001-lists,linux-leds=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jerrysteve1101@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.994];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

This patch series primarily adds the powerdown-gpios support
for the IS31FL32xx controller.It also includes a fix and
dt-bindings updates derived from previous attempts [1].

Patch 1 and patch 2 are based on a previous attempt [1].
The driver-related updates in patch 2 have already been merged.

Patch 3 and Patch 4 add support for the powerdown-gpios property,
which corresponds to the SDB pin of the IS31FL32xx series chips.
This pin is used to enter and exit the hardware powerdown mode.

Patch 5 fixes errors introduced by previous changes. It impacts
the brightness control function of the IS31FL3236.

[1] https://lore.kernel.org/all/20250723-leds-is31fl3236a-v6-0-210328058625@thegoodpenguin.co.uk/

Changes in v4:
- Fixed compilation build errors due to missing header files
- Link to v3: https://lore.kernel.org/all/20260429154449.730880-1-jerrysteve1101@gmail.com/

Changes in v3:
- Replace shutdown-gpios with powerdown-gpios, follow gpio-consumer-common binding.
- Link to v2: https://lore.kernel.org/all/20260428023401.330308-1-jerrysteve1101@gmail.com/

Changes in v2:
- Fix $id mismatch with file name in dt-binding.
- Link to v1: https://lore.kernel.org/all/20260428003412.322032-1-jerrysteve1101@gmail.com/

Jun Yan (5):
  dt-bindings: leds: is31fl32xx: convert the binding to yaml
  dt-bindings: leds: leds-is31fl32xx: add support for is31fl3236a
  dt-bindings: leds: leds-is31fl32xx: Add powerdown-gpios property
  leds: is31fl32xx: Add powerdown pin to exit hardware shutdown mode
  leds: is31f132xx: Fix missing brightness_steps for is31f13236

 .../bindings/leds/issl,is31fl32xx.yaml        | 200 ++++++++++++++++++
 .../bindings/leds/leds-is31fl32xx.txt         |  53 -----
 drivers/leds/leds-is31fl32xx.c                |   8 +
 3 files changed, 208 insertions(+), 53 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt

-- 
2.53.0


