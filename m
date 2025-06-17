Return-Path: <linux-leds+bounces-4829-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB2CADCE73
	for <lists+linux-leds@lfdr.de>; Tue, 17 Jun 2025 15:58:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F6071882114
	for <lists+linux-leds@lfdr.de>; Tue, 17 Jun 2025 13:58:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D1DC2E718E;
	Tue, 17 Jun 2025 13:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ysoft.com header.i=@ysoft.com header.b="RqvNwIGS"
X-Original-To: linux-leds@vger.kernel.org
Received: from uho.ysoft.cz (uho.ysoft.cz [81.19.3.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C65E2E7173;
	Tue, 17 Jun 2025 13:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.19.3.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750168685; cv=none; b=daSKrw7mQ7rvcv2QJbnsKY0ogVPqnG5LczFN3Rmg+VhWxUqRQbeyRgQ0tkHpsa1UmF+vp9uTfbArjpiTX7tGdfmTQ2eyM/FugAMprUgPLz2DGswKsYzB4eXz/OMP5BrN0uP27HkGQedRZx8W7YGg6m4nMRP2Bjt7dbFCHSirsSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750168685; c=relaxed/simple;
	bh=OulGcH1UWVL91nQXXpZ1AohB7T6eGwSLmAiup62xQso=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VEi9DJh1iOdFgtsObSkhQ/Fo15dSBhQEnldaRW1Z7u1xt3p3Wsfijt7y8+xDvgoh8TB3Pi4AvK3ddEe5h3rI9kEjkV303znRvvWZMJX7uCvGsMLVh1o/YgXMbvZskDresZmOMrOHqa1RlRKMPPnXHItGTfuN9/3fbiLWiAB9psc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ysoft.com; spf=pass smtp.mailfrom=ysoft.com; dkim=pass (1024-bit key) header.d=ysoft.com header.i=@ysoft.com header.b=RqvNwIGS; arc=none smtp.client-ip=81.19.3.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ysoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ysoft.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ysoft.com;
	s=20160406-ysoft-com; t=1750168120;
	bh=6L86m2idLx54i+AuHViJVCNmZf9ivZtdqsaOK2Nildk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RqvNwIGSotcdxW9c27bhgyCIf0nJf6SFzdjY9cY1iT2GBR+tq0VRUeS/4S/JoQEEr
	 +/c2EZGTcqtzmVtnZkEommezv4awt1H885fPV57grXBUxL43DRhFEa/jTqH/tauUMR
	 w0wodKpNMfBNP8WBDzVyPq8lZavlxhwIPhKoIjyM=
Received: from [10.1.8.111] (unknown [10.1.8.111])
	by uho.ysoft.cz (Postfix) with ESMTP id C84F1A0246;
	Tue, 17 Jun 2025 15:48:39 +0200 (CEST)
Message-ID: <7139baaf-cfa8-41f3-8870-2337fb6b37a7@ysoft.com>
Date: Tue, 17 Jun 2025 15:48:39 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC RESEND] leds: lp55xx: led-cur property is not properly
 applied to multi-led
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Christian Marangi
 <ansuelsmth@gmail.com>, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250523093142.1498846-1-michal.vokac@ysoft.com>
 <20250612105712.GD381401@google.com>
Content-Language: en-US
From: =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <michal.vokac@ysoft.com>
In-Reply-To: <20250612105712.GD381401@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12. 06. 25 15:48, Lee Jones wrote:
> On Fri, 23 May 2025, Michal Vokáč wrote:
> 
>> Hi,
>>
>> I am trying to wrap my head around the implementation of the multicolor
>> LED support in the lp55xx family drivers.
>>
>> The situation is quite straight forward when each LED is registered
>> and controlled individually but it gets quite messy once you use
>> the multi-color LED binding.
>>
>> I am working with the imx6dl-yapp43-pegasus.dts board (in-tree). There
>> is one RGB LED driven by a LP5562 LED controller. Currently the RGB LED
>> is modeled as three separate LEDs and each of the LEDs has
>> individually tuned led-cur property. I would like to change the device
>> tree and use the multi-led binding to be able to use triggers on a chosen
>> RGB color.
>>
>> When I was experimenting with that, I realized there is something wrong
>> with the colors and identified that the led-cur property is not properly
>> applied in case the multi-led binding is used. What ultimately happens is
>> that the led_current of the first LED in the multi-led group is set to
>> the value of led-cur property of the last LED in the group.
>> All the other LEDs in the group are left with the default reset value
>> of the controller (0xaf in my case).
> 
> Does this help you:
> 
> https://lore.kernel.org/r/20250526-led-fix-v4-1-33345f6c4a78@axis.com
> 

Unfortunately not.

The problem here is that the LP55xx family of LED controllers support
individually tuned current/max current for each channel but the multicolor
LED class driver was not designed with this in mind. Even though it was
actually introduced in the same series with all the relevant changes to
the lp55xx drivers.

The problem starts in lp55xx_of_populate_pdata():

	// One RGB LED connected to the controller = one multiled node = one child.
	num_channels = of_get_available_child_count(np);
	if (num_channels == 0) {
		dev_err(dev, "no LED channels\n");
		return ERR_PTR(-EINVAL);
	}

	// So we allocate space for only one lp55xx_device_config structure.
	cfg = devm_kcalloc(dev, num_channels, sizeof(*cfg), GFP_KERNEL);
	if (!cfg)
		return ERR_PTR(-ENOMEM);

	pdata->led_config = &cfg[0];
	pdata->num_channels = num_channels;
	cfg->max_channel = chip->cfg->max_channel;

Later on in lp55xx_parse_common_child():

	// This is called 3-times (for each LED color in the multi-led node)
	// led_number = 0 for each call (because we have one multiled node)
	// np = led@[0,1,2]
	int ret;

	// Size of the cfg is "1 lp55xx_led_config"
	// led_number = 0 for each call
	// So the name, led_current and max_current struct members are being
	// overwritten until values from the last led@ subnode are stored.
	// This seems buggy to me and we should not do that.
	of_property_read_string(np, "chan-name",
				&cfg[led_number].name);
	of_property_read_u8(np, "led-cur",
			    &cfg[led_number].led_current);
	of_property_read_u8(np, "max-cur",
			    &cfg[led_number].max_current);

	// This part is OK. The reg property (chan_nr) is stored in
	// output_num[num_colors] field member of the cfg structure.
	ret = of_property_read_u32(np, "reg", chan_nr);
	if (ret)
		return ret;

And finally in lp55xx_register_leds():

	// num_channels = 1 (one multi-led node)
	for (i = 0; i < num_channels; i++) {

		/* do not initialize channels that are not connected */
		if (pdata->led_config[i].led_current == 0)
			continue;

		// The pdata->led_config[0].led_current contains the led-cur
		// property value of the last LED from the multi-led node.
		// Here we call the lp55xx_init_led() just once so we initialize
		// just the first LED connected to the controller with a wrong
		//  value. The others are left with their default register values.
		led_current = pdata->led_config[i].led_current;
		each = led + i;
		ret = lp55xx_init_led(each, chip, i);

My first idea was that we need to enhance the lp55xx_led_config structure
so that the led_current and max_current will be fields of [num_colors] size.
It will be also needed to add led_current and max_current members to
the mc_subled structure and the whole led-class-multiclolor.c must be
adapted accordingly.

There is also quite big difference that when the LEDs are registered individually,
max_current and led_current attributes of each LED are available in /sys.
Once you register the RGB LED as a multi-led, only the multi_intensity can be
changed but the current control is gone. But that is a different story.


It is pretty difficult to describe for me. Hopefully you get the idea what
is wrong here.

Best regards,
Michal

