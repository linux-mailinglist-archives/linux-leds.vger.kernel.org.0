Return-Path: <linux-leds+bounces-5385-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4ABFB433EB
	for <lists+linux-leds@lfdr.de>; Thu,  4 Sep 2025 09:26:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 75D08173C7E
	for <lists+linux-leds@lfdr.de>; Thu,  4 Sep 2025 07:26:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E196329B796;
	Thu,  4 Sep 2025 07:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b9Ohtwe7"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A4728642E;
	Thu,  4 Sep 2025 07:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756970797; cv=none; b=dYG1NfTFnbRsi7gh1BPXMretcqTI8DcRADi0lZFDxvLjeab581q3KwptxGepl4/F3Eckmiml8VmwscgfpbbcLe3dlFOxdGTo3C7O3jp0NP0EdAsr8PeT9uzw8cGkPKVMFhdQwt/CECXuHIX0gKu93gjL9fIosgXPz0GNnTX8DlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756970797; c=relaxed/simple;
	bh=+NYaOCPItpDlaD7FQ3Be9kESQKapmAmo5S7ez9CtVsI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mnzrcBdDxo4ZRV9iGJkY4aBeWuOO6hRXkzNkTcDd9lw4SsDnIilmlo6gOy1B9d3sNBp465PI28YIiEwi1dMvS404mD4cO7n6BzpKnIVXILhIMGD3EyPSGrk3A525UIdAWA5plIqnIA02vXDt5KXYXMogDM8QKmx2TEu0a17JfiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b9Ohtwe7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3316C4CEF0;
	Thu,  4 Sep 2025 07:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756970797;
	bh=+NYaOCPItpDlaD7FQ3Be9kESQKapmAmo5S7ez9CtVsI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=b9Ohtwe7z/w9fPYOLb5IhCNjven1ylN0T83xpiqZC60rvNm4ehiKPzrW4IqUn8bxn
	 EX0oC1bCKWf2OWby32oH0cst+FPA4Z1cq5k1hyMnjZ3Wvn0KAPTr80+HJGUfO7vFge
	 g9zzwZrDdJB2u5YFi0zuW23bMIZIZ1dWZcoVbE43uEivEhZxD2V6qZ1T5c+Ky23JSb
	 NlyExosN4ryVn0yxZ0g1JAeUxRcbd/UI5Mo33Gln3ywWqJ33jhGhOmsJrwRkMzhRtZ
	 urSVOWT/5kLn1CcjvnMmiKjLDf3VVC4FPUGfICqXGX0usP+TwWII/PTb29fdFYUQYe
	 wP3yHm3bztlaA==
Message-ID: <daf442a6-b4d6-4213-8ec0-10397d682cc4@kernel.org>
Date: Thu, 4 Sep 2025 09:26:32 +0200
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
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20250904-brave-zippy-quoll-fcb054@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, 
On 4-Sep-25 8:41 AM, Krzysztof Kozlowski wrote:
> On Thu, Sep 04, 2025 at 01:56:15AM +0200, Aleksandrs Vinarskis wrote:
>>> On Tue, Sep 02, 2025 at 11:10:51AM +0000, Aleksandrs Vinarskis wrote:
>>>> Currently supports passing 'led-names' used to map LED devices to their
>>>> respective functions.
>>>>
>>>> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
>>>> ---
>>>>  .../devicetree/bindings/leds/leds-consumer.yaml    | 69 ++++++++++++++++++++++
>>>>  1 file changed, 69 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/leds/leds-consumer.yaml b/Documentation/devicetree/bindings/leds/leds-consumer.yaml
>>>> new file mode 100644
>>>> index 0000000000000000000000000000000000000000..a63e78417df84609e279835f7dae62e3ad2f0bf5
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/leds/leds-consumer.yaml
>>>> @@ -0,0 +1,69 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/leds/leds-consumer.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Common leds consumer
>>>> +
>>>> +maintainers:
>>>> +  - Aleksandrs Vinarskis <alex@vinarskis.com>
>>>> +
>>>> +description:
>>>> +  Some LED defined in DT are required by other DT consumers, for example
>>>> +  v4l2 subnode may require privacy or flash LED.
>>>> +
>>>> +  Document LED properties that its consumers may define.
>>>
>>> We already have the trigger-source binding for "attaching" LEDs to 
>>> devices. Why does that not work here?
>>
>> I have not actually considered this, as the existing privacy-led solution
>> from the original series is not trigger based. At least one of the reasons
>> for that is that trigger source can be rather easily altered from user
>> space, which would've been bad for this use case. If v4l2 acquires control
>> over the LED it actually removes triggers and disables sysfs on that LED.
> 
> So does that mean that v4l2 solves the problem of "trigger source can be
> rather easily altered from user space"?

Yes, currently the v4l2-core already does:

	sd->privacy_led = led_get(sd->dev, "privacy-led")
	led_sysfs_disable(sd->privacy_led);

Which disallows changing the LED state or trigger from
userspace. This is similar to how flash-LEDs are handled
which also involves directly controlling the LED rather
then using triggers and which also calls led_sysfs_disable().

led_get() already works for this on x86 and is already used
for this there which is why this code is already there.

I guess the difference with triggers is that triggers are
more of a soft binding between LED and controller of
the LED and where here we need more of a hard binding.

Regards,

Hans



