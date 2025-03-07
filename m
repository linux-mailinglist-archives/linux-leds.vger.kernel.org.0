Return-Path: <linux-leds+bounces-4192-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C39F6A562FC
	for <lists+linux-leds@lfdr.de>; Fri,  7 Mar 2025 09:52:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B44F83A8433
	for <lists+linux-leds@lfdr.de>; Fri,  7 Mar 2025 08:52:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30AC21DE2A9;
	Fri,  7 Mar 2025 08:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TNgQWCfW"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA951AF4C1;
	Fri,  7 Mar 2025 08:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741337546; cv=none; b=TExKIUtMrJxsJAwRiSAIVPgROD+s8icIpBKi7YZniO6uizZNplylrSs+5apcDxl/t0zoYRf13+VcrbAY/bFt005esoBaSbNoyU3piPWpxd0qnnTLUqbde2GM67eSYFyKlKkK9QDRxZIkKiw0HC0lnJ4E5AwTMdoN9FKsEnOpZfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741337546; c=relaxed/simple;
	bh=ploUAZSPSSyjAM1gYKQeu7GCjhtIVOOZ3NMP7t6wIjk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kGqKG4rveQX7F2+S4/TlT/A9ONBymWCcW44x0YTkipjdob1A5lwght4LzuewMleBImIDC5KHgi9ZbBqExWiXzBrbmSl+WHscAgMPLi8K4/u7fhnnAW/J+8S3KyUpX5AdgWsZTvMZyMAdF+oqZtBr8o2VLhV0hgkuK7aPQ4I5jrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TNgQWCfW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE7CBC4CEE2;
	Fri,  7 Mar 2025 08:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741337545;
	bh=ploUAZSPSSyjAM1gYKQeu7GCjhtIVOOZ3NMP7t6wIjk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TNgQWCfWBt/J3b0yRwQHNNYzfgERQHDWMYHe0Up8ZSQMK1zxwDzgtUtbVwZmEDjRj
	 JDza4Doq/i7Hx6VXy5dlLk9aVGdkErpeOIIIoKK+HIszaGinAWOHxorZqjrmpZNZFY
	 7wEcpH9sNP0BzqKXrcJAkE+nDt/1HSNY0AD+kNumT2uB2Z8btCpC+ickBmwaRmVjZV
	 vOJy70fyrl0mUvKIg2VCF2GVsyysflxVeIyl8iLcXlJzlPaFAC0FfLDhjm9qeDDZ55
	 SSaJaaijMCoczkBlkwTCD7a9xwDbCoATo8QGm3quhHK4R3UDz+ZG34ifLh2TG83yz6
	 DYtIOdFGHZcCQ==
Date: Fri, 7 Mar 2025 09:52:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nam Tran <trannamatk@gmail.com>
Cc: pavel@kernel.org, lee@kernel.org, krzk+dt@kernel.org, robh@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] leds: add new LED driver for TI LP5812
Message-ID: <20250307-classic-nostalgic-ibex-f03c32@krzk-bin>
References: <20250306172126.24667-1-trannamatk@gmail.com>
 <20250306172126.24667-4-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250306172126.24667-4-trannamatk@gmail.com>

On Fri, Mar 07, 2025 at 12:21:26AM +0700, Nam Tran wrote:
> The chip can drive LED matrix 4x3.
> This driver enables LED control via I2C.

You still did not respond to comments from v1. I don't see it being
addressed.


> 
> The driver is implemented in two parts:
> - Core driver logic in leds-lp5812.c
> - Common support functions in leds-lp5812-common.c

Why do you make two modules? This looks really unneccessary. Just
compile them into one module.


