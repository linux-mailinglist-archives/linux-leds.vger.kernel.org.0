Return-Path: <linux-leds+bounces-4959-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8253AF5C17
	for <lists+linux-leds@lfdr.de>; Wed,  2 Jul 2025 17:03:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0A143ABFD3
	for <lists+linux-leds@lfdr.de>; Wed,  2 Jul 2025 15:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87D7B1531E3;
	Wed,  2 Jul 2025 15:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J6kx+VL8"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F322D0C7A;
	Wed,  2 Jul 2025 15:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751468538; cv=none; b=TstQq9SrrNIOoNzWR/+4yBP5kg74eg9eZROpW92Z1/hRu9FahJGx87pBMO5mT6i4X4tbJUHWwiEQqp62RryTJPW7zlOUfB5dDJdiKX9Qu3gS6mWrH/Mb4IwON4Qb25sX228aI2/9VaLiHJK6iAiKpJVmB9hQzjTgxiHKLqBpmTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751468538; c=relaxed/simple;
	bh=Ol5p1wzxA4/a7sOfr8ShQphBbuSDW4KTebkk5U0x49o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=amOv2dguOvztF9sSVFUTdffCaQMhRioSjcJ4irrDmZ3vEfrCA9oZ4hXzGfI5HlEXZLoj6GVlQZldW90xfg/R9za6ICALMbZ9ZBWSAbcC9b4tqEcCKSNUnqpMWcRnQK5VqM/3Sgx62kbt9exmZmi9tN2QE9ElgXeY+YAUteORMvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J6kx+VL8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C132EC4CEE7;
	Wed,  2 Jul 2025 15:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751468537;
	bh=Ol5p1wzxA4/a7sOfr8ShQphBbuSDW4KTebkk5U0x49o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=J6kx+VL8vrXI0hZoKqFO8JWMHZqVNvR4Vo1qPHtI1YTLMggNW8nIZdEivwAxE3QYg
	 YsNshKAiIdu1PlZM2Sy27GgEQYKnORN4inpTo81fKUI7gTaeK0CWWEJnd+jdDlVChH
	 yqtMmNvorl2n1lGms1ZP8FCTqrOFZtK6SvEAmLprORR8w+tPb1tA5Oo8fCwgYwDuIt
	 odJiVPts18It7AeQeiMUQrcuFqtZeMhrtZEfv1uNLDtcjcsTwmwBnbGPlShj0VFlIw
	 V7JOweaxlgLML7tY3Znx8O7Z4PxDNmVBiuFHXtrjPYB1ETz5Kb6jmw+RJIaJy85rlC
	 i/VkHkJcqKtOQ==
Message-ID: <daa343f9-b5eb-4a46-8c3a-f5c07603a9f1@kernel.org>
Date: Wed, 2 Jul 2025 17:02:11 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] dt-bindings: auxdisplay: add Titan Micro
 Electronics TM16XX
To: =?UTF-8?Q?Jean-Fran=C3=A7ois_Lessard?= <jefflessard3@gmail.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, devicetree@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Boris Gjenero <boris.gjenero@gmail.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Paolo Sabatino <paolo.sabatino@gmail.com>
References: <20250629130002.49842-1-jefflessard3@gmail.com>
 <20250629130002.49842-8-jefflessard3@gmail.com>
 <d3d8f72a-e4fe-4f85-8ead-6c104aa32893@kernel.org>
 <F09B92C5-9FF0-4818-9BF9-EFA4A456399C@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <F09B92C5-9FF0-4818-9BF9-EFA4A456399C@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/07/2025 05:22, Jean-François Lessard wrote:
