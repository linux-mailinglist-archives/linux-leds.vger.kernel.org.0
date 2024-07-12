Return-Path: <linux-leds+bounces-2272-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 285F592F32C
	for <lists+linux-leds@lfdr.de>; Fri, 12 Jul 2024 02:46:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7A722827AF
	for <lists+linux-leds@lfdr.de>; Fri, 12 Jul 2024 00:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AB51539A;
	Fri, 12 Jul 2024 00:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SFBbOVup"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A97B1FB4;
	Fri, 12 Jul 2024 00:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720745170; cv=none; b=JZ0Zn3ubFr/FrTlCpCPRJphn6qpCXpVfzs4A6428yg9oxwkre6YQYQ+UiCc6dt3PHPnoj+SSbK+vIZ21ov86QYS3mfRwbhm4zjgekeyou5QPOlt5EiGIZsPjQZk1npdTtfkgO0/3cSW/6zl8E/FITvR6Jv+WQhcbvb9T4mFbEuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720745170; c=relaxed/simple;
	bh=Ft+bULkOvKpiRslAqGbnPlImeK31vypsXjE1hv7OKq4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bBdHFHGMNNkKafzi/Pns9ovtnhm2ZRkViXw13vO8RHmQqGee1PZDW59HAP19q3L1XAE3NgZSiRqzkzQd7BDGkg+EW1SZKGFMf3qH3MDoh7L67XONXwdulq/4X9jOmWpevr6ij/o86u3v4u1DSiNHxSCFrxL4NtsmM6TgFB3idn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SFBbOVup; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-36796d2e5a9so886188f8f.3;
        Thu, 11 Jul 2024 17:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720745167; x=1721349967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LCAi0flqUXL4Me7fS5qTgsqEBR3RQCY28CC7AMIpeIo=;
        b=SFBbOVupiy1N3E+uZYtPsUQbuPUnfZGEmov4Xz5l3u0wVe6Oc53DMVTaUCCgnzvMGZ
         qTz8DrGwx52pdAdRCORFX/01nnAJZRHrzkysNPAippGZ7wd+cdzJ6p8D7XlhKaGFgfwp
         7NL3On06HCm0jhPC+678MdcjR44QLfcR2mcLLceAgolgYyyNtnhj4B/KXM9jJrCmh5bX
         T+3w5rUFVcRqaALaQZo7ivwvRRKXk9LW6WwfheDGaiin7PHMSCkL+KFGd0AFVJu7O4M9
         WX8OkozdPHDXY22Lmu4dAC8dPz2YIBZoYvfcnCr3dH+zIJSC6i+qwelm6Azxc325tyHv
         6PqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720745167; x=1721349967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LCAi0flqUXL4Me7fS5qTgsqEBR3RQCY28CC7AMIpeIo=;
        b=RatjyKnlT8hyV9QpB0BWS8nCWBWegq48VabDs9JEXXdYGiO+iS0sVXbI/ut2Bx+5/o
         K3XwHsEESyZLMq0nco9EtuKcAZuqh452V5/KjQ3X31DP7U4LozLoGGWIQUUTS6L5PQGs
         ugA0CggiML5B9NBB0HWT7ilL2hc3ypEHc5H45ve0vKz1Lwx0bAh/M+9LRTqrc0+QDYWY
         ozyZOGrzjPiRGgHesTU6TPtly7uuXDGEi8AmXUKAKcQxtk+BFLMur00HHpN5B/YGyo/N
         YdFYngOVX/39eUJvQ9leHIzww/0OPJNkLC51xHSc9pi2SQmMQMlkDU05/KwLzciHaNca
         anIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkOTQAPItqQrPCWk6lk8qjG1x+W1k8rQYGioqODN20/gzpKqmQlzAka9vpOjUd67dnSjBmhgerxM9y2pOw81IZXUaPUPkah+TTXHaVUonqUO2vo9tjp4gvNrcNsTK+iGgDRxq4vTU9UA==
X-Gm-Message-State: AOJu0YyJTXEyN+glB7HkNXutk6t/MAx2plc5v6gs0eRHNMnSgFNO3tBN
	u0eCjjHgH++/AGwULiJ8Yp0iDCddedEodetO0Cr7UggplGskXsYk
X-Google-Smtp-Source: AGHT+IGhH5ZObszahXfY8XRZStAXraA1V7saFQ8UWc4MVfpTFFdf0jmqGFShOad5iuHdvMHAzgjdFA==
X-Received: by 2002:adf:f648:0:b0:367:918e:a106 with SMTP id ffacd0b85a97d-367cead9226mr6301569f8f.59.1720745166809;
        Thu, 11 Jul 2024 17:46:06 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-367f1990dd5sm3118803f8f.105.2024.07.11.17.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 17:46:06 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v2 3/3] leds: leds-lp5569: Enable chip after chip configuration
Date: Fri, 12 Jul 2024 02:45:54 +0200
Message-ID: <20240712004556.15601-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240712004556.15601-1-ansuelsmth@gmail.com>
References: <20240712004556.15601-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Documentation say that clock internal config needs to be set BEFORE chip
is enabled. Align code to this and move the CHIP enable after the CHIP
is configured.

While at it also make use of STATUS reg and check when STARTUP is
completed instead of sleep for 1-2 ms.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
Changes v2:
- Fix compilation warning (u8 instead of int)

 drivers/leds/leds-lp5569.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/leds/leds-lp5569.c b/drivers/leds/leds-lp5569.c
index 2b4f358bc63a..313dbf80ddec 100644
--- a/drivers/leds/leds-lp5569.c
+++ b/drivers/leds/leds-lp5569.c
@@ -7,6 +7,7 @@
 #include <linux/delay.h>
 #include <linux/firmware.h>
 #include <linux/i2c.h>
+#include <linux/iopoll.h>
 #include <linux/leds.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
@@ -91,6 +92,8 @@
 #define LP5569_ENG2_MUX_ADDR		0xd0
 #define LP5569_ENG3_MUX_ADDR		0xe0
 
+#define LP5569_STARTUP_SLEEP		500
+
 #define LEDn_STATUS_FAULT(n, status)	((status) >> (n) & BIT(0))
 
 #define LP5569_DEFAULT_CONFIG \
@@ -168,14 +171,7 @@ static int lp5569_init_program_engine(struct lp55xx_chip *chip)
 static int lp5569_post_init_device(struct lp55xx_chip *chip)
 {
 	int ret;
-	int val;
-
-	ret = lp55xx_write(chip, LP5569_REG_ENABLE, LP5569_ENABLE);
-	if (ret)
-		return ret;
-
-	/* Chip startup time is 500 us, 1 - 2 ms gives some margin */
-	usleep_range(1000, 2000);
+	u8 val;
 
 	val = LP5569_DEFAULT_CONFIG;
 	val |= FIELD_PREP(LP5569_CP_MODE_MASK, chip->pdata->charge_pump_mode);
@@ -198,6 +194,13 @@ static int lp5569_post_init_device(struct lp55xx_chip *chip)
 			return ret;
 	}
 
+	ret = lp55xx_write(chip, LP5569_REG_ENABLE, LP5569_ENABLE);
+	if (ret)
+		return ret;
+
+	read_poll_timeout(lp55xx_read, ret, !(val & LP5569_STARTUP_BUSY),
+			  LP5569_STARTUP_SLEEP, LP5569_STARTUP_SLEEP * 10, false,
+			  chip, LP5569_REG_STATUS, &val);
 
 	return lp5569_init_program_engine(chip);
 }
-- 
2.45.2


