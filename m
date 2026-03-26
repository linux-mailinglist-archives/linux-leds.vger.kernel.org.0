Return-Path: <linux-leds+bounces-7526-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id V3dAG54TxWnr6QQAu9opvQ
	(envelope-from <linux-leds+bounces-7526-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 26 Mar 2026 12:08:14 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FAB3340D1
	for <lists+linux-leds@lfdr.de>; Thu, 26 Mar 2026 12:08:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE6D431403BE
	for <lists+linux-leds@lfdr.de>; Thu, 26 Mar 2026 10:49:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0A123E716B;
	Thu, 26 Mar 2026 10:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CfrQ442s"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA91B3E715B;
	Thu, 26 Mar 2026 10:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774522037; cv=none; b=Fq/F47HqknTWUE6AnVnAIAkp0RUg7R/hfS/PElMs6dJ966OgasdE6coeTDZgLD9WTzEEz0qWtGFO2KTLwR2rykVJlLskh5KnsePl5joqTfWkHLsMqE2IbemN7GMP0aTA4/3PkyTavFBMYV5OpLOm4ShZHi57lYcDt13oWf7otLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774522037; c=relaxed/simple;
	bh=Mh0/V59iUzdlzHJ05ubOL948sg0vbGX2PEuYvUhL9yI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IYbnxSSlnZYR4Fsen6iKcgj4ivsNuuvvIGSBCpHa5mk3XmlI/EoTcZgHyDzXhijmfTnm/YGhFVaZXfxnYxMQh8GR+4qAzuwbc4MyynkkC+arAstuQyg5Be8Ua1mCNnLl4ZIZN2HN+I/gh9DWoRfyrzey62SeOvPxJQPtlKWNayg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CfrQ442s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F225DC2BC87;
	Thu, 26 Mar 2026 10:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774522037;
	bh=Mh0/V59iUzdlzHJ05ubOL948sg0vbGX2PEuYvUhL9yI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CfrQ442swZWGOLF5myysTcz6u0fhY9uKdGCDIFZCNNDfytvFVqmAFzhWd567ngcwq
	 f+23attc/lJiS3zzQcRwGn+Ckv8v2nHvrpstjuvp2cR0VH4kQoeNuD/HiraCT40Sno
	 C2kft+GEUjUzRJAZA5Juz1wgHbcaaILDDBPmwDnhC7z5Eot5WfALErAUuTmNaADPsC
	 7hhYk8cz1VadF4pGtPQdGtS7heHzX++g5urEMmxgyYFJDX2j/L/vf/HpPLIdqOlzPR
	 fUaV94uG6kLArGyUAATSdJRivEYhao4AmCzh1dr4TXsjqoLbiN9PFRaUm3awP4vXzV
	 B2zLt4jMi8w1A==
Date: Thu, 26 Mar 2026 10:47:13 +0000
From: Lee Jones <lee@kernel.org>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Nam Tran <trannamatk@gmail.com>, Pavel Machek <pavel@kernel.org>,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v6] leds: add support for TI LP5860 LED driver chip
Message-ID: <20260326104713.GI1141718@google.com>
References: <20260217-v6-14-topic-ti-lp5860-v6-1-54a766d8b602@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260217-v6-14-topic-ti-lp5860-v6-1-54a766d8b602@pengutronix.de>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7526-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-leds];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B8FAB3340D1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 17 Feb 2026, Steffen Trumtrar wrote:

> Add support for the Texas Instruments LP5860 LED driver chip
> via SPI interfaces.
> 
> The LP5860 is an LED matrix driver for up to 196 LEDs, which supports
> short and open detection of the individual channel select lines.
> 
> It can be connected to SPI or I2C bus. For now add support for SPI only.
> 
> The original driver is from an unknown author at Texas Instruments. Only
> the cryptic handle 'zlzx' is known.

This paragraph seems a bit informal for a commit message. Is it necessary to
include the history of the original author? It might be better to keep the
commit message focused on the technical aspects of the change.

> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---
> Changes since v6:
> - fix compilation as module
> - remove unnecessary select on FW_LOADER
> - Link to v6: https://lore.kernel.org/r/20251201-v6-14-topic-ti-lp5860-v6-0-be9a21218157@pengutronix.de
> 
> Changes since v5:
> - Kconfig depends -> select
> - change some function/variable names
> - change line breaks (80char -> 100char)
> - call led_init_default_state_get once
> - rename index variable i -> led_index
> - don't fail on missing dt-properties
> - remove sysfs_create_group residue from v5
> - Link to v5: https://lore.kernel.org/r/20251110-v6-14-topic-ti-lp5860-v5-0-5b777b99a905@pengutronix.de
> 
> Changes since v4:
> - remove global_brightness code and sysfs ABI
> - rebase to v6.18-rc1
> - Link to v4: https://lore.kernel.org/r/20251007-v6-14-topic-ti-lp5860-v4-0-967758069b60@pengutronix.de
> 
> Changes since v3:
> - move to drivers/leds/rgb
> - fix some upper/lowercase
> - use ATTRIBUTE_GROUPS macro
> - unwrap some lines
> - Link to v3: https://lore.kernel.org/r/20250911-v6-14-topic-ti-lp5860-v3-0-390738ef9d71@pengutronix.de
> 
> Changes since v2:
> - fix c-styling errors
> - rename functions/defines/variables
> - split out ABI documentation
> - rename [rgb]_current* to [rgb]_global_brightness*
> - rework multi-led probing
> - Link to v2: https://lore.kernel.org/r/20250514-v6-14-topic-ti-lp5860-v2-0-72ecc8fa4ad7@pengutronix.de
> 
> Changes since v1:
> - add open and short detection
> - add ABI documentation
> - fix devicetree binding (maxItems/minItems)
> - fix commit message to imperative mood
> - minor cleanup
> - Link to v1: https://lore.kernel.org/r/20250220-v6-14-topic-ti-lp5860-v1-0-42874bdc7513@pengutronix.de
> ---
>  drivers/leds/rgb/Kconfig                  |  25 +++
>  drivers/leds/rgb/Makefile                 |   2 +
>  drivers/leds/rgb/leds-lp5860-core.c       | 200 ++++++++++++++++++++++
>  drivers/leds/rgb/leds-lp5860-spi.c        |  89 ++++++++++
>  include/linux/platform_data/leds-lp5860.h | 268 ++++++++++++++++++++++++++++++
>  5 files changed, 584 insertions(+)
> 
> diff --git a/drivers/leds/rgb/Kconfig b/drivers/leds/rgb/Kconfig
> index 28ef4c487367c..e9386c8c4bbbb 100644
> --- a/drivers/leds/rgb/Kconfig
> +++ b/drivers/leds/rgb/Kconfig
> @@ -39,6 +39,31 @@ config LEDS_LP5812
>  
>  	  If unsure, say N.
>  
> +config LEDS_LP5860_CORE
> +	tristate "Core Driver for TI LP5860"
> +	depends on LEDS_CLASS
> +	depends on OF
> +	select REGMAP
> +	help
> +	  This option supports common operations for LP5860 devices.
> +	  The LP5860 is a LED matrix driver with 18 constant current
> +	  sinks and 11 scan switches for 198 LED dots. Each dot can be
> +	  controlled individually and supports 8/16-bit PWM dimming.
> +	  The chip supports individual LED open and short detection.
> +
> +	  The device can be used with SPI or I2C bus.
> +
> +config LEDS_LP5860_SPI
> +	tristate "LED Support for TI LP5860 SPI LED driver chip"
> +	depends on SPI
> +	select LEDS_LP5860_CORE
> +	help
> +	  If you say yes here you get support for the Texas Instruments
> +	  LP5860 LED driver for SPI bus connections.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called lp5860_spi.
> +
>  config LEDS_NCP5623
>  	tristate "LED support for NCP5623"
>  	depends on I2C
> diff --git a/drivers/leds/rgb/Makefile b/drivers/leds/rgb/Makefile
> index be45991f63f50..f3b365ea082d1 100644
> --- a/drivers/leds/rgb/Makefile
> +++ b/drivers/leds/rgb/Makefile
> @@ -3,6 +3,8 @@
>  obj-$(CONFIG_LEDS_GROUP_MULTICOLOR)	+= leds-group-multicolor.o
>  obj-$(CONFIG_LEDS_KTD202X)		+= leds-ktd202x.o
>  obj-$(CONFIG_LEDS_LP5812)		+= leds-lp5812.o
> +obj-$(CONFIG_LEDS_LP5860_CORE)		+= leds-lp5860-core.o
> +obj-$(CONFIG_LEDS_LP5860_SPI)		+= leds-lp5860-spi.o

