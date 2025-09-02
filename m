Return-Path: <linux-leds+bounces-5364-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E4FB40030
	for <lists+linux-leds@lfdr.de>; Tue,  2 Sep 2025 14:22:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B757A4E59B9
	for <lists+linux-leds@lfdr.de>; Tue,  2 Sep 2025 12:16:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A4AD2F9C53;
	Tue,  2 Sep 2025 12:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tfoxuWMI"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8A72F999F;
	Tue,  2 Sep 2025 12:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756815096; cv=none; b=O61gScGkVN3g7/TOwDVwprT08eZTddFL0bjIzWmkV+4ES25m4j+nSB4967eGxlC6KBRPJPLR4AR3akBEenFhbJO806opfg52unySDS7m2Ka4Q9uVrjHnQVWhQuaALRoMLgrGBJs6InX0Xqa546dNHCaDSw/QhwOtX7VDB6mWOvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756815096; c=relaxed/simple;
	bh=VYOX3TVwu2aQXNaJ1IWUZuDWAMGRimYYSnEF6bUBxzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sx4F0oe6RMgSpJFd7D5uQ8xs0nAs2n6j/e9BCKGnh5g5DqZsq8hpQeKHlr+eMcOO1YfbQLsUkuhJpdLWs+0xlyOes/C1t5Y9Nayoeh/IICdCbOeqPrfEr/EUQYrO/B+kf5/XyX4zdIfDg27eXOvJibLMtjw7EK/K285sXCWdV0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tfoxuWMI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C84FC4CEED;
	Tue,  2 Sep 2025 12:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756815095;
	bh=VYOX3TVwu2aQXNaJ1IWUZuDWAMGRimYYSnEF6bUBxzI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tfoxuWMIPd4UNzc/yxQqis3aUWDmrplaLHu9HZsuO5VgppUUWU2QePPO2IkYsSh7M
	 FZnf5P1Dxcrn2ETcZ8DJVpqmKA3++717JJP1NhKWifNLaLkSZ361PF5jEVZUNmGZF0
	 9zWSmxyS3+EtZ3HpVZ5kQG3AUrF3XyJHIOmmfBpOhcR7itLc43gd3Z5uiQKPvRy+Bh
	 01kR4OobvUFdNpCoZ0vyhPF08SSJI1yTwazy++7LmhuDBEALJPdq2NNAmy2BZFVXzs
	 8TT4MAFJTuEVddnwXv0siAVIGgILg6Yiy+nOMKlnIoE41Tmrlj0flDvcGZEk4JlTV8
	 XqE11LoiZueAg==
Date: Tue, 2 Sep 2025 13:11:30 +0100
From: Lee Jones <lee@kernel.org>
To: Nam Tran <trannamatk@gmail.com>
Cc: pavel@kernel.org, rdunlap@infradead.org, christophe.jaillet@wanadoo.fr,
	krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v13 RESEND 2/4] leds: add basic support for TI/National
 Semiconductor LP5812 LED Driver
Message-ID: <20250902121130.GK2163762@google.com>
References: <20250818012654.143058-1-trannamatk@gmail.com>
 <20250818012654.143058-3-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250818012654.143058-3-trannamatk@gmail.com>

On Mon, 18 Aug 2025, Nam Tran wrote:

