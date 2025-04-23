Return-Path: <linux-leds+bounces-4529-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E56DA981F3
	for <lists+linux-leds@lfdr.de>; Wed, 23 Apr 2025 09:57:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 675553B963E
	for <lists+linux-leds@lfdr.de>; Wed, 23 Apr 2025 07:56:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47CEB277035;
	Wed, 23 Apr 2025 07:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="mTnVEntE"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89C82749DE
	for <linux-leds@vger.kernel.org>; Wed, 23 Apr 2025 07:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745394848; cv=none; b=NLwujvtHLJPLFXP4DyPp8Z6CFrgXaD5c91zoeYvlCYfnINkNYxZl4ZiLPtdUxkE+Ow7LFj8lRD9BB55yTSUVCItgPnZ2+HsAGGOUS+7BzStTAEe91IlY6NZCsUXXMjdjTf3hiaCz3H5TkqSuZztCvb/15U6yCdqf+GFK5hqMfBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745394848; c=relaxed/simple;
	bh=3Ii8s2p/qcdFuMe8SVAPXc/efpCSMFMl0mlUoTEBswI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MhYeH4F6Z2jhJLEvPODGxa7YrLRYp9YoU8nupzEiuMwVDyh2I9G4dnOtEzuRT0EsG+CGwdMAyOYjNjTNCgdfgiuEVRxOAGYG8NjiMYdEqDWyuNpmDwav/ApTUkcqB7HHOF7L+Ea9mHomGnx8cQN26YLWx5L3k+0S9ob7Xmwb2Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=mTnVEntE; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso58071645e9.2
        for <linux-leds@vger.kernel.org>; Wed, 23 Apr 2025 00:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745394843; x=1745999643; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G50tHg+9cPiXzkRpuZie2LXfSMz7hYXUT5tobf0KFow=;
        b=mTnVEntEoLLNgtvVkc66Fo6QuA+P2oveflOhOrsm6JJfGRsB/k13MRHT5Znez7slnk
         ACvS9M0+fLtcWr0Fn78Ia1poKdOxzyYXQCueOTorKmwwPOHfAb6CQ6UQOg2xFtdAErf/
         EvhNdKgbtORqh79UqpI/v1uFKvHTDpGhu1ixfM+tDY/qj61+LjTjfJT8vH5LWRVm2I2Y
         doqncjQdpYtlPFKcK25u35mSLlO9JfZyFg1+CN92JAROARI53POnmONnAzW/fo2E9VK1
         XsazlD7SHJn0GgmcjB5rE6CPshbC4p4mOxWChuVL4MDwZvoJPEf33uE00yrcEwQvzWK5
         n33A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745394843; x=1745999643;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G50tHg+9cPiXzkRpuZie2LXfSMz7hYXUT5tobf0KFow=;
        b=Ptzdb57g1v0WJaIGQG0eNFoaN6nKoqwoeGe0RdCVOm/AT5Ta2nUwvTLNUOISu5FeGR
         F1chpvIOwzlS9EeZirnA6jaFIKHzuSx9flep7S1V1J0SSxNGUo9UM4tFV7VTfgyGhDf4
         dcQASqkAfbl+9gFhsmwITCDTl2tBi5AwJSzzJmdocvAdgjS/IXYMKlRMjkd6mcpeji71
         CGsMX7HIrIyVrkYMvkUW5yqFHMMxc8Er4wD7ueA0DtaVMLnWcAPuQ00Jl42Jwe8X1GD5
         WhKXdrGw/1M0sJATWuEKhrVOzhOPDt/Y9vumXR3ni8nbgnQhzEe/GwJvNdY+WtSkyqG0
         EIIg==
X-Gm-Message-State: AOJu0YzHNtOpm63bILJuTb3d6ApIPFyYeByDhJ/iU1PJY0x/IdOp52w6
	S58h228S1s46DSvQvWNW3L4K58XyqKmGeQh0Te6Dhn4utwvL33fLhoSEtJiY+dc=
X-Gm-Gg: ASbGncsHxwRDMcfpiIEzGBYd9thd2hTfAf0zbElt+AQJZoRAd+TK78U33h/+Lvm/vMU
	qB+1r8hU8VbKCz/vj+ELBWQFZWSw2I2N6R8IzMUwhq9Tcm8UlHs1zaQS4XGOChyXHptwyTLprhO
	0amZ1velSWTuObDX+DwyebMAGAP3aWr+ULordqswbPW2+HL3lj7msgtBEEZSNYBtitIhNwj5pI+
	crXJPq7Db3buT8/A9CnAtN/AWIqSdKF28ZzAQ/n5NGZrUzPCu350XnzqZHk3eJ/1cvWkyb/FZex
	CmLwPqGe7VI2XVnMdf+vZdTz0rifrzjNmSqjNK8y1BXn
