Return-Path: <linux-leds+bounces-5766-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C86F4BD583D
	for <lists+linux-leds@lfdr.de>; Mon, 13 Oct 2025 19:35:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 037C218A539B
	for <lists+linux-leds@lfdr.de>; Mon, 13 Oct 2025 17:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BE37303A3A;
	Mon, 13 Oct 2025 17:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IWTQ2wtZ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982412C0296
	for <linux-leds@vger.kernel.org>; Mon, 13 Oct 2025 17:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760376950; cv=none; b=X6xcjYeP89jRzfUtfL9KQc6nVMqFGtKVO9KDiy0df/jn7P6I6Bu2C28PBH08O6wgZxLZO2pU0fEe9eRBeziGvTd+cbQhMB5Dp3B1AT4kapIn3aTWVmqGkN2apBtmLRVsJ/mbKjF0l2CBvFmcsA2r5y52eNL4G9jUb4gf1LQvjrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760376950; c=relaxed/simple;
	bh=L0l1dvVBxI7aQ6QdvNh005q/lMuJAaIhHH3fZWHnXOs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rta5FEvCmQo/Omtge3on9gCfcG9EZGOgGNWTTbM8yGHo3PDIJ2hfhhm7Fxll/k5e6aPOBt3vjkPwRZdzigd94stkEC4tdZTUgsyQFMO8Q216SVWz/Pa6tvPxoKenfihBS/vV/99uL7a/8FE1cGc8xzLw1WrcaMXdj/ej0zBMZcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IWTQ2wtZ; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3682ac7f33fso51308601fa.0
        for <linux-leds@vger.kernel.org>; Mon, 13 Oct 2025 10:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760376947; x=1760981747; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sg1Kp/xD6wqtV9F7MB6gIXsPYnhCTR4iWbhAE/BQKm0=;
        b=IWTQ2wtZZjJUBq5Qo/vg/A3uocbp5W6Rs1qtW/6GgE88gPr8SEA4BSns57eI/6QfJN
         CkeVHFlegqo6hH4qz61+S0hK30xDUSiLDEEdRLrbesLooInPic8GmCZc01g/teJ7r64f
         KLIhp4E2aNFfNitIbJYq2fbYPG5cTX960MKTNwGcg0IIdtlIKZu12tXDvoeMHOxrrnyL
         HD7Aw5FxbvMw6cHImeuLe1sSml0N+l2BTZqefxTI/57qdW8R3q1DwKLwD8+XBhPP27D5
         aVs1seOqgBTF/KZPr8v3BnvXNzcRJ2qFfXzEgXnAnB+swtssAcW/gPRs7Ugvix5QMO42
         6TWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760376947; x=1760981747;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sg1Kp/xD6wqtV9F7MB6gIXsPYnhCTR4iWbhAE/BQKm0=;
        b=Y6jccwb62uS7AYuoZoPGDBS3rKMg398p/bG27tOeqJmi47j23kvahq4B7sxJfqUTVJ
         u+6CuQ8abicbOjOEB61ZjVBOn3ag9mlnTYTiKM+mR2bP51oBbPMpEG43L5b0D7dY+h6d
         VAff+6S2gZ+B9hz1aslJ0A7h0Oi/fnp5Sww9hj5vnEh1C2DFRclMgvOLPrOYxngcZytp
         +a8AggihYEGTfe7PT93CWS+IsQr4diYV08+3j4+RQ1/x8uYYeZHgzFVMLlblGoNbwdVI
         UgxLsAKwTW3L1WBk76TVzVftQfFt0Ae8Q69axdMq2tgNWi/4mh15ZitoPgv+qei1c2kT
         qm8Q==
X-Forwarded-Encrypted: i=1; AJvYcCV4Fk8r5n2YMxjxBSunRErF0rCLym94WVXS4RKATdo2f8U5WzBnsFEuvT575T4DVbXz+l0V0TpUmFpB@vger.kernel.org
X-Gm-Message-State: AOJu0Yzyru4o7Q6BwwuGUspkRY8IsrNdQq041P/scqBNX2QXPUo6oigY
	HXDErpEUWgYu2oYrIy9eRq4mh/Fae6qgF9mMwgv93cEupWVt3Q4R4rbV
