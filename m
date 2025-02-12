Return-Path: <linux-leds+bounces-3942-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C4866A3219B
	for <lists+linux-leds@lfdr.de>; Wed, 12 Feb 2025 09:59:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC5953A6ADF
	for <lists+linux-leds@lfdr.de>; Wed, 12 Feb 2025 08:59:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBAF0205AB7;
	Wed, 12 Feb 2025 08:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="nbQmluS4"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEFFA271828
	for <linux-leds@vger.kernel.org>; Wed, 12 Feb 2025 08:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739350766; cv=none; b=KQ4JMV1PZyDKuT0bocYu7Nfg3EcOf9a1BtAxsurzilsjuFBYIiRdyBMUNYbqXjNQRT6yTkQodQ0EbFEBTMxPic98KnkFJNJE8cclqJsup5Dd1fwCh+AkqW2XITJ0zTJiVpYnmO8SyaTdJIdtKRzIyFha+Qs2eFfaPN3PNIgsBCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739350766; c=relaxed/simple;
	bh=k4EFS67+OSzd7mMGXZ6yWM2eULBPefQQnxTnKpQBiGc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U5dO9GaV3zm1Mh62OkgWUQJFGPXzPpNWwFjopbgRH1tjLxiL0rOvhS7K+CVCke3NvMOvqj5ePACobbCijBS+3JbxSYW8TwzVeOUIfqucOfdkkg+qjk0eb4DlhhExAXzUS2X0xv5cpOJKTzOrbdR3KkXJIMU8chLVje4ielp6lew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=nbQmluS4; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-439350f1a0bso3598385e9.0
        for <linux-leds@vger.kernel.org>; Wed, 12 Feb 2025 00:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739350762; x=1739955562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UGTn43wFwxBQyxqbkwKJtGIvMk3JyrzFT6OLqV1izpk=;
        b=nbQmluS4nzLhnIiy9f3Hcd6ONQHKPoJjRjazJsYbJuDRg9nxFRtNTk5NssVAr/ND10
         u1u/YeyjwEWmr0o2H4ZarC/NXw0Uc8Kf/JBO/GRm4yMV8s6dqhpah1pdq+fIOA0McCSZ
         JvfhWr0ToB3PF5jB0bP9X6maKd0XKM0RInH4WYZ/ybSlyaC2sjIBEVgjqWS0nqHCSgdi
         cmSxS+ryYAdpoQO8EKxNWUYW1WIJi/wvWb8ZFON6QjX7GAJsfWgtT3W32f/rWiX/wA1v
         pGX6NvRJxOMeU5LRPWIQUnXDjXET8MOL52vU8neivZQhgC/n9dvEL+Hzt1bxZ8h9Snls
         /ORw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739350762; x=1739955562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UGTn43wFwxBQyxqbkwKJtGIvMk3JyrzFT6OLqV1izpk=;
        b=Ln0fAsuN3qWqUYFCLACNwGCUshYaRndcRHVT/ePGNoDHztlhtyxg+xVgr4lK/Oivk1
         F7rNZc5Hy+V6WjqfMcS+Y0AbUeHMeK6aeFsJivxO7P3SwRBJHYfiqH/4O71v3zlFdCcD
         82zPqaw4edkc3B2idFVBY51vYzTQqT25lGWygZlkmkviyUVfRe4cB114CA9LBZm06m5s
         etaOiQSvq0Qpfo45anLYEEIO2US++jVVNXjL6bYP0Iux8E3vFkNNPKJ+ABX3ZSL2/WL/
         W/PyZ0NolUSqlA8QSsKZcPeojZUg9qkIjqQ7ywDJKxRWrtDd7LCCpmBZZb/6LJVV+9jl
         5IYQ==
X-Gm-Message-State: AOJu0Yx0LFxrYBnWPeCF/h70EcZVilG18NOFYkrpeUigI82g73pZwwoA
	ZO7WkWIMNkaT0rTCqckFDiGKccNtpzMok6oR9LsY4H88OE7fpU2WMydPOAucNpX5nbccmpFYTmP
	Picc=
X-Gm-Gg: ASbGncvo1mTiyNFi5zBJP+4NHezJJg0DDjdYFstK9hcMf/j5KXlUqmKEbQBNDczSGFK
	srdYL0tdKRWJvH1vldnWYyZKUCjga7zhum/CRwgZUV1no6YMP3bCZbCbIc0dhncZYveLxAtjgHG
	0cHdnk4asi0gprQBZpZBwkZDCD77ExgpGVAJhCr5AcfsJM4wSxAPYqn/Cu5VHahQn54vJGgqD1t
	MG2ULpnfoqKyc8SvtYrIxKjKLOb6t3RxeH59nm7FgzfUQrv+RLU6/E8aFP9vZCTlVnG7c8ocRyh
	BeOQu1saZOp/fHQ=
X-Google-Smtp-Source: AGHT+IEG3GeWGBdsf/djtVQU2OU7vHk9Fqxlcdeuau/EFRL0RMjo++ts4nycnHc+/7bfHyaPQRMzNQ==
X-Received: by 2002:a05:600c:3510:b0:439:4c1e:d810 with SMTP id 5b1f17b1804b1-439583b578bmr18887125e9.9.1739350761900;
        Wed, 12 Feb 2025 00:59:21 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:521c:13af:4882:344c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dcef5c9c6sm12948568f8f.86.2025.02.12.00.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 00:59:21 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] leds: aw200xx: don't use return with gpiod_set_value() variants
Date: Wed, 12 Feb 2025 09:59:18 +0100
Message-ID: <20250212085918.6902-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

While it now returns void, it will soon be converted to return an
integer instead. Don't do `return gpiod_set...`.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202502121512.CmoMg9Q7-lkp@intel.com/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/leds/leds-aw200xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-aw200xx.c b/drivers/leds/leds-aw200xx.c
index 08cca128458c..fe223d363a5d 100644
--- a/drivers/leds/leds-aw200xx.c
+++ b/drivers/leds/leds-aw200xx.c
@@ -379,7 +379,7 @@ static void aw200xx_enable(const struct aw200xx *const chip)
 
 static void aw200xx_disable(const struct aw200xx *const chip)
 {
-	return gpiod_set_value_cansleep(chip->hwen, 0);
+	gpiod_set_value_cansleep(chip->hwen, 0);
 }
 
 static int aw200xx_probe_get_display_rows(struct device *dev,
-- 
2.45.2


