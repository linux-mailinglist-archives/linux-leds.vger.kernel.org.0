Return-Path: <linux-leds+bounces-1638-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE3B8C0E3E
	for <lists+linux-leds@lfdr.de>; Thu,  9 May 2024 12:35:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D77DE283AC4
	for <lists+linux-leds@lfdr.de>; Thu,  9 May 2024 10:35:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D2A312E1E3;
	Thu,  9 May 2024 10:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="VVkEIbzp"
X-Original-To: linux-leds@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB24B1361;
	Thu,  9 May 2024 10:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715250943; cv=none; b=gHaAGRRJ5RcROroWUTr501RXkod3n26w2oVnc5lsRYQnb8yFvEeajjsSwCaMhCbOJ7NZtd0kDnRM/R20KZE6/sJ5MjwHjzHsYHfyoaTMJYc1kw2PL/+NP/22KLLeS8jV3rbe44hqY1i+eou5q0UId9h8MF9ASVnDTrnz66GZfaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715250943; c=relaxed/simple;
	bh=yUFjn5LgIseSlP5T8cF8o6oSVyNEeYFPfa85RpGltZQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IOp19kWGo+rSlM1dx8RhInA9zWNwQgSorTAQdoVPBu9Vd2c+6lsi5g30e7zQPqJEZZJJ9LtFBDejKOJ9gQEXahjh9d0mjvXcVUcC6E+h8XrPVnKuggBwrYUNn6j2s/0V9ZNFwdTznRLxtUqJSpNZFjofslSpcy7fkaeGouQAKHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=VVkEIbzp; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1715250939;
	bh=yUFjn5LgIseSlP5T8cF8o6oSVyNEeYFPfa85RpGltZQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VVkEIbzpWZBvoo+AGxYiBrxmlZHSO7kgiZISU74YaiehKK0foNrq9ESvOxV8mahIW
	 8+BI/miaCR5Sl3n9FUKFLwESCae0sbqwHikuPkM+WfPbC+ucFS+nV+p5sz+KSWMuGx
	 Ghdt5pLACOwnT5V9vKF+9vfg+Cy18gM3JAsk/snehyXICDAeqgZ1xPJO5ER9IBlakA
	 CECayktcd1COsS9C7QI+gOh5UIR6PsXzgUSGlQHIpD6vRbKGTEwkXmlw2t7P1Tnyr/
	 NQU+73paDKP+YVWwXu/dgYfqjduYUJOX+rtZCd2KFMy+IdPhDTHQMocULWZy+HlREA
	 9oS/v48nqW5nw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id EE0EC3782174;
	Thu,  9 May 2024 10:35:37 +0000 (UTC)
Message-ID: <708ed735-1666-4da3-8d8f-d0ba073f6360@collabora.com>
Date: Thu, 9 May 2024 12:35:37 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Aw: Re: [RFC v1 5/5] arm64: dts: mediatek: Add mt7986 based
 Bananapi R3 Mini
To: Frank Wunderlich <linux@fw-web.de>,
 Frank Wunderlich <frank-w@public-files.de>
Cc: Rob Herring <robh@kernel.org>,
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
 <a9980df7-7d65-4818-8dd3-b056ba5ac566@collabora.com>
 <7859DAB9-107F-432D-AA3D-0F54AE0E30D5@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <7859DAB9-107F-432D-AA3D-0F54AE0E30D5@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 09/05/24 12:30, Frank Wunderlich ha scritto:
