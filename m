Return-Path: <linux-leds+bounces-8213-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CGOJk+4DWrC2QUAu9opvQ
	(envelope-from <linux-leds+bounces-8213-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 15:34:07 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A50CB58ECC5
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 15:34:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 76B0C300B9CF
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 13:34:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFB592D2397;
	Wed, 20 May 2026 13:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pgrIxODQ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442DF2BE03B
	for <linux-leds@vger.kernel.org>; Wed, 20 May 2026 13:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779284038; cv=none; b=lTTlt0EL+Fw6jVY4w5Zh7GxqTnqXj07hy8p57IChAjo8I9CpSwxTZFddr7Hq2IvR/i6q1ByZ9QTYcMq4rJvNYbth5tLcc2I7mZK188yvMM16ZfmHxkcelckIvuoOcxFMtbV/7RMKTgQj4WP739tX+sRSVwjr/WTlH3BLh8L8NyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779284038; c=relaxed/simple;
	bh=DHQAQ4SaIjuaILfG9Rqgh+S0/2UMIQOk5eN1qoDZABo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KKM6ugSdDUZB/9bn7y9x2Azq05pVnG0H9sfM1xEW0CS5mgdLaHv5rmz7tvifSPguPbuxUHA0Kd9YNP+tahE1UBLSrNWX5droK6WpL9PgPnjzU7ioqOR0hVSY4s0dAaYId/kw473qABQGI3Xoq/8/VDXIumapBNBrXJgEJ2UJqg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pgrIxODQ; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-479f7e75a6bso1718020b6e.2
        for <linux-leds@vger.kernel.org>; Wed, 20 May 2026 06:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779284036; x=1779888836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B8VFkrz+3X6WvrMnbva8csF6woSOVooZmSXbZ1kevyE=;
        b=pgrIxODQfdDFgLkjhFsmouRAOh3Y4wNwhZh754gp+f9dNM0QzmbZDojdcWStZgfror
         drsoHXy8BXEy9Qkb5lpZdc9po0lGfG7FMX3HmlovYvAp4m0FrB8BDEnrb88gytyH6Fr1
         Y6eB9xu2MirNB44U0I3IQ1RS6JagyrZMtpKSwr9qXqJsNUT4dYFqHc7kdNUHEUYhmDe4
         OD6S9MbkCqNA5wumoJrVHdiTLL5OeVSbAwsgJKs1w4uAgwdWqrJKJv4WZBQYFxuaqQ9I
         /VUYFaMyx8U4aG2GVpbONLE3YBA2H7rLbimbmWraHXanihTTHBwaK0QplmMEH48RoQhw
         zXzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779284036; x=1779888836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8VFkrz+3X6WvrMnbva8csF6woSOVooZmSXbZ1kevyE=;
        b=hAOvfWKf5w6S0A+3V7ycY6wIxRtCL9q1Al8BogPwvRqfqjf5pLzrMtGTPZWXrJvCYx
         FfZ5N6iJAzTIhQXRHLFMW5d8ZLBhHk05ux3X3zjBpF1fkhCTbrSpi0usQNWl2JISDFar
         jwODquNc/wWS24OYqzdY9TXn7uxX1l2jroWGxD5y4u0oNX3rhtYD1XGrun05DEwPHm/4
         4vVydjSGvoxGVGnLK+/vMf/UcI44whEuboUyZZ9De2FMUuX7nNPzItcQklJ0iZd8cO0c
         6Al2+vJnFDFEr9jWJsXrLkI5j26uRE+r571tcBtHam15SLy8bDm+Swu97X3nf4FR81/0
         RNAA==
X-Forwarded-Encrypted: i=1; AFNElJ9H0grLB+LUu/XQgmHHsoJSKRFjV7I86nf+bKdGXd0dUmwtAQbafol8zPB54c35z7te3mv4SL8L1ui0@vger.kernel.org
X-Gm-Message-State: AOJu0Yztl8X+gif+todCXEK7Jl4Fo9I4KawbDYGL2fTzDSAk5doVGBsa
	NNsjLZDZYejgFIY/MW6WIAZoda+4oPjzXIniLKgFj/cFNjT+3+A80Mqx
X-Gm-Gg: Acq92OHyYGEnuYQMmMP20WfDuNzVqOSswi0qd2eIDdYPtc7ptiHc0xW3L1luYU2hSFy
	dFN9+lZHVtA/FDzTrd0fAi39e/YQOs8ZXVZn7QQXJewBjNffUVQ3mWnCqR1BQCclKlThjIBwC5/
	Q5WRdHjv6qHPcg2+65S2np/AOrz5qSTod3/yr3Ic44eSOxkpSjIWymNHxU5qah+hIXu3adT19od
	+/jF721f7dn/TlY9skXMgN9IJtsGy/jf3lRpVoUbV5TLaVLgkVYAD5zAGoe+Hu7eQZUJZjkXDgN
	mqd7zUxwHws9koAIOZUT3Fn/CZMFivdC4mqz2eKzvk956YUllW6uEGNqTTsB727J9IBlybLqEh5
	HtUyYkD9Xo7Rxdzzn15RYXal8EJQheAId4Yu3QVGJRiJZ7FeqvloHno7+GvibBGb3/4/u3u5vT+
	UY4e7hO+N4jNevnxgs0lbXvvCoYVwS5rVfMbsq/8s=
X-Received: by 2002:a05:6808:e412:b0:467:ee:7a2f with SMTP id 5614622812f47-482e577d4f5mr11556422b6e.28.1779284036073;
        Wed, 20 May 2026 06:33:56 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a52:5b11:a58f:5208:2fa7:bba5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43a956fa075sm10253951fac.10.2026.05.20.06.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:33:55 -0700 (PDT)
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
Subject: [PATCH v6 0/6] leds: Add powerdown gpio for is31fl32xx
Date: Wed, 20 May 2026 21:33:37 +0800
Message-ID: <20260520133343.1423946-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
	TAGGED_FROM(0.00)[bounces-8213-lists,linux-leds=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: A50CB58ECC5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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

Patch 6 resolves regression caused by prior changes,
and fixes the 22kHz PWM output functionality for IS31FL3236A.

[1] https://lore.kernel.org/all/20250723-leds-is31fl3236a-v6-0-210328058625@thegoodpenguin.co.uk/

Changes in v6:
- Add fix for 22kHz PWM output regression on IS31FL3236A
- Correct typo in vendor prefix for Integrated Silicon Solution
- Restore hardware shutdown state upon driver removal
- Link to v5: https://lore.kernel.org/all/20260508131139.1523597-1-jerrysteve1101@gmail.com/

Changes in v5:
- Adjust the unit-address in dt-binding to hex addresses, and remove unnecessary if/then constraints.
- Link to v4: https://lore.kernel.org/all/20260505145354.1267095-1-jerrysteve1101@gmail.com/

Changes in v4:
- Fixed compilation build errors due to missing header files
- Link to v3: https://lore.kernel.org/all/20260429154449.730880-1-jerrysteve1101@gmail.com/

Changes in v3:
- Replace shutdown-gpios with powerdown-gpios, follow gpio-consumer-common binding.
- Link to v2: https://lore.kernel.org/all/20260428023401.330308-1-jerrysteve1101@gmail.com/

Changes in v2:
- Fix $id mismatch with file name in dt-binding.
- Link to v1: https://lore.kernel.org/all/20260428003412.322032-1-jerrysteve1101@gmail.com/

Jun Yan (6):
  dt-bindings: leds: issi,is31fl32xx: convert the binding to yaml
  dt-bindings: leds: issi,is31fl32xx: add support for is31fl3236a
  dt-bindings: leds: issi,is31fl32xx: Add powerdown-gpios property
  leds: is31fl32xx: Add powerdown pin for hardware shutdown mode
  leds: is31fl32xx: Fix missing brightness_steps for is31fl3236
  leds: is31fl32xx: Move pwm frequency setting to init_regs()

 .../bindings/leds/issi,is31fl32xx.yaml        | 187 ++++++++++++++++++
 .../bindings/leds/leds-is31fl32xx.txt         |  53 -----
 drivers/leds/leds-is31fl32xx.c                |  36 ++--
 3 files changed, 211 insertions(+), 65 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/issi,is31fl32xx.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt

-- 
2.54.0


