Return-Path: <linux-leds+bounces-4211-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D71E1A592F9
	for <lists+linux-leds@lfdr.de>; Mon, 10 Mar 2025 12:46:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 578B618870FD
	for <lists+linux-leds@lfdr.de>; Mon, 10 Mar 2025 11:46:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56B49221549;
	Mon, 10 Mar 2025 11:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z8a1yOY7"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7FF19F103;
	Mon, 10 Mar 2025 11:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741607161; cv=none; b=dqVnJNsLyXqf2wjW9V2sl7TbnNTZrICmXWRYNvyQ+egeOZaIj9H9YdrhvLtMpeitmHD0qglgn2tWjLviuqeRx6+zOyO0XwgnIiq9grkkab8wuGjriIkTx5or+sSSimFXlEJnB5d7PSyEDTA/SmEWqnFqBSrBV3wG7F3ipMEu6R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741607161; c=relaxed/simple;
	bh=ANGJH8Sj9o9T5oT7alkDK/1d7R9Ia3tZGYd5lKf8fqs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qt5eZgDjdXpczkYb18xMHa6SKFd8wu+l3RCU87D7NWulTcFk1S/JLR8X12skTbjd6wk1jFIMyw+HXkbwAjB+JmfGpRWgC0FejuTn0XzhzJ+RoifXHHDPxZckOvv1cAQStCH4+Dv3tHeYyzRv5s6LkL6LMHX4xl57b+K1Ah6r8+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z8a1yOY7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAEB8C4CEEA;
	Mon, 10 Mar 2025 11:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741607160;
	bh=ANGJH8Sj9o9T5oT7alkDK/1d7R9Ia3tZGYd5lKf8fqs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Z8a1yOY73nzdKnQqqd1RoncZdbvX0JV+OFmccCLWVdfwADrRgyVFtMHpwWddqaSNp
	 xd8CsXPfGcBed9yj+7BlKG1Cski0vLwZcAE8NoP10Lfz/RkB5BHkKszgqJoNbZ2N0p
	 kVwBzTPOgxSX58gjsPLIFjSTIUaU4JcEHjvcDVN5JYhtvDqIMng7LUagHA2wqTBPzK
	 ktT89I6GI5sMmzSfyadBpkc1lpzCz0ek3fX6/iOFLp+laY2yhfHTgyMhEiFfXtS/xS
	 83vQI4yhM0m4aafWM15625GRWp8cnXp9aQw2Otkd5UGPF9kwZ0bCR/L+AURGoy9ATq
	 JV8qC75kDgTuw==
Message-ID: <1091b3cc-d24f-4a45-ae9e-d439b94267da@kernel.org>
Date: Mon, 10 Mar 2025 12:45:52 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: leds: add Texas Instruments TPS6131x
 flash LED driver
To: Matthias Fend <matthias.fend@emfend.at>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, bsp-development.geo@leica-geosystems.com
References: <20250228-leds-tps6131x-v1-0-d1071d90f9ea@emfend.at>
 <20250228-leds-tps6131x-v1-1-d1071d90f9ea@emfend.at>
 <d5e73894-0e30-499f-a723-2ada72d3b864@kernel.org>
 <d30e5994-9e7a-4f0c-96e6-14fe6f132f5f@emfend.at>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <d30e5994-9e7a-4f0c-96e6-14fe6f132f5f@emfend.at>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/03/2025 09:40, Matthias Fend wrote:
> Hi Krzysztof,
> 
> thanks for your review.
> 
> Am 10.03.2025 um 08:49 schrieb Krzysztof Kozlowski:
>> On 28/02/2025 11:31, Matthias Fend wrote:
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - ti,tps61310
>>> +      - ti,tps61311
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  '#address-cells':
>>> +    const: 1
>>> +
>>> +  '#size-cells':
>>> +    const: 0
>>
>> Why do you need these two?
> 
> As a template, I also used recently added bindings 
> (silergy,sy7802.yaml). These entries come from there, but as I 
> understand it, they are supposed to be removed, right?

They make no sense based on the bindings.

> 
>>
>>> +
>>> +  reset-gpios:
>>> +    maxItems: 1
>>> +    description: GPIO connected to NRESET pin
>>> +
>>> +  ti,valley-current-limit:
>>> +    type: boolean
>>> +    description:
>>> +      Reduce the valley peak current limit from 1750mA to 1250mA (TPS61310) or
>>> +      from 2480mA to 1800mA (TPS61311).
>>> +
>>> +  led:
>>
>> Why do you have only one led node? Description says three: LED1-3,
>> unless these are just sinks which always have to be connected to the
>> same LED?
> 
> That is basically correct. If you just want to switch the 3 LEDs on or 
> off, you could map that accordingly.
> In detail, however, the 3 channels are not really independent of each 
> other. All channels share, for example, the flash controller, the safety 
> timers and the operating mode. In addition, two channels share the 
> configuration registers. It is therefore not possible to use one channel 
> as a flash and another as a normal LED.
> For use as an LED flash controller (what the chip actually is), it 
> therefore only makes sense if one or more channels are combined.

You define the binding which will be set in stone. This binding says it
is not possible to use two or three LEDs. I am fine with this, but be
aware of it and explain this in binding description.

> 
>>
>>> +    type: object
>>> +    $ref: common.yaml#
>>> +    unevaluatedProperties: false
>>> +
>>> +    properties:
>>> +      led-sources:
>>> +        allOf:
>>
>> Drop allOf
>>
>>> +          - minItems: 1
>>> +            maxItems: 3
>>> +            items:
>>> +              enum: [1, 2, 3]
>>> +
>>> +      led-max-microamp:
>>> +        anyOf:
>>
>> oneOf
>>
>>> +          - minimum: 25000
>>> +            maximum: 350000
>>> +            multipleOf: 50000
>>> +          - minimum: 25000
>>> +            maximum: 525000
>>
>> Why two different values?
> 
> The channels can in principle be configured in 25mA steps.
> If only the two channels that share the configuration register are used, 
> the step size doubles to 50mA. The maximum current values ​​for such a 
> configuration are also different.
> There are of course several other combinations of channels that would 
> result in different maximum values, but since the step size is an 
> important value for the API, I wanted to describe these two cases 
> explicitly.
> 
ok

Best regards,
Krzysztof

