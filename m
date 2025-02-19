Return-Path: <linux-leds+bounces-4004-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4262A3C605
	for <lists+linux-leds@lfdr.de>; Wed, 19 Feb 2025 18:21:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF8F83A8508
	for <lists+linux-leds@lfdr.de>; Wed, 19 Feb 2025 17:21:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AA231FDE01;
	Wed, 19 Feb 2025 17:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="Oec9H/gA"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-19.smtpout.orange.fr [80.12.242.19])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AB8286284;
	Wed, 19 Feb 2025 17:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739985701; cv=none; b=HMC2di0GF4pYYw792aHM2oe/WprrjXffyHDNB2jdtPa18JtgXhomNJts/G+WDuZD4kKXWpp76NxIXdC0WrxN8okC+708ltKuvCHjNSBQuqs01H4X/YB9mCDhrD81k83AUpSgek6l3dJViqtrJ8xTiYIcv9Hf2Wuch11ryLOKyQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739985701; c=relaxed/simple;
	bh=1Me3lu0fX9NUSPq+Ggrr4DEAwkU4l3ce4Mld2GXKtg0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BYce3WBAjfXjpI+8r0FQv3NDprBDJIBahSS0rVG0rhUh1ZcE5qvw0X4IACDsTW/fueh4hT1DG5xW8fiVqjUn9bSLwnTTJlVQrvji0/MCnREvKN7UFzntUJVkWGY3qCxzZfITm6+UkZReUgkUHEVIV5rFVUzHebpZ4LqMw9imMtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=Oec9H/gA; arc=none smtp.client-ip=80.12.242.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id knkEt082zsC0pknkHtl0HU; Wed, 19 Feb 2025 18:20:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1739985626;
	bh=QW6x6Fz8XX5peZDa2MJO8SZhs7Tp8RyNuh/Nt9PBXRE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Oec9H/gAZMMuSXgE68f9B/TYvkhyYCZxwWie6NgYFH0TjbLCByUDa3Vx7BDcXSPgF
	 HSoZn/z6jWtYw9sMKm1BuxGRC70Bw93hdBbF5yrprmV4/nZrGU6bVCmedccal8JVOk
	 W7CK8OP7Qxpd750ShNiWHS5aQNGyaNrKB4LboofPf8Rk8rIpVfVhaxITnBgpD++Iy1
	 CDClym/uMUSGPmXEEoWxJAYGzU/jbSyLJUsIYfN93078Way/gUF0RfQj6WMDB0vJcT
	 EkNcj8b3Nif4ctnAPHE2N0b1GLTcRonx498ixCGMm9fyuUP+SQwA2fmrciBnELr9s9
	 bM59H7wDOfXnQ==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 19 Feb 2025 18:20:26 +0100
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-leds@vger.kernel.org
Subject: [PATCH] leds: st1202: Fix an error handling path in st1202_probe()
Date: Wed, 19 Feb 2025 18:20:20 +0100
Message-ID: <4afa457713874729eb61eec533a4674a51d1d242.1739985599.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

devm_mutex_init() may return -ENOMEM.
So this error should be handled in st1202_probe().

Fixes: 259230378c65 ("leds: Add LED1202 I2C driver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/leds/leds-st1202.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index b691c4886993..4fc17d518292 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -356,7 +356,10 @@ static int st1202_probe(struct i2c_client *client)
 	if (!chip)
 		return -ENOMEM;
 
-	devm_mutex_init(&client->dev, &chip->lock);
+	ret = devm_mutex_init(&client->dev, &chip->lock);
+	if (ret < 0)
+		return ret;
+
 	chip->client = client;
 
 	ret = st1202_dt_init(chip);
-- 
2.48.1


