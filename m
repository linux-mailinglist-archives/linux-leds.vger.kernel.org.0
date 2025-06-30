Return-Path: <linux-leds+bounces-4940-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F94AEDB4C
	for <lists+linux-leds@lfdr.de>; Mon, 30 Jun 2025 13:39:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48DF61898996
	for <lists+linux-leds@lfdr.de>; Mon, 30 Jun 2025 11:39:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09CEC2580CA;
	Mon, 30 Jun 2025 11:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SdZ4HX9o"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D150121A455;
	Mon, 30 Jun 2025 11:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751283577; cv=none; b=LwqPuGC7kA7Mh3pLyYSqHX6v7bQyMUW7JhxncKH6shh5WYbR/KG3FOSPJ/WQlMmy+8Z8w8M1tTd2lV8TXE7P3rqFBrf8zi2eJkt84I55UBlYW2AwTnQ3qJR35ACDGJWXjdosnvupRtyetTWcYAILhG1Dk1UXqcDJ99qBFwZDohM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751283577; c=relaxed/simple;
	bh=cw9JAhodZf38QL/wthjad8TavY/xMomZdphnAqT1w1Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VA8d+n1m4dUjN/4vZkedp6VQU23QnLS8md8OwiWysniclX4BTLOf0SnozM2AmWY46hA4ir6t8Y7L7JUqpgx/mR77ws6Jm/Rq+v6pI84tei7KMpXhX9vsuBmRYuRe8/AOXZTer/gpyLVdwzMims1rfxkimHavMltt5tZBYvXiw2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SdZ4HX9o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 673F5C4CEE3;
	Mon, 30 Jun 2025 11:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751283575;
	bh=cw9JAhodZf38QL/wthjad8TavY/xMomZdphnAqT1w1Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SdZ4HX9oR9A2x5iEhwygY8CwQdJxEaC7Qb/0W4FPM1vfieOTxOrRI6K+GwOmsUWAO
	 AGG1bu7AtKL7uc2Y2e+yRDfi9JpjoFoYKVxrxm3uqk7iMndwmvTLVqjLks/ks7LtQf
	 J/ExCMk6EyxRtkfpbm9S4b99xrcyyB60yRxV7QQGxnm1GPjsNBeUMF9uMEZPxw+YzL
	 0YpviiIrmrU8KZw0RRaWhV0WCSgBJrqS8kcuqHPB2XwqepbjZCNNzbXwrcgc48dSb/
	 DQANhYp8VVaE1jryQHHtQgMDiefr2iMMQNSdmeeR97F+BrDWHoSwKYAtz/ohRunziP
	 nS/y1xWza3Ygg==
Message-ID: <532c88b8-d938-4633-ac09-12bb3080a023@kernel.org>
Date: Mon, 30 Jun 2025 13:39:25 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] auxdisplay: Add Titanmec TM16xx 7-segment display
 controllers driver
To: Andy Shevchenko <andriy.shevchenko@intel.com>, ojeda@kernel.org
Cc: =?UTF-8?Q?Jean-Fran=C3=A7ois_Lessard?= <jefflessard3@gmail.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org, =?UTF-8?Q?Andreas_F=C3=A4rber?=
 <afaerber@suse.de>, Boris Gjenero <boris.gjenero@gmail.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Paolo Sabatino <paolo.sabatino@gmail.com>
References: <20250629130002.49842-1-jefflessard3@gmail.com>
 <20250629131830.50034-1-jefflessard3@gmail.com>
 <47d24e31-1c6f-4299-aeaf-669c474c4459@kernel.org>
 <aGI8a4iaOpN5HMQe@smile.fi.intel.com>
 <57f0289a-7d82-4294-a1dc-c6986da0c5ce@kernel.org>
 <aGJe2krBnrPXQiU6@smile.fi.intel.com>
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
In-Reply-To: <aGJe2krBnrPXQiU6@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/06/2025 11:54, Andy Shevchenko wrote:
> On Mon, Jun 30, 2025 at 11:27:21AM +0200, Krzysztof Kozlowski wrote:
>> On 30/06/2025 09:27, Andy Shevchenko wrote:
>>> On Mon, Jun 30, 2025 at 08:12:16AM +0200, Krzysztof Kozlowski wrote:
>>>> On 29/06/2025 15:18, Jean-François Lessard wrote:
> 
> ...
> 
>>>>> +	display->leds =
>>>>> +		devm_kcalloc(dev, display->num_leds, sizeof(*display->leds), GFP_KERNEL);
>>>>
>>>> Wrong wrapping. Use kernel style, not clang style.
>>>>
>>>>
>>>>> +	if (!display->leds)
>>>>> +		return -ENOMEM;
>>>
>>> Just wondering how .clang-format is official? Note some of the maintainers even
>>
>> First time I hear above clang style is preferred. Where is it expected?
> 
> Documented here:
> https://www.kernel.org/doc/html/latest/process/coding-style.html#you-ve-made-a-mess-of-it

I mean, which maintainers prefer such style of wrapping. Above I know,
but it does not solve the discussion we have here - above line wrapping
preferred by clang and opposite to most of the kernel code.

> 
> For example, discussed here
> https://lore.kernel.org/lkml/CAPcyv4ij3s+9uO0f9aLHGj3=ACG7hAjZ0Rf=tyFmpt3+uQyymw@mail.gmail.com/


Heh, I read it and two emails earlier and still could not get they
prefer to wrap at assignment instead of standard checkpatch-preferred
wrapping at arguments.

> or here
> https://lore.kernel.org/lkml/64dbeffcf243a_47b5729487@dwillia2-mobl3.amr.corp.intel.com.notmuch/

This is line length, so not the problem discussed here.


> or
> ...
> 
>> I assume clang-format is half-working and should not be used blindly,
>> but fixed to match actual kernel coding style.
> 
> That sounds like the case, at least in accordance with Miguel.
> 
>>> prefer (ugly in some cases in my opinion) style because it's generated by the
>>> clang-format.
> 


Best regards,
Krzysztof

