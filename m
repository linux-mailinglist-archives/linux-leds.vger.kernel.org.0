Return-Path: <linux-leds+bounces-1636-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 996E38C0E01
	for <lists+linux-leds@lfdr.de>; Thu,  9 May 2024 12:11:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B408F1C21BF1
	for <lists+linux-leds@lfdr.de>; Thu,  9 May 2024 10:11:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5008D14B084;
	Thu,  9 May 2024 10:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="0Hzv31iA"
X-Original-To: linux-leds@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC5714B07D;
	Thu,  9 May 2024 10:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715249465; cv=none; b=ks5+jhFV9jWBJFlrot0XGLag1vQPzVgLErqiZMVj1h2jY9aylCIzm4weqhVgw4um6F2avhbR6ek8ruX29YY1REcpe1jIHfVuStosUzU7DsyQQB14FcUg6G5sbpGLvgxJhQN1q1BKFk+prYYk5sCFd8gn7oxs6Hdvl/5K7jVgUlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715249465; c=relaxed/simple;
	bh=2LnYN9nc3SQsqAASkrGVaJVc2LgnjoBJzHW2Q9QiI6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p7MLPnHHqUBbix3C2WSUaHuLR/Wh6U0/mm/dcURSRy96qlF9bmozDnjsW65gyTRAhDHWKcRNbqjEoyh7YU6pDyCDyaiwhAr3kqd2dXXp1/uynuxbEpFmXcffLdKElpLY8ViyCrL0j1GHwWca6Lk/IRHe+CLr0QCzWY+EleT53r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=0Hzv31iA; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1715249461;
	bh=2LnYN9nc3SQsqAASkrGVaJVc2LgnjoBJzHW2Q9QiI6Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=0Hzv31iAsIm4B1HeTQAjmmQCSI3i7Ksjvh28OlgI0QFbqUVIBBggMoVuDGJoM2xzR
	 NRQF7Opxi8NtCObvbptm0TeTTCo5k7Br/nCEc8PmhaSOBwxL9MYvOxU4Df28dAJe8D
	 JidG8I/KjROo53PimQ71rzlTgYjHTsddh1uXyD1kT6rWty2Zw6conx5jodeW/0+5Ux
	 8RnDQloSkFHNRuNYp2FF5Q+uoKmfVREVGm0Cbwj/X5eC4w/AYcodYw9Tp0nKVBGSs7
	 RFPZPfb6E8TWevSntJJGzeyIOVfwHTdZ6wGLOYWGo7GGHmqqRuL6tNudvc70fKqfWK
	 AFt6QgH5hAqGQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 58C7B3780627;
	Thu,  9 May 2024 10:11:00 +0000 (UTC)
Message-ID: <a9980df7-7d65-4818-8dd3-b056ba5ac566@collabora.com>
Date: Thu, 9 May 2024 12:10:59 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Aw: Re: [RFC v1 5/5] arm64: dts: mediatek: Add mt7986 based
 Bananapi R3 Mini
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Eric Woudstra <ericwouds@gmail.com>, Tianling Shen <cnsztl@immortalwrt.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Tianling Shen <cnsztl@gmail.com>
References: <20240505164549.65644-1-linux@fw-web.de>
 <20240505164549.65644-6-linux@fw-web.de>
 <a4099612-a4ae-4211-9674-c7053d2a995a@collabora.com>
 <3E013BA7-0264-4AC3-B677-BDD16B1F8D90@public-files.de>
 <a18a10e5-42e1-4302-b9f3-43c6174e2cf9@collabora.com>
 <trinity-2158d675-7049-4432-b925-6ace44401aa0-1715192732273@3c-app-gmx-bs02>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <trinity-2158d675-7049-4432-b925-6ace44401aa0-1715192732273@3c-app-gmx-bs02>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 08/05/24 20:25, Frank Wunderlich ha scritto:
