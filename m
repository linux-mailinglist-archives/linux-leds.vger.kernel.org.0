Return-Path: <linux-leds+bounces-4319-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB2DA67C52
	for <lists+linux-leds@lfdr.de>; Tue, 18 Mar 2025 19:54:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EAAE21892E11
	for <lists+linux-leds@lfdr.de>; Tue, 18 Mar 2025 18:54:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A01E41DD88D;
	Tue, 18 Mar 2025 18:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tgr1jxaU"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C741898FB;
	Tue, 18 Mar 2025 18:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742324060; cv=none; b=TLn0X9m3zV5K6+u5PdvDFpTNltdN7E1nHl0o1/qC2pfYkcCa20Ox2maJEVfNZ34jakk1SezQ9xWaozlEvEF2e8S7XH0FKQhxxnkMKCmsWf3vfbY4qB15sN2lsDRtWNz/dvHK3CCk+j6N5vijafjlXzUzRQTFex7WviOPvRjdeRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742324060; c=relaxed/simple;
	bh=O23vvaesE9TG13bOJkKyDesmG9gO+6GvQMeyiKeQed4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s5+dk2C0mrdOTMhpLxqCEqo9cIFVekLnkIV4MAw4hQ07MGbQJSpyDpqfwkHhAWmuTJrGWHgcxSriVGp7LdhCbZjkz4DGgKk6Qh7IyRS5Ni9XKoZb8nX1xHL4q2yOgHGeHPOrqnDR4ggLp7knojWEWtx5SeDGQTn0absQU+9hPe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tgr1jxaU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECC03C4CEDD;
	Tue, 18 Mar 2025 18:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742324060;
	bh=O23vvaesE9TG13bOJkKyDesmG9gO+6GvQMeyiKeQed4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Tgr1jxaUKVydwCBocumoth6rTi/HDOLe4qshroG++A7dtTAu02N3OOpevzLUf2bqT
	 GnbgMdL38vST3fAnyr2RIlvqCPo9kRoaLcJOOZvK7Cs4R5sQQWUgUX1oJpW572k8ft
	 kVESDRzg/zU6Qw48txNKYu4Wjah3LyLFhTsJ2HKtexJJTKcNPQqBBOLts5NUuwMl9Z
	 ulWp8SYe4zboMHuM5kKxByjr+B03Drsn35qNLLbNmuEUjU6V6U4pQKiyHAUU3XPxSh
	 0ETZ2cha0EZoIkQiHX35w+rRpMBCMlLIyF91L7ecklG+ehbnE3HC+OzrwbTMfU0FgV
	 j1TpGt1+1jocw==
