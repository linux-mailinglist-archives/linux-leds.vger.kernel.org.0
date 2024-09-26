Return-Path: <linux-leds+bounces-2830-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD176987BAD
	for <lists+linux-leds@lfdr.de>; Fri, 27 Sep 2024 01:23:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84A87286922
	for <lists+linux-leds@lfdr.de>; Thu, 26 Sep 2024 23:23:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 337EF1B2513;
	Thu, 26 Sep 2024 23:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="myN/rJcP"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644091B011E;
	Thu, 26 Sep 2024 23:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727392898; cv=none; b=GqsiyeqXRIXVKNRX5UydstWw4zbci19ERkH6yMako0TnspD+AOeewKmj9UzDDFm/xanWaSnc5g8V+Jj0rXfB50xNvTAn3ygJAuaFwsVe6F8Du1qendiL7jbyZOCoC2ksUzeSQYRjrw2Ib671L6AWT7iyPjHXofvPfUs6dWq05XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727392898; c=relaxed/simple;
	bh=v0iYfIBPWrhBeMk5GmLZkiz62OQVqii6tL7xBG0nuYo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hq00gFDN30PCWikqSE5f6S9TjW8Tvc9Jag+O5nrHQDZYZZOhA2I03XC+ORObWKOwpXz6oDCbCKZDISwo8Lydab39g5ByaZ4QkwfQtiazHoeNiFSGQSfq4XEKEHId8xIbG1geIdkcJUWK6xYRl9jHgP0IPGGDau/ltI7hGtrKWUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=myN/rJcP; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a8a7b1c2f2bso219137666b.0;
        Thu, 26 Sep 2024 16:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727392895; x=1727997695; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9z03eGnj6iGqYzDELmW5r9JfCTcrG6sf4eOCgWvySkE=;
        b=myN/rJcPQl/Xt2Mo07MDV9otKzSsI1xTjiJUO5qJ3pJ9wBX8qb0xNywr9eL4T/mey1
         dFGeKFN3dxlh5KL5xxsnC//gh8+ta/45Qv04bD3qyKpi4k6IshWhZA4FA4RVXBWFfGtG
         5X6yzKgtNZzZpkkfTG38KJxGCQWwnj2iRog8suV63HRSLe9gf3ULDN1FmCEWptHxqQJI
         ncx1GKC/SSbDVXn73Q/1QoqHwRDty8LtWSQp2quj8J3Meidl9u+JuXjq7my8Blt95oYN
         ZNRk4O5SFrx+eZBBpJlJ9IMxOCD18ON0Xa5IhOK/MiJQXEyB2XpMAdT7yjPAOTx6nyBv
         5u9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727392895; x=1727997695;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9z03eGnj6iGqYzDELmW5r9JfCTcrG6sf4eOCgWvySkE=;
        b=Ey1JXFrFq02xGVqVyHC6xpeygbpj68qW86NY/KhQxJUi6y63QQbCs/KE4kzTIejvjW
         GSs3Uk7YUPXeO2O1AJbt2ScJmqnrDUJD5Nhvf8gw+2X/zkSDtkoUA0QqYtAyIUUjJRp5
         iG4NtqRypFwH7wmgstsdw+gXeYT3rGGpZQ3wT60SaRV5xpdvoOqBqvnUnelRLkkXyTyZ
         9vF//WFO4oIKDEpWEvZ+xn7IyCrw4yCNX7iB5p74zfUEqgZXl9TV5QgH1ribqZeyLYIX
         SZNcsAOyzrnvDO+VZx22MCpFVDtlktkLMhj2DBtwOD3u8f+HbUVz6gtf6hwqZ+J/q4jV
         N8JQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnMd194ejSlA7QC9tUMkL4S32tG4cECi2LiR0iQQN+4hywwTd/MEoqgfekVGXnU3vd3r61qPGdkt4l+e4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDkyM27Ry0WtqLHjxY1vrF3fEscFqc/q+QDwLts7/C5qX50uhk
	CzeIKJLCr+UqxAY1dY6wUBYWHbTNCXEjjp33/the1xmFt2LKZ9spM23URfMT
