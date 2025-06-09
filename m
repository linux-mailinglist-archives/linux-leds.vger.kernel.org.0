Return-Path: <linux-leds+bounces-4762-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B8EAD2784
	for <lists+linux-leds@lfdr.de>; Mon,  9 Jun 2025 22:25:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC0EE7A2B4C
	for <lists+linux-leds@lfdr.de>; Mon,  9 Jun 2025 20:24:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FB9D1FDE22;
	Mon,  9 Jun 2025 20:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="Xf0gOY8A"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-81.smtpout.orange.fr [80.12.242.81])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AE74C8E;
	Mon,  9 Jun 2025 20:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749500738; cv=none; b=ZWDWyJIiaIyn2stcRzcENgv4pO6xlMMLmEDnqURp3b6g/fD7EYSwqkIqC6pwSUql3E5rD3QEFghvpx02maFP/LX2pX/holi6L054nVoozRuaG0Bm3sAMAxLZCq3cQgsKqRsVV/XYTCRcQjj9MEv+MOcN64l4wUhGHZM2pk6Lj4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749500738; c=relaxed/simple;
	bh=neykw9liQVytRoGZuEEGHa4BpafwF9rx47dmoEYCesI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gjw3OJYW5ICtbTRI56jGyvmHxWI9OZ0kuA5NEmMUzNT4GzXV0B4oKLscdyyIT+N31dQlKD77Wl5NszRWjatCx1YQOrA9jC6B5TRhbrU6b0nfgVq06i/E3BSGjxYVegdqDJ8555X+sQZb1SDP6tsbQ0dnQ05Y1BzGWGYAVdlATO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=Xf0gOY8A; arc=none smtp.client-ip=80.12.242.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
 ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id Oj2futxgVlRx3Oj2fuiTz9; Mon, 09 Jun 2025 22:24:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1749500665;
	bh=IQIuJHfs8taCs8zFUj6uvvuirzSgRKqYrdzbN1Y9r10=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=Xf0gOY8AveQEznRRYCwXk4iA9aD6K/5QpsvUyg1C+9a43t8k2ZYvrEJg4vX+HT8Pq
	 rNmwRT5BUoDlvvj/p8On1kHATvwTQ7jgRlTT/Ei72d1SHe3PuCAJtwx2NFd4kKNbZn
	 jic1anXo5GsUT20ckZbcIxKuulTJemqhKdPQg6wctyVuiw4UjsRHf1UkHu70Dg+T+9
	 4gaDTRuT/6t0BkciwI1/Su4uGENXPBoa0gsCixD0oBCZqC1W+5pv1BkULq2VRAMQNK
	 mHKqNs4OBFFpUpcrCgFW1xuGfTbBcbgHjC0BfDU56jWsvPzzvh17HJfEF4kTmM74Pq
	 sIVo54hFldMWA==
X-ME-Helo: [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Mon, 09 Jun 2025 22:24:25 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
Message-ID: <321eceac-3862-4c50-bcbc-84e74514f2a2@wanadoo.fr>
Date: Mon, 9 Jun 2025 22:24:23 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] leds: as3668: Driver for the ams Osram 4-channel
 i2c LED driver
To: Lukas Timmermann <linux@timmermann.space>, lee@kernel.org,
 pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250608231854.75668-1-linux@timmermann.space>
 <20250608231854.75668-3-linux@timmermann.space>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250608231854.75668-3-linux@timmermann.space>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 09/06/2025 à 01:18, Lukas Timmermann a écrit :
> Since there were no existing drivers for the AS3668 or related devices,
> a new driver was introduced in a separate file. Similar devices were
> reviewed, but none shared enough characteristics to justify code reuse.
> As a result, this driver is written specifically for the AS3668.

Hi

...

> +static int as3668_write_value(struct i2c_client *client, u8 reg, u8 value)
> +{
> +	int err = i2c_smbus_write_byte_data(client, reg, value);
> +
> +	if (err)
> +		dev_err(&client->dev, "error writing to reg 0x%02x, returned %d", reg, err);

Missing \n.

> +
> +	return err;
> +}

