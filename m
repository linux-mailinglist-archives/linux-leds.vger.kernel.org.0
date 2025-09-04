Return-Path: <linux-leds+bounces-5387-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C54B438BF
	for <lists+linux-leds@lfdr.de>; Thu,  4 Sep 2025 12:29:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 422781C2438A
	for <lists+linux-leds@lfdr.de>; Thu,  4 Sep 2025 10:30:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 417102EC571;
	Thu,  4 Sep 2025 10:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HeRQflD1"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1191C243969;
	Thu,  4 Sep 2025 10:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756981783; cv=none; b=WJMLmDLG9shE15xaT1EH9gi7UUFo3Drd0WeTo0PKwkgQpkuJnL6gKiXprDEhFcRb/vXNtMcD0hFuNRzB5Ax0teb33tBZIm8KYX0Ma/NpQvKt2pxY2/e2E5rX3LucDsWq/1MbNksWaRtI39s4aDioZKcvEuTJU5UyKzYr7VJKPfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756981783; c=relaxed/simple;
	bh=DNrVqVw2HFa43h6zUP2Pkf3Y1kZQlXTxFVZ+H36A3c8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZJ5nrNybF7fxi49AXLbS2WczpilRGOJJtDExUTgW3U2e2XDwKItqkBVWjt7RxdEde38EKe7e++De6CdEpvEVjqc2iRSWFObQATiY/OZT9RUwUAARRaKu8k5C7r66OvsipT2PW5AKarMClyiHBrCXrZuoOC464b4Qi4Mxnu9KwUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HeRQflD1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89731C4CEF0;
	Thu,  4 Sep 2025 10:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756981782;
	bh=DNrVqVw2HFa43h6zUP2Pkf3Y1kZQlXTxFVZ+H36A3c8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HeRQflD1lfGHVGsCwxziyULGLtgsyRXMJOjkx/eL0QGVbZE5E7HMMcEQuATaR4fYf
	 bETsR2bi5BHiWvRmXfjATsm4/PrSvMabQGijybh9z++Ms0oRsUY4sq2oh5szuMsM7c
	 6lgpZ3UYs3O4vUadnc4DWz/hrSg6kocAvJfsh3O/liXCkuODYd8+4OsO+kyutUVhFF
	 7EOIPzpkYdDQq8JAgVq3zTQjXiDW9E2GjX6KvF/U0mxpX+H5vt32Ez7jkgzXRcQtA3
	 XqRbFEay9vkR/uWQ5DVklkSnBuPluNEZ3wwkghioMH9nN1CTZuRO1zCE83bMZZVhZP
	 v00Mn7YCEBCIw==
Message-ID: <691f72aa-6d3e-47a1-9efe-a5f7a61ecb72@kernel.org>
Date: Thu, 4 Sep 2025 12:29:38 +0200
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
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <fdc68c54-a499-4ba6-8788-70c7ea515f2d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Krzysztof,

On 4-Sep-25 11:45 AM, Krzysztof Kozlowski wrote:
> On 04/09/2025 09:26, Hans de Goede wrote:
>>>>>> +maintainers:
>>>>>> +  - Aleksandrs Vinarskis <alex@vinarskis.com>
>>>>>> +
>>>>>> +description:
>>>>>> +  Some LED defined in DT are required by other DT consumers, for example
>>>>>> +  v4l2 subnode may require privacy or flash LED.
>>>>>> +
>>>>>> +  Document LED properties that its consumers may define.
>>>>>
>>>>> We already have the trigger-source binding for "attaching" LEDs to 
>>>>> devices. Why does that not work here?
>>>>
>>>> I have not actually considered this, as the existing privacy-led solution
>>>> from the original series is not trigger based. At least one of the reasons
>>>> for that is that trigger source can be rather easily altered from user
>>>> space, which would've been bad for this use case. If v4l2 acquires control
>>>> over the LED it actually removes triggers and disables sysfs on that LED.
>>>
>>> So does that mean that v4l2 solves the problem of "trigger source can be
>>> rather easily altered from user space"?
>>
>> Yes, currently the v4l2-core already does:
> 
> Thanks, I understand that it solves the problem described in the patch,
> so the patch can be dropped.

I'm a bit confused now, do you mean that this dt-bindings patch can
be dropped ?

The existing v4l2-core code solves getting the privacy-LED on ACPI/x86_64,
on DT there is no official bindings-docs for directly getting a LED with
led_get() AFAICT and I believe that having a binding is mandatory before
we just start adding leds and led-names properties to DT nodes for sensors ?

Maybe for v2 of this patch-set Aleksanders should also add a patch
actually using the new binding in a dts file to make clear that
the intent is to also start using privacy-LEDs in the same way
on DT systems ?

Regards,

Hans



