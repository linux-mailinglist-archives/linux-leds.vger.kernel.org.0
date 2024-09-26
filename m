Return-Path: <linux-leds+bounces-2839-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA045987BC3
	for <lists+linux-leds@lfdr.de>; Fri, 27 Sep 2024 01:25:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADDFE286EA2
	for <lists+linux-leds@lfdr.de>; Thu, 26 Sep 2024 23:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D38C1B3B26;
	Thu, 26 Sep 2024 23:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bNIIMx3K"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6D51B1408;
	Thu, 26 Sep 2024 23:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727392919; cv=none; b=G2n14s0esqWYTIitPfF3W/Qw4Tr8NR0i8T6wzYJx0CVD1WWITbykSCdsmP4MTO6mIjNB5QcOEnGI5Q5TMygrgOutR//EIuc6T0CldLT6T1mKTyVxpwwt73jtKYQ2c4xSfsZ8U6b4VOnsv1nX6XI4lkZgrVy0UR6fXTxI20tCQKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727392919; c=relaxed/simple;
	bh=Upol74WYOlhW6c4peUbPQECrXBC2IELBkPGR+0SYZwE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kvc99W7y9WqzALbM03375LFOpC4d7hcUTUxXDaK/lJz8rNLOAjUhPzrQEp8KSvUBXhAApzJx1uXtcjGEWMkWJTOtIJlTJU74GopULcHmk8fKu0uiuXVJmZUw0D67QOzT79JQ8PPVlILPDQv6JQNuni57TB76YFwi2v7IZBlxd3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bNIIMx3K; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a8ce5db8668so235704966b.1;
        Thu, 26 Sep 2024 16:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727392916; x=1727997716; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WkHqvkI/1/i2Yqceu5g2GJiVANgvtprMciXZ8BQ+brY=;
        b=bNIIMx3K03a74a8k/jR634uO86f6Ncvp5cpdsoWImXK/c5wuAfg8XRI813wHhfMgth
         Wj8mtroB5lMkgDhRFgbguagkCGPrM+XlJYN5gKbSF8PlU1rNmhx0SbFIlgEHx4blVWE6
         aKZbmyAxseguxDky8InW9AvVwg1S30O1mK5a3q0Gj6vQHg5JPfVwciS8cmeLUHojHxMc
         ZAbTA6IUfaKlKr1yXbPGIhNvw28gwIMWoVz4uAxw7hi6UytKNf69Vk42kdOMh/efVvn3
         6S0KnSl0Zgd0MkH3AkBm9LOHNQVFwwb2TX2VAre+R3CgC8GBSKPMdVGabQYH66GGP/YO
         fOdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727392916; x=1727997716;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WkHqvkI/1/i2Yqceu5g2GJiVANgvtprMciXZ8BQ+brY=;
        b=J+KZbmoWfkrnPIWsKPb4oeWh3tqc6c9BLjaFZxRJj71TbpERGjLSnTO7veMlZcmTXj
         EPvK7//lNJX8CC3kEXwkBgMVk9vhhd+bwi3OQrjloNqhe7ldJ10q8WTPaqkD4L5QUWt7
         3OhTJbHh3TekWV+VeysFi7JdTYWTfdTydS+run8RVd9jyzVN28PYNPfGMP9E1Z7T5vmM
         wn4ZtY7l+NtB/ZCkybaWqSSwQuZIBBEJtBaEA2SDu+yx1hzFTdywEcBwEjRvh3QCSm/x
         IpE4VkBe+SlwHGTSEEVWlVrDCOO1hChDY/HHm77cqyxkzWvUHuEoS5S3nk3j11q0NPTK
         PkKw==
X-Forwarded-Encrypted: i=1; AJvYcCWJ3vww7mAju+i0pj94y2QwBQYNr1sXURUW/XN3tAfWbSSPR1eWmnDNrNXboC4gCk17gso4FhSH8EJhjgs=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywpg71HLVVyQ5ZbOSI7+MHvk8R5bKEOlQ7HHhw1bnxxQ1ZupdbQ
	EFrdDJZv0l3cTBQ2/NgjVTCc3dIsNUbnl0b/CvBLokc4aVQIifci
X-Google-Smtp-Source: AGHT+IHu7GUf4pEGuh3ajW4RTtn5QFJeznBoUNPfpuLLhiJAhuYOKyTqQymBYsqixg5g1+2YdfLoVw==
X-Received: by 2002:a17:907:7b91:b0:a86:c825:7678 with SMTP id a640c23a62f3a-a93c4a98df0mr96575666b.64.1727392915679;
        Thu, 26 Sep 2024 16:21:55 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3989-b03c-7705-998b.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3989:b03c:7705:998b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27773c0sm50368166b.1.2024.09.26.16.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 16:21:54 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 27 Sep 2024 01:21:08 +0200
Subject: [PATCH 17/18] leds: rgb: ktd202x: switch to
 device_for_each_child_node_scoped()
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240927-leds_device_for_each_child_node_scoped-v1-17-95c0614b38c8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727392874; l=1313;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=Upol74WYOlhW6c4peUbPQECrXBC2IELBkPGR+0SYZwE=;
 b=f5ds5pKXTIF+B1jMaYwlb8PPJAHi7VfKk6RXlM18dKn8C3IQVGT8JccELHUU4Z+ooOWcfqKQS
 27cVaVRUn+uAh7+rCzd53VFlBKfzGLxtf5g5DJWnaFLJwjdJFD+8kOV
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Switch to device_for_each_child_node_scoped() to simplify the code by
removing the need for calls to fwnode_handle_put() in the error path.

This also prevents possible memory leaks if new error paths are added
without the required call to fwnode_handle_put().

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/leds/rgb/leds-ktd202x.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/rgb/leds-ktd202x.c b/drivers/leds/rgb/leds-ktd202x.c
index d5c442163c46..04e62faa3a00 100644
--- a/drivers/leds/rgb/leds-ktd202x.c
+++ b/drivers/leds/rgb/leds-ktd202x.c
@@ -495,7 +495,6 @@ static int ktd202x_add_led(struct ktd202x *chip, struct fwnode_handle *fwnode, u
 
 static int ktd202x_probe_fw(struct ktd202x *chip)
 {
-	struct fwnode_handle *child;
 	struct device *dev = chip->dev;
 	int count;
 	int i = 0;
@@ -509,13 +508,12 @@ static int ktd202x_probe_fw(struct ktd202x *chip)
 	/* Allow the device to execute the complete reset */
 	usleep_range(200, 300);
 
-	device_for_each_child_node(dev, child) {
+	device_for_each_child_node_scoped(dev, child) {
 		int ret = ktd202x_add_led(chip, child, i);
 
-		if (ret) {
-			fwnode_handle_put(child);
+		if (ret)
 			return ret;
-		}
+
 		i++;
 	}
 

-- 
2.43.0