X-Google-Smtp-Source: AGHT+IHzRwIU6UAzlavm/QZ6zyKdlkN5H8May0eKhpEiWtxIy3j8Q0eikPpKvoRwQ2Ar8Be+Bn0Hew==
X-Received: by 2002:a17:906:4787:b0:a8b:154b:7643 with SMTP id a640c23a62f3a-a93c492a5dcmr98770966b.28.1727392894740;
        Thu, 26 Sep 2024 16:21:34 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3989-b03c-7705-998b.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3989:b03c:7705:998b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27773c0sm50368166b.1.2024.09.26.16.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 16:21:34 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 27 Sep 2024 01:20:59 +0200
Subject: [PATCH 08/18] leds: lm3532: switch to
 device_for_each_child_node_scoped()
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240927-leds_device_for_each_child_node_scoped-v1-8-95c0614b38c8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727392874; l=2745;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=v0iYfIBPWrhBeMk5GmLZkiz62OQVqii6tL7xBG0nuYo=;
 b=vv0qMx18gJDO2AXmo395Dj+OG11mPwp0TR26/SNLfM9jrHi1Va8TeNdbSx8stlq/n+ILIf4c3
 gYOYGMQVm0qArDwfN4d+6vbuDJ3QihySKHfjHS8w1myjgZBJRpxCUpZ
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
 drivers/leds/leds-lm3532.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/leds/leds-lm3532.c b/drivers/leds/leds-lm3532.c
index 54b5650877f7..24dc8ad27bb3 100644
--- a/drivers/leds/leds-lm3532.c
+++ b/drivers/leds/leds-lm3532.c
@@ -551,7 +551,6 @@ static void gpio_set_low_action(void *data)
 
 static int lm3532_parse_node(struct lm3532_data *priv)
 {
-	struct fwnode_handle *child = NULL;
 	struct lm3532_led *led;
 	int control_bank;
 	u32 ramp_time;
@@ -587,7 +586,7 @@ static int lm3532_parse_node(struct lm3532_data *priv)
 	else
 		priv->runtime_ramp_down = lm3532_get_ramp_index(ramp_time);
 
-	device_for_each_child_node(priv->dev, child) {
+	device_for_each_child_node_scoped(priv->dev, child) {
 		struct led_init_data idata = {
 			.fwnode = child,
 			.default_label = ":",
@@ -599,7 +598,7 @@ static int lm3532_parse_node(struct lm3532_data *priv)
 		ret = fwnode_property_read_u32(child, "reg", &control_bank);
 		if (ret) {
 			dev_err(&priv->client->dev, "reg property missing\n");
-			goto child_out;
+			return ret;
 		}
 
 		if (control_bank > LM3532_CONTROL_C) {
@@ -613,7 +612,7 @@ static int lm3532_parse_node(struct lm3532_data *priv)
 					       &led->mode);
 		if (ret) {
 			dev_err(&priv->client->dev, "ti,led-mode property missing\n");
-			goto child_out;
+			return ret;
 		}
 
 		if (fwnode_property_present(child, "led-max-microamp") &&
@@ -647,7 +646,7 @@ static int lm3532_parse_node(struct lm3532_data *priv)
 						    led->num_leds);
 		if (ret) {
 			dev_err(&priv->client->dev, "led-sources property missing\n");
-			goto child_out;
+			return ret;
 		}
 
 		led->priv = priv;
@@ -657,23 +656,20 @@ static int lm3532_parse_node(struct lm3532_data *priv)
 		if (ret) {
 			dev_err(&priv->client->dev, "led register err: %d\n",
 				ret);
-			goto child_out;
+			return ret;
 		}
 
 		ret = lm3532_init_registers(led);
 		if (ret) {
 			dev_err(&priv->client->dev, "register init err: %d\n",
 				ret);
-			goto child_out;
+			return ret;
 		}
 
 		i++;
 	}
-	return 0;
 
-child_out:
-	fwnode_handle_put(child);
-	return ret;
+	return 0;
 }
 
 static int lm3532_probe(struct i2c_client *client)

-- 
2.43.0


