Return-Path: <linux-leds+bounces-4624-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7612AAB5D61
	for <lists+linux-leds@lfdr.de>; Tue, 13 May 2025 21:50:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F34B61B6130F
	for <lists+linux-leds@lfdr.de>; Tue, 13 May 2025 19:50:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59273213224;
	Tue, 13 May 2025 19:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SaqhbyGm"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB231A83E8;
	Tue, 13 May 2025 19:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747165810; cv=none; b=YATipfZy+7gdrWB0z3WiqHIYCumLpVkkzS9km2UQBqKDMUfNe+53ZsjyGG9HD8Y6Yv2a90rSrry1Q5VywAHSO4S14iSgcMrizHlKndEjHc2gJ+SEWQ3poYpMygUGc9qJvZq7YDNbNunGUBgOU999XPCLqwEkOPxDioqzHyhA7PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747165810; c=relaxed/simple;
	bh=mSh363eVw5bk5HBQgLkxzJxN37FVLvhx8B0kzGeLJgo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O6wUeQH2gdUi+3z71dYchCu1sWg8FF9Ly6ZCFLnG2xVsusM7OAvdKGZma0JJ4Zf8wl8VELvfp9czidkmT7bTzy3BbC0/hUcdMmiouYqzt2d2d2QTYnbdhhdWKp20QSOc0JFdFrVWLnj/z3AunFd1hlvwhn0tYWajZTpe7ABSXwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SaqhbyGm; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5fbcd9088a7so433947a12.0;
        Tue, 13 May 2025 12:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747165807; x=1747770607; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CsXZrUa8M1yVrUJtOXimjrVHeiPbXHfrnEEaLe2VR8w=;
        b=SaqhbyGmdS/o1zvnnDCFCEi1PrDIJF6om5DwRkLfPdjJl/W71l84aXsgxCGGM5WUtv
         Vt5cSOVyXuXUhpd1iMao4U5qDXmHAMdp/82alVmkvBN0dru4YJjYeu+whQ8BcJphHMkU
         EVDjpWqPFrJ8q1UaLO8vMvlYRiR3hRRU63IACmtxiPSnmuwyfxOenZphSS07SXVQ5pg5
         KUtbZ5PRjK75rS/NGqxVPgkkIRXGCJjljfTMNn/Ffczpo4lADPhe8djwj2Tz15/SxKzB
         PpDXxUtnQs5zpZoX80AFV2Z5esBKYzGPLzsa7vEA7Jbmh2pfk9GsK7UGOUKHMMcV8FNM
         v1Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747165807; x=1747770607;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CsXZrUa8M1yVrUJtOXimjrVHeiPbXHfrnEEaLe2VR8w=;
        b=SvgLA4sMMHm/Nh1Tl3ForjeKVwhIwoBXKfZM+BLfDZPWpBcgFQ9/9uAPJz5z72NDMM
         6QPvmOTMi8QGv4AR/TgmMfhCDitPAAg1l3k7ra8ooDWcVHU8HI/h5fdoHKORjWMsSKzK
         9V4cZSBRSxsfmrCIVuqDpFjOxeHnKKfd82DCOvrjcAxWfPuzCRSDBBpdZAJsI0/UsT4n
         r+eiA/tYfbPyazrsPDo0lRx3JOpDZP08ypIPiyzKEAWy4j/O1snZx+sDS+SX/Xv4InpI
         i/st5u0zkTVbAjd/XMy8peOZXuoMRGW+MhvCzeuBSI7BHof0stHqWZiybN9dSDp3RjuE
         orRw==
X-Forwarded-Encrypted: i=1; AJvYcCWEvYZ/clRdosJiFi8ykIMPN8UFuxOimJHcSmkN8ko+faw+bvRijHjKHNP3G3NIe734hT1M8HnP/zupkDw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLeBWTVjWwZIgOKjyaIQ5VZCB/Y0c2huwMQzynDJqF/LRTBEat
	GiMgXh8mWHd2YlN+SM6vwToOMMVv8HXptT40G8Ou07J4a3G02iMYd5y75Py0
X-Gm-Gg: ASbGnctvOkzqr8FCWcEhdeH26fu+Re9BIULzbGq3CqrHLRYhuuBW1G9zJKgbS3xpKJa
	lKJTWDtEwNhxfQI8dt/wlwHzylxbZJXwJXA4zYikN+BuhMT+juMnnGd5InfxVFqBLUCj7W8+KO1
	N7ZTsUUiAb2SVVsbuNIw+N7i3my8aHJVjpAixwJpaWLPnpCaaj39nRUOc/T4aSEYrOWL8gy/n4u
	JMAM6BXnSFkKJPsyRBMfIPYVTbKDih3Cox7jEodZ8XabMEWOz/ILKDZebPG4qPKjR5nlcVUSkmT
	uXhSWh0hP2IU7G0L4cNGJsUHIaeElT7lGW07ZybaZY/Kf5/c8RXUI69Ww9f/NmrP
X-Google-Smtp-Source: AGHT+IEQR0y/RJnPkhfu6O7I358ZfVWOGy+9SRuGu461NAf+XpKUHbVr6129seK3/PgSKfNLYQEGRA==
X-Received: by 2002:a05:6402:42c6:b0:5fd:1778:70b1 with SMTP id 4fb4d7f45d1cf-5feebe47e9emr4345187a12.17.1747165806473;
        Tue, 13 May 2025 12:50:06 -0700 (PDT)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fd2b69a394sm4362534a12.40.2025.05.13.12.50.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 12:50:05 -0700 (PDT)
