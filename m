Return-Path: <linux-leds+bounces-2248-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DD092DE26
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jul 2024 03:51:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0EC2D1F220A4
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jul 2024 01:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A8788830;
	Thu, 11 Jul 2024 01:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="U4P+gjBP"
X-Original-To: linux-leds@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8DFBE5A;
	Thu, 11 Jul 2024 01:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720662701; cv=none; b=KGd97wcBSFNuqEIq4xz9zCKuP7DCD1EdZ9ck8TvpzCPLIQS8vb4/RP0O4oSRigr+M39iPiIcc3bdvAaT7j1rJMbTEFS2+RJMb1TVTRzS259PPORERG1RMC4f+wV1LADrv6J915dgDzvNwhKrFa3Oj0lz3/gd/Fa9jMqmGMIPfoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720662701; c=relaxed/simple;
	bh=fL4FZ4hZXaG4km0dzBkdmtfNkxTIYuyoHOEm0Cgnkpc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IR0gTwg6s8XoGoKXbuQS52w76z0ED1LuVejK6UB+Q9ZDVDY7OJljK2fulNh/rm01+LJc9sLh52MhQBraIuUlD6XpB5jif4iCBjls7scpQxUwugO3iI1PHRjJ4WqErL/io8DhyrL6AozBHHcFHCNuaD9dAsWhN3kdX84LCTzWFJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=U4P+gjBP; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id B0E3C88709;
	Thu, 11 Jul 2024 03:51:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1720662696;
	bh=7Zr7gH5qHOUFxru02iy24qF4XGxxRzCJESt0mNpg1NI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=U4P+gjBP8n2RYiyXL8QSo/IDW/W69FdB4qDPlKGtF97q2aUeueiLeHB7KxTgBXC5c
	 jWGTo0fJAaM3CR7G/LLt5q++U0IHcmQvOWYKyxjjUHMTZloKTZmhGgUsZhLpdwJqMI
	 64FF+qh+ovPI5V7ImpD8EAh2AzHd9X/15oZnMEIJicl/+7XR0p2RXm/CoRZSMfOA2y
	 /eJcL+c5FrX1wS9ci5Qo0GfHeKzlK69Y4YHJGSsjLez8F+IuCC/Vq98kh3KSd8l+TM
	 FC/CraGfHz/9o9Z0FxYgwnc6JkQ33+wWY/XS6ItUt//4ZzRq84/l/gKmiegkDWZhKT
	 JI/nB5w1OkR6w==
Message-ID: <fe6d1df7-eefc-4e4e-9f3c-989f982b0daa@denx.de>
Date: Thu, 11 Jul 2024 03:29:28 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] leds: leds-pca995x: Add support for NXP PCA9956B
To: pieterjanca@gmail.com, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Isai Gaspar <isaiezequiel.gaspar@nxp.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240710-pca995x-v2-0-8fafb6e4b7d5@gmail.com>
 <20240710-pca995x-v2-2-8fafb6e4b7d5@gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240710-pca995x-v2-2-8fafb6e4b7d5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 7/10/24 4:32 PM, Pieterjan Camerlynck via B4 Relay wrote:

[...]

> @@ -52,9 +68,9 @@ struct pca995x_led {
>   };
>   
>   struct pca995x_chip {
> +	const struct pca995x_chipdef *chipdef;
>   	struct regmap *regmap;
> -	struct pca995x_led leds[PCA995X_MAX_OUTPUTS];
> -	int btype;
> +	struct pca995x_led leds[];

Please increase PCA995X_MAX_OUTPUTS to 24 and avoid this variable length 
array at the end.

>   };
>   
>   static int pca995x_brightness_set(struct led_classdev *led_cdev,
> @@ -62,10 +78,11 @@ static int pca995x_brightness_set(struct led_classdev *led_cdev,
>   {
>   	struct pca995x_led *led = ldev_to_led(led_cdev);
>   	struct pca995x_chip *chip = led->chip;
> +	const struct pca995x_chipdef *chipdef = chip->chipdef;
>   	u8 ledout_addr, pwmout_addr;
>   	int shift, ret;
>   
> -	pwmout_addr = (chip->btype ? PCA9955B_PWM0 : PCA9952_PWM0) + led->led_no;
> +	pwmout_addr = (chipdef->pwm_base) + led->led_no;

Parenthesis around (chipdef->pwm_base) not needed.

>   	ledout_addr = PCA995X_LEDOUT0 + (led->led_no / PCA995X_OUTPUTS_PER_REG);
>   	shift = PCA995X_LDRX_BITS * (led->led_no % PCA995X_OUTPUTS_PER_REG);
>   
> @@ -101,24 +118,24 @@ static const struct regmap_config pca995x_regmap = {
>   
>   static int pca995x_probe(struct i2c_client *client)
>   {
> -	struct fwnode_handle *led_fwnodes[PCA995X_MAX_OUTPUTS] = { 0 };
>   	struct fwnode_handle *np, *child;
>   	struct device *dev = &client->dev;
> +	const struct pca995x_chipdef *chipdef;
>   	struct pca995x_chip *chip;
>   	struct pca995x_led *led;
> -	int i, btype, reg, ret;
> +	int reg, ret;
>   
> -	btype = (unsigned long)device_get_match_data(&client->dev);
> +	chipdef = device_get_match_data(&client->dev);
>   
>   	np = dev_fwnode(dev);
>   	if (!np)
>   		return -ENODEV;
>   
> -	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
> +	chip = devm_kzalloc(dev, struct_size(chip, leds, chipdef->num_leds), GFP_KERNEL);

This won't be needed once you fix up PCA995X_MAX_OUTPUTS above.

>   	if (!chip)
>   		return -ENOMEM;
>   
> -	chip->btype = btype;
> +	chip->chipdef = chipdef;
>   	chip->regmap = devm_regmap_init_i2c(client, &pca995x_regmap);
>   	if (IS_ERR(chip->regmap))
>   		return PTR_ERR(chip->regmap);

It is starting to look pretty good, thanks !

