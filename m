Return-Path: <linux-leds+bounces-4269-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB6EA60F50
	for <lists+linux-leds@lfdr.de>; Fri, 14 Mar 2025 11:53:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B64551B62C04
	for <lists+linux-leds@lfdr.de>; Fri, 14 Mar 2025 10:53:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0C581FCFC0;
	Fri, 14 Mar 2025 10:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TPJDDoMD"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC6F1779AE;
	Fri, 14 Mar 2025 10:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741949582; cv=none; b=H27FM0/54JfLO7nv2Ia1s91HRBfq3CJLwPjSyNnbbJkInEmWxYayV649J0TjND1iUyXZWjk/vlq+67uGvLkMCGe2H8zI5It7WuJqhhiElGcyKOJP1052+murv8mB/CA6skPPspAKcog9lOOPfjq/6PU38oLh+jXoi/SP4blQvrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741949582; c=relaxed/simple;
	bh=I38pgFc4AcNCWA6M+y+scF/rRO0w5W50rZ/FHsrz97Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SofMJ8x8J2ikMB/y0AP91lb5J//lKi6R31eHQafcYCMH1iLh8lhwlRSnzU1bMv1U/ELI0Dlm4hzc49V8HucIFnABb90f/Z5V2BDp4GJRkoMi0AyV97TvHw7s4K1y47G8yQ6XOwXsZ1Ty7Ad726QZboS8oZXqbYWxGRw4Efa2qTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TPJDDoMD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 161BCC4CEE3;
	Fri, 14 Mar 2025 10:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741949581;
	bh=I38pgFc4AcNCWA6M+y+scF/rRO0w5W50rZ/FHsrz97Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TPJDDoMDCM/wFeWNcttIaOfQ10haURnK/1u8wq25Slrjm70cTJuFqYgVFlvBasQ/1
	 qX5vO0PPuVAaXrleyGBFKrxpROz/unK2oKy9cjw9ZWn4zk0Kbtj4oymzUNcFBQbU+x
	 8cSaaiivzms4vRWmX+C1oBsx6AY/E6PuvbytIn9q/U3ikeTv///3RV83nDlDRAWISI
	 ttQ5c7d7q/NsZQCNRYl1AOvp37nfuXKOY9y5G1WF5zEP0cODLqu/U33yzbSZu2QGTS
	 qkQoTLOt6OD/WuCI3zwHzjZPQ972g3WY5pY+hQROt2FduyhS+II4BWwWW7/2CzsmBy
	 t1xtSxp+uVolw==
Date: Fri, 14 Mar 2025 10:52:57 +0000
From: Lee Jones <lee@kernel.org>
To: Matthias Fend <matthias.fend@emfend.at>
Cc: Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	bsp-development.geo@leica-geosystems.com
Subject: Re: [PATCH 2/2] leds: tps6131x: add support for Texas Instruments
 TPS6131X flash LED driver
Message-ID: <20250314105257.GD3890718@google.com>
References: <20250228-leds-tps6131x-v1-0-d1071d90f9ea@emfend.at>
 <20250228-leds-tps6131x-v1-2-d1071d90f9ea@emfend.at>
 <20250310144946.GH8350@google.com>
 <def0351b-c037-47c8-b395-d64cfca7ae25@emfend.at>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <def0351b-c037-47c8-b395-d64cfca7ae25@emfend.at>

On Fri, 14 Mar 2025, Matthias Fend wrote:

> Hi Lee,
> 
> thanks a lot for your feedback!
> 
> Am 10.03.2025 um 15:49 schrieb Lee Jones:
> > On Fri, 28 Feb 2025, Matthias Fend wrote:
> > 
> > > The TPS61310/TPS61311 is a flash LED driver with I2C interface. Its power
> > > stage is capable of supplying a maximum total current of roughly 1500mA.
> > > The TPS6131x provides three constant-current sinks, capable of sinking up
> > > to 2 × 400mA (LED1 and LED3) and 800mA (LED2) in flash mode. In torch mode
> > > each sink (LED1, LED2, LED3) supports currents up to 175mA.
> > > 
> > > Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
> > > ---
> > >   MAINTAINERS                        |   7 +
> > >   drivers/leds/flash/Kconfig         |  11 +
> > >   drivers/leds/flash/Makefile        |   1 +
> > >   drivers/leds/flash/leds-tps6131x.c | 798 +++++++++++++++++++++++++++++++++++++
> > >   4 files changed, 817 insertions(+)

