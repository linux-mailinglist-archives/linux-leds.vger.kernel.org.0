Return-Path: <linux-leds+bounces-5388-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1BEB4392F
	for <lists+linux-leds@lfdr.de>; Thu,  4 Sep 2025 12:48:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC7B77C1D23
	for <lists+linux-leds@lfdr.de>; Thu,  4 Sep 2025 10:48:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FFE62F90E2;
	Thu,  4 Sep 2025 10:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e2H0MNGJ"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639F12C11EC;
	Thu,  4 Sep 2025 10:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756982882; cv=none; b=AqxMy5SN6rbHJc80w0+yPslVD1WM14/0CRWgerb7UWGJYBhn2WiqJfkp1Wv3bavm7iiFbVNBdv33AB52d7yMApeV4GiIKjETwJeK9TfYGFPNDk7ANEJM1B93G3FlJAg3SwAADRmhM9Mv9MjfEJfh4D3xW9GLWkoIZTnQZ+e61RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756982882; c=relaxed/simple;
	bh=l62m+TMMNGz+2R0Bawty3mPUhunyip1V9UZfpzBmCXM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T0e0t92Ap0YJsyKys7A//QailT36kWtU2w6V92FwvqTmnVV5UcBmR7mBYt64/IG5iQJmqnfwLHpPtI4R5fe2FKGLybLzf/+ITyGZOMe0d0IpiaCFTA0Sv1aS3DB9Bu5BgYbOYJcOmjCOvDDd/uyqZ63b1s3WnhFyioYyOLSw+KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e2H0MNGJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7D09C4CEF4;
	Thu,  4 Sep 2025 10:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756982881;
	bh=l62m+TMMNGz+2R0Bawty3mPUhunyip1V9UZfpzBmCXM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=e2H0MNGJal+VD9Eax1sSNjM4yuDGH9qz/chl4KJsiVWNHSLvER1SI43N7Fdvk+T6/
	 CQgjxJuUUBZaOShLOl6sZFjoYm7F/6c7ZTr9F2v0CI3Ud2wEJl3qbaIIzIK8q2a3E2
	 gRGkORnOeji9mtMMCvUn/9K5wRs9NfqIWct/O/PjEjEHMXXrKAe3cCufxb6E/hMMMn
	 ZxSfYlOgQVL6YwO4L9lWlDjXDmErMjjvue2iPSGnLbIhEWC0oVXsRiEbTUADDXQiGs
	 qwP+hq1fSb8EC02+KE+qrKrtwkqwd2jCLhIy4irhDzolxz/fl1wQrM3uIFxAN3eZ8r
	 6L1fM2EFmgQpQ==
Message-ID: <9c536e24-ab5a-454a-93af-6d4c51d4e1ce@kernel.org>
Date: Thu, 4 Sep 2025 12:47:56 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: leds: add generic LED consumer
 documentation
To: Hans de Goede <hansg@kernel.org>,
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
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <691f72aa-6d3e-47a1-9efe-a5f7a61ecb72@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/09/2025 12:29, Hans de Goede wrote:
> Hi Krzysztof,
> 
> On 4-Sep-25 11:45 AM, Krzysztof Kozlowski wrote:
>> On 04/09/2025 09:26, Hans de Goede wrote:
>>>>>>> +maintainers:
>>>>>>> +  - Aleksandrs Vinarskis <alex@vinarskis.com>
>>>>>>> +
>>>>>>> +description:
>>>>>>> +  Some LED defined in DT are required by other DT consumers, for example
>>>>>>> +  v4l2 subnode may require privacy or flash LED.
>>>>>>> +
>>>>>>> +  Document LED properties that its consumers may define.
>>>>>>
>>>>>> We already have the trigger-source binding for "attaching" LEDs to 
>>>>>> devices. Why does that not work here?
>>>>>
>>>>> I have not actually considered this, as the existing privacy-led solution
>>>>> from the original series is not trigger based. At least one of the reasons
>>>>> for that is that trigger source can be rather easily altered from user
>>>>> space, which would've been bad for this use case. If v4l2 acquires control
>>>>> over the LED it actually removes triggers and disables sysfs on that LED.
>>>>
>>>> So does that mean that v4l2 solves the problem of "trigger source can be
>>>> rather easily altered from user space"?
>>>
>>> Yes, currently the v4l2-core already does:
>>
>> Thanks, I understand that it solves the problem described in the patch,
>> so the patch can be dropped.
> 
> I'm a bit confused now, do you mean that this dt-bindings patch can
> be dropped ?

Yes.

Alex's explanation to Rob felt confusing, so I asked for clarification.
You clarfiied that that v4l2 solves the problem, therefore there is no
problem to be solved.

If there is no problem to be solved, this patch is not needed.

If this patch is needed, just describe the problem accurately.

> 
> The existing v4l2-core code solves getting the privacy-LED on ACPI/x86_64,
> on DT there is no official bindings-docs for directly getting a LED with

There are and Rob pointed to them. If Rob's answer is not enough, make
it explicit.

Really, there are here some long explanations which do not really
explain this in simple terms. Simple term is: "existing property foo
does not work because <here goes the reason>".

Best regards,
Krzysztof

