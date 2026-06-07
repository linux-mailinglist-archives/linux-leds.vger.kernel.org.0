Return-Path: <linux-leds+bounces-8533-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8lHTHk+NJWqeJAIAu9opvQ
	(envelope-from <linux-leds+bounces-8533-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 07 Jun 2026 17:25:03 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C719F650DD4
	for <lists+linux-leds@lfdr.de>; Sun, 07 Jun 2026 17:25:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Q7ymmgk8;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8533-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8533-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F10CC3055D7F
	for <lists+linux-leds@lfdr.de>; Sun,  7 Jun 2026 15:20:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE44F2D29C7;
	Sun,  7 Jun 2026 15:20:39 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709332D5C7A
	for <linux-leds@vger.kernel.org>; Sun,  7 Jun 2026 15:20:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780845639; cv=none; b=Hnx2BKzUbz8nucWsNULyo4CBmyiuRz4OvWRwbemQYYoG6Ik242vsx4rzDUPVyw3qlh2VDxWxzkis4rjkrh8k/KTgm66JjENVO4u0pqLXsvs5tS5zTNtrnUqX4uZaRTFE/auu2njf8fp10PwAyhZXtQ003zrSlEJvCTSTywhRq90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780845639; c=relaxed/simple;
	bh=RUWoSSPMfAP/6bpsEyV8VEbxxYz0gmjyqX0rZdPDXnA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=umbBEwRNgI5oGzlqX1Ky0eGH4Gs3T7YJ8K51aLZmFTvGZZM5c0qeC01EACMnCcefnyuBkZlPy2QlqiqHxpaGbXSvGo9pQggHpBPGObkbP6zwF2hfxSQUzKatxN+HwoisqDSZkOQSnakQraj0IXffarpgjnYe/y0sso9UTHmr2Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q7ymmgk8; arc=none smtp.client-ip=209.85.216.47
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-36bb3551f6eso3005696a91.1
        for <linux-leds@vger.kernel.org>; Sun, 07 Jun 2026 08:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780845638; x=1781450438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BmdAeJeF0AXVd87AP/9ds+dEzvwxxHLJKYbOYujemTQ=;
        b=Q7ymmgk8kcHzjX3b+X2dQAgikTh3tkbCNKXsLmaXqYlK7hZ5hpyBXnV0jPD6AkAbpr
         qpZon2bi8EIrk4bUANI4E19KXn41Ds0Ksw4ump+Pea1XV46EYd2PvkOUFd6vEfAV6Ivt
         mOX7Mw5bg5vJ4RKT6VBPcr0JqkiDlvmdIaVCGhcozjybJclT/MUdeW8wr84/O9vY2uq6
         PH3JgoOa9tpew1cRUqS8vukiJaHiH9aij3PSry7LU594dQEkMTWW1CI+67+EDBm8mTbm
         EnIeOaZDxfBa33sihrGX/5Ik4HwV471L9vI2RF/lEJpmQpWXEh+x3wF8f0isVALsdTYI
         xSVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780845638; x=1781450438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BmdAeJeF0AXVd87AP/9ds+dEzvwxxHLJKYbOYujemTQ=;
        b=eiwhQwNKTeH4Sqw4eSW2NOaDnYgBC2Clwz0P7xOjwNXjGTNs3d24QfHvjoXRDbXWPO
         7vXbYKtGiG86QRibg6xfryAOXdyz80cQP9SqJyDV5OWmeF8ClX4i9R09eUvtVWSslft1
         GXFcA7h0G8/iw1r9GkzEAuIIWf1sa97a/1sl2X+FH2ktjWp7QZmpIiEaW1Q8UL/l9blp
         XQL1TgZ+N3mDkckyaQUxlWGkOVxtwEc6cVw0GrJr9EFxDFkNDnox3HfCUjJ9a5P4c8p6
         4JRwXx+NIbfxrHeqXokzwKR5esrG5y81ByI0yTFSPC26D1+YyBkLAbs7GMqtmhORykFz
         jWQA==
X-Forwarded-Encrypted: i=1; AFNElJ9hpfqQBuPEdLMbOkEcq3hQgoAMx+J5fjZ5ltroIiHPH6+PrzpsjPI0/+3+ySGNNeQuCFM7kTN2zx+R@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw3oBBc0rmuOg7AeXjYdfFKDe85Yd2Iao3DwWjti5pOX6/cQx8
	1bX6gNYnfGEjb1DnQY0fbuZlgqvQ7UpwCcz7s1zbZrNV6V0i5l10jID9
X-Gm-Gg: Acq92OGd5mNEn0bFfJYVgWQDfm/SFdy8iDn1HMuMuANncQVCB+6ZYZ4AC114ZxYn7Im
	r9+Ek3NimR6k+2gYEkO3vt/Xi45mbtWqIwTDYR0dSS31NuYVFxRXa3MZu7qNcJkBYM8XNxi1N67
	J5pggAAsPFSLcs/rRlVhbiy5jP+7t6hB+VFCVD+cKwFISXxPabq45klsg2Z8hrB2qHw60l/D76r
	8OPkFu8TFVncjB4qLjXdRAUVgoFKWqwyO7qAMD8uIPBLVmwBBpC1y6x0uTK3LvaDoszGWsC80lG
	uC46DSmFaPT4Sg0g8AtprGnJwQzCfQdQGKxlr2yQc9Gi+Ph+lVKueZItfF6ngQr5sWNz0nfQTh1
	dnIYaW5PrUUtJTlfyyaKFM/PCUXab9VZPvUeG7YdLCOBK9reA5MpJ1jV0J3ylocdJf1gGW1UHSA
	RpxCZEAu4AO4qUkOZmT5Gs4q8hCHV9hnI8wfivNNkdOuR7hC0FXg==
X-Received: by 2002:a17:90b:1ccc:b0:369:932a:2b6d with SMTP id 98e67ed59e1d1-370ee344ce4mr13126921a91.6.1780845637686;
        Sun, 07 Jun 2026 08:20:37 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a54:e741:3a5a:3245:d3dc:4b5d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37135861581sm4130659a91.2.2026.06.07.08.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 08:20:37 -0700 (PDT)
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
Subject: [PATCH v8 5/6] leds: is31fl32xx: Fix missing brightness_steps for is31fl3236
Date: Sun,  7 Jun 2026 23:20:01 +0800
Message-ID: <20260607152002.446617-6-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260607152002.446617-1-jerrysteve1101@gmail.com>
References: <20260607152002.446617-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,thegoodpenguin.co.uk,zonque.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8533-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-leds@vger.kernel.org,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:luccafachinetti@gmail.com,m:pzalewski@thegoodpenguin.co.uk,m:daniel@zonque.org,m:jerrysteve1101@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[jerrysteve1101@gmail.com,linux-leds@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jerrysteve1101@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C719F650DD4

Add missing brightness_steps for is31fl3236 to fix brightness control.

Fixes: a18983b95a61 ("leds: is31f132xx: Add support for is31fl3293")
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 drivers/leds/leds-is31fl32xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index b34fcef2c173..cbda7edbfb48 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -492,6 +492,7 @@ static const struct is31fl32xx_chipdef is31fl3236_cdef = {
 	.pwm_register_base			= 0x01,
 	.led_control_register_base		= 0x26,
 	.enable_bits_per_led_control_register	= 1,
+	.brightness_steps			= 256,
 };
 
 static const struct is31fl32xx_chipdef is31fl3236a_cdef = {
-- 
2.54.0