> Hi
> 
>> Gesendet: Dienstag, 07. Mai 2024 um 15:35 Uhr
>> Von: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
>>
>> Il 06/05/24 18:00, Frank Wunderlich ha scritto:
> 
>>>>> +	fan: pwm-fan {
>>>>> +		compatible = "pwm-fan";
>>>>> +		#cooling-cells = <2>;
>>>>> +		/* cooling level (0, 1, 2) - pwm inverted */
>>>>> +		cooling-levels = <255 96 0>;
>>>>
>>>> Did you try to actually invert the PWM?
>>>>
>>>> Look for PWM_POLARITY_INVERTED ;-)
>>>
>>> Mtk pwm driver does not support it
>>>
>>> https://elixir.bootlin.com/linux/latest/source/drivers/pwm/pwm-mediatek.c#L211
>>>
>>
>> You're right, sorry - I confused the general purpose PWM controller with the
>> rather specific DISP_PWM controller (which does support polarity inversion).
>>
>> It's good - but I'd appreciate if you can please add a comment stating that
>> the PWM values are inverted in SW because the controller does *not* support
>> polarity inversion... so that next time someone looks at this will immediately
>> understand what's going on and why :-)
> 
> so i would change comment like this:
> 
> 		/* cooling level (0, 1, 2)
> 		 * signal is inverted on board
> 		 * mtk pwm driver does not support
> 		 * PWM_POLARITY_INVERTED */
> 

There you go:

/*
  * The signal is inverted on this board and the general purpose
  * PWM HW IP in this SoC does not support polarity inversion.
  */
/* Cooling level < 0  1  2> */
cooling-levels = <255 96 0>;



>>>>> +		pwms = <&pwm 0 10000>;
>>>>> +		status = "okay";
>>>>> +	};
>>>>> +
>>>>> +	phy14: ethernet-phy@14 {
> ...
>>>>> +		interrupts-extended = <&pio 48 IRQ_TYPE_EDGE_FALLING>;
>>>>> +		reset-gpios = <&pio 49 GPIO_ACTIVE_LOW>;
>>>>> +		reset-assert-us = <10000>;
>>>>> +		reset-deassert-us = <20000>;
>>>>> +		phy-mode = "2500base-x";
>>>>> +		full-duplex;
>>>>> +		pause;
>>>>> +		airoha,pnswap-rx;
>>>>> +
>>>>> +		leds {
>>>>> +			#address-cells = <1>;
>>>>> +			#size-cells = <0>;
>>>>> +
>>>>> +			led@0 { /* en8811_a_gpio5 */
>>>>> +				reg = <0>;
>>>>> +				color = <LED_COLOR_ID_YELLOW>;
>>>>> +				function = LED_FUNCTION_LAN;
>>>>> +				function-enumerator = <1>;
>>>>
>>>> Why aren't you simply using a label?
>>>
>>> You mean the comment? I can add it of course like for regulators.
>>>
>>
>> I mean in place of the function-enumerator... that's practically used to
>> distinguish between instances, it's not too common to see it, and usually
>> "label" replaces exactly that - just that, instead of a different number,
>> it gets a different name with no (usually) meaningless numbers :-)
> 
> as far as i understand using label also makes "function" property useless, after discussing
> this with eric i would drop both on all 4 places by labels like these:
> 
> label = "yellow-lan";
> label = "green-lan";
> ...
> 
> not sure if we should drop color property too...
> 

I'm looking at the leds binding (leds/common.yaml) right now.

My suggestion of using 'label' was actually wrong - and your devicetree was
actually right!!! (apart from the default-trigger that may not work)

Infact, the documentation says, in brief:

- function-enumerator is ignored if label is present
- function doesn't say that gets ignored
- color doesn't say that gets ignored
- label says:
   - If not present -> get string from node name
   - function-enumerator ignored
   - This property is deprecated

...but the 'label' binding does not say 'deprecated: true', which is something
that must be fixed!


So, I'm sorry for the confusion, the noise and the useless loss of time around
this - you can keep the LED nodes as they are, and that's a lesson for the future
me reviewing another node like this one.

P.S.: This shouldn't have been a RFC, as the patches are more than RFC quality!!!

Cheers,
Angelo

>>>>> +				default-state = "keep";
>>>>> +				linux,default-trigger = "netdev";
>>>>> +			};
>>>>> +			led@1 { /* en8811_a_gpio4 */
>>>>> +				reg = <1>;
>>>>> +				color = <LED_COLOR_ID_GREEN>;
>>>>> +				function = LED_FUNCTION_LAN;
>>>>> +				function-enumerator = <2>;
>>>>> +				default-state = "keep";
>>>>> +				linux,default-trigger = "netdev";
>>>>> +			};
>>>>> +		};
>>>>> +	};
>>>>> +
>>>>> +	phy15: ethernet-phy@15 {
>>>>> +		reg = <15>;
>>>>
>>>> Same here.
>>>>
>>>> Cheers,
>>>> Angelo
> 
> regards Frank


