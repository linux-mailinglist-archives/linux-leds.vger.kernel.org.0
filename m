Return-Path: <linux-leds+bounces-7668-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGHkEuPa12klTwgAu9opvQ
	(envelope-from <linux-leds+bounces-7668-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 09 Apr 2026 18:59:15 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFAA3CDD94
	for <lists+linux-leds@lfdr.de>; Thu, 09 Apr 2026 18:59:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5B1853006F19
	for <lists+linux-leds@lfdr.de>; Thu,  9 Apr 2026 16:59:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D2C13E1CED;
	Thu,  9 Apr 2026 16:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G0KAoCL8"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC543E1CE7;
	Thu,  9 Apr 2026 16:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775753947; cv=none; b=BDy2dbs/3gTMwGn80J7vycRo0VRtzetjwl1wHN/n6BGqv7rHyu6Pb+Uk2uxGNZ7zB8U1hd9onn+Np+5UmAD18dtMD2m2fWczKICHe4/flsPsgUBRfgg21P9ERwlKpmVyWko4LyLIuPH+dPwdTEk9wDdJlcker3BPMNv9wZyJXoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775753947; c=relaxed/simple;
	bh=5gcaVXlGMAPBNhZdLlsPbxHY1NLXHx16UN4E7nUFEwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lMq66eF+mD+/dq5wXzNSbh0MsRlQh5sXPpyVvRz6BaqfsC3TboQc0Eva3Ufy5zTvbHzVihuQU8gQkvL3GRQRad6dwKfG5jrssTdq0zj8WL5f1kPkHkusED3cebBUVlFOU71GNpfxnwuWB05pcoie0FcwVHbj5HzAbz0PH1wHGMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G0KAoCL8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCFFCC4CEF7;
	Thu,  9 Apr 2026 16:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775753947;
	bh=5gcaVXlGMAPBNhZdLlsPbxHY1NLXHx16UN4E7nUFEwA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G0KAoCL8TlIMq0Il9g8sa13W/n88mtz+Xg8Ju9nftBjaSqdJNfUzcxvq4282XkOzm
	 2frFeR/1jh6zcG3F2N8GFpOdtuISA5UZ3JH2VmmrwXq5/lJAOtJrjiv9n+FBQvNOPx
	 I0jLHzS9hjb/Oj5nSYsw9F1nd/HcJn6Carkz1PF/N4QSuEevTVrPFsy0xCkILl/KrM
	 eY+Wf5Spgme5rVTPZqOLBvPxxCcB9lo86ctCWshwYmw4gFWyqYehNiVu2fO9NysVs+
	 VmiAna3lfNabTMoP2ZXZBZg6U6KG0B5mVqs7nkuKl+Hj788UJ+BMDPlVQ+EbWl0MJG
	 wAM82peuJJWrA==
Date: Thu, 9 Apr 2026 17:59:03 +0100
From: Lee Jones <lee@kernel.org>
To: Jan Carlo Roleda <jancarlo.roleda@analog.com>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/2] leds: ltc3208: add driver
Message-ID: <20260409165902.GB3439476@google.com>
References: <20260406-upstream-ltc3208-v3-0-7f0b1d20ee7a@analog.com>
 <20260406-upstream-ltc3208-v3-1-7f0b1d20ee7a@analog.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260406-upstream-ltc3208-v3-1-7f0b1d20ee7a@analog.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7668-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,analog.com:email,analog.com:url]
X-Rspamd-Queue-Id: BAFAA3CDD94
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

"Add driver" is not a good subject line.

> Kernel driver implementation for LTC3208 Multidisplay LED Driver

A one line commit messages is not suitable fore a 300 line driver!

What is the LTC3208 Multidisplay LED?
What does it do?
How does it operate?
What's special about it?
Any quirks?

