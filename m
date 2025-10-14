Return-Path: <linux-leds+bounces-5779-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C02ECBD948A
	for <lists+linux-leds@lfdr.de>; Tue, 14 Oct 2025 14:13:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90B633A2574
	for <lists+linux-leds@lfdr.de>; Tue, 14 Oct 2025 12:12:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA12F312809;
	Tue, 14 Oct 2025 12:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nGoHvT9i"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FC3312822
	for <linux-leds@vger.kernel.org>; Tue, 14 Oct 2025 12:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760443926; cv=none; b=WE1MqQL/SrQJGysG5WYHS0Z76/Ez72CPhwhtdILINjuonzARDe2IO5x/zWXGNFaG5AYejqNy9QSY4NyePDMfGUxrsS65Modd0CFEh857f4fuOzzJhB7lE9vBtP7X5PTvJMxm2tA+w/MU/uViUrJgKy5DfEIF3DBVaSJN2BNiqyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760443926; c=relaxed/simple;
	bh=vv6SCZXUdjxEguAATuwGq3R/PnOOppUOkjoieyZK+QQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BJ+nizC0kOUDbdf7G/C3Xguy9ATpYiknw33gLJfKLBiwAwmFaS54TXnS5cl4zwKd7zuEV7qp+tR6gLucVE3INnxVsxvT2Kgu7h6b4n8l3dBOM0x6oLCg03/eGXs1v5NoYoIFEEQq34sbLPYVgoJltPiYvDTWdpj5d1eGGVfWT5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nGoHvT9i; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-36a6a397477so53568081fa.3
        for <linux-leds@vger.kernel.org>; Tue, 14 Oct 2025 05:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760443919; x=1761048719; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=19UY8Ondjgi9nEDc4X9WWhtcIr4QTybVkR2WGWv5OR0=;
        b=nGoHvT9imkjXZP7O1ZAgzncMDDkL/jFwW2yzfWA4NYcYhYRp71DfzoOyUsa0wn8SyE
         a58ks1YfrrUw3k+vP6yAWeeWlT16lPYRxRV14nQ50VIh1yJScO45ivD2fS/z02tv4XpW
         7VgKLU8p+c4+m9FUY9dbOE1nTZZNd+7Hc1bdMlBUyTi+C7Kb5J70X4T7Vfy0UI/EcXHg
         CA0mt+MBaB6zixHfnk6NEaxqsEkIkvs/y/g2xIYeJ2g3kVqwNZdWq+NS0U1hh91t0PDD
         23cFquPMzol1o/8a7CVYGbslIUM1elKwdlIhtL17DynnP7VC013CwwCHOZg3zrRYnXPw
         r5TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760443919; x=1761048719;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=19UY8Ondjgi9nEDc4X9WWhtcIr4QTybVkR2WGWv5OR0=;
        b=cfjp/82priWmefUyrP//S9sY4w8LrXT/+r3+IMk6rUfEhrUTUBYpVH9iUnjK9iiPeO
         hAgOL7DPaCQLYP0/mX6vj5yo3KhpX1Ooxuwd6G5kBCkMrmisptuI0uUhuzz5yyKwyw7n
         vkQxqyZNgkWvchVXwUDEQX9FVPXM/I+nqAcBX2r0WSCaePxqyEP6nzjv5dzlR5NpCPWv
         4LfSKnJziDpQsGeQB60j8AkYFQL3iLIREvUC8sUx0KDn/0UE69B4s5JxRe5vgy6wGXQc
         XyVkoGcUF2b9t3yaro5qovho2ygunV+2Vc50pP5N+KLxNFpeRCv/3G9N3Boho40RFwtV
         wkVg==
X-Forwarded-Encrypted: i=1; AJvYcCWWakulf5qAO6eg/eZv0DRAcfJTxGfkTsw0nknW+c3p3A43LEdHq+O9K2vGUHWJGtk+pEGunaaTczq8@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/+NqxWGzx8soUAza++MBWdIE+3B20accwF71slXnQhUoHljXT
	GsgW5EHcBdwSiRRIyGPGCtcAAZEgezr8nW5A/WZMvA9QJb194alJweBI
