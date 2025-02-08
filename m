Return-Path: <linux-leds+bounces-3898-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65336A2D75C
	for <lists+linux-leds@lfdr.de>; Sat,  8 Feb 2025 17:30:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C835A3A4380
	for <lists+linux-leds@lfdr.de>; Sat,  8 Feb 2025 16:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C56B2451CF;
	Sat,  8 Feb 2025 16:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="km/7xp1c"
X-Original-To: linux-leds@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647CB190058;
	Sat,  8 Feb 2025 16:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739032225; cv=none; b=Mh0+DrrBBCUr60LM9+Cn8nfqhjcX6ky8nYjtRsCfuiJLgKjJqssp/+2/hKmtQbiFWnI6kOdd1MdySxQUiR0+9KkvukUsfkzmmyneNxSdB85HzENT9bxqvws53r2q25xsEOE4mL173aueluJUBPVq9RF6YlazuDx60oMbGBVQ6e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739032225; c=relaxed/simple;
	bh=sYRKMT0vGlnOGYLve/adGBTos+uJOf24RZ51165VgKE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HO8zrZBRCLHdeO3pfRG3/FbFnfVxHCXutO3ggqLn+osQl0m43BEvCywj5xt9DeUN3QY4bK1DHc1Ri9WD9WS9uRuL6vQVcsBEcqZc6lGTHbrUwfo3kBC/jKzkAm3+5M5fyfme6mhRbsh3r3xUmIsrguMsgCiJkX9IJQkULZaI6o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=km/7xp1c; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1739032220;
	bh=sYRKMT0vGlnOGYLve/adGBTos+uJOf24RZ51165VgKE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=km/7xp1cFfR9NSoY3z5kaC7HUs+YiojI38gCnAIjepfiDD5je2niXMa5Uk91s3jT2
	 4QAVe8BxZ2DXtcg1Jmb3Hi/pXqYV2gZ/db0/S33OcZZxzEX1qo1H/tcKcxgl8mGq85
	 iv/izZHLtsR+bebZ5A7VEgKVvJGalr7f5CbjY6/s=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sat, 08 Feb 2025 17:30:03 +0100
Subject: [PATCH v3 1/2] leds: st1202: Check for error code from
 devm_mutex_init() call
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250208-must_check-devm_mutex_init-v3-1-245e417dcc9e@weissschuh.net>
References: <20250208-must_check-devm_mutex_init-v3-0-245e417dcc9e@weissschuh.net>
In-Reply-To: <20250208-must_check-devm_mutex_init-v3-0-245e417dcc9e@weissschuh.net>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Lee Jones <lee@kernel.org>, 
 Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739032220; l=973;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=sYRKMT0vGlnOGYLve/adGBTos+uJOf24RZ51165VgKE=;
 b=tQeWG+KIeTmjQPrjsXBwafB/SalYFnXx5cABMiVr33xT+6nAHRklD75bDSCkD43a+Y4cqIuC6
 PvhnuU0fibKCn8ioaqcZ8g0yqpxsAgD7+UmQH4JFxn+0KAwoGHXuNkh
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Even if it's not critical, the avoidance of checking the error code
from devm_mutex_init() call today diminishes the point of using devm
variant of it. Tomorrow it may even leak something. Add the missed
check.

Fixes: 259230378c65 ("leds: Add LED1202 I2C driver")
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/leds/leds-st1202.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index b691c4886993f3e371e857543863c9a724742f39..657c62cb24fa726622369fc965fa7195e73170f0 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -356,7 +356,9 @@ static int st1202_probe(struct i2c_client *client)
 	if (!chip)
 		return -ENOMEM;
 
-	devm_mutex_init(&client->dev, &chip->lock);
+	ret = devm_mutex_init(&client->dev, &chip->lock);
+	if (ret < 0)
+		return ret;
 	chip->client = client;
 
 	ret = st1202_dt_init(chip);

-- 
2.48.1


