Return-Path: <linux-leds+bounces-2823-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5F8987B9A
	for <lists+linux-leds@lfdr.de>; Fri, 27 Sep 2024 01:21:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED79B1C2274E
	for <lists+linux-leds@lfdr.de>; Thu, 26 Sep 2024 23:21:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3DAB1B07B0;
	Thu, 26 Sep 2024 23:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CeHSICb0"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A22D1B0135;
	Thu, 26 Sep 2024 23:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727392882; cv=none; b=mtsRsAUwAO9Wl4p0GBWb9tgLewfAlkiQyRvyPmY7x38diVK0fbEqDu2qaAc3Ex0mF0CRC9Az6UYjLAoOk8iJcaxbgaV2fNGXSttdVdj5JoW+FgwrYy6hqJfP6/F9YXZ4ZTreCdT31M++n98sS/zn6k7EPX2OHd1iDX+Us76oW/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727392882; c=relaxed/simple;
	bh=1/lxG5uyf8ycEv9Q6sKFSvHVcULTiG1X47zomtk2GFw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ewtTLnsYjI2r1HoJK5NAIcI1T0Upvu1DMXvYBqioieT776EITZW3K5RrSJ0E9wjrG7hucEAnpYg/vTni9voRcqb7ym6IZG2bozZzOnMXlJY9G312qtJz7y6igIKPDHVNdsh5MylXrHn6/8YfgcgDAS11ZRYeYNeEWRRw8KYW83E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CeHSICb0; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a8d6d0fe021so244075966b.1;
        Thu, 26 Sep 2024 16:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727392879; x=1727997679; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HGJHwDpR/ji/cnkncpEc2TmRR9IZ/lolVNsmw4iGQAY=;
        b=CeHSICb0gKqejYJR/aASEOyZ55yFEL+fhJlTrXUIcD9FSVrtz5VKYMIqZZ0Ma8PLuy
         g3yzYs7uqwdyagI5+8GJT9ogmZHw6KV1u7AOXLJxjEo/anKw4QMwil6+CqJXfah7f+cN
         iUUe1Xk9+iTZgcBa7D9IlJbCYIx8B/lfU6k6SKvQ9AnVuHK78Oe/xdhM9lBk40AxiixD
         8xmzQFMZSczxq8xvmuCJBDH5I72zyM91sACqswpmbqtdoh5Drn/lKWfhcFcynrLl4xxM
         iI2ZJhDHBDpu40mReXDsoaYKlSBGhSuQ0oXE0a9T8ARlUtQ/S7Js/Z5+EQEaFvMERh5I
         n8XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727392879; x=1727997679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HGJHwDpR/ji/cnkncpEc2TmRR9IZ/lolVNsmw4iGQAY=;
        b=h3/Djj4QC8bLITF953ERMn7XBsJiqGhBvOQvbRcIRMjOxNAVTs5G5dvQABiX9ysTqd
         nox/ONL++XrktKC0pxWvGWVbR17cnZPoZUgA46rvqFJmxsSQmnpo7bLaK4KsZUuSrEll
         ncVHFTEmr1xbWdpls8AsFJcnGRhyslepG8GVleJJ8r4HjKhFkVDuPapUzE42/m7Bsr3N
         lfS/I1jG51E0C4W2nbpa/4efWf3mLaCNOBuQupUBq1bhuBNjmM0fz2sXFz3wsZnnGhr+
         FBZpAFFaX0uWEin/N8cGVxGBLQ5sjlDNlLPlWZQNA1LY4zWbvV/lQYQTh1qi1JlUMjfd
         WJxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWcfPEgH9SgouBrjhCzIlxEbSft2TdMc8wxrXN16UD3e8xtgOqRIgVdczYObQPqKUEyaDwUqWe@vger.kernel.org, AJvYcCUiGgAhkHcoySCNouWlI20ZRU31qDSvMuvmu72H/jkMGmopv6L3ej4dUjvw4wgm0HhouvOpnFOk1+RnjNg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyK12NOzwogPluCjtYKBhPe8JpRdd1xDGYzZk1V6CNTkREC0OEW
	PjbyZVJJmuiBWVy7VVB4aeFz8AbwkTLxH+KsGRvyQZuuqmiuLJNN
X-Google-Smtp-Source: AGHT+IGY5Dz4pgmEK6u+H4dMIOw35D4e/9hhSxXD8+4Iw9UMbO9AvkfpZ6JWD1p0Ig/DDcHSjiCZSw==
X-Received: by 2002:a17:907:a41:b0:a86:91c3:9517 with SMTP id a640c23a62f3a-a93c496167fmr87272966b.35.1727392878703;
        Thu, 26 Sep 2024 16:21:18 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3989-b03c-7705-998b.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3989:b03c:7705:998b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27773c0sm50368166b.1.2024.09.26.16.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 16:21:18 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 27 Sep 2024 01:20:52 +0200
Subject: [PATCH 01/18] leds: flash: mt6360: fix
 device_for_each_child_node() refcounting in error paths
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240927-leds_device_for_each_child_node_scoped-v1-1-95c0614b38c8@gmail.com>
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
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727392874; l=1575;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=1/lxG5uyf8ycEv9Q6sKFSvHVcULTiG1X47zomtk2GFw=;
 b=l7jxa1PVRIFHMQnforadtxXgycvAan+1W9FAPjf/oLjtSQJykU+rNGG9xia/dfVKvn20xfSza
 2IKbNR03aEtAABYWTigl5u7JrFYAD61XGGxXgkaMcyX799cHVY4tp95
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

The device_for_each_child_node() macro requires explicit calls to
fwnode_handle_put() upon early exits to avoid memory leaks, and in
this case the error paths are handled after jumping to
'out_flash_realease', which misses that required call to
to decrement the refcount of the child node.

A more elegant and robust solution is using the scoped variant of the
loop, which automatically handles such early exits.

Fix the child node refcounting in the error paths by using
device_for_each_child_node_scoped().

Cc: stable@vger.kernel.org
Fixes: 679f8652064b ("leds: Add mt6360 driver")
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/leds/flash/leds-mt6360.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/leds/flash/leds-mt6360.c b/drivers/leds/flash/leds-mt6360.c
index 4c74f1cf01f0..676236c19ec4 100644
--- a/drivers/leds/flash/leds-mt6360.c
+++ b/drivers/leds/flash/leds-mt6360.c
@@ -784,7 +784,6 @@ static void mt6360_v4l2_flash_release(struct mt6360_priv *priv)
 static int mt6360_led_probe(struct platform_device *pdev)
 {
 	struct mt6360_priv *priv;
-	struct fwnode_handle *child;
 	size_t count;
 	int i = 0, ret;
 
@@ -811,7 +810,7 @@ static int mt6360_led_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	device_for_each_child_node(&pdev->dev, child) {
+	device_for_each_child_node_scoped(&pdev->dev, child) {
 		struct mt6360_led *led = priv->leds + i;
 		struct led_init_data init_data = { .fwnode = child, };
 		u32 reg, led_color;

-- 
2.43.0


