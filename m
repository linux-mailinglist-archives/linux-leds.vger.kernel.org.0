Return-Path: <linux-leds+bounces-6544-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C41ACFD495
	for <lists+linux-leds@lfdr.de>; Wed, 07 Jan 2026 11:57:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 10CDB30019C9
	for <lists+linux-leds@lfdr.de>; Wed,  7 Jan 2026 10:57:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DD35242D95;
	Wed,  7 Jan 2026 10:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EmeMcL22"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1172221257A;
	Wed,  7 Jan 2026 10:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767783464; cv=none; b=a3fGQZ9GIsBTi1XAombe1ij3NoV2Td0KvFioIZ7Tv5wf8ly/8lcr8pHuWX2JxiDJITX1b9aiPrHVZo14UbGzpZ0RXF+TFG42RokuffycXwiP+xHLpeCShMgwVlIB2l1l/3U+Os1vU0rCm5x4tAytzcVBBq8D3VR/W7pvOSp3g5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767783464; c=relaxed/simple;
	bh=YkGPm2ALOTysYbdlwXEiQWln+LwZA8h1FVS3ZhZ7sts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vm7EjYOn3N6queNLm2W+Q+1ayLsLTQE3Bk86Ag3LjCBUphG8dkbJPGSuGPHFEYROMRlM4d2YZU2UMWBRIfRlO+c3AyX2VYBc5GqHVZ0M74mq9S3QhdAcnV5QPBz8g2Uk9KPXvyoNMU1nTUNZJCBzfi2NQRG9Z2Eiwt2cK3VG8ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EmeMcL22; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AEE5C4CEF7;
	Wed,  7 Jan 2026 10:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767783463;
	bh=YkGPm2ALOTysYbdlwXEiQWln+LwZA8h1FVS3ZhZ7sts=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EmeMcL229qIuD5QzFN58ITBIhN7qo7WTMu2AN5PaCzBz3pUwFcCyKuVIUA291hbXb
	 iuThPAHveu0I+4wfXv9HYZqPmNhatDxIVGY7INdTr8LJz0y7XaQHnXJHsyXi2dzw1k
	 JeDfJDZQ0WR3rx2csKZD3U5plhATlVfhX2GplEUaDQ19pfiZHmItArUpNNc8Fn9u9l
	 sfiBsKEfbR/6Lu8em7qRqr41OFPftpYVcYYCTQtzTy+2uNny7QVYq1NxSqaEGvJXf9
	 vIN7yWB/eehTHeTEtMeO4/gKPcQ7ppFXEgf6dAnKwVa2C5djWgOh8hjXzPJ2z37k/Y
	 O1B0nHLTkgLkA==
Message-ID: <2d1893a8-81eb-4d7e-81df-060722c10c7d@kernel.org>
Date: Wed, 7 Jan 2026 11:57:39 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: leds: Document LTC3220 18 channel LED
 Driver
To: "Escala, Edelweise" <Edelweise.Escala@analog.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260106-ltc3220-driver-v1-0-73601d6f1649@analog.com>
 <20260106-ltc3220-driver-v1-1-73601d6f1649@analog.com>
 <20260106-crystal-ambrosial-wildebeest-0e35d6@quoll>
 <PH0PR03MB6525F2AB63E24564356ADE51ED84A@PH0PR03MB6525.namprd03.prod.outlook.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <PH0PR03MB6525F2AB63E24564356ADE51ED84A@PH0PR03MB6525.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/01/2026 10:52, Escala, Edelweise wrote:
>>
>>> +
>>> +  adi,force-cpo-level:
>>> +    $ref: /schemas/types.yaml#/definitions/string
>>> +    description: Forces the Charge Pump Output to a specified multiplier.
>>> +    enum:
>>> +      - "0" # Auto(default) - Automatically selects optimal charge pump mode
>>> +      - "1.5"
>>> +      - "2"
>>> +      - "1"
>>
>> Numbers are not a string, so choose appropriate number format. Also, oddly
>> sorted. I don't understand what this property is for so not sure what to
>> recommend.
> 
> It is arranged this way to match the value for the register.

Makes no sense. The order here does not matter for driver and registers
at all.

> I plan to keep it as string and just do 
> enum:
> - auto
> - 1.5x
> - 2x
> - 1x

Still wrongly ordered and still I do not understand the purpose of this
property.

Datasheet mentions some sort of impedance. Impedance has units (see
property units in dtschema), but you call it "level". Maybe you want to
achieve some specific current on output? But for current we already have
LED related properties.

Also, "auto" is redundant unless lack of the property has a meaning?

Why exactly this varies between boards?

> 
>>
>>> +    default: "0"
>>> +
>>> +  adi,quick-write:
>>> +    type: boolean
>>> +    description: If present, LED 1 output becomes a master control that
>>> +      simultaneously updates all 18 LED outputs using the hardware's quick-
>> write
>>> +      mode. When enabled, led@1 must be defined in the device tree to
>> provide
>>> +      the control interface, even if no physical LED is connected to the D1
>>> +      output pin. When disabled or not present, LED 1 operates as a normal
>>> +      independent LED output.
>>
>> If there is no led@1 physically, you cannot add it to the DT. It seems you
>> described some sort of driver behavior, instead of hardware.
>>
> 
> This is also a hardware feature, when enabled a write to the LED 1
> output register simultaneously updates all 18 LED output registers
> to the same value.

You still cannot add fake nodes to DT. Fake means there is no actual LED.

Best regards,
Krzysztof

