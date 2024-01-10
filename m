Return-Path: <linux-leds+bounces-570-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A752F829471
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jan 2024 08:40:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0D415B253B4
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jan 2024 07:40:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 507E43A8DF;
	Wed, 10 Jan 2024 07:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IselThKt"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB2A3A1B7
	for <linux-leds@vger.kernel.org>; Wed, 10 Jan 2024 07:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40e5521dab6so5630055e9.1
        for <linux-leds@vger.kernel.org>; Tue, 09 Jan 2024 23:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704872411; x=1705477211; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ctTZECAtqC1iPMbP63QXR7yjoHxoDS3skKp3Qzi73/o=;
        b=IselThKtGIAQtemI/zjjWehTG39xKMWtYOhrSHlwTBlFxkL2IgI74fn5JPipxjlxvR
         iF4z/tTVChFF7gms+m1cCWewNoqWCcnKexIVazElPxh5XwUd+y3gKULk27UYL2Y4Ul5g
         Cg7wETEz3BFdZZVfFN9E46zYgIQ3upJXnOIOPLyhC+yv+Qvo/XzALdE8C7H4fA8dmnYR
         ap2pYVwVchNvqgGRmPPmnJyn/bfDR+6cSymxOCjTfyWcrWIoQTa6GZvnrxEbmezJH1Iu
         GGJRrdY/o1E3K42p8kOgw/iMAGE0Ha+tG225FsaNxEcEr5ZXvLO2A0xGMnGuiA3CYqEa
         33UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704872411; x=1705477211;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ctTZECAtqC1iPMbP63QXR7yjoHxoDS3skKp3Qzi73/o=;
        b=r0Mr3TusGemXD1cVahN3QsyeHf8YSmaKXg81sMV7RrlgS25v6+KmojuZ491sRjy35g
         g7PGbnkOVtbT7wIPz9euFp2gUwkDpLpLFzU3lT1SrwEOrgujQhLeMaTE42LSwYgKWDMc
         6VqGrZ4jegs98lPM8Am186/C0xPjYoFB2VNmO8E1cSvU2lvyCNLWeorA19tXNCLUSVUm
         wT+/BvuFpcd+XqyWH/7n7Fz8zzXSeb01aF2gTNGdISbPMLtpcYVqS82NuBqq30hoG7ZZ
         NO7wBAUMu5Q15U6ncfooGEnU4ZkZdESqk8MVtq3ryFPYkM2e+ODfMxKwVAJl119BFGQD
         Nlow==
X-Gm-Message-State: AOJu0YzeEM3d+UvXB6naOqgZne7vFJA5bPp3OLvPTiV2qR53iDXjkdCk
	re34sKelR9tGhO0SrAhfw3ai49pet6sPDw==
X-Google-Smtp-Source: AGHT+IHi7aH6RPqOqnxOyQBMAWOT8awtGLxr4q1o168dRsKDM6Xmd/Lzlb9AMOsLl38dILVFbogsvA==
X-Received: by 2002:a05:600c:1393:b0:40e:4d7b:b2fb with SMTP id u19-20020a05600c139300b0040e4d7bb2fbmr297804wmf.59.1704872410688;
        Tue, 09 Jan 2024 23:40:10 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.112])
        by smtp.gmail.com with ESMTPSA id u18-20020a05600c139200b0040e4bcfd826sm1149322wmf.47.2024.01.09.23.40.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jan 2024 23:40:09 -0800 (PST)
Message-ID: <90ba555f-fec5-4fcf-8b70-5c50752e0ed1@linaro.org>
Date: Wed, 10 Jan 2024 08:40:07 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH dt-schema] schemas: chosen: Add OpenWrt LEDs properties
 for system states
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org, openwrt-devel@lists.openwrt.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20240109082312.9989-1-zajec5@gmail.com>
 <1b90c50c-0a09-4627-83cd-1794dae7ed9b@linaro.org>
 <69966efa-21ab-4a38-ad06-61e7e2e5b6d3@gmail.com>
 <987fe3e7-adc8-489f-867b-2d3aaa004d94@linaro.org>
 <62fdd030-7eb0-4658-969a-3bbddfa3334f@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <62fdd030-7eb0-4658-969a-3bbddfa3334f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/01/2024 22:48, Rafał Miłecki wrote:
>>
>> You can also define how pieces of hardware are wired together and create
>> entire system, e.g. connect one LED to disk activity.
>>
>> However what you are proposing here is to dynamically configure one,
>> given OS. I don't think it is suitable.
>>
>> The problem of OS to nicely figure out which LED to blink when, is not a
>> problem of Devicetree. It is a problem of OS and its configuration.
> 
> I'd say it's a thin line. Or just a grey idea as Geert said.
> 
> What is a LED "function" after all? How exactly are:
> LED_FUNCTION_STATUS
> LED_FUNCTION_ACTIVITY
> LED_FUNCTION_BOOT
> LED_FUNCTION_HEARTBEAT
> different from each other?
> 
> I can imagine OpenWrt seeing a different role for LED_FUNCTION_ACTIVITY
> or LED_FUNCTION_BOOT than other projects.

...which is not a problem. The meaning of these, except quite obvious
heartbeat, is defined by the OS or system configurators.

> 
> Proposed properties "openwrt,led-<foo>" don't exactly describe hardware
> per se but are still designed to deal with hardware differences.
> 
>  From a practical point of view it's much easier to put such OS
> configuration info in DT since it's closely related to LEDs defined
> there and it helps a lot with maintenance. If at some point we change

I agree, however this is an abuse of DT and therefore it is not an
argument to put something into DT. And this was told many, many times on
the lists: just because it is easier to instantiate each Linux struct
device from DT (with 1-1 mapping between devices and device nodes), does
not mean you should do it.

Same here. Just because it is easier for OpenWRT, does not mean this is
the solution.

This is the most frequent argument used in all of such DT abuses.
Another example: I want to boot some virtual machine and doing ACPI is
too difficult, so I will just use DT as way to pass from host to guest.
There were several examples of this. I understand why DT is the easiest
for the job...

> DT due to previous mistake (e.g. we fix LED color from amber to red)
> that would mean breaking user space of Linux system (changing LED name).
> Having DT binding for LEDs roles would prevent that.

I can argue that LEDs "label" can be un-deprecated and used for that
purpose as well. It will provide you stable sysfs entry, regardless of
the "color" property.

In your case you could also use to solve the actual problem: just label
each LED accordingly, e.g. "phase:boot", "phase:upgrade". It might be
not the best solution though, because we put one's OS expectations
inside DT device node...

> I was hoping that vendor prefixed "chosen" properties may somehow get
> accepted as a reasonable solution for dealing with hardware differences
> even if they don't strictly describe hardware itself.

It's actually not the worst idea considering above "OS expectations
inside DT device node" when using "label"...

> 
> Is there any other DT solution you think would be better and could be
> accepted?
> Given my hesitation about "function" meaning would something like
> openwrt,function = "(boot|failsafe|running|upgrade)"
> be any better?

Your problem is not really that specific to OpenWRT - several embedded
systems want to do the same, including Android. Some of the LEDs must be
active before the user-space comes up, so it is the job for kernel
and/or DT. Therefore let's go with generic solutions?

I still wonder why we cannot define new LED FUNCTION constants and use
them? You need them only for the pre-userspace phase, so do you expect
one LED would have two functions? But if you do not have user-space how
this aliases are being handled? By how?

If you have user-space, then it's not a job for kernel.

Best regards,
Krzysztof


