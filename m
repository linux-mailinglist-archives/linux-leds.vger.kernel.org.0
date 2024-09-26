Return-Path: <linux-leds+bounces-2832-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 801A0987BB5
	for <lists+linux-leds@lfdr.de>; Fri, 27 Sep 2024 01:24:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 131BA1F24575
	for <lists+linux-leds@lfdr.de>; Thu, 26 Sep 2024 23:24:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A98571B29C9;
	Thu, 26 Sep 2024 23:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jCEsEMwj"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B52F1B29A9;
	Thu, 26 Sep 2024 23:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727392901; cv=none; b=GYO8kQuEvIuQGbzPOKc4GaxQ12McxBB5yWj2w6e0gSszj3Jby2y/SDxbJEV/svO2wTuQTChhh5hTXRGz8/96i+8frx9VULuGYiaaXlMSb2ZS+zLQQozIkewgv/8e5MYrgnfc2LkDG0ekzbieh25v+OP7uEttmzFD7dAi+QYVe9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727392901; c=relaxed/simple;
	bh=wVCMNpNXMBYRf/3Qo+CvGWvj1uX3gLZ/0II5tIZcKP4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LNYFIRp9esC71/19aNujp1SVlBWJeW/Zzq897F1NbEbKmcqPBiB/d1LKqPxWxpJ2tAuUaDLaX/u8a3VzKpB0Ikq+YbE3SQWnc4qb02QLzu4spxXMxHxobNBvXzCONI55E7OeYPm+pQhS+65oY+YZuJ6FasokIBFGaRt2Q2dBps4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jCEsEMwj; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5356bb5522bso1911727e87.1;
        Thu, 26 Sep 2024 16:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727392898; x=1727997698; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SbKG8yQzAXSNKnNqMlC3vDG+SObBOdoBsMSFHrHh/gQ=;
        b=jCEsEMwjpKHyrTRIIUajscpo1nqwp3l1TzBhgSiWhP4Yg5bShrCR5/qIc7U5jEDafd
         GNKdzrMojjd47YYosAFJNiXGQmn1kSHFr2lh99TFtJWAzz8WX8oMO+jouHqIo4bfXg6h
         5G5+oAlO03qbxbKHMr9ar2Qk4LhQYxKdk5oiKApiOm3XmaB5S786BHZ7tKq2F4FUgclM
         /Ed1oArOu7HjedBHYvWpI6L+vrmuibJlSLurtC62ngJQIP1Dz+Zgre3eE/4RpQ7hqwp+
         xUaH7QTnwqCXcejqIH9d23LN8usWnj9efokNyD5nUS3axOSnQukqE+qE0MQB3i82O8qy
         Oilg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727392898; x=1727997698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SbKG8yQzAXSNKnNqMlC3vDG+SObBOdoBsMSFHrHh/gQ=;
        b=KhZVKI3Q7KVwqdD9JSYc8SIPWqD044QRh8mflt9uPLvNKnyVX8mlKFptL/CwDYii34
         dxAcYSV42nceBBsKEe6DxkU+GDZLw0sWYdtTSz8GNSq36RCIMXIcTg6QlP30QEH3A7yd
         B+yTU14GqpvcCQtmm+5LNUMLG00FSHX+9440yurqRfMNRvE0gl6lz8wKK38HKk5I+wzN
         PG7cGY8Q4dGF3qDiiVPMmGpHqUQbvUnoO3konIDkCVW1W01B1rAzkGu8nhCsjEwKZ9T4
         yThkqakYs1NOCvOs+qTNbcQtetfL1wi/FFxwK10HYYspdbIX1fC/XLyO7z09HRP3+mIn
         eDnw==
X-Forwarded-Encrypted: i=1; AJvYcCVtbPBAut/EhNo1EIpgBVoJG4pt1G2+fF7W9MGnhUMxriW53sVur0AI4aghyW+ryJxPdYbQeHEERw+Vqw8=@vger.kernel.org
X-Gm-Message-State: AOJu0YweKgOfnxVxCx/dnt7tjXxJV9SnljZAn/0OHz65vg5EkbcxdMye
	xMat+8I2daiZcGwv+R5ztYHebeJYPGcDJIkku1EOhkfGk7yUEBjG7aoCVN8e
