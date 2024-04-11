Return-Path: <linux-leds+bounces-1472-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B90AD8A2067
	for <lists+linux-leds@lfdr.de>; Thu, 11 Apr 2024 22:47:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EBE6DB22771
	for <lists+linux-leds@lfdr.de>; Thu, 11 Apr 2024 20:47:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADE28205E15;
	Thu, 11 Apr 2024 20:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eI8Nqipj"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04E92E415
	for <linux-leds@vger.kernel.org>; Thu, 11 Apr 2024 20:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712868416; cv=none; b=dXPrD0bx+gFtf8h/WMn5z5nuf1iyiUnHDZ+UCUtFjZRSZYTSfk0Ji+DMmevFjWjUlwCIrMKRlH/BAP3nxJUCF4uABnaHaIt+lFPuG8kYcQaKTQO68s14v5bQZb60Zk6eVMYi5CivS8vcvFR2gl7pB7OC8Raq64dGMg2JFScHvHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712868416; c=relaxed/simple;
	bh=u5Ry7vyJOs0/OUB92Ao9cg8t7yf9cV5ld8F2Mn5MgJ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rNq7Dx9pT1Ml0app/mI09d1d6pYod4mid6AIwGVoJesdLxVHAvV0ehU4tIp8MnHcPNcFAffD9Ihk5PsZcQ+SASpWrX7+teBpBHAGJYWYq3DT5tJlXyuhU8hscQZ/9LOCLf0vpZAxbo8AlIS0D5rwVK2kO24RDnl4STyZHJe+q18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eI8Nqipj; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-56fe7dc7f58so164903a12.2
        for <linux-leds@vger.kernel.org>; Thu, 11 Apr 2024 13:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712868413; x=1713473213; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0DTDEQU86or13Ck7u8GeB4VB1YWtN9rDHeC9fJARWVs=;
        b=eI8NqipjKiqHWaC9T959+EqzJd1H/VlV3rDsBU9MElAamUDYcfUIDtWN9z8IxDiFk5
         NkeVPMSFs6cbWZvMnobla2XDyF2c7Zqo36kDIxAXjX/Okz/YaPG4zPDBV22679KVZqYJ
         JgrW1haopM+8O8nxLYCBheym+cim/hVZoKtH+mAs4tvKg6eb8F2unRwwkKpnSOGstRiB
         Lqdl8gYdtByovtn/g90syzjKbNRT0wmeI8iKXy3lrobeLTVvk4HdT77dJk/embUwwH6p
         HkgK8Hld2Np22qH0QV695AtUGlF+gKJOoFKNO+ght0kIa3+yxSB7ex6bSSe/JTc+RTCP
         1eag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712868413; x=1713473213;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0DTDEQU86or13Ck7u8GeB4VB1YWtN9rDHeC9fJARWVs=;
        b=dTOsKcZpf7OkyWy0tLxnIc2tZoAjzIcgxQthdr3kpfNpekx1Qa/ZbteE1ItPUmMz4W
         vswAf/OzMjAjQlWfoS8fnIs5b7hf79RIQLnUTBWCDaFht4l/zor5QIKA+2PaNiAdsxaF
         u3e8xzZEN3kYKtQfajBfOM34V+VferWPDZEIAv49arncQsVLdr+YYPkYv2va1QVnEert
         dr45kUBMrb0oH36fTkknS0HrVbsMcxZAMuCHwJ7LrIK64o3F6WJk+sshMLcHkmRJGkHc
         1/kLZ69FdAqWLIyP1CVwpJOgQoR5QVoiGEiHnZN0cq12SVsLJLBdrz3U0uuwKryETZ1P
         PcYg==
X-Forwarded-Encrypted: i=1; AJvYcCUeFUbWlDNPBExVYHb4LbSOv+rJYO3tFByR5iag4G6K+ynY6oVBf9nRK+tX7uHdRzkDFrSob+zUKAvg6LYNopnlAK6JwO1oP4zAKQ==
X-Gm-Message-State: AOJu0Yy40oGzcFunrivmFJDvLN47pQ/uqZEkk7hjBbRwtzFvcBjqrHaO
	8c7zkgCVVCbDhsmKAomw+U6ASSH687wGwgopdpAzM006rDXRkUQH
