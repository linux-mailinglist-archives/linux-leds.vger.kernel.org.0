Return-Path: <linux-leds+bounces-6297-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9FCC7F4FB
	for <lists+linux-leds@lfdr.de>; Mon, 24 Nov 2025 09:02:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E720C4E1DA7
	for <lists+linux-leds@lfdr.de>; Mon, 24 Nov 2025 08:02:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D831F2586C8;
	Mon, 24 Nov 2025 08:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K8rk90lD"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D561ACEAF;
	Mon, 24 Nov 2025 08:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763971339; cv=none; b=VdEI1YksgQiBdi+1WJK1WAAhL2uPt1rF0EdzjGOwX2foAH7G9+R9I0OjeZTF5Wr6Fn1NlydID0I927F7Hm6BO7cv5X1oH+aMlwo5PLaKRDQYOuryxvfjghsOj+6L1pUKnclz1nvC3FcDjBvOWm1JD5y76+w+/BAhkk+bW3QutDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763971339; c=relaxed/simple;
	bh=afdsnRX4HBFUrqkr3Nb8P1K/tWzrPpFvDPjg8LCT/dU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=bFwlnVieGgX9lxGryINFOI0nNzkQqkyc9XVcAsAPHmFnhkLD7nS8C6jKWJ7Aj6u1OP9EFu/OLv5E9C1vtlB23Q7jA6jVyEZ0ybkb9BLwD2RqE/RXXBz7Ryf8gEGiGEFRPYz6+zV1F6AcHDkEUxXBh3jhJkv/7NNom/yf1CGdpCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K8rk90lD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 370AEC4CEF1;
	Mon, 24 Nov 2025 08:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763971339;
	bh=afdsnRX4HBFUrqkr3Nb8P1K/tWzrPpFvDPjg8LCT/dU=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=K8rk90lDVmouQkAu9oMo38pu1ANSPw5P++jMK7zdvhruFxU90mrkKVyquiDONxHrG
	 snJo6TXJacgJcFxeoer8UI9zZ9wdoyvc2yJdO2f8tXJzRWBhRzkdI2oBzMYdZYnlxb
	 6wPGc5I5arCOyrjmVIiy8OQk9VnqxXiSYBSz4+/IttWR+Q0J+hk4C/AqiIK23oUMZl
	 xMzDWrD+zDFXpCWSmqVMAP5Pjcqogk1jSZmxm+AJuH6h6ToxOF2kdGeQXjC+cb8W5q
	 yTGrNGRBWwXOirtOxrVxxWOzn5ZE59gtYnKU9b4GxjrnCYHzwgDRLjLMSRsRhcnYbm
	 KfzFCJK0rMhQA==
Message-ID: <74d6319c-535f-4409-a3c4-299ab946af54@kernel.org>
Date: Mon, 24 Nov 2025 09:02:14 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 1/3] dt-bindings: leds: add TI/National Semiconductor
 LP5812 LED Driver
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nam Tran <trannamatk@gmail.com>
Cc: lee@kernel.org, pavel@kernel.org, gregkh@linuxfoundation.org,
 rdunlap@infradead.org, christophe.jaillet@wanadoo.fr, krzk+dt@kernel.org,
 robh@kernel.org, conor+dt@kernel.org, corbet@lwn.net,
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org
References: <20251123191042.116917-1-trannamatk@gmail.com>
 <20251123191042.116917-2-trannamatk@gmail.com>
 <20251124-resolute-wrasse-of-wholeness-aed84d@kuoka>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20251124-resolute-wrasse-of-wholeness-aed84d@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/11/2025 08:57, Krzysztof Kozlowski wrote:
