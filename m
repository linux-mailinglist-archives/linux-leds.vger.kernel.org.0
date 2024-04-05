Return-Path: <linux-leds+bounces-1418-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3126889A5DF
	for <lists+linux-leds@lfdr.de>; Fri,  5 Apr 2024 22:58:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D116328145E
	for <lists+linux-leds@lfdr.de>; Fri,  5 Apr 2024 20:58:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB7B1172BBF;
	Fri,  5 Apr 2024 20:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="avqmxLiO"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155C7171640
	for <linux-leds@vger.kernel.org>; Fri,  5 Apr 2024 20:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712350730; cv=none; b=mLGVFoh9enkl7sytb6DRp2XHz4XGgNLW7V88R9gB+eYpzbIG8v5a0pPh2pYlj+7CnWBRVpXmv407Q8j4CAnQFfBNKkl3cUSl2UZQU6NzW9vzSwCn7CBQixynXF6NtCQNwc4uRz/G+cb5VlLnub6rnwu6fKr7j9/kbbP4Vd8tc5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712350730; c=relaxed/simple;
	bh=9Ncq6gyVqY1Ve/n4g1Po3LoblM7Onl4qiURggoqzYjc=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=H2C56ShUQ9NlsbbBAh4ZpsG59NMzuRyJG8ufuYjZW4OWYwDEcQ64b3KICiBzgk81RiVnlMrD5AzP8ddKzBu1Xe+Mf/8K1ZX4fPRKdeR9LSyZyqimPfKjg6ReXlV29/3F59sbIvVy9yhTtqKZBaaaxupqtRmDod2Mj1yjY72R+bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=avqmxLiO; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a44f2d894b7so330001966b.1
        for <linux-leds@vger.kernel.org>; Fri, 05 Apr 2024 13:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712350727; x=1712955527; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=seXR3kauT39YZno+sQJlsFZf0CjzZDZenxtjwo/arTE=;
        b=avqmxLiOspZlis9ewO559hPQ6V+suryW84AsoWIyLTW1Ox7hqglmr/AcXRFC4vKc7o
         SurXsuSgOOUPQHtCtp5UHDy1+ZQImZQIbPuoBA4Q8GR0X8UZObOYtr1X7FZ1UGf5nCKG
         Rrgq4KNHbjCW9x3YjjpDEAHH0d/KzZ0L3PiiK/PSt2uXSrsJUas7d1Fj/gvVZKfXpRgo
         lGYAePOlZNW5dxRZU7dhXijQoZxyfLQF0bM+RcztXwsb14Ov7qHsAs+2Kd5QzZU9k4gV
         DxLehgKsriSMAOmUDRr8WlxG+N6pHHafyT+Vg669HAh6WrhVbpsBnxXyiiCvBLxJ71uK
         FYtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712350727; x=1712955527;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=seXR3kauT39YZno+sQJlsFZf0CjzZDZenxtjwo/arTE=;
        b=ILG8dPyo3d2OBdA+wNCU/blFn3aAu1zENUDrQ936Jz3RFh9bh50K90bQ//4yhdkzg6
         Nf9132sMpe1ghy9nmJWmhAtS02A+dLfcKXa6cuZUtcdVHxRA5wpmrN92edl6BCP6zfU5
         YXwZ2aFSCMFRMhCTqy7jq+xdHJbm3H2i9aBu00kr5oToVfBYU6Yj4/gT1MHfp9dVbPkC
         srKFijCG7yhunsYQHJdP7bnkIWGLLNWXLCRoc7KiV7o0NCAmPFi6Z56d6gTv6bFKKYPt
         WAD65AUtqUFxkpnFEJtZe34mmK7ZNa8N2GEiq38kTxLGT2tKqRjYc4LF7ZlAh7tjqmPe
         37bg==
X-Gm-Message-State: AOJu0YyTAD+bvO/vXo6IfwEMhWs9eoB5Yo6Vlr8iEwkxLK5MzaBT2Iuf
	YWffREooOzaz77YKYbXoU33R3WeFASSCQWoroLSWn75v8wBkNYE5TP0iEF+i
X-Google-Smtp-Source: AGHT+IGvWb97CEOv+0d+NdUWMK87lry3duuldTQPIF/M6JGT8XoVAEqq1BYFOITZ3n1L4ZsWA+JPaA==
X-Received: by 2002:a17:906:169a:b0:a51:b383:f582 with SMTP id s26-20020a170906169a00b00a51b383f582mr450176ejd.11.1712350727272;
        Fri, 05 Apr 2024 13:58:47 -0700 (PDT)
Received: from ?IPV6:2a01:c22:72bb:b200:e0e0:cd27:7a04:5c79? (dynamic-2a01-0c22-72bb-b200-e0e0-cd27-7a04-5c79.c22.pool.telefonica.de. [2a01:c22:72bb:b200:e0e0:cd27:7a04:5c79])
        by smtp.googlemail.com with ESMTPSA id re9-20020a170906d8c900b00a4e6750a358sm1211028ejb.187.2024.04.05.13.58.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Apr 2024 13:58:46 -0700 (PDT)
Message-ID: <44177e37-9512-4044-8991-bb23b184bf37@gmail.com>
Date: Fri, 5 Apr 2024 22:58:46 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] leds: core: Omit set_brightness error message for a LED
 supporting hw trigger only
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

If both set_brightness functions return -ENOTSUPP, then the LED doesn't
support setting a fixed brightness value, and the error message isn't
helpful. This can be the case e.g. for LEDs supporting a specific hw
trigger only.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/leds/led-core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index 89c9806cc..9485f799f 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -127,7 +127,8 @@ static void set_brightness_delayed_set_brightness(struct led_classdev *led_cdev,
 	ret = __led_set_brightness(led_cdev, value);
 	if (ret == -ENOTSUPP)
 		ret = __led_set_brightness_blocking(led_cdev, value);
-	if (ret < 0 &&
+	/* Don't emit error message if LED supports a hw trigger like netdev only */
+	if (ret < 0 && ret != -ENOTSUPP &&
 	    /* LED HW might have been unplugged, therefore don't warn */
 	    !(ret == -ENODEV && (led_cdev->flags & LED_UNREGISTERING) &&
 	    (led_cdev->flags & LED_HW_PLUGGABLE)))
-- 
2.44.0