...

> +static int as3668_dt_init(struct as3668 *as3668)
> +{
> +	struct device *dev = &as3668->client->dev;
> +	struct as3668_led *led;
> +	struct led_init_data init_data = {};
> +	int err;
> +	u32 reg;
> +	int i = 0;

Unneeded init.

> +
> +	for_each_available_child_of_node_scoped(dev_of_node(dev), child) {
> +		err = of_property_read_u32(child, "reg", &reg);
> +		if (err)
> +			dev_err(dev, "unable to read device tree led reg, err %d", err);

Missing \n.

In this case, we still go on? This looks strange.
What is the value of 'reg' in the later code?

> +
> +		i = reg;
> +
> +		if (i < 0 || i > AS3668_MAX_LEDS) {
> +			dev_err(dev, "unsupported led reg %d\n", i);
> +			return -EOPNOTSUPP;
> +		}
> +
> +		led = &as3668->leds[i];
> +		led->fwnode = of_fwnode_handle(child);
> +
> +		led->num = i;
> +		led->chip = as3668;
> +
> +		led->cdev.max_brightness = U8_MAX;
> +		led->cdev.brightness_get = as3668_brightness_get;
> +		led->cdev.brightness_set = as3668_brightness_set;
> +
> +		init_data.fwnode = led->fwnode;
> +		init_data.default_label = ":";
> +
> +		err = devm_led_classdev_register_ext(dev, &led->cdev, &init_data);
> +		if (err) {
> +			dev_err(dev, "failed to register %d LED\n", i);
> +			return err;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int as3668_probe(struct i2c_client *client)
> +{
> +	u8 chip_id1, chip_id2, chip_serial, chip_rev;
> +	struct as3668 *as3668;
> +
> +	/* Check for sensible i2c address */
> +	if (client->addr != 0x42)
> +		return dev_err_probe(&client->dev, -EFAULT,
> +				     "unexpected address for as3668 device\n");
> +
> +	/* Read identifier from chip */
> +	chip_id1 = as3668_read_value(client, AS3668_CHIP_ID1);
> +
> +	if (chip_id1 != AS3668_CHIP_IDENT)
> +		return dev_err_probe(&client->dev, -ENODEV,
> +				"chip reported wrong id: 0x%02x\n", chip_id1);
> +
> +	/* Check the revision*/

Missing space before */

> +	chip_id2 = as3668_read_value(client, AS3668_CHIP_ID2);
> +	chip_serial = FIELD_GET(AS3668_CHIP_ID2_SERIAL_MASK, chip_id2);
> +	chip_rev = FIELD_GET(AS3668_CHIP_ID2_REV_MASK, chip_id2);
> +
> +	if (chip_rev != AS3668_CHIP_REV1)
> +		dev_warn(&client->dev, "unexpected chip revision\n");
> +
> +	/* Print out information about the chip */
> +	dev_dbg(&client->dev,
> +		"chip_id: 0x%02x | chip_id2: 0x%02x | chip_serial: 0x%02x | chip_rev: 0x%02x\n",
> +		chip_id1, chip_id2, chip_serial, chip_rev);
> +
> +	as3668 = devm_kzalloc(&client->dev, struct_size(as3668, leds, AS3668_MAX_LEDS), GFP_KERNEL);

Why using struct_size()?
as3668 has no flexible array at its end.

Also error handling is missing if the allocation fails.


> +	as3668->client = client;
> +
> +	as3668_dt_init(as3668);

as3668_dt_init() may return an error.
Missing error handling?

> +
> +	/* Initialize the chip */
> +	as3668_write_value(client, AS3668_CURRX_CONTROL, 0x55);
> +	as3668_write_value(client, AS3668_CURR1, 0x00);
> +	as3668_write_value(client, AS3668_CURR2, 0x00);
> +	as3668_write_value(client, AS3668_CURR3, 0x00);
> +	as3668_write_value(client, AS3668_CURR4, 0x00);
> +
> +	return 0;
> +}

...

CJ

