Return-Path: <linux-leds+bounces-6443-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C36FCC01EC
	for <lists+linux-leds@lfdr.de>; Mon, 15 Dec 2025 23:31:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6ECAE30019CC
	for <lists+linux-leds@lfdr.de>; Mon, 15 Dec 2025 22:31:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E8DE270ED7;
	Mon, 15 Dec 2025 22:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=traphandler.com header.i=@traphandler.com header.b="oV123PE+"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtpout1.mo528.mail-out.ovh.net (smtpout1.mo528.mail-out.ovh.net [46.105.34.251])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE191D7E42;
	Mon, 15 Dec 2025 22:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.34.251
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765837901; cv=none; b=VoxgU8dM0Okd/Ppv2Na+hzv3vH65mYsBb1Uc3uVIcBvJhu7ftEU8FICmpfzz1pNtaeXTTOKrd7aWFgsJOdTIokBuicyJV4SN2SFMHQdZkiPGNuynhJJ6FfrNu/J8K+YxizGTYBUJNGwrIy2UtdfQ7EWfGecreJ4T+HVts6gkG6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765837901; c=relaxed/simple;
	bh=1dmHaZ+uolsmwNWFreFjf7qza1yRVB9DQwN+HSv3W/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BLkb9T9WqImGH1NRZL5cecO51IdfLTWe9a0PWGXOB0a1mlhi3xIXz7jGGFk7h/lzi2CtCFo9aG4w7UHigBVLnKMAA9VOJVNpTKhD/83FYYe7FW+SVc8J7rV0XDM6XpIJAE1czKXFNETe7ahb1F3gku4silGu0G82niGMNarZYK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=traphandler.com; spf=pass smtp.mailfrom=traphandler.com; dkim=pass (2048-bit key) header.d=traphandler.com header.i=@traphandler.com header.b=oV123PE+; arc=none smtp.client-ip=46.105.34.251
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=traphandler.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=traphandler.com
Received: from director3.derp.mail-out.ovh.net (director3.derp.mail-out.ovh.net [152.228.215.222])
	by mo528.mail-out.ovh.net (Postfix) with ESMTPS id 4dVZPK53Jpz5vlK;
	Mon, 15 Dec 2025 22:24:53 +0000 (UTC)
Received: from director3.derp.mail-out.ovh.net (director3.derp.mail-out.ovh.net. [127.0.0.1])
        by director3.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
        for <lee@kernel.org>; Mon, 15 Dec 2025 22:24:53 +0000 (UTC)
Received: from pro2.mail.ovh.net (unknown [10.110.43.221])
	by director3.derp.mail-out.ovh.net (Postfix) with ESMTPS id 4dVZPK3BC9z5vZM;
	Mon, 15 Dec 2025 22:24:53 +0000 (UTC)
Received: from [192.168.1.15] (82.65.207.21) by DAG18EX2.emp2.local
 (172.16.2.182) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Mon, 15 Dec
 2025 23:24:52 +0100
Message-ID: <26676694-ec69-4fef-8337-a6c7ceb1396d@traphandler.com>
Date: Mon, 15 Dec 2025 23:24:52 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] leds: group-multicolor: Add support for initial value.
To: Lee Jones <lee@kernel.org>, Martijn de Gouw
	<martijn.de.gouw@prodrive-technologies.com>
CC: Pavel Machek <pavel@kernel.org>, <linux-leds@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20251124210521.2064660-1-martijn.de.gouw@prodrive-technologies.com>
 <20251214152116.GC9275@google.com>
Content-Language: en-US
From: Jean-Jacques Hiblot <jjhiblot@traphandler.com>
In-Reply-To: <20251214152116.GC9275@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CAS7.emp2.local (172.16.1.7) To DAG18EX2.emp2.local
 (172.16.2.182)
DKIM-Signature: v=1; a=rsa-sha256; d=traphandler.com;
 s=ovhemp997128-selector1; c=relaxed/relaxed; t=1765837493;
 h=from:to:subject:date; bh=+GrTo+eaQsn09g527yVzhxbtRYi2yPTCqCwuHqooSUQ=;
 b=oV123PE+WSmZqNGbdDtYA+34cDst5vGa+o4vMByoancJbv3kY3QAyD0nDG795gAL2X/8hAsQ7blU/S0T7SvDP7THRj1XdeUJDQ/HWaIk+7BIiHr4i0W4FiIdH3NSolgf97J7Jbo8kGUeGRlv/s3kS2xLmyIc96hxAya3JPzF0IFiqrGUA0vcWX1Zr1GxonxjIslKVIUmiMl9ALmLo6kSRyH3wFa8r8jsdM/qxyZ5UzhKKbZcYdl2U5HBC6HQRF3OPF78j0U1J77/kUA8rTu1jm7wTRIE12t/kAY0d/1ltJ6GGa0zuYvzrCA44unowALVOttaVYKo8M1weNM7URiHbA==