X-Google-Smtp-Source: AGHT+IHargOBULwRmlTYho66CY6TIIKNF6jhPFgs1jxdfin7EzZ3x+Ihx+4IF9Pdg3mdG2UXbYfTUQ==
X-Received: by 2002:a05:6512:3b0e:b0:533:4477:28a2 with SMTP id 2adb3069b0e04-5389fc3bd4cmr983572e87.16.1727392898039;
        Thu, 26 Sep 2024 16:21:38 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3989-b03c-7705-998b.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3989:b03c:7705:998b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27773c0sm50368166b.1.2024.09.26.16.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 16:21:37 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 27 Sep 2024 01:21:01 +0200
Subject: [PATCH 10/18] leds: lp50xx: switch to
 device_for_each_child_node_scoped()
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240927-leds_device_for_each_child_node_scoped-v1-10-95c0614b38c8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727392874; l=2725;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=wVCMNpNXMBYRf/3Qo+CvGWvj1uX3gLZ/0II5tIZcKP4=;
 b=gvqzp5RpDFRs+Bq7QHctcXoi4uXIDmfAqWPfacNwek7XmLGTnkrq8CcrnDg8YhcpKi7G9Dh5l
 Mj0YUm6RICjA0yWhlPqzXPpjj3PJpAdJDq6e44FbnnPGX71dsvI63Wq
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Switch to device_for_each_child_node_scoped() to simplify the code by
removing the need for calls to fwnode_handle_put() in the error paths.

This also prevents possible memory leaks if new error paths are added
without the required call to fwnode_handle_put().

After switching to the scoped variant, there is no longer need for a
jump to 'child_out', as an immediate return is possible.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/leds/leds-lp50xx.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
index 175d4b06659b..32ca45aec76c 100644
--- a/drivers/leds/leds-lp50xx.c
+++ b/drivers/leds/leds-lp50xx.c
@@ -434,7 +434,6 @@ static int lp50xx_probe_leds(struct fwnode_handle *child, struct lp50xx *priv,
 
 static int lp50xx_probe_dt(struct lp50xx *priv)
 {
-	struct fwnode_handle *child = NULL;
 	struct fwnode_handle *led_node = NULL;
 	struct led_init_data init_data = {};
 	struct led_classdev *led_cdev;
@@ -454,17 +453,17 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
 	if (IS_ERR(priv->regulator))
 		priv->regulator = NULL;
 
-	device_for_each_child_node(priv->dev, child) {
+	device_for_each_child_node_scoped(priv->dev, child) {
 		led = &priv->leds[i];
 		ret = fwnode_property_count_u32(child, "reg");
 		if (ret < 0) {
 			dev_err(priv->dev, "reg property is invalid\n");
-			goto child_out;
+			return ret;
 		}
 
 		ret = lp50xx_probe_leds(child, priv, led, ret);
 		if (ret)
-			goto child_out;
+			return ret;
 
 		init_data.fwnode = child;
 		num_colors = 0;
@@ -475,10 +474,8 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
 		 */
 		mc_led_info = devm_kcalloc(priv->dev, LP50XX_LEDS_PER_MODULE,
 					   sizeof(*mc_led_info), GFP_KERNEL);
-		if (!mc_led_info) {
-			ret = -ENOMEM;
-			goto child_out;
-		}
+		if (!mc_led_info)
+			return -ENOMEM;
 
 		fwnode_for_each_child_node(child, led_node) {
 			ret = fwnode_property_read_u32(led_node, "color",
@@ -486,7 +483,7 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
 			if (ret) {
 				fwnode_handle_put(led_node);
 				dev_err(priv->dev, "Cannot read color\n");
-				goto child_out;
+				return ret;
 			}
 
 			mc_led_info[num_colors].color_index = color_id;
@@ -504,16 +501,12 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
 						       &init_data);
 		if (ret) {
 			dev_err(priv->dev, "led register err: %d\n", ret);
-			goto child_out;
+			return ret;
 		}
 		i++;
 	}
 
 	return 0;
-
-child_out:
-	fwnode_handle_put(child);
-	return ret;
 }
 
 static int lp50xx_probe(struct i2c_client *client)

-- 
2.43.0


