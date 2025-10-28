Return-Path: <linux-leds+bounces-5923-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15434C14CDF
	for <lists+linux-leds@lfdr.de>; Tue, 28 Oct 2025 14:21:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D460424CCD
	for <lists+linux-leds@lfdr.de>; Tue, 28 Oct 2025 13:21:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 086A02F619F;
	Tue, 28 Oct 2025 13:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AjZ2rEYe"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2A22765E3;
	Tue, 28 Oct 2025 13:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761657694; cv=none; b=Nz81bNvTJwnCc2vWUW0rRpqVO9A6T9FD6jgCApavqR5w13uei0MsbkWze6mlio2rkik631puoUqpS/73FgEG77vPe8X+34vJZBxXoqaae67Tk4FM/QQJHHIYVZxa6hd9Q0Fkt/nhGp5EHEkoUnwTmzx6ysYp146gkf07FN0KpPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761657694; c=relaxed/simple;
	bh=WaD4tJ+AXEjZDHr5tALQURL5gA1hTrCzYkmSf9OKPmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e5fyqY32iajkEUbl6t/UgHxw7TDDaSMnMA0qrXdfqbiWyWLhXhJtxe1YZ/MDJMmOH45krzwv4lEhgVKL1HEdIQ5ayPlDY0zWOlBahWkW8JlM6kxEfPlgzWURTzRNTZ2QR7n1Bb18v/0e/Ot1Ekw8PS52UxjJ+RaIeP062SMKrk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AjZ2rEYe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4EA6C4CEF7;
	Tue, 28 Oct 2025 13:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761657694;
	bh=WaD4tJ+AXEjZDHr5tALQURL5gA1hTrCzYkmSf9OKPmk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AjZ2rEYeqopIpuVWy0dZGITG9nu8t4HTbSuEXu2dn/82sboaDSTTL9MJYpT0tW/hP
	 IcLne9JU2jCzMr+fpUPRtGmAa9yY8RbekJ0LQodmQJm3v9UdhqPvs98pHDXvCAwrOZ
	 ZEOKt8kiQ1uwcjPIZV6ouJWRpZM72z0ONTMoqP4z83sJK1Wf7hhLya97xmymUcaZYA
	 KzaO+pw2YCBS1lUR0MhAlac1QozPSj/TKaPHsfxY1XbbGBjqnr9mZsZWSRY+cDEL9r
	 3+62Qi2by1TUV9xWi1xBDmEeFKknHwtVWTb+XM42bfwGvFS++rSVNyU4tvkpakHAvh
	 B3qsAtdLR37vw==
Date: Tue, 28 Oct 2025 13:22:23 +0000
From: Daniel Thompson <danielt@kernel.org>
To: Junjie Cao <caojunjie650@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org, Pengyu Luo <mitltlatltl@gmail.com>
Subject: Re: [PATCH 2/2] backlight: aw99706: Add support for Awinic AW99706
 backlight
Message-ID: <aQDDjzl65dMZEnwM@aspen.lan>
References: <20251026123923.1531727-1-caojunjie650@gmail.com>
 <20251026123923.1531727-3-caojunjie650@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251026123923.1531727-3-caojunjie650@gmail.com>