> Am 9. Mai 2024 12:10:59 MESZ schrieb AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>:
>> Il 08/05/24 20:25, Frank Wunderlich ha scritto:
>>> Hi
>>>
>>>> Gesendet: Dienstag, 07. Mai 2024 um 15:35 Uhr
>>>> Von: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
>>>>
>>>> Il 06/05/24 18:00, Frank Wunderlich ha scritto:
>>>
>>>>>>> +	fan: pwm-fan {
>>>>>>> +		compatible = "pwm-fan";
>>>>>>> +		#cooling-cells = <2>;
>>>>>>> +		/* cooling level (0, 1, 2) - pwm inverted */
>>>>>>> +		cooling-levels = <255 96 0>;
>>>>>>
>>>>>> Did you try to actually invert the PWM?
>>>>>>
>>>>>> Look for PWM_POLARITY_INVERTED ;-)
>>>>>
>>>>> Mtk pwm driver does not support it
>>>>>
>>>>> https://elixir.bootlin.com/linux/latest/source/drivers/pwm/pwm-mediatek.c#L211
>>>>>
>>>>
>>>> You're right, sorry - I confused the general purpose PWM controller with the
>>>> rather specific DISP_PWM controller (which does support polarity inversion).
>>>>
>>>> It's good - but I'd appreciate if you can please add a comment stating that
>>>> the PWM values are inverted in SW because the controller does *not* support
>>>> polarity inversion... so that next time someone looks at this will immediately
>>>> understand what's going on and why :-)
>>>
>>> so i would change comment like this:
>>>
>>> 		/* cooling level (0, 1, 2)
>>> 		 * signal is inverted on board
>>> 		 * mtk pwm driver does not support
>>> 		 * PWM_POLARITY_INVERTED */
>>>
>>
>> There you go:
>>
>> /*
>> * The signal is inverted on this board and the general purpose
>> * PWM HW IP in this SoC does not support polarity inversion.
>> */
>> /* Cooling level < 0  1  2> */
>> cooling-levels = <255 96 0>;
> 
> Thanks for clearing structure of the comment,but imho actually it is a driver issue (for all mtk SoC). Not sure it is really a hardware limitation. So i would change this to "... and the PWM driver does not support polarity inversion."
> 
>>>>>>> +		pwms = <&pwm 0 10000>;
>>>>>>> +		status = "okay";
>>>>>>> +	};
>>>>>>> +
>>>>>>> +	phy14: ethernet-phy@14 {
>>> ...
>>>>>>> +		interrupts-extended = <&pio 48 IRQ_TYPE_EDGE_FALLING>;
>>>>>>> +		reset-gpios = <&pio 49 GPIO_ACTIVE_LOW>;
>>>>>>> +		reset-assert-us = <10000>;
>>>>>>> +		reset-deassert-us = <20000>;
>>>>>>> +		phy-mode = "2500base-x";
>>>>>>> +		full-duplex;
>>>>>>> +		pause;
>>>>>>> +		airoha,pnswap-rx;
>>>>>>> +
>>>>>>> +		leds {
>>>>>>> +			#address-cells = <1>;
>>>>>>> +			#size-cells = <0>;
>>>>>>> +
>>>>>>> +			led@0 { /* en8811_a_gpio5 */
>>>>>>> +				reg = <0>;
>>>>>>> +				color = <LED_COLOR_ID_YELLOW>;
>>>>>>> +				function = LED_FUNCTION_LAN;
>>>>>>> +				function-enumerator = <1>;
>>>>>>
>>>>>> Why aren't you simply using a label?
>>>>>
>>>>> You mean the comment? I can add it of course like for regulators.
>>>>>
>>>>
>>>> I mean in place of the function-enumerator... that's practically used to
>>>> distinguish between instances, it's not too common to see it, and usually
>>>> "label" replaces exactly that - just that, instead of a different number,
>>>> it gets a different name with no (usually) meaningless numbers :-)
>>>
>>> as far as i understand using label also makes "function" property useless, after discussing
>>> this with eric i would drop both on all 4 places by labels like these:
>>>
>>> label = "yellow-lan";
>>> label = "green-lan";
>>> ...
>>>
>>> not sure if we should drop color property too...
>>>
>>
>> I'm looking at the leds binding (leds/common.yaml) right now.
>>
>> My suggestion of using 'label' was actually wrong - and your devicetree was
>> actually right!!! (apart from the default-trigger that may not work)
>>
>> Infact, the documentation says, in brief:
>>
>> - function-enumerator is ignored if label is present
>> - function doesn't say that gets ignored
>> - color doesn't say that gets ignored
>> - label says:
>>   - If not present -> get string from node name
>>   - function-enumerator ignored
>>   - This property is deprecated
>>
>> ...but the 'label' binding does not say 'deprecated: true', which is something
>> that must be fixed!
> 
> Ok,i can try to add the property to binding (independ of this series). Imho label was cleaner than function and function-enumerator...
> 

Oh I sort of agree with you, I liked the label more, as it's more consistent with
everything else... but oh well. :-)

>> So, I'm sorry for the confusion, the noise and the useless loss of time around
>> this - you can keep the LED nodes as they are, and that's a lesson for the future
>> me reviewing another node like this one.
> 
> Don't worry, we are all humas...i missed looking in linux-next for the other binding-patches.
> 
>> P.S.: This shouldn't have been a RFC, as the patches are more than RFC quality!!!
> 
> I sent it as RFC because i had not expected to be merged before next is closed.
> 

Ah at least from my side, no worries... when I see RFC I generally expect to see
"dubious/head-scratching stuff", not "sub-optimal timing to send a patch" :-P

Cheers!
Angelo

>>
>>>>>>> +				default-state = "keep";
>>>>>>> +				linux,default-trigger = "netdev";
>>>>>>> +			};
>>>>>>> +			led@1 { /* en8811_a_gpio4 */
>>>>>>> +				reg = <1>;
>>>>>>> +				color = <LED_COLOR_ID_GREEN>;
>>>>>>> +				function = LED_FUNCTION_LAN;
>>>>>>> +				function-enumerator = <2>;
>>>>>>> +				default-state = "keep";
>>>>>>> +				linux,default-trigger = "netdev";
>>>>>>> +			};
>>>>>>> +		};
>>>>>>> +	};
>>>>>>> +
>>>>>>> +	phy15: ethernet-phy@15 {
>>>>>>> +		reg = <15>;
> 
> 
> regards Frank