> On Mon, Nov 24, 2025 at 02:10:40AM +0700, Nam Tran wrote:
>> The LP5812 is a 4x3 RGB LED driver with an autonomous animation
>> engine and time-cross-multiplexing (TCM) support for up to 12 LEDs
>> or 4 RGB LEDs. It supports both analog (256 levels) and PWM (8-bit)
>> dimming, including exponential PWM for smooth brightness control.
>>
>> Signed-off-by: Nam Tran <trannamatk@gmail.com>
>> ---
>>  .../devicetree/bindings/leds/ti,lp5812.yaml   | 251 ++++++++++++++++++
>>  MAINTAINERS                                   |   6 +
>>  2 files changed, 257 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/leds/ti,lp5812.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/leds/ti,lp5812.yaml b/Documentation/devicetree/bindings/leds/ti,lp5812.yaml
>> new file mode 100644
>> index 000000000000..ea9d6ae92344
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/ti,lp5812.yaml
>> @@ -0,0 +1,251 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/leds/ti,lp5812.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: TI LP5812 4x3 Matrix RGB LED Driver with Autonomous Control
>> +
>> +maintainers:
>> +  - Nam Tran <trannamatk@gmail.com>
>> +
>> +description: |
>> +  The LP5812 is a 4x3 matrix RGB LED driver with I2C interface
>> +  and autonomous animation engine control.
>> +  For more product information please see the link below:
>> +  https://www.ti.com/product/LP5812#tech-docs
>> +
>> +properties:
>> +  compatible:
>> +    const: ti,lp5812
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  ti,scan-mode:
>> +    description: |
>> +      Selects the LED scan mode of the LP5812. The device supports
>> +      three modes:
>> +        - Direct-drive mode (by default if 'ti,scan-mode' is omitted)
>> +        drives up to 4 LEDs directly by internal current sinks (LED0-LED3).
>> +        - TCM-drive mode ("tcm:<n>:<order...>") drives up to 12 LEDs
>> +        (4 RGB) using 1-4 scan multiplexing. The <n> specifies the number
>> +        of scans (1-4), and <order...> defines the scan order of the outputs.
>> +        - Mix-drive mode ("mix:<n>:<direct>:<order...>") combines
>> +        direct-drive and TCM-drive outputs. The <n> specifies the number
>> +        of scans, <direct> selects the direct-drive outputs, and <order...>
>> +        defines the scan order.
>> +    $ref: /schemas/types.yaml#/definitions/string
>> +    pattern: '^(tcm|mix):[1-4](:[0-3]){1,4}$'
>> +
>> +  vcc-supply:
>> +    description: Regulator providing power to the 'VCC' pin.
>> +
>> +  "#address-cells":
>> +    const: 1
>> +
>> +  "#size-cells":
>> +    const: 0
>> +
>> +patternProperties:
>> +  "^led@[0-3]$":
>> +    type: object
>> +    $ref: common.yaml#
>> +    unevaluatedProperties: false
>> +
>> +    properties:
>> +      reg:
>> +        minimum: 0
>> +        maximum: 3
>> +
>> +    required:
>> +      - reg
>> +      - label
> 
> No, why? That's legacy property and color and function are preferred.
> 
>> +
>> +  "^multi-led@[4-7]$":
>> +    type: object
>> +    $ref: leds-class-multicolor.yaml#
>> +    unevaluatedProperties: false
>> +
>> +    properties:
>> +      reg:
>> +        minimum: 4
>> +        maximum: 7
>> +
>> +      "#address-cells":
>> +        const: 1
>> +
>> +      "#size-cells":
>> +        const: 0
>> +
>> +    patternProperties:
>> +      "^led@[4-9a-f]$":
>> +        type: object
>> +        $ref: common.yaml#
>> +        unevaluatedProperties: false
>> +
>> +        properties:
>> +          reg:
>> +            minimum: 4
>> +            maximum: 15
>> +
>> +        required:
>> +          - reg
>> +
>> +    required:
>> +      - reg
>> +      - label
> 
> Why? Same problems.
> 
> Please stop making continuous changes to the binding.
> 
> 
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/leds/common.h>
>> +
>> +    i2c {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        led-controller@1b {
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +            compatible = "ti,lp5812";
>> +            reg = <0x1b>;
>> +            ti,scan-mode = "tcm:4:0:1:2:3";
>> +            vcc-supply = <&vdd_3v3_reg>;
>> +
>> +            led@0 {
>> +                reg = <0x0>;
>> +                label = "LED0";
>> +                led-max-microamp = <25500>;
>> +            };
>> +
>> +            led@1 {
>> +                reg = <0x1>;
>> +                label = "LED1";
> 
> Completely useless label... You require labels, so people need to write
> something but since they do not know what to write they call LED 1 a
> LED1. This is just not helping.
> 
> Use color and function properties. Same everywhere else.
>

And now I went to older versions and I see they were correct - you had
color! You replace correct code with wrong one and drop review. This
patchset is not really improving.

BTW, You actually received review also at v6, so this was reviewed 3 or
more times. Way too many times.

Best regards,
Krzysztof

