Return-Path: <linux-leds+bounces-5523-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F65B59F7A
	for <lists+linux-leds@lfdr.de>; Tue, 16 Sep 2025 19:38:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0751B167E8D
	for <lists+linux-leds@lfdr.de>; Tue, 16 Sep 2025 17:38:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E9DF2F5A0D;
	Tue, 16 Sep 2025 17:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="kOQcHlAj"
X-Original-To: linux-leds@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1CE32D5AA;
	Tue, 16 Sep 2025 17:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758044309; cv=none; b=vBKILesZ1LyQHxleKgrDv6dGMJaNDsBiuymkq0MkMaIfb9fI/URBg9z/3GcMOIg0UVEcTJTvdXG8DIKI7pCnHX2qk0MIvDVtRdVjsH++rl5Afy6NRKJfHZ9oG5dXdiAwXqXN/6YsIxJvnOXIBbrkhUu7lsQD9G5f2FOTT4HeD20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758044309; c=relaxed/simple;
	bh=qsVdbGbYrw2ppGmD7AyATaEWzKfxfbFDoOHdJUVDbvY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=b9SIqR0y727uRsWc4cpkP5AKg2nKwDIAFwdqkzv0VW6zbeFaXE1l2oTASO/K/qVM4RFVZDPNIhH9+fATTiiaVZk8+rrl/oh64BiTs0taQfjK7Lq4EyZ2uYUneGEZlnQ9iTtAR24N8zTt+WhdJ7GHgyWu2Dx/64M9HuyStXlgePE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=kOQcHlAj; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1758044307; x=1789580307;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=qsVdbGbYrw2ppGmD7AyATaEWzKfxfbFDoOHdJUVDbvY=;
  b=kOQcHlAjRgMbMOoxDATL5qrOpQun3vt+XoAOfKeCoTUBQsobFwpZ4n9j
   gc0iyY2hE2v9RYn6hxoRTQ/2X9mjXcm4uEbU4yEO9NN92bIlTPXz/vnrY
   XdgH0wgXpsrb7XsaGkaFQ6DHmWujYsLRCVBTdJ8WvouUtIGbvCMYXyICl
   O0g+EEgKaL6sbmbb8lB6uNlDXuYC4wyaJMoBItI2C/Ru2gcG9//+w3ni8
   khAwjD6aNCMA4m+VQn+rb10x2WnrOi9XWa/wNdE6OoV9dDCb9fmDbcRON
   +zaKg/qcfsiAhpvmvIrfG9h7DsgV0Ab11/FmyFYiMvRhxCH7vL6VI/laj
   g==;
X-CSE-ConnectionGUID: JwgJaeFzQrm7UxwC39IelA==
X-CSE-MsgGUID: gmVKfSQqTDuKOqe8EMcG/w==
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; 
   d="scan'208";a="52418754"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Sep 2025 10:38:26 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 16 Sep 2025 10:38:08 -0700
Received: from [10.10.179.162] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Tue, 16 Sep 2025 10:38:08 -0700
Message-ID: <71d11cdb-345f-43c7-b764-5aa43cdf1e1c@microchip.com>
Date: Tue, 16 Sep 2025 10:38:07 -0700
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: microchip: sama7d65: Add GPIO buttons and LEDs
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-leds@vger.kernel.org>
References: <20250909160842.392075-1-Ryan.Wanner@microchip.com>
 <20250910-retake-attic-ac1fe3429a1e@thorsis.com>
 <20250910-alkalize-overtime-930a59a7d169@thorsis.com>
 <fa5d44ca-d1ea-4c72-a998-b10f098b25f8@microchip.com>
 <20250911-breeder-hardness-d3ffa4bfbb6d@thorsis.com>
