Return-Path: <linux-leds+bounces-7929-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLpHNFiN82n/4wEAu9opvQ
	(envelope-from <linux-leds+bounces-7929-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 30 Apr 2026 19:11:52 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 302CC4A63C8
	for <lists+linux-leds@lfdr.de>; Thu, 30 Apr 2026 19:11:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E378C3008D31
	for <lists+linux-leds@lfdr.de>; Thu, 30 Apr 2026 17:11:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8831646AEFB;
	Thu, 30 Apr 2026 17:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tGhNXYIg"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B9543637C;
	Thu, 30 Apr 2026 17:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777569110; cv=none; b=fw93+XgzFfeScyntMIMPbunzIBZVEX4FCDggn7mxtkI/N7ttwsmia/2ujLDfyQga+IuKPW7qG4asmYbOUNIm5vvu/njuY3mMKrbg42nVfcdwA2pTqUVis4QsGyA/dR49yvVjrsJkx8wUHjFoboQfume4ocbviUd0zvondGrMiOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777569110; c=relaxed/simple;
	bh=wNmEewzNaC0VXTccba+3GnfkmM93bPatQMeipc4txhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XlQUWspRzMN8mP3QqVYZTIJjE14jN5wiZMb0006DEzRBKke1d7iKJqRspMSZxZ9NwyWahpMS2f9WzkSZNzNkU+k61AVondqdl6BrDIdf2BPB8YTxef+WfhO9SSUpO4hu/9gni4Ut2Ai0KmIXvN5T3i+NSrvj2e0TNTZqmFNrGjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tGhNXYIg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4903AC2BCB3;
	Thu, 30 Apr 2026 17:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777569110;
	bh=wNmEewzNaC0VXTccba+3GnfkmM93bPatQMeipc4txhY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tGhNXYIgu9Y98eRv6tCEiLXxu+VVSMxbtzmAbvRzR0wUtEXicZrcqLcXhSkyl97Mv
	 VSJ3SUWL5shGepNzHvwu22ueLu7JhDDX1YMU+XXm2MPNrQB6JJXPrghxM64ylPnCUt
	 nwk1CgqCHF7sWQRGPw0bktU0St86JOSrSP+5ZFiBSAIJPN/deiJqIps6oTqUakXRYP
	 wBTS9UFPgiYnagJU6pP6W6YDnTftIXixcDccqcRxQvH9AY6oq9E3Dz9/E1sg2oxlwY
	 gXXleYxgcpehR+1Eh+vo9SClYuUKXgGZ1zRhU05cPrem6LaxUoUZ7yDfdS54j3oF6M
	 ilxr68kaYpQxg==
Date: Thu, 30 Apr 2026 18:11:45 +0100
From: Lee Jones <lee@kernel.org>
To: Edelweise Escala <edelweise.escala@analog.com>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/2] leds: ltc3220: Add Support for LTC3220 18 channel
 LED Driver
Message-ID: <20260430171145.GA2661693@google.com>
References: <20260417-ltc3220-driver-v6-0-18157871eddd@analog.com>
 <20260417-ltc3220-driver-v6-2-18157871eddd@analog.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417-ltc3220-driver-v6-2-18157871eddd@analog.com>
X-Rspamd-Queue-Id: 302CC4A63C8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7929-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Fri, 17 Apr 2026, Edelweise Escala wrote:

> Add driver for the LTC3220 18-channel LED driver
> with I2C interface, individual brightness control, and hardware-assisted
> blink/gradation features.
> 
> Signed-off-by: Edelweise Escala <edelweise.escala@analog.com>
> ---
>  MAINTAINERS                 |   1 +
>  drivers/leds/Kconfig        |  12 ++
>  drivers/leds/Makefile       |   1 +
>  drivers/leds/leds-ltc3220.c | 418 ++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 432 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5c10cc3e3022..7467537938bf 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14961,6 +14961,7 @@ L:	linux-leds@vger.kernel.org
>  S:	Maintained
>  W:	https://ez.analog.com/linux-software-drivers
>  F:	Documentation/devicetree/bindings/leds/adi,ltc3220.yaml
> +F:	drivers/leds/leds-ltc3220.c
>  
>  LTC4282 HARDWARE MONITOR DRIVER
>  M:	Nuno Sa <nuno.sa@analog.com>
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 597d7a79c988..f00cdc11c978 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -1001,6 +1001,18 @@ config LEDS_ST1202
>  	  Say Y to enable support for LEDs connected to LED1202
>  	  LED driver chips accessed via the I2C bus.
>  
> +config LEDS_LTC3220
> +	tristate "LED Driver for Analog Devices Inc. LTC3220"
> +	depends on I2C && LEDS_CLASS
> +	help
> +	  Say Y to enable support for the Analog Devices LTC3220
> +	  18-channel LED controller with I2C interface.
> +	  The driver supports individual LED brightness control (64 steps),
> +	  hardware-assisted blinking and gradation effects.
> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called leds-ltc3220.
> +
>  config LEDS_TPS6105X
>  	tristate "LED support for TI TPS6105X"
>  	depends on LEDS_CLASS
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index 8fdb45d5b439..5301568d9e00 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -61,6 +61,7 @@ obj-$(CONFIG_LEDS_LP8788)		+= leds-lp8788.o
>  obj-$(CONFIG_LEDS_LP8860)		+= leds-lp8860.o
>  obj-$(CONFIG_LEDS_LP8864)		+= leds-lp8864.o
>  obj-$(CONFIG_LEDS_LT3593)		+= leds-lt3593.o
> +obj-$(CONFIG_LEDS_LTC3220)		+= leds-ltc3220.o
>  obj-$(CONFIG_LEDS_MAX5970)		+= leds-max5970.o
>  obj-$(CONFIG_LEDS_MAX77650)		+= leds-max77650.o
>  obj-$(CONFIG_LEDS_MAX77705)		+= leds-max77705.o
> diff --git a/drivers/leds/leds-ltc3220.c b/drivers/leds/leds-ltc3220.c
> new file mode 100644
> index 000000000000..5e1f994cc35b
> --- /dev/null
> +++ b/drivers/leds/leds-ltc3220.c
> @@ -0,0 +1,418 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * LTC3220 18-Channel LED Driver
> + *
> + * Copyright 2026 Analog Devices Inc.
> + *
> + * Author: Edelweise Escala <edelweise.escala@analog.com>
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/leds.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/regmap.h>
> +#include <linux/types.h>
> +
> +/* LTC3220 Registers */
> +#define LTC3220_COMMAND_REG				0x00
> +#define   LTC3220_QUICK_WRITE_MASK			BIT(0)
> +#define   LTC3220_SHUTDOWN_MASK				BIT(3)
> +
> +#define LTC3220_ULED_REG(x)				(0x01 + (x))
> +#define   LTC3220_LED_CURRENT_MASK			GENMASK(5, 0)
> +#define   LTC3220_LED_MODE_MASK				GENMASK(7, 6)
> +
> +#define LTC3220_GRAD_BLINK_REG				0x13
> +#define   LTC3220_GRADATION_MASK			GENMASK(2, 0)
> +#define   LTC3220_GRADATION_DIRECTION_MASK		BIT(0)
> +#define   LTC3220_GRADATION_PERIOD_MASK			GENMASK(2, 1)
> +#define   LTC3220_BLINK_MASK				GENMASK(4, 3)
> +
> +#define LTC3220_NUM_LEDS				18
> +
> +#define LTC3220_GRADATION_START_VALUE			128
> +#define LTC3220_GRADATION_RAMP_TIME_240MS		240
> +#define LTC3220_GRADATION_RAMP_TIME_480MS		480
> +
> +#define LTC3220_BLINK_ON_156MS				156
> +#define LTC3220_BLINK_ON_625MS				625
> +#define LTC3220_BLINK_PERIOD_1250MS			1250
> +#define LTC3220_BLINK_PERIOD_2500MS			2500
> +
> +#define LTC3220_BLINK_SHORT_ON_TIME			BIT(0)
> +#define LTC3220_BLINK_LONG_PERIOD			BIT(1)
> +
> +enum ltc3220_blink_mode {
> +	LTC3220_BLINK_MODE_625MS_1250MS,
> +	LTC3220_BLINK_MODE_156MS_1250MS,
> +	LTC3220_BLINK_MODE_625MS_2500MS,
> +	LTC3220_BLINK_MODE_156MS_2500MS
> +};
> +
> +enum ltc3220_gradation_mode {
> +	LTC3220_GRADATION_MODE_DISABLED,
> +	LTC3220_GRADATION_MODE_240MS_RAMP_TIME,
> +	LTC3220_GRADATION_MODE_480MS_RAMP_TIME,
> +	LTC3220_GRADATION_MODE_960MS_RAMP_TIME
> +};
> +
> +static const struct regmap_config ltc3220_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = LTC3220_GRAD_BLINK_REG,
> +};

