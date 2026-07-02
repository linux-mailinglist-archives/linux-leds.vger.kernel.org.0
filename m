Return-Path: <linux-leds+bounces-8847-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eG0RFlOKRmrCYAsAu9opvQ
	(envelope-from <linux-leds+bounces-8847-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 17:57:07 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E19226F9C8D
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 17:57:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=HbuP9S6x;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8847-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8847-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CD8D63095BC7
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jul 2026 15:51:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E0F63D9538;
	Thu,  2 Jul 2026 15:50:36 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5935D33F8B1;
	Thu,  2 Jul 2026 15:50:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783007435; cv=none; b=fyPGWhzCHSecp5v26hAy+Vmhmk+8kaHeGCTlqtr+ANsPgvJ3UImU4nVKs48tOC7WNsg8njsOyYhW1P0se+ZN7grDsHpF9RDNt+SiOw04WM0vJ3FHefQAChFd7lG36VaQU1nUtgS5BGxongl1J7KOVCyACpaOYlEymkwV6zBXVTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783007435; c=relaxed/simple;
	bh=xANB8q67wSR8e63cpAotuWhzO9H60NQ3v5BCcuPTLNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hq1l24YdZ4vSBZSFAl97/0AOCQ+Of6FfDmsyWPmeKvHlUhNpovcj/unO18y2qCa1/1pvHCmQThfGBHC3TCBN8vh3M9wTOQqRfyRWXwql8wC04FNAZrdkTQZ/oAWoI5+zkAiyN9rEna6RNViR7Ce4uYsp+FvrbYC+H6lP6v5kowY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HbuP9S6x; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D69701F000E9;
	Thu,  2 Jul 2026 15:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783007431;
	bh=V4NevEbHlSUvFltjXK/Tyc9cIZkd6wVHUn+puE2Fznc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HbuP9S6xjmUpomi0v3UZLpIKdeXAryj6gGG+rXCNwsRIiIbFxswILCgPm5YTfJlk2
	 pgbsUgzAY+HF4CdIzMKAUZlIFEp9MMphMIWVhNEaKAKvCGzjzkfz45hMwJadzDTAHg
	 9ir07SyESuh7WemW+gR7kehxQwCQAVzF5LWStzSrD48NQLSHYVw4H0rfAeP5dYLdNu
	 HWjE6vaOcUSHwiVyNJwQnF4d4kJgjynC2CP2X1+gz94oi1cIP6Bfa0/+2b/mJ8MWL6
	 yeoB8R7My0TjlyTSm23kaXpayuHw2oTe/Ttmd5BjtWW3BAlb57ewxdr6a+SYa/qi0X
	 qiEQt4l6OoznQ==
Date: Thu, 2 Jul 2026 16:50:27 +0100
From: Lee Jones <lee@kernel.org>
To: Jan Carlo Roleda <jancarlo.roleda@analog.com>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v6 2/2] leds: ltc3208: Add driver for LTC3208
 Multidisplay LED Driver
