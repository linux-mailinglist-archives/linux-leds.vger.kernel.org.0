Return-Path: <linux-leds+bounces-2825-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC25987BA3
	for <lists+linux-leds@lfdr.de>; Fri, 27 Sep 2024 01:22:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BBB761F2484C
	for <lists+linux-leds@lfdr.de>; Thu, 26 Sep 2024 23:22:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 081A71B1421;
	Thu, 26 Sep 2024 23:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N+7LOPUe"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405C91B1405;
	Thu, 26 Sep 2024 23:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727392887; cv=none; b=k1ZL1FqMqtm5fY7ZZO59iYVAsBZ0bGPaCYZqmySLdAaR96TsEo2uFrIo8kd8d/nyTel8LRO+/vkGrD+HFeaSUH3IHDBD8aom8SefWfqcMtCB5maig5nn2Qy+TJaeG1GlKr9CYAMAv73Y11DLQDScVNSc8vPjyeJttrkNWFoIxvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727392887; c=relaxed/simple;
	bh=wZ6akrPJfNHUSfXIEENEHvfLrdMCasbCDwbd/LiltB0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DZerU9Ct2Bs5NFT+Vl3bxDN3kwBqSqNttvnTfGkI8qHa1Q61ssmzA6t8mCVMflCKlOOrNDUH8HfdJcgskF/GsOl5McgPf+bGakoHj/KeKUKe8GyL5VL7Jq1y/qJYsTxoJyYvkymS9GEYSnFLA1OdEY4MUrBN3UEMsOWCuDHotVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N+7LOPUe; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a90349aa7e5so219784066b.0;
        Thu, 26 Sep 2024 16:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727392884; x=1727997684; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HNd4acINmmNerLNUmXoF50X4J1ylsjRdPZ4qMlEZiVs=;
        b=N+7LOPUeHecVslP7mv0dDdOufAusm6tj5bzpbZRi2OwZsPBWb9Z1Cqbh4D6ST+MJxh
         eDHFwcnKinGJg7Ln60pRfK+q/UFuLgNpQmsiADVyXmflmBgoTAvRq72vuEka+dKRy3yD
         MLnqS+Gl1FbNWhcPAlp1Q1Amg+SYaksQvwLDs329nCqOPajVvV50IoP5dwqDJMF1FnqY
         BA7+70Z5uM70tqWrEHJd1H/rbpfj0+1Y5GqEVWGVEw3aqweP2IH6ZHPtbOK+T0Mct3UF
         ajpZ8xlhRXpjlEduanZnzL40UN7gadESNSJq/q3NpNPWV5Y8NeJvOknDe/AtsQKclI7m
         2ohw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727392884; x=1727997684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HNd4acINmmNerLNUmXoF50X4J1ylsjRdPZ4qMlEZiVs=;
        b=mJ2Gy6tyqD+sZ6JasPrui9OcuRHs382JDwkek/XymqaNQyuWNtkuDigqt6KrQ7Ehdd
         8zEzZSPRCwBq9/sbWKsp9Z2gH0uRq2plBjh9wLiAvngqH018NeyJ0tkgd6wQlACKVx/b
         ris6PmlMjeScnemT13W8JhFBIduLsTkSXCnnJYW/WiV45+9Wdrw54GH3SYpbNT0+OEnn
         TrW0Xp2La13lMiiVMwT5agmJ7VCv/XTz5CmQpfSa0ZJGFkOtrRA8kaKhpJnkXjhDlC6S
         A8tXs2EXYvg5geUlr8thE3y4tqx3UE98CvPnT+5uF/eCxH+/p2ArC7jQtuzaAmIkY/Lt
         T93A==
X-Forwarded-Encrypted: i=1; AJvYcCWw+XrvjWQpSu99vWZpzv9QWqHRX3WM+VVLXljwD5u9FiFD7OR9P1+nLcr7lReqMlmDfJHHUGqeSn5U2w4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxujUt4LxufJPZGOP72hlt+rs0ojPH+j5nwwAnGyk6bshBEYBmg
	JD085iIkaCXa8jcMxdyXFKZKKbYiQOs6rhxs87jZRJke231vmh/x
X-Google-Smtp-Source: AGHT+IEaJkjaI1Z6tqe57O4cY/kSpV7TlwQqKprn1eIz034AUHy+NubnWwLak/p5Xh3t4FDbODMYtg==
X-Received: by 2002:a17:907:96a7:b0:a8a:3f78:7b7b with SMTP id a640c23a62f3a-a93c4916e6cmr73897666b.14.1727392884471;
        Thu, 26 Sep 2024 16:21:24 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3989-b03c-7705-998b.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3989:b03c:7705:998b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27773c0sm50368166b.1.2024.09.26.16.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 16:21:24 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 27 Sep 2024 01:20:54 +0200
Subject: [PATCH 03/18] leds: flash: leds-qcom-flash: switch to
 device_for_each_child_node_scoped()
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240927-leds_device_for_each_child_node_scoped-v1-3-95c0614b38c8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727392874; l=1584;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=wZ6akrPJfNHUSfXIEENEHvfLrdMCasbCDwbd/LiltB0=;
 b=51y1SjR6ulBD3qqgS2qUF2cR+3GmbQoLP5twgUKAKBCLM1UNA7NMBuE8fYTAvAWvhCwVEKFCh
 S+CcP+wu+pwAJEAW1NzXp4grrO/7Uy2C/nu/OWMtTu//R6mCOAKLHae
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Switch to device_for_each_child_node_scoped() to simplify the code by
removing the need for calls to fwnode_handle_put() in the error paths.

This also prevents possible memory leaks if new error paths are added
without the required call to fwnode_handle_put().

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/leds/flash/leds-qcom-flash.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/leds/flash/leds-qcom-flash.c b/drivers/leds/flash/leds-qcom-flash.c
index 41ce034f700e..ab848c5acd2d 100644
--- a/drivers/leds/flash/leds-qcom-flash.c
+++ b/drivers/leds/flash/leds-qcom-flash.c
@@ -812,7 +812,6 @@ static int qcom_flash_led_probe(struct platform_device *pdev)
 {
 	struct qcom_flash_data *flash_data;
 	struct qcom_flash_led *led;
-	struct fwnode_handle *child;
 	struct device *dev = &pdev->dev;
 	struct regmap *regmap;
 	struct reg_field *regs;
@@ -896,7 +895,7 @@ static int qcom_flash_led_probe(struct platform_device *pdev)
 	if (!flash_data->v4l2_flash)
 		return -ENOMEM;
 
-	device_for_each_child_node(dev, child) {
+	device_for_each_child_node_scoped(dev, child) {
 		led = devm_kzalloc(dev, sizeof(*led), GFP_KERNEL);
 		if (!led) {
 			rc = -ENOMEM;
@@ -914,7 +913,6 @@ static int qcom_flash_led_probe(struct platform_device *pdev)
 	return 0;
 
 release:
-	fwnode_handle_put(child);
 	while (flash_data->v4l2_flash[flash_data->leds_count] && flash_data->leds_count)
 		v4l2_flash_release(flash_data->v4l2_flash[flash_data->leds_count--]);
 	return rc;

-- 
2.43.0


