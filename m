Return-Path: <linux-leds+bounces-1892-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 135109073BE
	for <lists+linux-leds@lfdr.de>; Thu, 13 Jun 2024 15:31:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 562CA1F21773
	for <lists+linux-leds@lfdr.de>; Thu, 13 Jun 2024 13:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B03181422AB;
	Thu, 13 Jun 2024 13:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VVyE97MM"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857D61392;
	Thu, 13 Jun 2024 13:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718285488; cv=none; b=VwCRMiV/oUGYtKDNJI6y3y3jx62go1KX5lNq19nHZq9mRiOkkTeQYXksvnt0+kmWFAm0cTCTpA044deky5heZxNDdf5r1cjsXizYzviedd9eUtf69+Poq4A5Bsf8zBjupakuc1naSsTMhekGKjflX0/qx1nxndM+EdQY/47xOdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718285488; c=relaxed/simple;
	bh=2UkYC+OAbMeU1rns/RfuedXw81/lsmPDWH8S6cMy9aw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aSMKyTxvFakzh3cEAwcqN5sElFNapx8XVlki5d2DpZTyHLwIw+RRkztsv9ekbrgA+tdp6VUfgUvGzLbJahk80KiJUukno/s8cjN3/qv19dHE73WimkENoud8Ct3l8Ji6nKB8MEdROdILJ5/O2B1xqoHqGF85wOHlLtz+vQcJpek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VVyE97MM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04842C2BBFC;
	Thu, 13 Jun 2024 13:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718285488;
	bh=2UkYC+OAbMeU1rns/RfuedXw81/lsmPDWH8S6cMy9aw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VVyE97MM2JXsdMjyVduWceIRjpxMmGiikMC5fGBPXUpdtZu52VjSPnUHFR35r32qd
	 BIe+NWGU+qPCbWizo2siuMKwXllvMmcS+t+HL5arKCt3LtkQp8l0RChdL/DgOh7NH8
	 ZdfSprJDhiu42/UVthMqP9pDEEWXIJ0Syd7jjq6iK8DR9lgaPcbk3N9xR1g3EatHn2
	 MMF8iUU4+FOLbRldPmDOKfsymPIu7/TzaVyF7fqHOBFFdBvxudAxPwwQpIaAi8XsWe
	 pexJkMd/Wylo+bvohMMzBISnN4OO9f1euA6oxPhiTV9O3EML7h0Aiz/vCei4NRbZtk
	 EaYDp/x5XmtTw==
Date: Thu, 13 Jun 2024 14:31:23 +0100
From: Lee Jones <lee@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] leds: leds-lp5569: Add support for Texas
 Instruments LP5569
Message-ID: <20240613133123.GA2561462@google.com>
References: <20240529185904.1448-1-ansuelsmth@gmail.com>
 <20240529185904.1448-3-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240529185904.1448-3-ansuelsmth@gmail.com>

On Wed, 29 May 2024, Christian Marangi wrote:

> Add support for Texas Instruments LP5569 LED driver.
> 
> Texas Instruments LP5569 is 9 channels chip with programmable engines.
> 
> It almost a copy of LP5523 with fundamental changes to regs order and
> regs content.
> 
> Has difference in how the clock is handled and doesn't support detecting
> clock time automatically, different handling for selftest and different
> scheme for the status regs.
> 
> One some devices using this LED Controller (a NBG7815 Router) it was
> found loading big precompiled pattern with up to 3 bytes of code. To
> have support for this "extended" scenarion, hardcode each engine to
> support 4 pages of precompiled pattern (128 bytes of code) and 1 page
> for each MUX. This gives plenty of space for any kind precompiled
> pattern keeping simple logic for page handling of each engine and mux.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
> v4:
> - Fix reported buffer overflow due to a copypaste error
> - Add comments to describe fw size logic
> v3:
> - Enlarge and support program size up to 128bytes
> v2:
> - Fix compilation error with target that doesn't
>   include bitfield.h
> 
>  drivers/leds/Kconfig       |   16 +-
>  drivers/leds/Makefile      |    1 +
>  drivers/leds/leds-lp5569.c | 1162 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 1176 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/leds/leds-lp5569.c
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 05e6af88b88c..b1d7d94317b3 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -414,7 +414,7 @@ config LEDS_LP50XX
>  	  module will be called leds-lp50xx.
>  
>  config LEDS_LP55XX_COMMON
> -	tristate "Common Driver for TI/National LP5521/5523/55231/5562/8501"
> +	tristate "Common Driver for TI/National LP5521/5523/55231/5562/5569/8501"
>  	depends on LEDS_CLASS
>  	depends on LEDS_CLASS_MULTICOLOR
>  	depends on OF
> @@ -422,8 +422,8 @@ config LEDS_LP55XX_COMMON
>  	select FW_LOADER
>  	select FW_LOADER_USER_HELPER
>  	help
> -	  This option supports common operations for LP5521/5523/55231/5562/8501
> -	  devices.
> +	  This option supports common operations for LP5521/5523/55231/5562/5569/
> +	  8501 devices.
>  
>  config LEDS_LP5521
>  	tristate "LED Support for N.S. LP5521 LED driver chip"
> @@ -456,6 +456,16 @@ config LEDS_LP5562
>  	  Driver provides direct control via LED class and interface for
>  	  programming the engines.
>  
> +config LEDS_LP5569
> +	tristate "LED Support for TI LP5569 LED driver chip"
> +	depends on LEDS_CLASS && I2C
> +	depends on LEDS_LP55XX_COMMON
> +	help
> +	  If you say yes here you get support for TI LP5569 LED driver.
> +	  It is 9 channels chip with programmable engines.

"channel"

What's an engine?

> +	  Driver provides direct control via LED class and interface for
> +	  programming the engines.
> +
>  config LEDS_LP8501
>  	tristate "LED Support for TI LP8501 LED driver chip"
>  	depends on LEDS_CLASS && I2C
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index effdfc6f1e95..ad21941efa19 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -51,6 +51,7 @@ obj-$(CONFIG_LEDS_LP50XX)		+= leds-lp50xx.o
>  obj-$(CONFIG_LEDS_LP5521)		+= leds-lp5521.o
>  obj-$(CONFIG_LEDS_LP5523)		+= leds-lp5523.o
>  obj-$(CONFIG_LEDS_LP5562)		+= leds-lp5562.o
> +obj-$(CONFIG_LEDS_LP5569)		+= leds-lp5569.o
>  obj-$(CONFIG_LEDS_LP55XX_COMMON)	+= leds-lp55xx-common.o
>  obj-$(CONFIG_LEDS_LP8501)		+= leds-lp8501.o
>  obj-$(CONFIG_LEDS_LP8788)		+= leds-lp8788.o
> diff --git a/drivers/leds/leds-lp5569.c b/drivers/leds/leds-lp5569.c
> new file mode 100644
> index 000000000000..88487e9d59bd
> --- /dev/null
> +++ b/drivers/leds/leds-lp5569.c
> @@ -0,0 +1,1162 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * lp5569.c - LP5569LED Driver

Please remove filenames - they have a habit of becoming incorrect.

