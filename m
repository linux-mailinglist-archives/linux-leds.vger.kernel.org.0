Return-Path: <linux-leds+bounces-2824-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 82328987B9F
	for <lists+linux-leds@lfdr.de>; Fri, 27 Sep 2024 01:21:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B6CB1F24EAF
	for <lists+linux-leds@lfdr.de>; Thu, 26 Sep 2024 23:21:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A2631B07D0;
	Thu, 26 Sep 2024 23:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dd0XjdCQ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FA919FA8A;
	Thu, 26 Sep 2024 23:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727392885; cv=none; b=E1AEn8zF57gglAUgvdu6bqhcR7F/pQFv5vbHwpqeN0S6ziBJopLW+/DTkvMmtUlHOt4u1WCwM3VZE9iSwilEBqrLgWN7vr1uTP++5szdNH4afT2ypcu9HLOlni7lytpkalACmWdKnjsOd59haNmrRolHzR7Vs129ihgVU8iyDx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727392885; c=relaxed/simple;
	bh=da+yiLrVSVhzxfXeLXUvwNG1cBTZv5IPC9inOzFUOgI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ktSCx4pdhiDeZVwEWM7017T+n3zg/Iuba717SBE9CBCbqNYDs9Xa3owoVtkfpyoDhjd+EG4zAfbpC1W61h3248RXk6XMFkOTliI/gPbrGZisNrlqtA//nW8jK1t+N5QKsrzmXd6uBtgAtk7XlFflWHnvUs7pjtjWC6uJJ1eArd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dd0XjdCQ; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5c71f1396e4so1766368a12.0;
        Thu, 26 Sep 2024 16:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727392882; x=1727997682; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SRhQyVKcgRlVjIYoZT+41pIKZJrgjINAhed1beNUQXI=;
        b=Dd0XjdCQYGePZYgn73KrJf4/iRm73yNjHD5ZHJ7iXrpGewfkHRA3egatUpMMdsv74C
         KBmcUHdNTz+VZwTmCyqhknN7i4afWVcezp4SJcB/tqtojkT8OWJ4w9xl8+K5vvH0ntb8
         2aFeufwpZiT7tr/evC4KYi8kSOp2K6tTer73DCXPWZRG3lI1buKdse6IGG8E5mHbSVEl
         JzCMh4wxGeTmHuqJS23iohNbrHRjXou1docPvqWKa++7VRDLiTKP5pO2JPnLVTdXV1IY
         8ZUFTxz434zSd/7Bt47E2Tt4XpBMSSueWGiOGQlsh19rxSSSzxqZVSv7sPqC557dmZvy
         +ecA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727392882; x=1727997682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SRhQyVKcgRlVjIYoZT+41pIKZJrgjINAhed1beNUQXI=;
        b=qYKypyl6lgUXaw+woNB/4x8C7oBTkNywdjH50oNnf7aFSI7vl1LVNYJaT3m8oopu5E
         61iIGZmMUUIsNQe45QX34H+MqMi/7pOc8ck8ilFSLlJG1Uh4cvSKlqES/ogsAnU4AUFB
         xTmjXx02xFOSuh93Pi6oXdYYaEgtzcH6HJOQXm/MO2jqzCQBRGs2uS93WLCfFOmV3bE/
         gwfvU75VKVP5yK/1g+j8D0MZllcerbhUZ6OMpZc172xuQVmaMIgbLeYuulIHdfERXiVA
         hU/K723ao6OhKobmAbiMGGNlsprFnk92hwja08q7drb07aNERB7QloeyrlYfz9CEbdYJ
         uigQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDKTHHUj1GI5MIkIuA2efQTovktt+uGtHiBGio5H8Vk2GLU8c1Ko/hy2LKEfog/8vdmwVCwvFpbUwNZE4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrmu36rHnd34bsjUgWluyF/lD6g4L83jo339mLFPIrE9ve/hoG
	WIhXRB9zk6Tx8dIud1MXqbEifMdjBnan/QLQoKWcl9juZd5QsT/B
X-Google-Smtp-Source: AGHT+IGd2PJRYpLODXkVXKvFBOHOE+/1R0umomGP/eN5VLC0TMztnCr42izK4H4rLnfkXKxJDXG3EA==
X-Received: by 2002:a17:907:2d90:b0:a8d:510b:4f48 with SMTP id a640c23a62f3a-a93c491952fmr82476866b.22.1727392881724;
        Thu, 26 Sep 2024 16:21:21 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3989-b03c-7705-998b.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3989:b03c:7705:998b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27773c0sm50368166b.1.2024.09.26.16.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 16:21:21 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 27 Sep 2024 01:20:53 +0200
Subject: [PATCH 02/18] leds: flash: mt6370: switch to
 device_for_each_child_node_scoped()
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240927-leds_device_for_each_child_node_scoped-v1-2-95c0614b38c8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727392874; l=1546;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=da+yiLrVSVhzxfXeLXUvwNG1cBTZv5IPC9inOzFUOgI=;
 b=+HkfaGOfTwfbLA3hl6LrR4cqzOrg7pu6sEXSeJ1n0Dv/N3Wgj5+SYNtD9fefjVYJnlMGIaRy1
 uy9KHs3e49mDqhgLOoZkQSYwrgF26sZfTIiULhEDZkfR2xEXsDOl9l8
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Switch to device_for_each_child_node_scoped() to simplify the code by
removing the need for calls to fwnode_handle_put() in the error paths.

This also prevents possible memory leaks if new error paths are added
without the required call to fwnode_handle_put().

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/leds/flash/leds-mt6370-flash.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/leds/flash/leds-mt6370-flash.c b/drivers/leds/flash/leds-mt6370-flash.c
index 912d9d622320..dbdbe92309db 100644
--- a/drivers/leds/flash/leds-mt6370-flash.c
+++ b/drivers/leds/flash/leds-mt6370-flash.c
@@ -509,7 +509,6 @@ static int mt6370_led_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mt6370_priv *priv;
-	struct fwnode_handle *child;
 	size_t count;
 	int i = 0, ret;
 
@@ -529,22 +528,18 @@ static int mt6370_led_probe(struct platform_device *pdev)
 	if (!priv->regmap)
 		return dev_err_probe(dev, -ENODEV, "Failed to get parent regmap\n");
 
-	device_for_each_child_node(dev, child) {
+	device_for_each_child_node_scoped(dev, child) {
 		struct mt6370_led *led = priv->leds + i;
 
 		led->priv = priv;
 
 		ret = mt6370_init_flash_properties(dev, led, child);
-		if (ret) {
-			fwnode_handle_put(child);
+		if (ret)
 			return ret;
-		}
 
 		ret = mt6370_led_register(dev, led, child);
-		if (ret) {
-			fwnode_handle_put(child);
+		if (ret)
 			return ret;
-		}
 
 		i++;
 	}

-- 
2.43.0


