Return-Path: <linux-leds+bounces-2106-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A470C914DF3
	for <lists+linux-leds@lfdr.de>; Mon, 24 Jun 2024 15:09:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9C321C22D2F
	for <lists+linux-leds@lfdr.de>; Mon, 24 Jun 2024 13:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B820D13D607;
	Mon, 24 Jun 2024 13:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JhRAum4C"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877C3136982;
	Mon, 24 Jun 2024 13:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719234542; cv=none; b=PvmELEBV0uI8WYKAc0dEx/7sMBfjWIoCO7nJYGs2U8FWZDwUSfiQUJH4yXP1YyOjJdYteA53LkDPU32iVwkRHCl47xiMBMMp1ULnPrsdRVUxkap+R4Xl/jCwsuSRCrCZhlR4WdGBG8Es5Odxwh/DQFX4gSCDdmlzSTeW2kx09+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719234542; c=relaxed/simple;
	bh=+EBUDm+4Kdc1oUmt/gGVTk+tGI3J1fFfB4oTdZGHtto=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=kGd1Ny4d/BezQzL72D/MVcD95R94OWAKDwR5ADfBQYo7gkmHIXlh4NuV/82t2zxi1KIwLHIO7p/e4QfwVaRQxhNLC3GAhn7Cqyu/QWU8uuSTTxfXO965QSmlOlIqnpb78aMPzjHC9+fVSIQuF1JZzO4FJievROerxILQpw47ixI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JhRAum4C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3987EC32782;
	Mon, 24 Jun 2024 13:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719234542;
	bh=+EBUDm+4Kdc1oUmt/gGVTk+tGI3J1fFfB4oTdZGHtto=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=JhRAum4C2ymJe725CBlz6ioRhSTM2lHC2NioD62Ud8nU/iH/9PkzdwGxjyupdEinr
	 mcYecsqT/stjiuues6/fdCQDZetxd/zHWuUoyeEUzuxFOy10ApSn5S8yn1u8qcAFDm
	 Cbniy+nTf5X+lwQI+zfBuV6+qvduWU3OgAEJ1KHdoK7B58w7imqtsBS2u+MRLQ/qtm
	 ZAzWzpNc47AOIdY0+9cn/VD4y7Mx3ynm54/MQQR+IRyU6XoOoafnNvUXZ2hiNzGIpZ
	 mHHZZm4lOuvV1Ru6Ec1waoRoK3JnhiC7qms04SJO0+fPK++CJkmX7FhjimIUp9qUn2
	 ijC1BlmVKod3Q==
Message-ID: <2b01874f-26e9-41a1-84c0-9a2ed15cb630@kernel.org>
Date: Mon, 24 Jun 2024 15:08:56 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: Add LED1202 LED Controller
To: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>,
 pavel@ucw.cz, lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <ZniNdGgKyUMV-hjq@admins-Air>
 <7a080980-a247-4d17-88f7-19899379e1a1@kernel.org>
 <ZnlvOuvMQmJFrfSX@admins-Air>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <ZnlvOuvMQmJFrfSX@admins-Air>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/06/2024 15:06, Vicentiu Galanopulo wrote:
