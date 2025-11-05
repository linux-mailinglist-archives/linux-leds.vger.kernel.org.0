Return-Path: <linux-leds+bounces-6013-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6A5C356C9
	for <lists+linux-leds@lfdr.de>; Wed, 05 Nov 2025 12:44:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADE983A4123
	for <lists+linux-leds@lfdr.de>; Wed,  5 Nov 2025 11:40:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3C2E30F7F8;
	Wed,  5 Nov 2025 11:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CJSB51PU"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7880F31196F
	for <linux-leds@vger.kernel.org>; Wed,  5 Nov 2025 11:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762342791; cv=none; b=sxbgUfwd+Uec8zl8/QH/bU3XLTkxiXHYFNUIqkkl0Z7W/DGTC4kZeQn8pTkwPc1Ni79DCD51Rn4wBiGWNXryQWA5oevQrDeCnOSb7XH7I4Fw8On9QhPXgNBP+buOcKM/H+TPnwL1BFyAi21gNgeglLOwKqfreZz2I8vE9rWQVBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762342791; c=relaxed/simple;
	bh=XJnQ8QAutR/Qjzuilm6RbMyIh+omr6OWVKRLZO5Bnf0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nF6FRBjAkh2XJJ8nh7aNjp40ueprsy65i7v62F5P/BFSTPo7bsw02S6XtPj+lcaXC0LmuJ0svtNdtTNJLc7sdqOdOIRlVGoSycY+2EZh4LPiOHKt98YBIbMcV/1xQ/Y5RjAJ6f79+pOsqfafAEkIqGvYI0LVwjXKHsixl1NCWdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CJSB51PU; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-592ee9a16adso8796745e87.0
        for <linux-leds@vger.kernel.org>; Wed, 05 Nov 2025 03:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762342788; x=1762947588; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XFKcDBz895P+pKkilzGMv1j9zQS86el4sifmVfoozzk=;
        b=CJSB51PUDDIAmXELEChvDo2y27eoe70faA3tbu/iPSRxcznGwDxA4bNg143HX2AY7h
         6OGa2qZJ2ps5r2LR1uY1uPFiEIH8H8zrwlbmo85b25eyoE02XpPno5Hq12P7LuhwCk1O
         AzhOd7dtEH/zdfXb7nbzaeQzyYAaewr51fx1+H5AjY8W3Kl0BOuLD5SXeR+Vmn2DTv18
         xNqJivuHGk0slJeCzmZ6txTYQKgfh9wlTNrQiIKp6MkBqkBELvDcax2vGsyZL/Yhiyyo
         0UwyKme0BrLCsAaEIC4WGuYf9doozejNTg8izdiv+LZvpkWMA7oSxGmH3YAIz9thlykp
         fWDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762342788; x=1762947588;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XFKcDBz895P+pKkilzGMv1j9zQS86el4sifmVfoozzk=;
        b=BOf3G0opCzOnDVZVjwVODqDvvMCkyvJKHfvfypUTFKkcgiFhfiTAk7e9S5BwGCf0gk
         t/wIydo81CcaFV6VpC3OVgZu/SlfwF8R23ytyKWjYg/C2n+SzIXSICxiU0qF3ppqN9Th
         tzelNgn9RyX6XosEtGds9DlftT+EhtEJGjStf/04gBYAtZk0M2TBm6kJ4FI/9llfgVUd
         pP15wk6jU5MJkUbWTu31v0EDSkbk4WA9+0W50i1HEQSMFg18FfYg18LOlJi2b6V0lUQV
         n2BpYY9fxXnq3KZIBN/YndNbd81DY/fMVtXqaScueOur6ti65O1O+sm670uhBRKFISJf
         Kw9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVj+dCaMd3C23SZbsUSTAndyYrzBWqTgYtFHlVGpM0AQP//WIVzLfCTEpHIVefA1ioAoNs42PEEip3s@vger.kernel.org
