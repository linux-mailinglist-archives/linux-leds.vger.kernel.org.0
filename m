Return-Path: <linux-leds+bounces-4531-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4630AA981F7
	for <lists+linux-leds@lfdr.de>; Wed, 23 Apr 2025 09:58:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 375233AE578
	for <lists+linux-leds@lfdr.de>; Wed, 23 Apr 2025 07:57:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5829C278E7A;
	Wed, 23 Apr 2025 07:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="yJ+9L7cy"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D7F275845
	for <linux-leds@vger.kernel.org>; Wed, 23 Apr 2025 07:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745394849; cv=none; b=lib4/FWBJZIr6JXt6rKfAscqyqWtsoOZS3UV+5InFT0oFFVpG8T3VCYZnVoozxQ+u/Nb7iNfYYfpfzHYEB1ysNNL/FW8sCaOpKXea/dNvR57iH49NUvIc3GZp4a1JvdGpkb95XiN3TupBIZ8JUr/8aI3/9LqMOJs/43Kj/E9ctg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745394849; c=relaxed/simple;
	bh=VqGDq+aiJzH+1k4/p5pVXAekbmppDm03yyolVhT8cKU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K4QVKr0uwPGPP7CFaj2tYOKFiCePr7pWu9/Nx+bXxwqoXy3bfdPQGrsJxaHWNU/1ZXksYk7Xf7lHydObhgrFB8yf9P6skTTjr6dilRPkfKZ3UY1Py98vOt+hjTCW89gSlDdG8OR8cGpVlliCzSwCQjQX2LKtvUIb1HWQY5/n/mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=yJ+9L7cy; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43ede096d73so44344805e9.2
        for <linux-leds@vger.kernel.org>; Wed, 23 Apr 2025 00:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745394845; x=1745999645; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GTFfJZb1P5uU8ezKo9spOiDP3fTS97bBPzPp1VNuiFE=;
        b=yJ+9L7cy5xIO1QVUjmi9YeiPTmQ7PuD63tm5UuRxkJBYFgRZN0FSYTHOVGN9FFFMFW
         CgtGeE2PoYmae2C7F1v+wqFFfoT6XF0nGtH2vgbVqbhlAJJEZDpoN81O9Ac/xfbOVe8T
         QVPcMFWvaU9TuWiuM3gugil2F5FYaxupnwGn38DJ4nbooyukMN+dDn+OcjEZqn66HTrK
         Ms9/ggo2XVvJwtw+Awx8smTUnzESrhIP6kak81WLJP/AyTM9arr/itEdk+hlIVskcDn6
         Qf7F/xN0TBjh6KdjZb0wit3WzBYtGLUXFh2f+jh85WRox2z6j+ZmdvnFRR8efh8pXjCS
         GVZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745394845; x=1745999645;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GTFfJZb1P5uU8ezKo9spOiDP3fTS97bBPzPp1VNuiFE=;
        b=FCHZdpfrcNHDOwhPLWIQouoUmdcDjoD54zUJcfZ6vvg+LIAsPB5IuEwbANC76NgEYq
         Mh3iBBxe9uluJGKgCnuhU71XDd3oCYFiAisklGgLuD51hw36l4gFUDFOv600DIC/6X3D
         56HEyRw19UB1NoYQICtPmsm4YIgT1bOVMdB2Ki6XbyMYX/3xfUfALq/euUj3S+3hI38j
         8jlPtL10XWn/sJs7eG7FyksOjpEJXYe0hftBVAxwZzPUQD4AsUJa91gNuRvmSNAwgUTw
         SudhFWYQVM/TFNvwUrkT2aP0T2r6Wi/2J26PoPcwo7Alc4meMsZ17Cjz3ccQTzvyKaYK
         kvbw==
X-Gm-Message-State: AOJu0YygSlXMEMJA5rvz9Z3G2aNv7Lwo2mfUaQnR3fvPnBLD+6qHD5rp
	zFHbsZIrrY8/M94xMq6rz4CTCUDnAVzi+v5+7pmxm+6Y5vCHddIPK3+5j8oxbUc=
X-Gm-Gg: ASbGncs0sGIJvbCNjHWa8EP8xhZRfX46qHlok0fGQCnKnSqQjGd9BGymsNRv1gfuDVj
	m+0lvmmDpN3ccStNgg+thV75D5VnzemVsjZ23GfOKkmdnikPrSc6QM1X7zBreEf3zAtyKMCPVL/
	4+Qmw3ZSucpiDY2BVdST0bFGP9dIEV8sQ3Hi/DgMdURxfmLTQhgT7eMYJvJuhwH/fxzO/kCtXdk
	rniTpJ0ZNlUA8YQrSUVqWff//1zBn4z7iLdNoNvtDdsjnJMn7puuAvM8U0OqvcWyQKnYg5A8Set
	ifXj9P9l5ARLHnna4cAibnbwlHmwS2XNRl10uaAF65eM