On Sun, Oct 26, 2025 at 08:39:23PM +0800, Junjie Cao wrote:
> Add support for Awinic AW99706 backlight, which can be found in
> tablet and notebook backlight, one case is the Lenovo Legion Y700
> Gen4. This driver refers to the official datasheets and android
> driver, they can be found in [1].
>
> [1] https://www.awinic.com/en/productDetail/AW99706QNR
>
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> Signed-off-by: Junjie Cao <caojunjie650@gmail.com>
> ---
> diff --git a/drivers/video/backlight/aw99706.c b/drivers/video/backlight/aw99706.c
> new file mode 100644
> index 000000000..8dafdea45
> --- /dev/null
> +++ b/drivers/video/backlight/aw99706.c
> @@ -0,0 +1,503 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * aw99706 - Backlight driver for the AWINIC AW99706
> + *
> + * Copyright (C) 2025 Junjie Cao <caojunjie650@gmail.com>
> + * Copyright (C) 2025 Pengyu Luo <mitltlatltl@gmail.com>
> + *
> + * Based on vendor driver:
> + * Copyright (c) 2023 AWINIC Technology CO., LTD
> + */
> +
> +#include <linux/backlight.h>
> +#include <linux/bitfield.h>
> +#include <linux/delay.h>
> +#include <linux/gpio.h>
> +#include <linux/i2c.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/regmap.h>
> +
> +#define AW99706_MAX_BRT_LVL		4095
> +#define AW99706_REG_MAX			0x1F
> +#define AW99706_ID			0x07
> +
> +/* registers list */
> +#define AW99706_CFG0_REG			0x00
> +#define AW99706_DIM_MODE_MASK			GENMASK(1, 0)
> +
> +#define AW99706_CFG1_REG			0x01
> +#define AW99706_SW_FREQ_MASK			GENMASK(3, 0)
> +#define AW99706_SW_ILMT_MASK			GENMASK(5, 4)
> +
> +#define AW99706_CFG2_REG			0x02
> +#define AW99706_ILED_MAX_MASK			GENMASK(6, 0)
> +#define AW99706_UVLOSEL_MASK			BIT(7)
> +
> +#define AW99706_CFG3_REG			0x03
> +#define AW99706_CFG4_REG			0x04
> +#define AW99706_BRT_MSB_MASK			GENMASK(3, 0)
> +
> +#define AW99706_CFG5_REG			0x05
> +#define AW99706_BRT_LSB_MASK			GENMASK(7, 0)
> +
> +#define AW99706_CFG6_REG			0x06
> +#define AW99706_FADE_TIME_MASK			GENMASK(2, 0)
> +#define AW99706_SLOPE_TIME_MASK			GENMASK(5, 3)
> +#define AW99706_RAMP_CTL_MASK			GENMASK(7, 6)
> +
> +#define AW99706_CFG7_REG			0x07
> +#define AW99706_BRT_MODE_MASK			GENMASK(1, 0)
> +
> +#define AW99706_CFG8_REG			0x08
> +#define AW99706_ONOFF_TIME_MASK			GENMASK(2, 0)
> +
> +#define AW99706_CFG9_REG			0x09
> +#define AW99706_CFGA_REG			0x0A
> +#define AW99706_CFGB_REG			0x0B
> +#define AW99706_CFGC_REG			0x0C
> +#define AW99706_CFGD_REG			0x0D
> +#define AW99706_FLAG_REG			0x10
> +#define AW99706_BACKLIGHT_EN_MASK		BIT(7)
> +
> +#define AW99706_CHIPID_REG			0x11
> +#define AW99706_LED_OPEN_FLAG_REG		0x12
> +#define AW99706_LED_SHORT_FLAG_REG		0x13
> +#define AW99706_MTPLDOSEL_REG			0x1E
> +#define AW99706_MTPRUN_REG			0x1F
> +
> +#define RESV	0
> +
> +/* Boost switching frequency table, in kHz */
> +static const u32 aw99706_sw_freq_tbl[] = {
> +	RESV, RESV, RESV, RESV, 300, 400, 500, 600,
> +	660, 750, 850, 1000, 1200, 1330, 1500, 1700
> +};
> +
> +/* Switching current limitation table, in mA */
> +static const u32 aw99706_sw_ilmt_tbl[] = {
> +	1500, 2000, 2500, 3000
> +};
> +
> +/* ULVO threshold table, in mV */
> +static const u32 aw99706_ulvo_thres_tbl[] = {
> +	2200, 5000
> +};
> +
> +/* Fade In/Out time table, in us */
> +static const u32 aw99706_fade_time_tbl[] = {
> +	8, 16, 32, 64, 128, 256, 512, 1024
> +};
> +
> +/* Slope time table, in ms */
> +static const u32 aw99706_slopetime_tbl[] = {
> +	8, 24, 48, 96, 200, 300, 400, 500
> +};
> +
> +/* Turn on/off time table, in ns */
> +static const u32 aw99706_onoff_time_tbl[] = {
> +	RESV, 250, 500, 1000, 2000, 4000, 8000, 16000
> +};
> +
> +struct aw99706_device {
> +	struct i2c_client *client;
> +	struct device *dev;
> +	struct regmap *regmap;
> +	struct backlight_device *bl_dev;
> +	struct gpio_desc *hwen_gpio;
> +	bool bl_enable;
> +};
> +
> +enum reg_access {
> +	REG_NONE_ACCESS	= 0,
> +	REG_RD_ACCESS	= 1,
> +	REG_WR_ACCESS	= 2,
> +};
> +
> +struct aw99706_reg {
> +	u8 defval;
> +	u8 access;
> +};
> +
> +const struct aw99706_reg aw99706_regs[AW99706_REG_MAX + 1] = {
> +	[AW99706_CFG0_REG]		= {0x65, REG_RD_ACCESS | REG_WR_ACCESS},
> +	[AW99706_CFG1_REG]		= {0x39, REG_RD_ACCESS | REG_WR_ACCESS},
> +	[AW99706_CFG2_REG]		= {0x1e, REG_RD_ACCESS | REG_WR_ACCESS},
> +	[AW99706_CFG3_REG]		= {0x04, REG_RD_ACCESS | REG_WR_ACCESS},
> +	[AW99706_CFG4_REG]		= {0x00, REG_RD_ACCESS | REG_WR_ACCESS},
> +	[AW99706_CFG5_REG]		= {0x00, REG_RD_ACCESS | REG_WR_ACCESS},
> +	[AW99706_CFG6_REG]		= {0xa9, REG_RD_ACCESS | REG_WR_ACCESS},
> +	[AW99706_CFG7_REG]		= {0x04, REG_RD_ACCESS | REG_WR_ACCESS},
> +	[AW99706_CFG8_REG]		= {0x0c, REG_RD_ACCESS | REG_WR_ACCESS},
> +	[AW99706_CFG9_REG]		= {0x4b, REG_RD_ACCESS | REG_WR_ACCESS},
> +	[AW99706_CFGA_REG]		= {0x72, REG_RD_ACCESS | REG_WR_ACCESS},
> +	[AW99706_CFGB_REG]		= {0x01, REG_RD_ACCESS | REG_WR_ACCESS},
> +	[AW99706_CFGC_REG]		= {0x6c, REG_RD_ACCESS | REG_WR_ACCESS},
> +	[AW99706_CFGD_REG]		= {0xfe, REG_RD_ACCESS | REG_WR_ACCESS},
> +	[AW99706_FLAG_REG]		= {0x00, REG_RD_ACCESS},
> +	[AW99706_CHIPID_REG]		= {AW99706_ID, REG_RD_ACCESS},
> +	[AW99706_LED_OPEN_FLAG_REG]	= {0x00, REG_RD_ACCESS},
> +	[AW99706_LED_SHORT_FLAG_REG]	= {0x00, REG_RD_ACCESS},
> +
> +	/*
> +	 * Write bit is dropped here, writing BIT(0) to MTPLDOSEL will unlock
> +	 * Multi-time Programmable (MTP).
> +	 */
> +	[AW99706_MTPLDOSEL_REG]		= {0x00, REG_RD_ACCESS},
> +	[AW99706_MTPRUN_REG]		= {0x00, REG_NONE_ACCESS},
> +};
> +
> +static bool aw99706_readable_reg(struct device *dev, unsigned int reg)
> +{
> +	return aw99706_regs[reg].access & REG_RD_ACCESS;
> +}
> +
> +static bool aw99706_writeable_reg(struct device *dev, unsigned int reg)
> +{
> +	return aw99706_regs[reg].access & REG_WR_ACCESS;
> +}
> +
> +static inline int aw99706_i2c_read(struct aw99706_device *aw, u8 reg,
> +				   unsigned int *val)
> +{
> +	return regmap_read(aw->regmap, reg, val);
> +}
> +
> +static inline int aw99706_i2c_write(struct aw99706_device *aw, u8 reg, u8 val)
> +{
> +	return regmap_write(aw->regmap, reg, val);
> +}
> +
> +static inline int aw99706_i2c_update_bits(struct aw99706_device *aw, u8 reg,
> +					  u8 mask, u8 val)
> +{
> +	return regmap_update_bits(aw->regmap, reg, mask, val);
> +}
> +
> +struct aw99706_dt_prop {
> +	const char * const name;
> +	const u32 * const lookup_tbl;
> +	u8 tbl_size;
> +	u8 reg;
> +	u8 mask;
> +	u8 val;
> +	u32 raw_val;
> +};
> +
> +static struct aw99706_dt_prop aw99706_dt_props[] = {
> +	{
> +		"awinic,dim-mode", NULL,
> +		0,
> +		AW99706_CFG0_REG, AW99706_DIM_MODE_MASK
> +	},
> +	{
> +		"awinic,sw-freq", aw99706_sw_freq_tbl,
> +		ARRAY_SIZE(aw99706_sw_freq_tbl),
> +		AW99706_CFG1_REG, AW99706_SW_FREQ_MASK
> +	},
> +	{
> +		"awinic,sw-ilmt", aw99706_sw_ilmt_tbl,
> +		ARRAY_SIZE(aw99706_sw_ilmt_tbl),
> +		AW99706_CFG1_REG, AW99706_SW_ILMT_MASK
> +	},
> +	{
> +		"awinic,iled-max", NULL,
> +		0,
> +		AW99706_CFG2_REG, AW99706_ILED_MAX_MASK
> +
> +	},
> +	{
> +		"awinic,uvlo-thres", aw99706_ulvo_thres_tbl,
> +		ARRAY_SIZE(aw99706_ulvo_thres_tbl),
> +		AW99706_CFG2_REG, AW99706_UVLOSEL_MASK
> +	},
> +	{
> +		"awinic,fade-time", aw99706_fade_time_tbl,
> +		ARRAY_SIZE(aw99706_fade_time_tbl),
> +		AW99706_CFG6_REG, AW99706_FADE_TIME_MASK
> +	},
> +	{
> +		"awinic,slope-time", aw99706_slopetime_tbl,
> +		ARRAY_SIZE(aw99706_slopetime_tbl),
> +		AW99706_CFG6_REG, AW99706_SLOPE_TIME_MASK
> +	},
> +	{
> +		"awinic,ramp-ctl", NULL,
> +		0,
> +		AW99706_CFG6_REG, AW99706_RAMP_CTL_MASK
> +	},
> +	{
> +		"awinic,brt-mode", NULL,
> +		0,
> +		AW99706_CFG7_REG, AW99706_BRT_MODE_MASK
> +	},
> +	{
> +		"awinic,onoff-time", aw99706_onoff_time_tbl,
> +		ARRAY_SIZE(aw99706_onoff_time_tbl),
> +		AW99706_CFG8_REG, AW99706_ONOFF_TIME_MASK
> +	},
> +};
> +
> +static int aw99706_lookup(const u32 * const tbl, int size, u32 val)
> +{
> +	int i;
> +
> +	for (i = 0; i < size; i++)
> +		if (tbl[i] == val)
> +			return i;
> +
> +	return -1;
> +}
> +
> +static inline void aw99706_prop_set_default(struct aw99706_dt_prop *prop)
> +{
> +	prop->val = prop->mask & aw99706_regs[prop->reg].defval;

Why included the default value in the register descriptions?

defval is only used to provide values for missing DT properties so using
the raw register values is cryptic and hard to read.

Including a default value in the aw99706_dt_props table instead would be
much more readable (because the defaults could use the same units at the
device tree).


> +}
> +
> +static void aw99706_dt_property_convert(struct aw99706_dt_prop *prop)
> +{
> +	unsigned int val, shift;
> +
> +	if (prop->lookup_tbl) {
> +		val = aw99706_lookup(prop->lookup_tbl, prop->tbl_size,
> +				     prop->raw_val);
> +		if (val < 0) {
> +			aw99706_prop_set_default(prop);

This should not happen silently.

If the DT has provided an invalid value then we be issuing *at minimum*
a message at warning level or above. Many drivers will simply refuse to
probe when the DT is broken.


> +			return;
> +		}
> +
> +	} else {
> +		val = prop->raw_val;
> +	}
> +
> +	shift = ffs(prop->mask) - 1;
> +	val <<= shift;
> +	prop->val = prop->mask & val;
> +}
> +
> +static void aw99706_dt_parse(struct aw99706_device *aw)
> +{
> +	struct aw99706_dt_prop *prop;
> +	int ret, i;
> +
> +	for (i = 0; i < ARRAY_SIZE(aw99706_dt_props); i++) {
> +		prop = &aw99706_dt_props[i];
> +		ret = device_property_read_u32(aw->dev, prop->name,
> +					       &prop->raw_val);
> +		if (ret < 0) {
> +			dev_warn(aw->dev, "Missing property %s: %d\n",
> +				 prop->name, ret);

Why is there a warning when an optional property is not present. A DT
not including an optional property needs no message at all.


> +
> +			aw99706_prop_set_default(prop);
> +		} else {
> +			aw99706_dt_property_convert(prop);
> +		}
> +	}
> +
> +	/* This property requires a long linear array, using formula for now */
> +	aw99706_dt_props[3].val = (aw99706_dt_props[3].raw_val - 5000) / 500;

Using a formula is fine, but I don't like doing it retrospectively.
Hard coding the 3 makes maintenance difficult and we end up making the
whole of aw99706_dt_props writeable just so we can store raw_val once!

Much better, IMHO, to embed a function pointer into the table and make
the whole table const. The function pointer can be
aw99706_dt_property_convert() in most cases (although rename it
`aw99706_dt_property_lookup_from_table() ) and can implement any
formula you need.


> +}
> +
> +static int aw99706_hw_init(struct aw99706_device *aw)
> +{
> +	int ret, i;
> +
> +	gpiod_set_value_cansleep(aw->hwen_gpio, 1);
> +
> +	for (i = 0; i < ARRAY_SIZE(aw99706_dt_props); i++) {
> +		ret = aw99706_i2c_update_bits(aw, aw99706_dt_props[i].reg,
> +					      aw99706_dt_props[i].mask,
> +					      aw99706_dt_props[i].val);
> +		if (ret < 0) {
> +			dev_err(aw->dev, "Failed to write init data %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int aw99706_bl_enable(struct aw99706_device *aw, bool en)
> +{
> +	int ret;
> +	u8 val;
> +
> +	FIELD_MODIFY(AW99706_BACKLIGHT_EN_MASK, &val, en);
> +	ret = aw99706_i2c_update_bits(aw, AW99706_CFGD_REG,
> +				      AW99706_BACKLIGHT_EN_MASK, val);
> +	if (ret)
> +		dev_err(aw->dev, "Failed to enable backlight!\n");
> +
> +	return ret;
> +}
> +
> +static int aw99706_backlight_switch(struct aw99706_device *aw, u32 brt_lvl)
> +{
> +	bool bl_enable_now = !!brt_lvl;
> +	int ret = 0;
> +
> +	if (aw->bl_enable != bl_enable_now) {
> +		aw->bl_enable = bl_enable_now;
> +		ret = aw99706_bl_enable(aw, bl_enable_now);
> +	}
> +
> +	return ret;
> +}
> +
> +static int aw99706_update_brightness(struct aw99706_device *aw, u32 brt_lvl)
> +{
> +	int ret;
> +
> +	ret = aw99706_i2c_write(aw, AW99706_CFG4_REG,
> +				(brt_lvl >> 8) & AW99706_BRT_MSB_MASK);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = aw99706_i2c_write(aw, AW99706_CFG5_REG,
> +				brt_lvl & AW99706_BRT_LSB_MASK);
> +	if (ret < 0)
> +		return ret;
> +
> +	return aw99706_backlight_switch(aw, brt_lvl);

I'm not sure there is much benefit pushing this out into a seperate
function. Merge this inline.

> +}


Everything below this function looked OK at first glance.


Daniel.

