Return-Path: <linux-leds+bounces-2157-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F28BE919A7B
	for <lists+linux-leds@lfdr.de>; Thu, 27 Jun 2024 00:15:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7DD72B22C6D
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2024 22:15:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A11E41940B2;
	Wed, 26 Jun 2024 22:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JXoO8CRX"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB0318C359;
	Wed, 26 Jun 2024 22:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719440139; cv=none; b=OSTyJGc8Kn3JX6fcD7uiWWqyaX0X/T9DzOBbbvh0FBDwAy0iyHS4gZ3EGd61qf2qxs+kvC7kQa1lFDG5Dcf3eD+g6TRTgmor7eWGo0dFEQQUUoOFMoqqUflhkpg36UO4mtiwgfs+PdMunAf12EF8I6MEvHo3RL1AXXNQylixFj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719440139; c=relaxed/simple;
	bh=RXBdILgDC90ocBfwyY5fxERS674LRoG10dOB+6UhB5s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bqzkt8fixnARFhBPC8aRTGgSIBh7+IMiO4ARgki7A1UA0cpJLFvzv+FyAVK/37987DruKvoJVPC8XCVC8GFmWjnDZdI2qwvk23aYiat2ZEcu93byTjK6NAezodYdUGPuzdjKu8wg6uuJk8jogjZInI1zhPctYj0tpxU1be4QGPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JXoO8CRX; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-362b32fbb3bso4638907f8f.2;
        Wed, 26 Jun 2024 15:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719440136; x=1720044936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kLTQuTfeMs6giWphiXNYhP8ADsgQDsBUoWfBhccu/sM=;
        b=JXoO8CRXgBkNeBZBkW6xlvZMammJsdpmtnx9qQ8mNclGt6kJ9Ugn93oX8Bimg1ELUQ
         LDObRjGVIKfyzkr/rFG+6gbbb1ays7GhVdH0HhTAjBX/YnbIXUGWuO2jdXgnhb0Bn8w+
         Sdki3gR48uNTnJ/MPvtP6ED9R7gsPA5K4UNZgkRojMgwvuq/iyXK78CBR0I2imIPEKUf
         arL7Gztsszam98Q0uH8dwKS8U3NpNYLTAK2BZGODgXTwISOWV9EQDw9QKLGD2OcQepWG
         LnvuUpMvuwdWgZMd6zxWz4pN6R/VX07pqZb3FKLQPxeOobYZVqh4iLnceDpR9UUqi17w
         2tzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719440136; x=1720044936;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kLTQuTfeMs6giWphiXNYhP8ADsgQDsBUoWfBhccu/sM=;
        b=pz+UHTdHn7jAkrxQJC6TMai3WsShRDMtSvjUiS2jXA8qPYyQZf9sd4mvOTeau9GbFB
         rvJi1oaj9Nfkhd0p3PLHTWAagNcwy5hWwyGJrpCkX/VXn0NT+73KOcOF1AkdxLV13+Jx
         oZtVQkn+p+sUPaI54BlOHBD+3ntNYYLiBD+l9ONjYUBkMQSKGiY5WythVPyxWtei486e
         7AA4/Iq/PgHSHEsj14SLlkpd0z9ZK2SEWxiGyrUDjqDIIYkQLqm34HgTspWwrPENgXF/
         4nTaggUkl0GXfUUbYd8VvJ3rCoZK7mRw/lnotf1w0Qwhp2bYv/dc5GmRYyi5ZyW1p5Ne
         zHMA==
X-Forwarded-Encrypted: i=1; AJvYcCU8Qs8VGE0Gx/bLu0bW1VrKEZXzHpAKYoA3j60MWPMOW7aSzy/2dy0Ujp9vC6cJr7Uc6QvLOmED9dM+cyAbCYALftamf/sWYgPCA5Bka+1cigF7Ii7gn2pPrIXAjXWzR6xOxSGbBHyHyw==
X-Gm-Message-State: AOJu0Yx2iq8REtgkwTtC3974iVki5y+WP3mdtybDOwHrJ/ZKZljRuWRM
	I/3JON4tYaQ5vnpuJh8WrsG+4nMQGjGMLC2L8n/+dBbGIy3c03ee6rZTvA==
X-Google-Smtp-Source: AGHT+IEfnomeJyZ9CS55oJKSbamF/nbdmSjmqEXRswhyH9Ys4tnI4cBY85jfbQ8qzYZ0WYSXfftF3Q==
X-Received: by 2002:adf:fa8e:0:b0:362:8749:9639 with SMTP id ffacd0b85a97d-366e7a373f4mr7792765f8f.35.1719440135963;
        Wed, 26 Jun 2024 15:15:35 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3674357c100sm39283f8f.21.2024.06.26.15.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 15:15:35 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 1/3] leds: leds-lp5569: Convert to sysfs_emit API
Date: Thu, 27 Jun 2024 00:15:11 +0200
Message-ID: <20240626221520.2846-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert sprintf to the much safer sysfs_emit API to handle output for
sysfs.

Also better handle situation where on the same chip there may be LED
open and shorted at the same time.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/leds/leds-lp5569.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/leds/leds-lp5569.c b/drivers/leds/leds-lp5569.c
index 7ccd8dd6026a..e5e7e61c8916 100644
--- a/drivers/leds/leds-lp5569.c
+++ b/drivers/leds/leds-lp5569.c
@@ -268,8 +268,8 @@ static ssize_t lp5569_led_open_test(struct lp55xx_led *led, char *buf)
 	led_tmp = led;
 	for (i = 0; i < pdata->num_channels; i++) {
 		if (leds_fault[led_tmp->chan_nr])
-			pos += sprintf(buf + pos, "LED %d OPEN FAIL\n",
-				       led_tmp->chan_nr);
+			pos += sysfs_emit_at(buf, pos, "LED %d OPEN FAIL\n",
+					     led_tmp->chan_nr);
 
 		led_tmp++;
 	}
@@ -366,8 +366,8 @@ static ssize_t lp5569_led_short_test(struct lp55xx_led *led, char *buf)
 	led_tmp = led;
 	for (i = 0; i < pdata->num_channels; i++) {
 		if (leds_fault[led_tmp->chan_nr])
-			pos += sprintf(buf + pos, "LED %d SHORTED FAIL\n",
-				       led_tmp->chan_nr);
+			pos += sysfs_emit_at(buf, pos, "LED %d SHORTED FAIL\n",
+					     led_tmp->chan_nr);
 
 		led_tmp++;
 	}
@@ -404,7 +404,7 @@ static ssize_t lp5569_selftest(struct device *dev,
 		goto fail;
 
 	/* Test LED Shorted */
-	pos = lp5569_led_short_test(led, buf);
+	pos += lp5569_led_short_test(led, buf);
 	if (pos < 0)
 		goto fail;
 
@@ -420,10 +420,10 @@ static ssize_t lp5569_selftest(struct device *dev,
 	}
 
 	if (pos == 0)
-		pos = sprintf(buf, "OK\n");
+		pos = sysfs_emit(buf, "OK\n");
 	goto release_lock;
 fail:
-	pos = sprintf(buf, "FAIL\n");
+	pos = sysfs_emit(buf, "FAIL\n");
 
 release_lock:
 	mutex_unlock(&chip->lock);
-- 
2.45.1


