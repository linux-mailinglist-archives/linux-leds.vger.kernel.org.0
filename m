Return-Path: <linux-leds+bounces-4704-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 977B9AC211A
	for <lists+linux-leds@lfdr.de>; Fri, 23 May 2025 12:28:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BA35166E1D
	for <lists+linux-leds@lfdr.de>; Fri, 23 May 2025 10:28:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A8A9227B88;
	Fri, 23 May 2025 10:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iECepnSj"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA0C19C55E;
	Fri, 23 May 2025 10:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747996133; cv=none; b=GVRJ0VBKOBrGosiuOUZUFy8uNJjPuCYilD22p+tWzj+QlSIU1ZbKnL4+n73F2ss69Tq+YZepH34aHNld3ZZtqi8iRVRKmK+TFlDEnY/MyVA8Ihl8nGCWN+G/CRTSnIG6zQ72R7GZkTRgvHmhJDd9X1549UrMuYzuNElL0PhuiYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747996133; c=relaxed/simple;
	bh=o/hm1iU3/rr7bm2Vc/aX9r+33h+rdgIAleEzfNlkqnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tcST84b+1ZOF91eJwsAGuF9FJEnlAtpQ6BVieI7VTjaDbLufP34jTaDqQ8YMrfXRRSMA82qTX+xOzg2P8xmM7wJI2dln2cT6RKfV8zxrxB3jNa660liTk+ltsioaXLe5lId1wnyAYro2B5DY4PULHu9D0qLUOmZSKdPE2IJNFa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iECepnSj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3773C4CEE9;
	Fri, 23 May 2025 10:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747996133;
	bh=o/hm1iU3/rr7bm2Vc/aX9r+33h+rdgIAleEzfNlkqnQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iECepnSjcvX+zdFlbjwg4OczBndbG2+nLDNZCEQa4q4lLMSUtOHLAwYuxuo2CJfbQ
	 46+ZiIucNc8a7Q1Vp6sxuCcg3OFGGymBmY6y3Lb/Ua6rj57Kj9UCWawxgrcH/uaRjR
	 nUJrb/UdIpRtlOojeNqeBzwCY2QqVaZ8yOnSKn73lyfVMxbCYdYs5X24ZZux9VI6Io
	 OJQ6viYe97CsI1+8EzVu79x6AmKWO2746zztRFerqMYi/tWEY2rHmkES042uBl/QxG
	 Mt0haVPVWE9xJcce0v+Gkf5UOKl37Y5YNT2WUc+EnwYukCz29/X6YBfSsuqOT8Bijb
	 EkudTGiX3Q8oQ==
Date: Fri, 23 May 2025 11:28:48 +0100
From: Lee Jones <lee@kernel.org>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Steffen Trumtrar <kernel@pengutronix.de>,
	Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] leds: add support for TI LP5860 LED driver chip
Message-ID: <20250523102848.GE1378991@google.com>
References: <20250514-v6-14-topic-ti-lp5860-v2-0-72ecc8fa4ad7@pengutronix.de>
 <20250514-v6-14-topic-ti-lp5860-v2-2-72ecc8fa4ad7@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250514-v6-14-topic-ti-lp5860-v2-2-72ecc8fa4ad7@pengutronix.de>

On Wed, 14 May 2025, Steffen Trumtrar wrote:

> Add support for the Texas Instruments LP5860 LED driver chip
> via SPI interfaces.
> 
> The LP5860 is an LED matrix driver for up to 196 LEDs, which supports
> short and open detection of the individual channel select lines.
> 
> The original driver is from an unknown author at Texas Instruments. Only
> the cryptic handle 'zlzx' is known.
> 
> Co-developed-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---
>  Documentation/ABI/testing/sysfs-class-spi-lp5860 |  23 ++
>  drivers/leds/Kconfig                             |  23 ++
>  drivers/leds/Makefile                            |   2 +
>  drivers/leds/leds-lp5860-core.c                  | 276 ++++++++++++++++++++
>  drivers/leds/leds-lp5860-spi.c                   |  99 +++++++

Are you going to follow-up with another option?  Say I2C?

>  drivers/leds/leds-lp5860.h                       | 315 +++++++++++++++++++++++
>  6 files changed, 738 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-spi-lp5860 b/Documentation/ABI/testing/sysfs-class-spi-lp5860

This doesn't belong here.

> new file mode 100644
> index 0000000000000000000000000000000000000000..d24b49d38ecae55f1a1a4e465fbe71d30eff497e
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-class-spi-lp5860
> @@ -0,0 +1,23 @@
> +What:           /sys/class/spi_master/spi<bus>/spi<bus>.<dev>/b_current_set

Why would you want to change the current of the SPI bus?

> +Date:           May 2025
> +KernelVersion:  6.15
> +Contact:        Steffen Trumtrar <kernel@pengutronix.de>
> +Description:
> +	Contains and sets the current for the B color group.

What does the current set?  Brightness?