Message-ID: <a7988a35-9dad-4771-afb3-b2fb8c543fbe@gmail.com>
Date: Tue, 13 May 2025 21:50:04 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] leds: leds-lp50xx: Handle reg to get correct
 multi_index
To: Johan Adolfsson <Johan.Adolfsson@axis.com>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Kernel <Kernel@axis.com>
References: <20250506-led-fix-v1-1-56a39b55a7fc@axis.com>
 <62a74e0e-f5a1-40b5-a855-6e9bd620cbd5@gmail.com>
 <PAWPR02MB92814A311B18A6FD8A448D249B97A@PAWPR02MB9281.eurprd02.prod.outlook.com>
 <0bf10848-0fa2-438a-92dc-6d3b29760b64@gmail.com>
 <PAWPR02MB9281789F85D773CEC278688F9B96A@PAWPR02MB9281.eurprd02.prod.outlook.com>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <PAWPR02MB9281789F85D773CEC278688F9B96A@PAWPR02MB9281.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Johan,

On 5/13/25 15:04, Johan Adolfsson wrote:
> 
> Hi Jacek,
> 
>> From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
>> Sent: Monday, May 12, 2025 20:10
>> To: Johan Adolfsson; Lee Jones; Pavel Machek
>> Cc: linux-leds@vger.kernel.org; linux-kernel@vger.kernel.org; Kernel
>> Subject: Re: [PATCH RFC] leds: leds-lp50xx: Handle reg to get correct multi_index
>>
>> On 5/12/25 12:59, Johan Adolfsson wrote:
>>>
>>> From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
>>> Sent: Saturday, May 10, 2025 17:32
>>> To: Johan Adolfsson; Lee Jones; Pavel Machek
>>> Cc: linux-leds@vger.kernel.org; linux-kernel@vger.kernel.org; Kernel
>>> Subject: Re: [PATCH RFC] leds: leds-lp50xx: Handle reg to get correct multi_index
>>>
>>>> Hi Johan,
>>>>
>>>> On 5/6/25 12:39, Johan Adolfsson wrote:
>>>>> mc_subled used for multi_index needs well defined array indexes,
>>>>> to guarantee the desired result, optionally use reg for that.
>>>>>
>>>>> If devicetree child nodes is processed in random or reverse order
>>>>> you may end up with multi_index "blue green red" instead of the expected
>>>>> "red green blue".
>>>>> If user space apps uses multi_index to deduce how to control the leds
>>>>> they would most likely be broken without this patch if devicetree
>>>>> processing is reversed (which it appears to be).
>>>>
>>>> Are you trying to solve some real problem that occurred to you?
>>>
>>> Yes! Since the subled is indexed by the processing order, it gets reversed if devicetree processing is reversed
>>> (which I understand is a "feature"), so instead of "red green blue" I would get "blue green red" in the multi_index file without this patch.
>>> The mapping to the hardware does not match that, so writing "255 0 0" to multi_intensity will give me red and not blue.
> 
>> You are expected to write intensities to the multi_intensity file
>> according to the order of colors listed in multi_index file.
> 
> That is what I did above, but LED turned red and not blue.
> 
>>>> The order of DT nodes parsing is not a problem here - we save
>>>> color index in subled_info to be able to figure out which color
>>>> is on which position. This information can be retrieved in sysfs
>>>> by reading multi_index file.
>>>
>>> Maybe the bug is somewhere else in the leds-lp50xx if that is supposed to work,
>>> but I still think it's a good thing to be able to get the expected order in the multi_index file.
>>
>> Please make sure you read Documentation/leds/leds-class-multicolor.rst.
>> There is no such term as "expected order in the multi_index file".
>> The framework is called multicolor, not rgb. The order of colors does
>> not need to be RGB.
> 
> Maybe I'm missing something here - but how do i specify that a certain pin on the driver IC is connected to a certain color of the LED.
> The devicetree looks like this:
> It seems the first number in multi_intensity seem to go to pin regardless of what multi_index says.

OK, indeed there is a problem. Let's continue in your patch thread.

> 
> 			multi-led@0 {
> 				reg = <0x0>;
> 				color = <LED_COLOR_ID_RGB>;
> 				label = "led:rgb";
> 				function = "led";
> 				linux,default-trigger = "default-on";
> 				max-brightness = <255>;
> 				#address-cells = <1>;
> 				#size-cells = <0>;
> 
> 				/* Need BLUE GREEN RED here or reg to give red green blue in multi_index! */
> 				led-0@0 {
> 					color = <LED_COLOR_ID_RED>;
> 					reg = <0>;
> 				};
> 
> 				led-1@1 {
> 					color = <LED_COLOR_ID_GREEN>;
> 					reg = <1>;
> 				};
> 
> 				led-2@2 {
> 					color = <LED_COLOR_ID_BLUE>;
> 					reg = <4>;

This needs to match node-name[@unit-address], i.e. here 2.

> 				};
> 			};
> 
-- 
Best regards,
Jacek Anaszewski


