Return-Path: <linux-leds+bounces-4014-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2053EA3D58D
	for <lists+linux-leds@lfdr.de>; Thu, 20 Feb 2025 10:57:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF1633AAC1A
	for <lists+linux-leds@lfdr.de>; Thu, 20 Feb 2025 09:57:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9F191F0E28;
	Thu, 20 Feb 2025 09:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="mNqV0fLu"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0209F1F03EB
	for <linux-leds@vger.kernel.org>; Thu, 20 Feb 2025 09:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740045439; cv=none; b=iNmccASD5gKkiCx2KIJzPrq10bMZ8Qk+fdYcTo+stVPmTYeSA2mIOCIpgqdO9+vW2ofbz906njAWUnUpajmdpBpLvOOhdHZYaY1jmMLG9DQ4AySUhocS7rCzRUV4Z40/ys5zrBkheaamDKSHcEepZyLggRsiiRd4dSHlGeuKTl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740045439; c=relaxed/simple;
	bh=/gqeqRwMs8CevwwaRvu7rMfOHz8FGAeaeJay3AIimak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UM4Bn1SG1YL5s53AXxfZF9qd5fxbx3EW2DUbiE8PJrjvJXKceavd1ESgA9/fXD1AgUUihxZ3WLBhQ90pNTaPTXfAyedFuhGrO7hW1qYi/SXXKUnEE3y108CnGj0ihG7Ck5TF9/tQKUTEyXCxT+yXbiyQPMmDMOS3Qcj14wDHVig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=mNqV0fLu; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43989226283so4475435e9.1
        for <linux-leds@vger.kernel.org>; Thu, 20 Feb 2025 01:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740045436; x=1740650236; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ePE6aVSyq82nNiteS0eDm4Murw6GeKSP9YRuA1+AOq4=;
        b=mNqV0fLuVu2L5+QXJoh2GuOOj6dnK1k0W/KI80AeBRCN7EfV/v29KcZzC7aS3NGi5g
         02GsEZLzfR1cDUH7vFqFyDIl/8o49E928FwZVOorLuc8KVVfJDifD9UFqQigN60P4hDZ
         J12zXzOhcUhKAUoaqbiWO9amXXxMy+uRJe7IpIhmt/Vg66yKdYlpYUiwWgFqJZi6LxJA
         oWyis+a8oqroRe7E0VaP1JCvnyRINAHmGHrAbgty0Cm3pMYIvsfZI5cds3k+bb6M6loQ
         nrH0mhrweh1v+z7SlIyc7HukEx2rLnNYpo0e3iTGSc18jZP2CkouI3qZ0EszG7JgQcYs
         LNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740045436; x=1740650236;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ePE6aVSyq82nNiteS0eDm4Murw6GeKSP9YRuA1+AOq4=;
        b=px2MHXn7le4u4rXH0IQGF0SbGpusizz5GY/xUK0T1oHAbSDOMIEAJtdduYpXzmmCl+
         Ior7w6gHTAFti9cTBfU8if4A3WU3jHvtr9lgCwUvfwcWQ+NB8022HYfCn3yYSJkfvOdD
         8CatzD1K0hn6SXyznNpWa66rwenFz5nabbnVFOdEZofXUnRowNJARe3RpNKe63zakKPQ
         Cz9/ZtMfPr+xyTq7aS2dt2AsRhld7sqgS0eRNFIKwGxQdiOpLQB0BNY55AwiEgndAw6K
         KaH+fm+SzUu+gVuIrUu6B2+jJm6yTH6kbpn3zTrHGAs8qtQdQsAYzpfEFifbBkJc+fip
         /A4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXAGIKJJMlmjURxglUkhrT9dcxsFjjtTgA25OitSqxinHLQFXc7uTt3NlSrN0eh5bTOhAZQSZdO1DgZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyLBIJrwanSzOylUrcPepf2NYyyLCvEPvjdUDC0yw4VY26IfwOZ
	GZ0diVXhfXZ+g+6x3fZu89QkIshm8nIcFe5kFg3wL/5Zy+RZccjHV2ssY0J5GUM=
