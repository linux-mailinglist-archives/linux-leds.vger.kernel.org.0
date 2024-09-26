Return-Path: <linux-leds+bounces-2833-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8620B987BB7
	for <lists+linux-leds@lfdr.de>; Fri, 27 Sep 2024 01:24:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 463F328691E
	for <lists+linux-leds@lfdr.de>; Thu, 26 Sep 2024 23:24:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30DBF1B2EC6;
	Thu, 26 Sep 2024 23:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JwQTNoX/"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A261B29C4;
	Thu, 26 Sep 2024 23:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727392903; cv=none; b=rEE8PizexV2UnrOiqgAtzQHTGqO6wCcYejRT8FD/fZ8oMXbURSw0LfHgrneKz3Rdgo+1i1aDndPEGj1dN6xoqDxBwxYhKXrimmfeMT6JL09wOleVBLQW1Ahn6rc5RZP1WmNSpKcvOPiUT7OP84QLjHU3j1mVKcv01NdNu5h1vqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727392903; c=relaxed/simple;
	bh=GGAv58INZAAcONt61Bpt35Ntgip4w7Gu6UUVWWUtppE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V4lPHeqkspIfKvfiZvqqdeFzb8414DhXtrXcNMpPJMI7WHEo95AEVgmsNCTFvvv4JS9GDVfIr6qsOEPXgYUxgK/jXhBPdXpKgQ+dVJW/NBiu1iTXxOngI+z+G8Gl7WRFDfDi7sB6ibDmlRobmLXveSGavb9uGCGDElQNeObuNug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JwQTNoX/; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-374c3400367so1338900f8f.2;
        Thu, 26 Sep 2024 16:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727392900; x=1727997700; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QsOsZwrJIVejL5A3KYmk/iH+gmiGbQUrbC+6txQSDz8=;
        b=JwQTNoX/tM81HF+rgHbgxoy4Ap1iVaDYgSbYFJGjxq9XTdEmwx345v3WdO7kcq8ifK
         hX/S7vxLXd7POLS3FMLJ80qVhC0nFef7dzM1Q/kl2ebjremjK4c2x5HJ5TNOEt/3C36x
         IT+ZP6s4vMNjYztEQd5sMqxHxR+7TIEFKAfk/BD0qb0uAgEiTlslcPzJ9L1p/kdvduck
         5L7i8Nid/3NrVPazsX3l3VQh4/HKxeSm3P97ObXxPnqWVtYAqcvM04ulIOwZsin1fMCV
         SLIMoTj3awqAkrG9OVxFMNkl48zoaKkmNMKjl3A6fbWj2p7hfUWC3MsSZKa5TexqaDvC
         Vx/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727392900; x=1727997700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QsOsZwrJIVejL5A3KYmk/iH+gmiGbQUrbC+6txQSDz8=;
        b=tyY61cP5kTlcYahkxKSBAbnRYkja3yqP594mHdTrV3GpCW8y4NNvwiJoy8ST5kNkGr
         47nY5veji5Wf1eclW+S4PaMvCWhW0+ZFog7aK8E3063eCBuAoYyaXE3A5Af/SAwl7MVJ
         FOzIE4fP/O1A/Ggf+pQVbBz2FarmUFpE/FDYYU6Aso5I/Jh6DIbIVu8lKX4oCInGKl2+
         bIgPDRwvUIdpdZxDqCiijn6Lks9Pr7J9uE4mLmm8PrUZSpHa4e8FPHBxmThk2jKA97LT
         ttwKhDxYB4XIar2iuu4UFsrncoIRqEG7xxDeAm/VlPBlPutUSAsnOP4bHq4R0inyekxo
         vTwg==
X-Forwarded-Encrypted: i=1; AJvYcCWOgnYEB/Rs+d2RO3+5PJgrCnT3IYdwP1E37yvarEomSMAiVJZB3n39iApnYQWCmphtlbz/EeruniAQeAE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIfKEJHr9Sm2y/+7riHV+fABYUbbdN5iXwB+fNUfXxz4rxvp40
	yVHos06IIeyBWjpLmpOmDwmcFtw++OF+yr3tMM9FCkVxpP5dQTL4
