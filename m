Return-Path: <linux-leds+bounces-2499-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E9A95A68F
	for <lists+linux-leds@lfdr.de>; Wed, 21 Aug 2024 23:27:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CBCB6B20ABA
	for <lists+linux-leds@lfdr.de>; Wed, 21 Aug 2024 21:27:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDA6115855F;
	Wed, 21 Aug 2024 21:27:00 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D232613B297
	for <linux-leds@vger.kernel.org>; Wed, 21 Aug 2024 21:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724275620; cv=none; b=G/joVx3f6eijRZ0Y7It1EVNb6Lz2wRUvJyyFbmQh2ZuFLnWbTvsQZSUyMr8VjyZFdeVykg6PxgzVSkCKHwe1CZG54d+sj+xMnchlCz8x7myE/g0REECB3DSI9iEN6eaMLy2mLsIVnCjaBc5G5nMAI2TM0PDgqacw7GIvh/NI+QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724275620; c=relaxed/simple;
	bh=pAyB/SGACtBtpBXAJU2vpqOZqMMg3SUv2OZK5HjHTBk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X4d2iaAQNtktKe5XnN0+f5e3IB8h0AGbzUrSLEAyLt3wfp1zq5soFJJu5ya5EM5FTBlgN/pwy1DMI5rG0Fa6junU0YEQcXREqKiFqKk4FF+gxZal+swIj9vQDJdHUDx1iO+g/bc41txFdLPXn2EuXY/m9jXWIYjM7fPZCy0bBOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: bizesmtp85t1724275577tuyo2yhy
X-QQ-Originating-IP: dr471oK3/UGAX5f0lQjYAEcOtotkp1aILZnF/gipgt8=
Received: from [192.168.159.131] ( [106.150.157.243])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 22 Aug 2024 05:26:15 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2965814543808821696
Message-ID: <A85312FB70235D56+bd5fad03-36bf-4df9-ad44-7f7eaa7b2aa9@radxa.com>
Date: Thu, 22 Aug 2024 06:26:15 +0900
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] leds: pwm-multicolor: fix multicolor PWM LED lights up
 without any setting
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org, pavel@ucw.cz
References: <20240816102626.826-1-naoki@radxa.com>
 <20240821161119.GC6858@google.com>
Content-Language: en-US
From: FUKAUMI Naoki <naoki@radxa.com>
In-Reply-To: <20240821161119.GC6858@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1

Hi,

On 8/22/24 01:11, Lee Jones wrote:
> On Fri, 16 Aug 2024, FUKAUMI Naoki wrote:
> 
>> from drivers/leds/leds-pwm.c:led_pwm_set(),
>>
>> /*
>>   * Disabling a PWM doesn't guarantee that it emits the inactive level.
>>   * So keep it on. Only for suspending the PWM should be disabled because
>>   * otherwise it refuses to suspend. The possible downside is that the
>>   * LED might stay (or even go) on.
>>   */
>>
>> do the same in led_pwm_mc_set().
>>
>> this fixes LEDs light up without any setting (i.e. brightness is 0) on
>> Radxa E25.
> 
> Please redraft the commit message into proper sentences, complete with
> correct grammar.  All sentences should start with an uppercase char.

Thank you for your review!

I'll do it in next ver.

> Copying comment-blocks into commit messages to save authors from writing
> one isn't really the done thing.

Sorry, I could not understand this part. What should I do for this?

Best regards,

--
FUKAUMI Naoki
Radxa Computer (Shenzhen) Co., Ltd.

>> Signed-off-by: FUKAUMI Naoki <naoki@radxa.com>
>> ---
>>   drivers/leds/rgb/leds-pwm-multicolor.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/leds/rgb/leds-pwm-multicolor.c b/drivers/leds/rgb/leds-pwm-multicolor.c
>> index e1a81e0109e8..7155339c075e 100644
>> --- a/drivers/leds/rgb/leds-pwm-multicolor.c
>> +++ b/drivers/leds/rgb/leds-pwm-multicolor.c
>> @@ -50,7 +50,7 @@ static int led_pwm_mc_set(struct led_classdev *cdev,
>>   			duty = priv->leds[i].state.period - duty;
>>   
>>   		priv->leds[i].state.duty_cycle = duty;
>> -		priv->leds[i].state.enabled = duty > 0;
>> +		priv->leds[i].state.enabled = !(cdev->flags & LED_SUSPENDED);
>>   		ret = pwm_apply_might_sleep(priv->leds[i].pwm,
>>   					    &priv->leds[i].state);
>>   		if (ret)
>> -- 
>> 2.43.0
>>
> 

