Return-Path: <linux-leds+bounces-8833-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bV57KmBURmq8QwsAu9opvQ
	(envelope-from <linux-leds+bounces-8833-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 14:06:56 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A5E6F7516
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 14:06:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=WuyUc9vg;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8833-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8833-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6E70A314A48E
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jul 2026 11:17:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CCC340C5A8;
	Thu,  2 Jul 2026 11:16:45 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DECF3EDACB;
	Thu,  2 Jul 2026 11:16:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782991005; cv=none; b=BRkD9lpQiB4WdKZN5OMW7yWoWtg4aw32HjraEnr1k3w4lgLCEJzVy0uP0DUyS/00h7KgOGa9k8NJw+vY/LNzbrOTu+hW2md8Lk7oE+08rcJgrGkX14wzVWrUbkh703ahakFbVBy2rVoLckOKzKB7XboDvbjsbSUi88yIvH9LAHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782991005; c=relaxed/simple;
	bh=LbvQ1m0/cW+KqEIXCvBMtRpLK4uFANv7Z5bH0HrKFIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IdfFUmTKnRlqBk5RlUYnhs00bELaITuQZMTVmA+xvf0vK/9i9DYjxxt6Z04/Noe49p6ys6ijd+8poXybZ+FxBGJUn3iv3Pq4Hs8cD8IsEZ4NjKZPqWoUaoK4LmOJz4OY5/9HkPbyLK332wzF6AsJ3pdE04sX90FUR6VqNLQpX00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WuyUc9vg; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 862F31F00A3A;
	Thu,  2 Jul 2026 11:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782991003;
	bh=k8F9Ido5Lby+BVmpFcFkQ3KhVLNETuyc2ptNCY+xiY8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WuyUc9vgkYRacFuzfYz2gOkMo/Ed4BmPGUcBdSuZZA/HdnwKyszZUWLZfxwOzx1D7
	 +sSBDOH0G662R+E/+YH5dbkLDRlY0TyLURY+cUVHnuzvbsbnGVh5UTDCJCbinH/67r
	 bn1xPVlcg4nnf/eZ4hddTjQqK01NJ9Mfm56X8VKyB3U62dczF+KvGtjPe186a+1NRU
	 BG/1ARAzTPDMg1ADaGLU53thuEyieJGpdotd3ai9B2AfKOpivmyygCiOdVRgn8p9M0
	 hID8Wo6knCKoAcohspzBbg06GnvDUn1LhG4S7VylEuN2VOvY74kghawN95t58IjyKo
	 Ksz/DTHogkSKA==
Date: Thu, 2 Jul 2026 12:16:38 +0100
From: Lee Jones <lee@kernel.org>
To: Edelweise Escala <edelweise.escala@analog.com>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 2/2] leds: ltc3220: Add Support for LTC3220 18
 channel LED Driver
Message-ID: <20260702111638.GL2108533@google.com>
References: <20260616-ltc3220-driver-v11-0-6e51dd97ced6@analog.com>
 <20260616-ltc3220-driver-v11-2-6e51dd97ced6@analog.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616-ltc3220-driver-v11-2-6e51dd97ced6@analog.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8833-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:edelweise.escala@analog.com,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 25A5E6F7516

Some AI findings to chew on.

/* Sashiko Automation: Issues Found (6 Findings) */

On Tue, 16 Jun 2026, Edelweise Escala wrote:

> Add driver for the LTC3220 18-channel LED driver
> with I2C interface, individual brightness control, and hardware-assisted
> blink/gradation features.
> 
> Signed-off-by: Edelweise Escala <edelweise.escala@analog.com>
> ---
>  MAINTAINERS                 |   1 +
>  drivers/leds/Kconfig        |  13 ++
>  drivers/leds/Makefile       |   1 +
>  drivers/leds/leds-ltc3220.c | 480 ++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 495 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c8a242577d2f..0f553ada61d9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15229,6 +15229,7 @@ L:	linux-leds@vger.kernel.org
>  S:	Maintained
>  W:	https://ez.analog.com/linux-software-drivers
>  F:	Documentation/devicetree/bindings/leds/adi,ltc3220.yaml
> +F:	drivers/leds/leds-ltc3220.c
>  
>  LTC4282 HARDWARE MONITOR DRIVER
>  M:	Nuno Sa <nuno.sa@analog.com>
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index f4a0a3c8c870..31b1e3ff094c 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -1000,6 +1000,19 @@ config LEDS_ST1202
>  	  Say Y to enable support for LEDs connected to LED1202
>  	  LED driver chips accessed via the I2C bus.
>  
> +config LEDS_LTC3220
> +	tristate "LED Driver for Analog Devices Inc. LTC3220"
> +	depends on I2C && LEDS_CLASS
> +	select REGMAP_I2C
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
> index 7db3768912ca..a68244bd50fb 100644
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
> index 000000000000..8bb06e50d3c6
> --- /dev/null
> +++ b/drivers/leds/leds-ltc3220.c
> @@ -0,0 +1,480 @@
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
> +#include <linux/property.h>
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
> +enum ltc3220_led_mode {
> +	LTC3220_NORMAL_MODE,
> +	LTC3220_BLINK_MODE,
> +	LTC3220_GRADATION_MODE,
> +};
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
> +	.cache_type = REGCACHE_FLAT_S,
> +};
> +
> +struct ltc3220_uled_cfg {
> +	struct led_classdev led_cdev;
> +	u8 reg_value;
> +	u8 led_index;
> +	bool registered;
> +};
> +
> +struct ltc3220 {
> +	struct ltc3220_uled_cfg uled_cfg[LTC3220_NUM_LEDS];
> +	struct regmap *regmap;
> +	bool is_aggregated;
> +};
> +
> +/*
> + * Set LED brightness. Hardware supports 0-63 brightness levels.
> + * Mode switching (blink/gradation) is handled through dedicated callbacks.
> + */
> +static int ltc3220_set_led_data(struct led_classdev *led_cdev,
> +				enum led_brightness brightness)
> +{
> +	struct ltc3220_uled_cfg *uled_cfg = container_of(led_cdev, struct ltc3220_uled_cfg,
> +							 led_cdev);
> +	struct ltc3220 *ltc3220 = container_of(uled_cfg - uled_cfg->led_index, struct ltc3220,
> +					       uled_cfg[0]);
> +	int ret;
> +
> +	ret = regmap_write(ltc3220->regmap, LTC3220_ULED_REG(uled_cfg->led_index),
> +			   brightness);

[Severity: High]
When configured in aggregated mode, the hardware's QUICK_WRITE feature is
enabled, and a single write to LED 0 implicitly updates LEDs 1-17 in
hardware.

However, the driver doesn't update the regmap cache for registers 0x02
through 0x12, leaving them at 0.

When regcache_sync() runs during resume, will it write out the cached 0s and
inadvertently turn off LEDs 1-17?

Should the driver manually sync the cache for these implicitly updated
registers?


> +	if (ret)
> +		return ret;
> +
> +	uled_cfg->reg_value = brightness;

[Severity: Medium]
Since the LED core does not strictly serialize asynchronous triggers against
all callback paths, is this unprotected assignment susceptible to a race
condition?

A concurrent call to ltc3220_set_led_data() or ltc3220_blink_set() could
cause the software reg_value to become permanently desynchronized from the
hardware register state.

Does this need a per-device or per-LED mutex to protect read-modify-write
operations?


> +
> +	/*
> +	 * When aggregated LED mode is enabled, writing to LED 1 updates all
> +	 * LEDs simultaneously via quick-write mode. Update cached values for
> +	 * all LEDs to reflect the synchronized state.
> +	 * See Documentation/devicetree/bindings/leds/adi,ltc3220.yaml for how
> +	 * to configure aggregated LED mode.
> +	 */
> +	if (ltc3220->is_aggregated && uled_cfg->led_index == 0) {
> +		for (int i = 0; i < LTC3220_NUM_LEDS; i++)
> +			ltc3220->uled_cfg[i].reg_value = brightness;
> +	}
> +
> +	return 0;
> +}
> +
> +static enum led_brightness ltc3220_get_led_data(struct led_classdev *led_cdev)
> +{
> +	struct ltc3220_uled_cfg *uled_cfg = container_of(led_cdev, struct ltc3220_uled_cfg,
> +							 led_cdev);
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
> +	struct ltc3220 *ltc3220 = container_of(uled_cfg - uled_cfg->led_index, struct ltc3220,
> +					       uled_cfg[0]);
> +	u8 gradation_period;
> +	u8 start_brightness;
> +	u8 end_brightness;
> +	u8 gradation_val;
> +	bool is_increasing;
> +	int ret;
> +
> +	if (len != 2)
> +		return -EINVAL;
> +
> +	if (repeat != 1)
> +		return -EOPNOTSUPP;
> +
> +	start_brightness = pattern[0].brightness & LTC3220_LED_CURRENT_MASK;
> +	end_brightness = pattern[1].brightness & LTC3220_LED_CURRENT_MASK;

[Severity: Medium]
Will this bitwise masking cause wrap-around behavior if a user provides a
brightness value greater than 63 via the sysfs hw_pattern interface?

For instance, a value of 64 would wrap to 0, unexpectedly turning the LED
off.

Would it be safer to use min_t() to clamp the input instead of a
bitwise mask?


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
> +	gradation_val = FIELD_PREP(LTC3220_GRADATION_PERIOD_MASK, gradation_period);
> +	gradation_val |= FIELD_PREP(LTC3220_GRADATION_DIRECTION_MASK, is_increasing);
> +
> +	ret = regmap_update_bits(ltc3220->regmap, LTC3220_GRAD_BLINK_REG,
> +				 LTC3220_GRADATION_MASK, gradation_val);
> +	if (ret)
> +		return ret;
> +
> +	ret = ltc3220_set_led_data(led_cdev, start_brightness);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(ltc3220->regmap, LTC3220_ULED_REG(uled_cfg->led_index),
> +			   FIELD_PREP(LTC3220_LED_MODE_MASK, LTC3220_GRADATION_MODE) |
> +			   end_brightness);
> +	if (ret)
> +		return ret;
> +
> +	uled_cfg->reg_value = end_brightness;
> +
> +	return 0;
> +}
> +
> +static int ltc3220_pattern_clear(struct led_classdev *led_cdev)
> +{
> +	struct ltc3220_uled_cfg *uled_cfg = container_of(led_cdev, struct ltc3220_uled_cfg,
> +							 led_cdev);
> +	struct ltc3220 *ltc3220 = container_of(uled_cfg - uled_cfg->led_index, struct ltc3220,
> +					       uled_cfg[0]);
> +	int ret;
> +
> +	ret = regmap_update_bits(ltc3220->regmap, LTC3220_ULED_REG(uled_cfg->led_index),
> +				 LTC3220_LED_MODE_MASK, LTC3220_NORMAL_MODE);
> +	if (ret)
> +		return ret;
> +
> +	return ltc3220_set_led_data(led_cdev, LED_OFF);
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
> +	struct ltc3220 *ltc3220 = container_of(uled_cfg - uled_cfg->led_index, struct ltc3220,
> +					       uled_cfg[0]);
> +	u8 blink_mode = 0;
> +	int ret;
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
> +	ret = regmap_update_bits(ltc3220->regmap, LTC3220_GRAD_BLINK_REG,
> +				 LTC3220_BLINK_MASK, FIELD_PREP(LTC3220_BLINK_MASK, blink_mode));
> +	if (ret)
> +		return ret;
> +
> +	/* Ensure LED has non-zero brightness before enabling blink mode */
> +	if (uled_cfg->reg_value == 0)
> +		uled_cfg->reg_value = led_cdev->max_brightness;

[Severity: Medium]
Could this rely on a stale reg_value if concurrent operations are
modifying the state without synchronization, as noted in
ltc3220_set_led_data() above?


> +
> +	return regmap_write(ltc3220->regmap, LTC3220_ULED_REG(uled_cfg->led_index),
> +			    FIELD_PREP(LTC3220_LED_MODE_MASK, LTC3220_BLINK_MODE) |
> +			    uled_cfg->reg_value);
> +}
> +
> +static void ltc3220_reset_gpio_action(void *data)
> +{
> +	struct gpio_desc *reset_gpio = data;
> +
> +	gpiod_set_value_cansleep(reset_gpio, 1);
> +}
> +
> +static int ltc3220_reset(struct ltc3220 *ltc3220, struct i2c_client *client)
> +{
> +	struct gpio_desc *reset_gpio;
> +	int ret;
> +
> +	reset_gpio = devm_gpiod_get_optional(&client->dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(reset_gpio))
> +		return dev_err_probe(&client->dev, PTR_ERR(reset_gpio), "Failed on reset GPIO\n");
> +
> +	if (reset_gpio) {
> +		usleep_range(10000, 12000);
> +		gpiod_set_value_cansleep(reset_gpio, 0);
> +		usleep_range(10000, 12000);
> +
> +		ret = devm_add_action_or_reset(&client->dev, ltc3220_reset_gpio_action,
> +						reset_gpio);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = regmap_write(ltc3220->regmap, LTC3220_COMMAND_REG, 0);
> +	if (ret)
> +		return ret;
> +
> +	for (int i = 0; i < LTC3220_NUM_LEDS; i++) {
> +		ret = regmap_write(ltc3220->regmap, LTC3220_ULED_REG(i), 0);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return regmap_write(ltc3220->regmap, LTC3220_GRAD_BLINK_REG, 0);
> +}
> +
> +static int ltc3220_suspend(struct device *dev)
> +{
> +	struct ltc3220 *ltc3220 = i2c_get_clientdata(to_i2c_client(dev));
> +
> +	for (int i = 0; i < LTC3220_NUM_LEDS; i++) {
> +		if (ltc3220->uled_cfg[i].registered)
> +			led_classdev_suspend(&ltc3220->uled_cfg[i].led_cdev);
> +	}
> +
> +	return regmap_update_bits(ltc3220->regmap, LTC3220_COMMAND_REG,
> +				 LTC3220_SHUTDOWN_MASK, LTC3220_SHUTDOWN_MASK);
> +}

[Severity: Medium]
Should regcache_mark_dirty(ltc3220->regmap) be called here or in resume?

Without marking the cache dirty, the regcache_sync() in ltc3220_resume()
will silently return without restoring any registers, resulting in the
permanent loss of the blink and gradation states upon resume.


> +
> +static int ltc3220_resume(struct device *dev)
> +{
> +	struct ltc3220 *ltc3220 = i2c_get_clientdata(to_i2c_client(dev));
> +	int ret;
> +
> +	ret = regmap_update_bits(ltc3220->regmap, LTC3220_COMMAND_REG,
> +				 LTC3220_SHUTDOWN_MASK, 0);
> +	if (ret)
> +		return ret;
> +
> +	ret = regcache_sync(ltc3220->regmap);
> +	if (ret)
> +		return ret;
> +
> +	for (int i = 0; i < LTC3220_NUM_LEDS; i++) {
> +		if (ltc3220->uled_cfg[i].registered)
> +			led_classdev_resume(&ltc3220->uled_cfg[i].led_cdev);
> +	}
> +
> +	return 0;
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(ltc3220_pm_ops, ltc3220_suspend, ltc3220_resume);
> +
> +static int ltc3220_probe(struct i2c_client *client)
> +{
> +	struct ltc3220 *ltc3220;
> +	bool aggregated_led_found = false;
> +	int num_leds = 0;
> +	u8 led_index = 0;
> +	int ret;
> +
> +	ltc3220 = devm_kzalloc(&client->dev, sizeof(*ltc3220), GFP_KERNEL);
> +	if (!ltc3220)
> +		return -ENOMEM;
> +
> +	ltc3220->regmap = devm_regmap_init_i2c(client, &ltc3220_regmap_config);
> +	if (IS_ERR(ltc3220->regmap))
> +		return dev_err_probe(&client->dev, PTR_ERR(ltc3220->regmap),
> +				     "Failed to initialize regmap\n");
> +
> +	i2c_set_clientdata(client, ltc3220);
> +
> +	ret = ltc3220_reset(ltc3220, client);
> +	if (ret)
> +		return dev_err_probe(&client->dev, ret, "Failed to reset device\n");
> +
> +	/* First pass: validate configuration and set up LED structures */
> +	device_for_each_child_node_scoped(&client->dev, child) {
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
> +			ltc3220->is_aggregated = true;
> +
> +			ret = regmap_update_bits(ltc3220->regmap,
> +						 LTC3220_COMMAND_REG,
> +						 LTC3220_QUICK_WRITE_MASK,
> +						 LTC3220_QUICK_WRITE_MASK);
> +			if (ret)
> +				return dev_err_probe(&client->dev, ret,
> +						     "Failed to set quick write mode\n");
> +		}
> +
> +		num_leds++;
> +
> +		/* LED node reg/index/address goes from 1 to 18 */
> +		led_index = source - 1;
> +		led = &ltc3220->uled_cfg[led_index];
> +
> +		if (led->registered)
> +			return dev_err_probe(&client->dev, -EINVAL,
> +					     "Duplicate LED reg %u found", source);
> +
> +		led->registered = true;
> +		led->led_index = led_index;
> +		led->reg_value = 0;
> +		led->led_cdev.brightness_set_blocking = ltc3220_set_led_data;
> +		led->led_cdev.brightness_get = ltc3220_get_led_data;
> +		led->led_cdev.max_brightness = 63;
> +		led->led_cdev.blink_set = ltc3220_blink_set;
> +		led->led_cdev.pattern_set = ltc3220_pattern_set;
> +		led->led_cdev.pattern_clear = ltc3220_pattern_clear;
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
> +	/* Second pass: register LEDs after validation */
> +	device_for_each_child_node_scoped(&client->dev, child) {
> +		struct led_init_data init_data = {};
> +		struct ltc3220_uled_cfg *led;
> +		u32 source;
> +
> +		ret = fwnode_property_read_u32(child, "reg", &source);
> +		if (ret)
> +			return ret;
> +
> +		init_data.fwnode = child;
> +		init_data.devicename = "ltc3220";
> +
> +		led_index = source - 1;
> +		led = &ltc3220->uled_cfg[led_index];
> +
> +		ret = devm_led_classdev_register_ext(&client->dev, &led->led_cdev, &init_data);
> +		if (ret)
> +			return dev_err_probe(&client->dev, ret, "Failed to register LED class\n");
> +	}
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

