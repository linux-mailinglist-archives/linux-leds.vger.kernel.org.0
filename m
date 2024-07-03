Return-Path: <linux-leds+bounces-2181-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53260926653
	for <lists+linux-leds@lfdr.de>; Wed,  3 Jul 2024 18:46:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE7981F24F7B
	for <lists+linux-leds@lfdr.de>; Wed,  3 Jul 2024 16:46:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48D201836CB;
	Wed,  3 Jul 2024 16:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JoLgkaAB"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA14174EFC
	for <linux-leds@vger.kernel.org>; Wed,  3 Jul 2024 16:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720025205; cv=none; b=ZWRnmYyIqMgz9TgInIFiuHDhg02WLP9w98vR26d9WI9lP8Y4ZSTHU3B0TLlKO1Pnn6W37j6HLMAhi/ybbUqznxShHj04x584lvG13MOoKN5SLwaIVv04Fx4SfehM/dUV1fy1jCXQNBBZ+Z9NivTvk6Iji3xWfSzsprBUO/L1js4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720025205; c=relaxed/simple;
	bh=HMpCFckabAc3rUFqu0pOABiEctF7GbrRYkZcXjBkkMo=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=egvqoqMwGkJTSlXrSt+1Be7evQYMSgA9pIgAqoQLy9ByEXh9rKSqQwBvW8E1lwyh2HLnjzxsWKjdBGYqjPZfj/53aTISSZ/z2sgAg0ZU92ttJoetcGffLF0snD8Xcc36OZUilerdXv5DDlZRmp39Z2awbCOV8d8quq7uWhvQlME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--zenghuchen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JoLgkaAB; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--zenghuchen.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-645eb1025b5so84396287b3.2
        for <linux-leds@vger.kernel.org>; Wed, 03 Jul 2024 09:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720025201; x=1720630001; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uGqHE0E7+SOnBS5UkqHAR0RRhXN6nF8kZmvFEId7fd0=;
        b=JoLgkaABg2ll7SEyxYSxTuhHsIEvMrxmtMfE5aYRH5ZxeER7GxF0+z/tLXZxXc+Xyf
         dukZWdQjIuoLbqESG3V44gH8kvuAJf82QwFDlscp158npRAf+XNFoXlVIyhil43FgNxY
         0VX9xLfVHFE6YsY72/W/sIBMQW4jplc3LQuPXZlVNIhGOKasDrGKUqZaKjaTCzReStwb
         0GH3RSyVcDborGWnXq8r7qQ9X+EPsYfxJHiwax6XnuywGVHZiB3gkJo28DiC/4W3F0si
         Kbf/Numcn8wGTB+aEALZ0iQaEw2pHmifNI++maam4eRIuWinq1ZXVlqSliJaH8SFKdzF
         7fsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720025201; x=1720630001;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uGqHE0E7+SOnBS5UkqHAR0RRhXN6nF8kZmvFEId7fd0=;
        b=EZ34BZlIp0As5Pw+RmE+vRnqjNLq5E4wy71UwO/ggvFkHCYVcXj27DFXRh2by3EWt2
         lRSzyEaTNJYuKfnTlWM4GGYm/yQjzLklI5NPPozkxt442AHnuhBe62Xdpa/pjyfIqOju
         PSNddvRh0D5Y8r2oB09N2n8gRp0mZqRZR0WUp97+N1YpVkwPIIPwaU26W76J0XfFvRC+
         bhcpxjo/ykI+T9G/0SA7+NUhSgC2yGXMVnNDpzI2mvvuusKFm08Q/wVrWpvaD48F3Eoi
         eiPGgXhKQXpt0jkWcmSuzV7oIWBfbHDM0WPsq2pSpjVimcCJerw/SiMK+IoD3zD+qgtY
         Ey4A==