Is "LP5569LED" correct?  Zero hits on Google.

> + *
> + * Copyright (C) 2010 Nokia Corporation
> + * Copyright (C) 2012 Texas Instruments

This is very out of date?

> + *
> + * Contact: Samu Onkalo <samu.p.onkalo@nokia.com>
> + *          Milo(Woogyom) Kim <milo.kim@ti.com>

Are you sure these people want to be the contacts?

Have you spoken to them?  Are the email addresses still valid?

> + *          Christian Marangi <ansuelsmth@gmail.com>
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/delay.h>
> +#include <linux/firmware.h>
> +#include <linux/i2c.h>
> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
> +#include <linux/platform_data/leds-lp55xx.h>
> +#include <linux/slab.h>
> +#include <dt-bindings/leds/leds-lp55xx.h>
> +
> +#include "leds-lp55xx-common.h"
> +
> +/* Registers */

This comment is superfluous.

> +#define LP5569_REG_ENABLE		0x00
> +#define   LP5569_ENABLE			BIT(6)
> +
> +#define LP5569_REG_EXEC_CTRL		0x01
> +/*
> + * Program Memory Operations
> + * Same Mask for each engine for both mode and exec
> + * ENG1	GENMASK(3, 2)
> + * ENG2	GENMASK(5, 4)
> + * ENG3	GENMASK(7, 6)
> + */
> +#define LP5569_MODE_ENG_MASK		GENMASK(1, 0)
> +#define   LP5569_MODE_ENG_SHIFT		2
> +#define   LP5569_MODE_DISABLE_ENG	FIELD_PREP_CONST(LP5569_MODE_ENG_MASK, 0x0)
> +#define   LP5569_MODE_LOAD_ENG		FIELD_PREP_CONST(LP5569_MODE_ENG_MASK, 0x1)
> +#define   LP5569_MODE_RUN_ENG		FIELD_PREP_CONST(LP5569_MODE_ENG_MASK, 0x2)
> +#define   LP5569_MODE_HALT_ENG		FIELD_PREP_CONST(LP5569_MODE_ENG_MASK, 0x3)
> +
> +#define   LP5569_MODE_ENGn_SHIFT(n)	(LP5569_MODE_ENG_SHIFT + (2 * (3 - (n))))
> +#define   LP5569_MODE_ENGn_MASK(n)	(LP5569_MODE_ENG_MASK << LP5569_MODE_ENGn_SHIFT(n))
> +#define   LP5569_MODE_ENGn_GET(n, mode)	\
> +	(((mode) >> LP5569_MODE_ENGn_SHIFT(n)) & LP5569_MODE_ENG_MASK)
> +
> +#define LP5569_REG_OP_MODE		0x02
> +#define   LP5569_EXEC_ENG_MASK		GENMASK(1, 0)
> +#define   LP5569_EXEC_ENG_SHIFT		2
> +#define   LP5569_EXEC_HOLD_ENG		FIELD_PREP_CONST(LP5569_EXEC_ENG_MASK, 0x0)
> +#define   LP5569_EXEC_STEP_ENG		FIELD_PREP_CONST(LP5569_EXEC_ENG_MASK, 0x1)
> +#define   LP5569_EXEC_RUN_ENG		FIELD_PREP_CONST(LP5569_EXEC_ENG_MASK, 0x2)
> +#define   LP5569_EXEC_ONCE_ENG		FIELD_PREP_CONST(LP5569_EXEC_ENG_MASK, 0x3)
> +
> +#define   LP5569_EXEC_ENGn_SHIFT(n)	(LP5569_EXEC_ENG_SHIFT + (2 * (3 - (n))))
> +#define   LP5569_EXEC_ENGn_MASK(n)	(LP5569_EXEC_ENG_MASK << LP5569_EXEC_ENGn_SHIFT(n))
> +
> +#define LP5569_REG_ENABLE_LEDS_MSB	0x04
> +#define LP5569_REG_ENABLE_LEDS_LSB	0x05
> +#define LP5569_REG_LED_CTRL_BASE	0x07
> +#define   LP5569_FADER_MAPPING_MASK	GENMASK(7, 5)
> +#define LP5569_REG_LED_PWM_BASE		0x16
> +#define LP5569_REG_LED_CURRENT_BASE	0x22
> +#define LP5569_REG_MISC			0x2F
> +#define   LP5569_AUTO_INC		BIT(6)
> +#define   LP5569_PWR_SAVE		BIT(5)
> +#define   LP5569_CP_MODE_MASK		GENMASK(4, 3)
> +#define   LP5569_PWM_PWR_SAVE		BIT(2)
> +#define   LP5569_INTERNAL_CLK		BIT(0)
> +#define LP5569_REG_MISC2		0x33
> +#define   LP5569_LED_SHORT_TEST		BIT(4)
> +#define   LP5569_LED_OPEN_TEST		BIT(3)
> +#define LP5569_REG_STATUS		0x3C
> +#define   LP5569_MASK_BUSY		BIT(7)
> +#define   LP5569_STARTUP_BUSY		BIT(6)
> +#define   LP5569_ENGINE_BUSY		BIT(5)
> +#define   LP5569_ENGINE1_INT		BIT(2)
> +#define   LP5569_ENGINE2_INT		BIT(1)
> +#define   LP5569_ENGINE3_INT		BIT(0)
> +#define   LP5569_ENG_STATUS_MASK	(LP5569_ENGINE1_INT | LP5569_ENGINE2_INT | \
> +					 LP5569_ENGINE3_INT)
> +#define LP5569_REG_IO_CONTROL		0x3D
> +#define   LP5569_CLK_OUTPUT		BIT(3)
> +#define LP5569_REG_RESET		0x3F
> +#define   LP5569_RESET			0xFF
> +#define LP5569_REG_MASTER_FADER_BASE	0x46
> +#define LP5569_REG_CH1_PROG_START	0x4B
> +#define LP5569_REG_CH2_PROG_START	0x4C
> +#define LP5569_REG_CH3_PROG_START	0x4D
> +#define LP5569_REG_PROG_PAGE_SEL	0x4F
> +#define LP5569_REG_PROG_MEM		0x50
> +#define LP5569_REG_LED_FAULT1		0x81
> +#define   LP5569_LED_FAULT8		BIT(0)
> +#define LP5569_REG_LED_FAULT2		0x82
> +#define   LP5569_LED_FAULT7		BIT(7)
> +#define   LP5569_LED_FAULT6		BIT(6)
> +#define   LP5569_LED_FAULT5		BIT(5)
> +#define   LP5569_LED_FAULT4		BIT(4)
> +#define   LP5569_LED_FAULT3		BIT(3)
> +#define   LP5569_LED_FAULT2		BIT(2)
> +#define   LP5569_LED_FAULT1		BIT(1)
> +#define   LP5569_LED_FAULT0		BIT(0)
> +
> +#define LP5569_MAX_LEDS			9
> +
> +#define LP5569_PROGRAM_PAGES		16
> +#define LP5569_BYTES_PER_PAGE		32	/* bytes */
> +#define LP5569_PROGRAM_LENGTH		(LP5569_BYTES_PER_PAGE * 4) /* 128 bytes (4 pages) */
> +/* Memory is used like this:
> + * 0x00 engine 1 program (4 pages)
> + * 0x40 engine 2 program (4 pages)
> + * 0x80 engine 3 program (4 pages)
> + * 0xc0 engine 1 muxing info (1 page)
> + * 0xd0 engine 2 muxing info (1 page)
> + * 0xe0 engine 3 muxing info (1 page)
> + */
> +#define LP5569_ENG1_PROG_ADDR		0x0
> +#define LP5569_ENG2_PROG_ADDR		0x40
> +#define LP5569_ENG3_PROG_ADDR		0x80
> +#define LP5569_ENG1_MUX_ADDR		0xc0
> +#define LP5569_ENG2_MUX_ADDR		0xd0
> +#define LP5569_ENG3_MUX_ADDR		0xe0
> +
> +#define LP5569_BITS_PER_ADDR		16
> +#define LP5569_PAGE_OFFSET(addr)	((addr) / LP5569_BITS_PER_ADDR)
> +
> +/* Memory Page Selection */
> +#define LP5569_PAGE_ENG_OFFSET		LP5569_PAGE_OFFSET(LP5569_ENG1_PROG_ADDR)
> +#define LP5569_PAGE_ENG(n)		((((n) - 1) * 4) + LP5569_PAGE_ENG_OFFSET)
> +#define LP5569_PAGE_MUX_OFFSET		LP5569_PAGE_OFFSET(LP5569_ENG1_MUX_ADDR)
> +#define LP5569_PAGE_MUX(n)		(((n) - 1) + LP5569_PAGE_MUX_OFFSET)
> +
> +#define LEDn_STATUS_FAULT(n, status)	((status) >> (n) & BIT(0))
> +#define LED_ACTIVE(mux, led)		(!!((mux) & (0x0001 << (led))))
> +
> +#define LP5569_DEFAULT_CONFIG \
> +	(LP5569_AUTO_INC | LP5569_PWR_SAVE | LP5569_PWM_PWR_SAVE)
> +
> +enum lp5569_chip_id {
> +	LP5569,
> +};

