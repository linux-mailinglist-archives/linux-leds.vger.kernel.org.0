Return-Path: <linux-leds+bounces-4690-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E866EABFEE2
	for <lists+linux-leds@lfdr.de>; Wed, 21 May 2025 23:26:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1D7F1B6585C
	for <lists+linux-leds@lfdr.de>; Wed, 21 May 2025 21:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 550472BD005;
	Wed, 21 May 2025 21:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O9v4LVQS"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92AE428FA96;
	Wed, 21 May 2025 21:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747862774; cv=none; b=T2N7HPL/WAlSWwgdEScJ2lOXSvx0ABoKW14/AUAVu0SFptR//gq/W1vi9bN3VXFsjl1W8J7TlAhSGZ2eSuXzDsOoN6I+DxN7ChH6tUxTUpE8VXBjFcZm0RcZTHvnDB1q1nfTAdZBPFkOsHACswP7TrJ3Gtc4hNT2cNTTTHkqwhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747862774; c=relaxed/simple;
	bh=br5Vfyk6fgSmRQvH+xT+5ilO1OWquD2vmMM89wJ8pC4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b2G7Mdq/nD0lhJ+HVMXuW5Hn3RkYB3LboCri6ZtD0JvOX8kWE9eJJoL5PEtF2Hi42wNLYDEhPFU+cF24UEuvZjh1sgV9SwVKGy1GWjCQvlkl+uVJoUcH3jbbwSmYndbB05WXOKxHaIXCHtsRajpaovyxynQozH9eaHcDTealyVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O9v4LVQS; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-601f278369bso7415285a12.1;
        Wed, 21 May 2025 14:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747862771; x=1748467571; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=caARzHi0zB8eOtLXrI95nu9sdt9ECbBkYwSpL8u4tlw=;
        b=O9v4LVQSMDKEQkq3+X3SAv4TObwuyfDxylvHK0kQ8WbHrkQF0/NaoVJlFJ2aFb9c7L
         MVaHz0hkpo3z00mDJWkAZ5oBwGFJ6qnkFn+i+cDLAZAD1Id4xm96rxn13pseCUqJS3Oi
         Hx7PobcjFGhRsxSYg1G81zBRHdUg08DtjLo/3eQ2dsY4DdqgnvpQHur+kZs+h9yPAXnK
         l7LumlhIBAXmkIOAC/LqaDn8RODczytu2bWK7OBRNFWg1MKj3qsdLv0PxKUmzLelRkay
         ecsBP5LtFrRy1e2He8XQoIXerPrF4CSKZmhCPeit7T5Zqx/ooZoi7lNPDC4jLK8luzeU
         T5Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747862771; x=1748467571;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=caARzHi0zB8eOtLXrI95nu9sdt9ECbBkYwSpL8u4tlw=;
        b=qYKzoLseoe0ujabulHFlCCTaW9dCO9wkaUG++96s363rTdTqG42GlAOqaTVSBcdNX2
         vq9PcMwo8AgrMqcW4LXUEf8QqlSD3KFRTYoO/5GiEzT0M5g5MhYE3iOs0R+YoELFaYPo
         Vd6Gv7gkO3wEAznyilX0uUSvXaYCtxySP/VyaZirIh3lT+ukflMK86kiIZmVWif+fvy7
         eNsKv+qXaaBWJGqXMqM/6HFpJ8f0y4YSHEHiyZt8mGMO0jnV1EbImRjAYep0wxlxxe6L
         hHJo/XJtB/Bh7gfnyXo9oH7rs9YspRW97dA2TiFuS1HMHJ+a8F7bsmlnkv/a3XXhXZ/I
         R6Pw==
X-Forwarded-Encrypted: i=1; AJvYcCUWODRwWp6n3qEO/uYyVoZhd8Fv/IjkDHfvm8j0hTRW4ERCVHhG8gZfLB3jyQrfIYAx71F+W/EwJF6njA==@vger.kernel.org, AJvYcCXjXa5KVAibz8A8iOprmLms1zg1yXXSRHr5sjYqR/BpG/rjVElS9FLgdqFT9fvoPocBnRdEuMYxorScrZk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoshrksqxFiwsgz7A5XWmn03jp0bcfSSJyve5jjHcXOBSETX+V
	3HXuYV+f92lQaaMZBxJQyGkDLULvLz1zKExf9ndqP17v6cqczwgSqaP1
X-Gm-Gg: ASbGncvaywofR+T3Vk5je0SbxW1E+BXnF7IwwjYkoUoiFFE2W57WrUmRgeD5Tk67YCE
	rkCfFXsOWczy5GQo/YYrJCnd80bnIvrnk0nuVZ8XIkZhDphX/0GnUQWeoeUO/ZRdgMf4rl+gx9M
	Vi9uNcUqHjwkaT3GTGhWgBvUfKqRR5wsFG3Lnj2A+HVt+YB8UtFZ4Se3SFgRVi+nH0IrUGqLklM
	8sOMcn9rr7ekl9RqEz3ngjEkCQG+BiolTeDwQfuWC3HDazY3ccohk24VWeucjIeuIQA3oH2b6h6
	P4IQjB6HEymNmXTRxChZAL+P4eyPmJgJpTogbkBrrAUHJ85O1tJVpw4oaKsOYx13
X-Google-Smtp-Source: AGHT+IFqGD2rOUea2XYHp5W8fZ3l0vO85xKCFLQCaIOhlw30kND9mJreNy3hTfm/s4vI959SQ7fafg==
X-Received: by 2002:a05:6402:4309:b0:602:1061:5ebb with SMTP id 4fb4d7f45d1cf-6021061615emr7414712a12.32.1747862770603;
        Wed, 21 May 2025 14:26:10 -0700 (PDT)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005a6e6371sm9623534a12.40.2025.05.21.14.26.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 14:26:09 -0700 (PDT)
Message-ID: <e88b295d-eb52-4d42-ae33-232c27f2e1e8@gmail.com>
Date: Wed, 21 May 2025 23:26:08 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] leds: KUnit registration tests pertaining to
 init_data
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org, bettyzhou@google.com, ynaffit@google.com,
 tkjos@google.com
References: <20250515082830.800798-1-lee@kernel.org>
 <7c5a8768-2d19-40b9-a965-966a8900e703@gmail.com>
 <20250519133300.GA8794@google.com>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <20250519133300.GA8794@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/19/25 15:33, Lee Jones wrote:
> On Sun, 18 May 2025, Jacek Anaszewski wrote:
> 
>> Hi Lee,
>>
>> On 5/15/25 10:27, Lee Jones wrote:
>>> Lots of drivers still register with the LED Class using init_data. Let's
>>
>> What do you mean by "still"? Actually init_data is the new approach,
>> that turns the LED core DT parser on, and is predestined for use with
>> {devm_}led_classdev_register_ext() API.
> 
> Thanks for the information.  I'll update the wording.

Other than that, for the whole series:

Reviewed-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

-- 
Best regards,
Jacek Anaszewski


