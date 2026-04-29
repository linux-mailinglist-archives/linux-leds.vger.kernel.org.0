Return-Path: <linux-leds+bounces-7901-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHjuMV4q8mkxogEAu9opvQ
	(envelope-from <linux-leds+bounces-7901-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 29 Apr 2026 17:57:18 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E9433497581
	for <lists+linux-leds@lfdr.de>; Wed, 29 Apr 2026 17:57:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0CB663069C6C
	for <lists+linux-leds@lfdr.de>; Wed, 29 Apr 2026 15:45:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9905379971;
	Wed, 29 Apr 2026 15:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hir4SGuP"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE09234CFCF
	for <linux-leds@vger.kernel.org>; Wed, 29 Apr 2026 15:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777477499; cv=none; b=l5Pe4ky5zO/qfFYvWKT+FSCQRLZJkc0v4zte7ANFYrKRbxWjJ1YoyzSolmwQV5M1a6BdkJUACxUvj5iLR9/gU+/bmoRMm8MUFFeqbOGIaMizTMqHwDE5LtNZCxkm///IHiwrwGDEWnc/Qk7/egX87WWhASBdKm8pAVF5G/gK6Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777477499; c=relaxed/simple;
	bh=Qi7xIA2TqpAwS/9xKDClt8v6/ovXWQCPOu7xJnS7geY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T/kR9X9tGGi0xxngdBvA18EaQgLJ3FzPKSQOp4QK0f4kgbNwRoKz3oo0Ld2XrY+GJyu064coSSzWrNm0hGyC/cuLHD3bxFN0BX3uSOog91Bg5V73hBIaw0v8orE7FLKXxsRV79lMt0/f5bafcTPfJhqCJ7sDkttdieEP6TbCG6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hir4SGuP; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-12c6df0b9bbso6959527c88.1
        for <linux-leds@vger.kernel.org>; Wed, 29 Apr 2026 08:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777477497; x=1778082297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2pGMTg5AYRgxoacmWH4RFQzjjbAiPYYFD1LTfaMwfdw=;
        b=hir4SGuPxjyE0AhLJuNLldN6X7o5RVOp8tX0xp7k6ZgdwWVY/yKTmKrHiUqZYfhcYZ
         ECe2zC2haDJEEg3Hw9iHJx2HtLpi3N31vaUlamusrJLT8Y0cVfjd8AJumZwFXL5rjwBh
         B9G5iYNj6kaZ7fJPmpS7nM8ZUc8JAMD4iUn5MdA2aZ2AW4YkbsSjR6Yr5hebXwIBJRTL
         h/i3ooElcghGjkk556Y3RO5kbm9FgWsZbQ2rSnntlH92S5DEyn8sE/7lF4Un58rymi8T
         zeCkvXNigpFdJnB1nMp4AccIT8c3IDRdXbUje+alF5EwbQJMvdZAwY5HhyQL+baOy70R
         dOcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777477497; x=1778082297;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2pGMTg5AYRgxoacmWH4RFQzjjbAiPYYFD1LTfaMwfdw=;
        b=Day+uVwNS2kIdHRBO39ODswuhSgVZeKWVDBFYtOb2QJ3LRcRcQImq+KB9mtlNRutLh
         I2AAmcm9mdPIdgQ2Kk/66skY/n94teD1IzqUIrlDKUwP0MM/8ED2G7mMjYtXLSmDMDLH
         L/LQGiTMGtHKVEbPhTz+v2y0E3K+GdjkjCGzmKUrCNzFv3fhEPp3WjM1pXFlCtcUa+RE
         6UhPHDdLcKjcgYFIJVylHAyonGXWU6oHucn/5X5hu33oR8n1RdDd/f9+GX5+gPVkOyYa
         w9YlqBNZHrtnsduwmaCscMw6Cz+2XUZ68EuViUVYCiCU1/et2qMslAbR6BFUqfbTeRm5
         AA/Q==
X-Forwarded-Encrypted: i=1; AFNElJ8fy4Mr2qk+t8SORuc1uWu/8ct4FGe9Up37ffvoLNKW3xnWfeaqrlshpCVP5qhEh4rgiuOK/4N28qMo@vger.kernel.org
X-Gm-Message-State: AOJu0YwUTRtY2Xf3y4dFfeaL9SNmXYehZ2dWsuR3pOAxDq6nGpNMLQKs
	1ycA+hlPNzDGlPjS/Dc+rKw48YCfQlz70fHwGemY4Ku8VBTMsO7aSYKt
X-Gm-Gg: AeBDies+DcUnhZVzi8FMODho8+Ex083Hz5dzjp6Pf6scNbqh5JGHy0bgAJj90pIuWRg
	9/ZL14wRgPeYfRw7SrWW+BMgSriJ7kZ6VIJFRIbnImWAiRhdkkQBMXeMJYEguwZfAlnxfkfECij
	DEJB2S2GEff3hP4CYWDwvDwiJ7E+D8Jz7yj7KKy0PQie1OG2wscVNQ7NXp7AkD6N6Kl/3AFKIKQ
	ax+MCv4pH9ApiQzKXwTc/OiDw4/V4q3Qz/iT5KJqwWsjPd+fLH6rUa+kOtGKaD5FoHs3cTIciyQ
	9e6ORn7720/E7Kxdyt1VtjbPuIj4/oQMAEpMGw9iJnOcY8m3675wT5rnRnQl7u7eQODLo0nluUc
	oJVOdX2fWLB1rpdrVnyY0gBxlH8Dn2M93v/Qz/eQ40lhO9YHeJuzmYAQ3iRH5jQwXrk4f8DZvPg
	aWvDoI+EpEaz8PWHp+kq85V3wvIJ/pYik=
X-Received: by 2002:a05:7022:f513:b0:12d:de3e:52c8 with SMTP id a92af1059eb24-12dde3e5333mr1963969c88.44.1777477496912;
        Wed, 29 Apr 2026 08:44:56 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a59:55d1::1002])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12de320ecf9sm3610166c88.2.2026.04.29.08.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 08:44:56 -0700 (PDT)
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
Subject: [PATCH v3 0/5] leds: Add powerdown gpio for is31fl32xx
Date: Wed, 29 Apr 2026 23:44:44 +0800
Message-ID: <20260429154449.730880-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E9433497581
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
	TAGGED_FROM(0.00)[bounces-7901-lists,linux-leds=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[controller.it:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

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
 drivers/leds/leds-is31fl32xx.c                |   7 +
 3 files changed, 207 insertions(+), 53 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt

-- 
2.53.0