X-Ovh-Tracer-Id: 9994894952239151579
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTGk2bxVk8T3jREUwV3ObE5N6XpX50EMmDlM3kmUt627FnIm6l1DffHlyFn850nh7RJQf9WIiPcNIvrDumpcVE1dAMG9QM7l5ZH1pXIBQg9+4Z42mM2+2VAQhNw6chGN3iqqK1z7tZf+kR2tDBN6hNjxhw4HbiSPrDQ05XtmXhVWWC3ybvyyzi70zTLqNV8gVI0K6DoS/fCPvzcwD5dBljsSE11PQyWh7S3N6lh4E1yBOdxMPPNvc6XMvdgjVBkyrdUriZKYCyGUyq1yB9TsARivjXj/aJThmFqj2ugmegbqsXfk+jeYzvF5xdSuDg0fdka+xMFbRdWshSjF78sPdTa1VD0OzKqgrA0TJ47oWBccjJB1a8tdQ2kIzvjNA7/tsdnWUNc0PghxnWB+hH+6iNb8XYhRTdoqVFQFytZ55QwmZ8MC0cYeV1F/39OynvKEQ5guGj1zYknyWgG/eTM7hex0MW0YJwOK3aJg6Yf1IUyEg4T9TO+NsLpYP8QjUPozf7X/SAlk9tTQjo3iALouhcgnfW49E+0mTuielrJ1X1FUZo7H8P1Pv4Wa+C/Kh5gmIMhqn/K4DMHRcFGZl7gr3IHExHqHxTFF1qpCPZJeHz+Lz+ftzsFDPWePlr7zOrOeDYDO3tq6qe/82nfCOJjLfQHH0xwUWUhfbMFn7nVlNLWOLw



On 14/12/2025 16:21, Lee Jones wrote:
> INTENTIONAL TOP POST: I think the original author should have been on Cc.
> 
Hi,

Sorry, I didn't follow the discussion and I'm not sure what you're 
trying to achieve with this patch. So correct me if I'm wrong.
As I understand it you're trying to capture the current state of the
LEDs at probe() time to set the the relative intensity of the LEDs 
constituting the group.

> Adding: Jean-Jacques Hiblot <jjhiblot@traphandler.com>
> 
>> When the driver is loaded, it turned off all LEDs in the group. This
>> patch changes the driver to take over existing LED states and set
>> the brighness and intensity in the group accordingly.
>>
>> Signed-off-by: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>
>> ---
>>   drivers/leds/rgb/leds-group-multicolor.c | 14 ++++++++++++--
>>   1 file changed, 12 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/leds/rgb/leds-group-multicolor.c b/drivers/leds/rgb/leds-group-multicolor.c
>> index 548c7dd63ba1e..a12720d73f188 100644
>> --- a/drivers/leds/rgb/leds-group-multicolor.c
>> +++ b/drivers/leds/rgb/leds-group-multicolor.c
>> @@ -69,6 +69,7 @@ static int leds_gmc_probe(struct platform_device *pdev)
>>   	struct mc_subled *subled;
>>   	struct leds_multicolor *priv;
>>   	unsigned int max_brightness = 0;
>> +	unsigned int default_brightness = 0;
>>   	int i, ret, count = 0, common_flags = 0;
>>   
>>   	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>> @@ -96,6 +97,13 @@ static int leds_gmc_probe(struct platform_device *pdev)
>>   
>>   		max_brightness = max(max_brightness, led_cdev->max_brightness);
>>   
>> +		/*
>> +		 * If any LED is on, set brightness to the max brightness.
>> +		 * The actual brightness of the LED is set as intensity value.
>> +		 */
>> +		if (led_cdev->brightness)
>> +			default_brightness = max_brightness;
Storing a brightness here is a bit confusing. What we're interested in 
is whether at least on of the LED is on (and thus the group is 
considered on). I've would rather use a boolean here, like is_on = true
>> +
>>   		count++;
>>   	}
>>   
>> @@ -109,14 +117,16 @@ static int leds_gmc_probe(struct platform_device *pdev)
>>   
>>   		subled[i].color_index = led_cdev->color;
>>   
>> -		/* Configure the LED intensity to its maximum */
>> -		subled[i].intensity = max_brightness;
>> +		/* Configure the LED intensity to its current brightness */
>> +		subled[i].intensity = DIV_ROUND_CLOSEST(led_cdev->brightness * max_brightness,
>> +							led_cdev->max_brightness);
You cannot use this computation in all cases. If the LEDs have not been 
turned on, their intensity will always be 0. Maybe the 'is_on' flag can 
be use to select which computation should be used.
>>   	}
>>   
>>   	/* Initialise the multicolor's LED class device */
>>   	cdev = &priv->mc_cdev.led_cdev;
>>   	cdev->brightness_set_blocking = leds_gmc_set;
>>   	cdev->max_brightness = max_brightness;

>> +	cdev->brightness = default_brightness;
cdev->brightness = is_on ? max_brightness : 0;
>>   	cdev->color = LED_COLOR_ID_MULTI;
>>   	priv->mc_cdev.num_colors = count;
>>   

JJ
>> -- 
>> 2.39.2
>>
> 


