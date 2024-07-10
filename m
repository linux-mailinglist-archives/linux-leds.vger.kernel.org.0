Return-Path: <linux-leds+bounces-2235-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A0592D179
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jul 2024 14:21:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D7E11C23AB9
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jul 2024 12:21:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79360191F8E;
	Wed, 10 Jul 2024 12:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="MlkPk0fJ"
X-Original-To: linux-leds@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805ED189F31;
	Wed, 10 Jul 2024 12:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720614094; cv=none; b=LYVeumTQptjc8vRFLrG9V+PODa5uwz74GTlZhKPcHkASVApfdTmWzu6Cu9zYfFHbV56JF54mGYV4bEmKpSXH9ZN5vRRmBcMChEM1ZdzklfhQrUwUSt5FE2azMiTvl5BfPelRTqX5t0dIcdLb+QvAfSediZPPGQxvoH3Kej4Jnrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720614094; c=relaxed/simple;
	bh=6lcB/GTtcNy9Y7JwxZl+cZSnTrbhAgRl/T3G3uY09jY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JgN+LqiHCSa3QF1S4FtnZVjBj8dOmnUmOMMAkzZ/VdOrumaOhVyXd42EVCcUqU0G26SMY6O48p/9AeTKWF0Pgs7i96F/Xw1MilPVsL69hAshd0nf4fJ7ohsWWTrbDwCoGZRvby6nB29DZ9MtpsT/hAFww7TXR7iIaROWh5e+IIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=MlkPk0fJ; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 1EE5A88680;
	Wed, 10 Jul 2024 14:21:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1720614090;
	bh=bhAWYJWEy4uNUzNHTeq/ur8icdNDQlXB5LyvA4dUs5Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MlkPk0fJC7sx+SpZlPjaH42VQxf6GpsmSf/NTrcJltr7Rf4cKp38wYhUcJUnVp6pH
	 3/oiCwhgWkFXB6RaYmy7uRv7U1qGrVJ0jdjPVGWO3RZj8TdXBG2LCcb9VGlNzo67vS
	 dFCwWkE759WjDlW34gQlGhRY5FUPL0iGVLKjIY6LvGd5qoNP7FeRDMDzN8aUmxypn4
	 Vr/Z5gcqHIO4+bchPX/o0syUe+bHGb+ZVk2Ud8+NNAyAErKNcO9Qd4+jpBYRMrdMj5
	 VNVt20Tr05+tdkQqt+TsU72TE4LezkgSoJKYD29oOTjAI5+F6FjiM41cBp5ZjEI7B8
	 dytuObVUS1ItQ==
Message-ID: <9eea108a-9a8c-4b75-88ea-b1edaca4d46d@denx.de>
Date: Wed, 10 Jul 2024 13:58:19 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] leds: leds-pca995x: Add support for NXP PCA9956B
To: pieterjanca@gmail.com, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Isai Gaspar <isaiezequiel.gaspar@nxp.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240710-pca995x-v1-0-545015603000@gmail.com>
 <20240710-pca995x-v1-2-545015603000@gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240710-pca995x-v1-2-545015603000@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 7/10/24 8:15 AM, Pieterjan Camerlynck via B4 Relay wrote:
> From: Pieterjan Camerlynck <pieterjanca@gmail.com>
> 
> Add support for PCA9956B chip, which belongs to the same family.
> 
> This chip features 24 instead of 16 outputs, so add a chipdef struct to
> deal with the different register layouts.
> 
> Signed-off-by: Pieterjan Camerlynck <pieterjanca@gmail.com>
> ---
>   drivers/leds/leds-pca995x.c | 88 ++++++++++++++++++++++++++-------------------
>   1 file changed, 52 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/leds/leds-pca995x.c b/drivers/leds/leds-pca995x.c
> index 78215dff1499..4cd2828a3f2d 100644
> --- a/drivers/leds/leds-pca995x.c
> +++ b/drivers/leds/leds-pca995x.c
> @@ -19,10 +19,6 @@
>   #define PCA995X_MODE1			0x00
>   #define PCA995X_MODE2			0x01
>   #define PCA995X_LEDOUT0			0x02
> -#define PCA9955B_PWM0			0x08
> -#define PCA9952_PWM0			0x0A
> -#define PCA9952_IREFALL			0x43
> -#define PCA9955B_IREFALL		0x45
>   
>   /* Auto-increment disabled. Normal mode */
>   #define PCA995X_MODE1_CFG		0x00
> @@ -34,17 +30,43 @@
>   #define PCA995X_LDRX_MASK		0x3
>   #define PCA995X_LDRX_BITS		2
>   
> -#define PCA995X_MAX_OUTPUTS		16
>   #define PCA995X_OUTPUTS_PER_REG		4
>   
>   #define PCA995X_IREFALL_FULL_CFG	0xFF
>   #define PCA995X_IREFALL_HALF_CFG	(PCA995X_IREFALL_FULL_CFG / 2)
>   
> -#define PCA995X_TYPE_NON_B		0
> -#define PCA995X_TYPE_B			1
> -
>   #define ldev_to_led(c)	container_of(c, struct pca995x_led, ldev)
>   
> +enum pca995x_type {
> +	pca9952,
> +	pca9955b,
> +	pca9956b,
> +};

This enum shouldn't be needed (see below).

