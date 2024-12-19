Return-Path: <linux-leds+bounces-3677-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F19A29F7747
	for <lists+linux-leds@lfdr.de>; Thu, 19 Dec 2024 09:31:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1BE2189198E
	for <lists+linux-leds@lfdr.de>; Thu, 19 Dec 2024 08:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 064191FCCFF;
	Thu, 19 Dec 2024 08:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NWih302q"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4137F1FC7D9
	for <linux-leds@vger.kernel.org>; Thu, 19 Dec 2024 08:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734597053; cv=none; b=XB83lpMQNJcUsW9rlhsm+6+/77yhij5+64mjBrS2z7mYszMfbvGRBRC1109uTTJ3Dj/vJmp0QZ7rltBwtIP3qpuOqh2LOVeYdgi03k2HEZoVHjrsX/JDU0qTOzJZtv+p3s5ngEu9YQe21lHlioybxLKgPFJ8go1+I9rw1ac5N7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734597053; c=relaxed/simple;
	bh=REwzONvX04cc9q2w3uwEQOm9RB8wGS99KVCmm/VkhnA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IFYTHxhFcZ4wdVaWpEDPuf4/PRo7zqV3BZXwQpI/pta9mCxjD4TQ82ZFv82gIaiR6CiCivGQ2HDKIcLMOcI67Lv9U94odrB6pszJDx0J1Md5VKU9wHVDuuuc4fUm0xjsRRG3peV+jrhwQ/fW92LRp+lH+hbk8ce7h397blWObPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NWih302q; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4363298fff2so836335e9.3
        for <linux-leds@vger.kernel.org>; Thu, 19 Dec 2024 00:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734597049; x=1735201849; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=l+uSM+xraQFJKPvwNKIlhRiQvhBHi855B63H4zBgEl8=;
        b=NWih302qwGxccdka6dHFDDmbCzxUkiYC5F/qHZzogJWm25jW4WbKFCBYxGsd2qq3lP
         4ztNbHFB26KPhcZ+sLJfwbBYpFsdckmtONFKVa23UNjB4eelibnHUDJJ3zFian0Hp766
         PJEUorsHUUjPpwjr3sVK1GPtxE5X2CzPLiYJmcnl/vWcJnisInomF6SKb8Y5vOsacdFY
         UjoWn3SK7kPyRUyFHjOUpWqwa7o03Voi1+8Wbbgw6zf0iFkGnYBpYnOfo9hWZaguuE4h
         LiAjtIwSMEPibr3Knlf85BRRU3VKrUURPX5BFTH4SOVjzYBEKwqMGgehfht0bblSn9ft
         0CeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734597049; x=1735201849;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l+uSM+xraQFJKPvwNKIlhRiQvhBHi855B63H4zBgEl8=;
        b=f6JrHMRmai1kNPkf56abw1roeNYVPFOFMSkcw9QSoOIYWhmSrdQWMVbdsrFj//UCRg
         Sgm/X3zss5cVooNLUM6MAsi2giHCn1Wh9hly261E9UYmRQBDfhBhe9b3UkdNm6Ad7QVP
         vM1E0iRxRSwVTy723Pkic/lINw9vDl0BKa0uE+qF/DwanPAd5/DaNL+CLYQcnApzd+P3
         hYTh9eYkzRA2ehHnfFVrin6+FUxgxRco03rktkKjJpfRoRYIeOu+9+PTqDBh+zo7dD+1
         jBtOflwB/rFHs2hYe2k7RtezrnDkz0+0M6HjgZ5VWQ8imIdw3rfOJN1ycLgc5UNumPCX
         6wxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXImLbXzYKruQIOsc+Gg431dGkZ0mYlwLG8eFLYgp+4VyY7OzrhWO9y5p483neZJO4BMYcxXCIObH0s@vger.kernel.org
X-Gm-Message-State: AOJu0YwaLdSWGlaTvt24Ck5f0QJvfVcEp/czgNLYEBB+If2tYRnqoR0D
	PjwcmZqGGThrj9X6NRaOsooKW+wKHBv96+itgfeg7heBD0neMiL05TZ063uwmCI=
X-Gm-Gg: ASbGnctxqsT9Bk5hkX5gz91TUrY1bypxx9ATXn0MkAHj+IYKbLSzg3UyccM6dupfRDX
	k6ybpyBOdneONCjIH92GtO19196kTjk6e+YxjyLlrbnmHWB1cwOwTEEtHVBWYFjlqeS1ZGEAkeo
	UC70ZPip9bGHYvgHwBcPV351FX2skPF1483Y7a/OhnSfiZEvjway6MjoUQ24el1uIgFpMqE7hEn
	nKkUKv1n/06hsmKv8t0bqmYGSTe8N4etAKuwCuizeIaeS7+CoQOg6uTxLZpO5En4Mo7aGU00I1C
X-Google-Smtp-Source: AGHT+IF3mG0ZRwKIzWTRQ/V14kFIlwlSzN3oucieO5QdrsP0BWQ1YkUfM0D4zDjEpZ8zkz/A7ssL/Q==
X-Received: by 2002:a05:600c:4511:b0:436:1ada:944d with SMTP id 5b1f17b1804b1-436553f5667mr20576925e9.4.1734597049532;
        Thu, 19 Dec 2024 00:30:49 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e1cesm953429f8f.64.2024.12.19.00.30.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 00:30:48 -0800 (PST)
Message-ID: <e911eda1-fec3-4d2e-bb8b-655f6661825c@linaro.org>
Date: Thu, 19 Dec 2024 09:30:47 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/3] dt-bindings: leds: Add LED1202 LED Controller
To: Lee Jones <lee@kernel.org>
Cc: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>,
 Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20241218182001.41476-1-vicentiu.galanopulo@remote-tech.co.uk>
 <20241218182001.41476-3-vicentiu.galanopulo@remote-tech.co.uk>
 <c93c89c2-7188-4b17-ab3f-a3d2f1972a21@linaro.org>
 <20241219082840.GN2418536@google.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20241219082840.GN2418536@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/12/2024 09:28, Lee Jones wrote:
> On Thu, 19 Dec 2024, Krzysztof Kozlowski wrote:
> 
>> On 18/12/2024 19:19, Vicentiu Galanopulo wrote:
>>> The LED1202 is a 12-channel low quiescent current LED driver with:
>>>   * Supply range from 2.6 V to 5 V
>>>   * 20 mA current capability per channel
>>>   * 1.8 V compatible I2C control interface
>>>   * 8-bit analog dimming individual control
>>>   * 12-bit local PWM resolution
>>>   * 8 programmable patterns
>>>
>>> If the led node is present in the controller then the channel is
>>> set to active.
>>>
>>> Signed-off-by: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> ---
>> Stop sending the same 5 times to people.
> 
> Without additional context, I don't think this is a reasonable request.
> 
> If you're a maintainer of an affected subsystem and the set is at v10,
> you should expect to receive (and discard) the submission 10 times.

I received the same patch - v10 - like 5 or 6 times. I replied to the
last one, apparently all others were sent only to me.

> 
> I certainly don't start stripping out maintainers once they've provided
> their A-b or R-b, do you do that?


Best regards,
Krzysztof

