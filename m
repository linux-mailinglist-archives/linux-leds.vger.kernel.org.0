Return-Path: <linux-leds+bounces-7865-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNkiE/AA8GnYNAEAu9opvQ
	(envelope-from <linux-leds+bounces-7865-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 02:36:00 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B25647C2E1
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 02:36:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E9F263016F36
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 00:35:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21E0427FD44;
	Tue, 28 Apr 2026 00:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="psnXqlbx"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83D12512DE
	for <linux-leds@vger.kernel.org>; Tue, 28 Apr 2026 00:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777336510; cv=none; b=s5dguUIfjvaNnjUryfOsCpigGgQEClFVMS4o/DHYpRhyWSXJ3sXDS3KOXbKAdk4bK3Py9neauAtuaITGewszfsE6d6Rj9J9BSb7HujF9e/ZPV18M/zgu+crVlbFmNdTFj2BmGs2/2qETOSrzbcEyIgjmyvk0zRmow4OYOmSh1ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777336510; c=relaxed/simple;
	bh=TxzwFKiJIPCCxZO7aT5q2yoHecnvGCv7WOi02z2Upck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qZHV4e3i14jlAeT+7VdttiBS3KqVPcmFApH4BGcgitc4vkhBX27wDkiJHhI1qdsqSo3YetqUI3axUfW19J/R8Sx9SZ1/PlNeh/6RUWmP/Bc46VZOu0Ie9pXq13QatND9aGArzDCTUciZYZvYByGX3dbsTc3tt7wuGqlIcbGZ6nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=psnXqlbx; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-12c88e5f4aeso4801013c88.0
        for <linux-leds@vger.kernel.org>; Mon, 27 Apr 2026 17:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777336508; x=1777941308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wKFYblaOebuDYFHP1LoH1feqnKOl1rhPiXqAnvBgFgk=;
        b=psnXqlbx4GgKxUZsDXj1DNfxvsfMVngcafyqc5kn4NRsTGqGmERr9IA49Wc8K3ea5i
         QsQgTe8DXkbEFVSGCAcB0mXtM5SlJ497ZSwcfi5Q+rn4f7TNCHlAUaLRxWRccqTDrpbY
         9p2TyvvXcKfqv1sIaPFT517190+EB490yIqcnndnBadDjTXjKUzw5o41XdfcqN2G5Wpj
         YJmtP/AS+I3+8LPnTXr+iHriXmFWxt/iHfdg6p8y7sWKc+1aZRKWEKk4C6GolqyHyrw4
         /g8gOt00CoB6LpZamTEPnDjMPIYuw1eTm5+bYhTk5qzEpomuKGB6bVGXwgkl9kSEFo4S
         8Fbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777336508; x=1777941308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wKFYblaOebuDYFHP1LoH1feqnKOl1rhPiXqAnvBgFgk=;
        b=s0WzP6MHi7ogo8TzMlplKXVGhA6ctTDtd9jIovQk034ru/gO5J3K9WM7lhOQYrQz8s
         oiGZWg/+H8/mJCjzhaXpZs7UJtw6Q3z1usxNnSiZR2mdPLnN6aEYMNZz87eE1LIffcfz
         rS+6CfWKNOFbHmySLjWy8W6FThlw7JVe7RVxenrUw1YumgKaTQpNzVV+2+lUAtGasJ+G
         VRhyFlnc5WTOqVAjrsq8UQvuTb8EyNIv+NLOY3wWE5nMm1sfc9ERRbW2NHPNF4bgzgtT
         Bd9k/vIHzYvYz7ei6a09Y68w7K1pREY2Il4/lkBR0xHT/UKhDFRl/mg6yF8XLsV4cpF3
         06kw==
X-Forwarded-Encrypted: i=1; AFNElJ+nIhrLzijs/yAJeEj+H/YrUF+a2ZDtKFonb3Ayyay27C1tNNhIi0/1akxVV767UhGc0XFk2vYuCOR4@vger.kernel.org
X-Gm-Message-State: AOJu0YwFBO3jbh0IYB4RSURLT5/HcNifrMan16IpaWYjsvsfIl/CvcX2
	y6wZaTzB5NEc8YdiTg3or1yNakQ7aJFrYrUzeV3hqySHMGiU412Kzw81
X-Gm-Gg: AeBDieve1ASkW5EDt9q9Y2GZE5k12KIBq3vqo+OHtuP3ph/Iu38h69CuMWlgXAlM1Xp
	+4SgwARbpraiCJ/nFmcAl97t97WgFX04uYgwPx6EVUEoVABEY5HOn9WZgGPrK5NWrCbLquH1DI1
	8Ate2+Xz7Vhru+zCYSQ92Ct8Njbr+vUtKw162Gdag3S2dyU7Qvs6F9HUyG1Z72m4+idsoBctfo9
	Xul+5egQYD5Vnlbw5TOyTKVTX6hQMFwIQFiWdhki/0mdHN4AAOZK2X/NmtqzDhYqeNMQKtHTKbk
	FgNGFoH+EfYzku4PwPKf2TpRladnMe6NLztb4zjLOs3IuRI0JJ7Jnq9/oCpnTGqVi1xqDO5dWHP
	VarqRLZz7bKnYxWjiRu7+JOM0y4Sha9cp1gz0wPTr7oSBT95w8O1Oj9LLnm6Qkka+EWMIS89SUL
	pshLZWiyCEMLLY4s7RTSmOWzwbmhgXHco=
X-Received: by 2002:a05:7022:4389:b0:12a:6d05:3938 with SMTP id a92af1059eb24-12dde46dd17mr78361c88.7.1777336507716;
        Mon, 27 Apr 2026 17:35:07 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a59:55d1::1002])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ddd927bbbsm957144c88.2.2026.04.27.17.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 17:35:07 -0700 (PDT)
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
Subject: [PATCH v1 RESEND 5/5] leds: is31f132xx: Fix missing brightness_steps for is31f13236
Date: Tue, 28 Apr 2026 08:34:12 +0800
Message-ID: <20260428003412.322032-6-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428003412.322032-1-jerrysteve1101@gmail.com>
References: <20260428003412.322032-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2B25647C2E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,thegoodpenguin.co.uk,zonque.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-7865-lists,linux-leds=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

Add missing brightness_steps for is31fl3236 to fix brightness control.

Fixes: a18983b95a61 ("leds: is31f132xx: Add support for is31fl3293")
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 drivers/leds/leds-is31fl32xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index d2be996dd4ea..5db7d91c6a34 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -487,6 +487,7 @@ static const struct is31fl32xx_chipdef is31fl3236_cdef = {
 	.pwm_register_base			= 0x01,
 	.led_control_register_base		= 0x26,
 	.enable_bits_per_led_control_register	= 1,
+	.brightness_steps			= 256,
 };
 
 static const struct is31fl32xx_chipdef is31fl3236a_cdef = {
-- 
2.53.0


