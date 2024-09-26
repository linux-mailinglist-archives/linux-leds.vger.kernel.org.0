Return-Path: <linux-leds+bounces-2837-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7A9987BBF
	for <lists+linux-leds@lfdr.de>; Fri, 27 Sep 2024 01:25:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D0135286A58
	for <lists+linux-leds@lfdr.de>; Thu, 26 Sep 2024 23:25:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9925D1B374E;
	Thu, 26 Sep 2024 23:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RVB2m4bT"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4361B3739;
	Thu, 26 Sep 2024 23:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727392913; cv=none; b=iXSFxWJYkRu+X7mEArseDl9zmu96pHB/axbq1ZmA02XH752Vsg7POmH5duthY7U2CuK+DCpmaZFbM/BPlAWxdqa/QSObFmSqR5LKdL4shSJREgdUjjU1erg50s6DMjsLlhZ6z/WIK7SwrpUcOn8pKz+JVd1rxevxdsUuWnnTIqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727392913; c=relaxed/simple;
	bh=Fm7F+4MLH582iBnJnE4p4FnmOoiX1OKki6L98DcIN8s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EMToa2iEyngUmE9MDokTqq8M/81pwfpeqWT9v3QlasOCoTqqz+V8emFzm1uXhJhJoOcT6zbselGRDg45AZYG9WHsbO08CKSz/XI7jvGaovpGtB4ZTkfC7/bEUo4HrfcoKLlBuc9jkWmg6shspLU1NWILYEXXXPGDYkYFJKUAoBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RVB2m4bT; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a8d56155f51so176267766b.2;
        Thu, 26 Sep 2024 16:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727392910; x=1727997710; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KxTvYBMAH6K76CxmrsMQCXDoyFzNi14dQqKe3hz4/gE=;
        b=RVB2m4bTgAPvuXM5vsxXUXNjIg2u+i6cLz99IN97LBLD4gjgkz8AMUh2J3Et9UIJlb
         mwgWW+lAwV/aZj85BQ2cBu3qy9k00GagdZlaAHZcmCWUOE6yM0adrQOxDoDWE9T/afrV
         zP5xJbvwTu8fgbVYgkOddjjMPv+zpWfIsT/l1whKbO4Mhva1CpjJAtssG9qKvKNlqfpQ
         mGlVieBMGe3t/5s+Pms00oZBx2UD7KPT5JPu/U9FqMuK2NRbhlDBaNozOz0AJqf1h7Lj
         7xq5aGCQRxoFYruaFBUp/vm5yo43mVBSypn1jA0dopsFZcIwUMsJqHnz2EL9fdDh8A8I
         iezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727392910; x=1727997710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KxTvYBMAH6K76CxmrsMQCXDoyFzNi14dQqKe3hz4/gE=;
        b=iC9hsZv1PStbbnISjjBuHnjHjCegcl9dPOJrfYcR3HneUpgd8BKsBpiSdhotBPUQ0z
         GS1CxHb0DdiH/1ltNj7DHvRvcsgE5DpEhztrbcFihbfVwGv5xRSxE2Q/z110GPPkJV4R
         8mpZ3khmFRiIE3PrdaSYxGsnOc1zH38LhgQaUK4A90P81hT5P292xMQsSPnYRe183Nzn
         oU7/XVZVsnyygL1aOxp45gik686FEvn7QM5DjHWcsirhHaRS53kiHtV7qMKB8jmsd7R7
         1GMBovjcEALnY7x5KoZrRZMxiWG1czg+ytuPnn/voeQOI6rLz79WztOLuKl6F4BlD1Lq
         +g+A==
X-Forwarded-Encrypted: i=1; AJvYcCUPI2+UTMO1ptz5vrI09WW00v2UlNDMuBeD2JswXwHoMHycM7DcCQJpVvAghqWHNVQz1KrqWumRUDFIdY8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0MmKEfPA78ZokWs7q2dbeExHIjOK/5mV+TW3DFE8VbJRJr5qA
	XeTE62pjBWwGELhg3l+ucFHQwZFT+DdB9m031p5OjqbTqkSsmYVE
X-Google-Smtp-Source: AGHT+IGRFpVHqTjLsEHhuX5kjF6xyPuBHJW+zrrF725EKx1jN/+wFjAEQNE/hCfydi8zaA50x0RLFw==
X-Received: by 2002:a17:907:7e85:b0:a77:f2c5:84b3 with SMTP id a640c23a62f3a-a93c491f380mr76021266b.22.1727392910067;
        Thu, 26 Sep 2024 16:21:50 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3989-b03c-7705-998b.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3989:b03c:7705:998b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27773c0sm50368166b.1.2024.09.26.16.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 16:21:49 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 27 Sep 2024 01:21:06 +0200