X-Gm-Message-State: AOJu0YzpDCgYyY0lOOt1Cs+QK2aisa9BaPJH7qDE4IcfSuTOQkTyY73z
	228s2fPDjBh/I8pKQehR9B/slmgmuEJ//+tz0c6fxV3n1hYpd5SPZxrN
X-Gm-Gg: ASbGncv1lEWpgkegxTo8z8YP0Sw7MkUjrP8OneO+1sMU9TsocK94WgoWjUB6HIvQM42
	JvikKwz3IASKf+EQEmqhaq0luLS2mCsYGn22y52Icbdwq5lG1FAPCGwKteQg/gEhdkH4bCJIc7Z
	T2A1skwYZ+9eXtJUfEqIdy5oKn/Yj3xbM9BmVfNGjo6GAxCy9CGKRk0IMT8FTfnWVZadMAOhmuN
	pHUUnqJqx56J9KFP/a1SGeHFcreMDE1+xVCneNLMQv64sTSiog3d/sRFjkAMUD1VLJYjqfIjcwS
	PiTByaC4woVWCL0PLaB1qYplttkGSfOwcfppp/Tx2iqOgqJwc3w0vM1xreKmem1X4zE3OhT2ZxJ
	I5ChP0+pkh8eUDQDfAlsSbWMGg7zcoR4cnuNV2Zwkrm0cErIuayLn/bjK2Byl78JLJZh8nQXiJj
	B+2je7W2uNlIUu5F5foQt2qdsD8Ca69aps8P+WMnVpfay+iSQ/4Wi7Hs45aA==
X-Google-Smtp-Source: AGHT+IGG31UsLd4o1FDm3BbiPL0QtqwK8nPiQHx1dRUKJ4gb8AV+HvnhJfY8a3mxdgTF9YlyblMwPQ==
X-Received: by 2002:a05:6512:1395:b0:592:f8aa:c06 with SMTP id 2adb3069b0e04-5943d7f3f74mr1019404e87.57.1762342787278;
        Wed, 05 Nov 2025 03:39:47 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5943443992fsm1652172e87.60.2025.11.05.03.39.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 03:39:46 -0800 (PST)
Message-ID: <aa55cba7-1f7a-4c44-a101-cb991387fa55@gmail.com>
Date: Wed, 5 Nov 2025 13:39:45 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/16] dt-bindings: mfd: ROHM BD72720
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Matti Vaittinen <matti.vaittinen@linux.dev>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-clk@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Sebastian Reichel <sre@kernel.org>, Lee Jones <lee@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-rtc@vger.kernel.org,
 linux-gpio@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 devicetree@vger.kernel.org,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Mark Brown <broonie@kernel.org>,
 Andreas Kemnade <andreas@kemnade.info>, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <cover.1762327887.git.mazziesaccount@gmail.com>
 <4c7ea0c83f4bb4af65439a9b8951d50ee705d22c.1762327887.git.mazziesaccount@gmail.com>
 <176233321210.143104.455177775703669783.robh@kernel.org>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <176233321210.143104.455177775703669783.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/11/2025 11:00, Rob Herring (Arm) wrote:
> 
> On Wed, 05 Nov 2025 09:37:05 +0200, Matti Vaittinen wrote:
>> From: Matti Vaittinen <mazziesaccount@gmail.com>
>>
>> The ROHM BD72720 is a power management IC integrating regulators, GPIOs,
>> charger, LEDs, RTC and a clock gate.
>>
>> Add dt-binding doc for ROHM BD72720.
>>
>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>>
>> ---
>> Revision history:
>>   v2 => v3:
>>   - Styling
>>   - Document all pin functions
>>   - use pattern-properties
>>   - re-use existing Rsense binding
>>   - correct the example
>>
>>   RFCv1 => v2:
>>   - Typofixes
>> ---
>>   .../bindings/mfd/rohm,bd72720-pmic.yaml       | 273 ++++++++++++++++++
>>   1 file changed, 273 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd72720-pmic.yaml
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/rohm,bd72720-pmic.yaml: Unresolvable reference: /schemas/regulator/rohm,bd77270-regulator.yaml

Not sure how this slipped through. I'll fix this in next version. Thanks.

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

