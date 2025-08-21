Return-Path: <linux-leds+bounces-5269-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 37671B2EFEF
	for <lists+linux-leds@lfdr.de>; Thu, 21 Aug 2025 09:44:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C6C074E018B
	for <lists+linux-leds@lfdr.de>; Thu, 21 Aug 2025 07:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E898F283695;
	Thu, 21 Aug 2025 07:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xnsno/W9"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9EB4280CFA;
	Thu, 21 Aug 2025 07:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755762234; cv=none; b=o6SqHwqmMuo0N5HS4Ivoqj2WNoADaQFm+mPpGfAHZ3Enjl+42VkMtivsXspmayoIeGFvjDjCL0Xn2RuPZpzjpA8UM8vXh8EQnL8ZpZJkt+mBijgwWca2zj/WLqeipRDTKDQcLtj1FsUrXXmS9V178b9ECgpHU7mFEVpKgGYddlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755762234; c=relaxed/simple;
	bh=QRaAgtO2NsEXOdRvxvk/uJyZoAj/++rGwCaawiAsY7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kTak74ZGXj4YZAsKXFUdwWBIA9gWGCQbOaKqLhr4dYrivIyWWVreiPif8SYumCRj0Bjai7VpCsWfFOmavTL96BaOGdDTXNerpAmReptCp8gnPvSFpEw5J7F7CMiBUjjF0XM0vULCDqz0qzQf1Sntha0gqEtREjA6ynGXQAI8z9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xnsno/W9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98BBDC113CF;
	Thu, 21 Aug 2025 07:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755762234;
	bh=QRaAgtO2NsEXOdRvxvk/uJyZoAj/++rGwCaawiAsY7s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xnsno/W9bDu347D1bjUwMJDrfgCME/ApmyUC4WdvBF6mpBhPSd73SlT1jDdPCpV8o
	 1ODoJukt4nR8uH3zE/rnCGn/INJAMfEZWYBjjUNn74/NnjWbS1VX1uivg3ZJNrm2d2
	 r9wjVOHmTA9DqDXw/G7lj6LsRVdIUaWOtQFT8GZ8F38+F9oA8rn70w7/Fb5ENZwwho
	 bWoBKpTf2bI8pY7TblcMDH6vcJ72JCv7blTtSXWAE1lHTHkbhayeopubSgrDov4NWl
	 Q/HUmtxsyBNCaNiBJnHCtDFCg/YNs5f8Tg1d96NE/Bu31euV17nnFmmw4muuZzOhOw
	 cayLgxiWUwriQ==
Date: Thu, 21 Aug 2025 09:43:51 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?Q?Jean-Fran=C3=A7ois?= Lessard <jefflessard3@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, 
	Boris Gjenero <boris.gjenero@gmail.com>, Christian Hewitt <christianshewitt@gmail.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Paolo Sabatino <paolo.sabatino@gmail.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v3 3/4] auxdisplay: Add TM16xx 7-segment LED matrix
 display controllers driver
Message-ID: <20250821-passionate-mouse-of-essence-2c5af4@kuoka>
References: <20250820163120.24997-1-jefflessard3@gmail.com>
 <20250820163120.24997-4-jefflessard3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250820163120.24997-4-jefflessard3@gmail.com>

On Wed, Aug 20, 2025 at 12:31:16PM -0400, Jean-Fran=C3=A7ois Lessard wrote:
> +/**
> + * tm16xx_map_seg7_store() - Sysfs: set 7-segment character map (binary =
blob)
> + * @dev: pointer to device
> + * @attr: device attribute (unused)
> + * @buf: new mapping (must match size of map_seg7)
> + * @cnt: buffer length
> + *
> + * Return: cnt on success, negative errno on failure
> + */
> +static ssize_t tm16xx_map_seg7_store(struct device *dev,
> +				     struct device_attribute *attr,
> +				     const char *buf, size_t cnt)
> +{
> +	if (cnt !=3D sizeof(map_seg7))
> +		return -EINVAL;
> +	memcpy(&map_seg7, buf, cnt);
> +	return cnt;
> +}
> +
> +static DEVICE_ATTR(value, 0644, tm16xx_value_show, tm16xx_value_store);
> +static DEVICE_ATTR(num_digits, 0444, tm16xx_num_digits_show, NULL);
> +static DEVICE_ATTR(map_seg7, 0644, tm16xx_map_seg7_show, tm16xx_map_seg7=
_store);

Where did you document the ABI?

> +
> +static struct attribute *tm16xx_main_led_attrs[] =3D {
> +	&dev_attr_value.attr,
> +	&dev_attr_num_digits.attr,
> +	&dev_attr_map_seg7.attr,
> +	NULL,
> +};
> +ATTRIBUTE_GROUPS(tm16xx_main_led);
> +

=2E..

> +#if IS_ENABLED(CONFIG_I2C)
> +/**
> + * tm16xx_i2c_probe() - Probe callback for I2C-attached controllers
> + * @client: pointer to i2c_client
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +static int tm16xx_i2c_probe(struct i2c_client *client)
> +{
> +	const struct tm16xx_controller *controller;
> +	struct tm16xx_display *display;
> +	int ret;
> +
> +	controller =3D i2c_get_match_data(client);
> +	if (!controller)
> +		return -EINVAL;
> +
> +	display =3D devm_kzalloc(&client->dev, sizeof(*display), GFP_KERNEL);
> +	if (!display)
> +		return -ENOMEM;
> +
> +	display->client.i2c =3D client;
> +	display->dev =3D &client->dev;
> +	display->controller =3D controller;
> +
> +	i2c_set_clientdata(client, display);
> +
> +	ret =3D tm16xx_probe(display);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +/**
> + * tm16xx_i2c_remove() - Remove callback for I2C-attached controllers
> + * @client: pointer to i2c_client

Please don't ever add comments, especially kerneldocs, for such obvious
driver API. This function cannot be anything else than what you
described. Why? Linux core driver model tells that. You never have to
repeat what Linux core driver model is...

Best regards,
Krzysztof


