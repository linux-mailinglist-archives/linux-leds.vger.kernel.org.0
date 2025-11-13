Return-Path: <linux-leds+bounces-6091-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BF7C57308
	for <lists+linux-leds@lfdr.de>; Thu, 13 Nov 2025 12:31:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B67C54E45F7
	for <lists+linux-leds@lfdr.de>; Thu, 13 Nov 2025 11:30:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3AD133E35C;
	Thu, 13 Nov 2025 11:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kyjw2SAe"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9484C33DEFA;
	Thu, 13 Nov 2025 11:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763033393; cv=none; b=MLdy3yJfKH6ZNMsE3kOa4FLRP3hN4pvJqyv0mTJRfXLGqdSMwz3SrGgQnEzmeKg/sm9TbV0wm3Sbt1S6NApTDMdYOdwgeHrsvkCWSPYNoA/gR16T/TfprygVu02ZBphenwXf6ebup+tcQtc9vLsDoaWZPKhCsv4JYrPPZ5xD0m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763033393; c=relaxed/simple;
	bh=mNBcINM7vOrkwSjMdzQjMAOOJlMLTdt8p5nnmhi0bpk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V1Suxk/nkiONwInG4mjo2JwC858H0iuMQwtxQIy1J2+oUPLVLPC/KdpbgS7qfAzyDXnma+U/3dLgcoxToeimnlMK/T56vwe6xxNJ+i8Ir7by5c1h1klmZ8b6cN827VQk2wkdwXPD/oJCmZhgDFkAdwji9uM67n0+tKS6ijvizkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kyjw2SAe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46FA1C16AAE;
	Thu, 13 Nov 2025 11:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763033393;
	bh=mNBcINM7vOrkwSjMdzQjMAOOJlMLTdt8p5nnmhi0bpk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kyjw2SAeCJwK8oZurRaA0tCYVsFMKQJakvjmg6wFjwxvBpd53XwrshwbBFDz3pFQ1
	 5nZx35HkjgZzhoGT6TTPWVPqvEVbMo/HMopc4vywhGvEWZAV7dkzaDk46I+B9Jmrn5
	 VsKN9UIH/MmR+oBiQSw0q36eyD5pwfwtFoViyAl4zneipjg6ppPVguXZ0+H2Elr1FE
	 IWIL3LWjckVpQ9wTmB5HjISlIXTzHR3RYqbelRHTjM5LqFFrqk2BwiDln/uo4wTwBF
	 jk21vj6aq3YQMCoJY0a7c1XLsGd9prSbjQta/mfhWklIr5mwoYweZCE0k3xQuM8JIi
	 7cHUfjRxkiGbA==
Date: Thu, 13 Nov 2025 11:29:47 +0000
From: Lee Jones <lee@kernel.org>
To: Nam Tran <trannamatk@gmail.com>
Cc: gregkh@linuxfoundation.org, pavel@kernel.org, rdunlap@infradead.org,
	christophe.jaillet@wanadoo.fr, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, corbet@lwn.net, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v17 2/3] leds: add basic support for TI/National
 Semiconductor LP5812 LED Driver
Message-ID: <20251113112947.GF1949330@google.com>
References: <20251106155915.GT8064@google.com>
 <20251111170728.81552-1-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251111170728.81552-1-trannamatk@gmail.com>

On Wed, 12 Nov 2025, Nam Tran wrote:

> On Thu, 6 Nov 2025, Lee Jones wrote:
> 
> > On Tue, 21 Oct 2025, Nam Tran wrote:
> > 
> > > The LP5812 is a 4x3 matrix RGB LED driver with an autonomous animation
> > > engine and time-cross-multiplexing (TCM) support for up to 12 LEDs or
> > > 4 RGB LEDs. Each LED can be configured through the related registers
> > > to realize vivid and fancy lighting effects.
> > > 
> > > This patch adds minimal driver support for the LP5812, implementing
> > > only the essential functionality: I2C communication with the device,
> > > LED registration, brightness control in manual mode, and basic sysfs
> > > interfaces for LED configuration and fault monitoring.
> > > 
> > > Signed-off-by: Nam Tran <trannamatk@gmail.com>
> > > ---
> > >  MAINTAINERS                    |   4 +
> > >  drivers/leds/rgb/Kconfig       |  13 +
> > >  drivers/leds/rgb/Makefile      |   1 +
> > >  drivers/leds/rgb/leds-lp5812.c | 730 +++++++++++++++++++++++++++++++++
> > >  drivers/leds/rgb/leds-lp5812.h | 197 +++++++++
> > >  5 files changed, 945 insertions(+)
> > >  create mode 100644 drivers/leds/rgb/leds-lp5812.c
> > >  create mode 100644 drivers/leds/rgb/leds-lp5812.h
> > 
> > Last go - just a few nits to fix-up.
> 
> Thank you for the feedback.
> I'll address these minor issues and include the fixes in the next revision.
> But I have a few concerns about some of the nits.
> 
> > > +static int lp5812_parse_led(struct device_node *np,
> > > +			    struct lp5812_led_config *cfg,
> > > +			    int led_index)
> > > +{
> > > +	int num_colors = 0, ret;
> > 
> > As above.
> > 
> > > +
> > > +	of_property_read_string(np, "label", &cfg[led_index].name);
> > 
> > Is this optional?
> 
> The 'label' property is required for proper sysfs naming. Should I update the DT binding
> to mark it mandatory and adjust the driver accordingly? I'd like to confirm if this aligns
> with usual conventions for such properties.

I'll let you look around and decide for yourself.

If this is not optional, you should check this call for errors.

> > > +static int lp5812_probe(struct i2c_client *client)
> > > +{
> > > +	struct lp5812_chip *chip;
> > > +	struct device_node *np = dev_of_node(&client->dev);
> > > +	struct lp5812_led *led;
> > 
> > This is all of the LEDs though, right.
> > 
> > So "leds" would be better.
> > 
> > > +	int ret;
> > > +
> > > +	if (!np)
> > > +		return -EINVAL;
> > > +
> > > +	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
> > > +	if (!chip)
> > > +		return -ENOMEM;
> > > +
> > > +	chip->cfg = i2c_get_match_data(client);
> > > +	ret = lp5812_of_populate_pdata(&client->dev, np, chip);
> > 
> > That's not all this function does though.
> > 
> > And it's not pdata.
> > 
> > lp5812_of_probe() would probably be better.
> > 
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	led = devm_kcalloc(&client->dev, chip->num_channels, sizeof(*led), GFP_KERNEL);
> > > +	if (!led)
> > > +		return -ENOMEM;
> > > +
> > > +	chip->client = client;
> > > +	mutex_init(&chip->lock);
> > > +	i2c_set_clientdata(client, led);
> > 
> > If you're only using the chip, why not just save the chip?
> 
> Just to confirm, you mean to store all LED instances inside the lp5812_chip struct and
> only save the chip in i2c_set_clientdata(), instead of allocating a separate leds array
> in probe()?

At the moment, it looks as though you save the array of `led`s and pull
out the `chip` pointer from the first one (in .remove() below).  Why not
just store the `chip` in clientdata in the first place?

> I can update the code accordingly if that's the preferred approach.
> 
> > > +/* Chip specific configurations */
> > > +static const struct lp5812_device_config lp5812_cfg = {
> > > +	.reg_reset = {
> > > +		.addr = LP5812_REG_RESET,
> > > +		.val  = LP5812_RESET
> > > +	},
> > > +	.reg_chip_en = {
> > > +		.addr = LP5812_REG_ENABLE,
> > > +		.val  = LP5812_ENABLE_DEFAULT
> > > +	},
> > > +	.reg_dev_config_0 = {
> > > +		.addr = LP5812_DEV_CONFIG0,
> > > +		.val  = 0
> > > +	},
> > > +	.reg_dev_config_1 = {
> > > +		.addr = LP5812_DEV_CONFIG1,
> > > +		.val  = 0
> > > +	},
> > > +	.reg_dev_config_2 = {
> > > +		.addr = LP5812_DEV_CONFIG2,
> > > +		.val  = 0
> > > +	},
> > > +	.reg_dev_config_3 = {
> > > +		.addr = LP5812_DEV_CONFIG3,
> > > +		.val  = 0
> > > +	},
> > > +	.reg_dev_config_4 = {
> > > +		.addr = LP5812_DEV_CONFIG4,
> > > +		.val  = 0
> > > +	},
> > > +	.reg_dev_config_5 = {
> > > +		.addr = LP5812_DEV_CONFIG5,
> > > +		.val  = 0
> > > +	},
> > > +	.reg_dev_config_6 = {
> > > +		.addr = LP5812_DEV_CONFIG6,
> > > +		.val  = 0
> > > +	},
> > > +	.reg_dev_config_7 = {
> > > +		.addr = LP5812_DEV_CONFIG7,
> > > +		.val  = 0
> > > +	},
> > > +	.reg_dev_config_12 = {
> > > +		.addr = LP5812_DEV_CONFIG12,
> > > +		.val  = LP5812_DEV_CONFIG12_DEFAULT
> > > +	},
> > > +	.reg_cmd_update = {
> > > +		.addr = LP5812_CMD_UPDATE,
> > > +		.val  = 0
> > > +	},
> > > +	.reg_tsd_config_status = {
> > > +		.addr = LP5812_TSD_CONFIG_STATUS,
> > > +		.val  = 0
> > > +	},
> > > +	.reg_led_en_1 = {
> > > +		.addr = LP5812_LED_EN_1,
> > > +		.val  = 0
> > > +	},
> > > +	.reg_led_en_2 = {
> > > +		.addr = LP5812_LED_EN_2,
> > > +		.val  = 0
> > > +	},
> > > +	.reg_fault_clear = {
> > > +		.addr = LP5812_FAULT_CLEAR,
> > > +		.val  = 0
> > > +	},
> > > +	.reg_manual_dc_base  = {
> > > +		.addr = LP5812_MANUAL_DC_BASE,
> > > +		.val  = 0
> > > +	},
> > > +	.reg_auto_dc_base  = {
> > > +		.addr = LP5812_AUTO_DC_BASE,
> > > +		.val  = 0
> > > +	},
> > > +	.reg_manual_pwm_base  = {
> > > +		.addr = LP5812_MANUAL_PWM_BASE,
> > > +		.val  = 0
> > > +	},
> > > +	.reg_lod_status_base  = {
> > > +		.addr = LP5812_LOD_STATUS,
> > > +		.val  = 0
> > > +	},
> > > +	.reg_lsd_status_base  = {
> > > +		.addr = LP5812_LSD_STATUS,
> > > +		.val  = 0
> > > +	}
> > > +};
> > 
> > This is an unusual way to set out a register map.
> > 
> > Where have you seen this done before?
> > 
> > > +static const struct of_device_id of_lp5812_match[] = {
> > > +	{ .compatible = "ti,lp5812", .data = &lp5812_cfg },
> > 
> > Seems odd to populate .data when you only have a single device.
> 
> I followed the style used in the lp55xx series drivers for the register map and device
> config. I thought it makes sense to keep the same pattern to allow easier upgrade and
> maintenance in the future. But you expect a more typical approach, right?

You only need to provide differentiation when you support more than one
device.

-- 
Lee Jones [李琼斯]