> The LP5812 is a 4x3 matrix RGB LED driver with an autonomous animation
> engine and time-cross-multiplexing (TCM) support for up to 12 LEDs or
> 4 RGB LEDs. Each LED can be configured through the related registers
> to realize vivid and fancy lighting effects.
> 
> This patch adds minimal driver support for the LP5812, implementing
> only the essential functionality: I2C communication with the device,
> LED registration, brightness control in manual mode, and basic sysfs
> interfaces for LED configuration and fault monitoring.
> 
> Signed-off-by: Nam Tran <trannamatk@gmail.com>
> ---
>  MAINTAINERS                    |    4 +
>  drivers/leds/rgb/Kconfig       |   13 +
>  drivers/leds/rgb/Makefile      |    1 +
>  drivers/leds/rgb/leds-lp5812.c | 1086 ++++++++++++++++++++++++++++++++
>  drivers/leds/rgb/leds-lp5812.h |  164 +++++
>  5 files changed, 1268 insertions(+)
>  create mode 100644 drivers/leds/rgb/leds-lp5812.c
>  create mode 100644 drivers/leds/rgb/leds-lp5812.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 99512777b890..c2e1c02e206d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -24828,6 +24828,10 @@ M:	Nam Tran <trannamatk@gmail.com>
>  L:	linux-leds@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/leds/ti,lp5812.yaml
> +F:	drivers/leds/rgb/Kconfig
> +F:	drivers/leds/rgb/Makefile
> +F:	drivers/leds/rgb/leds-lp5812.c
> +F:	drivers/leds/rgb/leds-lp5812.h
>  
>  TEXAS INSTRUMENTS' LB8864 LED BACKLIGHT DRIVER
>  M:	Alexander Sverdlin <alexander.sverdlin@siemens.com>
> diff --git a/drivers/leds/rgb/Kconfig b/drivers/leds/rgb/Kconfig
> index 222d943d826a..28ef4c487367 100644
> --- a/drivers/leds/rgb/Kconfig
> +++ b/drivers/leds/rgb/Kconfig
> @@ -26,6 +26,19 @@ config LEDS_KTD202X
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called leds-ktd202x.
>  
> +config LEDS_LP5812
> +	tristate "LED support for Texas Instruments LP5812"
> +	depends on I2C
> +	help
> +	  If you say Y here you get support for TI LP5812 LED driver.
> +	  The LP5812 is a 4x3 matrix RGB LED driver with autonomous
> +	  animation engine control.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called leds-lp5812.
> +
> +	  If unsure, say N.
> +
>  config LEDS_NCP5623
>  	tristate "LED support for NCP5623"
>  	depends on I2C
> diff --git a/drivers/leds/rgb/Makefile b/drivers/leds/rgb/Makefile
> index a501fd27f179..be45991f63f5 100644
> --- a/drivers/leds/rgb/Makefile
> +++ b/drivers/leds/rgb/Makefile
> @@ -2,6 +2,7 @@
>  
>  obj-$(CONFIG_LEDS_GROUP_MULTICOLOR)	+= leds-group-multicolor.o
>  obj-$(CONFIG_LEDS_KTD202X)		+= leds-ktd202x.o
> +obj-$(CONFIG_LEDS_LP5812)		+= leds-lp5812.o
>  obj-$(CONFIG_LEDS_NCP5623)		+= leds-ncp5623.o
>  obj-$(CONFIG_LEDS_PWM_MULTICOLOR)	+= leds-pwm-multicolor.o
>  obj-$(CONFIG_LEDS_QCOM_LPG)		+= leds-qcom-lpg.o
> diff --git a/drivers/leds/rgb/leds-lp5812.c b/drivers/leds/rgb/leds-lp5812.c
> new file mode 100644
> index 000000000000..fb5ea449761a
> --- /dev/null
> +++ b/drivers/leds/rgb/leds-lp5812.c
> @@ -0,0 +1,1086 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * LP5812 LED driver
> + *
> + * Copyright (C) 2025 Texas Instruments
> + *
> + * Author: Jared Zhou <jared-zhou@ti.com>
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/led-class-multicolor.h>
> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/sysfs.h>
> +#include <linux/types.h>
> +
> +#include "leds-lp5812.h"
> +
> +static int lp5812_write(struct lp5812_chip *chip, u16 reg, u8 val)
> +{
> +	struct device *dev = &chip->client->dev;
> +	struct i2c_msg msg;
> +	u8 buf[2];
> +	u8 extracted_bits;

What bits are being extracted?

addr_low?

> +	int ret;
> +
> +	/* Extract register address bits 9 and 8 for Address Byte 1 */
> +	extracted_bits = (reg >> 8) & 0x03;

Define all magic numbers throughout.  This includes MASKs and SHIFTs.

> +	/* Prepare payload: Address Byte 2 (bits [7:0]) and value to write */
> +	buf[0] = (u8)(reg & 0xFF);
> +	buf[1] = val;
> +
> +	/* Construct I2C message for a write operation */
> +	msg.addr = (chip->client->addr << 2) | extracted_bits;
> +	msg.flags = 0;
> +	msg.len = sizeof(buf);
> +	msg.buf = buf;
> +
> +	ret = i2c_transfer(chip->client->adapter, &msg, 1);

	if (ret == 1)
		return 0;

	dev_err(dev, "I2C write error, ret=%d\n", ret);
	return ret < 0 ? ret : -EIO;


> +	if (ret != 1) {
> +		dev_err(dev, "I2C write error, ret=%d\n", ret);
> +		ret = ret < 0 ? ret : -EIO;
> +	} else {
> +		ret = 0;
> +	}
> +
> +	return ret;
> +}
> +
> +static int lp5812_read(struct lp5812_chip *chip, u16 reg, u8 *val)
> +{
> +	struct device *dev = &chip->client->dev;
> +	struct i2c_msg msgs[2];
> +	u8 ret_val;
> +	u8 extracted_bits;
> +	u8 converted_reg;
> +	int ret;
> +
> +	/* Extract register address bits 9 and 8 for Address Byte 1 */
> +	extracted_bits = (reg >> 8) & 0x03;
> +
> +	/* Lower 8 bits go in Address Byte 2 */
> +	converted_reg = (u8)(reg & 0xFF);
> +
> +	/* Prepare I2C write message to set register address */
> +	msgs[0].addr = (chip->client->addr << 2) | extracted_bits;
> +	msgs[0].flags = 0;
> +	msgs[0].len = 1;
> +	msgs[0].buf = &converted_reg;
> +
> +	/* Prepare I2C read message to retrieve register value */
> +	msgs[1].addr = (chip->client->addr << 2) | extracted_bits;
> +	msgs[1].flags = I2C_M_RD;
> +	msgs[1].len = 1;
> +	msgs[1].buf = &ret_val;
> +
> +	ret = i2c_transfer(chip->client->adapter, msgs, 2);

As above.

> +	if (ret != 2) {
> +		dev_err(dev, "I2C read error, ret=%d\n", ret);
> +		*val = 0;
> +		ret = ret < 0 ? ret : -EIO;
> +	} else {
> +		/* Store the value retrieved from the hardware */
> +		*val = ret_val;
> +		ret = 0;
> +	}
> +
> +	return ret;
> +}
> +
> +static int lp5812_read_tsd_config_status(struct lp5812_chip *chip, u8 *reg_val)
> +{
> +	return lp5812_read(chip, chip->cfg->reg_tsd_config_status.addr, reg_val);
> +}
> +
> +static int lp5812_update_regs_config(struct lp5812_chip *chip)
> +{
> +	u8 reg_val;
> +	int ret;
> +
> +	ret = lp5812_write(chip, chip->cfg->reg_cmd_update.addr, LP5812_UPDATE_CMD_VAL);
> +	if (ret)
> +		return ret;
> +
> +	ret = lp5812_read_tsd_config_status(chip, &reg_val); /* Save register value */

Save register value where?

> +	if (ret)
> +		return ret;
> +
> +	return reg_val & 0x01;

What bit is this?  Please define it properly.

> +}
> +
> +static int lp5812_fault_clear(struct lp5812_chip *chip, u8 value)
> +{
> +
> +	if (value == 0)

What do these values mean?  Define?

A switch() would be better.

> +		reg_val = LOD_CLEAR_VAL;
> +	else if (value == 1)
> +		reg_val = LSD_CLEAR_VAL;
> +	else if (value == 2)
> +		reg_val = TSD_CLEAR_VAL;
> +	else if (value == 3)
> +		reg_val = FAULT_CLEAR_ALL;
> +	else
> +		return -EINVAL;
> +
> +	return lp5812_write(chip, chip->cfg->reg_reset.addr, reg_val);
> +}
> +
> +static void set_mix_sel_led(struct lp5812_chip *chip, int mix_sel_led)