If so, the user shouldn't be expected to know what current set in order
to obtain a specific brightness.  Instead, shouldn't you use
/sys/class/leds/<led>/multi_intensity and let the driver deal with the
particulars of setting that brightness?

> +	Can be adjusted in 128 steps from 0% to 100% of the maximum output current.
> +
> +What:           /sys/class/spi_master/spi<bus>/spi<bus>.<dev>/g_current_set
> +Date:           May 2025
> +KernelVersion:  6.15
> +Contact:        Steffen Trumtrar <kernel@pengutronix.de>
> +Description:
> +	Contains and sets the current for the G color group.
> +	Can be adjusted in 128 steps from 0% to 100% of the maximum output current.
> +
> +What:           /sys/class/spi_master/spi<bus>/spi<bus>.<dev>/r_current_set
> +Date:           May 2025
> +KernelVersion:  6.15
> +Contact:        Steffen Trumtrar <kernel@pengutronix.de>
> +Description:
> +	Contains and sets the current for the R color group.
> +	Can be adjusted in 128 steps from 0% to 100% of the maximum output current.
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index a104cbb0a0019a0510f7e33b4e70e13083efb390..d2b6a53f2ea2cef751cd19774e05f966e66a0a5f 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -483,6 +483,29 @@ config LEDS_LP5569
>  	  Driver provides direct control via LED class and interface for
>  	  programming the engines.
>  
> +config LEDS_LP5860_CORE
> +	tristate "Core Driver for TI LP5860"
> +	depends on LEDS_CLASS
> +	depends on LEDS_CLASS_MULTICOLOR
> +	depends on OF
> +	select FW_LOADER
> +	select FW_LOADER_USER_HELPER
> +	select REGMAP
> +	help
> +	  This option supports common operations for LP5860 devices.
> +	  The device can be used with SPI or I2C bus.

This is not sufficient.  What is the device?  What are its capabilities?
What does the LED array look like?  More input ...

> +config LEDS_LP5860_SPI
> +	tristate "LED Support for TI LP5860 SPI LED driver chip"
> +	depends on SPI
> +	depends on LEDS_LP5860_CORE
> +	help
> +	  If you say yes here you get support for the Texas Instruments
> +	  LP5860 LED driver for SPI bus connections.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called lp5860_spi.
> +
>  config LEDS_LP8501
>  	tristate "LED Support for TI LP8501 LED driver chip"
>  	depends on LEDS_CLASS && I2C
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index 2f170d69dcbf517cf7df98f25c49e3b445da3470..714d37a8361b757b71d37e95211ea04aed5d5d59 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -54,6 +54,8 @@ obj-$(CONFIG_LEDS_LP5523)		+= leds-lp5523.o
>  obj-$(CONFIG_LEDS_LP5562)		+= leds-lp5562.o
>  obj-$(CONFIG_LEDS_LP5569)		+= leds-lp5569.o
>  obj-$(CONFIG_LEDS_LP55XX_COMMON)	+= leds-lp55xx-common.o
> +obj-$(CONFIG_LEDS_LP5860_CORE)		+= leds-lp5860-core.o
> +obj-$(CONFIG_LEDS_LP5860_SPI)		+= leds-lp5860-spi.o
>  obj-$(CONFIG_LEDS_LP8501)		+= leds-lp8501.o
>  obj-$(CONFIG_LEDS_LP8788)		+= leds-lp8788.o
>  obj-$(CONFIG_LEDS_LP8860)		+= leds-lp8860.o
> diff --git a/drivers/leds/leds-lp5860-core.c b/drivers/leds/leds-lp5860-core.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..c3ce2528783a1910a267c1b35a65ad27a63083db
> --- /dev/null
> +++ b/drivers/leds/leds-lp5860-core.c
> @@ -0,0 +1,276 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2025 Pengutronix,

Author: ...

> + *		 Steffen Trumtrar <kernel@pengutronix.de
> + *
> + * Based on:
> + *
> + * LP5860 Driver
> + *
> + * Copyright 2012 Texas Instruments
> + *
> + * Author: Texas Instruments, zlzx

Remove this.  Most drivers take inspiration from others.

> + */
> +
> +#include <linux/gpio.h>
> +#include <linux/led-class-multicolor.h>
> +#include <linux/module.h>
> +#include <linux/of_gpio.h>
> +#include <linux/of_platform.h>
> +#include <linux/regmap.h>
> +
> +#include "leds-lp5860.h"

How many header files do you see in drivers/leds?

> +static struct lp5860_led *mcled_cdev_to_led(struct led_classdev_mc *mc_cdev)
> +{
> +	return container_of(mc_cdev, struct lp5860_led, mc_cdev);
> +}
> +
> +LP5860_SHOW_MODE(r_current_set, LP5860_R_CURRENT_SET, LP5860_CC_GROUP_MASK, 0)
> +LP5860_STORE_MODE(r_current_set, LP5860_R_CURRENT_SET, LP5860_CC_GROUP_MASK, 0)
> +static LP5860_DEV_ATTR_RW(r_current_set);

