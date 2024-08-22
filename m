Return-Path: <linux-leds+bounces-2504-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E5ECD95AF3A
	for <lists+linux-leds@lfdr.de>; Thu, 22 Aug 2024 09:25:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2412D1C2011F
	for <lists+linux-leds@lfdr.de>; Thu, 22 Aug 2024 07:25:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 964403D0D5;
	Thu, 22 Aug 2024 07:23:36 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A6E4500E
	for <linux-leds@vger.kernel.org>; Thu, 22 Aug 2024 07:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724311416; cv=none; b=M4QGV6HptwOizRBSmDwksu+QJJz6ZNcOzZ3hL3q+JYAvtcmjfU974A9t38LRpu8cq9SL+UpiC9AAPARoGabvNxbgs9u1udvlWrmaaQQYZzJ30frFfPhiRbzYWf0tduY61yRR9B9IoxoccVIdMvjFfn7KQp95U143NggKVG4HjF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724311416; c=relaxed/simple;
	bh=ooEnQMN7ZskWsS5zavaLzve07PZXQW2T41kfBMMHkeg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ZP8JEfk6n4a01KqBy87oUHzBGQAQhwT/r2Q67tJ2Qt2SKJRRd6O1f/bHwigZY3pwuwVusS0mopMKQB2h2/3eHRwm61vRxrfX1vwEMna5x27i4RTMygFhk3oo9oAoQeMBw4GBCUiNTIsBk2bszQvi0w5E4I0dDX6WqhNhltGuYYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: bizesmtp77t1724311365tmk83l1g
X-QQ-Originating-IP: hidd4YmxxQ0TAFPP8rsd61DIDSOUKaGcQWo2YLYEVuE=
Received: from [192.168.159.131] ( [106.150.157.243])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 22 Aug 2024 15:22:43 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 254877396212538896
Message-ID: <7DDC06B563854ED8+65e7204f-76df-4f36-8544-bede36a519fd@radxa.com>
Date: Thu, 22 Aug 2024 16:22:42 +0900
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] leds: pwm-multicolor: fix multicolor PWM LED lights up
 without any setting
From: FUKAUMI Naoki <naoki@radxa.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org, pavel@ucw.cz
References: <20240816102626.826-1-naoki@radxa.com>
 <20240821161119.GC6858@google.com>
 <A85312FB70235D56+bd5fad03-36bf-4df9-ad44-7f7eaa7b2aa9@radxa.com>
Content-Language: en-US
In-Reply-To: <A85312FB70235D56+bd5fad03-36bf-4df9-ad44-7f7eaa7b2aa9@radxa.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1

Hi,

On 8/22/24 06:26, FUKAUMI Naoki wrote:
> Hi,
> 
> On 8/22/24 01:11, Lee Jones wrote:
>> On Fri, 16 Aug 2024, FUKAUMI Naoki wrote:
>>
>>> from drivers/leds/leds-pwm.c:led_pwm_set(),
>>>
>>> /*
>>>   * Disabling a PWM doesn't guarantee that it emits the inactive level.
>>>   * So keep it on. Only for suspending the PWM should be disabled 
>>> because
>>>   * otherwise it refuses to suspend. The possible downside is that the
>>>   * LED might stay (or even go) on.
>>>   */
>>>
>>> do the same in led_pwm_mc_set().
>>>
>>> this fixes LEDs light up without any setting (i.e. brightness is 0) on
>>> Radxa E25.
>>
>> Please redraft the commit message into proper sentences, complete with
>> correct grammar.  All sentences should start with an uppercase char.
> 
> Thank you for your review!
> 
> I'll do it in next ver.
> 
>> Copying comment-blocks into commit messages to save authors from writing
>> one isn't really the done thing.
> 
> Sorry, I could not understand this part. What should I do for this?

I (probably) understand what you said. I need to explain detail in my 
own words and use correct English.

unfortunately my knowledge about electrical circuits and English is not 
sufficient for now.
I need some time to learn some things for writing "why my fix is correct".

then, I will not be able to send v2 so soon. if someone who understand 
well about this problem and the fix, feel free to reuse my patch (or 
make better patch).

Best regards

--
FUKAUMI Naoki
Radxa Computer (Shenzhen) Co., Ltd.

> Best regards,
> 
> -- 
> FUKAUMI Naoki
> Radxa Computer (Shenzhen) Co., Ltd.
> 
>>> Signed-off-by: FUKAUMI Naoki <naoki@radxa.com>
>>> ---
>>>   drivers/leds/rgb/leds-pwm-multicolor.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/leds/rgb/leds-pwm-multicolor.c 
>>> b/drivers/leds/rgb/leds-pwm-multicolor.c
>>> index e1a81e0109e8..7155339c075e 100644
>>> --- a/drivers/leds/rgb/leds-pwm-multicolor.c
>>> +++ b/drivers/leds/rgb/leds-pwm-multicolor.c
>>> @@ -50,7 +50,7 @@ static int led_pwm_mc_set(struct led_classdev *cdev,
>>>               duty = priv->leds[i].state.period - duty;
>>>           priv->leds[i].state.duty_cycle = duty;
>>> -        priv->leds[i].state.enabled = duty > 0;
>>> +        priv->leds[i].state.enabled = !(cdev->flags & LED_SUSPENDED);
>>>           ret = pwm_apply_might_sleep(priv->leds[i].pwm,
>>>                           &priv->leds[i].state);
>>>           if (ret)
>>> -- 
>>> 2.43.0
>>>
>>

