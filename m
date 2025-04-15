Return-Path: <linux-leds+bounces-4485-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B714A89917
	for <lists+linux-leds@lfdr.de>; Tue, 15 Apr 2025 12:00:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 284C2166C16
	for <lists+linux-leds@lfdr.de>; Tue, 15 Apr 2025 10:00:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 254A028B519;
	Tue, 15 Apr 2025 09:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NyDm4/is"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E870A28A1FF;
	Tue, 15 Apr 2025 09:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744711178; cv=none; b=PJYzoWQLgumv07dfqo2dkZpLf9AR9WKSFvW9lhSbChKhQ6fltVE/ihKBVo0PUdmkZ4MZjroboRCFZHppZ9D8EqqgFcrZDm1eiwykgOwOSOE/p9uJUjVGo3WWH7j3wVbw+HMAu6QU2PLvZl8x88FT4xG185ik1JZ1USCclOnWU9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744711178; c=relaxed/simple;
	bh=euHgQKWy7m/Bwe0bvPTHrnQTC1b1TT8VNBAji6xaiPM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AMUruf435lohmSkf/nU6EZOzJMRFfEP2Knmj0q1ynu/Sez8YxxvNeUAnC/A6ZpyZ6pyUPzFcMQ4jh11ExWuM7RFW2QpWiq74bFdpx8ogUTPkJG3piMtWYGzjeBBJcFPT/o7Iwu/G112HAkZPR2MrOUW0sXvrgChvAn+aLhiPsEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NyDm4/is; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F03AC4CEDD;
	Tue, 15 Apr 2025 09:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744711177;
	bh=euHgQKWy7m/Bwe0bvPTHrnQTC1b1TT8VNBAji6xaiPM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NyDm4/isljwyyO/P0Yc4cnqWwVEkF42h89X/7qR+ZVuZBmsKwXZ8DtneiDhQdeB7P
	 vg4Nu5vk1A6MEuf0iVGcoRTgWZB8nuBBs2FN1mzflLL/8Z87zkswv+3QQxOQ2uyj2A
	 bE9pDM3D+s7PLGaR6Lzc+j9V4u9Wc0r8iZEoumQY49IRyJuxqmdHitZMIWvhYmjB/o
	 n2W7QGmDYZkpqsdNvNXx0RehEC9/ihOE3wbM84RuCTP7i62GFDXYLCZaFcApXxliIF
	 Kp6LKtunSM+l2H1OTFrYdM/27lw5h69Mi+vTVvLFHI9YznwBnYZuK6Y/tXJwlmbhcZ
	 d9tmEgmoOwGKQ==
Message-ID: <a22eff98-86db-47db-a310-5d00dcba14fa@kernel.org>
Date: Tue, 15 Apr 2025 11:59:33 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] dt-bindings: leds: add TI/National Semiconductor
 LP5812 LED Driver
To: Nam Tran <trannamatk@gmail.com>, krzk+dt@kernel.org
Cc: pavel@kernel.org, lee@kernel.org, robh@kernel.org, conor+dt@kernel.org,
 corbet@lwn.net, devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <2badc360-9bfa-400a-acca-ab82f8cc5a95@kernel.org>
 <20250415095358.8044-1-trannamatk@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250415095358.8044-1-trannamatk@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/04/2025 11:53, Nam Tran wrote:
> On Mon, 14 Apr 2025, Krzysztof Kozlowski wrote:
> 
>> On 14/04/2025 16:57, Nam Tran wrote:
>>> +
>>> +description: |
>>> +  The LP5812 is an I2C LED Driver that can support LED matrix 4x3.
>>> +  For more product information please see the link below:
>>> +  https://www.ti.com/product/LP5812#tech-docs
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: ti,lp5812
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  "#address-cells":
>>> +    const: 1
>>> +
>>> +  "#size-cells":
>>> +    const: 0
>>
>> No need for supply?
> 
> Since the hardware uses an external power supply,
> we decide not to include the supply property in the binding.

So there is power supply? If so, must be in the binding. Bindings
describe given hardware (LP5812), not your particular board/setup.

> 
>>> +
>>> +patternProperties:
>>> +  "^led@[0-9a-b]$":
>>> +    type: object
>>> +    $ref: common.yaml#
>>> +    unevaluatedProperties: false
>>> +
>>> +    properties:
>>> +      reg:
>>> +        minimum: 0
>>> +        maximum: 0xb
>>> +
>>> +      chan-name:
>>> +        $ref: /schemas/types.yaml#/definitions/string
>>> +        description: LED channel name
>>
>> My comment stay valid. I don't think LEDs have channels, datasheet also
>> has nothing about channels, so again - use existing properties. Or
>> better drop it - I don't see any point in the name. The reg already
>> defines it.
> 
> The channel was named for the output channel to each LED, not the LED channels.

I don't understand what you want to say. Please explain why existing
label property is not correct here.

> They are not required properties because we can control entirely the LEDs of LP5812 through the indexes (regs property),

I did not ask about this.

> but the person who wants to develop LP5812's matrix-related features can use the "channels" for easy mapping.

easy mapping of what? Please show me the usage.

> 
>>
>> However after dropping this, your example has nodes with only reg -
>> what's the point of them? Why no properties from common.yaml are
>> applicable? If they are not applicable, then the entire subnode should
>> be dropped - you don't need them to describe the hardware.
> 
> Actually, the "color" property can be applied, but the LP5812 is a matrix LED,
> so specifying a particular LED color is not necessary when developing LP5812 features.

This does not help me much and based on this I see no points in
describing individual LEDs, because the only missing information is
number of them but even that is fixed for given device, isn't it?

Best regards,
Krzysztof