X-Google-Smtp-Source: AGHT+IG6iIgggqHEgxUgbrLHC/bkuHzWtjK7lrVYtJwSQs6Ykc+DEWJe623rALB7omoXtBdJbH2NyA==
X-Received: by 2002:a17:906:4c4c:b0:a52:2b13:cb55 with SMTP id d12-20020a1709064c4c00b00a522b13cb55mr471456ejw.74.1712868413104;
        Thu, 11 Apr 2024 13:46:53 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c01b:9c00:988e:4c87:6127:b626? (dynamic-2a01-0c23-c01b-9c00-988e-4c87-6127-b626.c23.pool.telefonica.de. [2a01:c23:c01b:9c00:988e:4c87:6127:b626])
        by smtp.googlemail.com with ESMTPSA id wn5-20020a170907068500b00a4e4c944e77sm1073930ejb.40.2024.04.11.13.46.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Apr 2024 13:46:52 -0700 (PDT)
Message-ID: <1b425a70-48e2-4733-8e05-225695109ceb@gmail.com>
Date: Thu, 11 Apr 2024 22:46:54 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] leds: core: Omit set_brightness error message for a LED
 supporting hw trigger only
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>,
 "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
References: <44177e37-9512-4044-8991-bb23b184bf37@gmail.com>
 <20240411142628.GB2399047@google.com>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <20240411142628.GB2399047@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.04.2024 16:26, Lee Jones wrote:
> On Fri, 05 Apr 2024, Heiner Kallweit wrote:
> 
>> If both set_brightness functions return -ENOTSUPP, then the LED doesn't
>> support setting a fixed brightness value, and the error message isn't
>> helpful. This can be the case e.g. for LEDs supporting a specific hw
>> trigger only.
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>>  drivers/leds/led-core.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
>> index 89c9806cc..9485f799f 100644
>> --- a/drivers/leds/led-core.c
>> +++ b/drivers/leds/led-core.c
>> @@ -127,7 +127,8 @@ static void set_brightness_delayed_set_brightness(struct led_classdev *led_cdev,
>>  	ret = __led_set_brightness(led_cdev, value);
>>  	if (ret == -ENOTSUPP)
>>  		ret = __led_set_brightness_blocking(led_cdev, value);
>> -	if (ret < 0 &&
>> +	/* Don't emit error message if LED supports a hw trigger like netdev only */
>> +	if (ret < 0 && ret != -ENOTSUPP &&
>>  	    /* LED HW might have been unplugged, therefore don't warn */
>>  	    !(ret == -ENODEV && (led_cdev->flags & LED_UNREGISTERING) &&
>>  	    (led_cdev->flags & LED_HW_PLUGGABLE)))
> 
> This function is already pretty messy.
> 
> How about something like:
> 
> static void set_brightness_delayed_set_brightness(struct led_classdev *led_cdev,
>                                                   unsigned int value)
> {
>         int ret;
> 
>         ret = __led_set_brightness(led_cdev, value);
>         if (ret == -ENOTSUPP) {
>                 ret = __led_set_brightness_blocking(led_cdev, value);
>                 if (ret == -ENOTSUPP)
>                         /* No back-end support to set a fixed brightness value */
>                         return;
>         }
> 
>         if (ret == -ENODEV && (led_cdev->flags & LED_UNREGISTERING))
>                 /* LED HW might have been unplugged, therefore don't warn */
>                 return;
> 
>         if (ret < 0 && led_cdev->flags & LED_HW_PLUGGABLE)
>                 dev_err(led_cdev->dev, "Setting an LED's brightness failed (%d)\n", ret);
>  }
> 
I think this would be a functional change. If:
ret = -ENODEV
led_cdev->flags & LED_UNREGISTERING is true
led_cdev->flags & LED_HW_PLUGGABLE is false

Current code would warn, proposed new code not.

But I like the idea. Proposal:

static void set_brightness_delayed_set_brightness(struct led_classdev *led_cdev,
                                                  unsigned int value)
{
        int ret;

        ret = __led_set_brightness(led_cdev, value);
        if (ret == -ENOTSUPP) {
                ret = __led_set_brightness_blocking(led_cdev, value);
                if (ret == -ENOTSUPP)
                        /* No back-end support to set a fixed brightness value */
                        return;
        }

        /* LED HW might have been unplugged, therefore don't warn */
        if (ret == -ENODEV && led_cdev->flags & LED_UNREGISTERING &&
            led_cdev->flags & LED_HW_PLUGGABLE)
                return;

        if (ret < 0)
                dev_err(led_cdev->dev,
                        "Setting an LED's brightness failed (%d)\n", ret);
}

Fine with me if you submit the patch.


