Return-Path: <linux-leds+bounces-5732-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9A6BCF50E
	for <lists+linux-leds@lfdr.de>; Sat, 11 Oct 2025 14:16:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4CA5A34BE53
	for <lists+linux-leds@lfdr.de>; Sat, 11 Oct 2025 12:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5DCF27605C;
	Sat, 11 Oct 2025 12:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nTz6wyv4"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4860026E6FD
	for <linux-leds@vger.kernel.org>; Sat, 11 Oct 2025 12:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760184986; cv=none; b=gb+VtW4WddvQwbHRRXc3LjuGYd57dMJ8LBiNqf12Ea54lpPw9xBniBUdaai3mQHy1OUyCRoasLlsbQHq7hnA6ii5qKY8JLY/c0bgGGRmbTO7VZ2KEIGZINgp3PZyUSo+9ex3rM07ux3y3ER7qupLktQjzcVQ6RedqMA7noF9d8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760184986; c=relaxed/simple;
	bh=ZI5TPYuH5aD9kbrYTudi2phDOrMMRofUz8Yd8NjZ24o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uf3XLttV1g3mP7AKWHeHc3OI5/JWVtzLbgI8GJgjlc4o5BCFkJQGHkeSBS/kihGA3bpTNpppXiz2jeSejJ7C0MmL+egBa3hLqReGqUq/HymyCR+Y/Tzsz9SkfQGLuD52ylqcXWksg+PGLKhJUNIOfrrEHwMyXogNrhqE/ZVB0h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nTz6wyv4; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-578ecc56235so2491728e87.0
        for <linux-leds@vger.kernel.org>; Sat, 11 Oct 2025 05:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760184979; x=1760789779; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LyZodhLATiu/3uXx9NUchp//hn18ZJQh1emvghIBVhE=;
        b=nTz6wyv4OTCIFS5KZDzHaTfWcm7iYS8otbfo/6px1hY2ppiF66VHb2o0CXGpRY7Bio
         2hiC6lZrVv7wqEUEdx7i0JNCFtkiy8mHCT/tRyGor59OA0h13hEYZ+gJnryi/hIdA17K
         0uLMLZLh/NNIYbWdvwrqwQqocExKN56KnUguqQMierJOuSKmyjHvySxIhA1ei+M58+fu
         KX6Fp+ItvmdTYixk8gUhFAj9+zNcsjMdBNxCUw+N1ZlvVPpcFGIH2zA420TR7eTE/rZr
         EvhC4n+KMoCHEr3AM1cF5RUgOUB7NbqAlH5PUQvKZCVTICw82IRr30KpNWNzicxKBkkB
         MtNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760184979; x=1760789779;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LyZodhLATiu/3uXx9NUchp//hn18ZJQh1emvghIBVhE=;
        b=T3hXhexucdZmGqY+Z/NGiHm8fPWep4mj+RfCaAbBSYATuc8OI8v7EmxDXJTgCO6w4+
         yqG0sIxsmrGZadhkpehVWfD2q5DFSUz6gha6y3w7cs9ijLPKp0OdwGdgcziiX5qdodCp
         gLspb6jMC7TGqJPsq5/ZIVYdkS9AjuV2g7HtD9KXbKTgwQdbJ2cXVCip8fpnBC/1Nopc
         Hyv/FQRcNCRKFeYl/52GFCFicmVHAyrYX/H7qD4wPU5mryQ7PnuvKgtS9O+8gpH097SI
         be7bEw34blimNFA1B/PokkuxweZjHQ0uEl7D6ru0PuXsff3fWGapS0OGuck4hPrH4/QL
         zXyA==
X-Forwarded-Encrypted: i=1; AJvYcCWHmZmJKuWDy9/FUXV/ieK9vTMtPQ8wdtBEmeHqtMQfxrbBjPY+Se1IRfYQDy1mVX9rpuTghy+rmeOn@vger.kernel.org
X-Gm-Message-State: AOJu0YzuwfyWlbN2q4rPEJ+ucHTaUTRqx0MfO3XQySGTC9cYa9XP/Hq9
	4F4qhYF/CLbBXcm6dL+zWsS/PLcJT+5h3+Kaw5YlsriKD5q6VlLusVsO2N0KWrA2
