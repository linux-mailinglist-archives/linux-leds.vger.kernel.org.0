Return-Path: <linux-leds+bounces-5390-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA96B43AFF
	for <lists+linux-leds@lfdr.de>; Thu,  4 Sep 2025 14:05:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5FF4D1C277BD
	for <lists+linux-leds@lfdr.de>; Thu,  4 Sep 2025 12:05:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A6EF2DE701;
	Thu,  4 Sep 2025 12:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LbWttJF1"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC3527A469;
	Thu,  4 Sep 2025 12:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756987513; cv=none; b=CvN0k7vHW9zkYLpxOMd6sMj3I6dy5O+CHo1JrGLyWJMtWKyhy2CUTfaHfE7GOHZUCmEtYW9Q/BXvXfoCiJDY7mTC4anr7gd6OkGGpqgSRJTUaCSxLSmG80+4urow2iCVTyrAmp350Z40avUz863GHs0XSWYcQPoIJoh6HM5xsks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756987513; c=relaxed/simple;
	bh=13BOPU+7OAPKTnYNAO+wiCO8MYkbV3q62X00Giano/A=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=EWcweWt+T+tqaSWHD1mg1B464RAJKAJ2GXf1aW+s1Mt26ClJpYDOqMGGnKd+lt9uWUzNVTyCyb2Ahds+S9b4vuEMb+KyQyf6dVUwyX4GcTwAqOeICVnUcyAzAxaCOmqrzZaE7Iy08B/6q8d+HzNa3QrSyVyliR/oqoDJNSF/2ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LbWttJF1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7156EC4CEF0;
	Thu,  4 Sep 2025 12:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756987512;
	bh=13BOPU+7OAPKTnYNAO+wiCO8MYkbV3q62X00Giano/A=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=LbWttJF1sUXLDHN5KJorsUknmbIr4HkYcANOJ3lsoM+NcL2qpe+atXDS8QmjnL+Q4
	 LPvM+Yj2xepCaHa58ARltxT0y2IBh6Gpo8I2uINd0qotpV95uaZ96yfOHRGCjeMXgS
	 +Lb5A01VTPwewbLWFkI31zZwH5mpr3H1ctxV5emM/W+d/+MRrewdypklfuiBnrkE6P
	 qP7rQYvrVHcC3rquKIDee6mJSbAkf/ulBfFnNKOU0SzSxnes4TbiwapAvA3Jbfd1w6
	 yHYUEt+y/lBlGWVBAN/tlHTxF6CrQIAAJhh6M5fuQpG6UsD1wHl4JTKB2VsqovenX+
	 lYjJ/Z8TWokDw==
Message-ID: <e89de497-9c6e-4a4c-8f66-019d349c171b@kernel.org>
Date: Thu, 4 Sep 2025 14:05:08 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: leds: add generic LED consumer
 documentation
From: Hans de Goede <hansg@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: robh@kernel.org, bryan.odonoghue@linaro.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, krzk+dt@kernel.org, lee@kernel.org,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, pavel@kernel.org
References: <20250902182114.GA965402-robh@kernel.org>
 <20250903235615.134520-1-alex@vinarskis.com>
 <20250904-brave-zippy-quoll-fcb054@kuoka>
 <daf442a6-b4d6-4213-8ec0-10397d682cc4@kernel.org>
 <fdc68c54-a499-4ba6-8788-70c7ea515f2d@kernel.org>
 <691f72aa-6d3e-47a1-9efe-a5f7a61ecb72@kernel.org>
 <9c536e24-ab5a-454a-93af-6d4c51d4e1ce@kernel.org>
 <ece22424-ea6f-4d6e-8964-3418853dba2f@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <ece22424-ea6f-4d6e-8964-3418853dba2f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Krzysztof,

On 4-Sep-25 1:47 PM, Hans de Goede wrote:
> Hi Krzysztof,
> 
> On 4-Sep-25 12:47 PM, Krzysztof Kozlowski wrote:
>> On 04/09/2025 12:29, Hans de Goede wrote:
>>> Hi Krzysztof,
>>>
>>> On 4-Sep-25 11:45 AM, Krzysztof Kozlowski wrote:
>>>> On 04/09/2025 09:26, Hans de Goede wrote:
>>>>>>>>> +maintainers:
>>>>>>>>> +  - Aleksandrs Vinarskis <alex@vinarskis.com>
>>>>>>>>> +
>>>>>>>>> +description:
>>>>>>>>> +  Some LED defined in DT are required by other DT consumers, for example
>>>>>>>>> +  v4l2 subnode may require privacy or flash LED.
>>>>>>>>> +
>>>>>>>>> +  Document LED properties that its consumers may define.
>>>>>>>>
>>>>>>>> We already have the trigger-source binding for "attaching" LEDs to 
>>>>>>>> devices. Why does that not work here?
>>>>>>>
>>>>>>> I have not actually considered this, as the existing privacy-led solution
>>>>>>> from the original series is not trigger based. At least one of the reasons
>>>>>>> for that is that trigger source can be rather easily altered from user
>>>>>>> space, which would've been bad for this use case. If v4l2 acquires control
>>>>>>> over the LED it actually removes triggers and disables sysfs on that LED.
>>>>>>
>>>>>> So does that mean that v4l2 solves the problem of "trigger source can be
>>>>>> rather easily altered from user space"?
>>>>>
>>>>> Yes, currently the v4l2-core already does:
>>>>
>>>> Thanks, I understand that it solves the problem described in the patch,
>>>> so the patch can be dropped.
>>>
>>> I'm a bit confused now, do you mean that this dt-bindings patch can
>>> be dropped ?
>>
>> Yes.
>>
>> Alex's explanation to Rob felt confusing, so I asked for clarification.
>> You clarfiied that that v4l2 solves the problem, therefore there is no
>> problem to be solved.
>>
>> If there is no problem to be solved, this patch is not needed.
>>
>> If this patch is needed, just describe the problem accurately.
>>
>>>
>>> The existing v4l2-core code solves getting the privacy-LED on ACPI/x86_64,
>>> on DT there is no official bindings-docs for directly getting a LED with
>>
>> There are and Rob pointed to them. If Rob's answer is not enough, make
>> it explicit.
>>
>> Really, there are here some long explanations which do not really
>> explain this in simple terms. Simple term is: "existing property foo
>> does not work because <here goes the reason>".
> 
> The existing trigger-source binding for "attaching" LEDs to 
> devices does not work because:
> 
> 1. It depends on the Linux specific LED trigger mechanism where as
>    DT should describe hw in an OS agnostic manner
> 
> 2. It puts the world upside down by giving possible event-sources 
>    for the (again) Linux specific trigger rather then allowing
>    specifying e.g. specific privacy and flash LEDs as part
>    of a camera dts node. IOW it makes the LED DT note point to
>    the camera, while the LED is a part of the camera-module.
>    not the other way around. So it does not properly allow
>    describing the composition of the camera.
> 
>    Note that Rob actually put "" around attaching because this
>    property really is not proper attaching / composition as
>    we would normally do in dt.
> 
> IMHO 1. alone (this being Linux specific) warrants a new better
> binding for this.

And:

3. There already are bindings using a leds = phandle-array property in:
Documentation/devicetree/bindings/leds/leds-group-multicolor.yaml

So we already have this as another and IMHO much clenaer way to tie
a LED to a device.

The suggest generic leds = phandle-array property description added
in this new binding just adds a leds-names to give names to the
various indexes in the array which is a very common design-pattern
in dt-bindings.

Regards,

Hans



