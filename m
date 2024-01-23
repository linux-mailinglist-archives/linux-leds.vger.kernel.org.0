Return-Path: <linux-leds+bounces-668-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6E0839687
	for <lists+linux-leds@lfdr.de>; Tue, 23 Jan 2024 18:34:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 75448B2106B
	for <lists+linux-leds@lfdr.de>; Tue, 23 Jan 2024 17:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 140067FBD9;
	Tue, 23 Jan 2024 17:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="CmJCg97v"
X-Original-To: linux-leds@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21EA27FBA1;
	Tue, 23 Jan 2024 17:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706031287; cv=none; b=kHv0dCTP3rB15hFfMFS2d8umNZ9w7+ljzgaOtVGaG88Rt4x6yEG96t/IZMcjX/4NMC0x+e1reiMtH6ITLxcjsfbLdIQHVsgcRlu959vX/PXjbE5KjdtbHiMZomBln65VGOkv+kV5EiAe6QSqRvY3OmkAXs2AyPa7bHDfQFl+Bi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706031287; c=relaxed/simple;
	bh=N5ce6+W/71r/j3ApCh6ji0TMDO8AABTut0B7J4mjWDI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WUiZCU4SJrro5Uxxz59hyescJMMg3nCsv8X2OzYlfZEslOHU/G/I2VP5qLy5Iru22D1OMe7dIUFEXlVTKfs052f+jHp4bL6y2YZaJGti4AHOwOs8FYWeR1f6uBNJYRPJAPcihG7bM0nFMoyZz/3p1gLlSBCnux+FmVgZqsZ+/rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=CmJCg97v; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 3156A87D51;
	Tue, 23 Jan 2024 18:34:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1706031277;
	bh=fJN0EmvuEyVdTweVqK3lb0gw7cCLtKgMHlV2F/gFt3M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CmJCg97v0Bi9szGyck9o3bXSXn8j9wyozrKZR8g1hvsgXIHOPaucmovR886UIt3We
	 ZsNi4/Agq7n4iAkZ0XFa0UeAy4g9gqACVfjc5tmWRzv4KDA+eHKcVjkTV/aabbIheP
	 1K51d14poDXzQvo31JRUgA8WGE788CoqFkfyJSjrq+9CmV9y7QOV3tGTfbZ6Q95Khc
	 oNI2dxY0YArF0ClB80BX7QoOeBKU3jnVT+X4QevhSttYuon1BvRTXbsTD5Cn64ZiPH
	 Azf1ugYIW3QfywmozWRf50oQ67/Xrzq/w1EAGD5MDCOSUlAZJ59z+74Tie7RXrOkYk
	 xbL4y8Y8FtvBw==
Message-ID: <493e9362-bed1-4257-92d5-d1f87e047376@denx.de>
Date: Tue, 23 Jan 2024 18:34:28 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [RFC] net: phy: broadcom: Add DT LED configuration
 support
Content-Language: en-US
To: Florian Fainelli <florian.fainelli@broadcom.com>, netdev@vger.kernel.org,
 Christian Marangi <ansuelsmth@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew@lunn.ch>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Conor Dooley <conor+dt@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Heiner Kallweit <hkallweit1@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lee Jones <lee@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Pavel Machek <pavel@ucw.cz>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, Rob Herring <robh+dt@kernel.org>,
 Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org,
 linux-leds@vger.kernel.org
References: <20240122204650.344794-1-marex@denx.de>
 <1c57c364-dbe8-42f8-836c-52fad76a3f48@broadcom.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <1c57c364-dbe8-42f8-836c-52fad76a3f48@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 1/22/24 23:34, Florian Fainelli wrote:
> On 1/22/24 12:45, Marek Vasut wrote:
>> The BCM54213E and similar PHYs have extensive LED configuration
>> capabilities -- the PHY has two LEDs, either of the two LEDs can
>> be configured to 1 of 16 functions (speed, TX, RX, activity, on,
>> off, quality, ... multi-color) used to drive single-color LED.
>> The multi-color mode is special, it provides 16 more sub-modes
>> used to drive multi-color LED.
>>
>> The current configuration -- both LEDs configured as multi-color,
>> with both LEDs multi-color sub-mode set to link activity indicator,
>> is not suitable for all systems in which this PHY is used.
>>
>> Attempt to implement a way to describe the LED configuration in DT.
>>
>> Use Documentation/devicetree/bindings/net/ethernet-phy.yaml leds {}
>> subnode of the PHY DT node, describe both LEDs present on this PHY
>> as single LEDs within the leds {} subnode. Each described LED is a
>> subnode of its own, the description uses standard LED subsystem
>> bindings from Documentation/devicetree/bindings/leds/common.yaml .
>>
>> The DT description of the LED configuration can look for example
>> like this:
>>
>> "
>> ethernet-phy@1 {
>> ...
>>     leds {
>>         #address-cells = <1>;
>>         #size-cells = <0>;
>>
>>         led@0 {
>>             reg = <0>;
>>             function = LED_FUNCTION_ACTIVITY;
>>         };
>>
>>         led@1 {
>>             reg = <1>;
>>             function = LED_FUNCTION_SPEED_2;
>>         };
>>     };
>> };
>> "
>>
>> Implement parsing code in the broadcom PHY driver to detemine desired
>> LED configuration from DT. In case the leds {} subnode is present, the
>> parser code iterates over its subnodes and for each led@N subnode it
>> parses the following properties:
>>
>> - reg - LED ID, either 0 or 1, used to identify the LED on the PHY
>> - function - LED single-color function (speed, TX, RX, multi-color...),
>>               uses LED subsystem LED_FUNCTION_* string. The parser in
>>          the driver maps this to register setting.
>> - function-enumerator - In case function is set to "multi-color",
>>                          the multi-color function number. The parser
>>             in the driver uses this value directly for
>>             the multi-color configuration register.
>>
>> Once the properties are parsed, the LED configuration registers of the
>> PHY are programmed.
>>
>> The current list of LED subsystem LED_FUNCTION_* does not cover the
>> entire list of possible single-color LED functions of this PHY, add
>> example extension for "link speed 1" and "link speed 2" setting into
>> the leds/common.h header file.
>>
>> The function-enumerator should probably not be a number, but maybe
>> some sort of macro specific to this PHY ? I would like to avoid new
>> broadcom PHY specific DT properties.
> 
> The parsing should definitively not be in the driver code, the driver 
> should only be providing a mapping between the function and enumerator 
> and a method to set those. Christian has been working on Ethernet PHY 
> LEDs for a while now, so he would be in a better position to comment 
> about how to about that.
> 
> The LED functions and register interface is actually quite stable across 
> Ethernet PHYs from Broadcom so this code, however it looks like in the 
> future should be moved to bcm-phy-lib.[ch]. If and where they are 
> differences we can account for them in the library or by having each PHY 
> driver entry provide a bcm54xx_* wrapper function that provides a table 
> with the appropriate mapping.

I very much agree. I also hope Rafal can chime in, I saw some openwrt 
LED patches floating around recently.

