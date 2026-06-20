Return-Path: <linux-leds+bounces-8691-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1NS5FnK4Nmo+DwcAu9opvQ
	(envelope-from <linux-leds+bounces-8691-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 20 Jun 2026 17:57:38 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 992016A92C9
	for <lists+linux-leds@lfdr.de>; Sat, 20 Jun 2026 17:57:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=wanadoo.fr header.s=t20230301 header.b="Sto0fy4/";
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8691-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8691-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=wanadoo.fr;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A52F302E79C
	for <lists+linux-leds@lfdr.de>; Sat, 20 Jun 2026 15:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C960D399374;
	Sat, 20 Jun 2026 15:54:47 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-69.smtpout.orange.fr [80.12.242.69])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAB03438A8;
	Sat, 20 Jun 2026 15:54:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781970887; cv=none; b=HHxLGW0yBKU1CNk1+v2KaqvUjcpvZVjnE41vMJVDK/ODZGpg8WlcM7wqANLZKJqSC7BK7jjp+/sz0qpDA8OSpyj/LsH4Oq8zcGNyNvGzjIbLbIso87mpWaukmNQO9ZFLwkPFZoMp1fVzg5Kuuwvs3u/CgkQLO3UIef/Hu4PPQXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781970887; c=relaxed/simple;
	bh=7tIj2xW0kosKmoTcSgo+1Azc36QEZJzTwF0ZXZUcJ1A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K1dJzcwhOluXiQRhIHuxyQNPdTBsyHNndeVx5cbRKo51pFHINbyLC6cVSnzpEPR5Fysb2xsFPoff9c0u6OKjPQ9urFK04b8s1T6le+9CA+r+pim+Na3nWpXiCbhjkHQoMgYZ2XId8tSjqSWodA1E7j97zrAtCQEFpxanNQWqVDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=Sto0fy4/; arc=none smtp.client-ip=80.12.242.69
Received: from fedora.home ([10.65.86.61])
	by smtp.orange.fr with ESMTP
	id ay0jwYCZ5Q7VLay0jw8mxZ; Sat, 20 Jun 2026 17:53:33 +0200
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPSA
	id ay0bwUj7kB0pEay0bwfDTU; Sat, 20 Jun 2026 17:53:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1781970806;
	bh=xX8dePqxT2OHQVyDVdmzeKFQf8N3OwaMA7ISaU6XSXM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Sto0fy4/R5Riz1fL+Vc7NVeJvenF1PwnSIHR5yEJogY7XAraHiIUlXEd0bwGaEc8u
	 bt0ESePL86akgOSdVGyjTErNJ+IF4qiZVHnKEQueTtjZ90HM5Fbd0RGF9mp2xliLZ8
	 hPHa0bq+rMv7YIXlVD5bGfaPrHCoGnwKWWg5cIvri0L4BNCb5nu8AE5zap8ukzxx3Y
	 nnli1pPLrGxBZIi3ejcE1L6DaBf4uPCK3GCd9NOf5YCjNXp4eq0ryhrN08xL0Dpx4h
	 xxpglt/LS0QosN81kv947L7pZMY5zI/GM1zoAFOrxUGGEajE4sIJg/ywoVgwIyNGjO
	 +DVjyiwypy6iQ==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 20 Jun 2026 17:53:26 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-leds@vger.kernel.org
Subject: [PATCH] leds: lp5860-spi: Fix an error handling path
Date: Sat, 20 Jun 2026 17:53:22 +0200
Message-ID: <311792e767ab803d4744bc26155e6dac253d9b45.1781970783.git.christophe.jaillet@wanadoo.fr>
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
	TAGGED_FROM(0.00)[bounces-8691-lists,linux-leds=lfdr.de];
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
X-Rspamd-Queue-Id: 992016A92C9

If lp5860_device_init() fails, a missing mutex_destroy() should be called.

Use devm_mutex_init() instead of mutex_init() to fix it.
This also simplifies the remove function.

Fixes: f0a66563aa2d ("leds: Add support for TI LP5860 LED driver chip")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only
---
 drivers/leds/rgb/leds-lp5860-spi.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/rgb/leds-lp5860-spi.c b/drivers/leds/rgb/leds-lp5860-spi.c
index 5e0c44854a68..6bf6a625c28a 100644
--- a/drivers/leds/rgb/leds-lp5860-spi.c
+++ b/drivers/leds/rgb/leds-lp5860-spi.c
@@ -38,6 +38,7 @@ static int lp5860_probe(struct spi_device *spi)
 	struct device *dev = &spi->dev;
 	struct lp5860 *lp5860;
 	unsigned int multi_leds;
+	int ret;
 
 	multi_leds = device_get_child_node_count(dev);
 	if (!multi_leds) {
@@ -61,7 +62,10 @@ static int lp5860_probe(struct spi_device *spi)
 				     "Failed to initialise Regmap.\n");
 
 	lp5860->dev = dev;
-	mutex_init(&lp5860->lock);
+
+	ret = devm_mutex_init(dev, &lp5860->lock);
+	if (ret)
+		return ret;
 
 	spi_set_drvdata(spi, lp5860);
 
@@ -70,10 +74,6 @@ static int lp5860_probe(struct spi_device *spi)
 
 static void lp5860_remove(struct spi_device *spi)
 {
-	struct lp5860 *lp5860 = spi_get_drvdata(spi);
-
-	mutex_destroy(&lp5860->lock);
-
 	lp5860_device_remove(&spi->dev);
 }
 
-- 
2.54.0