X-Google-Smtp-Source: AGHT+IGvXTJ6ZnfxoE28QibdMukAk1jobBJ6uY3/oOh8NYBRChEhWLE8jpG+gXPQsyB16QsY+BFf1g==
X-Received: by 2002:a05:600c:a088:b0:43c:ec28:d31b with SMTP id 5b1f17b1804b1-4406ab9767bmr210592445e9.10.1745394843119;
        Wed, 23 Apr 2025 00:54:03 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:74b0:71bd:6dda:dcc1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4330d8sm18266655f8f.33.2025.04.23.00.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:54:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 09:53:51 +0200
Subject: [PATCH 2/4] leds: pca955x: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-gpiochip-set-rv-leds-v1-2-2f42d8fbb525@linaro.org>
References: <20250423-gpiochip-set-rv-leds-v1-0-2f42d8fbb525@linaro.org>
In-Reply-To: <20250423-gpiochip-set-rv-leds-v1-0-2f42d8fbb525@linaro.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Riku Voipio <riku.voipio@iki.fi>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1542;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=l2zdj6xneEh/Gk26Dc0eMWJRRxQPVwCJnsn65X8LVNg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCJyX/ngp3PcuZDqy3Ua2tfkLyx1/xsgD8bsIE
 joXG4dBiPOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAiclwAKCRARpy6gFHHX
 coIND/0UvM9H0Fn75mnFJ4Ib5MXYYwVT9suj73IBJKfYp7aqXXoxUcpByilyJ0agYWNMRhsobGO
 s/oI89fln0XTsleS8uMc8pXvuoTi0KcatR3NeGiCGlZBev0oNvaMVkn9ZLEF4EJw0fMtBxYMn3k
 Z6BST6/1+6uX9OyKUdDUzZNMyCRztmf8yWk/vdoKTLEUxzW88ppyl3vAu/ZYFr2QBuB1ynJLv5i
 eA0FcaWCTC8RmOKE+v4q5r0n0sdAC6aIBLOuQ/gqn22wDqVZMGXDPtKwryaS3urFcGTtAcsfC2N
 2FmLLkH4/mYSliEIiY7RW+U5AsxItOtl1iba3SI81o2Ym73rUsTCVfX14CpuhRSZksGkAW1kwBI
 6Ihdv6hXi7/EBQAb98xTY5EzPvDm8mqLSTJE466nlZ7+CJImoq0nuQpLVcL6uGOjdjlNOLJFhM3
 sMg1EoAFfFiJyiF77za1Mh+7wZOKV1poPoWdjQ6IfXZNMXzxlZLRiHoXDYvU3OP+U67D9w1NZWj
 0awPnKFtkMeQdnCAxADE0KoplYdX8M62s3MajaeD2Hl73UAqaXVgN6BiEYuL3qEKO0V7oDa2Hcm
 7IFwc/x9HWBiVQYNodydT3su07qbOXk4eoK68fqNS2TLGQ+JEQ6Lu+o+ZOTJcWaVSnO2exudDds
 VN9GzjLQ1pCJcIw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/leds/leds-pca955x.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index 24a40a1cdb15..42fe056b1c74 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -495,10 +495,10 @@ static int pca955x_set_value(struct gpio_chip *gc, unsigned int offset,
 	return pca955x_led_set(&led->led_cdev, PCA955X_GPIO_LOW);
 }
 
-static void pca955x_gpio_set_value(struct gpio_chip *gc, unsigned int offset,
-				   int val)
+static int pca955x_gpio_set_value(struct gpio_chip *gc, unsigned int offset,
+				  int val)
 {
-	pca955x_set_value(gc, offset, val);
+	return pca955x_set_value(gc, offset, val);
 }
 
 static int pca955x_gpio_get_value(struct gpio_chip *gc, unsigned int offset)
@@ -737,7 +737,7 @@ static int pca955x_probe(struct i2c_client *client)
 	pca955x->gpio.label = "gpio-pca955x";
 	pca955x->gpio.direction_input = pca955x_gpio_direction_input;
 	pca955x->gpio.direction_output = pca955x_gpio_direction_output;
-	pca955x->gpio.set = pca955x_gpio_set_value;
+	pca955x->gpio.set_rv = pca955x_gpio_set_value;
 	pca955x->gpio.get = pca955x_gpio_get_value;
 	pca955x->gpio.request = pca955x_gpio_request_pin;
 	pca955x->gpio.free = pca955x_gpio_free_pin;

-- 
2.45.2