> On Mon, Jun 24, 2024 at 07:02:12AM +0200, Krzysztof Kozlowski wrote:
>> On 23/06/2024 23:02, Vicentiu Galanopulo wrote:
>>> The LED1202 is a 12-channel low quiescent current LED driver with:
>>>   * Supply range from 2.6 V to 5 V
>>>   * 20 mA current capability per channel
>>>   * 1.8 V compatible I2C control interface
>>>   * 8-bit analog dimming individual control
>>>   * 12-bit local PWM resolution
>>>   * 8 programmable patterns
>>>
>>> Signed-off-by: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
>>> ---
>>>
>>> Changes in v2:
>>>   - renamed label to remove color from it
>>>   - add color property for each node
>>>   - add function and function-enumerator property for each node
>>
>> Fix your email setup, because your broken or non-existing threading
>> messes with review process. See:
>>
>> b4 diff '<ZniNdGgKyUMV-hjq@admins-Air>'
>> Grabbing thread from
>> lore.kernel.org/all/ZniNdGgKyUMV-hjq@admins-Air/t.mbox.gz
>> Checking for older revisions
>> Grabbing search results from lore.kernel.org
>>   Added from v1: 1 patches
>> ---
>> Analyzing 3 messages in the thread
>> Looking for additional code-review trailers on lore.kernel.org
>> Preparing fake-am for v1: dt-bindings: leds: Add LED1202 LED Controller
>> ERROR: v1 series incomplete; unable to create a fake-am range
>> ---
>> Could not create fake-am range for lower series v1
>>
>>
>>>
>>>  .../devicetree/bindings/leds/st,led1202.yml   | 162 ++++++++++++++++++
>>>  1 file changed, 162 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/leds/st,led1202.yml
>>
>> yaml, not yml
> ok, will change
>>
>>>
>>> diff --git a/Documentation/devicetree/bindings/leds/st,led1202.yml b/Documentation/devicetree/bindings/leds/st,led1202.yml
>>> new file mode 100644
>>> index 000000000000..1484b09c8eeb
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/leds/st,led1202.yml
>>> @@ -0,0 +1,162 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/leds/st,led1202.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: ST LED1202 LED controllers
>>> +
>>> +maintainers:
>>> +  - Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
>>> +
>>> +description:
>>> +  The LED1202 is a 12-channel low quiescent current LED controller
>>> +  programmable via I2C; The output current can be adjusted separately
>>> +  for each channel by 8-bit analog and 12-bit digital dimming control.
>>> +
>>> +  Datasheet available at
>>> +  https://www.st.com/en/power-management/led1202.html
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - st,led1202
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  "#address-cells":
>>> +    const: 1
>>> +
>>> +  "#size-cells":
>>> +    const: 0
>>> +
>>> +patternProperties:
>>> +  "^led@[0-9a-f]+$":
>>> +    type: object
>>> +    $ref: common.yaml#
>>> +    unevaluatedProperties: false
>>> +
>>> +    properties:
>>> +      reg:
>>> +        minimum: 0
>>> +        maximum: 11
>>> +
>>> +    required:
>>> +      - reg
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/leds/common.h>
>>> +
>>> +    i2c {
>>> +        #address-cells = <1>;
>>> +        #size-cells = <0>;
>>> +
>>> +        led-controller@58 {
>>> +            compatible = "st,led1202";
>>> +            reg = <0x58>;
>>> +            address-cells = <1>;
>>> +            size-cells = <0>;
>>> +
>>> +            led@0 {
>>> +                reg = <0>;
>>> +                label = "led1";
>>> +                function = LED_FUNCTION_STATUS;
>>> +                color = <LED_COLOR_ID_RED>;
>>> +                function-enumerator = <1>;
>>> +                active = <1>;
>>
>> This did not improve. First, which binding defines this field?
>>
> it's a new field I added, but if you would like for me to use another
> please advise.

Look at the LED bindings. Anyway, you cannot sprinkle new properties to
some nodes without defining them in the bindings.

> Depending on this value, the enabled/disabled bit is set in the
> appropriate register, and the led appears with the label name in sysfs.
> Hope this extra info helps in helping me pick the appropiate binding. 
> 
>> Second this was never tested.
>>
> are you referring to the automated test done by the kernel test robot?

No, your testing. See writing-schema doc.

> 
>  
>> Third, where did you give me any chance to reply to your comment before
>> posting new version?
>>
> I think I have a wrong understanding of the process or mutt client is missconfigured
> or missued on my side.

Sending new version of patchset without allowing me to respond is not
"mutt misconfiguration".

Best regards,
Krzysztof