X-Forwarded-Encrypted: i=1; AJvYcCUs+NLvNc88cL/Ns4nvc69X4U44vbvIoDZa2oskdleuEKBsBrYrM8IPEZoKHQwQVCgx6p7kRCs+6Mv461cRhvDqSlew6H0/zF85mg==
X-Gm-Message-State: AOJu0YxcR8rhzhvrTR/4wwY3lmfUvmUWV8vcV/taRuQEJmZ45QsKl4Nr
	XaZXccXYef1wHxBiuk5NOvgk8rjvm3QC+IAU25qFOu2GNbaB4uqBPc9Ogb5iCXBCfJnEMAObeQe
	OQKKwHwosiRTavk+MUA==
X-Google-Smtp-Source: AGHT+IF1wZf4hV0nZ/4PthS9COJLLib7w2IS942hsqZTgV6x0+Nk7H+nmONt5S8eWkJgGD+PledWdgHvG0scLO2q
X-Received: from zenghuchen.c.googlers.com ([fda3:e722:ac3:cc00:2b:7d90:c0a8:2448])
 (user=zenghuchen job=sendgmr) by 2002:a0d:ea83:0:b0:64b:7f7e:910f with SMTP
 id 00721157ae682-64c77cb5cbbmr309867b3.7.1720025201195; Wed, 03 Jul 2024
 09:46:41 -0700 (PDT)
Date: Wed,  3 Jul 2024 12:46:35 -0400
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
Message-ID: <20240703164635.221203-1-zenghuchen@google.com>
Subject: [PATCH] leds:lm3601x:calculate max_brightness and brightness properly
From: Jack Chen <zenghuchen@google.com>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Vadim Pasternak <vadimp@nvidia.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Jack Chen <zenghuchen@google.com>, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

1) check the range of torch_current_max,
2) calcualtes max_brightness precisely,
3) lm3601x torch brightness register starts from 0 (2.4 mA).

Tested: tested with a lm36011 and it can set its brightness to lowest
value (2.4 mA)
Signed-off-by: Jack Chen <zenghuchen@google.com>
---
 drivers/leds/flash/leds-lm3601x.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/flash/leds-lm3601x.c b/drivers/leds/flash/leds-lm3601x.c
index 7e93c447fec5..fc4df904ea90 100644
--- a/drivers/leds/flash/leds-lm3601x.c
+++ b/drivers/leds/flash/leds-lm3601x.c
@@ -190,7 +190,7 @@ static int lm3601x_brightness_set(struct led_classdev *cdev,
 		goto out;
 	}
 
-	ret = regmap_write(led->regmap, LM3601X_LED_TORCH_REG, brightness);
+	ret = regmap_write(led->regmap, LM3601X_LED_TORCH_REG, brightness - 1);
 	if (ret < 0)
 		goto out;
 
@@ -341,8 +341,9 @@ static int lm3601x_register_leds(struct lm3601x_led *led,
 
 	led_cdev = &led->fled_cdev.led_cdev;
 	led_cdev->brightness_set_blocking = lm3601x_brightness_set;
-	led_cdev->max_brightness = DIV_ROUND_UP(led->torch_current_max,
-						LM3601X_TORCH_REG_DIV);
+	led_cdev->max_brightness = DIV_ROUND_UP(
+			led->torch_current_max - LM3601X_MIN_TORCH_I_UA + 1,
+			LM3601X_TORCH_REG_DIV);
 	led_cdev->flags |= LED_DEV_CAP_FLASH;
 
 	init_data.fwnode = fwnode;
@@ -386,6 +387,14 @@ static int lm3601x_parse_node(struct lm3601x_led *led,
 		goto out_err;
 	}
 
+	if (led->torch_current_max > LM3601X_MAX_TORCH_I_UA) {
+		dev_warn(&led->client->dev,
+			 "led-max-microamp cannot be higher than %d\n",
+			 LM3601X_MAX_TORCH_I_UA);
+		led->torch_current_max = LM3601X_MAX_TORCH_I_UA;
+	}
+
+
 	ret = fwnode_property_read_u32(child, "flash-max-microamp",
 				&led->flash_current_max);
 	if (ret) {
-- 
2.45.2.803.g4e1b14247a-goog


