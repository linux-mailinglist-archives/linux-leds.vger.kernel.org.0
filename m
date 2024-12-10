Return-Path: <linux-leds+bounces-3552-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA379EA9AF
	for <lists+linux-leds@lfdr.de>; Tue, 10 Dec 2024 08:37:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B3C71885DF1
	for <lists+linux-leds@lfdr.de>; Tue, 10 Dec 2024 07:37:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4351E172BD5;
	Tue, 10 Dec 2024 07:36:59 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.197.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB1D79F2
	for <linux-leds@vger.kernel.org>; Tue, 10 Dec 2024 07:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.154.197.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733816219; cv=none; b=l5yJnUlgaescX2BvBYv4ByExPptnMfwjYSkpSuT3WkDj/6i0nXzXAPDMzs/ZhIEoRZr4/DcTk2Ga3NMGhN1NWWmPrFYci7gNkaNwoGD+FAK15LZumDZ6cx3AQrk/DViDROgdFzT7QnC5JsRd6CIQknqQSj1C+9NGJftdfu6OhYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733816219; c=relaxed/simple;
	bh=ch8WVepel5tiHf/RQfXHYj/GfAuqeDEtfE9yuFwddNQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=PMe9rYfi+atq86OtPfBSF1wQpM84qovkV38Y7hEv4K4Mi/jto9kOPAaWeGuh85ZViUL76Yq71qF39Yppw4Dc8l51HxQPlQvC/yhyF3okb1pHWwKGI7F8zFgrFb+8pQ36QO3/vOunYLdCkuKasif2fAlTJZv6e6EPoGi9g3V6iZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=43.154.197.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: bizesmtpip4t1733816188tx1phjn
