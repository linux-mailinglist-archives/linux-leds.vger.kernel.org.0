Return-Path: <linux-leds+bounces-5413-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC93B47A6E
	for <lists+linux-leds@lfdr.de>; Sun,  7 Sep 2025 12:17:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06C6717E4C3
	for <lists+linux-leds@lfdr.de>; Sun,  7 Sep 2025 10:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30AB6221F12;
	Sun,  7 Sep 2025 10:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="rn8DKKPt"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-69.smtpout.orange.fr [80.12.242.69])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8573421CA0D;
	Sun,  7 Sep 2025 10:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757240247; cv=none; b=ifOcFlOm49wJ6Nz/O3ofFoukSvc8sl9d8KkrasE8seNc+qoCpyAzdecp3ksivK8yaySspjFNl6PW6s0YIN38nIv1UcJ9ZVoCLtMrFseTvUj0OSHKrYxLIqO7Eom1JyJCeuRCGffTxPZrPzcRemEV1IURyWOwZYB/9pHrWZmYmTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757240247; c=relaxed/simple;
	bh=VyLQINgFLxfwpG6Ab3GLfcDxtTMx9J9bYm0a0HSvfNo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BL5Q80vPjMdZWQJGcFIvXheqLCKbO3X/D7Jb5Vj1sUY/aQerOLoW3eDS7pvFRthg4uQ4mzmmnHZdXVwf5O3hBYYBfCkXQ5Tvg1ldg5q6etnRBDs04Y5QUINdMvOCIa9YOthwEsBElawT989/ZSmaiVdPS8FCnf9l12YA25O01gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=rn8DKKPt; arc=none smtp.client-ip=80.12.242.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id vCRRuFMYKVnEZvCRRuvdfD; Sun, 07 Sep 2025 12:16:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1757240173;
	bh=/8eo79CGIBKMU4I0nlE/+knG5URcycp+FdSO1C7XFNM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=rn8DKKPtX/W8hBMbom+AY6GhwsLKdpzDO4pbxD8GPEUg7CCHvVq/vW28eidYIANYe
	 EIG9Ow+3n60Q8xeyU+bS698FBWrW28Yilp0UuvTWTJlyzbHmhD7xli5zaibMwwRn6r
	 AXjcQUgFWCGLRh6IsGx4LjbST9ko/pMt33ICNmjcoxBMx7GXNK8xonucqxxVm3LzRW
	 znhtLGqRbAAgMzAfngd7bSXU6J0PDpL1hjNFE5tU/V6IekvGx+72kdhSAFH7qAyhfD
	 24eKgc9EdqcuMwKPbdGZ5tPGu13W7UfRDvj9sIKydcbuFVOWjeKYaqdzh7k//JTkOX
	 DKiNIBD/3PKcg==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 07 Sep 2025 12:16:13 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-leds@vger.kernel.org
Subject: [PATCH] leds: is31fl319x: Use devm_mutex_init()
Date: Sun,  7 Sep 2025 12:16:09 +0200
Message-ID: <267aba6eab12be67c297fcd52fcf45a0856338bb.1757240150.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use devm_mutex_init() instead of hand-writing it.

This saves some LoC, improves readability and saves some space in the
generated .o file.

Before:
======
   text	   data	    bss	    dec	    hex	filename
  20011	   6752	    128	  26891	   690b	drivers/leds/leds-is31fl319x.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  19715	   6680	    128	  26523	   679b	drivers/leds/leds-is31fl319x.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/leds/leds-is31fl319x.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/leds/leds-is31fl319x.c b/drivers/leds/leds-is31fl319x.c
index 27bfab3da479..e411cee06dab 100644
--- a/drivers/leds/leds-is31fl319x.c
+++ b/drivers/leds/leds-is31fl319x.c
@@ -483,11 +483,6 @@ static inline int is31fl3196_db_to_gain(u32 dezibel)
 	return dezibel / IS31FL3196_AUDIO_GAIN_DB_STEP;
 }
 
-static void is31f1319x_mutex_destroy(void *lock)
-{
-	mutex_destroy(lock);
-}
-
 static int is31fl319x_probe(struct i2c_client *client)
 {
 	struct is31fl319x_chip *is31;
@@ -503,8 +498,7 @@ static int is31fl319x_probe(struct i2c_client *client)
 	if (!is31)
 		return -ENOMEM;
 
-	mutex_init(&is31->lock);
-	err = devm_add_action_or_reset(dev, is31f1319x_mutex_destroy, &is31->lock);
+	err = devm_mutex_init(dev, &is31->lock);
 	if (err)
 		return err;
 
-- 
2.51.0