X-Google-Smtp-Source: AGHT+IGTjzRevoWNUsBJdpmO0+4XcLcpnz8hcwqfrYaEOvZnTxWcAwwm6v+Zm7rMHLQ3zUTTTB4kuA==
X-Received: by 2002:a05:600c:1548:b0:43d:300f:fa3d with SMTP id 5b1f17b1804b1-4406ab7f661mr150504825e9.5.1745394845053;
        Wed, 23 Apr 2025 00:54:05 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:74b0:71bd:6dda:dcc1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4330d8sm18266655f8f.33.2025.04.23.00.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:54:04 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 09:53:53 +0200
Subject: [PATCH 4/4] leds: tca6507: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-gpiochip-set-rv-leds-v1-4-2f42d8fbb525@linaro.org>
References: <20250423-gpiochip-set-rv-leds-v1-0-2f42d8fbb525@linaro.org>
In-Reply-To: <20250423-gpiochip-set-rv-leds-v1-0-2f42d8fbb525@linaro.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Riku Voipio <riku.voipio@iki.fi>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1758;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=j50twcusbXfbWf3YimG8kilK3UrQntg92BiiLpapoiE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCJyXXWKiAH3snFZHuRbLDBqkRUlZiVNabT/vi
 W2Az4GKo/aJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAiclwAKCRARpy6gFHHX
 csOmD/4z8pV0ShS8Bn+cluVeSrGpphqnovNsAHA6+L3NqKstpdKCMPStq21vJwK4g0mxS0hWlcS
 W/xwr4ddv3T9CvuZwJXyS7Qsh0WGkIrfEB6jWJn8zwbVmsNCnhvq+2geTenkaVPKnom/4ctM5j4
 JgsfG9W9EsKZmGRPe0IlnNhYGnrgwwKhPfh0FEzyqylBMBT3LDWTQ80EfwgIUjP2RsJz8laoB50
 ddVugrvsnNWDihdOrIbIo+zST06DfSO5zbXNSywQ/eAZ+/PLO4SpYiNOQRkbpwQkQ+9EzIcCOFn
 cXVbzHvISKu+pMczH2P959jlGJTH8z/bWQoQI8jQRqfHQSG1ty/je2WdbzcwPEhxmvIQMptJw8j
 cphEyFKe6MMttqhABUYsYNSBFfHYdZMDtGEfth03zput/5fK950xdoMp3rIdIUtPoLfbTeNv6GO
 hQfx7dRubXy1YAi/UYOKd5DXqD/NjH94DTTiI1jmVAClq6lQrdBg0jEvJYCSe+x1Dtulx2A7DMy
 XoRGElSeAKl6Xl0dphxCCmFmCdeqggex2mMrB2WtNCC8dvRYFOPV9mGqU3ScI5IliD6RvVjisvh
 SbVb4siNzfRdTGn/30tY7d5lK031ZpAZm55H710vzt14UeGyNepkLazvm3OW+IpHgdMCcJ4VT6X
 svAfxJVCje8xDhg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/leds/leds-tca6507.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-tca6507.c b/drivers/leds/leds-tca6507.c
index acbd8169723c..89c165c8ee9c 100644
--- a/drivers/leds/leds-tca6507.c
+++ b/drivers/leds/leds-tca6507.c
@@ -588,8 +588,8 @@ static int tca6507_blink_set(struct led_classdev *led_cdev,
 }
 
 #ifdef CONFIG_GPIOLIB
-static void tca6507_gpio_set_value(struct gpio_chip *gc,
-				   unsigned offset, int val)
+static int tca6507_gpio_set_value(struct gpio_chip *gc, unsigned int offset,
+				  int val)
 {
 	struct tca6507_chip *tca = gpiochip_get_data(gc);
 	unsigned long flags;
@@ -604,13 +604,14 @@ static void tca6507_gpio_set_value(struct gpio_chip *gc,
 	spin_unlock_irqrestore(&tca->lock, flags);
 	if (tca->reg_set)
 		schedule_work(&tca->work);
+
+	return 0;
 }
 
 static int tca6507_gpio_direction_output(struct gpio_chip *gc,
 					  unsigned offset, int val)
 {
-	tca6507_gpio_set_value(gc, offset, val);
-	return 0;
+	return tca6507_gpio_set_value(gc, offset, val);
 }
 
 static int tca6507_probe_gpios(struct device *dev,
@@ -636,7 +637,7 @@ static int tca6507_probe_gpios(struct device *dev,
 	tca->gpio.base = -1;
 	tca->gpio.owner = THIS_MODULE;
 	tca->gpio.direction_output = tca6507_gpio_direction_output;
-	tca->gpio.set = tca6507_gpio_set_value;
+	tca->gpio.set_rv = tca6507_gpio_set_value;
 	tca->gpio.parent = dev;
 	err = devm_gpiochip_add_data(dev, &tca->gpio, tca);
 	if (err) {

-- 
2.45.2


