Return-Path: <linux-leds+bounces-1589-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C24048BBF8F
	for <lists+linux-leds@lfdr.de>; Sun,  5 May 2024 09:03:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8268B281220
	for <lists+linux-leds@lfdr.de>; Sun,  5 May 2024 07:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E542567F;
	Sun,  5 May 2024 07:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="VtxyHnJG"
X-Original-To: linux-leds@vger.kernel.org
Received: from msa.smtpout.orange.fr (smtp-73.smtpout.orange.fr [80.12.242.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDB263A5;
	Sun,  5 May 2024 07:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714892634; cv=none; b=AN0A3jiCB6I1Ew3LSSOG5cFNDWg/H+4bi79ACAvZfuaAKlztuFaHHxnauAh1PiGlOVySm4BWe8haO6qkk6VYmQM55ikl82ldLg2vgioOdce583PTRQ2iWd6UfDyHx4rPEeBCbsv2mqAYd3j8+rOnEVnvV+5aqbSmkUpH+anNABg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714892634; c=relaxed/simple;
	bh=f/q3nMrO7XMwlLCGTSws8gHkh4NhAd0ArKeiJmSJAQM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aUaHXVvoISL5wMvNdC+3Z+xFRWkJRDQSS5SU6YGelCVeOUbmHMLpNnCt4isJ1oi2U254oD15CW75v6fVjYssUyfWYlYWU61YpVjUhusPVfBW5T0AJ0wv+K6o4wmwsugELXame0CHGMZYybSSWYO6WqmXfVQc7jnHhOogKAP/D5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=VtxyHnJG; arc=none smtp.client-ip=80.12.242.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from localhost.localdomain ([86.243.17.157])
	by smtp.orange.fr with ESMTPA
	id 3VuNsRaqlrs7M3VuNs9A6s; Sun, 05 May 2024 09:03:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1714892623;
	bh=DBQKhsJ4mDyVp3IvupeuQ5SJkA9A1uQpu4XWLEOftUw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=VtxyHnJGWGr3j8fB3UR8kqOOrgCuE3V6JuhSjgtXTc14Mz7o+9p4tkmSeJTAnMqkw
	 kD02vNCyo3vtFwja0JsGNQ5GQocOxIFDoK4TwM59FD+o/3UMsRy8kYBfRA5crpxam4
	 u0u8/2SM/6afGWWcCqpxoaRcdB0iIahCaNOinE0Gtjqga7y+I+i6h439I5RwqfUAO2
	 qQWcPi1UXuhwmkkHfjdj9t4z9zS+GY7Amnf+ec3D4wRzvmi/JjYzN0LiFQC8z9RO6o
	 NNKpxSp1pGtKcN4uqMoEkeAIhPUolss/Qbf5fsAcPzGFoE+SCLlr85EJtbdLNxbH08
	 0Gqk7e2SmbgDA==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 05 May 2024 09:03:43 +0200
X-ME-IP: 86.243.17.157
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-leds@vger.kernel.org
Subject: [PATCH] leds: is31fl319x: Constify struct regmap_config
Date: Sun,  5 May 2024 09:03:32 +0200
Message-ID: <82a5cb26ff8af1865a790286bdbc3c4a2bd149f1.1714892598.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'is31fl3190_regmap_config' and 'is31fl3196_regmap_config' are not modified
in this diver and are only used as a const struct regmap_config.

Constifying these structures moves some data to a read-only section, so
increase overall security.

On a x86_64, with allmodconfig:
Before:
   text	   data	    bss	    dec	    hex	filename
  13827	   2002	     32	  15861	   3df5	drivers/leds/leds-is31fl319x.o

After:
   text	   data	    bss	    dec	    hex	filename
  14467	   1370	     32	  15869	   3dfd	drivers/leds/leds-is31fl319x.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/leds/leds-is31fl319x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-is31fl319x.c b/drivers/leds/leds-is31fl319x.c
index 66c65741202e..5e1a4d39a107 100644
--- a/drivers/leds/leds-is31fl319x.c
+++ b/drivers/leds/leds-is31fl319x.c
@@ -140,7 +140,7 @@ static const struct reg_default is31fl3190_reg_defaults[] = {
 	{ IS31FL3190_PWM(2), 0x00 },
 };
 
-static struct regmap_config is31fl3190_regmap_config = {
+static const struct regmap_config is31fl3190_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
 	.max_register = IS31FL3190_RESET,
@@ -178,7 +178,7 @@ static const struct reg_default is31fl3196_reg_defaults[] = {
 	{ IS31FL3196_PWM(8), 0x00 },
 };
 
-static struct regmap_config is31fl3196_regmap_config = {
+static const struct regmap_config is31fl3196_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
 	.max_register = IS31FL3196_REG_CNT,
-- 
2.45.0