.cache_type?

> +
> +struct ltc3220_uled_cfg {
> +	struct ltc3220_state *ltc3220_state;

This is not a linked list.  Use container_of() instead.

> +	u8 reg_value;
> +	u8 led_index;
> +};
> +
> +struct ltc3220_state {

Drop the "_state" part.

> +	struct ltc3220_uled_cfg uled_cfg[LTC3220_NUM_LEDS];
> +	struct regmap *regmap;
> +	bool is_aggregated;
> +};
> +
> +static int ltc3220_shutdown(struct ltc3220_state *ltc3220_state)
> +{
> +	return regmap_update_bits(ltc3220_state->regmap, LTC3220_COMMAND_REG,
> +				  LTC3220_SHUTDOWN_MASK, LTC3220_SHUTDOWN_MASK);
> +}
> +
> +static int ltc3220_resume_from_shutdown(struct ltc3220_state *ltc3220_state)
> +{
> +	return regmap_update_bits(ltc3220_state->regmap, LTC3220_COMMAND_REG,
> +				  LTC3220_SHUTDOWN_MASK, 0);
> +}

These do not need to be abstracted out.

> +
> +/*
> + * Set LED brightness and mode.
> + * The brightness value determines both the LED current and operating mode:
> + * 0-63:    Normal mode - LED current from 0-63 (off to full brightness)
> + * 64-127:  Blink mode - LED blinks with current level (brightness - 64)
> + * 128-191: Gradation mode - LED gradually changes brightness (brightness - 128)
> + * 192-255: GPO mode - LED operates as general purpose output (brightness - 192)
> + */
> +static int ltc3220_set_led_data(struct led_classdev *led_cdev,
> +				enum led_brightness brightness)
> +{
> +	struct ltc3220_state *ltc3220_state;
> +	struct ltc3220_uled_cfg *uled_cfg;
> +	int ret;
> +	int i;
> +
> +	uled_cfg = container_of(led_cdev, struct ltc3220_uled_cfg, led_cdev);
> +	ltc3220_state = uled_cfg->ltc3220_state;
> +
> +	ret = regmap_write(ltc3220_state->regmap, LTC3220_ULED_REG(uled_cfg->led_index),
> +			   brightness);
> +	if (ret < 0)

Should we be using 'if (ret)' to check for errors here instead of 'if (ret < 0)'?

> +		return ret;
> +
> +	uled_cfg->reg_value = brightness;
> +
> +	/*
> +	 * When aggregated LED mode is enabled, writing to LED 1 updates all
> +	 * LEDs simultaneously via quick-write mode. Update cached values for
> +	 * all LEDs to reflect the synchronized state.
> +	 * See Documentation/devicetree/bindings/leds/adi,ltc3220.yaml for how
> +	 * to configure aggregated LED mode.
> +	 */
> +	if (ltc3220_state->is_aggregated && uled_cfg->led_index == 0) {
> +		for (i = 0; i < LTC3220_NUM_LEDS; i++)

for (int i = 0; ...

> +			ltc3220_state->uled_cfg[i].reg_value = brightness;
> +	}
> +
> +	return 0;
> +}
> +
> +static enum led_brightness ltc3220_get_led_data(struct led_classdev *led_cdev)
> +{
> +	struct ltc3220_uled_cfg *uled_cfg = container_of(led_cdev,
> +							 struct ltc3220_uled_cfg, led_cdev);
> +
> +	return uled_cfg->reg_value;
> +}
> +
> +/*
> + * LTC3220 pattern support for hardware-assisted breathing/gradation.
> + * The hardware supports 3 gradation ramp time 240ms, 480ms, 960ms)
> + * and can ramp up or down.
> + *
> + * Pattern array interpretation:
> + *   pattern[0].brightness = start brightness (0-63)
> + *   pattern[0].delta_t = ramp time in milliseconds
> + *   pattern[1].brightness = end brightness (0-63)
> + *   pattern[1].delta_t = (optional, can be 0 or same as pattern[0].delta_t)
> + */
> +static int ltc3220_pattern_set(struct led_classdev *led_cdev,
> +			       struct led_pattern *pattern,
> +			       u32 len, int repeat)
> +{
> +	struct ltc3220_uled_cfg *uled_cfg = container_of(led_cdev, struct ltc3220_uled_cfg,
> +							 led_cdev);

This is the 3rd time we do this and every time has been different.

> +	struct ltc3220_state *ltc3220_state = uled_cfg->ltc3220_state;
> +	u8 gradation_period;
> +	u8 start_brightness;
> +	u8 end_brightness;
> +	u8 reg_val;

Something a little more descriptive please.

> +	bool is_increasing;
> +	int ret;
> +
> +	if (len != 2)
> +		return -EINVAL;
> +
> +	start_brightness = pattern[0].brightness & LTC3220_LED_CURRENT_MASK;
> +	end_brightness = pattern[1].brightness & LTC3220_LED_CURRENT_MASK;
> +
> +	is_increasing = end_brightness > start_brightness;
> +
> +	if (pattern[0].delta_t == 0)
> +		gradation_period = LTC3220_GRADATION_MODE_DISABLED;
> +	else if (pattern[0].delta_t <= LTC3220_GRADATION_RAMP_TIME_240MS)
> +		gradation_period = LTC3220_GRADATION_MODE_240MS_RAMP_TIME;
> +	else if (pattern[0].delta_t <= LTC3220_GRADATION_RAMP_TIME_480MS)
> +		gradation_period = LTC3220_GRADATION_MODE_480MS_RAMP_TIME;
> +	else
> +		gradation_period = LTC3220_GRADATION_MODE_960MS_RAMP_TIME;
> +
> +	reg_val = FIELD_PREP(LTC3220_GRADATION_PERIOD_MASK, gradation_period);
> +	reg_val |= FIELD_PREP(LTC3220_GRADATION_DIRECTION_MASK, is_increasing);
> +
> +	ret = regmap_update_bits(ltc3220_state->regmap, LTC3220_GRAD_BLINK_REG,
> +				 LTC3220_GRADATION_MASK, reg_val);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = ltc3220_set_led_data(led_cdev, start_brightness);
> +	if (ret < 0)
> +		return ret;
> +
> +	return ltc3220_set_led_data(led_cdev, LTC3220_GRADATION_START_VALUE + end_brightness);
> +}
> +
> +static int ltc3220_pattern_clear(struct led_classdev *led_cdev)
> +{
> +	struct ltc3220_uled_cfg *uled_cfg = container_of(led_cdev, struct ltc3220_uled_cfg,
> +							 led_cdev);
> +	struct ltc3220_state *ltc3220_state = uled_cfg->ltc3220_state;
> +
> +	return regmap_update_bits(ltc3220_state->regmap, LTC3220_GRAD_BLINK_REG,
> +							  LTC3220_GRADATION_MASK, 0);

Odd tabbing.

> +}
> +
> +/*
> + * LTC3220 has a global blink configuration that affects all LEDs.
> + * This implementation allows per-LED blink requests, but the blink timing
> + * will be shared across all LEDs. The delay values are mapped to the
> + * hardware's discrete blink rates.
> + */
> +static int ltc3220_blink_set(struct led_classdev *led_cdev,
> +			     unsigned long *delay_on,
> +			     unsigned long *delay_off)
> +{
> +	struct ltc3220_uled_cfg *uled_cfg = container_of(led_cdev, struct ltc3220_uled_cfg,
> +							 led_cdev);
> +	struct ltc3220_state *ltc3220_state = uled_cfg->ltc3220_state;
> +	u8 blink_mode = 0;
> +
> +	if (*delay_on <= LTC3220_BLINK_ON_156MS)
> +		blink_mode = LTC3220_BLINK_SHORT_ON_TIME;
> +
> +	if (*delay_on + *delay_off > LTC3220_BLINK_PERIOD_1250MS)
> +		blink_mode |= LTC3220_BLINK_LONG_PERIOD;
> +
> +	switch (blink_mode) {
> +	case LTC3220_BLINK_MODE_625MS_1250MS:
> +		*delay_on = LTC3220_BLINK_ON_625MS;
> +		*delay_off = LTC3220_BLINK_PERIOD_1250MS - LTC3220_BLINK_ON_625MS;
> +		break;
> +	case LTC3220_BLINK_MODE_156MS_1250MS:
> +		*delay_on = LTC3220_BLINK_ON_156MS;
> +		*delay_off = LTC3220_BLINK_PERIOD_1250MS - LTC3220_BLINK_ON_156MS;
> +		break;
> +	case LTC3220_BLINK_MODE_625MS_2500MS:
> +		*delay_on = LTC3220_BLINK_ON_625MS;
> +		*delay_off = LTC3220_BLINK_PERIOD_2500MS - LTC3220_BLINK_ON_625MS;
> +		break;
> +	case LTC3220_BLINK_MODE_156MS_2500MS:
> +		*delay_on = LTC3220_BLINK_ON_156MS;
> +		*delay_off = LTC3220_BLINK_PERIOD_2500MS - LTC3220_BLINK_ON_156MS;
> +		break;
> +	}
> +
> +	return regmap_update_bits(ltc3220_state->regmap, LTC3220_GRAD_BLINK_REG,
> +				  LTC3220_BLINK_MASK, blink_mode);
> +}
> +
> +static void ltc3220_reset_gpio_action(void *data)
> +{
> +	struct gpio_desc *reset_gpio = data;
> +
> +	gpiod_set_value_cansleep(reset_gpio, 1);
> +}
> +
> +static int ltc3220_reset(struct ltc3220_state *ltc3220_state, struct i2c_client *client)
> +{
> +	struct gpio_desc *reset_gpio;
> +	int ret;
> +	int i;
> +
> +	reset_gpio = devm_gpiod_get_optional(&client->dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(reset_gpio))
> +		return dev_err_probe(&client->dev, PTR_ERR(reset_gpio), "Failed on reset GPIO\n");
> +
> +	if (reset_gpio) {
> +		gpiod_set_value_cansleep(reset_gpio, 0);
> +
> +		return devm_add_action_or_reset(&client->dev, ltc3220_reset_gpio_action,
> +						reset_gpio);
> +	}
> +
> +	ret = regmap_write(ltc3220_state->regmap, LTC3220_COMMAND_REG, 0);
> +	if (ret < 0)
> +		return ret;
> +
> +	for (i = 0; i < LTC3220_NUM_LEDS; i++) {

As above.

> +		ret = regmap_write(ltc3220_state->regmap, LTC3220_ULED_REG(i), 0);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	return regmap_write(ltc3220_state->regmap, LTC3220_GRAD_BLINK_REG, 0);
> +}
> +
> +static int ltc3220_suspend(struct device *dev)
> +{
> +	struct ltc3220_state *ltc3220_state = i2c_get_clientdata(to_i2c_client(dev));
> +
> +	return ltc3220_shutdown(ltc3220_state);
> +}
> +
> +static int ltc3220_resume(struct device *dev)
> +{
> +	struct ltc3220_state *ltc3220_state = i2c_get_clientdata(to_i2c_client(dev));
> +
> +	return ltc3220_resume_from_shutdown(ltc3220_state);
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(ltc3220_pm_ops, ltc3220_suspend, ltc3220_resume);
> +
> +static int ltc3220_probe(struct i2c_client *client)
> +{
> +	struct ltc3220_state *ltc3220_state;
> +	bool aggregated_led_found = false;
> +	int num_leds = 0;
> +	u8 led_index = 0;
> +	int ret;
> +
> +	ltc3220_state = devm_kzalloc(&client->dev, sizeof(*ltc3220_state), GFP_KERNEL);
> +	if (!ltc3220_state)
> +		return -ENOMEM;
> +
> +	ltc3220_state->regmap = devm_regmap_init_i2c(client, &ltc3220_regmap_config);
> +	if (IS_ERR(ltc3220_state->regmap))
> +		return dev_err_probe(&client->dev, PTR_ERR(ltc3220_state->regmap),
> +				     "Failed to initialize regmap\n");
> +
> +	i2c_set_clientdata(client, ltc3220_state);
> +
> +	ret = ltc3220_reset(ltc3220_state, client);
> +	if (ret)
> +		return dev_err_probe(&client->dev, ret, "Failed to reset device\n");
> +
> +	device_for_each_child_node_scoped(&client->dev, child) {
> +		struct led_init_data init_data = {};
> +		struct ltc3220_uled_cfg *led;
> +		u32 source;
> +
> +		ret = fwnode_property_read_u32(child, "reg", &source);
> +		if (ret)
> +			return dev_err_probe(&client->dev, ret, "Couldn't read LED address\n");
> +
> +		if (!source || source > LTC3220_NUM_LEDS)
> +			return dev_err_probe(&client->dev, -EINVAL, "LED address out of range\n");
> +
> +		init_data.fwnode = child;
> +		init_data.devicename = "ltc3220";
> +
> +		if (fwnode_property_present(child, "led-sources")) {
> +			if (source != 1)
> +				return dev_err_probe(&client->dev, -EINVAL,
> +						     "Aggregated LED out of range\n");
> +
> +			if (aggregated_led_found)
> +				return dev_err_probe(&client->dev, -EINVAL,
> +						     "One Aggregated LED only\n");
> +
> +			aggregated_led_found = true;
> +			ltc3220_state->is_aggregated = true;
> +
> +			ret = regmap_update_bits(ltc3220_state->regmap,
> +						 LTC3220_COMMAND_REG,
> +						 LTC3220_QUICK_WRITE_MASK,
> +						 LTC3220_QUICK_WRITE_MASK);
> +			if (ret < 0)
> +				return dev_err_probe(&client->dev, ret,
> +						     "Failed to set quick write mode\n");
> +		}
> +
> +		num_leds++;
> +
> +		/* LED node reg/index/address goes from 1 to 18 */
> +		led_index = source - 1;
> +		led = &ltc3220_state->uled_cfg[led_index];
> +		led->led_index = led_index;
> +		led->reg_value = 0;
> +		led->ltc3220_state = ltc3220_state;
> +		led->led_cdev.brightness_set_blocking = ltc3220_set_led_data;
> +		led->led_cdev.brightness_get = ltc3220_get_led_data;
> +		led->led_cdev.max_brightness = 255;
> +		led->led_cdev.blink_set = ltc3220_blink_set;
> +		led->led_cdev.pattern_set = ltc3220_pattern_set;
> +		led->led_cdev.pattern_clear = ltc3220_pattern_clear;
> +
> +		ret = devm_led_classdev_register_ext(&client->dev, &led->led_cdev, &init_data);
> +		if (ret)
> +			return dev_err_probe(&client->dev, ret, "Failed to register LED class\n");
> +	}
> +
> +	/*
> +	 * Aggregated LED mode uses hardware quick-write to control all 18 LEDs
> +	 * simultaneously. This is mutually exclusive with individual LED control.
> +	 * See Documentation/devicetree/bindings/leds/adi,ltc3220.yaml for details
> +	 * on how to configure aggregated LED mode.
> +	 */
> +	if (aggregated_led_found && num_leds > 1)
> +		return dev_err_probe(&client->dev, -EINVAL,
> +				     "Aggregated LED must be the only LED node\n");
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id ltc3220_of_match[] = {
> +	{ .compatible = "adi,ltc3220" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, ltc3220_of_match);
> +
> +static struct i2c_driver ltc3220_led_driver = {
> +	.driver = {
> +		.name = "ltc3220",
> +		.of_match_table = ltc3220_of_match,
> +		.pm = pm_sleep_ptr(&ltc3220_pm_ops),
> +	},
> +	.probe = ltc3220_probe,
> +};
> +module_i2c_driver(ltc3220_led_driver);
> +
> +MODULE_AUTHOR("Edelweise Escala <edelweise.escala@analog.com>");
> +MODULE_DESCRIPTION("LED driver for LTC3220 controllers");
> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.43.0
> 

-- 
Lee Jones