X-Gm-Gg: ASbGncvbNkm+sXz4LYXzKyvvCaeoWs9ra2OJNZOmnuGFOrwx7WeK37zlIhVYo+r/NNf
	EfdDXBdSgZlixstmOSxOgHLM5R+o+rOojmB+KRRJidn4YuzpAn2gO3uVihZEhK2Wu/hT/1/D9rw
	OX0f42LiLYgDv8xdOlRBBsDoubub7ei9w7WZDM3dZUgGAJ4xkohqKsewD8mO+128nlQPxCKVZg5
	cOTcaFZP+ygYWGkpnZWDmElPb/OvZ94jwnxwFPtvcMKkOvdhMaf7aWaVxdH82BakIZlknJYS0LA
	XPiKS6NOrsyINoieP4JEizwomYR6dCyHjL9iVnjikPGGDWIKyPcy8sBJsICcsy0nXG6xwg0DP0X
	TYqYUuhKIua3NhMcGKve8wdF0NUBS+8tspI36QoT288HlaVOkaVRJiZO2RgGQxAbg
X-Google-Smtp-Source: AGHT+IFdHSvkObU+tPl9CDJXrWAsVL6tubVC9+zULoMNnufCMnqy+TEO+WOSC6ej7Kbq74CPdF/EkA==
X-Received: by 2002:a05:6512:3dac:b0:586:7f:a141 with SMTP id 2adb3069b0e04-5906d88e732mr3805999e87.18.1760184979187;
        Sat, 11 Oct 2025 05:16:19 -0700 (PDT)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5908858456dsm1862610e87.124.2025.10.11.05.16.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Oct 2025 05:16:18 -0700 (PDT)
Message-ID: <6f6fbebf-bdb6-402d-8aa1-9f33eae914ed@gmail.com>
Date: Sat, 11 Oct 2025 14:16:16 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] leds: leds-lp50xx: allow LED 0 to be added to module bank
To: Christian Hitz <christian@klarinett.li>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>
Cc: Christian Hitz <christian.hitz@bbv.ch>, stable@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251008123222.1117331-1-christian@klarinett.li>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <20251008123222.1117331-1-christian@klarinett.li>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Christian,

On 10/8/25 14:32, Christian Hitz wrote:
> From: Christian Hitz <christian.hitz@bbv.ch>
> 
> led_banks contains LED module number(s) that should be grouped into the
> module bank. led_banks is 0-initialized.
> By checking the led_banks entries for 0, un-set entries are detected.
> But a 0-entry also indicates that LED module 0 should be grouped into the
> module bank.
> 
> By only iterating over the available entries no check for unused entries
> is required and LED module 0 can be added to bank.
> 
> Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
> Cc: stable@vger.kernel.org
> ---
>   drivers/leds/leds-lp50xx.c | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
> index 94f8ef6b482c..d50c7f3e8f99 100644
> --- a/drivers/leds/leds-lp50xx.c
> +++ b/drivers/leds/leds-lp50xx.c
> @@ -341,17 +341,15 @@ static int lp50xx_brightness_set(struct led_classdev *cdev,
>   	return ret;
>   }
>   
> -static int lp50xx_set_banks(struct lp50xx *priv, u32 led_banks[])
> +static int lp50xx_set_banks(struct lp50xx *priv, u32 led_banks[], int num_leds)
>   {
>   	u8 led_config_lo, led_config_hi;
>   	u32 bank_enable_mask = 0;
>   	int ret;
>   	int i;
>   
> -	for (i = 0; i < priv->chip_info->max_modules; i++) {
> -		if (led_banks[i])
> -			bank_enable_mask |= (1 << led_banks[i]);
> -	}
> +	for (i = 0; i < num_leds; i++)
> +		bank_enable_mask |= (1 << led_banks[i]);

Probably the first idea was to have a bitmask indicating which bank
to enable, but it ended up in having array of bank ids in DT with no
related adjustment in the driver.

This patch deserves Fixes tag.

>   
>   	led_config_lo = bank_enable_mask;
>   	led_config_hi = bank_enable_mask >> 8;
> @@ -405,7 +403,7 @@ static int lp50xx_probe_leds(struct fwnode_handle *child, struct lp50xx *priv,
>   			return ret;
>   		}
>   
> -		ret = lp50xx_set_banks(priv, led_banks);
> +		ret = lp50xx_set_banks(priv, led_banks, num_leds);
>   		if (ret) {
>   			dev_err(priv->dev, "Cannot setup banked LEDs\n");
>   			return ret;

Reviewed-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

-- 
Best regards,
Jacek Anaszewski


