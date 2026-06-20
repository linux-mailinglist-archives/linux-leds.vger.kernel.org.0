Return-Path: <linux-leds+bounces-8690-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id w/B/ALK3NmoQDwcAu9opvQ
	(envelope-from <linux-leds+bounces-8690-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 20 Jun 2026 17:54:26 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 428716A9285
	for <lists+linux-leds@lfdr.de>; Sat, 20 Jun 2026 17:54:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=wanadoo.fr header.s=t20230301 header.b=HyYLdWRp;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8690-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8690-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=wanadoo.fr;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E888D3021B0D
	for <lists+linux-leds@lfdr.de>; Sat, 20 Jun 2026 15:53:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BBFC39934C;
	Sat, 20 Jun 2026 15:53:26 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-76.smtpout.orange.fr [80.12.242.76])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C42F395D98;
	Sat, 20 Jun 2026 15:53:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781970806; cv=none; b=kVKhzrlX2GoF64LT9XRZyLc8vZqdHtTvPQEW5F8G8PZc1ZDX53OSEUxRh93s9CO6kmAPQo/UT2EZMt+GuxnUZHdRZ2uI+CD+GNfY3ggD7ftmcXSSwDEfK27qJL7UMAsMyVNJjNi7Lb9Uolfyv3c8NUd4kZ+6q9rihec6L2aR2ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781970806; c=relaxed/simple;
	bh=ap/LVZDj16CFzA2iIbYYT0pclu99qpraRpUfY48Wgc4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XF5TYwKY5bSjOImOebIqTWTrNrzlPoyFBKpmzzgYyggMj6ccVELzCQVBWKzT+Z0rMgMsaoxPm/KD7a+k2VdjJPy9HJWSXwY86v3Xl6DQzHslgZH9P0c65JXOAnee/t6RXvtIIfRXdLfgARlImr0Aokn6qiM8cLGzcxouNrQufLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=HyYLdWRp; arc=none smtp.client-ip=80.12.242.76
Received: from fedora.home ([10.65.86.62])
	by smtp.orange.fr with ESMTP
	id axzKwQVqV6IfCaxzKwA30U; Sat, 20 Jun 2026 17:52:06 +0200
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPSA
	id axzCwJbFbh60QaxzCwk1d7; Sat, 20 Jun 2026 17:51:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1781970719;
	bh=clyj+pT0zN+FO15mH2DHnvQ8wKstBkA0B+plIW/cCP0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=HyYLdWRpeCrMBNNgXPRvE+wAS0DNQNa5GFICqoHBckTAk5Eneqs4AJy+q4SzTK5Ep
	 TRth8as7uAo52b1GEj9FMv8DLXOktH9kEoN76bpoHy8jOCsw0iOJJDX86KPobNMqsv
	 dPkJLl3/NiuGXAG7IhHTDIsdaEUFWHXhWrJNfMeZfmeM/dR1ABx28WG8NPtvGBQRz7
	 11s9rDQC4lcNVUDN2eVmkb3ewstaLqlRqXpJu4po2nZJQt4ttNf/4pvk1+rIjoNFzl
	 Yu2MvRSX0T6t6maz3p+vkpjaVbxr03oB51NJmoxGtXh0ykWWr/rcaJhvTmkNWPZ8vQ
	 CAl1S42FRjYsA==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 20 Jun 2026 17:51:59 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-leds@vger.kernel.org
Subject: [PATCH] leds: lp5860: Fix a potential double-unlock
Date: Sat, 20 Jun 2026 17:51:53 +0200
Message-ID: <0f4d556e0532bfa881d7d83c1e244572117a89e3.1781970674.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[wanadoo.fr,quarantine];
	R_DKIM_ALLOW(-0.20)[wanadoo.fr:s=t20230301];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,wanadoo.fr];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-8690-lists,linux-leds=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:s.trumtrar@pengutronix.de,m:linux-kernel@vger.kernel.org,m:kernel-janitors@vger.kernel.org,m:christophe.jaillet@wanadoo.fr,m:linux-leds@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[christophe.jaillet@wanadoo.fr,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[wanadoo.fr:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[wanadoo.fr];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christophe.jaillet@wanadoo.fr,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 428716A9285

In lp5860_device_init(), if lp5860_init_dt() fails, an already unlocked
mutex is unlocked another time.

Slightly rework how the lock is taken/released to avoid this potential
double unlock.

Fixes: f0a66563aa2d ("leds: Add support for TI LP5860 LED driver chip")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only
---
 drivers/leds/rgb/leds-lp5860-core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/leds/rgb/leds-lp5860-core.c b/drivers/leds/rgb/leds-lp5860-core.c
index fd0e2f6e6e0f..e21d5f2302be 100644
--- a/drivers/leds/rgb/leds-lp5860-core.c
+++ b/drivers/leds/rgb/leds-lp5860-core.c
@@ -204,9 +204,9 @@ int lp5860_device_init(struct device *dev)
 	mutex_lock(&lp->lock);
 	ret = regmap_update_bits(lp->regmap, LP5860_REG_DEV_INITIAL, LP5860_MODE_MASK,
 				 LP5860_MODE_1 << LP5860_MODE_SHIFT);
+	mutex_unlock(&lp->lock);
 	if (ret)
 		goto err_disable;
-	mutex_unlock(&lp->lock);
 
 	ret = lp5860_init_dt(lp);
 	if (ret)
@@ -215,7 +215,6 @@ int lp5860_device_init(struct device *dev)
 	return 0;
 
 err_disable:
-	mutex_unlock(&lp->lock);
 	lp5860_chip_enable(lp, LP5860_CHIP_DISABLE);
 	return ret;
 }
-- 
2.54.0


