Return-Path: <linux-leds+bounces-5671-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CEDBC509E
	for <lists+linux-leds@lfdr.de>; Wed, 08 Oct 2025 14:57:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2683019E3E83
	for <lists+linux-leds@lfdr.de>; Wed,  8 Oct 2025 12:57:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB4C426657B;
	Wed,  8 Oct 2025 12:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=klarinett.li header.i=@klarinett.li header.b="vN4sZAug"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.hostpark.net (mail.hostpark.net [212.243.197.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7D925782A;
	Wed,  8 Oct 2025 12:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.243.197.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759928159; cv=none; b=E/TyqjVwL9wbg0v57mhB0qTN2FmPKXb+r27jLy28QmPEdBBOLXjiqMWX7PLjXcB5GMNR0UaUKKgvKBf/MdbVzIuI/p+BuS0Zgh4whNkYzaACK8sXPiJ3yYwSA5UR6udm46BotnaB/OIR6GioR0s/feiPaPDcp9u5yLQElI/wjBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759928159; c=relaxed/simple;
	bh=pDfzvHYumkVNgP6Bt5JPh8DBBBEuka+mLIWH3ZAsB2o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=atA1fIAKvaQfHKmII73F+aOD4yiA1yl1QixHJkAqivOOtZGiYZPzAOjnht0HJx0sRmB/dSljp6jn2WDGXqHGLpZEUZjMoXKZhTpvyR7fT7xcM62fLGuACDq+IGEoUq1QdIY/r9CiYQRcsMIOJ7QEd/jRc3BnLEj8LWd7KheoLe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=klarinett.li; spf=pass smtp.mailfrom=klarinett.li; dkim=pass (1024-bit key) header.d=klarinett.li header.i=@klarinett.li header.b=vN4sZAug; arc=none smtp.client-ip=212.243.197.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=klarinett.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=klarinett.li
Received: from localhost (localhost [127.0.0.1])
	by mail.hostpark.net (Postfix) with ESMTP id 308291626A;
	Wed, 08 Oct 2025 14:50:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=klarinett.li; h=
	content-transfer-encoding:mime-version:x-mailer:message-id:date
	:date:subject:subject:from:from; s=sel2011a; t=1759927814; bh=pD
	fzvHYumkVNgP6Bt5JPh8DBBBEuka+mLIWH3ZAsB2o=; b=vN4sZAugpzoz2+uT9T
	8IQQnCxYyVpNNcNZ/bHq6PufnqkdwfRGcnYiI2QqQ1LcqvwuHvJQ/IZpGwu+hbz7
	3rg4ZlwUuy5b6whf62mh0qTBWHHPB6RX8qoU+7KdKZEOtGba8vopOOpokFDceugm
	pDvu3FH+YefZAU1EU98quYmXg=
X-Virus-Scanned: by Hostpark/NetZone Mailprotection at hostpark.net
Received: from mail.hostpark.net ([127.0.0.1])
 by localhost (mail1.hostpark.net [127.0.0.1]) (amavis, port 10224) with ESMTP
 id a5dJLw3_iP49; Wed,  8 Oct 2025 14:50:14 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.hostpark.net (Postfix) with ESMTPSA id A3E951614C;
	Wed, 08 Oct 2025 14:50:13 +0200 (CEST)
From: Christian Hitz <christian@klarinett.li>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Christian Hitz <christian.hitz@bbv.ch>,
	stable@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] leds: leds-lp50xx: allow LED 0 to be added to module bank
Date: Wed,  8 Oct 2025 14:32:21 +0200
Message-ID: <20251008123222.1117331-1-christian@klarinett.li>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Christian Hitz <christian.hitz@bbv.ch>

led_banks contains LED module number(s) that should be grouped into the
module bank. led_banks is 0-initialized.
By checking the led_banks entries for 0, un-set entries are detected.
But a 0-entry also indicates that LED module 0 should be grouped into the
module bank.

By only iterating over the available entries no check for unused entries
is required and LED module 0 can be added to bank.

Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
Cc: stable@vger.kernel.org
---
 drivers/leds/leds-lp50xx.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
index 94f8ef6b482c..d50c7f3e8f99 100644
--- a/drivers/leds/leds-lp50xx.c
+++ b/drivers/leds/leds-lp50xx.c
@@ -341,17 +341,15 @@ static int lp50xx_brightness_set(struct led_classdev *cdev,
 	return ret;
 }
 
-static int lp50xx_set_banks(struct lp50xx *priv, u32 led_banks[])
+static int lp50xx_set_banks(struct lp50xx *priv, u32 led_banks[], int num_leds)
 {
 	u8 led_config_lo, led_config_hi;
 	u32 bank_enable_mask = 0;
 	int ret;
 	int i;
 
-	for (i = 0; i < priv->chip_info->max_modules; i++) {
-		if (led_banks[i])
-			bank_enable_mask |= (1 << led_banks[i]);
-	}
+	for (i = 0; i < num_leds; i++)
+		bank_enable_mask |= (1 << led_banks[i]);
 
 	led_config_lo = bank_enable_mask;
 	led_config_hi = bank_enable_mask >> 8;
@@ -405,7 +403,7 @@ static int lp50xx_probe_leds(struct fwnode_handle *child, struct lp50xx *priv,
 			return ret;
 		}
 
-		ret = lp50xx_set_banks(priv, led_banks);
+		ret = lp50xx_set_banks(priv, led_banks, num_leds);
 		if (ret) {
 			dev_err(priv->dev, "Cannot setup banked LEDs\n");
 			return ret;
-- 
2.51.0