Message-ID: <20260702155027.GV2108533@google.com>
References: <20260623-upstream-ltc3208-v6-0-fc6bd9749166@analog.com>
 <20260623-upstream-ltc3208-v6-2-fc6bd9749166@analog.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623-upstream-ltc3208-v6-2-fc6bd9749166@analog.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8847-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:jancarlo.roleda@analog.com,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:u.kleine-koenig@baylibre.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[analog.com:url,analog.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E19226F9C8D

Few things for you to chew on.

/* Sashiko Automation: Issues Found (6 Findings) */

On Tue, 23 Jun 2026, Jan Carlo Roleda wrote:

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

[Severity: Low]
This isn't a bug, but there's a typo in the commit message: 'currnet' instead
of 'current'.


> 
> Signed-off-by: Jan Carlo Roleda <jancarlo.roleda@analog.com>
> ---
>  MAINTAINERS                 |   1 +
>  drivers/leds/Kconfig        |  12 +++
>  drivers/leds/Makefile       |   1 +
>  drivers/leds/leds-ltc3208.c | 244 ++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 258 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2fd6ffdaaf04..e3b59485ecb3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15229,6 +15229,7 @@ L:	linux-leds@vger.kernel.org
>  S:	Maintained
>  W:	https://ez.analog.com/linux-software-drivers
>  F:	Documentation/devicetree/bindings/leds/adi,ltc3208.yaml
> +F:	drivers/leds/leds-ltc3208.c
>  
>  LTC4282 HARDWARE MONITOR DRIVER
>  M:	Nuno Sa <nuno.sa@analog.com>
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index f4a0a3c8c870..d917ce3b72f4 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -1028,6 +1028,18 @@ config LEDS_ACER_A500
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
> index 7db3768912ca..0148b87e16ba 100644
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
> index 000000000000..3d6bec99e9ea
> --- /dev/null
> +++ b/drivers/leds/leds-ltc3208.c
> @@ -0,0 +1,244 @@
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
> +/* Registers */
> +#define LTC3208_REG_A_GRNRED 0x1 /* Green and Red current DAC*/
> +#define LTC3208_REG_B_AUXBLU 0x2 /* AUX and Blue current DAC*/
> +#define LTC3208_REG_C_MAIN 0x3 /* Main current DAC */
> +#define LTC3208_REG_D_SUB 0x4 /* Sub current DAC */
> +#define LTC3208_REG_E_AUX_SELECT 0x5 /* AUX DAC Select */
> +#define  LTC3208_AUX1_MASK GENMASK(1, 0)
> +#define  LTC3208_AUX2_MASK GENMASK(3, 2)
> +#define  LTC3208_AUX3_MASK GENMASK(5, 4)
> +#define  LTC3208_AUX4_MASK GENMASK(7, 6)
> +#define LTC3208_REG_F_CAM 0x6 /* CAM (High and Low) current DAC*/
> +#define LTC3208_REG_G_OPT 0x7 /* Device Options */
> +#define  LTC3208_OPT_CPO_MASK GENMASK(7, 6)

[Severity: Low]
Is this macro needed? It appears to be defined but never used in the driver.
The same applies to LTC3208_MAX_CPO_OPT defined later.


> +#define  LTC3208_OPT_DIS_RGBDROP BIT(3)
> +#define  LTC3208_OPT_DIS_CAMHILO BIT(2)
> +#define  LTC3208_OPT_EN_RGBS BIT(1)
> +
> +#define LTC3208_MAX_BRIGHTNESS_4BIT 0xF
> +#define LTC3208_MAX_BRIGHTNESS_8BIT 0xFF
> +
> +#define LTC3208_NUM_LED_GRPS 8
> +#define LTC3208_NUM_AUX_LEDS 4
> +
> +#define LTC3208_NUM_AUX_OPT 4
> +#define LTC3208_MAX_CPO_OPT 3
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
> +	LTC3208_CHAN_GREEN,
> +	LTC3208_CHAN_N_COUNT,
> +};
> +
> +static const char *const ltc3208_dt_aux_channels[] = { "adi,aux1-channel",
> +						       "adi,aux2-channel",
> +						       "adi,aux3-channel",
> +						       "adi,aux4-channel" };
> +
> +static const char *const ltc3208_aux_opt[] = { "aux", "main", "sub", "cam" };
> +
> +struct ltc3208_led {
> +	struct led_classdev cdev;
> +	struct i2c_client *client;
> +	struct regmap_field *rfield;
> +	enum ltc3208_channel channel;
> +};
> +
> +struct ltc3208 {
> +	struct ltc3208_led leds[LTC3208_NUM_LED_GRPS];
> +	struct regmap *regmap;
> +};

[Severity: Low]
Is the channel member in struct ltc3208_led used anywhere? It gets assigned
during probe but doesn't seem to be read later.

Similarly, the regmap pointer in struct ltc3208 appears to only be used
locally in ltc3208_probe() and isn't needed in the struct.


> +
> +static const struct regmap_config ltc3208_regmap_cfg = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = LTC3208_REG_G_OPT,
> +	.cache_type = REGCACHE_FLAT_S,
> +};