Message-ID: <2507f003-c4f1-44be-93cd-176697f0bc8c@kernel.org>
Date: Tue, 18 Mar 2025 19:54:15 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] leds: add new LED driver for TI LP5812
To: Nam Tran <trannamatk@gmail.com>, krzk+dt@kernel.org
Cc: pavel@kernel.org, lee@kernel.org, robh@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250306172126.24667-4-trannamatk@gmail.com>
 <20250318133508.4531-1-trannamatk@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJgPO8PBQkUX63hAAoJEBuTQ307
 QWKbBn8P+QFxwl7pDsAKR1InemMAmuykCHl+XgC0LDqrsWhAH5TYeTVXGSyDsuZjHvj+FRP+
 gZaEIYSw2Yf0e91U9HXo3RYhEwSmxUQ4Fjhc9qAwGKVPQf6YuQ5yy6pzI8brcKmHHOGrB3tP
 /MODPt81M1zpograAC2WTDzkICfHKj8LpXp45PylD99J9q0Y+gb04CG5/wXs+1hJy/dz0tYy
 iua4nCuSRbxnSHKBS5vvjosWWjWQXsRKd+zzXp6kfRHHpzJkhRwF6ArXi4XnQ+REnoTfM5Fk
 VmVmSQ3yFKKePEzoIriT1b2sXO0g5QXOAvFqB65LZjXG9jGJoVG6ZJrUV1MVK8vamKoVbUEe
 0NlLl/tX96HLowHHoKhxEsbFzGzKiFLh7hyboTpy2whdonkDxpnv/H8wE9M3VW/fPgnL2nPe
 xaBLqyHxy9hA9JrZvxg3IQ61x7rtBWBUQPmEaK0azW+l3ysiNpBhISkZrsW3ZUdknWu87nh6
 eTB7mR7xBcVxnomxWwJI4B0wuMwCPdgbV6YDUKCuSgRMUEiVry10xd9KLypR9Vfyn1AhROrq
 AubRPVeJBf9zR5UW1trJNfwVt3XmbHX50HCcHdEdCKiT9O+FiEcahIaWh9lihvO0ci0TtVGZ
 MCEtaCE80Q3Ma9RdHYB3uVF930jwquplFLNF+IBCn5JRzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmA872oFCRRflLYACgkQG5NDfTtBYpvScw/9GrqBrVLuJoJ52qBBKUBDo4E+5fU1bjt0
 Gv0nh/hNJuecuRY6aemU6HOPNc2t8QHMSvwbSF+Vp9ZkOvrM36yUOufctoqON+wXrliEY0J4
 ksR89ZILRRAold9Mh0YDqEJc1HmuxYLJ7lnbLYH1oui8bLbMBM8S2Uo9RKqV2GROLi44enVt
 vdrDvo+CxKj2K+d4cleCNiz5qbTxPUW/cgkwG0lJc4I4sso7l4XMDKn95c7JtNsuzqKvhEVS
 oic5by3fbUnuI0cemeizF4QdtX2uQxrP7RwHFBd+YUia7zCcz0//rv6FZmAxWZGy5arNl6Vm
 lQqNo7/Poh8WWfRS+xegBxc6hBXahpyUKphAKYkah+m+I0QToCfnGKnPqyYIMDEHCS/RfqA5
 t8F+O56+oyLBAeWX7XcmyM6TGeVfb+OZVMJnZzK0s2VYAuI0Rl87FBFYgULdgqKV7R7WHzwD
 uZwJCLykjad45hsWcOGk3OcaAGQS6NDlfhM6O9aYNwGL6tGt/6BkRikNOs7VDEa4/HlbaSJo
 7FgndGw1kWmkeL6oQh7wBvYll2buKod4qYntmNKEicoHGU+x91Gcan8mCoqhJkbqrL7+nXG2
 5Q/GS5M9RFWS+nYyJh+c3OcfKqVcZQNANItt7+ULzdNJuhvTRRdC3g9hmCEuNSr+CLMdnRBY fv0=
In-Reply-To: <20250318133508.4531-1-trannamatk@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/03/2025 14:35, Nam Tran wrote:
> From: Nam Tran <trannamatk@gmail.com>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org> Pavel Machek <pavel@kernel.org>, Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
> 
> I sincerely apologize for not addressing all of your previous comments earlier. That was not my intention, and I truly appreciate the time and effort you have put into reviewing my patch. Below, I would like to properly address your concerns.
> 
> On Fri, Mar 07, 2025 at 12:21:26AM +0700, Nam Tran wrote:
>> The chip can drive LED matrix 4x3.
>> This driver enables LED control via I2C.
> 
> You still did not respond to comments from v1. I don't see it being addressed.
> 
> Nam: I am sorry. This is my mistake. I think that I just need to update source code based on your comments and submit a new patch. This is the first time I try to update a new thing to the Linux Kernel. I will give answer inline your message for tracing easily.
> 
> In previous comment you have a question
>  "Why none of the 10 existing drivers fit for your device?"
> 
> Nam: I have carefully reviewed the existing LED drivers in the kernel, but none of them fully support the advanced capabilities of the LP5812. Unlike basic LED controllers, the LP5812 has difference features and register
> For more detail, please refer to this documentation https://www.ti.com/lit/ds/symlink/lp5812.pdf?ts=1741765622088&ref_url=https%253A%252F%252Fwww.ti.com%252Fproduct%252FLP5812

So you read my question and decided to not give an answer. Great.

The burden of proving this is on you. Do not expect me to read this and
10 other datasheets for existing LP devices. Maybe they fit, maybe they
don't but based on style of this submission and style of the code I feel
you just want to push your patches instead of integrate.

That's not how it works.



> 
>>
>> The driver is implemented in two parts:
>> - Core driver logic in leds-lp5812.c
>> - Common support functions in leds-lp5812-common.c
> 
> Why do you make two modules? This looks really unneccessary. Just compile them into one module. No, use proper kerneldoc Missing kerneldoc. Every exported symbol must have kerneldoc. Why this is not static?
> 
> Nam: I will merge source code into a file only. Therefore, I don’t need to export symbols here.

I cannot parse this. Use standard email quotes and replies. Like every
email client since 30 years.

Best regards,
Krzysztof