X-QQ-Originating-IP: 9j2UoJ85119M+d+DxFNsZt8aPoOmEx9Mxw8pLfvfAd0=
Received: from [IPV6:240f:10b:7440:1:42fa:d92a ( [localhost])
	by bizesmtp.qq.com (ESMTP) with SMTP id 0
	for <linux-leds@vger.kernel.org>; Tue, 10 Dec 2024 15:36:26 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9459568736436856971
Message-ID: <303538E55468284B+287412a2-b1dc-45d0-af5d-c33c0c63acc5@radxa.com>
Date: Tue, 10 Dec 2024 16:36:25 +0900
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
To: linux-leds@vger.kernel.org
References: <20240816102626.826-1-naoki@radxa.com>
 <20240821161119.GC6858@google.com>
 <A85312FB70235D56+bd5fad03-36bf-4df9-ad44-7f7eaa7b2aa9@radxa.com>
 <7DDC06B563854ED8+65e7204f-76df-4f36-8544-bede36a519fd@radxa.com>
Content-Language: en-US
In-Reply-To: <7DDC06B563854ED8+65e7204f-76df-4f36-8544-bede36a519fd@radxa.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: M12MFmiBLnnluKNQj0Bk39BvLb22kdwEVcD06nzPM3z58D1Ll9r0pyDK
	+BZEfgWzXM92P05YF9IYNWxYbuA4I+4yetx4bTxKVYLJDiruoRJVkQ4mtxy5RjjXL8zIjI0
	RJP41G14GTHJZAOT8oSoPwDJmQLfr9mavv5WVeiHLw60EJpyVkgY44apMxMNLAo4VkcUD6d
	+KnDSlgnkkRU8M4g2O8svxNdTUYA1aEgInjC9SY77S79DSYWbuSJnoNZksfd5zllbqFLmii
	XDe9ALrFLgTzsvFeFJd4cr0ASnaXTbgWibP7nC2Lr6VBjNks1wdFR7ifqTMDK4wLYay3urx
	Fk7Cy1Xf8dDt/NENpizdqLeki87vkKNbqtGr+3okEtkjSRs33cXnwiage+yUG0KP7SXmAXH
	bPgLSkg6gnQ/E2g1GL4igZpmCEqTeQZE0sWG61RXLl9hImJiUWvyStaVqv5lzfqmpVXASnV
	m0DgNiSJsNVYZd3Da+AsQgzBL1oBn2MQ9kurY+3gfra6Q3fCIJKdzNQw1H1Ak3BeMZoIY7w
	ej4i0V3P1B7tWFXKD0XL9uiFxjreAEoEOWIafnaEMM7Mklj5WLIhl35RVNCDc0k70KSzzut
	7l2R5UBZrED4cmXMZxMkwg5kXRuujqxwPmplz9WJ8tEmjxN5Ym9UXDBlcCaLOcKiFJ8CB8S
	mDuRNwpl+ePO2QKpaeHXkkbUu+1edk0n5mO/SYMgH65Z7GZ6gVMBAvPGRgoXLoaE7O+mmTd
	q37Z2f1BdkXGpiBKHOnCR+MGo/2iN/h1awjC+IRsvoNXqXUq3HgDIsyt0se1EqonDuhkDx6
	/K8EjfOXY/aT2gQpMiEK97meukZ6dRmIcBcWN8p6pfWquzXVQlytLXqlFS1sg16ttZd7yKe
	sCznUHf7HRBrNipOK5JD44oN1F3j9yNRCazPhX+RGaET0WjVvgmpmw==
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0

Hi,

Could you help me(write good commit message), anyone?

Best regards,

--
FUKAUMI Naoki
Radxa Computer (Shenzhen) Co., Ltd.

On 8/22/24 16:22, FUKAUMI Naoki wrote:
> Hi,
> 
> On 8/22/24 06:26, FUKAUMI Naoki wrote:
>> Hi,
>>
>> On 8/22/24 01:11, Lee Jones wrote:
>>> On Fri, 16 Aug 2024, FUKAUMI Naoki wrote:
>>>
>>>> from drivers/leds/leds-pwm.c:led_pwm_set(),
>>>>
>>>> /*
>>>>   * Disabling a PWM doesn't guarantee that it emits the inactive level.
>>>>   * So keep it on. Only for suspending the PWM should be disabled 
>>>> because
>>>>   * otherwise it refuses to suspend. The possible downside is that the
>>>>   * LED might stay (or even go) on.
>>>>   */
>>>>
>>>> do the same in led_pwm_mc_set().
>>>>
>>>> this fixes LEDs light up without any setting (i.e. brightness is 0) on
>>>> Radxa E25.
>>>
>>> Please redraft the commit message into proper sentences, complete with
>>> correct grammar.  All sentences should start with an uppercase char.
>>
>> Thank you for your review!
>>
>> I'll do it in next ver.
>>
>>> Copying comment-blocks into commit messages to save authors from writing
>>> one isn't really the done thing.
>>
>> Sorry, I could not understand this part. What should I do for this?
> 
> I (probably) understand what you said. I need to explain detail in my 
> own words and use correct English.
> 
> unfortunately my knowledge about electrical circuits and English is not 
> sufficient for now.
> I need some time to learn some things for writing "why my fix is correct".
> 
> then, I will not be able to send v2 so soon. if someone who understand 
> well about this problem and the fix, feel free to reuse my patch (or 
> make better patch).
> 
> Best regards
> 
> -- 
> FUKAUMI Naoki
> Radxa Computer (Shenzhen) Co., Ltd.
> 
>> Best regards,
>>
>> -- 
>> FUKAUMI Naoki
>> Radxa Computer (Shenzhen) Co., Ltd.
>>
>>>> Signed-off-by: FUKAUMI Naoki <naoki@radxa.com>
>>>> ---
>>>>   drivers/leds/rgb/leds-pwm-multicolor.c | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/leds/rgb/leds-pwm-multicolor.c b/drivers/leds/ 
>>>> rgb/leds-pwm-multicolor.c
>>>> index e1a81e0109e8..7155339c075e 100644
>>>> --- a/drivers/leds/rgb/leds-pwm-multicolor.c
>>>> +++ b/drivers/leds/rgb/leds-pwm-multicolor.c
>>>> @@ -50,7 +50,7 @@ static int led_pwm_mc_set(struct led_classdev *cdev,
>>>>               duty = priv->leds[i].state.period - duty;
>>>>           priv->leds[i].state.duty_cycle = duty;
>>>> -        priv->leds[i].state.enabled = duty > 0;
>>>> +        priv->leds[i].state.enabled = !(cdev->flags & LED_SUSPENDED);
>>>>           ret = pwm_apply_might_sleep(priv->leds[i].pwm,
>>>>                           &priv->leds[i].state);
>>>>           if (ret)
>>>> -- 
>>>> 2.43.0
>>>>
>>>
> 


