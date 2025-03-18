Return-Path: <linux-leds+bounces-4320-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F18A67C77
	for <lists+linux-leds@lfdr.de>; Tue, 18 Mar 2025 20:00:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF8948824D3
	for <lists+linux-leds@lfdr.de>; Tue, 18 Mar 2025 19:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDD83213247;
	Tue, 18 Mar 2025 18:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XLMVT0gX"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC65213237;
	Tue, 18 Mar 2025 18:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742324397; cv=none; b=flnBuO4tdYeDOtIEqt814QpZ3UZhFkphhYAQB6njJ162ZWFWQ8bziPXQvjkuyecu0c7UBUtTd+n0/GWungfTPhYQdAukAV4QtvjyAzlyDpa2EiRg7hVBnxzsTFy6QLxazvDwM4nfG2MrsFzo7c/VU/7JOjJdlkniJvTLS+SG4LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742324397; c=relaxed/simple;
	bh=nXYHXaHdP13wJXxKaULdVXMLILj+JBOGO1TIg3SE4wI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tS/Wrao7EN6GcqxNSoRmdy62vU0PQOJBnP4lzF3JKPwkK5ndeQigoFSlhIhaKXTV45nhbt0eBLnvItoi4lv92SaV/UGSMdlmWeSasZmmnQ1dqcgFUV4c3Mi+iTsMQG5R5YpTa3u9kaCHPdHoTJVKcEZOztMlK3sVCOJGOg4/zlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XLMVT0gX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3B2BC4CEEE;
	Tue, 18 Mar 2025 18:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742324397;
	bh=nXYHXaHdP13wJXxKaULdVXMLILj+JBOGO1TIg3SE4wI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XLMVT0gX7ThWWWMqz3x9wAAMUj+7P/ogtkf1Vk61pNcWaCI7PlKjOu+pBSqVltSW2
	 VbY9GqJNsg9gNMdtN7lUuqtJsg18Q0KqLVgnigHm826nRx6gGcLXyD/PYKG7xsD/ZH
	 J1X4+xmywbjeFQLN3ol/Uj9EKYgGycffFOxSRKCYwuBs8NraDsOofYgk88FWdWpC2j
	 g+QdkDHA1VDF/hREkR2zHnKmrhyZ6y7DqFv8b3PfLl9uwSEAhF00BDX8TMwFHTPNMs
	 UUzo8rdGdCnnJg0L4lXUnusoLS6oqiFiffRIad1L8BEtEFVa+bqPNqoi6SujITlEZ1
	 8qlzc8BzTy64g==
Message-ID: <59c3c5f6-98a3-4c02-8622-9bad2a06c6f1@kernel.org>
Date: Tue, 18 Mar 2025 19:59:51 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: leds: Add LP5812 LED driver
To: Nam Tran <trannamatk@gmail.com>, krzk+dt@kernel.org
Cc: pavel@kernel.org, lee@kernel.org, robh@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250306172126.24667-2-trannamatk@gmail.com>
 <20250318135640.8596-1-trannamatk@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250318135640.8596-1-trannamatk@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/03/2025 14:56, Nam Tran wrote:
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/leds/ti,lp5812.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +$ref: /schemas/leds/common.yaml#
>> +
>> +title: Linux driver for LP5812 LED from Texas Instruments
> 
> Nothing improved.
> 
> Nam: Do you mean the title should focus on the LP5812 hardware itself? If so, I will update it accordingly to better describe the device.

No, I mean you should say what this device is, not what the driver is
for. Bindings are about hardware, not drivers.

> 
>> +
>> +maintainers:
>> +  - Nam Tran <trannamatk@gmail.com>
>> +
>> +description: |
>> +  The LP5812 is an I2C LED Driver that can support LED matrix 4x3.
>> +  For more product information please see the link below:
>> +  https://www.ti.com/product/LP5812#tech-docs
>> +
>> +properties:
>> +  compatible:
>> +    const: ti,lp5812
>> +
>> +  reg:
>> +    maxItems: 1
> 
> 
> This improved... but:
> 
>> +
>> +  "#address-cells":
>> +    const: 1
>> +
>> +  "#size-cells":
>> +    const: 0
> 
> What are these?
> 
> Nam: I included the #address-cells and #size-cells properties to resolve a warning encountered when running:
> make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/leds/ti,lp5812.yaml
> The specific warning was:
> Documentation/devicetree/bindings/leds/ti,lp5812.example.dts:23.17-30: Warning (reg_format): /example-0/i2c/led-controller@1b:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)

This makes no sense.

> This warning suggests that the default values for #address-cells and #size-cells in the schema context are not aligned with the LP5812's expected usage. To explicitly define the correct values, I set these properties as mentioned.
> This ensures that the binding schema validation passes without warnings. If you believe a different approach is more appropriate, I’m happy to adjust the binding accordingly.

I can barely parse your messages. They are neither properly quoting my
replies, nor wrapped according to email style. Use standard format,
expressed in countless guides bout netiquette and mailing lists.

You added properties to hide warning, instead of fixing the warning, but
these properties make nos sense here.

> 
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
> 
> Nothing improved here.
> Your previous comment
> No ref to LED common schema? No other properties? This is too incomplete
> 
> Nam: I have chosen not to reference common.yaml in the LP5812 binding because the LP5812 does not fully align with the standard LED properties defined in the common schema. Since the driver does 

That's a no go.

> not use standard properties like function, color, or max-brightness, I believe referencing the common schema would introduce unnecessary constraints.

Driver? Please describe hardware, not driver.

> Currently, I have included compatible and reg as required properties, as they are essential for describing the LP5812 device. Are there additional properties that should be marked as required? Or if you have specific improvements in mind, I would appreciate your guidance.

Look at other bindings and do not re-invent.

> 
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    i2c {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        led-controller@1b {
>> +            compatible = "ti,lp5812";
>> +            reg = <0x1b>;
>> +        };
>> +    };
>> +
>> +...
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 8e0736dc2ee0..2bd9f5132cab 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -23506,6 +23506,12 @@ S:   Maintained
>>  F:   Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
>>  F:   drivers/leds/leds-lp8864.c
>>
>> +TEXAS INSTRUMENTS' LP5812 LED DRIVER
> 
> Nothing improved.
> Your previous comment
> 5 is before 8, so this does not look sorted.
> 
> Nam: I have reviewed the sorting order in MAINTAINERS, and I believe the current placement of LP5812 is correct. Since "LB" comes before "LP" alphabetically, "TEXAS INSTRUMENTS' LB8864 LED DRIVER" is correctly listed before "TEXAS INSTRUMENTS' LP5812 LED BACKLIGHT DRIVER".


Indeed, existing entry has typo, so code is fine. Is it such a big deal
to answer to reviewer to his comment?


Best regards,
Krzysztof

