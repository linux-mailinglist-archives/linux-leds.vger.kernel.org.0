Return-Path: <linux-leds+bounces-6887-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id h9zuNfqBh2l7YwQAu9opvQ
	(envelope-from <linux-leds+bounces-6887-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 07 Feb 2026 19:18:34 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFDD106D4F
	for <lists+linux-leds@lfdr.de>; Sat, 07 Feb 2026 19:18:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C8200301571D
	for <lists+linux-leds@lfdr.de>; Sat,  7 Feb 2026 18:18:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33B6A2E6CDF;
	Sat,  7 Feb 2026 18:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ITEeLNaP"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF83322339
	for <linux-leds@vger.kernel.org>; Sat,  7 Feb 2026 18:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770488312; cv=none; b=J1YGHtYhXcaBCobUGV02XK13CbQiJxF8qHMaNkYrMSmj9JnAp8kF6IO+eDxnlnXE1kmK2VvNQ5APYNcSwNoEjt4demZpvmQIVEfdQSUdj5yvdxMvumDGUuX53A6ahQ6WeDMsrCAzmexWLxJqtUze3pW0tjiuUjDVWcZK4OHHjjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770488312; c=relaxed/simple;
	bh=xukVw7rOVqVqFsLaPZt2sF+XCk3KwgRAWOUCu7Rsvz4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ubi6HlgWoBfSlTzpIBhIMxGxtbB2wW5wOmWCx7QXBzB3WoMdtRtj45tlQS2CgoiXaBs3aYU+FuKlr8LiH7Gkg9871lhfbfLrwmyoJbcs5jm+2eT3MSivZYzk5bzzNR9vt8ukvYAJcLizDxJ4V6paqa/+0Lu7t8BizPryXya29do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ITEeLNaP; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-89473dca8aaso24687096d6.0
        for <linux-leds@vger.kernel.org>; Sat, 07 Feb 2026 10:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770488311; x=1771093111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WYGpfm4hXts4C0qtHNdzMK2oXFuEFzsNugVdlbkRCPI=;
        b=ITEeLNaPVt+nkr22Ux3hpS4JpyQT3dy+9IRA3Hv+T+uqKb7Rr/wPCChEv8UJ1ZnGrD
         ENtGVDKOZLOzyfrojhUgV0SbLUXoytVeMWyK34JSYdt1txvZ92ASic86SZwwGUBipgix
         fI612H6EXwit06m9NfVs6tJkTDybpF3hkxokA11RzyCblAzztwurkwCDeXSX9sXyKbLU
         qCA0pCYo+NDR9NcocU3Lu97dGe94pkpH8x0wGcV3NSU8DzyzHxC3qGaXsBWNYzjHKZDh
         MEDaZogj4fWpyR+EGMAEcHozxRbI0+YpmoQ1nFP8VDtIaD++wm6tkxxh9NXrD4FS1O5c
         nqrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770488311; x=1771093111;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WYGpfm4hXts4C0qtHNdzMK2oXFuEFzsNugVdlbkRCPI=;
        b=W/Q4kwd48uYqzkOnUPtULvfGJ5bpNCqlS7OWZnuVQ0KT9BHatUCrW/7wG1W0p+Y/1D
         NzIUE2sKW1kqGsABFocPP6X+SLUG2CPt+uhTjzJjj15JLj41FbxDEgHvB+5c+OYkGLbX
         vYfC7bko6LmpFpL3VQ7dPXyvqaqesj44U6LjFAGp5qSzg1scwCDLqoc/2Ksb9x+IOKLc
         yEaBNpF+QGJtXQYAUXgTNC4emMUSLUn/NG7gpa43JPN/nidyMbqhmRUO084YxEylg9rx
         kd/+pDR0oCZNl8zmvGoEezV2GkRvTGah6ID3wAk1e4Bg3pmu0hjbsuMbgSVdvuJgQH1l
         mJiw==
X-Gm-Message-State: AOJu0YykKx9YezMWNW1Fuj1gOUBSE+faAJwkHxvz60Q1BYNPGM+j87z1
	eIuzIkO+H1b2mv41cbXcQ/AJ03vkR8Ifv1L2DZ1Cu9WcgE5zXN+sMeJA
X-Gm-Gg: AZuq6aI9AkvVN5fBICYeTtxEiEMweCOoBul15aM8zGEC6hLbfQ7SuNjrhHSuQe/WOj3
	q0HwIQMBu5vHewOBZ0qzxhCpTxN7x6NIrzUFj5/kXu0veOU645gVFq7XZQr3lwhPxMAiGHRsUZz
	kxnZjh7U+VEOXBBzBhn9AMTYtZA+SudWe3yYrOgK4ZLFg1iHIZ92z+HcVd7O9iLqDqVz7+OnMCF
	fSDqBy4+2uO+BWWmu59MOu9v1mibZmjne5jHOrtg/O6vXWbs32AHTRJX5znA2nvB/D9qCmItyfg
	3P7NVijtl+oW+jlvG89ipTW8U8WysPGNXf5Gxkpa4AmemozEVxL7U8I3hv2oQRzET7KrmjHiAS9
	8+gfRK/N5sVZNgElrNra74T2QHGaNId/WV7d2JeWDt01FAbPYp5ksrU8BY1Veo4p9ydrhhK6xCE
	2CcxtK7HsnVX5UoYihxolSaPiTahlbLiLZUrpSuh1Z
X-Received: by 2002:a05:6214:29ca:b0:88a:2de5:c824 with SMTP id 6a1803df08f44-8953cd8a136mr102440466d6.54.1770488310748;
        Sat, 07 Feb 2026 10:18:30 -0800 (PST)
Received: from localhost.localdomain ([50.21.71.60])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8953bf35102sm42450666d6.10.2026.02.07.10.18.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Feb 2026 10:18:29 -0800 (PST)
From: Neel Bullywon <neelb2403@gmail.com>
To: lee@kernel.org,
	pavel@kernel.org
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neel Bullywon <neelb2403@gmail.com>
Subject: [PATCH v1] leds: lp5569: Use sysfs_emit instead of sprintf()
Date: Sat,  7 Feb 2026 13:18:25 -0500
Message-ID: <20260207181825.13481-1-neelb2403@gmail.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-6887-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neelb2403@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2EFDD106D4F
X-Rspamd-Action: no action

Replace sprintf() with sysfs_emit(), which is the modern standard for
formatting sysfs output.

This change aligng with the kernel's best practices and ensures usage of
the most up to date API.

Signed-off-by: Neel Bullywon <neelb2403@gmail.com>
---
 drivers/leds/leds-lp5569.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-lp5569.c b/drivers/leds/leds-lp5569.c
index 786f2aa35319..a252ba6c455d 100644
--- a/drivers/leds/leds-lp5569.c
+++ b/drivers/leds/leds-lp5569.c
@@ -410,12 +410,12 @@ static ssize_t lp5569_selftest(struct device *dev,
 	/* Test LED Open */
 	pos = lp5569_led_open_test(led, buf);
 	if (pos < 0)
-		return sprintf(buf, "FAIL\n");
+		return sysfs_emit(buf, "FAIL\n");
 
 	/* Test LED Shorted */
 	pos += lp5569_led_short_test(led, buf);
 	if (pos < 0)
-		return sprintf(buf, "FAIL\n");
+		return sysfs_emit(buf, "FAIL\n");
 
 	for (i = 0; i < chip->pdata->num_channels; i++) {
 		/* Restore current */
-- 
2.44.0


