Return-Path: <linux-leds+bounces-4210-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B02EA58E56
	for <lists+linux-leds@lfdr.de>; Mon, 10 Mar 2025 09:40:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F87C188616F
	for <lists+linux-leds@lfdr.de>; Mon, 10 Mar 2025 08:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4C492236ED;
	Mon, 10 Mar 2025 08:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="nRQIVFB/"
X-Original-To: linux-leds@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200B3F9CB;
	Mon, 10 Mar 2025 08:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741596010; cv=none; b=OlfSn0lqpEqbVpqC6BfTgw6K00fZ7XNRL9wAd1UASfotQ4ffxXNj8I1sjf+WKK7+8fp5utVqDBTVymrNf4ZorEnEyaBUN8hWa/WDrT2q2I60wnuZvUTHHk2qb79eeMZTmIzhGDF+u9CG0/SE3yREMNXVpJ2h5SYSlgoOMsR2OCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741596010; c=relaxed/simple;
	bh=3wxr9r1c2sMNiyyDmj1lzAXoDx6frVlS+T/98Uyt41o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ly0lDEy/nf4oo6SCFskJq+5ilasuM0yuPaHmvSwvUuluo5dUbCTbdx5MpTrHWBsHtbdBCSbTgAlqw2VjINp5qNI72YiuuOGvx8n9hERFQd+fEIhci9jjPwl7VDayftMvXmUcM2bAd9vgMgh0KNS59Wt3YippgSJE/sOuc+m5YPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=nRQIVFB/; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
	:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=XcSmxEDuu6+MebmvTMCyIi9Zy3QJJu+tJfjO1pOs2iU=; b=nRQIVFB/GiTBJ3B/be2kEmeT3d
	1DDe+IIcUPv7swizTIyOT2LJoP8LOTf891mGY6nmcjOuVZg0jJDjO3XNB2yOUHCAuoQNYIwCESQmG
	vajsCWiS15pdw04wa4EXrVwZ5/doKJDxj6yzCXd817cQ8sKeWOHCV/o2Ilh3z2ubDpws=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:62899 helo=[192.168.0.218])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1trYg8-0025rq-Gx; Mon, 10 Mar 2025 09:40:05 +0100
Message-ID: <d30e5994-9e7a-4f0c-96e6-14fe6f132f5f@emfend.at>
Date: Mon, 10 Mar 2025 09:40:02 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: leds: add Texas Instruments TPS6131x
 flash LED driver
To: Krzysztof Kozlowski <krzk@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, bsp-development.geo@leica-geosystems.com
References: <20250228-leds-tps6131x-v1-0-d1071d90f9ea@emfend.at>
 <20250228-leds-tps6131x-v1-1-d1071d90f9ea@emfend.at>
 <d5e73894-0e30-499f-a723-2ada72d3b864@kernel.org>
Content-Language: de-DE
From: Matthias Fend <matthias.fend@emfend.at>
In-Reply-To: <d5e73894-0e30-499f-a723-2ada72d3b864@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: 
X-Spam-Bar: 
X-Spam-Report: 

Hi Krzysztof,

thanks for your review.

Am 10.03.2025 um 08:49 schrieb Krzysztof Kozlowski:
> On 28/02/2025 11:31, Matthias Fend wrote:
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - ti,tps61310
>> +      - ti,tps61311
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  '#address-cells':
>> +    const: 1
>> +
>> +  '#size-cells':
>> +    const: 0
> 
> Why do you need these two?

As a template, I also used recently added bindings 
(silergy,sy7802.yaml). These entries come from there, but as I 
understand it, they are supposed to be removed, right?

> 
>> +
>> +  reset-gpios:
>> +    maxItems: 1
>> +    description: GPIO connected to NRESET pin
>> +
>> +  ti,valley-current-limit:
>> +    type: boolean
>> +    description:
>> +      Reduce the valley peak current limit from 1750mA to 1250mA (TPS61310) or
>> +      from 2480mA to 1800mA (TPS61311).
>> +
>> +  led:
> 
> Why do you have only one led node? Description says three: LED1-3,
> unless these are just sinks which always have to be connected to the
> same LED?

That is basically correct. If you just want to switch the 3 LEDs on or 
off, you could map that accordingly.
In detail, however, the 3 channels are not really independent of each 
other. All channels share, for example, the flash controller, the safety 
timers and the operating mode. In addition, two channels share the 
configuration registers. It is therefore not possible to use one channel 
as a flash and another as a normal LED.
For use as an LED flash controller (what the chip actually is), it 
therefore only makes sense if one or more channels are combined.

> 
>> +    type: object
>> +    $ref: common.yaml#
>> +    unevaluatedProperties: false
>> +
>> +    properties:
>> +      led-sources:
>> +        allOf:
> 
> Drop allOf
> 
>> +          - minItems: 1
>> +            maxItems: 3
>> +            items:
>> +              enum: [1, 2, 3]
>> +
>> +      led-max-microamp:
>> +        anyOf:
> 
> oneOf
> 
>> +          - minimum: 25000
>> +            maximum: 350000
>> +            multipleOf: 50000
>> +          - minimum: 25000
>> +            maximum: 525000
> 
> Why two different values?

The channels can in principle be configured in 25mA steps.
If only the two channels that share the configuration register are used, 
the step size doubles to 50mA. The maximum current values ​​for such a 
configuration are also different.
There are of course several other combinations of channels that would 
result in different maximum values, but since the step size is an 
important value for the API, I wanted to describe these two cases 
explicitly.

Best regards
  ~Matthias

> 
>> +            multipleOf: 25000
>> +
>> +      flash-max-microamp:
>> +        anyOf:
> 
> oneOf
> 
>> +          - minimum: 25000
>> +            maximum: 800000
>> +            multipleOf: 50000
>> +          - minimum: 25000
> 
> Same question
> 
>> +            maximum: 1500000
>> +            multipleOf: 25000
>> +
>> +      flash-max-timeout-us:
>> +        enum: [ 5300, 10700, 16000, 21300, 26600, 32000, 37300, 68200, 71500,
>> +                102200, 136300, 170400, 204500, 340800, 579300, 852000 ]
>> +
>> +    required:
>> +      - led-sources
>> +      - led-max-microamp
>> +      - flash-max-microamp
>> +      - flash-max-timeout-us
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - '#address-cells'
>> +  - '#size-cells'
> 
> Why?
> 
>> +  - led
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/leds/common.h>
>> +    #include <dt-bindings/gpio/gpio.h>
>> +
>> +    i2c {
>> +      #address-cells = <1>;
>> +      #size-cells = <0>;
>> +
>> +      led-controller@33 {
>> +        compatible = "ti,tps61310";
>> +        reg = <0x33>;
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        reset-gpios = <&gpio1 0 GPIO_ACTIVE_LOW>;
>> +
>> +        tps61310_flash: led {
> 
> Drop unused label
> 
> Best regards,
> Krzysztof


