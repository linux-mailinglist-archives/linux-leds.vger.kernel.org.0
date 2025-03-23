Return-Path: <linux-leds+bounces-4355-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 007E2A6CF1B
	for <lists+linux-leds@lfdr.de>; Sun, 23 Mar 2025 13:04:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B07E3B5881
	for <lists+linux-leds@lfdr.de>; Sun, 23 Mar 2025 12:04:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5F9B204C00;
	Sun, 23 Mar 2025 12:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="Ry4mzZmw"
X-Original-To: linux-leds@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F0E1DE4CE;
	Sun, 23 Mar 2025 12:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742731477; cv=none; b=mqbsgyinpFR+iYNmP4w/ETw6jojmpYE4m7pA+MCZwy0LHou7yIAIVmYTd0Ab1HS6Tc2MhRY55b5g01k6JrQzPZNgtm2l9drykITO/1b1mP6+AgE2DkjWoStch9xcDab4aOOx8lPMEn7AcCkQyigcqmduTwso1Ig+s1+SVx4zIYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742731477; c=relaxed/simple;
	bh=X2RSEHB/5njtNQnNQiWqwYC92KV+t70soDX2ZBnv1vk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DuAVe6i90x5yekWLDgpGqyE3gggMb5jMrWrfCNcCIHroq7jMWvKRlaos5RRexXzlKZjVYDZEndxXMTLGYlXO65lwrLHvjyopckDCl/Nt+v/+VraOA5+42qrDxMVnYzNm+BDXBzULgHMDngO4Ud8Jh9+FfUhagrY4tHMPQQTbojQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=Ry4mzZmw; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
	:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=MhzW9XC5Y8y5pf0coMzUl18/0PB+2d7VJu+1Gai3U0Y=; b=Ry4mzZmw+NuF9RUZXN0EyUuaZM
	mTeAIVfrsIGRFL5BGgwhmqq6cZNSiSyBWPtbd2GytdKWIb9dW49tL7sp9rxgQ9031sB+EkuBOI7Bm
	pFlsK3IhAxtOvqsICO1wtrHqJi3JEi33QSu/09ULhSLilY7t0muWswsul17FeT0eLRM8=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:63453 helo=[192.168.0.218])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1twK40-007n4A-Ki; Sun, 23 Mar 2025 13:04:25 +0100
Message-ID: <0ecfd0be-8ab4-48b3-8798-ba1ce0d3e939@emfend.at>
Date: Sun, 23 Mar 2025 13:04:21 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] leds: tps6131x: add support for Texas Instruments
 TPS6131X flash LED driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 bsp-development.geo@leica-geosystems.com
References: <20250318-leds-tps6131x-v2-0-bc09c7a50b2e@emfend.at>
 <20250318-leds-tps6131x-v2-2-bc09c7a50b2e@emfend.at>
 <20250319-tall-ruddy-flamingo-a12fcc@krzk-bin>
 <9a470dfd-8d7b-4529-b54b-289754b9eed6@emfend.at>
 <92d8d240-5156-414f-b58b-a957e27eb30c@kernel.org>
Content-Language: de-DE
From: Matthias Fend <matthias.fend@emfend.at>
In-Reply-To: <92d8d240-5156-414f-b58b-a957e27eb30c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score: 
X-Spam-Bar: 
X-Spam-Report: 

Hi Krzysztof,