> Le 30 juin 2025 02 h 19 min 11 s HAE, Krzysztof Kozlowski <krzk@kernel.org> a écrit :
>> On 29/06/2025 14:59, Jean-François Lessard wrote:
>>> Add documentation for Titanmec TM16XX and compatible LED display controllers.
>>>
>>> This patch is inspired by previous work from Andreas Färber and Heiner Kallweit.
>>
>> Please wrap commit message according to Linux coding style / submission
>> process (neither too early nor over the limit):
>> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597
>>
>> Please do not use "This commit/patch/change", but imperative mood. See
>> longer explanation here:
>> https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95
>>
>>>
>>> Co-developed-by: Andreas Färber <afaerber@suse.de>
>>> Co-developed-by: Heiner Kallweit <hkallweit1@gmail.com>
>>> Signed-off-by: Jean-François Lessard <jefflessard3@gmail.com>
>>> ---
>>>  .../bindings/auxdisplay/titanmec,tm16xx.yaml  | 210 ++++++++++++++++++
>>>  1 file changed, 210 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/auxdisplay/titanmec,tm16xx.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/auxdisplay/titanmec,tm16xx.yaml b/Documentation/devicetree/bindings/auxdisplay/titanmec,tm16xx.yaml
>>> new file mode 100644
>>> index 0000000000..65c43e3ba4
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/auxdisplay/titanmec,tm16xx.yaml
>>> @@ -0,0 +1,210 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/auxdisplay/titanmec,tm16xx.yaml#
>>
>> Why isn't this in leds directory? Everything below describes it as LED
>> controller.
>>
> 
> TM16XX controllers are commonly used as auxiliary display drivers in consumer Android-based TV boxes for driving 7-segment and icon displays, rather than for generic LEDs.
> 
> Previous attempts to place TM1628 drivers under LED subsystem were NAK’ed by LED maintainers, with Pavel Machek recommending drivers/auxdisplay instead (see https://lore.kernel.org/linux-devicetree/20200226130300.GB2800@duo.ucw.cz/).

OK, it's fine. If you want to avoid the same question at v3, v4 and v5,
please mention this in the patch changelog.

...

>>> +  compatible:
>>> +    enum:
>>> +      - titanmec,tm1618
>>> +      - titanmec,tm1620
>>> +      - titanmec,tm1628
>>> +      - titanmec,tm1650
>>> +      - fdhisi,fd620
>>> +      - fdhisi,fd628
>>> +      - fdhisi,fd650
>>> +      - fdhisi,fd6551
>>> +      - fdhisi,fd655
>>> +      - icore,aip650
>>> +      - icore,aip1618
>>> +      - icore,aip1628
>>> +      - princeton,pt6964
>>> +      - winrise,hbs658
>>
>> Several devices are compatible, so express it here and drop redundant
>> entries in the driver.
>>
> 
> I understand the concern. I would appreciate your guidance since these are not always direct aliases. E.g.:
> - tm1620 and fd620 varies on which bit is used for the 8th segment 
> - fd655 and fd650 have no titanmec counterpart
> - hbs658 is similar to tm1628, yet distinct

You did not get the point. I did not ask to make incompatible devices as
compatible. I asked to make compatible devices compatible.

Also wrap your emails to mailing list style. It's very difficult to read
and respond to them.


> 
> We could keep only known distinct implementations, that would yield to:
>       - titanmec,tm1618
>       - titanmec,tm1620
>       - titanmec,tm1628
>       - titanmec,tm1650
>       - fdhisi,fd620
>       - fdhisi,fd650
>       - fdhisi,fd6551
>       - fdhisi,fd655
>       - winrise,hbs658

I do not see compatibility expressed. You need front compatible and
fallback.

> 
> Which would be inconsistent for cases where vendors appear for another variant.
> e.g. fdhisi,fd628 now being aliased by titanmec,tm1628 while other fdhisi variants are listed.

I don't understand what that means. I don't understand what aliased
means. There is no such term in DT bindings.

> 
> Therefore I would suggest to keep fdhisi,fd628 even if implementation is the same as titanmec,tm1628.

I don't understand the problem.

> 
> icore and princeton could be dropped in favor of titanmec equivalents, at least for the variants I am aware of. Specific implementation for other variants can be let for future extension, if ever needed.

No clue what you are saying here.

> 
> How would you approach this?

You have compatible devices, yes?  If so, you drop irrelevant entries in
device ID tables and use fallbacks in the bindings, just like roughly
80% of devices in the bindings.

> 
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  titanmec,digits:
>>> +    description: |
>>> +      Array of grid (row) indexes corresponding to specific wiring of digits in the display matrix.
>>
>> What is wiring of digits? This and other descriptions don't tell me much.
>>
> 
> Controllers use a matrix to drive LEDs. Terminology used in datasheets is:
> - grids: matrix rows
> - segments: matrix columns
> 
> Board manufacturers wires display panels differently, including LEDs which are parts of 7-segments:
> - “digits” refers to the ordered list of GRID indices wired to the physical 7-segment digit displays (arranged right to left)
> - “segment-mapping” defines how each SEGMENT index within these grids maps to the standard 7-segment elements (a-g)
> 
>> Wrap according to Linux coding style, so at 80.
>>
>>> +      Defines which grid lines are connected to digit elements.
>>> +    $ref: /schemas/types.yaml#/definitions/uint8-array
>>> +    items:
>>> +      minimum: 0
>>> +      maximum: 7
>>> +    minItems: 1
>>> +    maxItems: 8
>>> +
>>> +  titanmec,segment-mapping:
>>> +    description: |
>>
>> Do not need '|' unless you need to preserve formatting.
>>
>>> +      Array of segment (column) indexes specifying the hardware layout mapping used for digit display.
>>> +      Each entry gives the segment index corresponding to a standard 7-segment element (a-g).
>>
>> Wrap according to Linux coding style, so at 80.
>>
>> This looks like duplicating the reg property.
>>
> 
> While related, this is not replicating the reg property of led child nodes.
> 
> Each (grid,segment) combination might have a distinct role:
> - part of a 7-segment: described using digits and segment-mapping properties
> - individual led: described using led child nodes
> 
>>
>>> +    $ref: /schemas/types.yaml#/definitions/uint8-array
>>> +    items:
>>> +      minimum: 0
>>> +      maximum: 7
>>> +    minItems: 7
>>> +    maxItems: 7
>>> +
>>> +  titanmec,transposed:
>>> +    description: |
>>> +      Optional flag indicating if grids and segments are swapped compared to standard matrix orientation.
>>> +      This accommodates devices where segments are wired to rows and grids to columns.
>>> +    $ref: /schemas/types.yaml#/definitions/flag
>>> +
>>> +  "#address-cells":
>>> +    const: 2
>>> +
>>> +  "#size-cells":
>>> +    const: 0
>>> +
>>> +patternProperties:
>>> +  "^led@[0-7],[0-7]$":
>>
>> Why do you have two addresses? It's not used in your example.
>>
> 
> First is for the grid index, second of for the segment index.

But it is not used. I really do not get why this is different than other
matrix LED controllers.

> 
>>> +    $ref: /schemas/leds/common.yaml#
>>> +    properties:
>>> +      reg:
>>> +        description: Grid (row) and segment (column) index in the matrix of this individual LED icon
>>
>> Missing constraints.
>>
>>> +    required:
>>> +      - reg
>>> +
> 
> Well noted.
> 
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - titanmec,digits
>>> +  - titanmec,segment-mapping
>>> +
>>> +additionalProperties: true
>>
>> No, this cannot be true. Look at any other binding, look at example-schema.
>>
> 
> I got misled by "spi-3wire" which is not defined in spi-peripheral-props.yaml but only as a child node property of spi-controller.yaml.
> 
> I wasn't sure how to implement this correctly. I have reviewed existing examples and will replace with:
> 
> if:
>   properties:
>     compatible:
>       contains:
>         enum:
>           - titanmec,tm1618
>           - titanmec,tm1620
>           - titanmec,tm1628
>           - fdhisi,fd620
>           - fdhisi,fd628
>           - winrise,hbs658
> then:
>   allOf:
>     - $ref: /schemas/spi/spi-peripheral-props.yaml#

Why is this conditional? Are these devices with entirely different
programming model? Then they usually should not be in the same binding,
although depends on differences.

>   properties:
>     spi-3wire: true
>   required:
>     - spi-3wire



Best regards,
Krzysztof

