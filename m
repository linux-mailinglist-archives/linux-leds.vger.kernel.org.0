Return-Path: <linux-leds+bounces-2838-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 115E0987BC1
	for <lists+linux-leds@lfdr.de>; Fri, 27 Sep 2024 01:25:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C16F4285C41
	for <lists+linux-leds@lfdr.de>; Thu, 26 Sep 2024 23:25:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E5DE1B3B0D;
	Thu, 26 Sep 2024 23:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M20uEIee"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28A91B375D;
	Thu, 26 Sep 2024 23:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727392916; cv=none; b=DXP+jF27kBq8+On3EU1s3+fwvakoTRejN65MX1jNbBpFyJcmJ9Vr+8e7SWsNQrcjcLl60VO0fdKSOZfdbgwdsT/GAL3cRvVs1QTBJbmWrdqeWTHzMQuGqkbpL07q2yzr7jLi6zGCxdoG2NdyYsuqvP5lXn+OSpHCOoqWkraq7Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727392916; c=relaxed/simple;
	bh=uZ6AU+qHxNHc+7ZSbOLvFpKS951bl9x9VeT+GuFOE+o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j7W8Sip0WlzouJa+MM/fMkMf4p/VishzspWecw2AoEDe699oId+zkghUQL5Tcz78qbml8EWERwjLyXCYrHTL6xya6A/87dVPv4xU1ss/Y+Afqc2YkdxfY+dvAhKrVn/b9V+/E1dCph23uodh7h7jPSx677649bNibKHn6eoWmbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M20uEIee; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a93a1cda54dso199224566b.2;
        Thu, 26 Sep 2024 16:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727392913; x=1727997713; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NM+8ic/Px3mQTsuCcs62/53dsl/B3jVBAf4+IMQjl4A=;
        b=M20uEIeezalgqPg4rC+dIeKgx90p1389IMYDibmYzBJZ8xsXrjh0h8803N49d3/w+4
         9meI2BATrrDbkdXo3ay6V3RoLsF+zFI1EC4m0UExCr4Wz9NW7FUQbhBdBaklCz+4snh8
         kqIDcO2/jepsaz+A3927xEY5j57mVogzBatnLAl4sWQ8VuW6L0HR4gWL6ynX+9vCJwfG
         LSIBvBbvuKTmkdwdNbTZklmj/GocZSQV1rbKGOLiQUi0jJCPov/7hNkVz9CaXE95ff3k
         K0e4rFrHZONV9yvqpcM8uDet1SCeeVq+OjOYjJh+up/XR6MFYYwSrKcNNXtLZTdo5lcm
         uv8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727392913; x=1727997713;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NM+8ic/Px3mQTsuCcs62/53dsl/B3jVBAf4+IMQjl4A=;
        b=rk0M6GmG+kknt581lYRWTUwooBJNIEdl/fgr8whvnLww2zrzAHbUil89ifTs7nPR79
         Z0G3QzuB8+aq2K2cNTXIuB7zBVLOJbeHMI91re1nvOIAxOphnj8B2R6vZAL03Id3IVcv
         84sx+gi0SO555BU1xovwVkv+HUV/kKlxlsCcRRkemeFr9bmdVOYF4FP9qB96clRZdAxO
         LF6YUoLB8NYaiKQDHXeDg+RPtEy3sVnxYujJ+WK2m6ZyVuRUy1hNSWPMsfv0VOwVL1Yk
         avK5qqsVFrOsEm/0sbjghvko4Q0cIiwsPJ2o8exq/RicTCyQTN52er4YO7t64OOgn0LO
         EJ+A==
X-Forwarded-Encrypted: i=1; AJvYcCUtuRrIWTMDDvzyHko6urZA4j/a18GP+H7cS3y3aoXBtZRoDwtTAdCewustBgZHXIlVLl+rI9wUHLYcq7w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy27GtcU49akgahtOLdgIzbTTX609JL6hgkqwD9fxx0qgZPoWPu
	IylXjgaz/QbW86pfTmh5oqhIeekz+ehMXr7v+kY80+gOyWI0/aag
X-Google-Smtp-Source: AGHT+IEjGS5H1uM127zHsUDENMHQP4peBo2B0LKYmvOBCuq2OU03bEqMYA+oUjVvyxH/GoEWditQPw==
X-Received: by 2002:a17:907:1c0f:b0:a86:aee7:9736 with SMTP id a640c23a62f3a-a93c4ac9334mr83767066b.46.1727392912970;
        Thu, 26 Sep 2024 16:21:52 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3989-b03c-7705-998b.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3989:b03c:7705:998b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27773c0sm50368166b.1.2024.09.26.16.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 16:21:51 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 27 Sep 2024 01:21:07 +0200
Subject: [PATCH 16/18] leds: tca6507: switch to
 device_for_each_child_node_scoped()
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240927-leds_device_for_each_child_node_scoped-v1-16-95c0614b38c8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727392874; l=1443;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=uZ6AU+qHxNHc+7ZSbOLvFpKS951bl9x9VeT+GuFOE+o=;
 b=NGlWdNHQgGpOwQAC3L9GY90Rn3MtzUIW2LrL0gjOsK+kWA98v8Pom7eibl6iKW9m1g68g/UJo
 C3/17jLgkcHBEyM4LlOU2NTx5/2Qx+Dapk5n5sfsJBSp2CMoP1wmmcy
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Switch to device_for_each_child_node_scoped() to simplify the code by
removing the need for calls to fwnode_handle_put() in the error path.

This also prevents possible memory leaks if new error paths are added
without the required call to fwnode_handle_put().

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/leds/leds-tca6507.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-tca6507.c b/drivers/leds/leds-tca6507.c
index 4f22f4224946..acbd8169723c 100644
--- a/drivers/leds/leds-tca6507.c
+++ b/drivers/leds/leds-tca6507.c
@@ -658,7 +658,6 @@ static struct tca6507_platform_data *
 tca6507_led_dt_init(struct device *dev)
 {
 	struct tca6507_platform_data *pdata;
-	struct fwnode_handle *child;
 	struct led_info *tca_leds;
 	int count;
 
@@ -671,7 +670,7 @@ tca6507_led_dt_init(struct device *dev)
 	if (!tca_leds)
 		return ERR_PTR(-ENOMEM);
 
-	device_for_each_child_node(dev, child) {
+	device_for_each_child_node_scoped(dev, child) {
 		struct led_info led;
 		u32 reg;
 		int ret;
@@ -688,10 +687,8 @@ tca6507_led_dt_init(struct device *dev)
 			led.flags |= TCA6507_MAKE_GPIO;
 
 		ret = fwnode_property_read_u32(child, "reg", &reg);
-		if (ret || reg >= NUM_LEDS) {
-			fwnode_handle_put(child);
+		if (ret || reg >= NUM_LEDS)
 			return ERR_PTR(ret ? : -EINVAL);
-		}
 
 		tca_leds[reg] = led;
 	}

-- 
2.43.0