Am 19.03.2025 um 20:28 schrieb Krzysztof Kozlowski:
> On 19/03/2025 17:25, Matthias Fend wrote:
>>>> +
>>>> +	if (reg3 & TPS6131X_REG_3_HPFL)
>>>> +		*fault |= LED_FAULT_SHORT_CIRCUIT;
>>>> +
>>>> +	if (reg3 & TPS6131X_REG_3_SELSTIM_TO)
>>>> +		*fault |= LED_FAULT_TIMEOUT;
>>>> +
>>>> +	if (reg4 & TPS6131X_REG_4_HOTDIE_HI)
>>>> +		*fault |= LED_FAULT_OVER_TEMPERATURE;
>>>> +
>>>> +	if (reg6 & (TPS6131X_REG_6_LEDHOT | TPS6131X_REG_6_LEDWARN))
>>>> +		*fault |= LED_FAULT_LED_OVER_TEMPERATURE;
>>>> +
>>>> +	if (!(reg6 & TPS6131X_REG_6_LEDHDR))
>>>> +		*fault |= LED_FAULT_UNDER_VOLTAGE;
>>>> +
>>>> +	if (reg6 & TPS6131X_REG_6_LEDHOT) {
>>>> +		ret = regmap_update_bits_base(tps6131x->regmap, TPS6131X_REG_6,
>>>> +					      TPS6131X_REG_6_LEDHOT, 0, NULL, false, true);
>>>
>>> And this is not locked?
>>
>> The read modify write operation is protected by regmap. Since this
>> operation does not interact with any other functions, no lock is needed
>> here.
> 
> 
> Following that logic no lock is needed in the first place. Define what
> is the purpose of this lock, not just "hardware access". I assumed you
> want to keep consistent hardware state between multiple updates. If
> that's correct, how did you prevent returning value from reads happening
> in the middle of concurrent update? Or how this update_bits_base is
> prevented from happening while you are in the middle of earlier calls
> which are protected by your lock?
> 
> That's confusing lock, considering also too short comment explaining its
> purpose.

Registers 0, 1, 2, and 3 control parts of the controller that are not 
completely independent of each other.
For some operations, it is therefore necessary to write to the registers 
in a specific order to avoid unwanted side effects.
Therefore, I protected write access to these registers with a lock. The 
RMW sequence in regmap_update_bits_base uses the cached value of the 
register and does not read from the hardware.

Explicit reads to the status registers can be performed at any time. If 
a flag is set, this can be reported.
Since regmap_read_bypassed actually reads from the hardware but doesn't 
update the cache, this isn't a problem either.
Therefore, I don't see any need for a lock here.

My suggestion would be to expand the comment as follows:
/* Hardware access lock for register 0, 1, 2 and 3 */

and add this additional note before it:
/*
  * Registers 0, 1, 2, and 3 control parts of the controller that are 
not completely
  * independent of each other. Since some operations require the 
registers to be written in
  * a specific order to avoid unwanted side effects, they are 
synchronized with a lock.
  */

Do you think that's acceptable?

> 
>>
>>>
>>>> +		if (ret < 0)
>>>> +			return ret;
>>>> +	}
>>>> +
>>>
>>> ...
>>>
>>>> +
>>>> +static int tps6131x_flash_external_strobe_set(struct v4l2_flash *v4l2_flash, bool enable)
>>>> +{
>>>> +	struct led_classdev_flash *fled_cdev = v4l2_flash->fled_cdev;
>>>> +	struct tps6131x *tps6131x = fled_cdev_to_tps6131x(fled_cdev);
>>>> +
>>>> +	guard(mutex)(&tps6131x->lock);
>>>> +
>>>> +	return tps6131x_set_mode(tps6131x, enable ? TPS6131X_MODE_FLASH : TPS6131X_MODE_SHUTDOWN,
>>>> +				 false);
>>>> +}
>>>> +
>>>> +static const struct v4l2_flash_ops tps6131x_v4l2_flash_ops = {
>>>> +	.external_strobe_set = tps6131x_flash_external_strobe_set,
>>>> +};
>>>> +
>>>> +static int tps6131x_v4l2_setup(struct tps6131x *tps6131x)
>>>> +{
>>>> +	struct v4l2_flash_config v4l2_cfg = { 0 };
>>>> +	struct led_flash_setting *intensity = &v4l2_cfg.intensity;
>>>> +
>>>> +	if (!IS_BUILTIN(CONFIG_V4L2_FLASH_LED_CLASS))
>>>
>>> Why builtin? That's a tristate, so I don't get why driver and v4l flash
>>> cannot be modules. You wanted REACHABLE probably... but then it is
>>> anyway discouraged practice leading to runtime debugging. So actually
>>> you want CONFIG_V4L2_FLASH_LED_CLASS || !CONFIG_V4L2_FLASH_LED_CLASS
>>> dependency.
>>
>> Okay, I'll add 'depends on V4L2_FLASH_LED_CLASS ||
>> !V4L2_FLASH_LED_CLASS' to the Kconfig entry and do the check in the
>> driver like this:
> 
> Only this
> 
>>     if (!IS_ENABLED(CONFIG_V4L2_FLASH_LED_CLASS))
>>       return 0;
>>
>> Is this solution okay for you?
> 
> This should should not be needed, because there are v4l2 stubs.

True, it works that way too, you're right, of course.
I was initially tempted by the many 
'IS_ENABLED(CONFIG_V4L2_FLASH_LED_CLASS)' in the other drivers, and then 
by the requested switch to an early return.
I will now remove the remaining early return as well.

Thanks!
  ~Matthias

> 
> Best regards,
> Krzysztof