X-Gm-Gg: ASbGncvP4IVINpAkK6/77MW4F9HpNkOiv+Ac9ie/6fhY1XXPiUl7tGpDRRGjbCsBU5z
	rfCu5PzFkE+3cdthyR+4lf/6Hrl4hRoEY+XNrzt48Km8J6uk6GbS1GUpXN+p+F0FvbB1i9wJu6d
	z2rYRdAeocX5Ta9KiI7UyOzlv0u8jfliiF7IFkoYvdd7ryiKOBxBdkHvGwkVlav4ILUhhMcPUes
	cnnZo9z0VG/Vbm6LwpJ80mKSxgybSdfdnS7sh+4V0YZ3eJFjlK/P2ScxCDXmXLngJ3O8SU7IjOg
	zYhpQDDiQdJvWt+4bh5i1uVIhEperpBJjahHm1dBMe4bn9fSi406qrX1FVR8HOY6R9qqqI2I7i4
	ka5hbDtNjbDLiJJYjavHfHTCVd85zbEVIxE7eFJV/DffP41bhQ69NjbdcAb8YETu4RJZ8cTn6Db
	YgQw+uqfNPGq0hz0m1ioUMftzjNNM5Mhae5g==
X-Google-Smtp-Source: AGHT+IGW8zh9AOgyW7nkUtmNQqz6PJovnO6f6RGpy2I05ufukYy7iqHPI6QQtLY8F4LP884y1HCvzg==
X-Received: by 2002:a2e:be1d:0:b0:373:a537:6a00 with SMTP id 38308e7fff4ca-37609ea4554mr56777981fa.30.1760443919151;
        Tue, 14 Oct 2025 05:11:59 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3762ea3b31bsm39258931fa.47.2025.10.14.05.11.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 05:11:57 -0700 (PDT)
Message-ID: <cac4222e-1f66-40e1-abf8-7d4661d43bbf@gmail.com>
Date: Tue, 14 Oct 2025 15:11:56 +0300
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 04/13] dt-bindings: mfd: ROHM BD72720
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Andreas Kemnade <andreas@kemnade.info>,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <cover.1759824376.git.mazziesaccount@gmail.com>
 <fe1f4a0947c864496f4eeec8eef806afcf6094a4.1759824376.git.mazziesaccount@gmail.com>
 <CACRpkdZnoMvYBXN7b6dw+uPs=f1WXr9wX-0VF1c1qd-rq+17LQ@mail.gmail.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <CACRpkdZnoMvYBXN7b6dw+uPs=f1WXr9wX-0VF1c1qd-rq+17LQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 13/10/2025 15:58, Linus Walleij wrote:
> Hi Matti,
> 
> thanks for your patch!

Thank You for taking the time to review of this RFC!

> On Tue, Oct 7, 2025 at 10:33 AM Matti Vaittinen
> <mazziesaccount@gmail.com> wrote:
> 
>> +  rohm,pin-dvs0:
>> +    $ref: /schemas/types.yaml#/definitions/string
>> +    description:
>> +      BD72720 has 4 different OTP options to determine the use of dvs0-pin.
>> +      OTP0 - regulator RUN state control.
>> +      OTP1 - GPI.
>> +      OTP2 - GPO.
>> +      OTP3 - Power sequencer output.
>> +      This property specifies the use of the pin.
>> +    enum:
>> +      - dvs-input
>> +      - gpi
>> +      - gpo
>> +
>> +  rohm,pin-dvs1:
>> +    $ref: /schemas/types.yaml#/definitions/string
>> +    description:
>> +      see rohm,pin-dvs0
>> +    enum:
>> +      - dvs-input
>> +      - gpi
>> +      - gpo
>> +
>> +  rohm,pin-exten0:
>> +    $ref: /schemas/types.yaml#/definitions/string
>> +    description: BD72720 has an OTP option to use exten0-pin for different
>> +      purposes. Set this property accrdingly.
> 
> accordingly?
> 
>> +    const: gpo
>> +
>> +  rohm,pin-exten1:
>> +    $ref: /schemas/types.yaml#/definitions/string
>> +    description: BD72720 has an OTP option to use exten1-pin for different
>> +      purposes. Set this property accrdingly.
> 
> accordingly?
> 
>> +    const: gpo
>> +
>> +  rohm,pin-fault_b:
>> +    $ref: /schemas/types.yaml#/definitions/string
>> +    description: BD72720 has an OTP option to use fault_b-pin for different
>> +      purposes. Set this property accrdingly.
> 
> accordingly?

Gah. Well spotted, thanks!

> 
>> +    const: gpo
> 
> These are a bit idiomatic, not using the actual framework for such
> things (pin control) BUT: they are on the other hand crystal
> clear for an integrator working with this device tree, and only
> four pins so why over-engineer it. I am fine
> with them if the DT people are.

I kind of like to emphasize the fact that this is not really a pin-mux 
in a traditional sense. We can't change the routing after OTP is 
written. As such, it more resembles "wiring" of the signal inside the 
PMIC, and this property is not a control but tells us how the signal is 
wired. But yeah, let's see what others think of it.

Yours,
	-- Matti

