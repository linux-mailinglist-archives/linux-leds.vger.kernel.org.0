Return-Path: <linux-leds+bounces-4643-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE731AB763C
	for <lists+linux-leds@lfdr.de>; Wed, 14 May 2025 21:55:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2231866A7D
	for <lists+linux-leds@lfdr.de>; Wed, 14 May 2025 19:55:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF9251D2F42;
	Wed, 14 May 2025 19:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VxYkzVLg"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DB818DB2F;
	Wed, 14 May 2025 19:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747252549; cv=none; b=Ujk8HFijSzc+H/fxR7FJrYh61vi+6Cup8ApJeWewJtmQZQce4NMBMjrHjzCdEh/ITy6HVANOkTivu+6AHMGkCVKfF6UVmznqVWSDa7Mn2KbQk7gU3BdfgX+MNoDWsnSwhEbhmCHIWcFG1D00ePksNaRR3uhXWkxGuTibtPLSc+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747252549; c=relaxed/simple;
	bh=JZLzcttBqgNUx4bsAMzaO3A/KL7m0UzGC4lYkWkPjxQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mrnQkpD9cuULzyxV6bg/O0ecM1jsep0yTIKxCBpjI1/lvXOqNF1CZ99NK6eKWQjNkhTS721iCEZta9+fIRP0MuVrxtNJa4q28yALrxDO20VT9K3wv8KTnj+1M4UTxc9WlFo7H2odvt6sEEsef2nj5BFf2BvVpMFHP4AaGrbvVQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VxYkzVLg; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5fbe7a65609so417519a12.0;
        Wed, 14 May 2025 12:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747252546; x=1747857346; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+O0+opsInUOmBnYBdK6LRXgW6r8ZAFurB6LRvWWPYB0=;
        b=VxYkzVLgb3iXMRH5v4rbkmRldfQTWOL5609ROdgOe/RWHrsR3nR0GwaC1cx/9GDBjj
         FaYV3bQQt9JXyjYC1bRYDeOBI+IDlfTc5/Z8us6BsNANNbiD/q7anLQ224JFBzm1Zd2I
         pRHjejvftfq/MEcslwKTZAmD1UmGG3JnOPESClDnTqvU9Y0M7aeZWq+BLOD8BoM9JZkk
         g4R8kynJNHPp0Jd0jqM9JfoTErYsrEbXLc8J954vcafWPE+Q2xcxEfc+2ni33A+NwjHI
         6Ejct11vJvFpO5Mpsbxd0u6nQQHi4tJLxGqbUbQ6FmjQJ5QqYfoJ4f0gBpUgw7EQoCPL
         lS4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747252546; x=1747857346;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+O0+opsInUOmBnYBdK6LRXgW6r8ZAFurB6LRvWWPYB0=;
        b=LjjNQ7LUSTbszLERaHvFVxlWFldqtGb/4fGN3bF1qyL+VFTAp8K8jlM89j9236vsuJ
         mZ5UxEu2UKANYEKb4V2oTaPeXn0CFSgJ3X0kiSQ5MzeejLMjhX67zp9J4TXliGk2/fyD
         TOGLLvJQiCQSCN/UH/sPkUrop2tRSeeGBo5Cf50IGOlUtkmYE5zujVrP02dFtfRq4yX+
         uKMG/j6HbHsXodOR9s0tprTcepLXvc5cLKUjc271afXRydFZv8aR7/1sNNKVcBXMeKYi
         YBwpIBAqSQxPk/QO0Gvg+CP1lU+hMVi2R1y/SyB1zkUVNYPZDYIL8RNpLCBi6Rkq7m2z
         Pfhg==
X-Forwarded-Encrypted: i=1; AJvYcCWpTgXPepIxT6qS8jPDWdIEnfd1+B5VGBPiBX9exAydJiLWca4OJZxGquUm2kaub9ivbkmhGd9pcb8hlC4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqBdbxJOCByx9CV1LxipfYME1ujnMGIa6L11JzZbX9M+Yi2D40
	ohg0i1aPK3SGmkTG3qUff25EiwW8sZxisHnOionMZmf5IOpTXCSY