What is a "mix_sel_led"?

If forthcoming nomenclature can't be incorporated use comments.

> +{
> +	if (mix_sel_led == 0)
> +		chip->u_drive_mode.s_drive_mode.mix_sel_led_0 = 1;

What are you doing here?

Why not something like:

  chip->u_drive_mode.s_drive_mode.mix_sel_led[mix_sel_led] = true;

Or if there is only one:

  chip->u_drive_mode.s_drive_mode.mix_sel_led = mix_sel_led;

> +	if (mix_sel_led == 1)
> +		chip->u_drive_mode.s_drive_mode.mix_sel_led_1 = 1;
> +
> +	if (mix_sel_led == 2)
> +		chip->u_drive_mode.s_drive_mode.mix_sel_led_2 = 1;
> +
> +	if (mix_sel_led == 3)
> +		chip->u_drive_mode.s_drive_mode.mix_sel_led_3 = 1;
> +}
> +
> +static ssize_t parse_drive_mode(struct lp5812_chip *chip, char *str)
> +{
> +	char *sub_str;
> +	int tcm_scan_num, mix_scan_num, mix_sel_led, scan_oder[4], i, ret;
> +
> +	chip->u_drive_mode.s_drive_mode.mix_sel_led_0 = 0;
> +	chip->u_drive_mode.s_drive_mode.mix_sel_led_1 = 0;
> +	chip->u_drive_mode.s_drive_mode.mix_sel_led_2 = 0;
> +	chip->u_drive_mode.s_drive_mode.mix_sel_led_3 = 0;
> +
> +	sub_str = strsep(&str, ":");

This is totally unacceptable, sorry.

One value per sysfs file.

No parsing of weird and wonderful concats of data is allowed.

I'll end the review here.

-- 
Lee Jones [李琼斯]

