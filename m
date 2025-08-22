Return-Path: <linux-leds+bounces-5286-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D46B30F74
	for <lists+linux-leds@lfdr.de>; Fri, 22 Aug 2025 08:47:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4BACA1BA14F6
	for <lists+linux-leds@lfdr.de>; Fri, 22 Aug 2025 06:45:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEB4D2E6104;
	Fri, 22 Aug 2025 06:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pc9JHtt2"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FC02E5D39;
	Fri, 22 Aug 2025 06:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755845071; cv=none; b=Bp+BGH7u02Z8Z1NTgWzN0MrOdaVCUob4lj4rDQb3S2+MtvTL8zR6JlKkYPUOqBliRJ6iOcA8XZEysFhuE5igvYSZ1sPVJ5sszDJ95ZpSwEL1Elr8ZtI3oYqW7k/IFjjTKmYay+BF9+NQMm4pRzLOum6dGgS3vtSDzzMy7bO5Tlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755845071; c=relaxed/simple;
	bh=ub4B+wXFvePiETd1ne9e/twVZbwp9V27Fi2+Rm7VHew=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QCTlURz/d4mTWViyan5wDeLr/IIgYfabtD8ZiVLsdMyXV+XAovqaLIaNM819rMXIT1UcJS8tW8oFC3KDdezg0AeIc3C0pZDTcYM3xdr7Trkm+C7wj9GIsws8wE381OrmH/9EeyuMARHKKV0pcbvIpbBP2j3jSMpGhf/UC/1Yz00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pc9JHtt2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDF6CC113D0;
	Fri, 22 Aug 2025 06:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755845071;
	bh=ub4B+wXFvePiETd1ne9e/twVZbwp9V27Fi2+Rm7VHew=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Pc9JHtt2QYudRWiANZkSO2MPTpHme9jW9dvfhuf5KP+V4iL4hmQ1dCKoe/U8kH6NH
	 oxYYtU8i/MTwE/l4UL65bcP8ZQrVscmKutWwm2H7Jp2JRWCuQQ3TxTbIHH0h4URvh8
	 rBB8ilB8fwa1B2zgO7P/ZpFfV1N8yzCronYzZKM9blUa0J5kqwZ2qX9YrNOF1v6JE/
	 kdgVTS9TmxfeeChehE9WtR8iHL7RK3XThUPMphOrM2p0ZHeZMoBaH4UPbtkUQdagXG
	 K+sMQ/y7oRqfE38jeDT8AHFH1TwuTMkFPzVI+h7nuQJS1AZfpHo2Gcyc/xlqoSvYRg
	 PJ1S5YQ0ag78g==
Message-ID: <68ff2e14-19db-4d4c-8390-8fd2ec9e2c48@kernel.org>
Date: Fri, 22 Aug 2025 08:44:26 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] dt-bindings: auxdisplay: add Titan Micro
 Electronics TM16xx
To: =?UTF-8?Q?Jean-Fran=C3=A7ois_Lessard?= <jefflessard3@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org, =?UTF-8?Q?Andreas_F=C3=A4rber?=
 <afaerber@suse.de>, Boris Gjenero <boris.gjenero@gmail.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Paolo Sabatino <paolo.sabatino@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20250820163120.24997-1-jefflessard3@gmail.com>
 <20250820163120.24997-3-jefflessard3@gmail.com>
 <20250821-funny-hasty-poodle-582053@kuoka>
 <7CD0DD74-EB4A-414B-B22E-E9248ECF8CBC@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <7CD0DD74-EB4A-414B-B22E-E9248ECF8CBC@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/08/2025 17:16, Jean-François Lessard wrote:
>>
>>> +      # Controllers with titanmec,tm1650 fallback
>>> +      - items:
>>> +          - enum:
>>> +              - fdhisi,fd650
>>> +              - wxicore,aip650
>>> +          - const: titanmec,tm1650
>>> +      - const: titanmec,tm1650
>>> +      # Canonical standalone controllers
>>
>> Drop
>>
>>> +      - const: fdhisi,fd620
>>> +      - const: fdhisi,fd655
>>> +      - const: fdhisi,fd6551
>>> +      - const: titanmec,tm1620
>>> +      - const: titanmec,tm1638
>>> +      - const: winrise,hbs658
>>
>> This is one enum
>>
> 
> Well received. I followed the older style and will adopt the modern approach:
> 
> properties:
>   compatible:
>     items:
>       - enum:
>           - fdhisi,fd628
>           - princeton,pt6964
>           - wxicore,aip1628
>           - wxicore,aip1618
>           - fdhisi,fd650
>           - wxicore,aip650
>           - fdhisi,fd620
>           - fdhisi,fd655
>           - fdhisi,fd6551
>           - titanmec,tm1620
>           - titanmec,tm1638
>           - winrise,hbs658
>       - enum:
>           - titanmec,tm1628
>           - titanmec,tm1618
>           - titanmec,tm1650
>     minItems: 1
>     maxItems: 2
> 
> Fallback relationships will be documented explicitly in the binding’s description.

Sorry, but what? I commented under specific lines. Why are you changing
other things?


> 
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  label:
>>> +    description: Name of the entire device
>>> +    default: display
>>
>> Huh? Why do you need label? Are you sure auxdisplays have labels?
>>
>>
> 
> Display integrates with the LED subsystem (/sys/class/leds), where label is
> a standard property per leds/common.yaml. It ensures predictable LED class
> device naming when multiple display instances are present, following established
> LED subsystem conventions rather than general DT naming rules.

You want to say that top level node is like LED? Then probably it misses
common.yaml reference. Although I am still puzzled... you have sub nodes
for actual LEDs, no?

> 
> If helpful, I can add a $ref to /schemas/leds/common.yaml#/properties/label
> or include its description explicitly.
> 


Best regards,
Krzysztof