X-Gm-Gg: ASbGncsqhUTP7G698bQToIDehBmly5s42GNEN+rW+u8kJ8yFLhYHptfD9b+Fkwu4sS/
	2XC8JK7aIt7nIma1GNbbAT+9VHYuJNmxxintQLet89TSbqlWegTrMVsNDoEGmvRYBZD5HpmUd+i
	KsobnpFTSeWg+cuyUKExfaLFzrjUtTs04iKjEdJu4pv1Mig6ziEonYFWLg4ycxEOUFNywPRLRC5
	bXpvhwIRQ9cX00KrI3HAjCrmM15nHxpY5ry/KuNIcz5P+yhHTxduZHI/Da5E6eFr55i10tVFlM0
	A+wE8auMQhlWWgcHPKFx4/Y6/N9evXkjUwpOJjyDQ/zkOadny+tHYN6E/ZtwysNoED3FF2N0TbC
	gyI5K18oIzHvkzjwcRLStSTjWvSCHWL7gk/WK/jLxaCTcWFc6txawag==
X-Google-Smtp-Source: AGHT+IEV56bnvcGPwOPYB8vnYJAS9fKrH/qReZKaBeWAX+wJt7Mt+B1FaBTD08zZaMMvB5YtKyIwJQ==
X-Received: by 2002:a05:651c:3246:20b0:376:5391:88b1 with SMTP id 38308e7fff4ca-3765391f543mr14711741fa.9.1760376946456;
        Mon, 13 Oct 2025 10:35:46 -0700 (PDT)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59088577571sm4306355e87.102.2025.10.13.10.35.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 10:35:44 -0700 (PDT)
Message-ID: <c68111e0-e651-44ee-af7f-737a408fe080@gmail.com>
Date: Mon, 13 Oct 2025 19:35:40 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] leds: leds-lp50xx: allow LED 0 to be added to module bank
To: Christian Hitz <christian@klarinett.li>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Christian Hitz <christian.hitz@bbv.ch>, stable@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251013085514.512508-1-christian@klarinett.li>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <20251013085514.512508-1-christian@klarinett.li>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/13/25 10:54, Christian Hitz wrote:
> On Sat, 11 Oct 2025 14:16:16 +0200 Jacek Anaszewski <jacek.anaszewski@gmail.com> wrote:
> 
>> Hi Christian,
>>
>> On 10/8/25 14:32, Christian Hitz wrote:
>>> From: Christian Hitz <christian.hitz@bbv.ch>
>>>
>>> led_banks contains LED module number(s) that should be grouped into the
>>> module bank. led_banks is 0-initialized.
>>> By checking the led_banks entries for 0, un-set entries are detected.
>>> But a 0-entry also indicates that LED module 0 should be grouped into the
>>> module bank.
>>>
>>> By only iterating over the available entries no check for unused entries
>>> is required and LED module 0 can be added to bank.
>>>
>>> Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
>>> Cc: stable@vger.kernel.org
>>> ---
>>>    drivers/leds/leds-lp50xx.c | 10 ++++------
>>>    1 file changed, 4 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
>>> index 94f8ef6b482c..d50c7f3e8f99 100644
>>> --- a/drivers/leds/leds-lp50xx.c
>>> +++ b/drivers/leds/leds-lp50xx.c
>>> @@ -341,17 +341,15 @@ static int lp50xx_brightness_set(struct led_classdev *cdev,
>>>    	return ret;
>>>    }
>>>    
>>> -static int lp50xx_set_banks(struct lp50xx *priv, u32 led_banks[])
>>> +static int lp50xx_set_banks(struct lp50xx *priv, u32 led_banks[], int num_leds)
>>>    {
>>>    	u8 led_config_lo, led_config_hi;
>>>    	u32 bank_enable_mask = 0;
>>>    	int ret;
>>>    	int i;
>>>    
>>> -	for (i = 0; i < priv->chip_info->max_modules; i++) {
>>> -		if (led_banks[i])
>>> -			bank_enable_mask |= (1 << led_banks[i]);
>>> -	}
>>> +	for (i = 0; i < num_leds; i++)
>>> +		bank_enable_mask |= (1 << led_banks[i]);
>>
>> Probably the first idea was to have a bitmask indicating which bank
>> to enable, but it ended up in having array of bank ids in DT with no
>> related adjustment in the driver.
>>
>> This patch deserves Fixes tag.
> 
> This code has not changed since the inital introduction of this driver.

Yeah, I had on mind design approach changes between subsequent
versions of the patch that was adding the driver.

> Fixes: 242b81170fb8 ("leds: lp50xx: Add the LP50XX family of the RGB LED driver")
-- 
Best regards,
Jacek Anaszewski