X-Gm-Gg: ASbGncsCs0xEr6GxbbCY6dr17N02ckfyf9jvVxLcdtxoet+ap6QXDPt8ju37t3BTavZ
	t/Ait23b/2IbV15L7Vj9Atw9kdaN4o0BNLkYt1b1+l3ChxftaPnB2za5IquEli3qgUS7f/rY7Br
	JNMMRpW9XauCEl28g0IUae4TK36f6K3UCy+5oOXISAmy6KUxzHMl3PvxF9KZNImjmEbIMkrXzsj
	A9Y9SA32FL6pwcfZPac2N32hV0cH8DFZ9I7lRpVn5hw5T9C6SxDqUupGDOUhTkyVqY2RL4iFjK3
	UiQOyR0=
X-Google-Smtp-Source: AGHT+IEJ18E0znCg/W6pI6SBZ6POwzntvKs5Wddj1jzrAx7EMhapZSXX+0+m/ezVaZFBdWbuk2I/Mg==
X-Received: by 2002:a05:6000:b07:b0:38f:2a5e:f169 with SMTP id ffacd0b85a97d-38f651405d3mr1047722f8f.37.1740045436112;
        Thu, 20 Feb 2025 01:57:16 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:e2e4:418d:7462:9cf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d65dfsm20509174f8f.64.2025.02.20.01.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 01:57:15 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 20 Feb 2025 10:56:58 +0100
Subject: [PATCH v2 01/15] leds: aw200xx: don't use return with
 gpiod_set_value() variants
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-gpio-set-retval-v2-1-bc4cfd38dae3@linaro.org>
References: <20250220-gpio-set-retval-v2-0-bc4cfd38dae3@linaro.org>
In-Reply-To: <20250220-gpio-set-retval-v2-0-bc4cfd38dae3@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Michael Walle <mwalle@kernel.org>, 
 Bamvor Jian Zhang <bamv2005@gmail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, Keerthy <j-keerthy@ti.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pwm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 linux-leds@vger.kernel.org, kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1051;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=PIuGkhnXNIukoW+JQ2UdGjN/QTq1yPTYeOxQX3xtWd8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBntvx2ZKtP4FP+4pU3UV9J1oA5xxYaJP4wFaj6s
 eKwF6do6XaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ7b8dgAKCRARpy6gFHHX
 ctGWEADaiKjypEdiDNeOeEm1nP8JwKq7Occ+KYMcJrlW2mkA6sC+tG3lFxgXKdHHkra8cMdvmeE
 yKalq+0h/rNSkpMUJhlg1TMVaFucMWJSqvZca28OccapHZu24j3I4l/+A9kapSZvlk8n9/kC6o8
 N5AfP+VRR3Q+Zj4V5sq0NYLAuRHwQOx/oESmv8OFHwI5ihgB4rGXQh5Qhwp2JjitTiZDy8QAS6m
 frYj/XuUZXMo1yCr/uCgSgEyDvWe3vhZkRj48p+eivBPeibHsRXJaa9fTzutNFfdIfCna8TIZXJ
 g95pL2mCdWhrGWwIuj6jccIUSyV+twxjrXorYhRB4ZaDREF/hu1MD8mFRIp8PUxCk1T3Shhsdwj
 3IEcpvxalJHy8mckvNeOpQGqoL6bphxTTQbz0hKJfelAdbdNkph5Yvy93r08vg+YM9AxGJqlqQM
 TYOcyugVDZUc92iHjac5lV/rz5h2LjhYhDrCJ1ZE5rse9uhAoLfMpfWHLiIohS1N43NM5xr+atb
 ILkzVHghd/xo6/q40EF4GOhyVmDR2Xvenw+T4rH4zad2I3KlyVEbuNxwKFIc9kkTIEEySJVXARm
 DmO75+rvkfLQb5t648rPOARandd31y2oTkZE3B6z+Mi3r2sR2TPuLVSwoMaxf5LMTvA2ds/UyhC
 HngwkMA5k2QKIBw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

While gpiod_set_value() currently returns void, it will soon be converted
to return an integer instead. Don't do `return gpiod_set...`.

Cc: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org
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


