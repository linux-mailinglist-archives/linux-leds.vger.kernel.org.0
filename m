Return-Path: <linux-leds+bounces-2828-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C04B0987BA9
	for <lists+linux-leds@lfdr.de>; Fri, 27 Sep 2024 01:22:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E2C401C21ED7
	for <lists+linux-leds@lfdr.de>; Thu, 26 Sep 2024 23:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE5971B1D5A;
	Thu, 26 Sep 2024 23:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SJzdvAZM"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FBA1B1D49;
	Thu, 26 Sep 2024 23:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727392894; cv=none; b=N88FyZoeSJrwBTu5mX6zajvVVs0W87uWHz8DNTCeO6vpl+X0qQBahN5VJWzrI/EZWVF7OAnOdOy+LP48Gbfh0AbI3CKt3bdzS0XTo14dexrRvZdtHSoDCsjvfGNU4CewmTA0LOhuLxshnkiIY+UW1bPSf6HqWSl+vCy7KDLWT0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727392894; c=relaxed/simple;
	bh=V8haQmgnRaMTwlG5K1E7vGaVHwPa1IZaQXMfy8Pe7ck=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=poNoupFvMEXL8RrzVyPyg0B4UwkMyydW8Vh4kyeFO6ASHvhhUM+QM1oE/ge+XcjmsSUt+qkxpcKB/NfkvcV4IvSuSF1MlHgGM0xy6Pq5ZJAkqwAsvLHo7xLrCL2ajr4Q6I40yCUaCUrkJMxTNKOufMwMjM7eg/fvAX8BT5gjzc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SJzdvAZM; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a8d2b4a5bf1so181252766b.2;
        Thu, 26 Sep 2024 16:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727392891; x=1727997691; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SJpECgac0QWqDyY0V1N/RenFz/N/de4tQaF+Hl64Xww=;
        b=SJzdvAZMc3xuJaeamzKwR0zNL0pmhHKbHtKuJJiRWrsYubGaXfYO7s0KP6guoP+EYe
         zCrn7kr1mfbGB6cy+hy/1cD13r2zlMmjNWWZk1zC7tLQYGUQUqVz0GuF6AhkePnLsF1z
         EQ6U3tWbYs/R14w52yH1lvr5S6VlE1aXmnHH6jY5X76lHZuinwwG8oXJGg5MToaFCjVl
         3J1HYAdSDnjbxn2KVBhLYW1MGARgVyjvy2ta8TnptQlr3Jq5mtNH1+pPcyzR80Oa/aeD
         al+D7CIcj7XkbxEQ/kPzL+xV8RUCUBG2sgqNhWyAwdP2BFNts3x85J2ZYzzDDNt/l3fd
         Ru9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727392891; x=1727997691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SJpECgac0QWqDyY0V1N/RenFz/N/de4tQaF+Hl64Xww=;
        b=qfHMyMwNOw0HrTMNMaodG11Z4znjM5kyvfVgsYAPk2B02GBIImHVDnNHNXucHa0LWA
         uFKSwpAa2A7UH/RKrY+j90YJmgh7hAexi3F05ZtwBt3UxXorxgmKffsnEj/wOlkttnyz
         NUsyMvL1ncg0gNWrab2+V5THgH6NmKcRhlnbN2aUGZaYy0RqlE2Rz9xnPHN3oBwv6sdc
         fbN7WoZPz0upjKFp/bZ3oYcQvUpumxc8k9dSrFEEpoO4+zRTbU9xhaqEDA18f9VkEl50
         T/MDnqLRYVjuelnKv3WNhU9OYLjniw2RoYYYtyY0be+fyk2IBUhL0WpeeBEg0OFMlrCp
         Up7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWi29aZ8K+qh2e+lXTmexvtOovlLVNU/6rMJkdhjjHBGgRrzgkUZcBEKYKjuog+u98j69hZ8R5Am9s/LiE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSWTMN8+bKf1+tbgcnXPVi4gjYZe6opcBMj+BIBCh3QDs+gDk0
	cvkEcH+h2ooi1xyRzolKctevDucPzQrghzSbTaRuPjqLhMbwLGvz
X-Google-Smtp-Source: AGHT+IGSWoR1fCEWrIDtr8bTLXKGUTs29eDV3zKtmwo1hMD14zDFeQuF3IPtFA71mpm1QVUnbVuMZA==
X-Received: by 2002:a17:907:2681:b0:a7a:ab8a:38f with SMTP id a640c23a62f3a-a93c4a67dcamr84483466b.41.1727392891222;
        Thu, 26 Sep 2024 16:21:31 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3989-b03c-7705-998b.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3989:b03c:7705:998b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27773c0sm50368166b.1.2024.09.26.16.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 16:21:30 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 27 Sep 2024 01:20:57 +0200
Subject: [PATCH 06/18] leds: el15203000: switch to
 device_for_each_child_node_scoped()
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240927-leds_device_for_each_child_node_scoped-v1-6-95c0614b38c8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727392874; l=1939;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=V8haQmgnRaMTwlG5K1E7vGaVHwPa1IZaQXMfy8Pe7ck=;
 b=sTqeCbZp2AB1Bc5Bt7/iASwDkXreNOXxX6b+ivRKl7l5AcLYxvapJeVNieVkPiZPuXREO5n0U
 8lb5CaGQyzlD8lCR4pv1xcQkTYZrQwZmlV1zDdjGoSHCfLUUuJ9Nwts
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Switch to device_for_each_child_node_scoped() to simplify the code by
removing the need for calls to fwnode_handle_put() in the error paths.

This also prevents possible memory leaks if new error paths are added
without the required call to fwnode_handle_put().

After switching to the scoped variant, there is no longer need for a
jump to 'err_child_out', as an immediate return is possible.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/leds/leds-el15203000.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/leds/leds-el15203000.c b/drivers/leds/leds-el15203000.c
index d40194a3029f..e26d1654bd0d 100644
--- a/drivers/leds/leds-el15203000.c
+++ b/drivers/leds/leds-el15203000.c
@@ -237,22 +237,20 @@ static int el15203000_pattern_clear(struct led_classdev *ldev)
 static int el15203000_probe_dt(struct el15203000 *priv)
 {
 	struct el15203000_led	*led = priv->leds;
-	struct fwnode_handle	*child;
 	int			ret;
 
-	device_for_each_child_node(priv->dev, child) {
+	device_for_each_child_node_scoped(priv->dev, child) {
 		struct led_init_data init_data = {};
 
 		ret = fwnode_property_read_u32(child, "reg", &led->reg);
 		if (ret) {
 			dev_err(priv->dev, "LED without ID number");
-			goto err_child_out;
+			return ret;
 		}
 
 		if (led->reg > U8_MAX) {
 			dev_err(priv->dev, "LED value %d is invalid", led->reg);
-			ret = -EINVAL;
-			goto err_child_out;
+			return -EINVAL;
 		}
 
 		led->priv			  = priv;
@@ -274,17 +272,13 @@ static int el15203000_probe_dt(struct el15203000 *priv)
 			dev_err(priv->dev,
 				"failed to register LED device %s, err %d",
 				led->ldev.name, ret);
-			goto err_child_out;
+			return ret;
 		}
 
 		led++;
 	}
 
 	return 0;
-
-err_child_out:
-	fwnode_handle_put(child);
-	return ret;
 }
 
 static int el15203000_probe(struct spi_device *spi)

-- 
2.43.0


