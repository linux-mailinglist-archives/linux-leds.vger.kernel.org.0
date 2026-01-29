Return-Path: <linux-leds+bounces-6785-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mAwMIgTzemmXAAIAu9opvQ
	(envelope-from <linux-leds+bounces-6785-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 29 Jan 2026 06:41:24 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3430AABFC7
	for <lists+linux-leds@lfdr.de>; Thu, 29 Jan 2026 06:41:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A6DFE30131E1
	for <lists+linux-leds@lfdr.de>; Thu, 29 Jan 2026 05:41:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1582C2E7F39;
	Thu, 29 Jan 2026 05:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bShjd3KD"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C452DCF4C
	for <linux-leds@vger.kernel.org>; Thu, 29 Jan 2026 05:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769665276; cv=none; b=gzq0lv2eQGzLU0G4JI8U6DAZcKv+FtObaowK9/wePaI8eeddHsyfm2ny3vooEHqs8U8KjEmRHH+s2nmCyj7bmr9n57WowtFLkM3/LJJsDUXRgnzZ89WLGbNJVPChegGeSJsoUHUFxIrew7ip/PB8Ax6XS1jr780mKe+KW9DZx8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769665276; c=relaxed/simple;
	bh=4wc/9uTW91spHNuobQOHMGnTUsN3Hz6YFyG5zPLrFXc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PxJnGC4G80pEntGEWAEWeLWoKvftdgjoWhhdGsfkItxjIYwQlnWgGo88IbW1QPVgIug01IFN6Ix7rvJGYzd4vhz0EziXl3O54w9gy2NaQW+xWG7bTnumH9KQHx5RZsRWbhY+FcgyMBtkvT9Is9SOLdA7OayuI9kKQEIRRHsneBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bShjd3KD; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a743050256so3209765ad.3
        for <linux-leds@vger.kernel.org>; Wed, 28 Jan 2026 21:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769665274; x=1770270074; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RW4PLSqQ5HtXaekEHkGIndldtB+Y8vvs+MZLayxhY8Y=;
        b=bShjd3KDCNmy8VYQ+NGR9Z2Uv5X9dl65k0tkgh5PHwNNrkpoVIIvYtzoHNBhvD3cNg
         MEGpssE6jxJNG5f15CuUokfPgFc4GQBoxp1yxpGDQ8l3RbvgUqlr07CFiotHhuGjucCU
         vWGo+WQQoTN2HESjW+WkRll/S1MTDI9/RtMBj2MudWhq+wzbUvLTdHRMxbv8FhxtA17x
         yqw8N0rmwcvo9zeGLC32NHJ3wYqJT7hmj+OB/sEDezlgzRmZmlYPLfDNd2lCUSoyGFMT
         2gMDHyZBBfZICBmgB3ua42zER0PlxMYEjigrJ7fRLv1Ca0ys6jVUepgRe3MXQmJ/5ukp
         LYEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769665274; x=1770270074;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RW4PLSqQ5HtXaekEHkGIndldtB+Y8vvs+MZLayxhY8Y=;
        b=shrURWsUCtOvArIbDknXXvbet/bKhmGBUdWD2WkHQcRWldx6pov6ojXRDprPdDImUo
         k+ctUK9N8KvLU35oBM7F4BLlyZWEshMmyP8m4Si5Y6NIUo6sZK/rLnHhBGqJalcumXRb
         JbBTuIC4ljqVoBjqlfx0M2/XpGHCf0X0NzgmKGKxAOaRe4CpUBVaX7HdvIHZtE9wGQFN
         C93BscPydRdnA01O0f1XUAjn/S2eIkKXnt2kqy9zlsUqcyEgiov1n/l6Hx+szdgZuVdr
         MoH88gvYC37wWwD5VPlzPxeJTEjVVjgVcKDt3Q6LDvdDjNn/bRt4wSsWSYN0BlJj9L70
         Y2gA==
X-Forwarded-Encrypted: i=1; AJvYcCVGdRpw91pc5oNFPRMUTlPy809Ya53j+A0f5iW1uwZeuxQmb4tBc3FKjByIj73P9dhGudkwcs5OiDeU@vger.kernel.org
X-Gm-Message-State: AOJu0YwJvyHExIbwtTCxdCcgnkTQZiuf3QVSYavq2M98KDOwzrP/scdI
	BnO+2oQlOoGiJtvFNdmZKEkHsEUrM/Ryg6dhUw5ngSSPfzHR8phsxnd2NeAq5Q==
X-Gm-Gg: AZuq6aKkWGCDNLhBpnKzfNr4JGQNvm4diep2Pwsz7SWSXzNqDjPtYr1++Ucr0xR6WUD
	e6M+aGI23/Wr09bbDKsLYpE4/sNVOye1YviGSOdpwS70HoG6I9bp7u+ZhVkg4AiUhk96MMsvPHp
	MDj4BB4lhCgSNjtAQmKqpYRF3PLvbFD7QHEvGUgLfzitAEZ0NGooSKxv46wXfkVkdNfIuV5dA6S
	Q2kc/MdhZMa5bEvdq3Xl/a12XRn5tRm7CUFO1UPpQtHwSbXG3nTvtNXKj2gIT9lsZlfnb4+n2Ma
	AlEcSLMb7lXpBHoVoT0tCBLI2pBhpHlOxGbYMnT3/tuFFv4jN/wQQeCirIo2DgT2ASfT1mH62BK
	+NTmvoJxB1ylEW+giQHWk129RdRxu3hKVblf/dBs9pTi45jUckYYC6M/yRAbLzth/d4FN4fC/mW
	EkCuupqlhrbmypgDT33HTlpSJgLAEqOMh8cg==
X-Received: by 2002:a17:903:2c6:b0:24b:270e:56c7 with SMTP id d9443c01a7336-2a870d7a907mr79567955ad.7.1769665273978;
        Wed, 28 Jan 2026 21:41:13 -0800 (PST)
Received: from [172.16.20.12] ([136.226.253.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b7f7caasm38795695ad.101.2026.01.28.21.41.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 21:41:13 -0800 (PST)
Message-ID: <304ef935-e82b-4556-be3c-6ec4f57cf68c@gmail.com>
Date: Thu, 29 Jan 2026 11:11:34 +0530
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: backlight: gpio-backlight: allow
 multiple GPIOs
To: Daniel Thompson <daniel@riscstar.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260120125036.2203995-1-tessolveupstream@gmail.com>
 <20260120125036.2203995-2-tessolveupstream@gmail.com>
 <3f3c47ea-1660-4bd4-ab89-3bdf58217995@kernel.org>
 <54d156ba-e177-4059-a808-2505983b4e2e@gmail.com>
 <500b603d-5abc-4c45-8d56-bbc88fc85b83@kernel.org>
 <aXnxGPNtk5BwoJOu@aspen.lan>
Content-Language: en-US
From: tessolveupstream@gmail.com
In-Reply-To: <aXnxGPNtk5BwoJOu@aspen.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6785-lists,linux-leds=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,gmx.de,lists.freedesktop.org,vger.kernel.org];
	FROM_NEQ_ENVFROM(0.00)[tessolveupstream@gmail.com,linux-leds@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_NO_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 3430AABFC7
X-Rspamd-Action: no action



On 28-01-2026 16:50, Daniel Thompson wrote:
> On Wed, Jan 28, 2026 at 11:11:33AM +0100, Krzysztof Kozlowski wrote:
>> On 23/01/2026 12:11, tessolveupstream@gmail.com wrote:
>>>
>>>
>>> On 20-01-2026 20:01, Krzysztof Kozlowski wrote:
>>>> On 20/01/2026 13:50, Sudarshan Shetty wrote:
>>>>> Update the gpio-backlight binding to support configurations that require
>>>>> more than one GPIO for enabling/disabling the backlight.
>>>>
>>>>
>>>> Why? Which devices need it? How a backlight would have three enable
>>>> GPIOs? I really do not believe, so you need to write proper hardware
>>>> justification.
>>>>
>>>
>>> To clarify our hardware setup:
>>> the panel requires one GPIO for the backlight enable signal, and it
>>> also has a PWM input. Since the QCS615 does not provide a PWM controller
>>> for this use case, the PWM input is connected to a GPIO that is driven
>>> high to provide a constant 100% duty cycle, as explained in the link
>>> below.
>>> https://lore.kernel.org/all/20251028061636.724667-1-tessolveupstream@gmail.com/T/#m93ca4e5c7bf055715ed13316d91f0cd544244cf5
>>
>> That's not an enable gpio, but PWM.
>>
>> You write bindings for this device, not for something else - like your
>> board.
> 
> Sudarshan: I believe at one point the intent was to model this hardware
> as a pwm-backlight (using enables GPIOs to drive the enable pin)
> attached to a pwm-gpio (to drive the PWM pin). Did this approach work?
> 

Yes, the original plan was to model this using pwm‑gpio, and that 
setup worked. But on the SOC there’s no actual PWM controller available 
for this path— the LED_PWM line is just tied to a GPIO that’s driven 
high (effectively a fixed 100% duty cycle). Because of that, describing 
it as a PWM in DT was flagged as incorrect.

As pointed out during the SoC DTS review, the correct path forward is 
to extend gpio‑backlight to handle multiple GPIOs, rather than 
representing them as multiple separate backlight devices.

> 
> Daniel.


