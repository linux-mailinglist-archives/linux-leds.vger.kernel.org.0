Return-Path: <linux-leds+bounces-7928-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAyDGqdw82m42gEAu9opvQ
	(envelope-from <linux-leds+bounces-7928-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 30 Apr 2026 17:09:27 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D94C04A4761
	for <lists+linux-leds@lfdr.de>; Thu, 30 Apr 2026 17:09:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 034673044F25
	for <lists+linux-leds@lfdr.de>; Thu, 30 Apr 2026 15:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB1D92D3EC1;
	Thu, 30 Apr 2026 15:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rcKrk4KX"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A54B35958;
	Thu, 30 Apr 2026 15:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777561514; cv=none; b=TNZ4oMcYsIz1tePbHdNmpdJQoBCx3OlHRZYY6jEapXVlAy8svVRr0XxlG77HxPz7bVZFsm5iTVkshc+NOLhKBb4VG40RbUm47kdNs1+6uAd0vWYRZieZCJWJHWyBQDwLW9jEAqVDTJ+soPGKTDnB5zxrWGYowLl6CMoxk4E0uy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777561514; c=relaxed/simple;
	bh=VX6+ebjtO5Vyi+Sz/eN3qNfvydqEfu//paiGoORg9/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FhQ7dRgnPIEk3onzeQ3MR/ClpVrUj+wNYTw+urPnoqNClD69+NEeaiXVRPsteqR2fsftpSRK/OdChvNbvJjkni4Ul1PSy4uqbNR0DJa3qAOM1Pd8Lkj1AD/LTGlEhz0dsW50X7AqmbXF2Q2ta7f9XVRYoi7yRqa07qhkGPgcdoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rcKrk4KX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BA59C2BCB9;
	Thu, 30 Apr 2026 15:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777561513;
	bh=VX6+ebjtO5Vyi+Sz/eN3qNfvydqEfu//paiGoORg9/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rcKrk4KXGafBWtVNtX2QACShpm19N6Z8VsyeY2h2dm7uWfLwIOE+AHZMXTWiDSTKN
	 Jbnt5lqr2INWpgbrrniEeKvMv8ZgrW6eEZMIPo7jjEKIoRaZtWSqd1zVILtvnzKFb6
	 iJb/Po/j7YuVrcsk4qqMl26+SeI4DrOPpLcABq+BOSw0W9n1nlCCb7B4dYZp5K1CZM
	 u0cP+VSo8OvZBNz1Zw5qnhqeSY1WUGLg8fmg96Be5Yx+HE3m0aemQ8ScbwwuCm0cOr
	 ZvozkS3uUKpRYktXXXEl+QzFigmHF+p17MzzNDZ1lZVXz+iGENYEXtGa7nbGf7MW9E
	 OPlvA6yXdDDAw==
Date: Thu, 30 Apr 2026 16:05:08 +0100
From: Lee Jones <lee@kernel.org>
To: Jan Carlo Roleda <jancarlo.roleda@analog.com>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 2/2] leds: ltc3208: Add driver for LTC3208
 Multidisplay LED Driver
Message-ID: <20260430150508.GK1806155@google.com>
References: <20260416-upstream-ltc3208-v4-0-3884ed3e49f5@analog.com>
 <20260416-upstream-ltc3208-v4-2-3884ed3e49f5@analog.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260416-upstream-ltc3208-v4-2-3884ed3e49f5@analog.com>