From: Ryan Wanner <ryan.wanner@microchip.com>
Content-Language: en-US
In-Reply-To: <20250911-breeder-hardness-d3ffa4bfbb6d@thorsis.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On 9/11/25 00:00, Alexander Dahl wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hello Ryan,
> 
> Am Wed, Sep 10, 2025 at 10:16:03AM -0700 schrieb Ryan Wanner:
>> On 9/9/25 23:25, Alexander Dahl wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> Hello Ryan,
>>>
>>> Am Wed, Sep 10, 2025 at 08:20:28AM +0200 schrieb Alexander Dahl:
>>>> Hello Ryan,
>>>>
>>>> Am Tue, Sep 09, 2025 at 09:08:38AM -0700 schrieb Ryan.Wanner@microchip.com:
>>>>> From: Ryan Wanner <Ryan.Wanner@microchip.com>
>>>>>
>>>>> Add the USER button as a GPIO input as well as add the LEDs and enable
>>>>> the blue LED as a heartbeat.
>>>>>
>>>>> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
>>>>> ---
>>>>>  .../dts/microchip/at91-sama7d65_curiosity.dts | 49 +++++++++++++++++++
>>>>>  1 file changed, 49 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
>>>>> index f091cc40a9f0..2fe34c59d942 100644
>>>>> --- a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
>>>>> +++ b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
>>>>> @@ -11,6 +11,7 @@
>>>>>  #include "sama7d65-pinfunc.h"
>>>>>  #include "sama7d65.dtsi"
>>>>>  #include <dt-bindings/mfd/atmel-flexcom.h>
>>>>> +#include <dt-bindings/input/input.h>
>>>>>  #include <dt-bindings/pinctrl/at91.h>
>>>>>
>>>>>  / {
>>>>> @@ -26,6 +27,42 @@ chosen {
>>>>>             stdout-path = "serial0:115200n8";
>>>>>     };
>>>>>
>>>>> +   gpio-keys {
>>>>> +           compatible = "gpio-keys";
>>>>> +
>>>>> +           pinctrl-names = "default";
>>>>> +           pinctrl-0 = <&pinctrl_key_gpio_default>;
>>>>> +
>>>>> +           button {
>>>>> +                   label = "PB_USER";
>>>>> +                   gpios = <&pioa PIN_PC10 GPIO_ACTIVE_LOW>;
>>>>> +                   linux,code = <KEY_PROG1>;
>>>>> +                   wakeup-source;
>>>>> +           };
>>>>> +   };
>>>>> +
>>>>> +   leds {
>>>>> +           compatible = "gpio-leds";
>>>>> +           pinctrl-names = "default";
>>>>> +           pinctrl-0 = <&pinctrl_led_gpio_default>;
>>>>> +
>>>>> +           led-red {
>>>>> +                   label = "red";
>>>>> +                   gpios = <&pioa PIN_PB17 GPIO_ACTIVE_HIGH>; /* Conflict with pwm. */
>>>>> +           };
>>>>> +
>>>>> +           led-green {
>>>>> +                   label = "green";
>>>>> +                   gpios = <&pioa PIN_PB15 GPIO_ACTIVE_HIGH>; /* Conflict with pwm. */
>>>>> +           };
>>>>> +
>>>>> +           led-blue {
>>>>> +                   label = "blue";
>>>>> +                   gpios = <&pioa PIN_PA21 GPIO_ACTIVE_HIGH>;
>>>>> +                   linux,default-trigger = "heartbeat";
>>>>> +           };
>>>>> +   };
>>>>
>>>> The label property is deprecated.  Please use the properties "color"
>>>> and "function" for new boards.  See devicetree binding documentation
>>>> for LEDs.
>>>
>>> From a quick glance, this seems to be an RGB-LED, so I would suggest
>>> to not model it as three distinct LEDs, but make use of the
>>> "leds-group-multicolor" feature, example:
>>>
>>>  59         multi-led {
>>>  60                 compatible = "leds-group-multicolor";
>>>  61                 color = <LED_COLOR_ID_RGB>;
>>>  62                 function = LED_FUNCTION_INDICATOR;
>>>  63                 leds = <&led_red>, <&led_green>, <&led_blue>;
>>>  64         };
>>
>> I see, I was not aware of this feature. This would combine all of the
>> LED pins into one RGB light correct, it seems from sysfs that this is
>> the case.
> 
> The group-multicolor feature was merged for kernel v6.6 so it's still
> quite new.  I tried this some time ago, so this is from memory only.
> The three single color gpio leds are still visible in sysfs, but you
> can not control them independently anymore, only through the sysfs
> interface of that one multicolor led.
> 
>> Would having the default-trigger="heartbeat" still be allowed for the
>> led-blue node or should that be moved into the multi-led node? From the
>> bindings it seems that the default trigger is still in the gpio-led nodes.
> 
> Sorry, not sure here.  I put linux-leds in Cc, maybe someone over
> there can answer.  If this does not fit how Microchip wants to handle
> that LED on their boards I think that's fine, too.  Just wanted to
> make people aware of the possibility.

It does not fit very well how we want to handle the LEDs on this board
as of right now. I am assuming it is fine for now to have these as
individual LEDs?

Best,
Ryan>
> Greets
> Alex
> 
>>
>> Best,
>> Ryan
>>>
>>> Greets
>>> Alex
>>>
>>>>
>>>> Thanks and greetings
>>>> Alex
>>>>
>>>>> +
>>>>>     memory@60000000 {
>>>>>             device_type = "memory";
>>>>>             reg = <0x60000000 0x40000000>;
>>>>> @@ -352,6 +389,18 @@ pinctrl_i2c10_default: i2c10-default {
>>>>>             bias-pull-up;
>>>>>     };
>>>>>
>>>>> +   pinctrl_key_gpio_default: key-gpio-default {
>>>>> +           pinmux = <PIN_PC10__GPIO>;
>>>>> +           bias-pull-up;
>>>>> +   };
>>>>> +
>>>>> +   pinctrl_led_gpio_default: led-gpio-default {
>>>>> +           pinmux = <PIN_PB15__GPIO>,
>>>>> +                    <PIN_PB17__GPIO>,
>>>>> +                    <PIN_PA21__GPIO>;
>>>>> +           bias-pull-up;
>>>>> +   };
>>>>> +
>>>>>     pinctrl_sdmmc1_default: sdmmc1-default {
>>>>>             cmd-data {
>>>>>                     pinmux = <PIN_PB22__SDMMC1_CMD>,
>>>>> --
>>>>> 2.43.0
>>>>>
>>>>>
>>>>
>>
>>


