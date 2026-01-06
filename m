Return-Path: <linux-leds+bounces-6537-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA86CF7428
	for <lists+linux-leds@lfdr.de>; Tue, 06 Jan 2026 09:17:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 17AB130EBFEB
	for <lists+linux-leds@lfdr.de>; Tue,  6 Jan 2026 08:14:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8231730BB9B;
	Tue,  6 Jan 2026 08:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s8JGHxeW"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5334F30BB89;
	Tue,  6 Jan 2026 08:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767687260; cv=none; b=VHjTiH4zxuC/SGRxKSERGoUWnxB/7rOn2FOW5EUaEgA+XEiXo6EDy8BHhxHKfGlkthzSKE6Bi5jA/bkG741df5LpaYh1M1DcicZYJnYVAbSqucBM9bOSVeNHZy0Njwhv9fuA1wmxVjb/19upOuTSvnULsBSQu5/0bPXfsAdq47c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767687260; c=relaxed/simple;
	bh=as2Azl1Kw8b9r04WKSVSCB4fXooVO6KFifa/UX3c3Tg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i+vnciYnKLvJUcpFKMUl9X751YZZpmtrNirlfaOPQ/gJPIuWOjPiwb0ymna2mgDsd1e1/9n1ceeiT66RwaAXIHvYGjX4II7OnLyDnIvE63gHjd5zXgqkyDEn9UqRYRQ30Li/g+KC9WOulLZvSq7QgGoWVQErqBhFLZ0VEkxBQok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s8JGHxeW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AC50C2BC87;
	Tue,  6 Jan 2026 08:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767687259;
	bh=as2Azl1Kw8b9r04WKSVSCB4fXooVO6KFifa/UX3c3Tg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s8JGHxeWQ4gaUJzJdlSMcmSjlfoWcrzK4PkuScWgRV78bEIsncDf7Nt3ehZoqbK+X
	 hflh3c3by8b7SAA0gK8MegAFar1FMUOTW0M6npGSLNPzKFjMKvffPbjCUzXzSEc9j6
	 zShykMxMFua5lIq+gLT7XoIVcN7ZGa4JxvZqtbsUk4fLSeNdsOLENyoRwifI7nLTro
	 ZLYJaW7dzqSAeTUkTQzPHGikrelRBTsPw1iLXna9CmD5ijfe5ZWZkO4SXIVAHSEsMa
	 kmyoqtO3thtrVcJW7nkuEG+AR7ovzz8rGjI2GPdoS2GZpE4J1St3t3VY5LXCYKfc/e
	 LlZXaILtaJW+w==
Date: Tue, 6 Jan 2026 09:14:17 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Edelweise Escala <edelweise.escala@analog.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] leds: ltc3220: add driver
Message-ID: <20260106-opalescent-wildcat-from-venus-feffa7@quoll>
References: <20260106-ltc3220-driver-v1-0-73601d6f1649@analog.com>
 <20260106-ltc3220-driver-v1-2-73601d6f1649@analog.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260106-ltc3220-driver-v1-2-73601d6f1649@analog.com>

On Tue, Jan 06, 2026 at 01:27:08PM +0800, Edelweise Escala wrote:
> +
> +static int ltc3220_probe(struct i2c_client *client)
> +{
> +	struct ltc3220_state *ltc3220_state;
> +	u8 i = 0;
> +	int ret;
> +
> +	if (!i2c_check_functionality(client->adapter,
> +			I2C_FUNC_SMBUS_BYTE_DATA))

Odd wrapping.

> +		return dev_err_probe(&client->dev, -EIO,
> +				     "SMBUS Byte Data not Supported\n");
> +
> +	ltc3220_state = devm_kzalloc(&client->dev, sizeof(*ltc3220_state), GFP_KERNEL);
> +	if (!ltc3220_state)
> +		return -ENOMEM;
> +
> +	ltc3220_state->client = client;
> +	i2c_set_clientdata(client, ltc3220_state);
> +
> +	if (device_property_read_bool(&client->dev, "adi,quick-write"))
> +		ltc3220_state->command_cfg.quick_write = true;
> +
> +	ret = ltc3220_reset(ltc3220_state, client);
> +	if (ret)
> +		return dev_err_probe(&client->dev, ret,
> +				     "Failed to reset device\n");

Your code is not really readable.

> +
> +	ret = device_property_match_property_string(&client->dev, "adi,force-cpo-level",
> +					   ltc3220_cpo_levels, ARRAY_SIZE(ltc3220_cpo_levels));
> +	if (ret >= 0)
> +		ltc3220_state->command_cfg.force_cpo_level = ret;
> +
> +	ret = ltc3220_set_command(ltc3220_state);
> +	if (ret < 0)
> +		return dev_err_probe(&client->dev, ret,
> +				     "Failed to set command\n");
> +
> +	device_for_each_child_node_scoped(&client->dev, child) {
> +		struct led_init_data init_data = {};
> +		struct ltc3220_uled_cfg *led;
> +		u32 source;
> +
> +		ret = fwnode_property_read_u32(child, "reg", &source);
> +		if (ret)
> +			return dev_err_probe(&client->dev, ret,
> +					     "Couldn't read LED address\n");
> +
> +		if (!source || source > LTC3220_NUM_LEDS)
> +			return dev_err_probe(&client->dev, -EINVAL,
> +					     "LED address out of range\n");
> +
> +		init_data.fwnode = child;
> +		init_data.devicename = "ltc3220";
> +		init_data.devname_mandatory = true;
> +
> +		/* LED node reg/index/address goes from 1 to 18 */
> +		i = source - 1;
> +		led = &ltc3220_state->uled_cfg[i];
> +		led->led_index = i;
> +		led->reg_value = 0;
> +		led->ltc3220_state = ltc3220_state;
> +		led->led_cdev.brightness_set_blocking = ltc3220_set_led_data;
> +		led->led_cdev.brightness_get = ltc3220_get_led_data;
> +		led->led_cdev.max_brightness = 255;
> +		led->led_cdev.blink_set = ltc3220_blink_set;
> +		led->led_cdev.pattern_set = ltc3220_pattern_set;
> +		led->led_cdev.pattern_clear = ltc3220_pattern_clear;
> +
> +		ret = devm_led_classdev_register_ext(&client->dev,
> +						      &led->led_cdev,
> +						      &init_data);
> +		if (ret)
> +			return dev_err_probe(&client->dev, ret,
> +					     "Failed to register LED class device\n");
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id ltc3220_of_match[] = {
> +	{ .compatible = "adi,ltc3220", },
> +	{ .compatible = "adi,ltc3220-1", },

Why do you have this "-1"? Even if this was a real hardware, devices are
clearly compatible based on above.

Best regards,
Krzysztof


