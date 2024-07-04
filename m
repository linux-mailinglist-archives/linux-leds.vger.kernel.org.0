Return-Path: <linux-leds+bounces-2184-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BCE926D40
	for <lists+linux-leds@lfdr.de>; Thu,  4 Jul 2024 03:56:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A2B131C215D8
	for <lists+linux-leds@lfdr.de>; Thu,  4 Jul 2024 01:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 553A0134B2;
	Thu,  4 Jul 2024 01:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XPTvgmjt"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF01FDDC3;
	Thu,  4 Jul 2024 01:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720058158; cv=none; b=JBAyZI+r++crjH5PHCjOOogTPxCF9caq7sSbc9bqMki8hyVf3iBPiX5FaEtb/1WEASBPGr3lnfI3+Crb2c6dJXXZuyhS09hvsNq5sK2XWdlrcQhzARXnLxyIXK2zoZlId0H2XHM8GUj/tK67bHwcVEziIt4+kJbP9l1w3HIbYBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720058158; c=relaxed/simple;
	bh=PVIcFfRyp6Fo5QfIoi6j67kPrYrGKJv9M1gOZ26CZq0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s8oCdLWJEYdcbxQ4LRbDkxNGHnW7xErhufXgud+3yMWLKWtTFkhBYlrIS4E7MekHkJlYXnBZaLkSjMyrF5BIkWQY98JN65HGg1BlF69wLIDO/VHPlFVH2iWWMRTLQucXNlEGfMj+pNSyEgK4zLQsXWvY3qaxDOJAnBlyh4C1fEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XPTvgmjt; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-361785bfa71so87107f8f.2;
        Wed, 03 Jul 2024 18:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720058155; x=1720662955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WzSl+/8bcfevQM/tI1jY7SZHL5qkQp688IL5xX3oJ64=;
        b=XPTvgmjtr6R4NhvP2dRKFiEdA6cqEVtIR5fxNP8PagpJV18tmoNQSl+rjyQbizVPod
         ZgUK9LAXuyemfk3IBnm+WRL/fb/zmez+JComGkmFU8pOhcQq3Y58D0LoRgimKq2HwgnX
         GxEkbt8Qk4+Ur40leFYnH4WYSoXO8ehJLQ4exPta59r50P2EcAyp7Raz2kCFaLAaQjhY
         18/l5nePyuDLxp5Ro7XLuA8AzjmWyyOYzSA52NOfVYiy0APRj4fMrThi3AXnDLjsL3Xm
         WPuNvTsC3FElXu/VWaODUZK8AG/ESar1/uj7HEz5lhHgoV8wHCMRy65ajINHqip+Kkd4
         oL0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720058155; x=1720662955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WzSl+/8bcfevQM/tI1jY7SZHL5qkQp688IL5xX3oJ64=;
        b=U8tiDyJx5V5mQutDwwB5kLbkWrkXVYl+vW5PWzUIXgxqTbD+MKzAIx+rFIpUzTiw8H
         tM2UtdTyUKLE/UTOAU55ETOzt7+nXpv/EB7WUF48DVNUyG5pCv1nZXA85E/aAVvDm+2E
         bNvojEwNQOfWZTjzqo+OGgos5bGHy7bCNa6u0nYdL0D7lNhIwJ/FTGJN95y7crHk9AMe
         ULHczeb5tAfttZ8PWKPmVQypXk9/wLQVws/0fQmqLDQzhieDzDpusrUVJkL3D/BrsMbs
         kx5qvwoT22ugQ1mHgyfVqlZlPMi0GRpMpkCGrVMkJUH/PEokwELpr0E9lKmx4Kw7rX0w
         t92A==
X-Forwarded-Encrypted: i=1; AJvYcCUIqUX82jLftB1DbaLY+kW3JQpzYqduBv78YcvpCJKDlEVJNvSl53XmH+X2v+fEH+dcelcvoAycCBprV85X82iQ3JeuF+ywx8PMQw0ApbhUYQe5eA8nnrLLS2bRALdUByvRgVH/nV1fIg==
X-Gm-Message-State: AOJu0YxHgSQzN8bHD6HcGcV2/z+cqnslUfdj6duW3XRsrqiQiwsxhFnu
	yiN3WJTbZQvG8MjWmYLRq7XQ9PlVZ9w6gOwLi+qSbRfKNMVC1sKg
X-Google-Smtp-Source: AGHT+IExz4O0d2+Hb3+0Nto2FFEgQVCxJcUBa9Pg27WAiQVYDApybURSUX4ZI/at5dqFFbdl2I6gRA==
X-Received: by 2002:a05:6000:231:b0:367:8f98:c503 with SMTP id ffacd0b85a97d-3679dd1028fmr178452f8f.1.1720058154822;
        Wed, 03 Jul 2024 18:55:54 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3679744be1fsm1976329f8f.2.2024.07.03.18.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 18:55:54 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 3/3] leds: leds-lp5569: Enable chip after chip configuration
Date: Thu,  4 Jul 2024 03:55:42 +0200
Message-ID: <20240704015543.14495-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240704015543.14495-1-ansuelsmth@gmail.com>
References: <20240704015543.14495-1-ansuelsmth@gmail.com>
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
 drivers/leds/leds-lp5569.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/leds/leds-lp5569.c b/drivers/leds/leds-lp5569.c
index 2b4f358bc63a..cd1a189c542f 100644
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
@@ -170,13 +173,6 @@ static int lp5569_post_init_device(struct lp55xx_chip *chip)
 	int ret;
 	int val;
 
-	ret = lp55xx_write(chip, LP5569_REG_ENABLE, LP5569_ENABLE);
-	if (ret)
-		return ret;
-
-	/* Chip startup time is 500 us, 1 - 2 ms gives some margin */
-	usleep_range(1000, 2000);
-
 	val = LP5569_DEFAULT_CONFIG;
 	val |= FIELD_PREP(LP5569_CP_MODE_MASK, chip->pdata->charge_pump_mode);
 	ret = lp55xx_write(chip, LP5569_REG_MISC, val);
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


