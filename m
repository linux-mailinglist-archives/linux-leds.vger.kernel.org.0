Return-Path: <linux-leds+bounces-3832-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1CFA1752B
	for <lists+linux-leds@lfdr.de>; Tue, 21 Jan 2025 01:06:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 886C93A13A9
	for <lists+linux-leds@lfdr.de>; Tue, 21 Jan 2025 00:06:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 706E3A41;
	Tue, 21 Jan 2025 00:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="cb5wMW92"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C50820E6;
	Tue, 21 Jan 2025 00:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737418010; cv=none; b=GwJ2YpaUWwOjI6X0OgGEoY99eeHvxO9FHfvzLp4SaQrYumwFFzqWFDnOr/m6eRpqlM4hYN6juka8JnFh9JLLTKnBLAYb62OLcFmdZPgeeC7lh4AlzGk1PqFPTxMVeV98I3KvCDKzGcMUDQjCGT5d6rgdyAs2a7Kb8bWQPsYToUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737418010; c=relaxed/simple;
	bh=NdIawNqB98guKXaP6Hpl4uzL9mLYBMO5grl6MGOSBJo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B8aYDr5FexTx9/LpGW1K7hTQBI5b4Xdsrz88D7yV0yPTfhjeNChdmpxLvlj6ucr0lxGm8Yus+rz4VJSi3AoV4X+OkJMkhpf6kz2Sd3nSCcn/9Su43HRfk+Q2fCUflFitFGm5JDjunWJQqf8HV3EfC1dElXdKhAgS7YGdi4xGF5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=cb5wMW92; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6A80B108A6AFB;
	Tue, 21 Jan 2025 01:06:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1737418005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YY2s90iSiqk5Hc8+r7D9KIKkvvmFKg1cpg7WKXx7XyU=;
	b=cb5wMW924mag5XnoB+XyoYgNAHWZUXO9oAABtiklBpv7fdHMbCAOZSPLR0GO/rUyfFaqa2
	hU4ESbA4A6v0VlDsqAI6FTOrX9add3+Y14fgsa8IbQIreyOTGgSc3RP0vba9Xl4QfW5BPX
	2Ttr0/paZ1/HQ8MkW2uD9FqLHxXbSrawlePVLiu1YQ7Akw3W7VEqO9qXmsB2FnIxioAG6Q
	yeAK2jiBKg7oG6wI855lVZaakLle+wbSSn2MyeNlidtOtpclPfNLExvuG1eWiLihqncOvJ
	mOZKFDb0QaT72UfOa6GLHPZ6xAzP3xCfzXDsFtKKimxPKEMQG4G9d2JE/OW+MQ==
Message-ID: <b28f34e5-7196-4105-ac33-91e76c613b78@denx.de>
Date: Tue, 21 Jan 2025 01:00:58 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: leds: Document netdev trigger
 netdev-trigger-mode property
To: Christian Marangi <ansuelsmth@gmail.com>, Andrew Lunn <andrew@lunn.ch>
Cc: linux-leds@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Lukasz Majewski <lukma@denx.de>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
References: <20250113002346.297481-1-marex@denx.de>
 <ad334b1b-a4e5-426d-a801-3e1d72455304@lunn.ch>
 <678a7ea8.df0a0220.126ab6.dd54@mx.google.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <678a7ea8.df0a0220.126ab6.dd54@mx.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 1/17/25 5:00 PM, Christian Marangi wrote:
> On Thu, Jan 16, 2025 at 02:32:13PM +0100, Andrew Lunn wrote:
>> On Mon, Jan 13, 2025 at 01:23:37AM +0100, Marek Vasut wrote:
>>> Document netdev trigger specific netdev-trigger-mode property which
>>> is used to configure the netdev trigger mode flags. Those mode flags
>>> define events on which the LED acts upon when the hardware offload is
>>> enabled. This is traditionally configured via sysfs, but that depends
>>> on udev rules which are available either too late or never in case of
>>> non-Linux systems.
>>>
>>> For each LED with linux,default-trigger = "netdev" described in DT, this
>>> optional netdev-trigger-mode property supplies the default configuration
>>> of the PHY LED mode via DT. This property should be set to a subset of
>>> TRIGGER_NETDEV_* flags.
>>>
>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>> ---
>>> Cc: Andrew Lunn <andrew@lunn.ch>
>>> Cc: Christian Marangi <ansuelsmth@gmail.com>
>>> Cc: Conor Dooley <conor+dt@kernel.org>
>>> Cc: Heiner Kallweit <hkallweit1@gmail.com>
>>> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
>>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>>> Cc: Lee Jones <lee@kernel.org>
>>> Cc: Lukasz Majewski <lukma@denx.de>
>>> Cc: Pavel Machek <pavel@ucw.cz>
>>> Cc: Rob Herring <robh@kernel.org>
>>> Cc: devicetree@vger.kernel.org
>>> Cc: linux-leds@vger.kernel.org
>>> ---
>>>   Documentation/devicetree/bindings/leds/common.yaml | 6 ++++++
>>>   1 file changed, 6 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
>>> index 3e8319e443392..1f1148fdf20c0 100644
>>> --- a/Documentation/devicetree/bindings/leds/common.yaml
>>> +++ b/Documentation/devicetree/bindings/leds/common.yaml
>>> @@ -233,6 +233,12 @@ properties:
>>>         Maximum timeout in microseconds after which the flash LED is turned off.
>>>         Required for flash LED nodes with configurable timeout.
>>>   
>>> +  # Requires netdev trigger
>>> +  netdev-trigger-mode:
>>> +    description:
>>> +      The netdev LED trigger default mode flags, use TRIGGER_NETDEV_ * flags.
>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>> +
>>>   allOf:
>>>     - if:
>>>         required:
>>> -- 
>>
>> An example would be good.
>>
>> In order to be able to use TRIGGER_NETDEV_* i assume you are doing an
>> include which is outside of the usual dt-bindings directory. I don't
>> know of the DT Maintainers opinion on that.

I am indeed.

> Well I think we can just move those include to dt-bindings or at worst
> define new one (maybe less driver specific) and reference the internal
> one... Should not be a problem in theory.
I can do that. I'll try to handle input from Andrew in the next few 
days, sorry for the slow replies.