X-Rspamd-Queue-Id: D94C04A4761
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
	TAGGED_FROM(0.00)[bounces-7928-lists,linux-leds=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[analog.com:url,analog.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Thu, 16 Apr 2026, Jan Carlo Roleda wrote:

> Kernel driver implementation for LTC3208 Multidisplay LED Driver.
> 
> The LTC3208 is a Multi-display LED driver, designed to control up to
> 7 distinct LED channels (MAIN, SUB, AUX, CAMHI, CAMLO, RED, GREEN, BLUE),
> each configurable with its own current level that is equally set to its
> respective output current source pins for external LEDs.
> 
> It is programmed via the I2C serial interface.
> MAIN and SUB support 8-bit current level resolution,
> while AUX, CAMHI/LO, RED, GREEN, and BLUE support 4-bit levels.
> 
> The AUX LED channel can be configured to mirror the CAM, SUB, and MAIN
> channel current levels, or as its own independent AUX channel.
> 
> The CAM LED channel is configured as 2 separate CAMHI and CAMLO register
> sub-channels, which currnet is selected via the CAMHL pin, or set to
> CAMHI register only via setting the S_CAMHILO bit high in register G (0x7).
> 
> Signed-off-by: Jan Carlo Roleda <jancarlo.roleda@analog.com>
> ---
>  MAINTAINERS                 |   2 +-
>  drivers/leds/Kconfig        |  12 ++
>  drivers/leds/Makefile       |   1 +
>  drivers/leds/leds-ltc3208.c | 278 ++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 292 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 19b0b84e934d..48bae02057d5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15131,7 +15131,7 @@ M:	Jan Carlo Roleda <jancarlo.roleda@analog.com>
>  L:	linux-leds@vger.kernel.org
>  S:	Maintained
>  W:	https://ez.analog.com/linux-software-drivers
> -F:	Documentation/devicetree/bindings/leds/adi,ltc3208.yaml

Is this related to this change?  Was it intentional?

> +F:	drivers/leds/leds-ltc3208.c
>  
>  LTC4282 HARDWARE MONITOR DRIVER
>  M:	Nuno Sa <nuno.sa@analog.com>
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 597d7a79c988..d13bbec73f06 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -1029,6 +1029,18 @@ config LEDS_ACER_A500
>  	  This option enables support for the Power Button LED of
>  	  Acer Iconia Tab A500.
>  
> +config LEDS_LTC3208
> +	tristate "LED Driver for Analog Devices LTC3208"
> +	depends on LEDS_CLASS && I2C
> +	select REGMAP_I2C
> +	help
> +	  Say Y to enable the LTC3208 LED driver.
> +	  This enables the LED device LTC3208, a 7-channel, 17-current source
> +	  multidisplay high-current LED driver, configured via I2C.
> +
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
> index 000000000000..9da8f4b359e3
> --- /dev/null
> +++ b/drivers/leds/leds-ltc3208.c
> @@ -0,0 +1,278 @@
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
> +#include <linux/i2c.h>
> +#include <linux/leds.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +#include <linux/types.h>
> +
> +#define LTC3208_LED_SET_HIGH_BYTE_DATA	GENMASK(7, 4)
> +#define LTC3208_LED_SET_LOW_BYTE_DATA	GENMASK(3, 0)
> +
> +/* Registers */
> +#define LTC3208_REG_A_GRNRED		0x1 /* Green (High half-byte) */
> +					/* and Red (Low half-byte) current DAC*/
> +#define LTC3208_REG_B_AUXBLU		0x2 /* AUX (High half-byte) */
> +					/* and Blue (Low half-byte) current DAC*/
> +#define LTC3208_REG_C_MAIN		0x3 /* Main current DAC */
> +#define LTC3208_REG_D_SUB		0x4 /* Sub current DAC */
> +#define LTC3208_REG_E_AUX_SELECT	0x5 /* AUX DAC Select */
> +#define  LTC3208_AUX1_MASK		GENMASK(1, 0)
> +#define  LTC3208_AUX2_MASK		GENMASK(3, 2)
> +#define  LTC3208_AUX3_MASK		GENMASK(5, 4)
> +#define  LTC3208_AUX4_MASK		GENMASK(7, 6)
> +#define LTC3208_REG_F_CAM		0x6 /* CAM (High half-byte and Low half-byte) current DAC*/
> +#define LTC3208_REG_G_OPT		0x7 /* Device Options */
> +#define  LTC3208_OPT_CPO_MASK		GENMASK(7, 6)
> +#define  LTC3208_OPT_DIS_RGBDROP	BIT(3)
> +#define  LTC3208_OPT_DIS_CAMHILO	BIT(2)
> +#define  LTC3208_OPT_EN_RGBS		BIT(1)
> +
> +#define LTC3208_MAX_BRIGHTNESS_4BIT	0xF
> +#define LTC3208_MAX_BRIGHTNESS_8BIT	0xFF
> +
> +#define LTC3208_NUM_LED_GRPS		8
> +#define LTC3208_NUM_AUX_LEDS		4
> +
> +#define LTC3208_NUM_AUX_OPT		4
> +#define LTC3208_MAX_CPO_OPT		3
> +
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
> +struct ltc3208_led {
> +	struct led_classdev cdev;
> +	struct i2c_client *client;
> +	enum ltc3208_channel channel;
> +};
> +
> +struct ltc3208_dev {
> +	struct i2c_client *client;

We don't need 2 of these.

> +	struct regmap *map;

'regmap' throughout.

> +	struct ltc3208_led *leds;

__counted_by?

> +};
> +
> +static const struct regmap_config ltc3208_regmap_cfg = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +};

'.cache_type'?

> +
> +static int ltc3208_led_set_current_low(struct regmap *regmap, u8 reg, u8 level)
> +{
> +	return regmap_update_bits(regmap, reg, LTC3208_LED_SET_LOW_BYTE_DATA, level);
> +}
> +
> +static int ltc3208_led_set_current_high(struct regmap *regmap, u8 reg, u8 level)
> +{
> +	return regmap_update_bits(regmap, reg, LTC3208_LED_SET_HIGH_BYTE_DATA, level);
> +}

No abstraction for the sake of it.  Use regmap_update_bits() in place instead.

It looks like 'level' is not shifted here, which means 'level & mask' inside
'regmap_update_bits' will evaluate to 0.  Could we use 'regmap_field' for these
bit-level accesses instead, as it handles the shifting automatically?

> +
> +static int ltc3208_led_set_brightness(struct led_classdev *led_cdev, enum led_brightness brightness)
> +{
> +	struct ltc3208_led *led = container_of(led_cdev, struct ltc3208_led, cdev);
> +	struct i2c_client *client = led->client;
> +	struct ltc3208_dev *dev = i2c_get_clientdata(client);

This confused me for a moment.

Drop the '_dev" part and call the variable 'ddata'.

> +	struct regmap *regmap = dev->map;

'regmap' throughout.

> +	u8 current_level = brightness;
> +
> +	switch (led->channel) {
> +	case LTC3208_CHAN_MAIN:
> +		return regmap_write(regmap, LTC3208_REG_C_MAIN, current_level);
> +	case LTC3208_CHAN_SUB:
> +		return regmap_write(regmap, LTC3208_REG_D_SUB, current_level);
> +	case LTC3208_CHAN_AUX:
> +		return ltc3208_led_set_current_high(regmap, LTC3208_REG_B_AUXBLU, current_level);
> +	case LTC3208_CHAN_BLUE:
> +		return ltc3208_led_set_current_low(regmap, LTC3208_REG_B_AUXBLU, current_level);
> +	case LTC3208_CHAN_CAMH:
> +		return ltc3208_led_set_current_high(regmap, LTC3208_REG_F_CAM, current_level);
> +	case LTC3208_CHAN_CAML:
> +		return ltc3208_led_set_current_low(regmap, LTC3208_REG_F_CAM, current_level);
> +	case LTC3208_CHAN_GREEN:
> +		return ltc3208_led_set_current_high(regmap, LTC3208_REG_A_GRNRED, current_level);
> +	case LTC3208_CHAN_RED:
> +		return ltc3208_led_set_current_low(regmap, LTC3208_REG_A_GRNRED, current_level);
> +	default:
> +		dev_err(&client->dev, "Invalid LED Channel\n");
> +		return -EINVAL;
> +	}
> +}
> +
> +static int ltc3208_update_options(struct ltc3208_dev *dev,
> +				  bool is_sub, bool is_cam_hi, bool is_rgb_drop)
> +{

Since this helper function only has one call site, should we inline its logic
directly into the probe function to reduce superfluous abstractions?

> +	struct regmap *map = dev->map;
> +	u8 val;
> +
> +	val =	FIELD_PREP(LTC3208_OPT_EN_RGBS, is_sub) |
> +		FIELD_PREP(LTC3208_OPT_DIS_CAMHILO, is_cam_hi) |
> +		FIELD_PREP(LTC3208_OPT_DIS_RGBDROP, is_rgb_drop);
> +
> +	return regmap_write(map, LTC3208_REG_G_OPT, val);
> +}
> +
> +static int ltc3208_update_aux_dac(struct ltc3208_dev *dev, enum ltc3208_aux_channel *aux_chan)
> +{

Similarly, as this function is only called once, could we inline its logic into
the probe function?

> +	struct regmap *map = dev->map;
> +	u8 val;
> +
> +	val =	FIELD_PREP(LTC3208_AUX1_MASK, aux_chan[0]) |
> +		FIELD_PREP(LTC3208_AUX2_MASK, aux_chan[1]) |
> +		FIELD_PREP(LTC3208_AUX3_MASK, aux_chan[2]) |
> +		FIELD_PREP(LTC3208_AUX4_MASK, aux_chan[3]);
> +
> +	return regmap_write(map, LTC3208_REG_E_AUX_SELECT, val);
> +}
> +
> +static int ltc3208_probe(struct i2c_client *client)
> +{
> +	enum ltc3208_aux_channel aux_channels[LTC3208_NUM_AUX_LEDS];
> +	struct ltc3208_dev *dev_data;

Consistency.

> +	struct ltc3208_led *leds;
> +	struct regmap *regmap;
> +	int ret;
> +	u32 val;

'val' is a weak variable name.  How about 'chan'?

> +	bool dropdis_rgb_aux4;
> +	bool dis_camhl;
> +	bool en_rgbs;

All of these variable names are non-forthcoming.

Please improve the nomenclature of each of them.

> +	regmap = devm_regmap_init_i2c(client, &ltc3208_regmap_cfg);
> +	if (IS_ERR(regmap))
> +		return dev_err_probe(&client->dev, PTR_ERR(regmap),
> +				     "Failed to initialize regmap\n");
> +
> +	dev_data = devm_kzalloc(&client->dev, sizeof(*dev_data), GFP_KERNEL);
> +	if (!dev_data)
> +		return -ENOMEM;
> +
> +	leds = devm_kcalloc(&client->dev, LTC3208_NUM_LED_GRPS,
> +			    sizeof(struct ltc3208_led), GFP_KERNEL)u
> +	if (!leds)
> +		return -ENOMEM;
> +
> +	dev_data->client = client;
> +	dev_data->map = regmap;
> +
> +	dis_camhl = device_property_read_bool(&client->dev, "adi,disable-camhl-pin");
> +	en_rgbs = device_property_read_bool(&client->dev, "adi,cfg-enrgbs-pin");
> +	dropdis_rgb_aux4 = device_property_read_bool(&client->dev, "adi,disable-rgb-aux4-dropout");
> +
> +	ret = ltc3208_update_options(dev_data, en_rgbs, dis_camhl,
> +				     dropdis_rgb_aux4);
> +	if (ret)
> +		return dev_err_probe(&client->dev, ret, "error writing to options register\n");
> +
> +	/* Initialize aux channel configurations from devicetree */

No need to shorten words in comments and drop the "from devicetree"
part.  It doesn't really add anything.

> +	for (int i = 0; i < LTC3208_NUM_AUX_LEDS; i++) {
> +		ret = device_property_match_property_string(&client->dev,
> +							    ltc3208_dt_aux_channels[i],
> +							    ltc3208_aux_opt,
> +							    LTC3208_NUM_AUX_OPT);
> +		/* Use default value if absent in devicetree */

"Fall-back to default value if not found"

> +		if (ret == -EINVAL)
> +			aux_channels[i] = LTC3208_AUX_CHAN_AUX;
> +		else if (ret >= 0)
> +			aux_channels[i] = ret;
> +		else
> +			return dev_err_probe(&client->dev, ret,
> +					     "Failed getting aux-channel %d\n", i);

"Failed to set the auxiliary channel"

But when would this happen?

If we have an acceptable default value, why not use it?

> +	}
> +
> +	ret = ltc3208_update_aux_dac(dev_data, aux_channels);
> +	if (ret)
> +		return dev_err_probe(&client->dev, ret, "error writing to aux channel register.\n");
> +
> +	i2c_set_clientdata(client, dev_data);
> +
> +	device_for_each_child_node_scoped(&client->dev, child) {
> +		struct ltc3208_led *led;
> +		struct led_init_data init_data = {};
> +
> +		ret = fwnode_property_read_u32(child, "reg", &val);
> +		if (ret)
> +			return dev_err_probe(&client->dev, -EINVAL,
> +					     "Failed to get reg value of LED.\n");

Could we propagate the original error code returned by
'fwnode_property_read_u32' instead of hard-coding '-EINVAL' here?

> +		else if (val >= LTC3208_NUM_LED_GRPS)
> +			return dev_err_probe(&client->dev, -EINVAL,
> +					     "LED reg value not supported.\n");

"LED channel out of range" ?

> +
> +		led = &leds[val];
> +		led->client = client;
> +		led->channel = val;
> +		led->cdev.brightness_set_blocking = ltc3208_led_set_brightness;
> +		led->cdev.max_brightness = LTC3208_MAX_BRIGHTNESS_4BIT;

Nit: '\n' here.

> +		if (val == LTC3208_CHAN_MAIN || val == LTC3208_CHAN_SUB)
> +			led->cdev.max_brightness = LTC3208_MAX_BRIGHTNESS_8BIT;
> +
> +		init_data.fwnode = child;
> +
> +		ret = devm_led_classdev_register_ext(&client->dev, &led->cdev,
> +			&init_data);

Surely this is shorter than the one 2 lines down?  Use 100-chars throughout.

> +		if (ret)
> +			return dev_err_probe(&client->dev, ret, "Failed to register LED %u\n", val);
> +	}
> +
> +	dev_data->leds = leds;
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id ltc3208_match_table[] = {
> +	{.compatible = "adi,ltc3208"},

Spaces between the '{' and '}'.
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

-- 
Lee Jones

