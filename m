Return-Path: <linux-leds+bounces-2783-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE6997D71E
	for <lists+linux-leds@lfdr.de>; Fri, 20 Sep 2024 16:54:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA75B1F24C47
	for <lists+linux-leds@lfdr.de>; Fri, 20 Sep 2024 14:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CB1C17C21C;
	Fri, 20 Sep 2024 14:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hxuv2Ujr"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4421F17BED6;
	Fri, 20 Sep 2024 14:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726844091; cv=none; b=Wql/Y9GOioWPhc5youNFJjjErb9JpHxIXR+woWMqTgSDlyDlaUZfMdmakShMc2LIrg7LaogXG1gWY1bPX+p5ZcuyEZ1KVe8MZGTer9w4K6mQC2P1de0SBg8l0eC4EGVPBYp64vEXGpWbEIBTIYEiuyonYoltG5Wwf6dLj0FDC/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726844091; c=relaxed/simple;
	bh=6BY1Yd9JN+P7E4fi5RFlhBdrQPiO3pKnc2LtEfmsSFU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bRkZ54h77cmj0qjyyyr3wPyQmJtkOq6iG2qG9rZud77SrNwkpHkTopFj6KxUkLAIqOVbftr3JXC1sRghInNaZESYHE7MHQrSwbSytis1yJk4zbKODlMls1Gp2KJWwOf+Jxf+Fh7eRPwVOJ0GKMA6lPzhgmEOD+fbMyryNGQjKkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hxuv2Ujr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FED8C4CEC3;
	Fri, 20 Sep 2024 14:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726844090;
	bh=6BY1Yd9JN+P7E4fi5RFlhBdrQPiO3pKnc2LtEfmsSFU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Hxuv2Ujr0kvZaFTvMOM+dmw/5oor/1iIhmSFJUPW2HAPQx03r0fAbwK5l2OVN/mr1
	 hp+MSeJO2Mp1NF4X/7VUuOhO50SraDVczGsiuOo1MY/0iOwz/bhlYInAPyCAxUOp9n
	 qisHLdTD2VryovRfbYTvpZZuN6/LvegFV6jy+qC2bTRC2dmr9nJA6U9f0bjXD1nRQc
	 GsQk/iqZcflXndeYfC8tDoUhEcZpieL3QAaFNxtF01QxiB/Wnx2p5DoMgM+Cy59V80
	 WpX6oCs0leNi+pRpTDl0JQzFTg/HLWsj0ggyoHj/T3Lt/SugZfMupSHEOSXBzfVWMi
	 H1X5XXYJ8kK+Q==
Message-ID: <d369aaa0-b14a-4eb3-97bd-b61188d973ec@kernel.org>
Date: Fri, 20 Sep 2024 16:54:44 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH leds v3 05/11] dt-bindings: leds: cznic,turris-omnia-leds:
 Allow interrupts property
To: =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 linux-leds@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, soc@kernel.org,
 Gregory CLEMENT <gregory.clement@bootlin.com>, arm@kernel.org,
 Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
References: <20240913123103.21226-1-kabel@kernel.org>
 <20240913123103.21226-6-kabel@kernel.org>
 <rchpwlmgzsoj37oz6plzqcyxdyzpcdqtpmzik2gcflakeca3rm@vcdrovzs4nzh>
 <wn6mj233oqouxbrbogpf27w5bdybukoblbold6gk25fdfmy5j2@dlzxkh7whlzw>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <wn6mj233oqouxbrbogpf27w5bdybukoblbold6gk25fdfmy5j2@dlzxkh7whlzw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/09/2024 09:08, Marek Behún wrote:
> On Mon, Sep 16, 2024 at 04:33:13PM +0200, Krzysztof Kozlowski wrote:
>> On Fri, Sep 13, 2024 at 02:30:57PM +0200, Marek Behún wrote:
>>> Extend the cznic,turris-omnia-leds binding with interrupts property,
>>> specifying the global LED brightness changed by button press interrupt.
>>>
>>> Signed-off-by: Marek Behún <kabel@kernel.org>
>>> ---
>>>  .../devicetree/bindings/leds/cznic,turris-omnia-leds.yaml | 8 ++++++++
>>>  1 file changed, 8 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml b/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
>>> index 34ef5215c150..f52f6304c79e 100644
>>> --- a/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
>>> +++ b/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
>>> @@ -23,6 +23,12 @@ properties:
>>>      description: I2C slave address of the microcontroller.
>>>      maxItems: 1
>>>  
>>> +  interrupts:
>>> +    description:
>>> +      Specifier for the global LED brightness changed by front button press
>>> +      interrupt.
>>
>> This "front button press" concerns me that you just hooked here
>> gpio-key. Are you sure that this is the physical interrupt line going to
>> this device?
> 
> No no no, that is a different interrupt from the gpio-key.
> 
> The button can be configure in two modes:
> 
> - it can act like a GPIO to the CPU, forwarding press and release events
>   via the GPIO chip (so button press it is handled by CPU)
>   - can be set with
>       echo cpu >/sys/bus/i2c/devices/1-002a/front_button_mode
>   - pressing it will generate the INT_BUTTON_PRESSED interrupt from the
>     MCU
> 
> - it can change LED panel brightness (so button press is handled by MCU)
>   - this is the default mode, configured after boot
>   - can be set with
>       echo mcu >/sys/bus/i2c/devices/1-002a/front_button_mode
>   - pressing it will generate the INT_BRIGHTNESS_CHANGED interrupt
> 
> The INT_BUTTON_PRESSED and INT_BRIGHTNESS_CHANGED interrupt semantically
> different (and also literally, they are at different bits). See
>   https://gitlab.nic.cz/turris/hw/omnia_hw_ctrl/-/blob/master/src/drivers/i2c_iface.h?ref_type=heads#L289-L321

That's fine, thanks for the explanation.

Best regards,
Krzysztof


