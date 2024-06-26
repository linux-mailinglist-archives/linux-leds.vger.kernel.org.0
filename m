Return-Path: <linux-leds+bounces-2158-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2A8919A7A
	for <lists+linux-leds@lfdr.de>; Thu, 27 Jun 2024 00:15:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 546B1282852
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2024 22:15:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16096194120;
	Wed, 26 Jun 2024 22:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aXkt97e3"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66136192B88;
	Wed, 26 Jun 2024 22:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719440140; cv=none; b=rR5KTp177k2bu5cIR0UISataNu4YTpVBmxpJzAijNrc9VMTY05JARmAdsF6nP2iXclx7yrMSMnjYzJqLkFhlAr4cLGrVwj+Ft3bcLVq6hCpjJjZccBDrxA/izgdgsZtJmxdftcpCuvBybUPDz81MvuAlIbmGcWBm8wLp5VTCNqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719440140; c=relaxed/simple;
	bh=wFDFHqhS3qX5NCIpgbyYbFWvakVs0ekaPkLcrqR777I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q3H3H1SRIYdKB9Z+/ZSNh7NFt/HrhT3PDOJDH+nZO2EPgtSw2AaTWLXpiX2Ci6pJaU0sqjezDb03OO3FYoCOb+FVrtaai9TAzL1xomtkCPOJEVl0rEqkzHZmY6fEGAEOYVwkrbR2lm1+eVXgqKwXEU+BjbFKz62Niq45vMmQDUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aXkt97e3; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-35f2c9e23d3so697754f8f.0;
        Wed, 26 Jun 2024 15:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719440137; x=1720044937; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aiix5Xrz7t/WrX8YaUt6vIhavBZv3X1aF7zRD7XM1HE=;
        b=aXkt97e33IHSe0fXF7ha3jZKiSbrETC4/Dxs9+MsnyfHkdIhL1Ieg0fOALvUT2dJTQ
         2XsA8cOdeSmRMPUhQVwb3wz2r3gQLU5swwybvmyDTA8On9S5azU38ot+phVbe54QQX9U
         vxmmu2kljs7PdTthXRgPBjaA/O4aNnE0p2SLj4DepkPPMbqXKSgaOWxK7wrbRnmYGH6l
         /d1Nshc0ksiuKzZv/dWgFyak969QKTg2souDWtIuNjc/aj2F+7pblGjLeNNTdrWRf6Jh
         Ljuys1mWDZPiv9Y5qHWlqqi3gaGjILN8aWPtM/9N2rG4CtEEsNjaRLJdXJqvLE0flhFJ
         mt5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719440137; x=1720044937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aiix5Xrz7t/WrX8YaUt6vIhavBZv3X1aF7zRD7XM1HE=;
        b=ofsk6lNVLA1KRM2Tw9LFG8c8BuVvYqmUkNCuoiHNmVDqioAqOCuZKAz/HD+lpqn/lA
         CT7Byevlto1tTbzpRALKA3v3xKugAlac2uV+0w9k2qRFk92uQuCxJ6Lfx3djakincHUh
         7nBxqTohTKbAEa/kPQXu4oRo1DekSV+2deVePWDD5NwUHbl3tWmIfdcwqPvjnKWNgidA
         mzVT0gRPQh2YQh0Q+tYWv3lnFtNu30EOckMkGQu9PTUb8eUThLUHIo077d8KpJI7ZlR1
         b1O42RhQYqmegXp+K1pfVsqbTyM1yFmetd9wHJ2XIFErOWErKZmyBrclg7+lInA0p2Ec
         klgA==
X-Forwarded-Encrypted: i=1; AJvYcCVWpBn0DPTnFrOKseTB2a0FNm1280Di4K2psyKMDHDGEIqRWJm0UMr2wruN5jakjRiKe2UyvJOsSlaOyj+valpqg9GksNY4mMkA9kTTXSKmz9n/hi8v1OwLz3BAd/TOHUsbdrlROBz3EA==
X-Gm-Message-State: AOJu0YyNq3GoHvnmomG4Z3vZCLL1OmRjMEmnXTvM5mKY9U+hy6iqGZaE
	cGvU9zasCE0piWQ40f4DBVFTRIc72ZVefwKlnX7AZjc/9gWqw1Hp
X-Google-Smtp-Source: AGHT+IF8L7ntxR7p+85JVF3C8lAvwLmsQbBsn0550zz8rDqdsMrD/08gyhzRrwsKzJSeB1P4N/X6nA==
X-Received: by 2002:a5d:504b:0:b0:35f:fd7:6102 with SMTP id ffacd0b85a97d-3673cc95911mr608018f8f.35.1719440136724;
        Wed, 26 Jun 2024 15:15:36 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3674357c100sm39283f8f.21.2024.06.26.15.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 15:15:36 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 2/3] leds: leds-lp5523: Convert to sysfs_emit API
Date: Thu, 27 Jun 2024 00:15:12 +0200
Message-ID: <20240626221520.2846-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240626221520.2846-1-ansuelsmth@gmail.com>
References: <20240626221520.2846-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert sprintf to the much safer sysfs_emit API to handle output for
sysfs.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/leds/leds-lp5523.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
index 57df920192d2..095060533d1a 100644
--- a/drivers/leds/leds-lp5523.c
+++ b/drivers/leds/leds-lp5523.c
@@ -245,8 +245,8 @@ static ssize_t lp5523_selftest(struct device *dev,
 			goto fail;
 
 		if (adc >= vdd || adc < LP5523_ADC_SHORTCIRC_LIM)
-			pos += sprintf(buf + pos, "LED %d FAIL\n",
-				       led->chan_nr);
+			pos += sysfs_emit_at(buf, pos, "LED %d FAIL\n",
+					     led->chan_nr);
 
 		lp55xx_write(chip, LP5523_REG_LED_PWM_BASE + led->chan_nr,
 			     0x00);
@@ -257,10 +257,10 @@ static ssize_t lp5523_selftest(struct device *dev,
 		led++;
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