X-Google-Smtp-Source: AGHT+IFUS8qz9IpKL5ZcAZ8OyFyLvVNgici/BBziOfQFbnEaYTDdxY4F9CAtftsOOYRvJ/CoOPKo9w==
X-Received: by 2002:a5d:574b:0:b0:37c:cf1a:b2a8 with SMTP id ffacd0b85a97d-37cd59def87mr961455f8f.0.1727392899862;
        Thu, 26 Sep 2024 16:21:39 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3989-b03c-7705-998b.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3989:b03c:7705:998b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27773c0sm50368166b.1.2024.09.26.16.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 16:21:39 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 27 Sep 2024 01:21:02 +0200
Subject: [PATCH 11/18] leds: max77650: switch to
 device_for_each_child_node_scoped()
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240927-leds_device_for_each_child_node_scoped-v1-11-95c0614b38c8@gmail.com>
References: <20240927-leds_device_for_each_child_node_scoped-v1-0-95c0614b38c8@gmail.com>
In-Reply-To: <20240927-leds_device_for_each_child_node_scoped-v1-0-95c0614b38c8@gmail.com>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Gene Chen <gene_chen@richtek.com>, 
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727392874; l=2297;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=GGAv58INZAAcONt61Bpt35Ntgip4w7Gu6UUVWWUtppE=;
 b=8bF3DQ/2DWcbOXH4dFor2UErTpk8gkcWEtJam43Nw0mF8/Zn9foJ+D7oYX405KrNhZyrd0vzr
 F5Z7Ns6Yd7HCiI8Ke73l2dScfUxJ1IBnD7u7ujtB4pnx6fEvO1lSltl
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Switch to device_for_each_child_node_scoped() to simplify the code by
removing the need for calls to fwnode_handle_put() in the error paths.

This also prevents possible memory leaks if new error paths are added
without the required call to fwnode_handle_put().

After switching to the scoped variant, there is no longer need for a
jump to 'err_node_out', as an immediate return is possible.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/leds/leds-max77650.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/leds/leds-max77650.c b/drivers/leds/leds-max77650.c
index 1eeac56b0014..f8c47078a3bb 100644
--- a/drivers/leds/leds-max77650.c
+++ b/drivers/leds/leds-max77650.c
@@ -62,7 +62,6 @@ static int max77650_led_brightness_set(struct led_classdev *cdev,
 
 static int max77650_led_probe(struct platform_device *pdev)
 {
-	struct fwnode_handle *child;
 	struct max77650_led *leds, *led;
 	struct device *dev;
 	struct regmap *map;
@@ -84,14 +83,12 @@ static int max77650_led_probe(struct platform_device *pdev)
 	if (!num_leds || num_leds > MAX77650_LED_NUM_LEDS)
 		return -ENODEV;
 
-	device_for_each_child_node(dev, child) {
+	device_for_each_child_node_scoped(dev, child) {
 		struct led_init_data init_data = {};
 
 		rv = fwnode_property_read_u32(child, "reg", &reg);
-		if (rv || reg >= MAX77650_LED_NUM_LEDS) {
-			rv = -EINVAL;
-			goto err_node_put;
-		}
+		if (rv || reg >= MAX77650_LED_NUM_LEDS)
+			return -EINVAL;
 
 		led = &leds[reg];
 		led->map = map;
@@ -108,23 +105,20 @@ static int max77650_led_probe(struct platform_device *pdev)
 		rv = devm_led_classdev_register_ext(dev, &led->cdev,
 						    &init_data);
 		if (rv)
-			goto err_node_put;
+			return rv;
 
 		rv = regmap_write(map, led->regA, MAX77650_LED_A_DEFAULT);
 		if (rv)
-			goto err_node_put;
+			return rv;
 
 		rv = regmap_write(map, led->regB, MAX77650_LED_B_DEFAULT);
 		if (rv)
-			goto err_node_put;
+			return rv;
 	}
 
 	return regmap_write(map,
 			    MAX77650_REG_CNFG_LED_TOP,
 			    MAX77650_LED_TOP_DEFAULT);
-err_node_put:
-	fwnode_handle_put(child);
-	return rv;
 }
 
 static const struct of_device_id max77650_led_of_match[] = {

-- 
2.43.0


