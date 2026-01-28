Return-Path: <linux-leds+bounces-6779-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGKrCqTheWm50gEAu9opvQ
	(envelope-from <linux-leds+bounces-6779-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 28 Jan 2026 11:15:00 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B05B9F51E
	for <lists+linux-leds@lfdr.de>; Wed, 28 Jan 2026 11:14:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0B1EB302AF11
	for <lists+linux-leds@lfdr.de>; Wed, 28 Jan 2026 10:14:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2FC92D46B2;
	Wed, 28 Jan 2026 10:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rt++YOd+"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6B52DC33F;
	Wed, 28 Jan 2026 10:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769595266; cv=none; b=eMeiK6peJ2bdw52UwghcUbfgCxo/IFYK1nebiP+ti5SwnSmz5l0kXt7qdIuW5T3pb2PDXbehfqFsftPRndQKRa3HMCR9hqTaeBdCpPUGwZg3+eP9cQAdEgDSU39SeNGjuBlMVNDbL0o39APGhj98UgRn6GAcF4z8Uk7pCVULJk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769595266; c=relaxed/simple;
	bh=4OWfhnYD2xIoJP/oYLpREJGUH7ShEHWsA3ATbPvp9sg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O1PEfqvSeAk396bqX95lecVrOzEXne4ATQ0HF4Os+wK3XWuXWnaLw4MPPgWBAjwxwhyN5vtPuNgyczRkS6E5xtBkmiAtKqvs0HEWIk5cyPAQyf6qQux//973KHR8Da+BQWc08hFUrcbW05BtNaVU4yQq+2REkHZCaqxKYsLSrSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rt++YOd+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A494C16AAE;
	Wed, 28 Jan 2026 10:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769595266;
	bh=4OWfhnYD2xIoJP/oYLpREJGUH7ShEHWsA3ATbPvp9sg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rt++YOd+C4NUVRt2vuKCPAMReK7DRcFwepu1MTh9dUvzIPKqtZzazctknpKApIQXZ
	 xJOS1/gJtY5uj9gxcYenbGN4oZwD4qMNdb9VO6iW6i6TT14POXPS6dJ9JBgObGpVhy
	 XFpbvH1sRNLCtV/M/i0WHsh3HhGqt/SHgqOdk4C950DAOA3ii0LW5e9U/IUWXLN3OF
	 Bn/tc2x7X76d/ZT6dMRDGRMW5UQ1bRkBe3MBuYxqko/zxBRJfSirw4G9A4eFF9b4ga
	 Tiw/sHdNq5SPgf1cbYW+sBvYMlfiKVHwb0lofWvB+UybKpQWJVKZ1NgifAhTu5RVaJ
	 CexKoFbRERkxw==
Message-ID: <14c04d1d-f42f-4ac9-a887-ed37cedb4913@kernel.org>
Date: Wed, 28 Jan 2026 11:14:21 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: backlight: gpio-backlight: allow
 multiple GPIOs
To: tessolveupstream@gmail.com, lee@kernel.org, danielt@kernel.org,
 jingoohan1@gmail.com
Cc: deller@gmx.de, pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260120125036.2203995-1-tessolveupstream@gmail.com>
 <20260120125036.2203995-2-tessolveupstream@gmail.com>
 <3f3c47ea-1660-4bd4-ab89-3bdf58217995@kernel.org>
 <54d156ba-e177-4059-a808-2505983b4e2e@gmail.com>
 <5f78fbe8-288d-4b0a-af57-e834bd1186ba@gmail.com>
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
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJoF1BKBQkWlnSaAAoJEBuTQ307
 QWKbHukP/3t4tRp/bvDnxJfmNdNVn0gv9ep3L39IntPalBFwRKytqeQkzAju0whYWg+R/rwp
 +r2I1Fzwt7+PTjsnMFlh1AZxGDmP5MFkzVsMnfX1lGiXhYSOMP97XL6R1QSXxaWOpGNCDaUl
 ajorB0lJDcC0q3xAdwzRConxYVhlgmTrRiD8oLlSCD5baEAt5Zw17UTNDnDGmZQKR0fqLpWy
 786Lm5OScb7DjEgcA2PRm17st4UQ1kF0rQHokVaotxRM74PPDB8bCsunlghJl1DRK9s1aSuN
 hL1Pv9VD8b4dFNvCo7b4hfAANPU67W40AaaGZ3UAfmw+1MYyo4QuAZGKzaP2ukbdCD/DYnqi
 tJy88XqWtyb4UQWKNoQqGKzlYXdKsldYqrLHGoMvj1UN9XcRtXHST/IaLn72o7j7/h/Ac5EL
 8lSUVIG4TYn59NyxxAXa07Wi6zjVL1U11fTnFmE29ALYQEXKBI3KUO1A3p4sQWzU7uRmbuxn
 naUmm8RbpMcOfa9JjlXCLmQ5IP7Rr5tYZUCkZz08LIfF8UMXwH7OOEX87Y++EkAB+pzKZNNd
 hwoXulTAgjSy+OiaLtuCys9VdXLZ3Zy314azaCU3BoWgaMV0eAW/+gprWMXQM1lrlzvwlD/k
 whyy9wGf0AEPpLssLVt9VVxNjo6BIkt6d1pMg6mHsUEVzsFNBFVDXDQBEADNkrQYSREUL4D3
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
 YpsFAmgXUF8FCRaWWyoACgkQG5NDfTtBYptO0w//dlXJs5/42hAXKsk+PDg3wyEFb4NpyA1v
 qmx7SfAzk9Hf6lWwU1O6AbqNMbh6PjEwadKUk1m04S7EjdQLsj/MBSgoQtCT3MDmWUUtHZd5
 RYIPnPq3WVB47GtuO6/u375tsxhtf7vt95QSYJwCB+ZUgo4T+FV4hquZ4AsRkbgavtIzQisg
 Dgv76tnEv3YHV8Jn9mi/Bu0FURF+5kpdMfgo1sq6RXNQ//TVf8yFgRtTUdXxW/qHjlYURrm2
 H4kutobVEIxiyu6m05q3e9eZB/TaMMNVORx+1kM3j7f0rwtEYUFzY1ygQfpcMDPl7pRYoJjB
 dSsm0ZuzDaCwaxg2t8hqQJBzJCezTOIkjHUsWAK+tEbU4Z4SnNpCyM3fBqsgYdJxjyC/tWVT
 AQ18NRLtPw7tK1rdcwCl0GFQHwSwk5pDpz1NH40e6lU+NcXSeiqkDDRkHlftKPV/dV+lQXiu
 jWt87ecuHlpL3uuQ0ZZNWqHgZoQLXoqC2ZV5KrtKWb/jyiFX/sxSrodALf0zf+tfHv0FZWT2
 zHjUqd0t4njD/UOsuIMOQn4Ig0SdivYPfZukb5cdasKJukG1NOpbW7yRNivaCnfZz6dTawXw
 XRIV/KDsHQiyVxKvN73bThKhONkcX2LWuD928tAR6XMM2G5ovxLe09vuOzzfTWQDsm++9UKF a/A=
In-Reply-To: <5f78fbe8-288d-4b0a-af57-e834bd1186ba@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6779-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FREEMAIL_CC(0.00)[gmx.de,kernel.org,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8B05B9F51E
X-Rspamd-Action: no action

On 27/01/2026 13:46, tessolveupstream@gmail.com wrote:
> 
> 
> On 23-01-2026 16:41, tessolveupstream@gmail.com wrote:
>>
>>
>> On 20-01-2026 20:01, Krzysztof Kozlowski wrote:
>>> On 20/01/2026 13:50, Sudarshan Shetty wrote:
>>>> Update the gpio-backlight binding to support configurations that require
>>>> more than one GPIO for enabling/disabling the backlight.
>>>
>>>
>>> Why? Which devices need it? How a backlight would have three enable
>>> GPIOs? I really do not believe, so you need to write proper hardware
>>> justification.
>>>
>>
>> To clarify our hardware setup: 
>> the panel requires one GPIO for the backlight enable signal, and it 
>> also has a PWM input. Since the QCS615 does not provide a PWM controller 
>> for this use case, the PWM input is connected to a GPIO that is driven 
>> high to provide a constant 100% duty cycle, as explained in the link 
>> below.
>> https://lore.kernel.org/all/20251028061636.724667-1-tessolveupstream@gmail.com/T/#m93ca4e5c7bf055715ed13316d91f0cd544244cf5
>>  
>>>>
>>>> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
>>>> ---
>>>>  .../leds/backlight/gpio-backlight.yaml        | 24 +++++++++++++++++--
>>>>  1 file changed, 22 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
>>>> index 584030b6b0b9..4e4a856cbcd7 100644
>>>> --- a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
>>>> +++ b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
>>>> @@ -16,8 +16,18 @@ properties:
>>>>      const: gpio-backlight
>>>>  
>>>>    gpios:
>>>> -    description: The gpio that is used for enabling/disabling the backlight.
>>>> -    maxItems: 1
>>>> +    description: |
>>>> +      The gpio that is used for enabling/disabling the backlight.
>>>> +      Multiple GPIOs can be specified for panels that require several
>>>> +      enable signals. All GPIOs are controlled together.
>>>> +    type: array
>>>
>>> There is no such syntax in the bindings, from where did you get it? Type
>>> is already defined.
>>>
>>> items:
>>>   minItems: 1
>>>   maxItems: 3
>>>
>>>
>>>> +    minItems: 1
>>>> +    items:
>>>> +      type: array
>>>> +      minItems: 3
>>>> +      maxItems: 3
>>>> +      items:
>>>> +        type: integer
>>>
>>> All this is some odd stuff - just to be clear, don't send us LLM output.
>>> I don't want to waste my time to review microslop.
>>>
>>> Was it done with help of Microslop?
>>>
>>
>> I understand now that the schema changes I proposed were not correct, 
>> and I will address this in the next patch series. My intention was to 
>> check whether the gpio-backlight binding could support more than one 
>> enable-type GPIO. 
>> Could you please advise what would be an appropriate maximum number of 
>> GPIOs for gpio-backlight in such a scenario? For example, would allowing 
>> 2 GPIOs be acceptable, or should this case be handled in a different way?
>>
> 
> In line with Daniel’s suggestion, I am planning to adopt a fixed upper 
> limit for the number of backlight GPIOs. The current hardware only 
> requires two GPIOs, so the maxItems can be set to 2.
> 
> If future platforms or customers require support for a higher number 
> of GPIOs, this limit can be increased and the driver can be 
> updated accordingly.
> 
> Kindly advise if this solution aligns with your expectations, or if 
> you prefer an alternative maximum value.


You have entire commit msg to explain the hardware and explain WHY you
are doing this. In a concise and readable way. I will not be going
through 2 different email threads with 20 messages to figure that out.

Best regards,
Krzysztof

