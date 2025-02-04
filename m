Return-Path: <linux-leds+bounces-3873-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F16A26C46
	for <lists+linux-leds@lfdr.de>; Tue,  4 Feb 2025 07:53:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECA193A585A
	for <lists+linux-leds@lfdr.de>; Tue,  4 Feb 2025 06:53:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F36262036F0;
	Tue,  4 Feb 2025 06:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="ZLF6CSVA"
X-Original-To: linux-leds@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0258816BE17;
	Tue,  4 Feb 2025 06:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738651993; cv=none; b=OVUq9p24URV4bMUWSnRq3mM1ZbpcJiTLTpoMEG1RVrYnt1sIzrUlSY0eAz9UyDFNPTZM6Qp9+M88voAxkyfM8V5JBSAifitdrpdFLNhsUq35ZKl15i/lweLNUvY0RbDS5bceEhSq7igOSUs+nEQsjouFq7/CS/+ol0d3PfxgIhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738651993; c=relaxed/simple;
	bh=sYRKMT0vGlnOGYLve/adGBTos+uJOf24RZ51165VgKE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qG2nxmZoKujusT67VkrrDAFozE6XyjAQr8UGydEQ5M7ZNVIV0BLe3YFdSLm6LxE1lMdPxqerq2VVY03GRNdurL57pzqSoABjf+j4rDzMDBd+fpcnG+cE5kp3534fbNEpOobWkcO/mp37HmzrDoNvDZMl0GHID2sG0Diqc3wgEeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=ZLF6CSVA; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1738651982;
	bh=sYRKMT0vGlnOGYLve/adGBTos+uJOf24RZ51165VgKE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZLF6CSVACWXYy+Esknet3ODkwPrxzWw/eJwyUeSRyKtxaLJnzxI1T6IeO+No4o0ot
	 l+7cLhJPIfQn2xuq6iwU91mY6tVvDtlXEFZ0VBB4zNjdYGyBSsT9rFfxOYYjBecw/j
	 TxLh1ZPwLCujuGzMwKV63KpKNcS3vSFfHzK0q8UQ=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 04 Feb 2025 07:52:50 +0100
Subject: [PATCH v2 1/2] leds: st1202: Check for error code from
 devm_mutex_init() call
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250204-must_check-devm_mutex_init-v2-1-7b6271c4b7e6@weissschuh.net>
References: <20250204-must_check-devm_mutex_init-v2-0-7b6271c4b7e6@weissschuh.net>
In-Reply-To: <20250204-must_check-devm_mutex_init-v2-0-7b6271c4b7e6@weissschuh.net>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Lee Jones <lee@kernel.org>, 
 Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738651981; l=973;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=sYRKMT0vGlnOGYLve/adGBTos+uJOf24RZ51165VgKE=;
 b=ZKu2+Is87sBlN/1FxwqGQQFr+m0U8xrC5C1xUiMhDg2rzhcfw+iLKfKwzsLVVH6Oq+Y6jTsul
 uQA4EbqYWiIDIQNCC7PmzAjkhTbSdUKOoNfBrtzhEP8V8rQjeT9mes1
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


