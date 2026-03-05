Return-Path: <linux-leds+bounces-7098-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eB5nJdNGqWm33gAAu9opvQ
	(envelope-from <linux-leds+bounces-7098-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 05 Mar 2026 10:03:15 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 729F020DE2B
	for <lists+linux-leds@lfdr.de>; Thu, 05 Mar 2026 10:03:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F0713079665
	for <lists+linux-leds@lfdr.de>; Thu,  5 Mar 2026 08:58:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 546BB376BE0;
	Thu,  5 Mar 2026 08:58:48 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16859374E60
	for <linux-leds@vger.kernel.org>; Thu,  5 Mar 2026 08:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772701128; cv=none; b=ST1DFteZAxByB9fQX8mU5gJ9y8ibB9cUYXmCaJAsCHRCzjiRV3yCcZK6F/zCoFjCNMaHEb8A3u7604s79qcKPtH+4UtNFzmRVky2kx+Jldya3zxrIGENUroBO3xoTK9FF0EM0yrOVHLLWe+0KX1LMjAxUPnL4RqRu872XM/F+1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772701128; c=relaxed/simple;
	bh=cgBpIUvwOjlSU/AmSXcDHl6NxyMdPIyhsO/VnoLN8x0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rW7br7rVDGzbWw9Nn/MYRUDeQXt3YhMQFOQSgy0EpsRqoa+ckDKhW5/lNsaiDDdB/Q3xWj9gSV+7JP13iCkjHy5O6/vV8feW6FeYOlIBZbY8fWO7dNIduefhvfFzx4D4vWijDTj7r42Ce5GySlc3apg7QwC+H9yXQ39nYkrRnUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1vy4Xc-0007my-EK; Thu, 05 Mar 2026 09:58:44 +0100
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
To: Nam Tran <trannamatk@gmail.com>
Cc: Lee Jones <lee@kernel.org>,  Pavel Machek <pavel@kernel.org>,
  linux-kernel@vger.kernel.org,  linux-leds@vger.kernel.org
Subject: Re: [PATCH v6] leds: add support for TI LP5860 LED driver chip
In-Reply-To: <20260217-v6-14-topic-ti-lp5860-v6-1-54a766d8b602@pengutronix.de>
	(Steffen Trumtrar's message of "Tue, 17 Feb 2026 15:46:23 +0100")
References: <20260217-v6-14-topic-ti-lp5860-v6-1-54a766d8b602@pengutronix.de>
User-Agent: mu4e 1.12.13; emacs 30.2
Date: Thu, 05 Mar 2026 09:58:43 +0100
Message-ID: <87zf4mtzy4.fsf@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
X-Rspamd-Queue-Id: 729F020DE2B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[s.trumtrar@pengutronix.de,linux-leds@vger.kernel.org];
	DMARC_NA(0.00)[pengutronix.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-7098-lists,linux-leds=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-0.913];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pengutronix.de:mid,pengutronix.de:email,pengutronix.de:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On 2026-02-17 at 15:46 +01, Steffen Trumtrar <s.trumtrar@pengutronix.de> wrote:

Hi,

is this okay now? Anything I need to done here?


Best regards,
Steffen

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
> +
> +	led_mc_calc_color_components(mc_cdev, brightness);
> +
> +	for (i = 0; i < led->mc_cdev.num_colors; i++) {
> +		unsigned int channel = mc_cdev->subled_info[i].channel;
> +		unsigned int led_brightness = mc_cdev->subled_info[i].brightness;
> +		int ret;
> +
> +		ret = lp5860_set_dot_onoff(led, channel, led_brightness);
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
> +				continue;
> +			}
> +
> +			ret = fwnode_property_read_u32(led_node, "reg", &channel);
> +			if (ret < 0) {
> +				dev_err(lp->dev, "%pfwP: 'reg' property is missing. Skipping.\n",
> +					led_node);
> +				fwnode_handle_put(led_node);
> +				continue;
> +			}
> +
> +			mc_led_info[chan].color_index = color_index;
> +			mc_led_info[chan].channel = channel;
> +			lp5860_led_init(led, init_data.fwnode, chan);
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
> +		return PTR_ERR(lp5860->regmap);
> +	}
> +
> +	lp5860->dev = dev;
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
> diff --git a/include/linux/platform_data/leds-lp5860.h b/include/linux/platform_data/leds-lp5860.h
> new file mode 100644
> index 0000000000000..7bc69a7a550dd
> --- /dev/null
> +++ b/include/linux/platform_data/leds-lp5860.h
> @@ -0,0 +1,268 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2025 Pengutronix
> + *
> + * Author: Steffen Trumtrar <kernel@pengutronix.de>
> + */
> +
> +#ifndef _LEDS_LP5860_COMMON_H
> +#define _LEDS_LP5860_COMMON_H
> +
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
> +#define LP5860_REG_FAULT_STATE		0x64
> +#define LP5860_REG_DOT_LOD_START	0x65
> +#define LP5860_REG_DOT_LSD_START	0x86
> +#define LP5860_REG_LOD_CLEAR		0xA7
> +#define LP5860_REG_LSD_CLEAR		0xA8
> +#define LP5860_REG_RESET		0xA9
> +#define LP5860_REG_DC_START		0x0100
> +#define LP5860_REG_PWM_BRI_START	0x0200
> +#define LP5860_MAX_REG			0x038B
> +
> +/* Register chip_enable value */
> +#define LP5860_CHIP_OFFSET		0
> +#define LP5860_CHIP_MASK		BIT(0)
> +#define LP5860_CHIP_DISABLE		0x00
> +#define LP5860_CHIP_ENABLE		0x01
> +
> +/* Register dev_initial value */
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
> +/* Register dev_config1 value */
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
> +/* Register dev_config2 value */
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
> +/* Register dev_config3 value */
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
> +/* Register CC group select */
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
> +#define LP5860_DOT_ALL_ON		0xff
> +#define LP5860_DOT_ALL_OFF		0x0
> +#define LP5860_PWM_DOT_MAX		0xff
> +/* Dot onoff value */
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
> +/* Dot lod value */
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
> +/* dot lsd value */
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
> +/* Register lod state */
> +#define LP5860_GLOBAL_LOD_OFFSET	1
> +#define LP5860_GLOBAL_LOD_STATE		BIT(1)
> +#define LP5860_GLOBAL_LSD_OFFSET	0
> +#define LP5860_GLOBAL_LSD_STATE		BIT(0)
> +
> +#define LP5860_FAULT_STATE_ON		0x01
> +#define LP5860_FAULT_STATE_OFF		0x00
> +
> +#define LP5860_GLOBAL_LOD_CLEAR		0x00
> +#define LP5860_GLOBAL_LSD_CLEAR		0x00
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
> +struct lp5860_led {
> +	struct lp5860 *chip;
> +	struct led_classdev_mc mc_cdev;
> +	u8 brightness;
> +};
> +
> +struct lp5860 {
> +	struct device *dev;
> +	struct regmap *regmap;
> +	unsigned int leds_count;
> +
> +	DECLARE_FLEX_ARRAY(struct lp5860_led, leds);
> +};
> +
> +int lp5860_device_init(struct device *dev);
> +void lp5860_device_remove(struct device *dev);
> +
> +#endif /* _LEDS_LP5860_H */
> 
> ---
> base-commit: c4dffb16defeddb33f9605dc94cbf15f540f98e1
> change-id: 20250219-v6-14-topic-ti-lp5860-f25a48b62c79
> 
> Best regards,

-- 
Pengutronix e.K.                | Dipl.-Inform. Steffen Trumtrar |
Steuerwalder Str. 21            | https://www.pengutronix.de/    |
31137 Hildesheim, Germany       | Phone: +49-5121-206917-0       |
Amtsgericht Hildesheim, HRA 2686| Fax:   +49-5121-206917-5555    |

