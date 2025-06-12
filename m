Return-Path: <linux-leds+bounces-4795-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 14520AD7C8A
	for <lists+linux-leds@lfdr.de>; Thu, 12 Jun 2025 22:37:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6C8A3A4CE5
	for <lists+linux-leds@lfdr.de>; Thu, 12 Jun 2025 20:37:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC4CF2D660E;
	Thu, 12 Jun 2025 20:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="LxkrIfVV"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-74.smtpout.orange.fr [80.12.242.74])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B072D6616;
	Thu, 12 Jun 2025 20:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749760620; cv=none; b=iSd5LgHkRzkC1lJ2LhK/bLkhNTJtZoAPG2aIdviPBxpeHAc/6M4VUWG2Ir9geCZUfM0EQmhI1RSWZqmtg3OPOoUlReHK+d+v8yQeuglCK6zaj5mpCeEjcDnwZi3YTkCoGl+PcnCK67H+t4PRoHhVge4E96yYPgl4pXfx/Nhm+CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749760620; c=relaxed/simple;
	bh=H8u1w/YwStaUJxudyE2L3/g/KCe1Lq6vTTC/Fx7X2wI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Srqx2mipeCBcHhKlKNlnTMlu1dRY/uqfz2rcqGyjRr5uV5cyS+rG1EiQy1tCEFr1IXMBsWM3iv87XuYLuTWE0kKoSP1tis6PDkGsQFNSsGrN8j0xvcKbasLR5TsB50dx4RPSzRnhbQ7yVTCVffcw41UJOzZPbSAzspzX5k1/M0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=LxkrIfVV; arc=none smtp.client-ip=80.12.242.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
 ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id PoWIuYWF3h2MlPoWJutI1a; Thu, 12 Jun 2025 22:27:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1749760052;
	bh=30F9MeODJaJtiCyPTKPIaDBgYSsnYVpZ0EqQQiVnKc4=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=LxkrIfVVst3GNiCIT4KgzwDqBS7GHuyxt1F86CTNcjmtrqWPq33ea8kN0AFZ79R1J
	 OrSf46HuFOMk24s6lePYsB7lz+Nd2k8lLOHWUj/tG/uBUBjQX9P8r9FPX268lSo+VH
	 NeNSbLfs4Hk+UYZn9E0s3zR/R98L2WllTR2hieQPjAJ+nyKdk/CmL6oKx/60MtMg7m
	 sna5jFMu7AO5g/194HqUqmj8Tx16xrjoFZmcQR0dogrwNzQ5UPt6zKArBLmeUeq4cc
	 0NLouo5u4hMqCHaXj8/6nnCLcrq86m+ZsQv/Kj7yubTx7rQRQsUYRsUpaDSd6+8Dtm
	 xM5bAJeS6ZrIQ==
X-ME-Helo: [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Thu, 12 Jun 2025 22:27:32 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
Message-ID: <5e131f07-9753-4d2f-a043-35751c278a63@wanadoo.fr>
Date: Thu, 12 Jun 2025 22:27:30 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] leds: as3668: Driver for the ams Osram 4-channel
 i2c LED driver
To: Lukas Timmermann <linux@timmermann.space>, lee@kernel.org,
 pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250611083151.22150-1-linux@timmermann.space>
 <20250611083151.22150-3-linux@timmermann.space>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250611083151.22150-3-linux@timmermann.space>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 11/06/2025 à 10:31, Lukas Timmermann a écrit :
> Since there were no existing drivers for the AS3668 or related devices,
> a new driver was introduced in a separate file. Similar devices were
> reviewed, but none shared enough characteristics to justify code reuse.
> As a result, this driver is written specifically for the AS3668.
> 
> Signed-off-by: Lukas Timmermann <linux@timmermann.space>

Hi,

first, I should that you should wait longer before sending each new 
version, so that you can collect more feedback.

> ---
>   MAINTAINERS                |   1 +
>   drivers/leds/Kconfig       |  13 +++
>   drivers/leds/Makefile      |   1 +
>   drivers/leds/leds-as3668.c | 204 +++++++++++++++++++++++++++++++++++++
>   4 files changed, 219 insertions(+)
>   create mode 100644 drivers/leds/leds-as3668.c

...

> +static int as3668_dt_init(struct as3668 *as3668)
> +{
> +	struct device *dev = &as3668->client->dev;
> +	struct as3668_led *led;
> +	struct led_init_data init_data = {};
> +	int err;
> +	u32 reg;
> +
> +	for_each_available_child_of_node_scoped(dev_of_node(dev), child) {
> +		err = of_property_read_u32(child, "reg", &reg);
> +		if (err) {
> +			dev_err(dev, "unable to read device tree led reg, err %d\n", err);

as3668_dt_init() is only called from the probe. Sometimes maintainers 
prefer using "return dev_err_probe()" in such a case, to have less 
verbose code.
(I don't know if it is the case for the leds subsystem)

> +			return err;
> +		}
> +
> +		if (reg < 0 || reg > AS3668_MAX_LEDS) {
> +			dev_err(dev, "unsupported led reg %d\n", reg);
> +			return -EOPNOTSUPP;

Same.

> +		}
> +
> +		led = &as3668->leds[reg];
> +		led->fwnode = of_fwnode_handle(child);
> +
> +		led->num = reg;
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
> +			dev_err(dev, "failed to register %d LED\n", reg);
> +			return err;

Same.

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
> +	/* Check the revision */
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
> +	as3668 = devm_kzalloc(&client->dev, sizeof(*as3668), GFP_KERNEL);
> +

Unneeded new line.

> +	if (!as3668)
> +		return -ENOMEM;
> +
> +	as3668->client = client;
> +	int err = as3668_dt_init(as3668);

Would be better, IMHO, if err was declared at the top of the function.

> +

Unneeded new line.

> +	if (err) {
> +		dev_err(&client->dev, "failed to initialize device, err %d\n", err);

return dev_err_probe() to be consistent with the code above.

> +		return err;
> +	}
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

