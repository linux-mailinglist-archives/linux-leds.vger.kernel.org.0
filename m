Return-Path: <linux-leds+bounces-3077-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DC099A4E1
	for <lists+linux-leds@lfdr.de>; Fri, 11 Oct 2024 15:22:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7FC881C21155
	for <lists+linux-leds@lfdr.de>; Fri, 11 Oct 2024 13:22:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA67E218D65;
	Fri, 11 Oct 2024 13:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vyo/FP0x"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF8021859A;
	Fri, 11 Oct 2024 13:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728652816; cv=none; b=H5HG8/KCVTRGd+1Fbqz9D+zbJR6DP/FlWY6qNJ+lnuV9tBtGIxWu7WCrmv/uEwit+43QUoj5/bjWYB1Ib0TP20egoLsH+mTqHBiGIT8/Of4Ic9lf8BouHpmnXco5327ipDfJlFly9vsOMUnON2Gkvla3Z5RtVvspMcr9Fghbo8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728652816; c=relaxed/simple;
	bh=NuI87gb2l/dMeMpAWx7RwsSYv8IlVDFvAoedt/XdVeU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TSsQfledQfWWP2L/clxHPyoPLqZBSw6J64NT9KTgtI7PYDxGPYysivvF0aUSsHtRiJuGDsKmUV1l70RsSXII822rRWnv4/2GSen4AOJsAIQ7cKau4MByOZz/kQ3J+fx1CvuEHKZ1za7ldCk6YfCsJSDBbh8v9cjYf5+NPgZ1voo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vyo/FP0x; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7e9f98f2147so1233317a12.1;
        Fri, 11 Oct 2024 06:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728652815; x=1729257615; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HQGnKXGMD/jd3LTWPOuFrMlwOdbC5EsGlhAOU++vmwc=;
        b=Vyo/FP0xC0ccDm4JiUHtvqv6rxjh8ppQ1h9x4Ddl33oa5i90A8+epmWiFTf4ztPHVm
         MSIHQENlu3aJ6vIvgicnQaGvKKfPAi8/SkPlJjVZ50Yb9HRj0Pvu8yINZq+EUeznN3nd
         SPTlI5MhREVm58clT5D+/GT5jU3R959vU6xDHgpGWOir6KhQ/9S9Qxrt+AqLfLf0zAiV
         g4gIYwYh1rocXeVKEs/QD+PXzpGrdmjgQ4f0+XSWDZo+SiwX0bhka8HWSXZ87Fookg8/
         M5eISvxRg42auaaelLKJ1gcmt+opzWYIZFbo5h98nye/mhbZkeU+76YnGAmaBmmeS+37
         x1uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728652815; x=1729257615;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HQGnKXGMD/jd3LTWPOuFrMlwOdbC5EsGlhAOU++vmwc=;
        b=eLJqrPJrtDpZ1K48XjO2JIvmvOiyYxmHX1C7sOLhaa0Lt37jmGtf1+3+NooTQm5dFY
         BqWhLfoimD2zKqxgszvm7XW5/dBBSYVpvm4KQ/NatrQ1cxqlMPEDmEIhSwVP/IXw3/S2
         ccrihvJXeaJ+Lbxb1hnNtk29vSGiam+zXXhjilgU90uA0zm/44r1lh5QExh2XO/Ub6/U
         g2L9MTWpS9psCje4HCSGZ8hXeM7rsCZMgVttxyXDOP9Hhdrwh7/bninl0Jsqsb6puosm
         08c4qQY3F4Cmro1fayQ6/3pxk/NFd9iMHjPz7S3ekQuxLqmh25MyehIzl7+sXIYAiM0h
         DWvw==
X-Forwarded-Encrypted: i=1; AJvYcCWiqS9NRXrV0q5O5ejN/+P99+teUGkFNQPmCc8TVu1XgEoOzn9tLbByAPuNdaUYaTKqgxcXKEjZQ9O/7g==@vger.kernel.org, AJvYcCXQM1Oc0TcJ7BMIJcVRe0T4AmA7WgtK8kQjnoBVXiWZoIwEnsRJNjAcQljBtEf3HBsJPTM2MTOAiRliGIY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrgVc+cdwYH6/SRCie/wZQcdNNp0hWy/USJ/g3ypRNfBx13Stg
	Yl1jL8Az7CX4DZoWIx3zrAs4HTvei+Ioxqb2mS9lwGR0VpKFhdHp
X-Google-Smtp-Source: AGHT+IH5nEeE+SMSc6DH3bEQIbFsOMs4TIXRax9wCnVZVUm8SWqh9hQoGE5QLcDKtpZh23qzawXOfg==
X-Received: by 2002:a17:90a:c250:b0:2e2:d1a3:faf8 with SMTP id 98e67ed59e1d1-2e2f0dac7c2mr3651218a91.33.1728652814511;
        Fri, 11 Oct 2024 06:20:14 -0700 (PDT)
Received: from ?IPV6:2409:40c0:11a4:8d8a:687:fb0b:3c04:c809? ([2409:40c0:11a4:8d8a:687:fb0b:3c04:c809])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e2d5fc5e1bsm3153033a91.52.2024.10.11.06.20.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Oct 2024 06:20:13 -0700 (PDT)
Message-ID: <83572cde-19a1-4089-b02b-361a8ef40bee@gmail.com>
Date: Fri, 11 Oct 2024 18:50:04 +0530
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] leds: Fix uninitialized variable 'ret' in
 mt6370_mc_pattern_clear
To: Lee Jones <lee@kernel.org>
Cc: pavel@ucw.cz, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20241006131337.48442-1-surajsonawane0215@gmail.com>
 <20241011074702.GN661995@google.com>
Content-Language: en-US
From: Suraj Sonawane <surajsonawane0215@gmail.com>
In-Reply-To: <20241011074702.GN661995@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/10/24 13:17, Lee Jones wrote:
> On Sun, 06 Oct 2024, SurajSonawane2415 wrote:
> 
>> Fix the uninitialized symbol 'ret' in the function mt6370_mc_pattern_clear
>> to resolve the following warning:
>> drivers/leds/rgb/leds-mt6370-rgb.c:604 mt6370_mc_pattern_clear()
>> error: uninitialized symbol 'ret'.
>> Initialize 'ret' to 0 to prevent undefined behavior from uninitialized
>> access.
>>
>> Signed-off-by: SurajSonawane2415 <surajsonawane0215@gmail.com>
> 
> Real names only.  Please update your .gitconfig.
> 
>> ---
>>   drivers/leds/rgb/leds-mt6370-rgb.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/leds/rgb/leds-mt6370-rgb.c b/drivers/leds/rgb/leds-mt6370-rgb.c
>> index 10a0b5b45..87805c21e 100644
>> --- a/drivers/leds/rgb/leds-mt6370-rgb.c
>> +++ b/drivers/leds/rgb/leds-mt6370-rgb.c
>> @@ -587,7 +587,7 @@ static inline int mt6370_mc_pattern_clear(struct led_classdev *lcdev)
>>   	struct mt6370_led *led = container_of(mccdev, struct mt6370_led, mc);
>>   	struct mt6370_priv *priv = led->priv;
>>   	struct mc_subled *subled;
>> -	int i, ret;
>> +	int i, ret = 0;
>>   
>>   	mutex_lock(&led->priv->lock);
>>   
>> -- 
>> 2.34.1
>>
> 

Thanks for the feedback. I'll update my .gitconfig to use my real name 
for future patches.

Best regards,
Suraj Sonawane

