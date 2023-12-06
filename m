Return-Path: <linux-leds+bounces-279-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E882B80779A
	for <lists+linux-leds@lfdr.de>; Wed,  6 Dec 2023 19:33:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 676A11F215D0
	for <lists+linux-leds@lfdr.de>; Wed,  6 Dec 2023 18:33:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71B7036D;
	Wed,  6 Dec 2023 18:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lfkqv2Mv"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13F97D5B;
	Wed,  6 Dec 2023 10:32:57 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a1915034144so6764866b.0;
        Wed, 06 Dec 2023 10:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701887575; x=1702492375; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EY2phHfdGNwUew4mOdxchO2z9hAaR+2z5ldHtMxR//U=;
        b=lfkqv2MvVBWe2aGwv69Bpx07DoLbQbALovlhOrdX/OJnJrY6CQACeir9Z8MCx87/Gq
         Wb1hdlgtKCAjLKhkJlBN4/vNDmvLU2JSts30SSZ00EA23Mn7T5EVDWSCnN29rqhlZZVo
         /B9N2F7VN6plBGn5V/qHDOcaoM7hBbvLY5Zs7AFRiurUv/Swtfd31lhVzfxr8EMsVhOA
         qncUFXbsE3uu85N2HFF62qcoezT1eu7s+cPBOTAC/gt9iAjhIKkyMr+y3M6s+oy+/yhy
         1ZaJDezYkmGqS1gzuYC9SPkbVIN1U0V5hhZDinryw6zBi3LHnb1lPa3R4D8hq762WU48
         dcXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701887575; x=1702492375;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EY2phHfdGNwUew4mOdxchO2z9hAaR+2z5ldHtMxR//U=;
        b=QRFiF/KV8Atk+zWnyBMHanmNVy1TmKLr55vvyH2LQ/rRhYn9/UwBAEVmahjQQOeFSo
         MG4yuaWDYw33ZxXxhyEQRE+ZUUVuaUKmV60y4erkdjt43CB9tzg9pF4Z9G1jYyHEDiH5
         F+0v+xhOJwcb8wF2Lgb84NRLLkqZxmXVn90i/laQAi48hID0QUmyPcZx7GPU6eQxQFav
         fw8vBc0+Dz1jaxGn89B/OMmYtWFWkCk9s7b8HF89N1CqnnqPnx5wy1F3WoksQpmj/gnJ
         HphkfJFK1mNUs4akH07cIhn2Mfbem5av/hYyg3D/5JE0olU6/Upby6Vb5ZzI4xUlxgPz
         7EaA==
X-Gm-Message-State: AOJu0Yz2i7AiuQdbxApUX5nejdrZMIGgKMKKIHjfcsCuHg/6tAgFGq8D
	8GZqBeTTdTfg/H2kk+YSScM=
X-Google-Smtp-Source: AGHT+IEK2AQJb6qThH6hHM7zY05+oPxZpZ8Ced+4z9vVwiWMgV1V/mtExGCbPhcznxpOE/j46Uxucg==
X-Received: by 2002:a17:906:74db:b0:a1d:bdc1:d063 with SMTP id z27-20020a17090674db00b00a1dbdc1d063mr827138ejl.107.1701887575154;
        Wed, 06 Dec 2023 10:32:55 -0800 (PST)
Received: from ?IPV6:2a01:c23:c486:e400:94df:9494:ce6f:5fa4? (dynamic-2a01-0c23-c486-e400-94df-9494-ce6f-5fa4.c23.pool.telefonica.de. [2a01:c23:c486:e400:94df:9494:ce6f:5fa4])
        by smtp.googlemail.com with ESMTPSA id br16-20020a170906d15000b00a1d3e9e8be7sm261839ejb.204.2023.12.06.10.32.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Dec 2023 10:32:54 -0800 (PST)
Message-ID: <fa5b40de-3e5c-4986-b533-e8417dd992d9@gmail.com>
Date: Wed, 6 Dec 2023 19:32:54 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] leds: trigger: netdev: skip setting baseline state in
 activate if hw-controlled
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 Christian Marangi <ansuelsmth@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
References: <49f1b91e-a637-4062-83c6-f851f7c80628@gmail.com>
 <a69ebe41-3f37-4988-a0bc-e53f79df27f2@lunn.ch>
 <CAFSsGVvBfvkotAd+p++bzca4Km8pHVzNJEGV6CAjYULVOWuD2Q@mail.gmail.com>
 <7535cb07-31ab-407d-9226-7b3f65050a65@lunn.ch>
 <c57558a4-9f3a-48fa-acb7-e3eb2349c666@gmail.com>
 <4c9396eb-f255-4277-8151-caa28c8ea0d3@lunn.ch>
 <9a8373c6-e916-4a98-858a-294e7bed9f24@gmail.com>
 <d42dd05d-fc76-4040-aa15-8bbc4aa535f3@gmail.com>
 <a53883cd-f843-45a5-82d3-483d80e9a806@lunn.ch>
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <a53883cd-f843-45a5-82d3-483d80e9a806@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.12.2023 18:45, Andrew Lunn wrote:
>>>> I actually think we need to define some best practices, ordered on
>>>> what the hardware can do.
>>>>
>>>> 1) With software control, set_brightness should do what you expect,
>>>> not return an error.
>>>>
>>>> 2) Without full software control, but there is a mechanism to report a
>>>> problem, like constant blinking, or off, do that, and return
>>>> -EOPNOTSUPP.
>>>>
>>>> 3) Really dumb hardware like this, set_brightness should be a NULL
>>>> pointer. The core returns -EOPNOTSUPP.
>>>>
>>>> The core should return this -EOPNOTSUPP to user space, but it should
>>>> accept the configuration change. So the user can put it into an
>>>> invalid state, in order to get to a valid state with further
>>>> configuration.
>>>>
>>> Sounds good to me. Let me come up with a RFC patch.
>>>
>>>> I don't see an easy way to let the user know what the valid states
>>>> are. We currently have a 10bit state. I don't think we can put all the
>>>> valid ones in a /sysfs file, especially when QCA8K pretty much
>>>> supports everything.
>>>>
>>>> 	 Andrew
>>>
>>> Heiner
>>
>> Patch is so simple that I send it this way. What do you think?
> 
> That is simpler than i expected.
> 
> But i think we need to document our expectations. What do we expect an
> LED driver to do when it cannot support software blinking. So please
> could you add a comment somewhere. Maybe extend the
> 
> /*
>  *Configurable sysfs attributes:
>  *
> 
> section?
> 
Yes, this is a good place IMO. I'll submit a patch including the functional
change and the extended comment.

> Thanks
> 	Andrew

Heiner