Nit: Please keep this list sorted alphabetically.

>  obj-$(CONFIG_LEDS_NCP5623)		+= leds-ncp5623.o
>  obj-$(CONFIG_LEDS_PWM_MULTICOLOR)	+= leds-pwm-multicolor.o
>  obj-$(CONFIG_LEDS_QCOM_LPG)		+= leds-qcom-lpg.o
> diff --git a/drivers/leds/rgb/leds-lp5860-core.c b/drivers/leds/rgb/leds-lp5860-core.c
> new file mode 100644
> index 0000000000000..28b4d86e11f1a
> --- /dev/null
> +++ b/drivers/leds/rgb/leds-lp5860-core.c
> @@ -0,0 +1,200 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2025 Pengutronix
> + *
> + * Author: Steffen Trumtrar <kernel@pengutronix.de>
> + */
> +
> +#include <linux/gpio.h>
> +#include <linux/led-class-multicolor.h>
> +#include <linux/module.h>
> +#include <linux/of_gpio.h>

Are `gpio.h` and `of_gpio.h` needed here? I don't see any GPIO functions
being used in this file.

> +#include <linux/of_platform.h>
> +#include <linux/regmap.h>
> +
> +#include <linux/platform_data/leds-lp5860.h>
> +
> +static struct lp5860_led *mcled_cdev_to_led(struct led_classdev_mc *mc_cdev)
> +{
> +	return container_of(mc_cdev, struct lp5860_led, mc_cdev);
> +}
> +
> +static int lp5860_set_dot_onoff(struct lp5860_led *led, unsigned int dot, bool enable)
> +{
> +	unsigned int offset = dot / LP5860_MAX_DOT_ONOFF_GROUP_NUM;
> +	unsigned int mask = BIT(dot % LP5860_MAX_DOT_ONOFF_GROUP_NUM);
> +
> +	if (dot > LP5860_REG_DOT_ONOFF_MAX)

Using a register value as an LED max value seems odd, even if it does
corrilate.  Can I suggest you create a new define or at least rename
this one to LP5860_MAX_LED or something?

> +		return -EINVAL;
> +
> +	return regmap_update_bits(led->chip->regmap,
> +				  LP5860_REG_DOT_ONOFF_START + offset, mask,
> +				  enable ? LP5860_DOT_ALL_ON : LP5860_DOT_ALL_OFF);
> +}
> +
> +static int lp5860_set_mc_brightness(struct led_classdev *cdev,
> +				    enum led_brightness brightness)
> +{
> +	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(cdev);
> +	struct lp5860_led *led = mcled_cdev_to_led(mc_cdev);
> +	int i;

Nit: `for (int i = 0; ...)` is preferred for loop counters these days.

> +
> +	led_mc_calc_color_components(mc_cdev, brightness);
> +
> +	for (i = 0; i < led->mc_cdev.num_colors; i++) {
> +		unsigned int channel = mc_cdev->subled_info[i].channel;
> +		unsigned int led_brightness = mc_cdev->subled_info[i].brightness;
> +		int ret;
> +
> +		ret = lp5860_set_dot_onoff(led, channel, led_brightness);

`lp5860_set_dot_onoff()` expects a boolean for its 'enable' argument, but
'led_brightness' is an integer. While this works due to implicit conversion, it
would be clearer to be explicit.  Like `led_brightness > 0` or `!!led_brightness`.

> +		if (ret)
> +			return ret;
> +
> +		ret = regmap_write(led->chip->regmap,
> +				   LP5860_REG_PWM_BRI_START + channel, led_brightness);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int lp5860_chip_enable_toggle(struct lp5860 *led, int enable)

The name `*_toggle` suggests flipping the state, but this function sets it
based on the `enable` parameter. Perhaps `lp5860_chip_enable` would be a
better name? Also, `enable` should be a bool.

> +{
> +	return regmap_write(led->regmap, LP5860_REG_CHIP_EN, enable);
> +}
> +
> +static int lp5860_led_init(struct lp5860_led *led, struct fwnode_handle *fwnode,
> +			   unsigned int channel)
> +{
> +	enum led_default_state default_state;
> +	unsigned int brightness;
> +	int ret;
> +
> +	ret = regmap_read(led->chip->regmap, LP5860_REG_PWM_BRI_START + channel, &brightness);
> +	if (ret)
> +		return ret;
> +
> +	default_state = led_init_default_state_get(fwnode);
> +
> +	switch (default_state) {
> +	case LEDS_DEFSTATE_ON:
> +		led->brightness = LP5860_MAX_BRIGHTNESS;
> +		break;
> +	case LEDS_DEFSTATE_KEEP:
> +		led->brightness = min(brightness, LP5860_MAX_BRIGHTNESS);
> +		break;
> +	default:
> +		led->brightness = 0;
> +		break;
> +	}
> +
> +	return lp5860_set_mc_brightness(&led->mc_cdev.led_cdev, led->brightness);
> +}
> +
> +static int lp5860_init_dt(struct lp5860 *lp)
> +{
> +	struct fwnode_handle *led_node = NULL;
> +	struct led_init_data init_data = {};
> +	struct led_classdev *led_cdev;
> +	struct mc_subled *mc_led_info;
> +	struct lp5860_led *led;
> +	int led_index = 0;
> +	int chan;
> +	int ret;
> +
> +	device_for_each_child_node_scoped(lp->dev, multi_led) {
> +		led = &lp->leds[led_index];
> +
> +		init_data.fwnode = multi_led;
> +
> +		/* Count the number of channels in this multi_led */
> +		chan = fwnode_get_child_node_count(multi_led);
> +		if (!chan || chan > LP5860_MAX_LED_CHANNELS)
> +			return -EINVAL;
> +
> +		led->mc_cdev.num_colors = chan;
> +
> +		mc_led_info = devm_kcalloc(lp->dev, chan, sizeof(*mc_led_info), GFP_KERNEL);
> +		if (!mc_led_info)
> +			return -ENOMEM;
> +
> +		led->chip = lp;
> +		led->mc_cdev.subled_info = mc_led_info;
> +		led_cdev = &led->mc_cdev.led_cdev;
> +		led_cdev->max_brightness = LP5860_MAX_BRIGHTNESS;
> +		led_cdev->brightness_set_blocking = lp5860_set_mc_brightness;
> +
> +		chan = 0;
> +		/* Initialize all channels of this multi_led */
> +		fwnode_for_each_child_node(multi_led, led_node) {
> +			u32 channel;
> +			u32 color_index;
> +
> +			ret = fwnode_property_read_u32(led_node, "color", &color_index);
> +			if (ret) {
> +				dev_err(lp->dev, "%pfwP: Cannot read 'color' property. Skipping.\n",
> +					led_node);
> +				fwnode_handle_put(led_node);

Doesn't `fwnode_for_each_child_node()` already handle this?

> +				continue;
> +			}
> +
> +			ret = fwnode_property_read_u32(led_node, "reg", &channel);
> +			if (ret < 0) {
> +				dev_err(lp->dev, "%pfwP: 'reg' property is missing. Skipping.\n",
> +					led_node);
> +				fwnode_handle_put(led_node);

As above.

> +				continue;
> +			}
> +
> +			mc_led_info[chan].color_index = color_index;
> +			mc_led_info[chan].channel = channel;
> +			lp5860_led_init(led, init_data.fwnode, chan);

There seems to be a logic issue here. `lp5860_led_init`'s third argument is
'channel', which is then used as an offset from `LP5860_REG_PWM_BRI_START`.
However, you are passing `chan`, which is just the loop index (0, 1, 2, ...).
Shouldn't you be passing `channel`, the value read from the 'reg' property?

The use of `chan` and `channel` in here is confusing at best.

This logic is also appears to be highly inefficient since you end up
calling `lp5860_set_mc_brightness()` for each sub-LED and
`lp5860_set_mc_brightness()` iterates over and sets *all* colors for the
multi-color LED.

> +
> +			chan++;
> +		}
> +
> +		ret = devm_led_classdev_multicolor_register_ext(lp->dev, &led->mc_cdev, &init_data);
> +		if (ret) {
> +			dev_err(lp->dev, "%pfwP: Failed to register Multi-Color LEDs\n", multi_led);
> +			return ret;
> +		}
> +		led_index++;
> +	}
> +
> +	return 0;
> +}
> +
> +int lp5860_device_init(struct device *dev)
> +{
> +	struct lp5860 *lp = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = lp5860_chip_enable_toggle(lp, LP5860_CHIP_ENABLE);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Set to 8-bit PWM data without VSYNC.
> +	 * Data is sent out for display instantly after received.
> +	 */
> +	ret = regmap_update_bits(lp->regmap, LP5860_REG_DEV_INITIAL, LP5860_MODE_MASK,
> +				 LP5860_MODE_1 << LP5860_MODE_OFFSET);
> +	if (ret < 0)

Nit: `if (ret)` is the preferred style for checking error codes.

> +		return ret;
> +
> +	return lp5860_init_dt(lp);
> +}
> +EXPORT_SYMBOL_GPL(lp5860_device_init);
> +
> +void lp5860_device_remove(struct device *dev)
> +{
> +	struct lp5860 *lp = dev_get_drvdata(dev);
> +
> +	lp5860_chip_enable_toggle(lp, LP5860_CHIP_DISABLE);
> +}
> +EXPORT_SYMBOL_GPL(lp5860_device_remove);
> +
> +MODULE_AUTHOR("Steffen Trumtrar <kernel@pengutronix.de>");
> +MODULE_DESCRIPTION("TI LP5860 RGB LED core driver");
> +MODULE_LICENSE("GPL");

Should this be `GPL v2`?

> diff --git a/drivers/leds/rgb/leds-lp5860-spi.c b/drivers/leds/rgb/leds-lp5860-spi.c
> new file mode 100644
> index 0000000000000..1a35a18f50fde
> --- /dev/null
> +++ b/drivers/leds/rgb/leds-lp5860-spi.c
> @@ -0,0 +1,89 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2025 Pengutronix
> + *
> + * Author: Steffen Trumtrar <kernel@pengutronix.de>
> + */
> +
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/spi/spi.h>
> +
> +#include <linux/platform_data/leds-lp5860.h>
> +
> +#define LP5860_SPI_WRITE_FLAG BIT(5)
> +
> +static const struct regmap_config lp5860_regmap_config = {
> +	.name = "lp5860-spi",
> +	.reg_bits = 10,
> +	.pad_bits = 6,
> +	.val_bits = 8,
> +	.write_flag_mask = (__force unsigned long)cpu_to_be16(LP5860_SPI_WRITE_FLAG),

This is quite difficult to understand. `cpu_to_be16(BIT(5))` on a little-endian
system results in `0x2000`, which is `BIT(13)`. This seems to be an overly
complex way of setting bit 13 in the 16-bit address word.

Could you simplify this to just `BIT(13)` and add a comment explaining the
SPI protocol's write flag position? The casts are also unnecessary.

> +	.reg_format_endian = REGMAP_ENDIAN_BIG,
> +	.max_register = LP5860_MAX_REG,
> +};
> +
> +static int lp5860_probe(struct spi_device *spi)
> +{
> +	struct device *dev = &spi->dev;
> +	struct lp5860 *lp5860;
> +	unsigned int multi_leds;
> +
> +	multi_leds = device_get_child_node_count(dev);
> +	if (!multi_leds) {
> +		dev_err(dev, "LEDs are not defined in Device Tree!");
> +		return -ENODEV;
> +	}
> +
> +	if (multi_leds > LP5860_MAX_LED) {
> +		dev_err(dev, "Too many LEDs specified.\n");
> +		return -EINVAL;
> +	}
> +
> +	lp5860 = devm_kzalloc(dev, struct_size(lp5860, leds, multi_leds),
> +			      GFP_KERNEL);
> +	if (!lp5860)
> +		return -ENOMEM;
> +
> +	lp5860->leds_count = multi_leds;
> +
> +	lp5860->regmap = devm_regmap_init_spi(spi, &lp5860_regmap_config);
> +	if (IS_ERR(lp5860->regmap)) {
> +		dev_err(&spi->dev, "Failed to initialise Regmap.\n");

`dev_err_probe()`?

> +		return PTR_ERR(lp5860->regmap);
> +	}
> +
> +	lp5860->dev = dev;

Where is this used?

> +
> +	spi_set_drvdata(spi, lp5860);
> +
> +	return lp5860_device_init(dev);
> +}
> +
> +static void lp5860_remove(struct spi_device *spi)
> +{
> +	lp5860_device_remove(&spi->dev);
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
> +		.name = "lp5860-spi",
> +		.of_match_table = lp5860_of_match,
> +	},
> +	.probe	= lp5860_probe,
> +	.remove = lp5860_remove,
> +};
> +module_spi_driver(lp5860_driver);
> +
> +MODULE_AUTHOR("Steffen Trumtrar <kernel@pengutronix.de>");
> +MODULE_DESCRIPTION("TI LP5860 RGB LED spi driver");
> +MODULE_LICENSE("GPL");

"GPL v2"?

> diff --git a/include/linux/platform_data/leds-lp5860.h b/include/linux/platform_data/leds-lp5860.h

The `platform_data` directory is generally for legacy board files. For a new
DT-based driver, the header file would normally live in a more specific
subsystem directory, like `include/linux/leds/`.

> new file mode 100644
> index 0000000000000..7bc69a7a550dd
> --- /dev/null
> +++ b/include/linux/platform_data/leds-lp5860.h
> @@ -0,0 +1,268 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2025 Pengutronix

Is the copyright year correct? `2025` is in the future. This is present in all
new files.

> + *
> + * Author: Steffen Trumtrar <kernel@pengutronix.de>
> + */
> +
> +#ifndef _LEDS_LP5860_COMMON_H
> +#define _LEDS_LP5860_COMMON_H

I'd drop the COMMON_ part.

> +#include <linux/led-class-multicolor.h>
> +#include <linux/regmap.h>
> +
> +#define LP5860_REG_CHIP_EN		0x00
> +#define LP5860_REG_DEV_INITIAL		0x01
> +#define LP5860_REG_DEV_CONFIG1		0x02
> +#define LP5860_REG_DEV_CONFIG2		0x03
> +#define LP5860_REG_DEV_CONFIG3		0x04
> +#define LP5860_REG_GLOBAL_BRI		0x05
> +#define LP5860_REG_GROUP0_BRI		0x06
> +#define LP5860_REG_GROUP1_BRI		0x07
> +#define LP5860_REG_GROUP2_BRI		0x08
> +#define LP5860_REG_R_CURRENT_SET	0x09
> +#define LP5860_REG_G_CURRENT_SET	0x0A
> +#define LP5860_REG_B_CURRENT_SET	0x0B
> +#define LP5860_REG_GRP_SEL_START	0x0C
> +#define LP5860_REG_DOT_ONOFF_START	0x43
> +#define LP5860_REG_DOT_ONOFF_MAX	0x63

A name like `..._MAX` usually implies a count or a maximum value, but this is a
register address. To avoid confusion, perhaps rename it to something like
`LP5860_REG_DOT_ONOFF_END`?

> +#define LP5860_REG_FAULT_STATE		0x64
> +#define LP5860_REG_DOT_LOD_START	0x65
> +#define LP5860_REG_DOT_LSD_START	0x86
> +#define LP5860_REG_LOD_CLEAR		0xA7
> +#define LP5860_REG_LSD_CLEAR		0xA8
> +#define LP5860_REG_RESET		0xA9
> +#define LP5860_REG_DC_START		0x0100
> +#define LP5860_REG_PWM_BRI_START	0x0200
> +#define LP5860_MAX_REG			0x038B

[...]

-- 
Lee Jones [李琼斯]