This is opaque.  The macro should be readable here.

> +LP5860_SHOW_MODE(g_current_set, LP5860_G_CURRENT_SET, LP5860_CC_GROUP_MASK, 0)
> +LP5860_STORE_MODE(g_current_set, LP5860_G_CURRENT_SET, LP5860_CC_GROUP_MASK, 0)
> +static LP5860_DEV_ATTR_RW(g_current_set);
> +
> +LP5860_SHOW_MODE(b_current_set, LP5860_B_CURRENT_SET, LP5860_CC_GROUP_MASK, 0)
> +LP5860_STORE_MODE(b_current_set, LP5860_B_CURRENT_SET, LP5860_CC_GROUP_MASK, 0)
> +static LP5860_DEV_ATTR_RW(b_current_set);
> +
> +static struct attribute *lp5860_attributes[] = {
> +	&dev_attr_r_current_set.attr,
> +	&dev_attr_g_current_set.attr,
> +	&dev_attr_b_current_set.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group lp5860_group = {
> +	.attrs = lp5860_attributes,
> +};
> +
> +static int lp5860_dotonoff(struct lp5860_led *led, unsigned int dot,

What does the datasheet call this?

How many 'dots' are there?

> +			   bool enable)

Unwrap this.  You can use 100-chars to prevent silly line feeds.

> +{
> +	unsigned int offset = dot / LP5860_MAX_DOT_ONOFF_GROUP_NUM;
> +	unsigned int mask = BIT(dot % LP5860_MAX_DOT_ONOFF_GROUP_NUM);
> +
> +	return regmap_update_bits(led->priv->regmap,
> +				  LP5860_DOT_ONOFF_START + offset, mask,
> +				  enable ? 0xff : 0x0);

Either 0 or 0x00.  The former looks more sensible.

> +}
> +
> +static int lp5860_set_mc_brightness(struct led_classdev *cdev,
> +				    enum led_brightness brightness)
> +{
> +	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(cdev);
> +	struct lp5860_led *led = mcled_cdev_to_led(mc_cdev);
> +	int i;
> +
> +	led_mc_calc_color_components(mc_cdev, brightness);
> +
> +	for (i = 0; i < led->mc_cdev.num_colors; i++) {
> +		unsigned int channel = mc_cdev->subled_info[i].channel;
> +		unsigned int led_brightness = mc_cdev->subled_info[i].brightness;
> +		int ret;
> +
> +		ret = lp5860_dotonoff(led, channel, led_brightness);
> +		if (ret)
> +			return ret;
> +
> +		ret = regmap_write(led->priv->regmap,
> +				   LP5860_PWM_BRI_START + channel,
> +				   led_brightness);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int lp5860_enable_disable(struct lp5860 *led, int enable_disable)

_enable_toggle()?

> +{
> +	return regmap_write(led->regmap, LP5860_CHIP_EN, enable_disable);

'enable'

> +}
> +
> +static int lp5860_led_init_default_state(struct lp5860_led *led,
> +					 unsigned int channel)
> +{
> +	unsigned int level;

Voltage level? Brightness level? Sea level?

> +	int ret;
> +
> +	ret = regmap_read(led->priv->regmap, LP5860_PWM_BRI_START + channel,
> +			  &level);
> +
> +	switch (led->default_state) {
> +	case LEDS_DEFSTATE_ON:
> +		led->brightness = LP5860_MAX_BRIGHTNESS;
> +		break;
> +	case LEDS_DEFSTATE_KEEP:
> +		led->brightness = min(level, LP5860_MAX_BRIGHTNESS);
> +		break;
> +	default:
> +		led->brightness = 0;
> +		break;
> +	}
> +
> +	return lp5860_set_mc_brightness(&led->mc_cdev.led_cdev, led->brightness);
> +}
> +
> +static int lp5860_probe_leds(struct fwnode_handle *child, struct lp5860 *lp,
> +			     struct lp5860_led *led, int num_leds)
> +{
> +	u32 led_banks[LP5860_MAX_LED] = {0};
> +	int led_number;
> +	int ret;
> +
> +	if (num_leds > 1) {
> +		if (num_leds > LP5860_MAX_LED) {
> +			dev_err(lp->dev, "too many leds specified\n");

LEDs

> +			return -EINVAL;
> +		}
> +
> +		ret = fwnode_property_read_u32_array(child, "reg", led_banks,

Why don't you do anything with the value?

> +						     num_leds);

Remove the line break.

> +		if (ret) {
> +			dev_err(lp->dev, "reg property is missing\n");
> +			return ret;
> +		}
> +	} else {
> +		ret = fwnode_property_read_u32(child, "reg", &led_number);
> +		if (ret) {
> +			dev_err(lp->dev, "led reg property missing\n");

"reg" or 'reg'.

> +			return ret;
> +		}
> +
> +		if (led_number > LP5860_MAX_LED) {
> +			dev_err(lp->dev, "led-sources property is invalid\n");
> +			return -EINVAL;
> +		}
> +
> +		led->chan_nr = led_number;

What's the difference between a led_number and a chan_nr?

Keep nomenclature consistent (nr vs number).

Why not call it 'chan_nr' (or more commonly 'chan') from the start?

> +	}
> +
> +	return 0;
> +}
> +
> +static int lp5860_probe_dt(struct lp5860 *lp)
> +{
> +	struct fwnode_handle *led_node = NULL;
> +	struct fwnode_handle *subchild;
> +	struct led_init_data init_data = {};
> +	struct led_classdev *led_cdev;
> +	struct mc_subled *mc_led_info;
> +	struct lp5860_led *led;
> +	int num_channels;
> +	u32 color_id;
> +	u32 channel;
> +	int i = 0;
> +	int ret;

A bunch of these could be define in the scope below.

> +	device_for_each_child_node_scoped(lp->dev, child) {
> +

Remove this line.

> +		led = &lp->leds[i];
> +		ret = fwnode_property_count_u32(child, "reg");
> +		if (ret < 0) {
> +			dev_err(lp->dev, "reg property is invalid\n");
> +			return ret;
> +		}
> +
> +		ret = lp5860_probe_leds(child, lp, led, ret);

Definitely drop the _probe() terminology at this point.

Describe the function properly.  What is it doing?

> +		if (ret)
> +			return ret;
> +
> +		init_data.fwnode = child;
> +
> +		num_channels = 0;

It's num_channels now?  Consistency please.

> +		fwnode_for_each_available_child_node(child, subchild)
> +			num_channels++;

Why don't we already have this from lp5860_probe_leds()?

I'm getting confused between channels and LEDs at this point!

> +		if (!num_channels || num_channels > LP5860_MAX_LED_CHANNELS)
> +			return -EINVAL;
> +
> +		mc_led_info = devm_kcalloc(lp->dev, num_channels,
> +					   sizeof(*mc_led_info), GFP_KERNEL);
> +		if (!mc_led_info)
> +			return -ENOMEM;
> +
> +		num_channels = 0;

Wait, what?  We're going to count LEDs/channels for a 3rd time now?

> +		led->priv = lp;
> +		fwnode_for_each_child_node(child, led_node) {
> +			ret = fwnode_property_read_u32(led_node, "color",
> +						       &color_id);
> +			if (ret) {
> +				fwnode_handle_put(led_node);
> +				dev_err(lp->dev, "Cannot read color\n");

Highlight the property names 'color'.

> +				return ret;
> +			}

Don't squish these unrelated calls together: '\n' here.

> +			ret = fwnode_property_read_u32(led_node, "reg",
> +						       &channel);
> +			if (ret < 0) {
> +				dev_err(lp->dev, "reg property is invalid\n");
> +				return ret;
> +			}
> +
> +			mc_led_info[num_channels].color_index = color_id;
> +			mc_led_info[num_channels].channel = channel;
> +			lp5860_led_init_default_state(led, num_channels);
> +
> +			num_channels++;
> +		}
> +
> +		led->mc_cdev.num_colors = num_channels;
> +		led->mc_cdev.subled_info = mc_led_info;
> +		led->default_state = led_init_default_state_get(init_data.fwnode);
> +		led_cdev = &led->mc_cdev.led_cdev;
> +		led_cdev->max_brightness = LP5860_MAX_BRIGHTNESS;
> +		led_cdev->brightness_set_blocking = lp5860_set_mc_brightness;
> +
> +		ret = devm_led_classdev_multicolor_register_ext(lp->dev,
> +								&led->mc_cdev,
> +								&init_data);
> +		if (ret) {
> +			dev_err(lp->dev, "led register err: %d\n", ret);
> +			return ret;
> +		}
> +		i++;
> +	}
> +
> +	return 0;
> +}
> +
> +int lp5860_device_init(struct lp5860 *lp)
> +{
> +	int ret;
> +
> +	dev_set_drvdata(lp->dev, lp);

You already did this in the SPI part.

> +	ret = lp5860_enable_disable(lp, 1);

1 is meaningless.

Shouldn't this be LP5860_CHIP_ENABLE?

> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_update_bits(lp->regmap, LP5860_DEV_INITIAL,
> +				 LP5860_MODE_MASK,
> +				 LP5860_MODE_1 << LP5860_MODE_OFFSET);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = sysfs_create_group(&lp->dev->kobj, &lp5860_group);
> +	if (ret)
> +		return ret;
> +
> +	return lp5860_probe_dt(lp);

Don't go back to 'probe' nomenclature.

Or, call the SPI part, lp5860_spi_probe(), then call this function
lp5860_probe(), then you can keep lp5860_probe_dt().

> +}
> +
> +void lp5860_device_remove(struct device *dev)
> +{
> +	struct lp5860 *lp = dev_get_drvdata(dev);
> +	int err;
> +
> +	err = lp5860_enable_disable(lp, 0);

Use the defines you created.

> +	if (err)
> +		dev_err(lp->dev, "Failed to disable chip\n");
> +
> +	sysfs_remove_group(&dev->kobj, &lp5860_group);
> +}
> diff --git a/drivers/leds/leds-lp5860-spi.c b/drivers/leds/leds-lp5860-spi.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..751cc4184037c3c0e14d3493d0a43f0885786523
> --- /dev/null
> +++ b/drivers/leds/leds-lp5860-spi.c
> @@ -0,0 +1,99 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2025 Pengutronix,
> + *		 Steffen Trumtrar <kernel@pengutronix.de
> + *
> + * Based on:
> + *
> + * Copyright 2012 Texas Instruments
> + *
> + * Author: Texas Instruments, zlzx
> + *
> + */
> +
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/spi/spi.h>
> +
> +#include "leds-lp5860.h"
> +
> +#define LP5860_SPI_WRITE_FLAG BIT(5)
> +
> +static const struct regmap_config lp5860_regmap_config = {
> +	.name = "lp5860-spi",
> +	.reg_bits = 10,
> +	.pad_bits = 6,
> +	.val_bits = 8,
> +	.write_flag_mask = (__force unsigned long)cpu_to_be16(LP5860_SPI_WRITE_FLAG),
> +	.reg_format_endian = REGMAP_ENDIAN_BIG,
> +	.max_register = LP5860_MAX_REG,
> +};
> +
> +static int lp5860_probe(struct spi_device *spi)
> +{
> +	struct device *dev = &spi->dev;
> +	struct lp5860 *lp5860;
> +	unsigned int multi_leds;
> +	int ret;
> +
> +	multi_leds = device_get_child_node_count(dev);
> +	if (!multi_leds) {
> +		dev_err(dev, "LEDs are not defined in device tree!");
> +		return -ENODEV;
> +	}
> +
> +	lp5860 = devm_kzalloc(dev, struct_size(lp5860, leds, multi_leds),
> +			      GFP_KERNEL);
> +	if (!lp5860)
> +		return -ENOMEM;
> +
> +	spi_set_drvdata(spi, lp5860);
> +
> +	spi->mode = SPI_MODE_0;
> +	spi->bits_per_word = 8;
> +
> +	ret = spi_setup(spi);
> +	if (ret)
> +		return ret;
> +
> +	lp5860->regmap = devm_regmap_init_spi(spi, &lp5860_regmap_config);
> +	if (IS_ERR(lp5860->regmap)) {
> +		dev_err(&spi->dev, "regmap init failed.\n");
> +		return PTR_ERR(lp5860->regmap);
> +	}
> +
> +	lp5860->dev = dev;
> +
> +	return lp5860_device_init(lp5860);
> +}
> +
> +static void lp5860_remove(struct spi_device *spi)
> +{
> +	struct device *dev = &spi->dev;

You only use this one.  Just use the full dereference in _remove().

> +	lp5860_device_remove(dev);
> +}
> +
> +static const struct of_device_id lp5860_of_match[] = {
> +	{ .compatible = "ti,lp5860" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, lp5860_of_match);
> +
> +static struct spi_driver lp5860_driver = {
> +	.driver = {
> +		.name = "lp5860",
> +		.of_match_table = lp5860_of_match,
> +	},
> +	.probe	= lp5860_probe,
> +	.remove = lp5860_remove,
> +};
> +

Remove this line.

> +module_spi_driver(lp5860_driver);
> +
> +MODULE_DESCRIPTION("TI leds lp5860");

More info.

"LP5860"

> +MODULE_AUTHOR("Steffen Trumtrar <kernel@pengutronix.de>");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/leds/leds-lp5860.h b/drivers/leds/leds-lp5860.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..b4255fb48372814c7fda86ada96f504c2036f534
> --- /dev/null
> +++ b/drivers/leds/leds-lp5860.h
> @@ -0,0 +1,315 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2025 Pengutronix,
> + *		 Steffen Trumtrar <kernel@pengutronix.de
> + *
> + * Based on:
> + *
> + * LP5860 Driver Header
> + *
> + * Copyright (C) 2012 Texas Instruments
> + *
> + * Author: Texas Instruments
> + *
> + * Derived from leds-lp5860.c

As before.

> + */
> +
> +#ifndef _LEDS_LP5860_COMMON_H
> +#define _LEDS_LP5860_COMMON_H
> +
> +#include <linux/regmap.h>
> +#include <linux/led-class-multicolor.h>
> +
> +/* lp586x Register */

LP5860_REG_... then omit the comment.

> +#define LP5860_CHIP_EN			0x00
> +#define LP5860_DEV_INITIAL		0x01
> +#define LP5860_DEV_CONFIG1		0x02
> +#define LP5860_DEV_CONFIG2		0x03
> +#define LP5860_DEV_CONFIG3		0x04
> +#define LP5860_GLOBAL_BRI		0x05
> +#define LP5860_GROUP0_BRI		0x06
> +#define LP5860_GROUP1_BRI		0x07
> +#define LP5860_GROUP2_BRI		0x08
> +#define LP5860_R_CURRENT_SET		0x09
> +#define LP5860_G_CURRENT_SET		0x0A
> +#define LP5860_B_CURRENT_SET		0x0B
> +#define LP5860_GRP_SEL_START		0x0C
> +#define LP5860_DOT_ONOFF_START		0x43
> +#define LP5860_DOT_ONOFF_MAX		0x63
> +#define LP5860_FAULT_STATE		0x64
> +#define LP5860_DOT_LOD_START		0x65
> +#define LP5860_DOT_LSD_START		0x86
> +#define LP5860_LOD_CLEAR		0xA7
> +#define LP5860_LSD_CLEAR		0xA8
> +#define LP5860_RESET			0xA9
> +#define LP5860_DC_START			0x0100
> +#define LP5860_PWM_BRI_START		0x0200
> +#define LP5860_MAX_REG			0x038B
> +
> +/* Register chip_enable Value */
> +#define LP5860_CHIP_OFFSET		0
> +#define LP5860_CHIP_MASK		BIT(0)
> +#define LP5860_CHIP_DISABLE		0x00
> +#define LP5860_CHIP_ENABLE		0x01
> +
> +/* Register Dev_initial Value */
> +#define LP5860_MAX_LINE_OFFSET		3
> +#define LP5860_MAX_LINE_MASK		GENMASK(6, 3)
> +#define LP5860_MAX_LINE_11		0x0B
> +#define LP5860_MAX_LINE_10		0x0A
> +#define LP5860_MAX_LINE_9		0x09
> +#define LP5860_MAX_LINE_8		0x08
> +#define LP5860_MAX_LINE_7		0x07
> +#define LP5860_MAX_LINE_6		0x06
> +#define LP5860_MAX_LINE_5		0x05
> +#define LP5860_MAX_LINE_4		0x04
> +#define LP5860_MAX_LINE_3		0x03
> +#define LP5860_MAX_LINE_2		0x02
> +#define LP5860_MAX_LINE_1		0x01
> +
> +#define LP5860_MODE_OFFSET		1
> +#define LP5860_MODE_MASK		GENMASK(2, 1)
> +#define LP5860_MODE_3_1			0x03
> +#define LP5860_MODE_3			0x02
> +#define LP5860_MODE_2			0x01
> +#define LP5860_MODE_1			0x00
> +
> +#define LP5860_PWM_FREQUENCY_OFFSET	0
> +#define LP5860_PWM_FREQUENCY_MASK	BIT(0)
> +#define LP5860_PWM_FREQUENCY_62_5K	0x01
> +#define LP5860_PWM_FREQUENCY_125K	0x00
> +
> +/* *Register Dev_config1 Valu */
> +#define LP5860_SW_BLK_OFFSET		3
> +#define LP5860_SW_BLK_MASK		BIT(3)
> +#define LP5860_SW_BLK_05US		0x01
> +#define LP5860_SW_BLK_1US		0x00
> +
> +#define LP5860_PWM_SCALE_MODE_OFFSET	2
> +#define LP5860_PWM_SCALE_MODE_MASK	BIT(2)
> +#define LP5860_PWM_SCALE_EXPONENTIAL	0x01
> +#define LP5860_PWM_SCALE_LINEAR		0x00
> +
> +#define LP5860_PWM_PHASESHIFT_OFFSET	1
> +#define LP5860_PWM_PHASESHIFT_MASK	BIT(1)
> +#define LP5860_PWM_PHASESHIFT_ON	0x01
> +#define LP5860_PWM_PHASESHIFT_OFF	0x00
> +
> +#define LP5860_CS_ON_SHIFT_OFFSET	0
> +#define LP5860_CS_ON_SHIFT_MASK		BIT(0)
> +#define LP5860_CS_DELAY_ON		0x01
> +#define LP5860_CS_DELAY_OFF		0x00
> +
> +/* Register Dev_config2 Value */
> +#define LP5860_COMP_GROUP3_OFFSET	6
> +#define LP5860_COMP_GROUP3_MASK		GENMASK(7, 6)
> +#define LP5860_COMP_GROUP3_3CLOCK	0x03
> +#define LP5860_COMP_GROUP3_2CLOCK	0x02
> +#define LP5860_COMP_GROUP3_1CLOCK	0x01
> +#define LP5860_COMP_GROUP3_OFF		0x00
> +
> +#define LP5860_COMP_GROUP2_OFFSET	4
> +#define LP5860_COMP_GROUP2_MASK		GENMASK(5, 4)
> +#define LP5860_COMP_GROUP2_3CLOCK	0x03
> +#define LP5860_COMP_GROUP2_2CLOCK	0x02
> +#define LP5860_COMP_GROUP2_1CLOCK	0x01
> +#define LP5860_COMP_GROUP2_OFF		0x00
> +
> +#define LP5860_COMP_GROUP1_OFFSET	2
> +#define LP5860_COMP_GROUP1_MASK		GENMASK(3, 2)
> +#define LP5860_COMP_GROUP1_3CLOCK	0x03
> +#define LP5860_COMP_GROUP1_2CLOCK	0x02
> +#define LP5860_COMP_GROUP1_1CLOCK	0x01
> +#define LP5860_COMP_GROUP1_OFF		0x00
> +
> +#define LP5860_LOD_REMOVAL_OFFSET	1
> +#define LP5860_LOD_REMOVAL_MASK		BIT(1)
> +#define LP5860_LOD_REMOVAL_EN		0x01
> +#define LP5860_LOD_REMOVAL_OFF		0x00
> +
> +#define LP5860_LSD_REMOVAL_OFFSET	0
> +#define LP5860_LSD_REMOVAL_MASK		BIT(0)
> +#define LP5860_LSD_REMOVAL_EN		0x01
> +#define LP5860_LSD_REMOVAL_OFF		0x00
> +
> +/* Register Dev_config3 Value */
> +#define LP5860_DOWN_DEGHOST_OFFSET	6
> +#define LP5860_DOWN_DEGHOST_MASK	GENMASK(7, 6)
> +#define LP5860_DOWN_DEGHOST_STRONG	0x03
> +#define LP5860_DOWN_DEGHOST_MEDIUM	0x02
> +#define LP5860_DOWN_DEGHOST_WEAK	0x01
> +#define LP5860_DOWN_DEGHOST_OFF		0x00
> +
> +#define LP5860_UP_DEGHOST_OFFSET	4
> +#define LP5860_UP_DEGHOST_MASK		GENMASK(5, 4)
> +#define LP5860_UP_DEGHOST_GND		0x03
> +#define LP5860_UP_DEGHOST_3		0x02
> +#define LP5860_UP_DEGHOST_2_5		0x01
> +#define LP5860_UP_DEGHOST_2		0x00
> +
> +#define LP5860_MAXIMUM_CURRENT_OFFSET	1
> +#define LP5860_MAXIMUM_CURRENT_MASK	GENMASK(3, 1)
> +#define LP5860_MAXIMUM_CURRENT_50	0x07
> +#define LP5860_MAXIMUM_CURRENT_40	0x06
> +#define LP5860_MAXIMUM_CURRENT_30	0x05
> +#define LP5860_MAXIMUM_CURRENT_20	0x04
> +#define LP5860_MAXIMUM_CURRENT_15	0x03
> +#define LP5860_MAXIMUM_CURRENT_10	0x02
> +#define LP5860_MAXIMUM_CURRENT_5	0x01
> +#define LP5860_MAXIMUM_CURRENT_3	0x00
> +
> +#define LP5860_UP_DEGHOST_ENABLE_OFFSET	0
> +#define LP5860_UP_DEGHOST_ENABLE_MASK	BIT(0)
> +#define LP5860_UP_DEGHOST_ENABLE_EN	0x01
> +#define LP5860_UP_DEGHOST_ENABLE_OFF	0x00
> +
> +/* Register PWM */
> +#define LP5860_PWM_GLOBAL_MAX		0xff
> +#define LP5860_PWM_GROUP_MAX		0xff
> +
> +/* Register CC GROUP select */
> +#define LP5860_CC_GROUP_MASK		GENMASK(7, 0)
> +#define LP5860_CC_GROUP_MAX		0x7F
> +
> +/* Register dot group select */
> +#define LP5860_DOT_0_OFFSET		0
> +#define LP5860_DOT_1_OFFSET		2
> +#define LP5860_DOT_2_OFFSET		4
> +#define LP5860_DOT_3_OFFSET		6
> +
> +#define LP5860_DOT_GROUP3		0x03
> +#define LP5860_DOT_GROUP2		0x02
> +#define LP5860_DOT_GROUP1		0x01
> +#define LP5860_DOT_GROUP_NONE		0x00
> +
> +#define LP5860_PWM_DOT_MAX		0xff
> +/* dot onoff Value */
> +#define LP5860_DOT_CS0_OFFSET		0
> +#define LP5860_DOT_CS1_OFFSET		1
> +#define LP5860_DOT_CS2_OFFSET		2
> +#define LP5860_DOT_CS3_OFFSET		3
> +#define LP5860_DOT_CS4_OFFSET		4
> +#define LP5860_DOT_CS5_OFFSET		5
> +#define LP5860_DOT_CS6_OFFSET		6
> +#define LP5860_DOT_CS7_OFFSET		7
> +
> +#define LP5860_DOT_CS_ON		0x01
> +#define LP5860_DOT_CS_OFF		0x00
> +
> +/* dot lod Value */
> +#define LP5860_DOT_LOD0_OFFSET		0
> +#define LP5860_DOT_LOD1_OFFSET		1
> +#define LP5860_DOT_LOD2_OFFSET		2
> +#define LP5860_DOT_LOD3_OFFSET		3
> +#define LP5860_DOT_LOD4_OFFSET		4
> +#define LP5860_DOT_LOD5_OFFSET		5
> +#define LP5860_DOT_LOD6_OFFSET		6
> +#define LP5860_DOT_LOD7_OFFSET		7
> +
> +#define LP5860_DOT_LOD_ON		0x01
> +#define LP5860_DOT_LOD_OFF		0x00
> +
> +/* dot lsd Value */
> +#define LP5860_DOT_LSD0_OFFSET		0
> +#define LP5860_DOT_LSD1_OFFSET		1
> +#define LP5860_DOT_LSD2_OFFSET		2
> +#define LP5860_DOT_LSD3_OFFSET		3
> +#define LP5860_DOT_LSD4_OFFSET		4
> +#define LP5860_DOT_LSD5_OFFSET		5
> +#define LP5860_DOT_LSD6_OFFSET		6
> +#define LP5860_DOT_LSD7_OFFSET		7
> +
> +#define LP5860_DOT_LSD_ON		0x01
> +#define LP5860_DOT_LSD_OFF		0x00
> +
> +/* REG FAULT_STATE */
> +#define LP5860_GLOBAL_LOD_OFFSET	1
> +#define LP5860_GLOBAL_LOD_STATE		BIT(1)
> +#define LP5860_GLOBAL_LSD_OFFSET	0
> +#define LP5860_GLOBAL_LSD_STATE		BIT(0)
> +
> +#define LP5860_FAULT_STATE_ON		0x01
> +#define LP5860_FAULT_STATE_OFF		0x00
> +
> +/* REG FAULT_STATE */
> +#define LP5860_GLOBAL_LOD_CELAR		0x00
> +#define LP5860_GLOBAL_LSD_CELAR		0x00
> +
> +
> +#define LP5860_LOD_CLEAR_EN		0xff
> +#define LP5860_LSD_CLEAR_EN		0xff
> +#define LP5860_RESET_EN			0xff
> +
> +#define LP5860_MAX_BRIGHTNESS		255
> +#define LP5860_REG_R_PWM		0x0
> +#define LP5860_REG_G_PWM		0x1
> +#define LP5860_REG_B_PWM		0x2
> +
> +#define LP5860_MAX_LED_CONSTANT		18
> +#define LP5860_MAX_LED_SCAN		11
> +#define LP5860_MAX_LED			(LP5860_MAX_LED_CONSTANT * LP5860_MAX_LED_SCAN)
> +
> +#define LP5860_MAX_DOT_ONOFF_GROUP_NUM	8
> +
> +/*
> + * Theoretically, there is no max channel per LED,
> + * limit this to a reasonable value for RGBW LEDs
> + */
> +#define LP5860_MAX_LED_CHANNELS		4
> +
> +#define LP5860_DEV_ATTR_RW(name)	\
> +	DEVICE_ATTR(name, 0644, lp5860_##name##_show, lp5860_##name##_store)
> +
> +#define LP5860_SHOW_MODE(nr, reg, mask, offset)				\
> +	static ssize_t lp5860_##nr##_show(struct device *dev,		\
> +					  struct device_attribute *attr,\
> +					  char *buf)			\
> +	{								\
> +		struct lp5860 *led = dev_get_drvdata(dev);		\
> +		unsigned int value = 0;					\
> +		int ret;						\
> +									\
> +		ret = regmap_read(led->regmap, reg, &value);		\
> +		if (ret)						\
> +			return ret;					\
> +		return sysfs_emit(buf, "%d\n", (value & (int)mask) >> (int)offset);\
> +	}
> +
> +#define LP5860_STORE_MODE(nr, reg, mask, offset)			\
> +	static ssize_t lp5860_##nr##_store(struct device *dev,		\
> +					   struct device_attribute *attr,\
> +					   const char *buf, size_t len) \
> +	{								\
> +		struct lp5860 *led = dev_get_drvdata(dev);		\
> +		unsigned int value = 0;					\
> +		int ret;						\
> +									\
> +		if (kstrtoint(buf, 0, &value))				\
> +			return -EINVAL;					\
> +		ret = regmap_update_bits(led->regmap, reg, (int)mask,	\
> +					 value << (int)offset);		\
> +		if (ret < 0)						\
> +			return ret;					\
> +		return len;						\
> +	}
> +
> +struct lp5860_led {
> +	struct lp5860 *priv;
> +	struct led_classdev_mc mc_cdev;
> +	u8 chan_nr;
> +	u8 led_current;
> +	u8 brightness;
> +	enum led_default_state default_state;
> +};
> +
> +struct lp5860 {
> +	struct device *dev;
> +	struct regmap *regmap;
> +
> +	DECLARE_FLEX_ARRAY(struct lp5860_led, leds);
> +};
> +
> +int lp5860_device_init(struct lp5860 *lp5860);
> +void lp5860_device_remove(struct device *dev);
> +
> +#endif /* _LEDS_LP5860_H */
> 
> -- 
> 2.47.1
> 
> 

-- 
Lee Jones [李琼斯]

