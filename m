Return-Path: <linux-leds+bounces-4982-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D9FAF6F6A
	for <lists+linux-leds@lfdr.de>; Thu,  3 Jul 2025 11:56:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 79A207ADEC6
	for <lists+linux-leds@lfdr.de>; Thu,  3 Jul 2025 09:55:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4136B2DFF2C;
	Thu,  3 Jul 2025 09:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hDOhe0lb"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C2C2DCF68;
	Thu,  3 Jul 2025 09:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751536573; cv=none; b=EJsOf1WBCXPpIyCwk/FTB906qPttKe0coYPlG2sBBXXYeBuuK9nwkQ4SefLo2oGXyx1m+ASO5/cXAcWhKhqjn99agoAd/HYm/GGaazpAYWpB/8CV7ZqlqVAWyXpPhaXoYAJbvqGAqwNLE99uNRwrFv5mdT2Qgy5rG5ihaQPbFRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751536573; c=relaxed/simple;
	bh=yDEfNAy1j7gX923WAV0zbCdun77AkpWmT/YAxb4sIm0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rdk+tspb9CimrVxQa8cHSEqcijCkd8Dd6SWKuhFRhVNmYpA8ANWeD3NlwpV+gSXb6ITC4T6Kb3g3Vl9DRfqCEAMeqjHFxkp5hCmpQDn1TVNCJmxswQo6UVIGIipO6mVGWFBn4K7nj26WdmEe1kIXLtqlUMReZGQaG1gKBN3J7Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hDOhe0lb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD926C4CEE3;
	Thu,  3 Jul 2025 09:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751536572;
	bh=yDEfNAy1j7gX923WAV0zbCdun77AkpWmT/YAxb4sIm0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hDOhe0lb3UjIGnpCC4bXn+cIH0RvZIH6s95qY/L17U48s1NMV9ctnk8oKlaGOV1Zy
	 i0AzEQmTKeL3WuOqvWWrHz2dXTM8Qrz5FP4bYLD3q2EoEPNdY2w5RAiJvee6jODLgW
	 uZ9rimO04IDH1CtwHcVibqDU2uGMWu4iv5yLNys6YkyLo9NGZ+FIODe2Gb0OyYJwC2
	 UAtXXKihlUD/Lni5ozBocQ6SJN6TaBVHVX2OSXrVTk/xL12dsfpClhPa37mo/SsOjO
	 +uX7spCCTcVwoAVYOKMPPMJ1EK6S01b3oBLxBYGL238UjV50/Xl9jnuFq2XWobbwbM
	 /Ay6ELPPPyd/Q==
Message-ID: <66fb9c67-8f2b-4ce3-8fcb-f6479a1ea507@kernel.org>
Date: Thu, 3 Jul 2025 11:56:07 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/2] dt-bindings: leds: pwm: Add enable-gpios property
To: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>,
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 GEO-CHHER-bsp-development <bsp-development.geo@leica-geosystems.com>,
 "lee@kernel.org" <lee@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "pavel@kernel.org" <pavel@kernel.org>,
 "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
References: <20250702114759.223925-1-Qing-wu.Li@leica-geosystems.com.cn>
 <175146290821.1131432.4001907939183416459.robh@kernel.org>
 <AM9PR06MB79557F8FFA113011C4D824D6D743A@AM9PR06MB7955.eurprd06.prod.outlook.com>
 <e98aa9ed-2d32-4db2-b7f2-a5e5ce1d1d84@kernel.org>
 <AM9PR06MB7955DCFFBADEF3A56A923D92D743A@AM9PR06MB7955.eurprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <AM9PR06MB7955DCFFBADEF3A56A923D92D743A@AM9PR06MB7955.eurprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/07/2025 10:52, LI Qingwu wrote:
> 
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzk@kernel.org>
>> Sent: Thursday, July 3, 2025 3:12 PM
>> To: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>; Rob Herring (Arm)
>> <robh@kernel.org>
>> Cc: krzk+dt@kernel.org; conor+dt@kernel.org; linux-kernel@vger.kernel.org;
>> GEO-CHHER-bsp-development <bsp-development.geo@leica-geosystems.com>;
>> lee@kernel.org; devicetree@vger.kernel.org; pavel@kernel.org;
>> linux-leds@vger.kernel.org
>> Subject: Re: [PATCH V2 1/2] dt-bindings: leds: pwm: Add enable-gpios property
>>
>> This email is not from Hexagon’s Office 365 instance. Please be careful while
>> clicking links, opening attachments, or replying to this email.
>>
>>
>> On 03/07/2025 05:54, LI Qingwu wrote:
>>>>
>>>> On Wed, 02 Jul 2025 19:47:58 +0800, LI Qingwu wrote:
>>>>> Some PWM LED chips have a dedicated enable GPIO.
>>>>> This commit adds the support to specify such GPIO.
>>>>>
>>>>> Signed-off-by: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
>>>>> ---
>>>>>  Documentation/devicetree/bindings/leds/leds-pwm.yaml | 8 ++++++++
>>>>>  1 file changed, 8 insertions(+)
>>>>>
>>>>
>>>> My bot found errors running 'make dt_binding_check' on your patch:
>>>>
>>>> yamllint warnings/errors:
>>>> ./Documentation/devicetree/bindings/leds/leds-pwm.yaml:44:21: [error]
>>>> empty value in block mapping (empty-values)
>>>
>>> Fixed in V3
>>
>> So your answer to my "never tested" was to send again the same as v2 and still
>> not tested?
> 
> Nop,  "Fixed in V3" answer "bot found errors running 'make dt_binding_check'"
> Testing info comes later in v4
I responded to you on v1 in the morning my time. 4 hours later you sent
v2, so what is the "Nop"?

Best regards,
Krzysztof