> Signed-off-by: Jan Carlo Roleda <jancarlo.roleda@analog.com>
> ---
>  MAINTAINERS                 |   7 ++
>  drivers/leds/Kconfig        |  11 ++
>  drivers/leds/Makefile       |   1 +
>  drivers/leds/leds-ltc3208.c | 298 ++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 317 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 55af015174a5..48bae02057d5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15126,6 +15126,13 @@ W:	https://ez.analog.com/linux-software-drivers
>  F:	Documentation/devicetree/bindings/iio/temperature/adi,ltc2983.yaml
>  F:	drivers/iio/temperature/ltc2983.c
>  
> +LTC3208 LED DRIVER
> +M:	Jan Carlo Roleda <jancarlo.roleda@analog.com>
> +L:	linux-leds@vger.kernel.org
> +S:	Maintained
> +W:	https://ez.analog.com/linux-software-drivers
> +F:	drivers/leds/leds-ltc3208.c
> +
>  LTC4282 HARDWARE MONITOR DRIVER
>  M:	Nuno Sa <nuno.sa@analog.com>
>  L:	linux-hwmon@vger.kernel.org
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 597d7a79c988..867b120ea8ba 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -1029,6 +1029,17 @@ config LEDS_ACER_A500
>  	  This option enables support for the Power Button LED of
>  	  Acer Iconia Tab A500.
>  
> +config LEDS_LTC3208
> +	tristate "LED Driver for Analog Devices LTC3208"
> +	depends on LEDS_CLASS && I2C
> +	select REGMAP_I2C
> +	help
> +	  Say Y to enable the LTC3208 LED driver.
> +	  This supports the LED device LTC3208.

You can do better!

> +	  To compile this driver as a module, choose M here: the module will
> +	  be called ltc3208.
> +
>  source "drivers/leds/blink/Kconfig"
>  
>  comment "Flash and Torch LED drivers"
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index 8fdb45d5b439..b08b539112b6 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -61,6 +61,7 @@ obj-$(CONFIG_LEDS_LP8788)		+= leds-lp8788.o
>  obj-$(CONFIG_LEDS_LP8860)		+= leds-lp8860.o
>  obj-$(CONFIG_LEDS_LP8864)		+= leds-lp8864.o
>  obj-$(CONFIG_LEDS_LT3593)		+= leds-lt3593.o
> +obj-$(CONFIG_LEDS_LTC3208)		+= leds-ltc3208.o
>  obj-$(CONFIG_LEDS_MAX5970)		+= leds-max5970.o
>  obj-$(CONFIG_LEDS_MAX77650)		+= leds-max77650.o
>  obj-$(CONFIG_LEDS_MAX77705)		+= leds-max77705.o
> diff --git a/drivers/leds/leds-ltc3208.c b/drivers/leds/leds-ltc3208.c
> new file mode 100644
> index 000000000000..65e65cd73d73
> --- /dev/null
> +++ b/drivers/leds/leds-ltc3208.c
> @@ -0,0 +1,298 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * LED driver for Analog Devices LTC3208 Multi-Display Driver
> + *
> + * Copyright 2026 Analog Devices Inc.
> + *
> + * Author: Jan Carlo Roleda <jancarlo.roleda@analog.com>
> + */
> +#include <linux/bitfield.h>
> +#include <linux/errno.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/leds.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +#include <linux/types.h>
> +#include <linux/workqueue.h>

Are all of these headers strictly necessary? For instance, it doesn't appear we
are using GPIOs, platform devices, or workqueues in this driver.

> +#define LTC3208_SET_HIGH_BYTE_DATA(x)	FIELD_PREP(GENMASK(7, 4), (x))
> +
> +/* Registers */
> +#define LTC3208_REG_A_GRNRED	0x1 /* Green (High half-byte) and Red (Low half-byte) current DAC*/
> +#define LTC3208_REG_B_AUXBLU	0x2 /* AUX (High half-byte) and Blue (Low half-byte) current DAC*/
> +#define LTC3208_REG_C_MAIN	0x3 /* Main current DAC */
> +#define LTC3208_REG_D_SUB	0x4 /* Sub current DAC */
> +#define LTC3208_REG_E_AUX	0x5 /* AUX DAC Select */
> +#define LTC3208_REG_F_CAM	0x6 /* CAM (High half-byte and Low half-byte) current DAC*/
> +#define LTC3208_REG_G_OPT	0x7 /* Device Options */
> +
> +/* Device Options register */
> +#define LTC3208_OPT_CPO_MASK	GENMASK(7, 6)
> +#define LTC3208_OPT_DIS_RGBDROP	BIT(3)
> +#define LTC3208_OPT_DIS_CAMHILO	BIT(2)
> +#define LTC3208_OPT_EN_RGBS	BIT(1)

Nit: This can look nicer nested:

#define LTC3208_REG_A_GRNRED		0x1 /* Green (High half-byte) and Red (Low half-byte) current DAC*/
#define LTC3208_REG_B_AUXBLU		0x2 /* AUX (High half-byte) and Blue (Low half-byte) current DAC*/
#define LTC3208_REG_C_MAIN		0x3 /* Main current DAC */
#define LTC3208_REG_D_SUB		0x4 /* Sub current DAC */
#define LTC3208_REG_E_AUX		0x5 /* AUX DAC Select */
#define   LTC3208_AUX1_MASK		GENMASK(1, 0)
#define   LTC3208_AUX2_MASK		GENMASK(3, 2)
#define   LTC3208_AUX3_MASK		GENMASK(5, 4)
#define   LTC3208_AUX4_MASK		GENMASK(7, 6)
#define LTC3208_REG_F_CAM		0x6 /* CAM (High half-byte and Low half-byte) current DAC*/
#define LTC3208_REG_G_OPT		0x7 /* Device Options */
#define   LTC3208_OPT_CPO_MASK		GENMASK(7, 6)
#define   LTC3208_OPT_DIS_RGBDROP	BIT(3)
#define   LTC3208_OPT_DIS_CAMHILO	BIT(2)
#define   LTC3208_OPT_EN_RGBS		BIT(1)

> +#define LTC3208_MAX_BRIGHTNESS_4BIT 0xF
> +#define LTC3208_MAX_BRIGHTNESS_8BIT 0xFF
> +
> +#define LTC3208_NUM_LED_GRPS	8
> +#define LTC3208_NUM_AUX_LEDS	4
> +
> +#define LTC3208_NUM_AUX_OPT	4
> +#define LTC3208_MAX_CPO_OPT	3

Nit: Can we have _all_ of the values line up nicely?

#define LTC3208_NUM_AUX_OPT		4
#define LTC3208_MAX_CPO_OPT		3

> +enum ltc3208_aux_channel {
> +	LTC3208_AUX_CHAN_AUX = 0,
> +	LTC3208_AUX_CHAN_MAIN,
> +	LTC3208_AUX_CHAN_SUB,
> +	LTC3208_AUX_CHAN_CAM
> +};
> +
> +enum ltc3208_channel {
> +	LTC3208_CHAN_MAIN = 0,
> +	LTC3208_CHAN_SUB,
> +	LTC3208_CHAN_AUX,
> +	LTC3208_CHAN_CAML,
> +	LTC3208_CHAN_CAMH,
> +	LTC3208_CHAN_RED,
> +	LTC3208_CHAN_BLUE,
> +	LTC3208_CHAN_GREEN
> +};
> +
> +static const char * const ltc3208_dt_aux_channels[] = {
> +	"adi,aux1-channel", "adi,aux2-channel",
> +	"adi,aux3-channel", "adi,aux4-channel"
> +};
> +
> +static const char * const ltc3208_aux_opt[] = {
> +	"aux", "main", "sub", "cam"
> +};
> +
> +

?