X-Gm-Gg: ASbGncviVjmS6MvRTLUqoQ/JgVXeqGCKBExRwRyW/6zQMqyF5M/TV2TJrwK2YAr4McX
	gU++Kp5dvEd+fdQE8fSeMTMZGX0gY5roymmszn6snBaWqdJw7RNK5Vo3450Sj2TAu6qjwYCyaeo
	ccg44LCp5AJkpotlF2qi/CTruOdE6rR66Wr1SXBnOJSinPKF1SJROOxX7V99/Ri209heFuDK45G
	Tg7a57FzpGeupBS+9wF4RN1akKO3V3iFqxlEr4kUM9NI9YtQmeHY4w7bzO0CQr99t3TSFYA/KXk
	5lPDW4o+V/HmgwVUx09qD4GZqr0CssIqrTPlUN3IhQh2YyHI1oRjfhvUhg8aWurB
X-Google-Smtp-Source: AGHT+IHWqFNy5dqLdzGXWHocJYS3intKZp5bWh8LrVE+yaimhMSqUfC4GwMMYkCwDcyzr+pSfzbPhA==
X-Received: by 2002:a17:907:724e:b0:ad4:d32e:b571 with SMTP id a640c23a62f3a-ad4f71aa5e7mr503430566b.24.1747252546208;
        Wed, 14 May 2025 12:55:46 -0700 (PDT)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad23fc53241sm733558966b.51.2025.05.14.12.55.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 12:55:45 -0700 (PDT)
Message-ID: <449cf572-f637-42c9-b804-aaf74178e96b@gmail.com>
Date: Wed, 14 May 2025 21:55:43 +0200
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
 <5d34aec7-5027-4575-b860-afdf7b2c0757@gmail.com>
 <PAWPR02MB92815DC59F65E90956269EEC9B91A@PAWPR02MB9281.eurprd02.prod.outlook.com>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <PAWPR02MB92815DC59F65E90956269EEC9B91A@PAWPR02MB9281.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Johan,

On 5/14/25 16:34, Johan Adolfsson wrote:
> From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Sent: Tuesday, May 13, 2025 21:52
> To: Johan Adolfsson; Lee Jones; Pavel Machek
> Cc: linux-leds@vger.kernel.org; linux-kernel@vger.kernel.org; Kernel
> Subject: Re: [PATCH RFC] leds: leds-lp50xx: Handle reg to get correct multi_index
> ..
>>>                        }
>>> +                     ret = fwnode_property_read_u32(led_node, "reg", &multi_index);
>>> +                     if (ret) {
>>> +                             multi_index = num_colors;
>>
>> Why not to fail if 'reg' parsing fails?
>> It is marked required in DT bindings [0].
> 
> I didn't want to start failing if reg is missing since it has never been handled until now, despite what the doc says since 2022...

There is one in-tree user [0], and we will need to patch it as well,
because it uses reg 0,1,2 for each RGB LED module, instead of iout
numbers as it will be after your change.

We will need to also state clearly in the bindings that 'reg' property
maps to iouts for the non-banked RGB LED modules.

For banked RGB LED modules it is more tricky, because there is one
LED multicolor class device created for them. Probably to be correct
we would need make the 'reg' properties in the subnodes also arrays
reflecting iouts that will be governed by BANK_A_Color, BANK_B_Color,
and BANK_C_Color registers respectively. And DT parser in the driver
would need to enforce proper iout definition for the banked modules

E.g. the multi-led@3 node from the example should look like below:

             multi-led@3 {
                 #address-cells = <1>;
                 #size-cells = <0>;
                 reg = <0x3>, <0x4>, <0x5>;
                 color = <LED_COLOR_ID_RGB>;
                 function = LED_FUNCTION_STANDBY;

                 led@9 {
                     reg = <0x9>, <0xc>, <0xf>;
                     color = <LED_COLOR_ID_RED>;
                 };

                 led@a {
                     reg = <0xa>, <0xd>, <0x10>;
                     color = <LED_COLOR_ID_GREEN>;
                 };

                 led@b {
                     reg = <0xb>, <0xe>, <0x11>;
                     color = <LED_COLOR_ID_BLUE>;
                 };


[0] arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts

-- 
Best regards,
Jacek Anaszewski