> 
> Signed-off-by: Nam Tran <trannamatk@gmail.com>
> ---
>  MAINTAINERS                       |    6 +
>  drivers/leds/Kconfig              |   29 +
>  drivers/leds/Makefile             |    2 +
>  drivers/leds/leds-lp5812-common.c | 1023 ++++++++++++++
>  drivers/leds/leds-lp5812-common.h |  323 +++++
>  drivers/leds/leds-lp5812-regs.h   |   96 ++
>  drivers/leds/leds-lp5812.c        | 2190 +++++++++++++++++++++++++++++
>  7 files changed, 3669 insertions(+)
>  create mode 100644 drivers/leds/leds-lp5812-common.c
>  create mode 100644 drivers/leds/leds-lp5812-common.h
>  create mode 100644 drivers/leds/leds-lp5812-regs.h
>  create mode 100644 drivers/leds/leds-lp5812.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2bd9f5132cab..773c7ad6a7b6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23511,6 +23511,12 @@ M:	Nam Tran <trannamatk@gmail.com>
>  L:	linux-leds@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/leds/ti,lp5812.yaml
> +F:	drivers/leds/Kconfig
> +F:	drivers/leds/Makefile
> +F:	drivers/leds/leds-lp5812-common.c
> +F:	drivers/leds/leds-lp5812-common.h
> +F:	drivers/leds/leds-lp5812-regs.h
> +F:	drivers/leds/leds-lp5812.c
>  
>  TEXAS INSTRUMENTS' SYSTEM CONTROL INTERFACE (TISCI) PROTOCOL DRIVER
>  M:	Nishanth Menon <nm@ti.com>
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 2b27d043921c..7af5ebf190a9 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -483,6 +483,35 @@ config LEDS_LP5569
>  	  Driver provides direct control via LED class and interface for
>  	  programming the engines.
>  
> +config LEDS_LP5812
> +	tristate "Enable LP5812 support LED matrix 4x3"
> +	depends on LEDS_CLASS && I2C
> +	depends on LEDS_CLASS_MULTICOLOR
> +	help
> +	  If you say Y here you get support for TI LP5812 LED driver.
> +
> +	  The LP5812 is an I2C-based RGB LED driver that supports a 4x3 LED matrix.
> +	  It provides independent brightness control and color mixing for each LED.
> +	  This driver integrates with the Linux LED framework and LED multicolor class.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called leds-lp5812.
> +
> +	  If unsure, say N.
> +
> +config LEDS_LP5812_COMMON
> +	tristate "Common driver for TI LP5812"
> +	depends on LEDS_CLASS
> +	depends on LEDS_CLASS_MULTICOLOR
> +	depends on I2C
> +	help
> +	  If you say Y here you get support common operation for TI LP5812 LED driver.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called leds-lp5812-common.
> +
> +	  If unsure, say N.
> +
>  config LEDS_LP8501
>  	tristate "LED Support for TI LP8501 LED driver chip"
>  	depends on LEDS_CLASS && I2C
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index 6ad52e219ec6..d3daae2d808c 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -54,6 +54,8 @@ obj-$(CONFIG_LEDS_LP5523)		+= leds-lp5523.o
>  obj-$(CONFIG_LEDS_LP5562)		+= leds-lp5562.o
>  obj-$(CONFIG_LEDS_LP5569)		+= leds-lp5569.o
>  obj-$(CONFIG_LEDS_LP55XX_COMMON)	+= leds-lp55xx-common.o
> +obj-$(CONFIG_LEDS_LP5812) 		+= leds-lp5812.o
> +obj-$(CONFIG_LEDS_LP5812_COMMON)	+= leds-lp5812-common.o
>  obj-$(CONFIG_LEDS_LP8501)		+= leds-lp8501.o
>  obj-$(CONFIG_LEDS_LP8788)		+= leds-lp8788.o
>  obj-$(CONFIG_LEDS_LP8860)		+= leds-lp8860.o
> diff --git a/drivers/leds/leds-lp5812-common.c b/drivers/leds/leds-lp5812-common.c
> new file mode 100644
> index 000000000000..01157233507f
> --- /dev/null
> +++ b/drivers/leds/leds-lp5812-common.c
> @@ -0,0 +1,1023 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * LP5812 Common Driver
> + *
> + * Copyright (C) 2025 Texas Instruments
> + *
> + * Author: Jared Zhou <jared-zhou@ti.com>
> + */
> +
> +#include "leds-lp5812-common.h"
> +
> +/*
> + * Function: lp5812_write
> + * Params:
> + * Return: 0 if success

No, use proper kerneldoc

> + */
> +int lp5812_write(struct lp5812_chip *chip, u16 reg, u8 val)
> +{
> +	int ret;
> +	u8 extracted_bits; /* save 9th and 8th bit of reg address */
> +	struct i2c_msg msg;
> +	u8 buf[2] = {(u8)(reg & 0xFF), val};
> +
> +	extracted_bits = (reg >> 8) & 0x03;
> +	msg.addr = (chip->i2c_cl->addr << 2) | extracted_bits;
> +	msg.flags = 0;
> +	msg.len = sizeof(buf);
> +	msg.buf = buf;
> +
> +	ret = i2c_transfer(chip->i2c_cl->adapter, &msg, 1);
> +	if (ret != 1) {
> +		dev_err(chip->dev, "i2c write error, register 0x%02X, ret=%d\n", reg, ret);
> +		ret = ret < 0 ? ret : -EIO;
> +	} else {
> +		ret = 0;
> +	}
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(lp5812_write);
> +

Missing kerneldoc. Every exported symbol must have kerneldoc.

> +int lp5812_read(struct lp5812_chip *chip, u16 reg, u8 *val)
> +{
> +	int ret;
> +	u8 ret_val;  /* lp5812_chip return value */
> +	u8 extracted_bits; /* save 9th and 8th bit of reg address */
> +	u8 converted_reg;  /* extracted 8bit from reg */
> +	struct i2c_msg msgs[2];
> +
> +	extracted_bits = (reg >> 8) & 0x03;
> +	converted_reg = (u8)(reg & 0xFF);
> +
> +	msgs[0].addr = (chip->i2c_cl->addr << 2) | extracted_bits;
> +	msgs[0].flags = 0;
> +	msgs[0].len = 1;
> +	msgs[0].buf = &converted_reg;
> +
> +	msgs[1].addr = (chip->i2c_cl->addr << 2) | extracted_bits;
> +	msgs[1].flags = I2C_M_RD;
> +	msgs[1].len = 1;
> +	msgs[1].buf = &ret_val;
> +
> +	ret = i2c_transfer(chip->i2c_cl->adapter, msgs, 2);
> +	if (ret != 2) {
> +		dev_err(chip->dev, "Read register 0x%02X error, ret=%d\n", reg, ret);
> +		*val = 0;
> +		ret = ret < 0 ? ret : -EIO;
> +	} else {
> +		*val = ret_val;
> +		ret = 0;
> +	}
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(lp5812_read);
> +
> +int lp5812_update_bit(struct lp5812_chip *chip, u16 reg, u8 mask, u8 val)

Why this is not static?

> +{
> +	int ret;
> +	u8 tmp;
> +
> +	ret = lp5812_read(chip, reg, &tmp);
> +	if (ret)
> +		return ret;
> +
> +	tmp &= ~mask;
> +	tmp |= val & mask;
> +
> +	return lp5812_write(chip, reg, tmp);
> +}
> +
> +/*
> + * Function: lp5812_read_tsd_config_status
> + * Description: read tsd config status register
> + * Param: chip --> struct lp5812_chip itself
> + *        reg_val
> + * Return: 0 if success
> + */
> +int lp5812_read_tsd_config_status(struct lp5812_chip *chip, u8 *reg_val)

Why this is not static?

> +{
> +	int ret = 0;
> +
> +	if (!reg_val)
> +		return -1;
> +
> +	ret = lp5812_read(chip, chip->regs->tsd_config_status_reg, reg_val);
> +
> +	return ret;
> +}
> +
> +/*
> + * Function: lp5812_update_regs_config

Missing kerneldoc

> + * Description: update reg config register
> + * Param: chip --> struct lp5812_chip itself
> + * Return: 0 if success
> + */
> +int lp5812_update_regs_config(struct lp5812_chip *chip)
> +{
> +	int ret;
> +	u8 reg_val; /* save register value */
> +

...

> +static struct drive_mode_led_map chip_leds_map[] = {
> +	{
> +		"direct_mode",
> +		(const char *[]){LED0, LED1, LED2, LED3, NULL},

Drop the cast.

> +	},
> +	{
> +		"tcmscan:1:0", /* tcm 1 scan; scan order 0 out0 */
> +		(const char *[]){LED_A0, LED_A1, LED_A2, NULL},
> +	},
> +	{
> +		"tcmscan:1:1", /* tcm 1 scan; scan order 0 out1 */
> +		(const char *[]){LED_B0, LED_B1, LED_B2, NULL},
> +	},
> +	{
> +		"tcmscan:1:2", /* tcm 1 scan; scan order 0 out2 */
> +		(const char *[]){LED_C0, LED_C1, LED_C2, NULL},
> +	},
> +	{
> +		"tcmscan:1:3", /* tcm 1 scan; scan order 0 out3 */
> +		(const char *[]){LED_D0, LED_D1, LED_D2, NULL},


What is all this here?

How LED controller with so little properties have so complicated driver?


> +	},
> +	{ /* tcm 2 scan, scan order 0 out0; scan order 1 out1 */
> +		"tcmscan:2:0:1",
> +		(const char *[]){LED_A0, LED_A1, LED_A2, LED_B0, LED_B1, LED_B2,
> +		NULL},
> +	},
> +	{ /* tcm 2 scan, scan order 0 out0; scan order 1 out2 */
> +		"tcmscan:2:0:2",
> +		(const char *[]){LED_A0, LED_A1, LED_A2, LED_C0, LED_C1, LED_C2,
> +		NULL},


> +static void led_kobj_release(struct kobject *kobj)
> +{
> +	kfree(kobj);
> +}
> +
> +static void aeu_kobj_release(struct kobject *kobj)
> +{
> +	kfree(kobj);
> +}

What is all this? Why do you create your own kobjects?

> +
> +static const struct kobj_type led_ktype = {
> +	.release = led_kobj_release,
> +	.sysfs_ops = &kobj_sysfs_ops,
> +};
> +
> +static const struct kobj_type aeu_ktype = {
> +	.release = aeu_kobj_release,
> +	.sysfs_ops = &kobj_sysfs_ops,
> +};


> +static ssize_t device_reset_store(struct device *dev,
> +		struct device_attribute *attr,
> +		const char *buf, size_t len)

NAK.

Sorry, you just cannot create whatever interfaces you want. You must use
standard LED interfaces for normal LED operations. None of these sysfs
are needed for device control.

Respond to this comment that you understood it (you ignored all previous
comments).

> +{
> +	int reset;
> +	int ret;
> +	struct lp5812_chip *chip = i2c_get_clientdata(to_i2c_client(dev));
> +
> +	ret = kstrtoint(buf, 0, &reset);
> +	if (ret)
> +		return ret;
> +
> +	if (reset != 1)
> +		return -EINVAL; /* Invalid argument */
> +
> +	/* reset hardware */
> +	mutex_lock(&chip->lock);
> +	lp5812_reset(chip);
> +	msleep(1000);
> +	/* set back manual mode as default for all LEDs */
> +	lp5812_write(chip, (u16)DEV_CONFIG3, 0x00);
> +	lp5812_write(chip, (u16)DEV_CONFIG4, 0x00);
> +	lp5812_update_regs_config(chip);
> +	mutex_unlock(&chip->lock);
> +
> +	/* Update sysfs based on default mode when hardware reseted*/
> +	ret = lp5812_init_dev_config(chip, "direct_mode", 1);
> +	if (ret) {
> +		dev_err(dev, "%s: lp5812_init_dev_config failed\n",
> +			__func__);
> +		return ret;
> +	}
> +
> +	return len;
> +}

...

> +static LP5812_KOBJ_ATTR_RW(pwm1, aeu_pwm1_show, aeu_pwm1_store);
> +static LP5812_KOBJ_ATTR_RW(pwm2, aeu_pwm2_show, aeu_pwm2_store);
> +static LP5812_KOBJ_ATTR_RW(pwm3, aeu_pwm3_show, aeu_pwm3_store);
> +static LP5812_KOBJ_ATTR_RW(pwm4, aeu_pwm4_show, aeu_pwm4_store);
> +static LP5812_KOBJ_ATTR_RW(pwm5, aeu_pwm5_show, aeu_pwm5_store);
> +static LP5812_KOBJ_ATTR_RW(slope_time_t1, aeu_slope_time_t1_show,
> +		aeu_slope_time_t1_store);
> +static LP5812_KOBJ_ATTR_RW(slope_time_t2, aeu_slope_time_t2_show,
> +		aeu_slope_time_t2_store);
> +static LP5812_KOBJ_ATTR_RW(slope_time_t3, aeu_slope_time_t3_show,
> +		aeu_slope_time_t3_store);
> +static LP5812_KOBJ_ATTR_RW(slope_time_t4, aeu_slope_time_t4_show,
> +		aeu_slope_time_t4_store);
> +static LP5812_KOBJ_ATTR_RW(playback_time, aeu_playback_time_show,
> +		aeu_playback_time_store);


What is all this?

...

> +static int lp5812_probe(struct i2c_client *client)
> +{
> +	struct lp5812_chip *chip;
> +	int i;
> +	int ret;
> +	u8 val;
> +
> +	chip = devm_kzalloc(&client->dev, sizeof(struct lp5812_chip),
> +			GFP_KERNEL);
> +	if (!chip)
> +		return -ENOMEM;
> +	mutex_init(&chip->lock);
> +	chip->i2c_cl = client;
> +	chip->dev = &client->dev;
> +	chip->regs = &regs;
> +	chip->command = NONE;
> +	chip->total_leds = MAX_LEDS;
> +	chip->attr_group.name = "lp5812_chip_setup";
> +	chip->attr_group.attrs = lp5812_chip_attributes;
> +	chip->chip_leds_map = chip_leds_map;
> +	chip->u_drive_mode.drive_mode_val = 0x10;
> +	chip->u_scan_order.scan_order_val = 0x00;
> +
> +	/* initialize property for each led */
> +	for (i = 0; i < MAX_LEDS; i++) {
> +		chip->leds[i].led_name = led_name_array[i];
> +		chip->leds[i].led_number = i;
> +		chip->leds[i].anim_base_addr = anim_base_addr_array[i];
> +		chip->leds[i].enable = 0; /* LED disable as default */
> +		chip->leds[i].mode = MANUAL; /* manual mode as default */
> +		chip->leds[i].priv = chip;
> +		chip->leds[i].total_aeu = MAX_AEU;
> +		chip->leds[i].led_playback.led_playback_val = 0;
> +		chip->leds[i].start_stop_pause_time.time_val = 0;
> +		/* sysfs for this led not be created */
> +		chip->leds[i].is_sysfs_created = 0;
> +		chip->leds[i].attr_group.attrs = led_kobj_attributes;
> +		kobject_init(&chip->leds[i].kobj, &led_ktype);
> +
> +		/* init animation engine unit properties */
> +		aeu_init_properties(&chip->leds[i]);
> +
> +		/* set autonomous animation config as default for all LEDs */
> +		led_set_autonomous_animation_config(&chip->leds[i]);
> +	}
> +
> +	i2c_set_clientdata(client, chip);
> +
> +	ret = sysfs_create_group(&chip->dev->kobj, &chip->attr_group);


You need sysfs ABI documentation.

> +	if (ret) {
> +		dev_err(chip->dev, "sysfs_create_group failed\n");
> +		return ret;
> +	}

Best regards,
Krzysztof