> +struct ltc3208_led {
> +	struct led_classdev cdev;
> +	struct i2c_client *client;
> +	enum ltc3208_channel channel;
> +};
> +
> +struct ltc3208_dev {
> +	struct i2c_client *client;
> +	struct regmap *map;
> +	struct ltc3208_led *leds;
> +};
> +
> +static const struct regmap_config ltc3208_regmap_cfg = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +};
> +
> +static int ltc3208_led_set_brightness(struct led_classdev *led_cdev,
> +				      enum led_brightness brightness)
> +{
> +	struct ltc3208_led *led = container_of(led_cdev,
> +					struct ltc3208_led, cdev);

You can use 100-chars to avoid this awkwardness.

> +	struct i2c_client *client = led->client;
> +	struct ltc3208_dev *dev = i2c_get_clientdata(client);
> +	struct regmap *map = dev->map;
> +	u8 current_level = brightness;
> +
> +	/*
> +	 * For registers with 4-bit splits (CAM, AUX/BLUE, GREEN/RED), the other
> +	 * half of the byte will be retrieved from the stored DAC value before
> +	 * updating the register.
> +	 */
> +	switch (led->channel) {
> +	case LTC3208_CHAN_MAIN:
> +		return regmap_write(map, LTC3208_REG_C_MAIN, current_level);
> +	case LTC3208_CHAN_SUB:
> +		return regmap_write(map, LTC3208_REG_D_SUB, current_level);
> +	case LTC3208_CHAN_AUX:
> +		/* combine both low and high halves of byte */
> +		current_level = LTC3208_SET_HIGH_BYTE_DATA(current_level);
> +		current_level |= dev->leds[LTC3208_CHAN_BLUE].cdev.brightness;
> +		return regmap_write(map, LTC3208_REG_B_AUXBLU, current_level);

Should we be using 'regmap_update_bits()' or 'regmap_field' here instead?
Constructing the register value by reading the software state of another LED
instance could lead to races.

> +	case LTC3208_CHAN_BLUE:
> +		/* apply high bits stored in other led */
> +		current_level |= LTC3208_SET_HIGH_BYTE_DATA(dev->leds[LTC3208_CHAN_AUX].cdev.brightness);
> +		return regmap_write(map, LTC3208_REG_B_AUXBLU, current_level);
> +	case LTC3208_CHAN_CAMH:
> +		current_level = LTC3208_SET_HIGH_BYTE_DATA(current_level);
> +		current_level |= dev->leds[LTC3208_CHAN_CAML].cdev.brightness;
> +		return regmap_write(map, LTC3208_REG_F_CAM, current_level);
> +	case LTC3208_CHAN_CAML:
> +		current_level |= LTC3208_SET_HIGH_BYTE_DATA(dev->leds[LTC3208_CHAN_CAMH].cdev.brightness);
> +		return regmap_write(map, LTC3208_REG_F_CAM, current_level);
> +	case LTC3208_CHAN_GREEN:
> +		current_level = LTC3208_SET_HIGH_BYTE_DATA(current_level);
> +		current_level |= dev->leds[LTC3208_CHAN_RED].cdev.brightness;
> +		return regmap_write(map, LTC3208_REG_A_GRNRED, current_level);
> +	case LTC3208_CHAN_RED:
> +		current_level |= LTC3208_SET_HIGH_BYTE_DATA(dev->leds[LTC3208_CHAN_GREEN].cdev.brightness);
> +		return regmap_write(map, LTC3208_REG_A_GRNRED, current_level);

This lot is begging for a sub function:

static int ltc3208_led_set_current_level(struct regmap *regmap, u8 reg, u8 low, u8 high) {
{
	return regmap_write(regmap, reg, SET_HIGH_BYTE(high) | low);
}

> +	default:
> +		dev_err(&client->dev, "Invalid LED Channel\n");
> +		return -EINVAL;
> +	}
> +}
> +
> +static int ltc3208_update_options(struct ltc3208_dev *dev,
> +				  bool is_sub, bool is_cam_hi, bool is_rgb_drop)
> +{
> +	struct regmap *map = dev->map;
> +	u8 val =	FIELD_PREP(LTC3208_OPT_EN_RGBS, is_sub) |
> +			FIELD_PREP(LTC3208_OPT_DIS_CAMHILO, is_cam_hi) |
> +			FIELD_PREP(LTC3208_OPT_DIS_RGBDROP, is_rgb_drop);
> +

That tabbing is awkward.  In these cases it's better to do the
allocation after the declaration.

> +	return regmap_write(map, LTC3208_REG_G_OPT, val);
> +}
> +
> +static int ltc3208_update_aux_dac(struct ltc3208_dev *dev,
> +	enum ltc3208_aux_channel aux_1, enum ltc3208_aux_channel aux_2,
> +	enum ltc3208_aux_channel aux_3, enum ltc3208_aux_channel aux_4)

These should sit under the '('.

> +{
> +	struct regmap *map = dev->map;
> +	u8 val =	FIELD_PREP(LTC3208_AUX1_MASK, aux_1) |
> +			FIELD_PREP(LTC3208_AUX2_MASK, aux_2) |
> +			FIELD_PREP(LTC3208_AUX3_MASK, aux_3) |
> +			FIELD_PREP(LTC3208_AUX4_MASK, aux_4);

As above.

> +	return regmap_write(map, LTC3208_REG_E_AUX, val);
> +}
> +
> +static int ltc3208_probe(struct i2c_client *client)
> +{
> +	enum ltc3208_aux_channel aux_channels[LTC3208_NUM_AUX_LEDS];
> +	struct ltc3208_dev *data;

'data' is a terrible variable name.

> +	struct ltc3208_led *leds;
> +	struct regmap *map;

'regmap'

> +	int ret, i;
> +	u32 val;
> +	bool dropdis_rgb_aux4;
> +	bool dis_camhl;
> +	bool en_rgbs;
> +
> +	map = devm_regmap_init_i2c(client, &ltc3208_regmap_cfg);
> +	if (IS_ERR(map))
> +		return dev_err_probe(&client->dev, PTR_ERR(map),
> +				     "Failed to initialize regmap\n");
> +
> +	data = devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	leds = devm_kcalloc(&client->dev, LTC3208_NUM_LED_GRPS,
> +			    sizeof(struct ltc3208_led), GFP_KERNEL);
> +	if (!leds)
> +		return -ENOMEM;
> +
> +	data->client = client;
> +	data->map = map;
> +
> +	/* initialize options from devicetree */

Capitalise comments and it's "Device Tree", although honestly, I think
the whole comment is superfluous.

> +	dis_camhl = device_property_read_bool(&client->dev,
> +					      "adi,disable-camhl-pin");
> +	en_rgbs = device_property_read_bool(&client->dev,
> +					    "adi,cfg-enrgbs-pin");
> +	dropdis_rgb_aux4 = device_property_read_bool(&client->dev,
> +						     "adi,disable-rgb-aux4-dropout");

Use 100-chars.

> +	ret = ltc3208_update_options(data, en_rgbs, dis_camhl,
> +				     dropdis_rgb_aux4);
> +	if (ret)
> +		return dev_err_probe(&client->dev, ret,
> +				     "error writing to options register\n");

Capitalise.

> +	/* initialize aux channel configurations from devicetree */

As above and throughout.

> +	for (i = 0; i < LTC3208_NUM_AUX_LEDS; i++) {

for (int i = 0; ...

> +		ret = device_property_match_property_string(&client->dev,
> +							    ltc3208_dt_aux_channels[i],
> +							    ltc3208_aux_opt,
> +							    LTC3208_NUM_AUX_OPT);
> +		/* use default value if absent in devicetree */
> +		if (ret == -EINVAL)
> +			aux_channels[i] = LTC3208_AUX_CHAN_AUX;
> +		else if (ret >= 0)
> +			aux_channels[i] = ret;
> +		else
> +			return dev_err_probe(&client->dev, ret,
> +					     "Failed getting aux-channel.\n");
> +	}
> +
> +	ret = ltc3208_update_aux_dac(data, aux_channels[0], aux_channels[1],
> +				     aux_channels[2], aux_channels[3]);

Why not just aux_channels and pull the values out in the function.

> +	if (ret)
> +		return dev_err_probe(&client->dev, ret,
> +				     "error writing to aux %u channel register.\n", i);

When is 'i' not 'LTC3208_NUM_AUX_LEDS'?

> +	i2c_set_clientdata(client, data);
> +
> +	device_for_each_child_node_scoped(&client->dev, child) {
> +		struct ltc3208_led *led;
> +		struct led_init_data init_data = {};
> +
> +		ret = fwnode_property_read_u32(child, "reg", &val);
> +		if (ret || val >= LTC3208_NUM_LED_GRPS)
> +			return dev_err_probe(&client->dev, -EINVAL,
> +					     "Invalid reg property for LED\n");

Why aren't we propagating the real error?

> +
> +		led = &leds[val];
> +		led->client = client;
> +		led->channel = val;
> +		led->cdev.brightness_set_blocking = ltc3208_led_set_brightness;
> +		led->cdev.max_brightness = LTC3208_MAX_BRIGHTNESS_4BIT;
> +		if (val == LTC3208_CHAN_MAIN || val == LTC3208_CHAN_SUB)
> +			led->cdev.max_brightness = LTC3208_MAX_BRIGHTNESS_8BIT;
> +
> +		init_data.fwnode = child;
> +
> +		ret = devm_led_classdev_register_ext(&client->dev, &led->cdev,
> +			&init_data);
> +		if (ret)
> +			return dev_err_probe(&client->dev, ret,
> +					     "Failed to register LED %u\n", val);
> +	}
> +
> +	data->leds = leds;
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id ltc3208_match_table[] = {
> +	{.compatible = "adi,ltc3208"},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, ltc3208_match_table);
> +
> +static const struct i2c_device_id ltc3208_idtable[] = {
> +	{ "ltc3208" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, ltc3208_idtable);
> +
> +static struct i2c_driver ltc3208_driver = {
> +	.driver = {
> +		.name = "ltc3208",
> +		.of_match_table = ltc3208_match_table,
> +	},
> +	.id_table = ltc3208_idtable,
> +	.probe = ltc3208_probe,
> +};
> +module_i2c_driver(ltc3208_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Jan Carlo Roleda <jancarlo.roleda@analog.com>");
> +MODULE_DESCRIPTION("LTC3208 LED Driver");
> 
> -- 
> 2.43.0
> 

-- 
Lee Jones [李琼斯]