Subject: [PATCH 15/18] leds: sun50i-a100: switch to
 device_for_each_child_node_scoped()
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240927-leds_device_for_each_child_node_scoped-v1-15-95c0614b38c8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727392874; l=3318;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=Fm7F+4MLH582iBnJnE4p4FnmOoiX1OKki6L98DcIN8s=;
 b=f73Nl+8leOeKTCe124dSLiK3ZYOKg3Q7P72HDYcJ6IZ07AvEQUvjA731Hl8QEMGU3egu+VFHI
 +vPMS/2qRmIBoqp6rhj8XlbLqzyW7QoOokmZylHrnKLr2RNAmi848fy
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Switch to device_for_each_child_node_scoped() to simplify the code by
removing the need for calls to fwnode_handle_put() in the error paths.

This also prevents possible memory leaks if new error paths are added
without the required call to fwnode_handle_put().

The error handling after 'err_put_child' has been moved to the only goto
that jumps to it (second device_for_each_child_node()), and the call to
fwnode_handle_put() has been removed accordingly.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/leds/leds-sun50i-a100.c | 27 +++++++++------------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/drivers/leds/leds-sun50i-a100.c b/drivers/leds/leds-sun50i-a100.c
index 4c468d487486..03f1b6424692 100644
--- a/drivers/leds/leds-sun50i-a100.c
+++ b/drivers/leds/leds-sun50i-a100.c
@@ -392,7 +392,6 @@ static int sun50i_a100_ledc_probe(struct platform_device *pdev)
 	struct sun50i_a100_ledc_led *led;
 	struct device *dev = &pdev->dev;
 	struct sun50i_a100_ledc *priv;
-	struct fwnode_handle *child;
 	struct resource *mem;
 	u32 max_addr = 0;
 	u32 num_leds = 0;
@@ -402,21 +401,17 @@ static int sun50i_a100_ledc_probe(struct platform_device *pdev)
 	 * The maximum LED address must be known in sun50i_a100_ledc_resume() before
 	 * class device registration, so parse and validate the subnodes up front.
 	 */
-	device_for_each_child_node(dev, child) {
+	device_for_each_child_node_scoped(dev, child) {
 		u32 addr, color;
 
 		ret = fwnode_property_read_u32(child, "reg", &addr);
-		if (ret || addr >= LEDC_MAX_LEDS) {
-			fwnode_handle_put(child);
+		if (ret || addr >= LEDC_MAX_LEDS)
 			return dev_err_probe(dev, -EINVAL, "'reg' must be between 0 and %d\n",
 					     LEDC_MAX_LEDS - 1);
-		}
 
 		ret = fwnode_property_read_u32(child, "color", &color);
-		if (ret || color != LED_COLOR_ID_RGB) {
-			fwnode_handle_put(child);
+		if (ret || color != LED_COLOR_ID_RGB)
 			return dev_err_probe(dev, -EINVAL, "'color' must be LED_COLOR_ID_RGB\n");
-		}
 
 		max_addr = max(max_addr, addr);
 		num_leds++;
@@ -502,7 +497,7 @@ static int sun50i_a100_ledc_probe(struct platform_device *pdev)
 		return ret;
 
 	led = priv->leds;
-	device_for_each_child_node(dev, child) {
+	device_for_each_child_node_scoped(dev, child) {
 		struct led_classdev *cdev;
 
 		/* The node was already validated above. */
@@ -527,7 +522,11 @@ static int sun50i_a100_ledc_probe(struct platform_device *pdev)
 		ret = led_classdev_multicolor_register_ext(dev, &led->mc_cdev, &init_data);
 		if (ret) {
 			dev_err_probe(dev, ret, "Failed to register multicolor LED %u", led->addr);
-			goto err_put_child;
+			while (led-- > priv->leds)
+				led_classdev_multicolor_unregister(&led->mc_cdev);
+			sun50i_a100_ledc_suspend(&pdev->dev);
+
+			return ret;
 		}
 
 		led++;
@@ -536,14 +535,6 @@ static int sun50i_a100_ledc_probe(struct platform_device *pdev)
 	dev_info(dev, "Registered %u LEDs\n", num_leds);
 
 	return 0;
-
-err_put_child:
-	fwnode_handle_put(child);
-	while (led-- > priv->leds)
-		led_classdev_multicolor_unregister(&led->mc_cdev);
-	sun50i_a100_ledc_suspend(&pdev->dev);
-
-	return ret;
 }
 
 static void sun50i_a100_ledc_remove(struct platform_device *pdev)

-- 
2.43.0