[...]

> > > +static int tps6131x_led_class_setup(struct tps6131x *tps6131x)
> > > +{
> > > +	struct led_classdev *led_cdev;
> > > +	struct led_flash_setting *setting;
> > > +	struct led_init_data init_data = {};
> > > +	static const struct tps6131x_timer_config *timer_config;
> > > +	int ret;
> > > +
> > > +	tps6131x->fled_cdev.ops = &flash_ops;
> > > +
> > > +	setting = &tps6131x->fled_cdev.timeout;
> > > +	timer_config = tps6131x_find_closest_timer_config(0);
> > > +	setting->min = timer_config->time_us;
> > > +	setting->max = tps6131x->max_timeout_us;
> > > +	setting->step = 1; /* Only some specific time periods are supported. No fixed step size. */
> > > +	setting->val = setting->min;
> > > +
> > > +	setting = &tps6131x->fled_cdev.brightness;
> > > +	setting->min = tps6131x->step_flash_current_ma;
> > > +	setting->max = tps6131x->max_flash_current_ma;
> > > +	setting->step = tps6131x->step_flash_current_ma;
> > > +	setting->val = setting->min;
> > > +
> > > +	led_cdev = &tps6131x->fled_cdev.led_cdev;
> > > +	led_cdev->brightness_set_blocking = tps6131x_brightness_set;
> > > +	led_cdev->max_brightness = tps6131x->max_torch_current_ma;
> > > +	led_cdev->flags |= LED_DEV_CAP_FLASH;
> > > +
> > > +	init_data.fwnode = tps6131x->led_node;
> > > +	init_data.devicename = NULL;
> > > +	init_data.default_label = NULL;
> > > +	init_data.devname_mandatory = false;
> > > +
> > > +	ret = devm_led_classdev_flash_register_ext(&tps6131x->client->dev, &tps6131x->fled_cdev,
> > > +						   &init_data);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +#if IS_ENABLED(CONFIG_V4L2_FLASH_LED_CLASS)
> > 
> > Not keen on #ifery in C files.
> > 
> > Can you use is_defined() and return early instead?
> > 
> > I see that there is a precedent for this already. :(
> 
> Me neither, but since it is done this way in about 9 out of 10 flash
> controllers, I wanted to continue doing it consistently.
> But since the required v4l2_flash_* functions are also available as dummies
> if this option is not activated, I could do it like this:
> 
> if (!IS_BUILTIN(CONFIG_V4L2_FLASH_LED_CLASS))
>   return 0;
> 
> Would you prefer this solution?

I would, yes.  Thank you.

> > > +static int tps6131x_flash_external_strobe_set(struct v4l2_flash *v4l2_flash, bool enable)
> > > +{
> > > +	struct led_classdev_flash *fled_cdev = v4l2_flash->fled_cdev;
> > > +	struct tps6131x *tps6131x = fled_cdev_to_tps6131x(fled_cdev);
> > > +
> > > +	guard(mutex)(&tps6131x->lock);
> > > +
> > /> +	return tps6131x_set_mode(tps6131x, enable ? TPS6131X_MODE_FLASH : TPS6131X_MODE_SHUTDOWN,
> > > +				 false);
> > > +}
> > > +
> > > +static const struct v4l2_flash_ops tps6131x_v4l2_flash_ops = {
> > > +	.external_strobe_set = tps6131x_flash_external_strobe_set,
> > > +};
> > > +
> > > +static int tps6131x_v4l2_setup(struct tps6131x *tps6131x)
> > > +{
> > > +	struct v4l2_flash_config v4l2_cfg = { 0 };
> > > +	struct led_flash_setting *intensity = &v4l2_cfg.intensity;
> > > +
> > > +	intensity->min = tps6131x->step_torch_current_ma;
> > > +	intensity->max = tps6131x->max_torch_current_ma;
> > > +	intensity->step = tps6131x->step_torch_current_ma;
> > > +	intensity->val = intensity->min;
> > > +
> > > +	strscpy(v4l2_cfg.dev_name, tps6131x->fled_cdev.led_cdev.dev->kobj.name,
> > 
> > tps6131x->client->dev?
> 
> Do you mean the name should be taken from the I2C device?
> The current name, for example, is 'white:flash-0', while the I2C device name
> would be '4-0033'. So I think the current version is appropriate, don't you
> think?

No, I'm implying that:

  tps6131x->client->dev == tps6131x->fled_cdev.led_cdev.dev

... and that the former is shorter / neater.

> > > +		sizeof(v4l2_cfg.dev_name));
> > > +
> > > +	v4l2_cfg.has_external_strobe = true;
> > > +	v4l2_cfg.flash_faults = LED_FAULT_TIMEOUT | LED_FAULT_OVER_TEMPERATURE |
> > > +				LED_FAULT_SHORT_CIRCUIT | LED_FAULT_UNDER_VOLTAGE |
> > > +				LED_FAULT_LED_OVER_TEMPERATURE;
> > > +
> > > +	tps6131x->v4l2_flash = v4l2_flash_init(&tps6131x->client->dev, tps6131x->led_node,
> > > +					       &tps6131x->fled_cdev, &tps6131x_v4l2_flash_ops,
> > > +					       &v4l2_cfg);
> > > +	if (IS_ERR(tps6131x->v4l2_flash)) {
> > > +		dev_err(&tps6131x->client->dev, "v4l2_flash_init failed\n");
> > 
> > "Failed to initialise V4L2 flash LED" ?
> 
> ACK
> 
> > 
> > > +		return PTR_ERR(tps6131x->v4l2_flash);
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +#else
> > > +
> > > +static int tps6131x_v4l2_setup(struct tps6131x *tps6131x)
> > > +{
> > > +	return 0;
> > > +}
> > > +
> > > +#endif
> > > +
> > > +static int tps6131x_probe(struct i2c_client *client)
> > > +{
> > > +	struct tps6131x *tps6131x;
> > > +	int ret;
> > > +
> > > +	tps6131x = devm_kzalloc(&client->dev, sizeof(*tps6131x), GFP_KERNEL);
> > > +	if (!tps6131x)
> > > +		return -ENOMEM;
> > > +
> > > +	tps6131x->client = client;
> > 
> > What are you planning on using client for?
> > 
> > > +	i2c_set_clientdata(client, tps6131x);
> > 
> > How are you going to _get_ this without client?
> 
> Maybe I didn't understand the question correctly, but in tps6131x_remove() I
> get the device data via the client.

Right, which uses 'client' to obtain it, so you don't need to save 'client'.

> > Why not save dev and reduce the amount of dereferencing levels required.
> 
> Absolutely. Good idea.
> 
> > 
> > > +	mutex_init(&tps6131x->lock);
> > > +	INIT_DELAYED_WORK(&tps6131x->torch_refresh_work, tps6131x_torch_refresh_handler);
> > > +
> > > +	ret = tps6131x_parse_node(tps6131x);
> > > +	if (ret)
> > > +		return -ENODEV;
> > > +
> > > +	tps6131x->regmap = devm_regmap_init_i2c(client, &tps6131x_regmap);
> > > +	if (IS_ERR(tps6131x->regmap)) {
> > > +		ret = PTR_ERR(tps6131x->regmap);
> > > +		dev_err(&client->dev, "Failed to allocate register map\n");
> > > +		return ret;
> > > +	}
> > > +
> > > +	tps6131x->reset_gpio = devm_gpiod_get_optional(&client->dev, "reset", GPIOD_OUT_HIGH);
> > > +	ret = tps6131x_reset_chip(tps6131x);
> > > +	if (ret)
> > > +		return dev_err_probe(&client->dev, ret, "Failed to reset LED controller\n");
> > 
> > How do you manage the optional part?
> 
> If there is a reset line, then tps6131x_reset_chip() uses it to reset the
> chip. If there is none, the software reset (via an I2C register) is used.
> Therefore the reset pin can be optional.

Right, but didn't you just fail if one is not provided, or is that
accounted for in tps6131x_reset_chip()?

-- 
Lee Jones [李琼斯]

