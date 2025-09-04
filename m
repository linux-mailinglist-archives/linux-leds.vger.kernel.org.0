Return-Path: <linux-leds+bounces-5389-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0B8B43AA1
	for <lists+linux-leds@lfdr.de>; Thu,  4 Sep 2025 13:47:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A95B3AF3B8
	for <lists+linux-leds@lfdr.de>; Thu,  4 Sep 2025 11:47:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E81E2FC030;
	Thu,  4 Sep 2025 11:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dfibLHMm"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5004F5E0;
	Thu,  4 Sep 2025 11:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756986444; cv=none; b=Xh6YYbZ5H4UFwiC8D18ACPsqOrBa9TAEB6l1Oj2CUvd/kVSLPyzg4vf5y/OOwZiuvR9gy6afmJFXZTyMBRT8ZMydg3gmkcTKf7yeuLXsHYH1S2kmkZ+Mdr9Wbwn1DcQJjZAhSJMUu2jJg1Lo5cTXpVd4McZ1VBozYgP1A6qkFyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756986444; c=relaxed/simple;
	bh=o978/oTphchkmVEgNaLUD3g7cIryOP+nlIgbUqietoA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hMC6t76GKd1Nc7/SMOoun9RobARsJlreCeDZ+0h4GYsfW/ODe3OHUm02QA/773fLc7KzkVmq9nA+pi0oxDS+w321GBHwrumrYuFaHxn2ccTIXePLikTKRrG69Vfiy/JKePdvQlNUC2lgz0o5/M1N6h7ngeTyWxinBZCoK2odcSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dfibLHMm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFD24C4CEF1;
	Thu,  4 Sep 2025 11:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756986443;
	bh=o978/oTphchkmVEgNaLUD3g7cIryOP+nlIgbUqietoA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dfibLHMmSo1A49fetMhkvhOnBmshOVF3VntGS0MTX1R4tOvccuS/XpP5O3AtJodiC
	 6ym3psAJ5iMVmD8sLYt3NqYvRPXF7I3nzA5Xhq948/Vx9NBQPXwFs1CfT3r6dPe1MY
	 0DssSWP8/ZuIuad79MZFnLfwOI+axavBhYxhtPoA6M4JruOkDFD8luI4vycUbnGmwS
	 0aR8zBR2+2CxSaQXTuGM4rthayQBt8fP66c8+1A8g1epBgpbTXJv6F7X6mU9xFhWU4
	 EDTsmHbr/X+jXlmybp3VNqIz8c5QR6OXd1lp75wVtbQUj//qagygShWhLDJmhGOl2H
	 wlxOR0DcSX44g==
Message-ID: <ece22424-ea6f-4d6e-8964-3418853dba2f@kernel.org>
Date: Thu, 4 Sep 2025 13:47:19 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: leds: add generic LED consumer
 documentation
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
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <9c536e24-ab5a-454a-93af-6d4c51d4e1ce@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Krzysztof,

On 4-Sep-25 12:47 PM, Krzysztof Kozlowski wrote:
> On 04/09/2025 12:29, Hans de Goede wrote:
>> Hi Krzysztof,
>>
>> On 4-Sep-25 11:45 AM, Krzysztof Kozlowski wrote:
>>> On 04/09/2025 09:26, Hans de Goede wrote:
>>>>>>>> +maintainers:
>>>>>>>> +  - Aleksandrs Vinarskis <alex@vinarskis.com>
>>>>>>>> +
>>>>>>>> +description:
>>>>>>>> +  Some LED defined in DT are required by other DT consumers, for example
>>>>>>>> +  v4l2 subnode may require privacy or flash LED.
>>>>>>>> +
>>>>>>>> +  Document LED properties that its consumers may define.
>>>>>>>
>>>>>>> We already have the trigger-source binding for "attaching" LEDs to 
>>>>>>> devices. Why does that not work here?
>>>>>>
>>>>>> I have not actually considered this, as the existing privacy-led solution
>>>>>> from the original series is not trigger based. At least one of the reasons
>>>>>> for that is that trigger source can be rather easily altered from user
>>>>>> space, which would've been bad for this use case. If v4l2 acquires control
>>>>>> over the LED it actually removes triggers and disables sysfs on that LED.
>>>>>
>>>>> So does that mean that v4l2 solves the problem of "trigger source can be
>>>>> rather easily altered from user space"?
>>>>
>>>> Yes, currently the v4l2-core already does:
>>>
>>> Thanks, I understand that it solves the problem described in the patch,
>>> so the patch can be dropped.
>>
>> I'm a bit confused now, do you mean that this dt-bindings patch can
>> be dropped ?
> 
> Yes.
> 
> Alex's explanation to Rob felt confusing, so I asked for clarification.
> You clarfiied that that v4l2 solves the problem, therefore there is no
> problem to be solved.
> 
> If there is no problem to be solved, this patch is not needed.
> 
> If this patch is needed, just describe the problem accurately.
> 
>>
>> The existing v4l2-core code solves getting the privacy-LED on ACPI/x86_64,
>> on DT there is no official bindings-docs for directly getting a LED with
> 
> There are and Rob pointed to them. If Rob's answer is not enough, make
> it explicit.
> 
> Really, there are here some long explanations which do not really
> explain this in simple terms. Simple term is: "existing property foo
> does not work because <here goes the reason>".

The existing trigger-source binding for "attaching" LEDs to 
devices does not work because:

1. It depends on the Linux specific LED trigger mechanism where as
   DT should describe hw in an OS agnostic manner

2. It puts the world upside down by giving possible event-sources 
   for the (again) Linux specific trigger rather then allowing
   specifying e.g. specific privacy and flash LEDs as part
   of a camera dts node. IOW it makes the LED DT note point to
   the camera, while the LED is a part of the camera-module.
   not the other way around. So it does not properly allow
   describing the composition of the camera.

   Note that Rob actually put "" around attaching because this
   property really is not proper attaching / composition as
   we would normally do in dt.

IMHO 1. alone (this being Linux specific) warrants a new better
binding for this.

Regards,

Hans