Do you really need this?

Surely matching only becomes useful when you have more than one?

> +static int lp5569_init_program_engine(struct lp55xx_chip *chip);

No forward declarations.  Please rearrange the functions.

> +static inline void lp5569_wait_opmode_done(void)
> +{
> +	usleep_range(1000, 2000);
> +}

Why are you abstracting this?

It's costing you 4 extra lines for no perceived benefit.

> +static void lp5569_set_led_current(struct lp55xx_led *led, u8 led_current)
> +{
> +	led->led_current = led_current;
> +	lp55xx_write(led->chip, LP5569_REG_LED_CURRENT_BASE + led->chan_nr,
> +		     led_current);

Can this fail?

> +}
> +
> +static int lp5569_post_init_device(struct lp55xx_chip *chip)
> +{
> +	int ret;
> +	int val;
> +
> +	ret = lp55xx_write(chip, LP5569_REG_ENABLE, LP5569_ENABLE);
> +	if (ret)
> +		return ret;
> +
> +	/* Chip startup time is 500 us, 1 - 2 ms gives some margin */
> +	usleep_range(1000, 2000);
> +
> +	val = LP5569_DEFAULT_CONFIG;
> +	val |= FIELD_PREP(LP5569_CP_MODE_MASK, chip->pdata->charge_pump_mode);
> +
> +	if (chip->pdata->clock_mode == LP55XX_CLOCK_INT)
> +		val |= LP5569_INTERNAL_CLK;
> +
> +	ret = lp55xx_write(chip, LP5569_REG_MISC, val);
> +	if (ret)
> +		return ret;
> +
> +	if (chip->pdata->clock_mode == LP55XX_CLOCK_INT) {

Why check for this twice?

What happens if you reverse these two calls?

> +		ret = lp55xx_update_bits(chip, LP5569_REG_IO_CONTROL,
> +					 LP5569_CLK_OUTPUT,
> +					 LP5569_CLK_OUTPUT);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return lp5569_init_program_engine(chip);
> +}
> +
> +static void lp5569_load_engine(struct lp55xx_chip *chip)
> +{
> +	enum lp55xx_engine_index idx = chip->engine_idx;
> +	u8 mask, val;
> +
> +	mask = LP5569_MODE_ENGn_MASK(idx);
> +	val = LP5569_MODE_LOAD_ENG << LP5569_MODE_ENGn_SHIFT(idx);
> +
> +	lp55xx_update_bits(chip, LP5569_REG_OP_MODE, mask, val);
> +
> +	lp5569_wait_opmode_done();
> +}
> +
> +static void lp5569_load_engine_and_select_page(struct lp55xx_chip *chip)

Not keen on this idea.

lp5569_load_mux() is not called lp5569_load_engine_and_load_mux() is it?

Just make this lp5569_select_page().

> +{
> +	enum lp55xx_engine_index idx = chip->engine_idx;
> +
> +	lp5569_load_engine(chip);
> +
> +	lp55xx_write(chip, LP5569_REG_PROG_PAGE_SEL, LP5569_PAGE_ENG(idx));
> +}
> +
> +static void lp5569_stop_all_engines(struct lp55xx_chip *chip)
> +{
> +	lp55xx_write(chip, LP5569_REG_OP_MODE, 0);
> +	lp5569_wait_opmode_done();
> +}
> +
> +static void lp5569_stop_engine(struct lp55xx_chip *chip)
> +{
> +	enum lp55xx_engine_index idx = chip->engine_idx;

How about:

	u8 mask = LP5569_MODE_ENGn_MASK(chip->engine_idx);

	lp55xx_update_bits(chip, LP5569_REG_OP_MODE, mask, 0);

> +
> +	lp55xx_update_bits(chip, LP5569_REG_OP_MODE, LP5569_MODE_ENGn_MASK(idx), 0);
> +
> +	lp5569_wait_opmode_done();
> +}
> +
> +static void lp5569_turn_off_channels(struct lp55xx_chip *chip)
> +{
> +	int i;
> +
> +	for (i = 0; i < LP5569_MAX_LEDS; i++)
> +		lp55xx_write(chip, LP5569_REG_LED_PWM_BASE + i, 0);
> +}
> +
> +static void lp5569_run_engine(struct lp55xx_chip *chip, bool start)
> +{
> +	int i, ret;
> +	u8 mode;
> +	u8 exec;
> +
> +	/* stop engine */

If the function nomenclature is good enough (I believe that it is), then
this comment will become superfluous.

Perhaps a message about why the engine is being stopped would be more
useful.

Besides, sentences start with uppercase chars, so should _all_ of your
comments.  Please ensure that's the case throughout the file.

> +	if (!start) {
> +		lp5569_stop_engine(chip);
> +		lp5569_turn_off_channels(chip);
> +		return;
> +	}
> +
> +	/*
> +	 * To run the engine,

That's a funny place to line break.

> +	 * operation mode and enable register should updated at the same time

Should be, or must be?

These calls look linear to me.  What do you mean by "at the same time"?

> +	 */
> +
> +	ret = lp55xx_read(chip, LP5569_REG_OP_MODE, &mode);
> +	if (ret)
> +		return;
> +
> +	ret = lp55xx_read(chip, LP5569_REG_EXEC_CTRL, &exec);
> +	if (ret)
> +		return;
> +
> +	/* change operation mode to RUN only when each engine is loading */

Whilst it is loading or after they are loaded?

> +	for (i = LP55XX_ENGINE_1; i <= LP55XX_ENGINE_3; i++) {
> +		if (LP5569_MODE_ENGn_GET(i, mode) != LP5569_MODE_LOAD_ENG)
> +			continue;
> +
> +		mode &= ~LP5569_MODE_ENGn_MASK(i);
> +		mode |= LP5569_MODE_RUN_ENG << LP5569_MODE_ENGn_SHIFT(i);
> +		exec &= ~LP5569_EXEC_ENGn_MASK(i);
> +		exec |= LP5569_EXEC_RUN_ENG << LP5569_EXEC_ENGn_SHIFT(i);
> +	}
> +
> +	lp55xx_write(chip, LP5569_REG_OP_MODE, mode);
> +	lp5569_wait_opmode_done();
> +

Remove this line.

> +	lp55xx_write(chip, LP5569_REG_EXEC_CTRL, exec);
> +}
> +
> +static int lp5569_init_program_engine(struct lp55xx_chip *chip)
> +{
> +	int i;
> +	int j;
> +	int ret;
> +	u8 status;
> +	/* one pattern per engine setting LED MUX start and stop addresses */
> +	static const u8 pattern[][LP5569_BYTES_PER_PAGE] =  {
> +		{ 0x9c, LP5569_ENG1_MUX_ADDR, 0x9c, 0xb0, 0x9d, 0x80, 0xd8, 0x00, 0},
> +		{ 0x9c, LP5569_ENG2_MUX_ADDR, 0x9c, 0xc0, 0x9d, 0x80, 0xd8, 0x00, 0},
> +		{ 0x9c, LP5569_ENG3_MUX_ADDR, 0x9c, 0xd0, 0x9d, 0x80, 0xd8, 0x00, 0},

What are each of these indexes?

> +	};
> +
> +	/* hardcode 32 bytes of memory for each engine from program memory */

Sorry, what's happening here?  If you need to use more lines to make it
very clear what's going on, please do so.

> +	ret = lp55xx_write(chip, LP5569_REG_CH1_PROG_START, LP5569_ENG1_PROG_ADDR);
> +	if (ret)
> +		return ret;
> +
> +	ret = lp55xx_write(chip, LP5569_REG_CH2_PROG_START, LP5569_ENG2_PROG_ADDR);
> +	if (ret)
> +		return ret;
> +
> +	ret = lp55xx_write(chip, LP5569_REG_CH3_PROG_START, LP5569_ENG3_PROG_ADDR);
> +	if (ret)
> +		return ret;
> +
> +	/* write LED MUX address space for each engine */
> +	for (i = LP55XX_ENGINE_1; i <= LP55XX_ENGINE_3; i++) {
> +		chip->engine_idx = i;
> +		lp5569_load_engine_and_select_page(chip);
> +
> +		for (j = 0; j < LP5569_BYTES_PER_PAGE; j++) {
> +			ret = lp55xx_write(chip, LP5569_REG_PROG_MEM + j,
> +					   pattern[i - 1][j]);
> +			if (ret)
> +				goto out;
> +		}
> +	}
> +
> +	lp5569_run_engine(chip, true);
> +
> +	/* Let the programs run for couple of ms and check the engine status */
> +	usleep_range(3000, 6000);
> +	lp55xx_read(chip, LP5569_REG_STATUS, &status);
> +	status = FIELD_GET(LP5569_ENG_STATUS_MASK, status);
> +
> +	if (status != LP5569_ENG_STATUS_MASK) {
> +		dev_err(&chip->cl->dev,
> +			"could not configure LED engine, status = 0x%.2x\n",
> +			status);
> +		ret = -1;

What on earth is -1?  That is not a Linux error code.

  include/uapi/asm-generic/errno-base.h

> +	}
> +
> +out:
> +	lp5569_stop_all_engines(chip);
> +	return ret;
> +}
> +
> +static int lp5569_update_program_memory(struct lp55xx_chip *chip,
> +					const u8 *data, size_t size)

Nope!  We have 4 of these already.  Please unify them all.

> +{
> +	enum lp55xx_engine_index idx = chip->engine_idx;
> +	u8 pattern[LP5569_PROGRAM_LENGTH] = {0};
> +	unsigned int cmd;
> +	char c[3];
> +	int nrchars;
> +	int ret;
> +	int offset = 0;
> +	int page, i = 0;
> +
> +	while ((offset < size - 1) && (i < LP5569_PROGRAM_LENGTH)) {
> +		/* separate sscanfs because length is working only for %s */
> +		ret = sscanf(data + offset, "%2s%n ", c, &nrchars);
> +		if (ret != 1)
> +			goto err;
> +
> +		ret = sscanf(c, "%2x", &cmd);
> +		if (ret != 1)
> +			goto err;
> +
> +		pattern[i] = (u8)cmd;
> +		offset += nrchars;
> +		i++;
> +	}
> +
> +	/* Each instruction is 16bit long. Check that length is even */
> +	if (i % 2)
> +		goto err;
> +
> +	for (page = 0; page < LP5569_PROGRAM_LENGTH / LP5569_BYTES_PER_PAGE; page++) {
> +		/* Write to the next page each 32 bytes */
> +		lp55xx_write(chip, LP5569_REG_PROG_PAGE_SEL,
> +			     LP5569_PAGE_ENG(idx) + page);
> +
> +		for (i = 0; i < LP5569_BYTES_PER_PAGE; i++) {
> +			ret = lp55xx_write(chip, LP5569_REG_PROG_MEM + i,
> +					   pattern[i + (page * LP5569_BYTES_PER_PAGE)]);
> +			if (ret)
> +				return -EINVAL;
> +		}
> +	}
> +
> +
> +	return size;
> +
> +err:
> +	dev_err(&chip->cl->dev, "wrong pattern format\n");
> +	return -EINVAL;
> +}
> +
> +static void lp5569_firmware_loaded(struct lp55xx_chip *chip)
> +{
> +	const struct firmware *fw = chip->fw;
> +
> +	/*
> +	 * the firmware is encoded in ascii hex character, with 2 chars
> +	 * per byte
> +	 */
> +	if (fw->size > (LP5569_PROGRAM_LENGTH * 2)) {
> +		dev_err(&chip->cl->dev, "firmware data size overflow: %zu\n",
> +			fw->size);
> +		return;
> +	}
> +
> +	/*
> +	 * Program memory sequence

Okay, I'm stopping here:

$ git --no-pager grep "Program memory sequence"
drivers/leds/leds-lp5521.c:	* Program memory sequence
drivers/leds/leds-lp5523.c:	* Program memory sequence
drivers/leds/leds-lp5562.c:	* Program memory sequence
drivers/leds/leds-lp8501.c:	* Program memory sequence

A lot of this driver appears to be lifted (again) from its predecessors.
I can't accept another one without a unification effort.

> +	 *  1) set engine mode to "LOAD"
> +	 *  2) write firmware data into program memory
> +	 */
> +	lp5569_load_engine_and_select_page(chip);
> +	lp5569_update_program_memory(chip, fw->data, fw->size);
> +}
> +
> +static ssize_t show_engine_mode(struct device *dev,
> +				struct device_attribute *attr,
> +				char *buf, int nr)
> +{
> +	struct lp55xx_led *led = i2c_get_clientdata(to_i2c_client(dev));
> +	struct lp55xx_chip *chip = led->chip;
> +	enum lp55xx_engine_mode mode = chip->engines[nr - 1].mode;
> +
> +	switch (mode) {
> +	case LP55XX_ENGINE_RUN:
> +		return sprintf(buf, "run\n");
> +	case LP55XX_ENGINE_LOAD:
> +		return sprintf(buf, "load\n");
> +	case LP55XX_ENGINE_DISABLED:
> +	default:
> +		return sprintf(buf, "disabled\n");
> +	}
> +}
> +show_mode(1)
> +show_mode(2)
> +show_mode(3)
> +
> +static ssize_t store_engine_mode(struct device *dev,
> +				 struct device_attribute *attr,
> +				 const char *buf, size_t len, int nr)
> +{
> +	struct lp55xx_led *led = i2c_get_clientdata(to_i2c_client(dev));
> +	struct lp55xx_chip *chip = led->chip;
> +	struct lp55xx_engine *engine = &chip->engines[nr - 1];
> +
> +	mutex_lock(&chip->lock);
> +
> +	chip->engine_idx = nr;
> +
> +	if (!strncmp(buf, "run", 3)) {
> +		lp5569_run_engine(chip, true);
> +		engine->mode = LP55XX_ENGINE_RUN;
> +	} else if (!strncmp(buf, "load", 4)) {
> +		lp5569_stop_engine(chip);
> +		lp5569_load_engine(chip);
> +		engine->mode = LP55XX_ENGINE_LOAD;
> +	} else if (!strncmp(buf, "disabled", 8)) {
> +		lp5569_stop_engine(chip);
> +		engine->mode = LP55XX_ENGINE_DISABLED;
> +	}
> +
> +	mutex_unlock(&chip->lock);
> +
> +	return len;
> +}
> +store_mode(1)
> +store_mode(2)
> +store_mode(3)
> +
> +static int lp5569_mux_parse(const char *buf, u16 *mux, size_t len)
> +{
> +	u16 tmp_mux = 0;
> +	int i;
> +
> +	len = min_t(int, len, LP5569_MAX_LEDS);
> +
> +	for (i = 0; i < len; i++) {
> +		switch (buf[i]) {
> +		case '1':
> +			tmp_mux |= (1 << i);
> +			break;
> +		case '0':
> +			break;
> +		case '\n':
> +			i = len;
> +			break;
> +		default:
> +			return -1;
> +		}
> +	}
> +	*mux = tmp_mux;
> +
> +	return 0;
> +}
> +
> +static void lp5569_mux_to_array(u16 led_mux, char *array)
> +{
> +	int i, pos = 0;
> +
> +	for (i = 0; i < LP5569_MAX_LEDS; i++)
> +		pos += sprintf(array + pos, "%x", LED_ACTIVE(led_mux, i));
> +
> +	array[pos] = '\0';
> +}
> +
> +static ssize_t show_engine_leds(struct device *dev,
> +				struct device_attribute *attr,
> +				char *buf, int nr)
> +{
> +	struct lp55xx_led *led = i2c_get_clientdata(to_i2c_client(dev));
> +	struct lp55xx_chip *chip = led->chip;
> +	char mux[LP5569_MAX_LEDS + 1];
> +
> +	lp5569_mux_to_array(chip->engines[nr - 1].led_mux, mux);
> +
> +	return sprintf(buf, "%s\n", mux);
> +}
> +show_leds(1)
> +show_leds(2)
> +show_leds(3)
> +
> +static int lp5569_load_mux(struct lp55xx_chip *chip, u16 mux, int nr)
> +{
> +	struct lp55xx_engine *engine = &chip->engines[nr - 1];
> +	int ret;
> +
> +	lp5569_load_engine(chip);
> +
> +	ret = lp55xx_write(chip, LP5569_REG_PROG_PAGE_SEL, LP5569_PAGE_MUX(nr));
> +	if (ret)
> +		return ret;
> +
> +	ret = lp55xx_write(chip, LP5569_REG_PROG_MEM, (u8)(mux >> 8));
> +	if (ret)
> +		return ret;
> +
> +	ret = lp55xx_write(chip, LP5569_REG_PROG_MEM + 1, (u8)(mux));
> +	if (ret)
> +		return ret;
> +
> +	engine->led_mux = mux;
> +	return 0;
> +}
> +
> +static ssize_t store_engine_leds(struct device *dev,
> +				 struct device_attribute *attr,
> +				 const char *buf, size_t len, int nr)
> +{
> +	struct lp55xx_led *led = i2c_get_clientdata(to_i2c_client(dev));
> +	struct lp55xx_chip *chip = led->chip;
> +	struct lp55xx_engine *engine = &chip->engines[nr - 1];
> +	u16 mux = 0;
> +	ssize_t ret;
> +
> +	if (lp5569_mux_parse(buf, &mux, len))
> +		return -EINVAL;
> +
> +	mutex_lock(&chip->lock);
> +
> +	chip->engine_idx = nr;
> +	ret = -EINVAL;
> +
> +	if (engine->mode != LP55XX_ENGINE_LOAD)
> +		goto leave;
> +
> +	if (lp5569_load_mux(chip, mux, nr))
> +		goto leave;
> +
> +	ret = len;
> +leave:
> +	mutex_unlock(&chip->lock);
> +	return ret;
> +}
> +store_leds(1)
> +store_leds(2)
> +store_leds(3)
> +
> +static ssize_t store_engine_load(struct device *dev,
> +				 struct device_attribute *attr,
> +				 const char *buf, size_t len, int nr)
> +{
> +	struct lp55xx_led *led = i2c_get_clientdata(to_i2c_client(dev));
> +	struct lp55xx_chip *chip = led->chip;
> +	int ret;
> +
> +	mutex_lock(&chip->lock);
> +
> +	chip->engine_idx = nr;
> +	lp5569_load_engine_and_select_page(chip);
> +	ret = lp5569_update_program_memory(chip, buf, len);
> +
> +	mutex_unlock(&chip->lock);
> +
> +	return ret;
> +}
> +store_load(1)
> +store_load(2)
> +store_load(3)
> +
> +static ssize_t lp5569_led_open_test(struct lp55xx_led *led, char *buf)
> +{
> +	struct lp55xx_chip *chip = led->chip;
> +	struct lp55xx_platform_data *pdata = chip->pdata;
> +	bool leds_fault[LP5569_MAX_LEDS];
> +	struct lp55xx_led *led_tmp = led;
> +	int i, ret, pos = 0;
> +	u8 status;
> +
> +	/* Set in STANDBY state */
> +	ret = lp55xx_write(chip, LP5569_REG_ENABLE, 0);
> +	if (ret)
> +		goto exit;
> +
> +	/* Wait 1ms for device to enter STANDBY state */
> +	usleep_range(1000, 2000);
> +
> +	/* Set Charge Pump to 1.5x */
> +	ret = lp55xx_update_bits(chip, LP5569_REG_MISC,
> +				 FIELD_PREP(LP5569_CP_MODE_MASK, LP55XX_CP_BOOST),
> +				 LP5569_CP_MODE_MASK);
> +	if (ret)
> +		goto exit;
> +
> +	/* Enable LED Open Test */
> +	ret = lp55xx_update_bits(chip, LP5569_REG_MISC2, LP5569_LED_OPEN_TEST,
> +				 LP5569_LED_OPEN_TEST);
> +	if (ret)
> +		goto exit;
> +
> +	/* Put Device in NORMAL state */
> +	ret = lp55xx_write(chip, LP5569_REG_ENABLE, LP5569_ENABLE);
> +	if (ret)
> +		goto exit;
> +
> +	/* Wait 500 us for device to enter NORMAL state */
> +	usleep_range(500, 750);
> +
> +	/* Enable LED and set to 100% brightness */
> +	for (i = 0; i < pdata->num_channels; i++) {
> +		ret = lp55xx_write(chip, LP5569_REG_LED_PWM_BASE + led_tmp->chan_nr,
> +				   LED_FULL);
> +		if (ret)
> +			goto exit;
> +
> +		led_tmp++;
> +	}
> +
> +	/* Wait 500 us for device to fill status regs */
> +	usleep_range(500, 750);
> +
> +	/* Parse status led fault 1 regs */
> +	ret = lp55xx_read(chip, LP5569_REG_LED_FAULT1, &status);
> +	if (ret < 0)
> +		goto exit;
> +
> +	for (i = 0; i < 8; i++)
> +		leds_fault[i] = !!((status >> i) & 0x1);
> +
> +	/* Parse status led fault 2 regs */
> +	ret = lp55xx_read(chip, LP5569_REG_LED_FAULT2, &status);
> +	if (ret < 0)
> +		goto exit;
> +
> +	for (i = 0; i < 1; i++)
> +		leds_fault[i + 8] = !!((status >> i) & 0x1);
> +
> +	/* Report LED fault */
> +	led_tmp = led;
> +	for (i = 0; i < pdata->num_channels; i++) {
> +		if (leds_fault[led_tmp->chan_nr])
> +			pos += sprintf(buf + pos, "LED %d OPEN FAIL\n",
> +				       led_tmp->chan_nr);
> +
> +		led_tmp++;
> +	}
> +
> +	ret = pos;
> +
> +exit:
> +	/* Disable LED Open Test */
> +	lp55xx_update_bits(chip, LP5569_REG_MISC2, LP5569_LED_OPEN_TEST,
> +			   0);
> +
> +	led_tmp = led;
> +	for (i = 0; i < pdata->num_channels; i++) {
> +		lp55xx_write(chip, LP5569_REG_LED_PWM_BASE + led_tmp->chan_nr,
> +			     0);
> +
> +		led_tmp++;
> +	}
> +
> +	return ret;
> +}
> +
> +static ssize_t lp5569_led_short_test(struct lp55xx_led *led, char *buf)
> +{
> +	struct lp55xx_chip *chip = led->chip;
> +	struct lp55xx_platform_data *pdata = chip->pdata;
> +	bool leds_fault[LP5569_MAX_LEDS];
> +	struct lp55xx_led *led_tmp = led;
> +	int i, ret, pos = 0;
> +	u8 status;
> +
> +	/* Set in STANDBY state */
> +	ret = lp55xx_write(chip, LP5569_REG_ENABLE, 0);
> +	if (ret)
> +		goto exit;
> +
> +	/* Wait 1ms for device to enter STANDBY state */
> +	usleep_range(1000, 2000);
> +
> +	/* Set Charge Pump to 1x */
> +	ret = lp55xx_update_bits(chip, LP5569_REG_MISC,
> +				 FIELD_PREP(LP5569_CP_MODE_MASK, LP55XX_CP_BYPASS),
> +				 LP5569_CP_MODE_MASK);
> +	if (ret)
> +		goto exit;
> +
> +	/* Enable LED and set to 100% brightness and current to 100% (25.5mA) */
> +	for (i = 0; i < pdata->num_channels; i++) {
> +		ret = lp55xx_write(chip, LP5569_REG_LED_PWM_BASE + led_tmp->chan_nr,
> +				   LED_FULL);
> +		if (ret)
> +			goto exit;
> +
> +		ret = lp55xx_write(chip, LP5569_REG_LED_CURRENT_BASE + led_tmp->chan_nr,
> +				   LED_FULL);
> +		if (ret)
> +			goto exit;
> +
> +		led_tmp++;
> +	}
> +
> +	/* Put Device in NORMAL state */
> +	ret = lp55xx_write(chip, LP5569_REG_ENABLE, LP5569_ENABLE);
> +	if (ret)
> +		goto exit;
> +
> +	/* Wait 500 us for device to enter NORMAL state */
> +	usleep_range(500, 750);
> +
> +	/* Enable LED Shorted Test */
> +	ret = lp55xx_update_bits(chip, LP5569_REG_MISC2, LP5569_LED_OPEN_TEST,
> +				 LP5569_LED_SHORT_TEST);
> +	if (ret)
> +		goto exit;
> +
> +	/* Wait 500 us for device to fill status regs */
> +	usleep_range(500, 750);
> +
> +	/* Parse status led fault 1 regs */
> +	ret = lp55xx_read(chip, LP5569_REG_LED_FAULT1, &status);
> +	if (ret < 0)
> +		goto exit;
> +
> +	for (i = 0; i < 8; i++)
> +		leds_fault[i] = !!LEDn_STATUS_FAULT(i, status);
> +
> +	/* Parse status led fault 2 regs */
> +	ret = lp55xx_read(chip, LP5569_REG_LED_FAULT2, &status);
> +	if (ret < 0)
> +		goto exit;
> +
> +	for (i = 0; i < 1; i++)
> +		leds_fault[i + 8] = !!LEDn_STATUS_FAULT(i, status);
> +
> +	/* Report LED fault */
> +	led_tmp = led;
> +	for (i = 0; i < pdata->num_channels; i++) {
> +		if (leds_fault[led_tmp->chan_nr])
> +			pos += sprintf(buf + pos, "LED %d SHORTED FAIL\n",
> +				       led_tmp->chan_nr);
> +
> +		led_tmp++;
> +	}
> +
> +	ret = pos;
> +
> +exit:
> +	/* Disable LED Shorted Test */
> +	lp55xx_update_bits(chip, LP5569_REG_MISC2, LP5569_LED_SHORT_TEST,
> +			   0);
> +
> +	led_tmp = led;
> +	for (i = 0; i < pdata->num_channels; i++) {
> +		lp55xx_write(chip, LP5569_REG_LED_PWM_BASE + led_tmp->chan_nr,
> +			     0);
> +
> +		led_tmp++;
> +	}
> +
> +	return ret;
> +}
> +
> +static ssize_t lp5569_selftest(struct device *dev,
> +			       struct device_attribute *attr,
> +			       char *buf)
> +{
> +	struct lp55xx_led *led = i2c_get_clientdata(to_i2c_client(dev));
> +	struct lp55xx_chip *chip = led->chip;
> +	int i, pos = 0;
> +
> +	mutex_lock(&chip->lock);
> +
> +	/* Test LED Open */
> +	pos = lp5569_led_open_test(led, buf);
> +	if (pos < 0)
> +		goto fail;
> +
> +	/* Test LED Shorted */
> +	pos = lp5569_led_short_test(led, buf);
> +	if (pos < 0)
> +		goto fail;
> +
> +	for (i = 0; i < chip->pdata->num_channels; i++) {
> +		/* Restore current */
> +		lp55xx_write(chip, LP5569_REG_LED_CURRENT_BASE + led->chan_nr,
> +			     led->led_current);
> +
> +		/* Restore brightness */
> +		lp55xx_write(chip, LP5569_REG_LED_PWM_BASE + led->chan_nr,
> +			     led->brightness);
> +		led++;
> +	}
> +
> +	if (pos == 0)
> +		pos = sprintf(buf, "OK\n");
> +	goto release_lock;
> +fail:
> +	pos = sprintf(buf, "FAIL\n");
> +
> +release_lock:
> +	mutex_unlock(&chip->lock);
> +
> +	return pos;
> +}
> +
> +#define show_fader(nr)						\
> +static ssize_t show_master_fader##nr(struct device *dev,	\
> +			    struct device_attribute *attr,	\
> +			    char *buf)				\
> +{								\
> +	return show_master_fader(dev, attr, buf, nr);		\
> +}
> +
> +#define store_fader(nr)						\
> +static ssize_t store_master_fader##nr(struct device *dev,	\
> +			     struct device_attribute *attr,	\
> +			     const char *buf, size_t len)	\
> +{								\
> +	return store_master_fader(dev, attr, buf, len, nr);	\
> +}
> +
> +static ssize_t show_master_fader(struct device *dev,
> +				 struct device_attribute *attr,
> +				 char *buf, int nr)
> +{
> +	struct lp55xx_led *led = i2c_get_clientdata(to_i2c_client(dev));
> +	struct lp55xx_chip *chip = led->chip;
> +	int ret;
> +	u8 val;
> +
> +	mutex_lock(&chip->lock);
> +	ret = lp55xx_read(chip, LP5569_REG_MASTER_FADER_BASE + nr - 1, &val);
> +	mutex_unlock(&chip->lock);
> +
> +	if (ret == 0)
> +		ret = sprintf(buf, "%u\n", val);
> +
> +	return ret;
> +}
> +show_fader(1)
> +show_fader(2)
> +show_fader(3)
> +
> +static ssize_t store_master_fader(struct device *dev,
> +				  struct device_attribute *attr,
> +				  const char *buf, size_t len, int nr)
> +{
> +	struct lp55xx_led *led = i2c_get_clientdata(to_i2c_client(dev));
> +	struct lp55xx_chip *chip = led->chip;
> +	int ret;
> +	unsigned long val;
> +
> +	if (kstrtoul(buf, 0, &val))
> +		return -EINVAL;
> +
> +	if (val > 0xff)
> +		return -EINVAL;
> +
> +	mutex_lock(&chip->lock);
> +	ret = lp55xx_write(chip, LP5569_REG_MASTER_FADER_BASE + nr - 1,
> +			   (u8)val);
> +	mutex_unlock(&chip->lock);
> +
> +	if (ret == 0)
> +		ret = len;
> +
> +	return ret;
> +}
> +store_fader(1)
> +store_fader(2)
> +store_fader(3)
> +
> +static ssize_t show_master_fader_leds(struct device *dev,
> +				      struct device_attribute *attr,
> +				      char *buf)
> +{
> +	struct lp55xx_led *led = i2c_get_clientdata(to_i2c_client(dev));
> +	struct lp55xx_chip *chip = led->chip;
> +	int i, ret, pos = 0;
> +	u8 val;
> +
> +	mutex_lock(&chip->lock);
> +
> +	for (i = 0; i < LP5569_MAX_LEDS; i++) {
> +		ret = lp55xx_read(chip, LP5569_REG_LED_CTRL_BASE + i, &val);
> +		if (ret)
> +			goto leave;
> +
> +		val = FIELD_PREP(LP5569_FADER_MAPPING_MASK, val);
> +		if (val > FIELD_MAX(LP5569_FADER_MAPPING_MASK)) {
> +			ret = -EINVAL;
> +			goto leave;
> +		}
> +		buf[pos++] = val + '0';
> +	}
> +	buf[pos++] = '\n';
> +	ret = pos;
> +leave:
> +	mutex_unlock(&chip->lock);
> +	return ret;
> +}
> +
> +static ssize_t store_master_fader_leds(struct device *dev,
> +				       struct device_attribute *attr,
> +				       const char *buf, size_t len)
> +{
> +	struct lp55xx_led *led = i2c_get_clientdata(to_i2c_client(dev));
> +	struct lp55xx_chip *chip = led->chip;
> +	int i, n, ret;
> +	u8 val;
> +
> +	n = min_t(int, len, LP5569_MAX_LEDS);
> +
> +	mutex_lock(&chip->lock);
> +
> +	for (i = 0; i < n; i++) {
> +		if (buf[i] >= '0' && buf[i] <= '7') {
> +			val = FIELD_PREP(LP5569_FADER_MAPPING_MASK, buf[i] - '0');
> +			ret = lp55xx_update_bits(chip,
> +						 LP5569_REG_LED_CTRL_BASE + i,
> +						 LP5569_FADER_MAPPING_MASK,
> +						 val);
> +			if (ret)
> +				goto leave;
> +		} else {
> +			ret = -EINVAL;
> +			goto leave;
> +		}
> +	}
> +	ret = len;
> +leave:
> +	mutex_unlock(&chip->lock);
> +	return ret;
> +}
> +
> +static int lp5569_multicolor_brightness(struct lp55xx_led *led)
> +{
> +	struct lp55xx_chip *chip = led->chip;
> +	int ret;
> +	int i;
> +
> +	mutex_lock(&chip->lock);
> +	for (i = 0; i < led->mc_cdev.num_colors; i++) {
> +		ret = lp55xx_write(chip,
> +				   LP5569_REG_LED_PWM_BASE +
> +				   led->mc_cdev.subled_info[i].channel,
> +				   led->mc_cdev.subled_info[i].brightness);
> +		if (ret)
> +			break;
> +	}
> +	mutex_unlock(&chip->lock);
> +	return ret;
> +}
> +
> +static int lp5569_led_brightness(struct lp55xx_led *led)
> +{
> +	struct lp55xx_chip *chip = led->chip;
> +	int ret;
> +
> +	mutex_lock(&chip->lock);
> +	ret = lp55xx_write(chip, LP5569_REG_LED_PWM_BASE + led->chan_nr,
> +			   led->brightness);
> +	mutex_unlock(&chip->lock);
> +	return ret;
> +}
> +
> +static LP55XX_DEV_ATTR_RW(engine1_mode, show_engine1_mode, store_engine1_mode);
> +static LP55XX_DEV_ATTR_RW(engine2_mode, show_engine2_mode, store_engine2_mode);
> +static LP55XX_DEV_ATTR_RW(engine3_mode, show_engine3_mode, store_engine3_mode);
> +static LP55XX_DEV_ATTR_RW(engine1_leds, show_engine1_leds, store_engine1_leds);
> +static LP55XX_DEV_ATTR_RW(engine2_leds, show_engine2_leds, store_engine2_leds);
> +static LP55XX_DEV_ATTR_RW(engine3_leds, show_engine3_leds, store_engine3_leds);
> +static LP55XX_DEV_ATTR_WO(engine1_load, store_engine1_load);
> +static LP55XX_DEV_ATTR_WO(engine2_load, store_engine2_load);
> +static LP55XX_DEV_ATTR_WO(engine3_load, store_engine3_load);
> +static LP55XX_DEV_ATTR_RO(selftest, lp5569_selftest);
> +static LP55XX_DEV_ATTR_RW(master_fader1, show_master_fader1,
> +			  store_master_fader1);
> +static LP55XX_DEV_ATTR_RW(master_fader2, show_master_fader2,
> +			  store_master_fader2);
> +static LP55XX_DEV_ATTR_RW(master_fader3, show_master_fader3,
> +			  store_master_fader3);
> +static LP55XX_DEV_ATTR_RW(master_fader_leds, show_master_fader_leds,
> +			  store_master_fader_leds);
> +
> +static struct attribute *lp5569_attributes[] = {
> +	&dev_attr_engine1_mode.attr,
> +	&dev_attr_engine2_mode.attr,
> +	&dev_attr_engine3_mode.attr,
> +	&dev_attr_engine1_load.attr,
> +	&dev_attr_engine2_load.attr,
> +	&dev_attr_engine3_load.attr,
> +	&dev_attr_engine1_leds.attr,
> +	&dev_attr_engine2_leds.attr,
> +	&dev_attr_engine3_leds.attr,
> +	&dev_attr_selftest.attr,
> +	&dev_attr_master_fader1.attr,
> +	&dev_attr_master_fader2.attr,
> +	&dev_attr_master_fader3.attr,
> +	&dev_attr_master_fader_leds.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group lp5569_group = {
> +	.attrs = lp5569_attributes,
> +};
> +
> +/* Chip specific configurations */
> +static struct lp55xx_device_config lp5569_cfg = {
> +	.reset = {
> +		.addr = LP5569_REG_RESET,
> +		.val  = LP5569_RESET,
> +	},
> +	.enable = {
> +		.addr = LP5569_REG_ENABLE,
> +		.val  = LP5569_ENABLE,
> +	},
> +	.max_channel  = LP5569_MAX_LEDS,
> +	.post_init_device   = lp5569_post_init_device,
> +	.brightness_fn      = lp5569_led_brightness,
> +	.multicolor_brightness_fn = lp5569_multicolor_brightness,
> +	.set_led_current    = lp5569_set_led_current,
> +	.firmware_cb        = lp5569_firmware_loaded,
> +	.run_engine         = lp5569_run_engine,
> +	.dev_attr_group     = &lp5569_group,
> +};
> +
> +static int lp5569_probe(struct i2c_client *client)
> +{
> +	struct lp55xx_platform_data *pdata = dev_get_platdata(&client->dev);
> +	const struct i2c_device_id *id = i2c_client_get_device_id(client);
> +	struct device_node *np = dev_of_node(&client->dev);
> +	struct lp55xx_chip *chip;
> +	struct lp55xx_led *led;
> +	int ret;
> +
> +	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
> +	if (!chip)
> +		return -ENOMEM;
> +
> +	chip->cfg = &lp5569_cfg;
> +
> +	if (!pdata) {

Where else are you planning on pulling platform data from?

> +		if (np) {
> +			pdata = lp55xx_of_populate_pdata(&client->dev, np,
> +							 chip);
> +			if (IS_ERR(pdata))
> +				return PTR_ERR(pdata);
> +		} else {
> +			dev_err(&client->dev, "no platform data\n");
> +			return -EINVAL;
> +		}
> +	}
> +
> +	led = devm_kcalloc(&client->dev,
> +			   pdata->num_channels, sizeof(*led), GFP_KERNEL);
> +	if (!led)
> +		return -ENOMEM;
> +
> +	chip->cl = client;
> +	chip->pdata = pdata;
> +
> +	mutex_init(&chip->lock);
> +
> +	i2c_set_clientdata(client, led);
> +
> +	ret = lp55xx_init_device(chip);
> +	if (ret)
> +		goto err_init;
> +
> +	dev_info(&client->dev, "%s Programmable led chip found\n", id->name);
> +
> +	ret = lp55xx_register_leds(led, chip);
> +	if (ret)
> +		goto err_out;
> +
> +	ret = lp55xx_register_sysfs(chip);
> +	if (ret) {
> +		dev_err(&client->dev, "registering sysfs failed\n");
> +		goto err_out;
> +	}
> +
> +	return 0;
> +
> +err_out:
> +	lp55xx_deinit_device(chip);
> +err_init:
> +	return ret;
> +}
> +
> +static void lp5569_remove(struct i2c_client *client)
> +{
> +	struct lp55xx_led *led = i2c_get_clientdata(client);
> +	struct lp55xx_chip *chip = led->chip;
> +
> +	lp5569_stop_all_engines(chip);
> +	lp55xx_unregister_sysfs(chip);
> +	lp55xx_deinit_device(chip);
> +}
> +
> +static const struct i2c_device_id lp5569_id[] = {
> +	{ "lp5569",  LP5569 },
> +	{ }
> +};
> +
> +MODULE_DEVICE_TABLE(i2c, lp5569_id);
> +
> +static const struct of_device_id of_lp5569_leds_match[] = {
> +	{ .compatible = "ti,lp5569", },
> +	{},
> +};
> +
> +MODULE_DEVICE_TABLE(of, of_lp5569_leds_match);
> +
> +static struct i2c_driver lp5569_driver = {
> +	.driver = {
> +		.name	= "lp5569x",
> +		.of_match_table = of_lp5569_leds_match,
> +	},
> +	.probe		= lp5569_probe,
> +	.remove		= lp5569_remove,
> +	.id_table	= lp5569_id,
> +};
> +
> +module_i2c_driver(lp5569_driver);
> +
> +MODULE_AUTHOR("Mathias Nyman <mathias.nyman@nokia.com>");
> +MODULE_AUTHOR("Milo Kim <milo.kim@ti.com>");
> +MODULE_AUTHOR("Christian Marangi <ansuelsmth@gmail.com>");
> +MODULE_DESCRIPTION("LP5569 LED engine");
> +MODULE_LICENSE("GPL");
> -- 
> 2.43.0
> 
> 

-- 
Lee Jones [李琼斯]