> +struct pca995x_chipdef {
> +	unsigned int num_leds;
> +	u8 pwm_base;
> +	u8 irefall;
> +};
> +
> +static const struct pca995x_chipdef pca995x_chipdefs[] = {

Define three separate static const struct pca995x_chipdef {} , one for 
each chip type ...

> +	[pca9952] = {
> +		.num_leds	= 16,
> +		.pwm_base	= 0x0a,
> +		.irefall	= 0x43,
> +	},
> +	[pca9955b] = {
> +		.num_leds	= 16,
> +		.pwm_base	= 0x08,
> +		.irefall	= 0x45,
> +	},
> +	[pca9956b] = {
> +		.num_leds	= 24,
> +		.pwm_base	= 0x0a,
> +		.irefall	= 0x40,
> +	},
> +};
> +
>   struct pca995x_led {
>   	unsigned int led_no;
>   	struct led_classdev ldev;
> @@ -52,9 +74,9 @@ struct pca995x_led {
>   };
>   
>   struct pca995x_chip {
> +	const struct pca995x_chipdef *chipdef;
>   	struct regmap *regmap;
> -	struct pca995x_led leds[PCA995X_MAX_OUTPUTS];
> -	int btype;
> +	struct pca995x_led leds[];
>   };
>   
>   static int pca995x_brightness_set(struct led_classdev *led_cdev,
> @@ -62,10 +84,11 @@ static int pca995x_brightness_set(struct led_classdev *led_cdev,
>   {
>   	struct pca995x_led *led = ldev_to_led(led_cdev);
>   	struct pca995x_chip *chip = led->chip;
> +	const struct pca995x_chipdef *chipdef = chip->chipdef;
>   	u8 ledout_addr, pwmout_addr;
>   	int shift, ret;
>   
> -	pwmout_addr = (chip->btype ? PCA9955B_PWM0 : PCA9952_PWM0) + led->led_no;
> +	pwmout_addr = (chipdef->pwm_base) + led->led_no;
>   	ledout_addr = PCA995X_LEDOUT0 + (led->led_no / PCA995X_OUTPUTS_PER_REG);
>   	shift = PCA995X_LDRX_BITS * (led->led_no % PCA995X_OUTPUTS_PER_REG);
>   
> @@ -101,24 +124,24 @@ static const struct regmap_config pca995x_regmap = {
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
>   	if (!chip)
>   		return -ENOMEM;
>   
> -	chip->btype = btype;
> +	chip->chipdef = chipdef;
>   	chip->regmap = devm_regmap_init_i2c(client, &pca995x_regmap);
>   	if (IS_ERR(chip->regmap))
>   		return PTR_ERR(chip->regmap);
> @@ -126,41 +149,34 @@ static int pca995x_probe(struct i2c_client *client)
>   	i2c_set_clientdata(client, chip);
>   
>   	fwnode_for_each_available_child_node(np, child) {
> +		struct led_init_data init_data = {};
> +
>   		ret = fwnode_property_read_u32(child, "reg", &reg);
>   		if (ret) {
>   			fwnode_handle_put(child);
>   			return ret;
>   		}
>   
> -		if (reg < 0 || reg >= PCA995X_MAX_OUTPUTS || led_fwnodes[reg]) {
> +		if (reg < 0 || reg >= chipdef->num_leds) {
>   			fwnode_handle_put(child);
>   			return -EINVAL;
>   		}
>   
>   		led = &chip->leds[reg];
> -		led_fwnodes[reg] = child;
>   		led->chip = chip;
>   		led->led_no = reg;
>   		led->ldev.brightness_set_blocking = pca995x_brightness_set;
>   		led->ldev.max_brightness = 255;
> -	}
> -
> -	for (i = 0; i < PCA995X_MAX_OUTPUTS; i++) {
> -		struct led_init_data init_data = {};
> -
> -		if (!led_fwnodes[i])
> -			continue;
> -
> -		init_data.fwnode = led_fwnodes[i];
> +		init_data.fwnode = child;
>   
>   		ret = devm_led_classdev_register_ext(dev,
> -						     &chip->leds[i].ldev,
> +						     &led->ldev,
>   						     &init_data);
>   		if (ret < 0) {
>   			fwnode_handle_put(child);
>   			return dev_err_probe(dev, ret,
>   					     "Could not register LED %s\n",
> -					     chip->leds[i].ldev.name);
> +					     led->ldev.name);
>   		}
>   	}
>   
> @@ -170,21 +186,21 @@ static int pca995x_probe(struct i2c_client *client)
>   		return ret;
>   
>   	/* IREF Output current value for all LEDn outputs */
> -	return regmap_write(chip->regmap,
> -			    btype ? PCA9955B_IREFALL : PCA9952_IREFALL,
> -			    PCA995X_IREFALL_HALF_CFG);
> +	return regmap_write(chip->regmap, chipdef->irefall, PCA995X_IREFALL_HALF_CFG);
>   }
>   
>   static const struct i2c_device_id pca995x_id[] = {
> -	{ "pca9952", .driver_data = (kernel_ulong_t)PCA995X_TYPE_NON_B },
> -	{ "pca9955b", .driver_data = (kernel_ulong_t)PCA995X_TYPE_B },
> +	{ "pca9952", .driver_data = (kernel_ulong_t)&pca995x_chipdefs[pca9952] },
> +	{ "pca9955b", .driver_data = (kernel_ulong_t)&pca995x_chipdefs[pca9955b] },
> +	{ "pca9956b", .driver_data = (kernel_ulong_t)&pca995x_chipdefs[pca9956b] },

... pass pointer to each (separate) chip type structure here ...

>   	{}
>   };
>   MODULE_DEVICE_TABLE(i2c, pca995x_id);
>   
>   static const struct of_device_id pca995x_of_match[] = {
> -	{ .compatible = "nxp,pca9952",  .data = (void *)PCA995X_TYPE_NON_B },
> -	{ .compatible = "nxp,pca9955b", .data = (void *)PCA995X_TYPE_B },
> +	{ .compatible = "nxp,pca9952", .data = &pca995x_chipdefs[pca9952] },
> +	{ .compatible = "nxp,pca9955b", . data = &pca995x_chipdefs[pca9955b] },
> +	{ .compatible = "nxp,pca9956b", .data = &pca995x_chipdefs[pca9956b] },

... and here.

In pca995x_probe() , cache pointer to the whole struct pca995x_chipdef 
and use its members all over the driver. That's how you can get rid of 
the enum .

