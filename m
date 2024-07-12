Return-Path: <linux-leds+bounces-2271-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3E492F32A
	for <lists+linux-leds@lfdr.de>; Fri, 12 Jul 2024 02:46:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7AE4D1F22E53
	for <lists+linux-leds@lfdr.de>; Fri, 12 Jul 2024 00:46:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34730442C;
	Fri, 12 Jul 2024 00:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FXFjV9Nf"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86499646;
	Fri, 12 Jul 2024 00:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720745169; cv=none; b=g3KoaaxKnlcJaF74DaKR3N5mDJ4mp9YAOGNF3OD1JwdKnzfC+RryadMkoLCQRUYJQbKlt04No4rceSoPdeHVNW3qWs4EAGG8SHuMijurMDzQZuzmMpjLaeekrDAdRq+eTG93RQisyrKKpgewUtc0L33mLm5KfqxVDz9BQnv9GqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720745169; c=relaxed/simple;
	bh=pGeC0tIcc6RdK4J8gqAtoBjZUtUHrr6aVWLf8iR1ScU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qeANxXoEwUS5oukigzEOm7XbLEwKPCxapoF7zDj/Yd0KFVBR0+kf1jhK37cWk3FMnP+ZvWmfl48CKJQPq9EuOLQebkpkUD0KQnsIHkCqJ9MuZ0364JJZsGtW7vQVTPUwpMRrTRwCAHcZpYsFkA5SGVNLNGUcZAceiY51doBOriw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FXFjV9Nf; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-36798779d75so1288436f8f.3;
        Thu, 11 Jul 2024 17:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720745166; x=1721349966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3GmyLG4BAl3sAj48hgtamCgyGJ/9e0NRXPkNH2cJM84=;
        b=FXFjV9Nf1xUZ10IfifTS7F7Wqo6956Zs1t/x86P7m2roaBg93HKxScd5Q/FCX61X5S
         YIQYONcyWhYr2LWV4CxRtQD88vHzzHRi1fYF/N+RYvVO2ZcBrvOui/xZy6O48YHDWv4m
         I+CNOvquMBRCSPhGoFOyP12q+Jn9986ObKCqUbB5KBYSy0vBkVwtRop951tDbOZ7oN40
         SiPCfgeuP978abaK+kDlRhl5Ob63zeclH5gwijT3V0spAFHQcXSUr/bi+6PTXlJjEBiY
         ueE8MuRtAZ7Y+oeGk1fHUK4cX5odJOx1qzUV7V9IiobBjN2o4bPhxG/XdukDJTA9O29z
         aCjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720745166; x=1721349966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3GmyLG4BAl3sAj48hgtamCgyGJ/9e0NRXPkNH2cJM84=;
        b=ddPvGXESaiCzHtOElj5WLKizQj6iut/Nvhsr7A3xHAFoeWLjS8eRmlCdLIT+LupRJx
         D70uwiVwOkxGRHntCOaqiOgR15LgIcy6qxGy8skFGCOkkFFfVGCcCijRNc8TbIO8IvvY
         zrkbZEKqWsT4/PIJ/h6axAHjfZfn1imKvE0NJkPIZy8/n2VFyg0PWuIKtIWvqZnB6NiS
         KF6Ydah8VfgiU1qWi9NFcRnASAPEBu26/uX3Ca5rbr2GnzjhQ2oZXSvtDzITeH/Hf117
         IHqZwXyG+pbwojxt2hR3o/L1+CVtkFosX9OqMRIbBbaQV+qeQ4JQYwOcJdTVYeZDSyqo
         iffA==
X-Forwarded-Encrypted: i=1; AJvYcCWSRQ9bLkcqlPxXbvwIRuC4zR8StUbKwccoHYsyRwy0XXgxbqqIh0knajWAVrvwLbtVRYhmYtPzqTuh4tEJThzFtZB+Yqv6bqZkSdTy2mev4EpVMG5muA34h9p7egRDEcwPzucvyX/kjA==
X-Gm-Message-State: AOJu0YxfOIvPRIEP/IsLIDAM9j9+BFMLUnClouXZb+c8omwXO/wH7CVR
	Ll81N4nJPRUccCRniROJ+zYXa4A3iEPrE5oCDnLKYKo/FdOXIOQxp1MHVQ==
X-Google-Smtp-Source: AGHT+IGDNQiQnh4tiYn9fFakigEq6nxuF4wjNN5rYEFi1y5BjcuHDvhgF0QJtDbNJOUY7J348kXGog==
X-Received: by 2002:a5d:4747:0:b0:367:9b1e:7b3b with SMTP id ffacd0b85a97d-367ceadc72emr7426801f8f.59.1720745165909;
        Thu, 11 Jul 2024 17:46:05 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-367f1990dd5sm3118803f8f.105.2024.07.11.17.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 17:46:05 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v2 2/3] leds: leds-lp5569: Better handle enabling clock internal setting
Date: Fri, 12 Jul 2024 02:45:53 +0200
Message-ID: <20240712004556.15601-2-ansuelsmth@gmail.com>
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

Better handle enabling clock internal setting. In further testing it was
notice that internal clock config MUST be set before clock output config
or the LED CHIP might stop working.

This wasn't documented and was actually found on devices that have 2
chip chained where one chip provide clock for the other.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/leds/leds-lp5569.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-lp5569.c b/drivers/leds/leds-lp5569.c
index b7a74d6c19ca..2b4f358bc63a 100644
--- a/drivers/leds/leds-lp5569.c
+++ b/drivers/leds/leds-lp5569.c
@@ -179,20 +179,25 @@ static int lp5569_post_init_device(struct lp55xx_chip *chip)
 
 	val = LP5569_DEFAULT_CONFIG;
 	val |= FIELD_PREP(LP5569_CP_MODE_MASK, chip->pdata->charge_pump_mode);
+	ret = lp55xx_write(chip, LP5569_REG_MISC, val);
+	if (ret)
+		return ret;
 
 	if (chip->pdata->clock_mode == LP55XX_CLOCK_INT) {
+		/* Internal clock MUST be configured before CLK output */
+		ret = lp55xx_update_bits(chip, LP5569_REG_MISC,
+					 LP5569_INTERNAL_CLK,
+					 LP5569_INTERNAL_CLK);
+		if (ret)
+			return ret;
+
 		ret = lp55xx_update_bits(chip, LP5569_REG_IO_CONTROL,
 					 LP5569_CLK_OUTPUT,
 					 LP5569_CLK_OUTPUT);
 		if (ret)
 			return ret;
-
-		val |= LP5569_INTERNAL_CLK;
 	}
 
-	ret = lp55xx_write(chip, LP5569_REG_MISC, val);
-	if (ret)
-		return ret;
 
 	return lp5569_init_program_engine(chip);
 }
-- 
2.45.2