[Severity: High]
Does this regmap configuration need a .reg_defaults array to seed the cache?

Since .reg_defaults is missing, the cache won't be seeded. Later, when
ltc3208_led_set_brightness() calls regmap_field_write() for shared registers
(like LTC3208_REG_A_GRNRED), it will trigger a read-modify-write operation
that issues an I2C read.

If the hardware is write-only, the read will fail and break LED functionality.
If it supports reads, this still introduces unnecessary I2C read latency on a
fast path.


> +
> +static const struct reg_field ltc3208_led_reg_field[LTC3208_CHAN_N_COUNT] = {
> +	[LTC3208_CHAN_MAIN] =  REG_FIELD(LTC3208_REG_C_MAIN, 0, 7),
> +	[LTC3208_CHAN_SUB] =   REG_FIELD(LTC3208_REG_D_SUB, 0, 7),
> +	[LTC3208_CHAN_BLUE] =  REG_FIELD(LTC3208_REG_B_AUXBLU, 0, 3),
> +	[LTC3208_CHAN_AUX] =   REG_FIELD(LTC3208_REG_B_AUXBLU, 4, 7),
> +	[LTC3208_CHAN_CAML] =  REG_FIELD(LTC3208_REG_F_CAM, 0, 3),
> +	[LTC3208_CHAN_CAMH] =  REG_FIELD(LTC3208_REG_F_CAM, 4, 7),
> +	[LTC3208_CHAN_RED] =   REG_FIELD(LTC3208_REG_A_GRNRED, 0, 3),
> +	[LTC3208_CHAN_GREEN] = REG_FIELD(LTC3208_REG_A_GRNRED, 4, 7),
> +};
> +
> +static int ltc3208_led_set_brightness(struct led_classdev *led_cdev,
> +				      enum led_brightness brightness)
> +{
> +	struct ltc3208_led *led =
> +		container_of(led_cdev, struct ltc3208_led, cdev);
> +	u8 current_level = brightness;
> +
> +	return regmap_field_write(led->rfield, current_level);
> +}
> +
> +static int ltc3208_probe(struct i2c_client *client)
> +{
> +	enum ltc3208_aux_channel aux_channels[LTC3208_NUM_AUX_LEDS];
> +	struct ltc3208 *ddata;
> +	struct regmap *regmap;
> +	bool disable_rgb_aux4_dropout_signal;
> +	bool disable_camhl_pin;
> +	bool set_sub_control_pin;
> +	int ret;
> +	u8 reg_val;
> +
> +	regmap = devm_regmap_init_i2c(client, &ltc3208_regmap_cfg);
> +	if (IS_ERR(regmap))
> +		return dev_err_probe(&client->dev, PTR_ERR(regmap),
> +				     "Failed to initialize regmap\n");
> +
> +	ddata = devm_kzalloc(&client->dev, sizeof(*ddata), GFP_KERNEL);
> +	if (!ddata)
> +		return -ENOMEM;
> +
> +	ddata->regmap = regmap;
> +
> +	disable_camhl_pin = device_property_read_bool(&client->dev,
> +						      "adi,disable-camhl-pin");
> +	set_sub_control_pin =
> +		device_property_read_bool(&client->dev, "adi,cfg-enrgbs-pin");
> +	disable_rgb_aux4_dropout_signal =
> +				device_property_read_bool(&client->dev,
> +						"adi,disable-rgb-aux4-dropout");
> +
> +	reg_val = FIELD_PREP(LTC3208_OPT_EN_RGBS, set_sub_control_pin) |
> +		  FIELD_PREP(LTC3208_OPT_DIS_CAMHILO, disable_camhl_pin) |
> +		  FIELD_PREP(LTC3208_OPT_DIS_RGBDROP,
> +			     disable_rgb_aux4_dropout_signal);
> +
> +	ret = regmap_write(regmap, LTC3208_REG_G_OPT, reg_val);

[Severity: Medium]
Does this unconditional write wipe out the existing CPO bits (bits 7:6)?

By using regmap_write() here, any initial hardware configuration done by
the bootloader or hardware defaults (like Charge Pump mode) might be permanently
erased. Would regmap_update_bits() be safer here to apply only the
explicitly configured fields?


> +	if (ret)
> +		return dev_err_probe(&client->dev, ret,
> +				     "error writing to options register\n");
> +
> +	/* Initialize aux channel configurations */
> +	for (int i = 0; i < LTC3208_NUM_AUX_LEDS; i++) {
> +		ret = device_property_match_property_string(
> +			&client->dev, ltc3208_dt_aux_channels[i],
> +			ltc3208_aux_opt, LTC3208_NUM_AUX_OPT);
> +		/* Fallback to default value (AUX) if not found */
> +		if (ret == -ENODATA || ret == -EINVAL)
> +			aux_channels[i] = LTC3208_AUX_CHAN_AUX;
> +		else if (ret < 0)
> +			return dev_err_probe(&client->dev, ret,
> +					     "Error reading AUX Channel %d", i);
> +		else if (ret >= 0)
> +			aux_channels[i] = ret;
> +	}
> +
> +	reg_val = FIELD_PREP(LTC3208_AUX1_MASK, aux_channels[0]) |
> +		  FIELD_PREP(LTC3208_AUX2_MASK, aux_channels[1]) |
> +		  FIELD_PREP(LTC3208_AUX3_MASK, aux_channels[2]) |
> +		  FIELD_PREP(LTC3208_AUX4_MASK, aux_channels[3]);
> +
> +	ret = regmap_write(regmap, LTC3208_REG_E_AUX_SELECT, reg_val);
> +	if (ret)
> +		return dev_err_probe(&client->dev, ret,
> +			"error writing to aux channel register.\n");
> +
> +	device_for_each_child_node_scoped(&client->dev, child) {
> +		struct ltc3208_led *led;
> +		struct led_init_data init_data = {};
> +		u32 chan;
> +
> +		ret = fwnode_property_read_u32(child, "reg", &chan);
> +		if (ret)
> +			return dev_err_probe(&client->dev, ret,
> +					    "Failed to get reg value of LED\n");
> +		else if (chan >= LTC3208_NUM_LED_GRPS)
> +			return dev_err_probe(&client->dev, -EINVAL,
> +					     "%d is an invalid LED ID\n", chan);

[Severity: Low]
Could this dev_err_probe() use %u instead of %d?

The chan variable is an unsigned u32, so %d produces a format string mismatch.


> +		else if (ddata->leds[chan].client)
> +			return dev_err_probe(&client->dev, -EINVAL,
> +					"%d is already registered\n", chan);
> +
> +		led = &ddata->leds[chan];
> +
> +		led->rfield =
> +			devm_regmap_field_alloc(&client->dev, ddata->regmap,
> +						ltc3208_led_reg_field[chan]);
> +		if (IS_ERR(led->rfield))
> +			return dev_err_probe(&client->dev, PTR_ERR(led->rfield),
> +					     "cannot allocate regmap field\n");
> +		led->client = client;
> +		led->channel = chan;
> +		led->cdev.brightness_set_blocking = ltc3208_led_set_brightness;
> +		led->cdev.max_brightness = LTC3208_MAX_BRIGHTNESS_4BIT;
> +
> +		if (chan == LTC3208_CHAN_MAIN || chan == LTC3208_CHAN_SUB)
> +			led->cdev.max_brightness = LTC3208_MAX_BRIGHTNESS_8BIT;
> +
> +		init_data.fwnode = child;
> +
> +		ret = devm_led_classdev_register_ext(&client->dev, &led->cdev,
> +						     &init_data);
> +		if (ret)
> +			return dev_err_probe(&client->dev, ret,
> +					     "LED %u Register failed.\n", chan);
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id ltc3208_match_table[] = {
> +	{ .compatible = "adi,ltc3208" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, ltc3208_match_table);
> +
> +static const struct i2c_device_id ltc3208_idtable[] = {
> +	{ .name = "ltc3208" },
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
Lee Jones

