Return-Path: <linux-leds+bounces-2289-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C56B9384F2
	for <lists+linux-leds@lfdr.de>; Sun, 21 Jul 2024 16:09:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37A8C1F21237
	for <lists+linux-leds@lfdr.de>; Sun, 21 Jul 2024 14:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCF0F149013;
	Sun, 21 Jul 2024 14:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="O/Pblsuo"
X-Original-To: linux-leds@vger.kernel.org
Received: from msa.smtpout.orange.fr (msa-213.smtpout.orange.fr [193.252.23.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC97567D;
	Sun, 21 Jul 2024 14:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.23.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721570952; cv=none; b=eLetnbR0xG3uZpMv5wFxa+cCBTsULuB9Ygf9euU27w9axmqgmIQ2c5ILA7Cc+WJ1C+4+AUno0gw/aIF0bZ9B8jFuGyHWcioyuj5eVmkw/8NdhUgAifaR+I1iAT+OOZ4S+RCbqk+6qK9nDiyEt/XO8bQsThNvBSLBkhbSTSOUpn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721570952; c=relaxed/simple;
	bh=BDqfaSOyiuy6joT7wpmpsWg25aa56j4CHvfI+IrvQh8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=SCo4w14jvjUpLLWZXXK6tkgZO1GjV6JVjmR6dOn3ujMP1vtNqGh0/KPstTQ0I+boNI/YRBaQM7IrKqo9Xr7aOBxVlVjTnW4G2853K0Qqp9B2P46CYn6DTyqm2/tisxdXhMkUkL9uMrBAmzM4pTgAW+KiSSYGZrvgtJK4Fa2ivWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=O/Pblsuo; arc=none smtp.client-ip=193.252.23.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id VXFDsbjs06NRTVXFDsFdK1; Sun, 21 Jul 2024 16:09:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1721570940;
	bh=bRgBx6Uu5nc7QQHdse8dCH2clwJfASmCaJx+X4Qsz0s=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=O/Pblsuo/hkDYJMOI/JeGlvc455TbT3rgO7sX2DkgvIWuBl5qa1yBW2E2ZBlcSskk
	 ypzaJz6Aa7WGgOF7UMCrRFLCTROX5lWrPBtMHlZK5LwRo4nFNlzB6dn1WFiQpsnHnm
	 01umaPC3TPmhNLEsuYmQ6Y50BzMmOy65/Rt1hQqST0rjNBEVicM8QkGH3UgdcUEbOh
	 mLQSZpg32lwjON9eSn0mcWkCdrDdYzTiau/keoFaKh4Xv/uPi7jnt8oPxIPjlziPZR
	 Vr79aV6hylvhtrzzEueyfwd3V+jY4sn18V+zZmSy/+oMcfByvKTRQtCRyc/DY0mWWA
	 F8lKiksexwsEw==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Sun, 21 Jul 2024 16:09:00 +0200
X-ME-IP: 90.11.132.44
Message-ID: <3d6546fe-f75e-43f5-8779-ac6f3fae262b@wanadoo.fr>
Date: Sun, 21 Jul 2024 16:08:57 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] leds: Add LED1202 I2C driverr
To: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>,
 pavel@ucw.cz, lee@kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org
References: <ZpzkBM_ZwM8hdwgP@admins-MacBook-Air.local>
Content-Language: en-US
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <ZpzkBM_ZwM8hdwgP@admins-MacBook-Air.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 21/07/2024 à 12:33, Vicentiu Galanopulo a écrit :
> The LED1202 is a 12-channel low quiescent current LED driver.
> The output current can be adjusted separately for each channel by
> 8-bit analog (current sink input) and 12-bit digital (PWM) dimming control.
> The LED1202 implements 12 low-side current generators with independent dimming control.
> Internal volatile memory allows the user to store up to 8 different patterns, each
> pattern is a particular output configuration in terms of PWM duty-cycle (on 4096 steps).
> Analog dimming (on 256 steps) is per channel but common to all patterns.
> Each active=1 device tree LED node will have a corresponding entry in /sys/class/leds
> with the label name.
> The brightness property corresponds to the per channel analog dimming, while the
> patterns[1-8] to the PWM dimming control.
> 
> Signed-off-by: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
> ---

Hi,

...

> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index 18afbb5a23ee..e665af45e363 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -37,6 +37,7 @@ obj-$(CONFIG_LEDS_IP30)			+= leds-ip30.o
>   obj-$(CONFIG_LEDS_IPAQ_MICRO)		+= leds-ipaq-micro.o
>   obj-$(CONFIG_LEDS_IS31FL319X)		+= leds-is31fl319x.o
>   obj-$(CONFIG_LEDS_IS31FL32XX)		+= leds-is31fl32xx.o
> +obj-$(CONFIG_LEDS_ST1202)		+= leds-st1202.o

v3 has apparently s/ll1202/st1202/, so now this entry should be a few 
lines below to keep it sorted.

>   obj-$(CONFIG_LEDS_LM3530)		+= leds-lm3530.o
>   obj-$(CONFIG_LEDS_LM3532)		+= leds-lm3532.o
>   obj-$(CONFIG_LEDS_LM3533)		+= leds-lm3533.o
> diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
> new file mode 100644
> index 000000000000..2c1b3c918b2c
> --- /dev/null
> +++ b/drivers/leds/leds-st1202.c
> @@ -0,0 +1,899 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * LED driver for STMicroelectronics LED1202 chip
> + *
> + * Copyright (C) 2024 Remote-Tech Ltd. UK
> + */
> +
> +#include <linux/module.h>
> +#include <linux/string.h>
> +#include <linux/ctype.h>
> +#include <linux/leds.h>
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/slab.h>
> +#include <linux/gpio.h>
> +#include <linux/delay.h>

Nitpick: usually it is preferred to have #include alphabetically sorted.

> +
> +#define ST1202_DEVICE_ID		0x00
> +#define ST1202_DEV_ENABLE		0x01
> +#define ST1202_CHAN_ENABLE_LOW		0x02
> +#define ST1202_CHAN_ENABLE_HIGH		0x03
> +#define ST1202_CONFIG_REG		0x04
> +#define ST1202_ILED_REG0		0x09
> +#define ST1202_PATTERN_REP		0x15
> +#define ST1202_PATTERN_DUR		0x16
> +#define ST1202_PATTERN_PWM		0x1E
> +#define ST1202_CLOCK_REG		0xE0
> +
> +/* PATS: Pattern sequence feature enable */
> +#define ST1202_CONFIG_REG_PATS		BIT(7)
> +/**

Why a /** here?
Does it generate a warning when building the doc?

> + * PATSR: Pattern sequence runs (self-clear
> + * when sequence is finished)

Also, I think that the whole omment would fit on a single line.

> + */
> +#define ST1202_CONFIG_REG_PATSR		BIT(6)
> +#define ST1202_CHAN_DISABLE_ALL		0x00
> +#define ST1202_PATTERN_REP_INF_LOOP	0xFF
> +
> +#define ST1202_NAME_LENGTH		32
> +#define ST1202_CURRENT_AMPS_MAX		20
> +#define ST1202_MILLIS_PATTERN_DUR	5660
> +#define ST1202_UINT8_MAX		255
> +#define ST1202_BUF_SIZE			16
> +
> +
> +#define ST1202_LED_CHANNEL_0		0
> +#define ST1202_LED_CHANNEL_1		1
> +#define ST1202_LED_CHANNEL_2		2
> +#define ST1202_LED_CHANNEL_3		3
> +#define ST1202_LED_CHANNEL_4		4
> +#define ST1202_LED_CHANNEL_5		5
> +#define ST1202_LED_CHANNEL_6		6
> +#define ST1202_LED_CHANNEL_7		7
> +#define ST1202_LED_CHANNEL_8		8
> +#define ST1202_LED_CHANNEL_9		9
> +#define ST1202_LED_CHANNEL_10		10
> +#define ST1202_LED_CHANNEL_11		11

Maybe ST1202_MAP_ALL_PATTERNS_TO_LEDNUM could use hard-coded numbers to 
save these (mostly useless, IMHO) lines? (see next comment)

ST1202_MAP_EXT_ATTR_TO_ALL_PATTERNS_ARRAY already uses hard-coded numbers.

ST1202_LED_CHANNEL_7 could be renamed to something meaningful for its 
use in st1202_channel_activate().

> +#define ST1202_MAX_LEDS			12
> +
> +#define ST1202_PATTERN_0		0
> +#define ST1202_PATTERN_1		1
> +#define ST1202_PATTERN_2		2
> +#define ST1202_PATTERN_3		3
> +#define ST1202_PATTERN_4		4
> +#define ST1202_PATTERN_5		5
> +#define ST1202_PATTERN_6		6
> +#define ST1202_PATTERN_7		7
> +#define ST1202_PATTERNS_NR		8

These 9 #define semm to be used.

Either update ST1202_MAP_ALL_PATTERNS_TO_LEDNUM which uses hard-coded 
pattern numbers or remove these useless #define.

I think that removing it is fine enough.

> +
> +/**

Why a /** kerneldoc here?

In fact, all comments in the file seem to be kerneldoc style. I'm pretty 
sure that make kerneldoc complains about it.

> + * There are 12 leds (channels) and 8 patterns
> + * create this struct as to represent the complete
> + * 12 X 8 matrix
> + */
> +struct st1202_led_pattern_map {
> +	u8 led_num;
> +	u8 pattern;
> +};
> +
> +struct st1202_led {
> +	struct led_classdev led_cdev;
> +	struct st1202_chip *chip;
> +	int led_num;
> +	char name[ST1202_NAME_LENGTH];
> +	int is_active;

Keeping led_num close to is_active would save a few bytes.

Should is_active be a bool?

> +};
> +
> +struct st1202_chip {
> +	struct i2c_client *client;
> +	struct mutex lock;
> +	struct st1202_led leds[ST1202_MAX_LEDS];
> +};
> +
> +static struct st1202_led *cdev_to_st1202_led(struct led_classdev *cdev)
> +{
> +	return container_of(cdev, struct st1202_led, led_cdev);
> +}
> +
> +static int st1202_read_reg(struct st1202_chip *chip, int reg, uint8_t *val)
> +{
> +	int ret;
> +
> +	ret = i2c_smbus_read_byte_data(chip->client, reg);
> +

Nitpick : remove this empty line?

> +	if (ret < 0)
> +		return ret;
> +
> +	*val = (uint8_t)ret;
> +	return 0;
> +}

...

> +static int st1202_pwm_pattern_read(struct st1202_chip *chip, int led_num,
> +					int pattern, u16 *value)
> +{
> +	u8 value_l, value_h;
> +	int ret;
> +
> +	/**
> +	 *  Datasheet: Register address low = 1Eh + 2*(xh) + 18h*(yh),
> +	 *  where x is the channel number (led number) in hexadecimal (x = 00h .. 0Bh) and
> +	 *  and y is the pattern number in hexadecimal (y = 00h .. 07h)
> +	 */
> +	ret = st1202_read_reg(chip, (ST1202_PATTERN_PWM + (led_num * 2) + 0x18 * pattern),
> +				&value_l);
> +	if (ret != 0) {
> +		dev_err(&chip->client->dev, "Reading pattern PWM register [0x%x] failed, error: %d\n",
> +			(ST1202_PATTERN_PWM + (led_num * 2) + 0x18 * pattern), ret);
> +		return ret;
> +	}

Maybe having a function or a macro for computing
	ST1202_PATTERN_PWM + (led_num * 2) + 0x18 * pattern
and
	ST1202_PATTERN_PWM + 0x1 + (led_num * 2) + 0x18 * pattern

would increase readaility and avoid comment duplication.

> +
> +	/**
> +	 * Datasheet: Register address high = 1Eh + 01h + 2(xh) +18h*(yh),
> +	 * where x is the channel number in hexadecimal (x = 00h .. 0Bh)
> +	 * and y is the pattern number in hexadecimal (y = 00h .. 07h)
> +	 */
> +	ret = st1202_read_reg(chip, (ST1202_PATTERN_PWM + 0x1 + (led_num * 2) + 0x18 * pattern),
> +					&value_h);
> +	if (ret != 0) {
> +		dev_err(&chip->client->dev, "Reading pattern PWM register [0x%x] failed, error: %d\n",
> +			(ST1202_PATTERN_PWM + 0x1 + (led_num * 2) + 0x18 * pattern), ret);
> +		return ret;
> +	}
> +
> +	*value = (u16)value_h << 8 | value_l;
> +	return 0;
> +}

...

> +static ssize_t st1202_duration_pattern_show(struct device *dev,
> +					struct device_attribute *attr, char *buf)
> +{
> +	struct st1202_chip *chip;
> +	struct dev_ext_attribute *eattr;
> +	struct st1202_led_pattern_map *map;
> +
> +	u8 duration;
> +	int led_num, pattern, ret;
> +
> +	chip = dev_get_drvdata(dev->parent);
> +	eattr = container_of(attr, struct dev_ext_attribute, attr);
> +	map = (struct st1202_led_pattern_map *)eattr->var;
> +
> +	led_num = (int)map->led_num;
> +	pattern = (int)map->pattern;
> +
> +	if (led_num < 0 || led_num >= ST1202_MAX_LEDS) {

Can this happen?

> +		dev_err(dev, "Invalid led number: %d (out of range). Possible values 0..11\n",

Maybe, over-engineering things, but this hard coded 11, coud be %d and 
ST1202_MAX_LEDS - 1.

If you change it, this pattern is used in several messages.

> +			led_num);
> +		goto validity_exit;
> +	}
> +
> +	mutex_lock(&chip->lock);
> +	ret = st1202_duration_pattern_read(chip, pattern, &duration);
> +	if (ret != 0)
> +		goto exit;
> +
> +exit:
> +	mutex_unlock(&chip->lock);
> +validity_exit:
> +	return sysfs_emit(buf, "Pattern[%d][led(channel)%d]: DURATION = %d ms\n",
> +		pattern, led_num, st1202_prescalar_to_miliseconds(duration));

Maybe reorder this code to:
    - have the mutex_unlock, just after st1202_duration_pattern_read() 
and before if (ret != 0)
    - display something else in case of error? Right now we display 
potentially some garbage without saying so.

> +}
> +
> +static ssize_t st1202_duration_pattern_store(struct device *dev, struct device_attribute *attr,
> +						const char *buf, size_t count)
> +{
> +	struct st1202_chip *chip;
> +	struct dev_ext_attribute *eattr;
> +	struct st1202_led_pattern_map *map;
> +
> +	unsigned long duration;
> +	char duration_str[ST1202_BUF_SIZE];
> +	int led_num, pattern, ret;
> +
> +	chip = dev_get_drvdata(dev->parent);
> +	eattr = container_of(attr, struct dev_ext_attribute, attr);
> +	map = (struct st1202_led_pattern_map *)eattr->var;
> +
> +	led_num = (int)map->led_num;
> +	pattern = (int)map->pattern;
> +
> +	if (led_num < 0 || led_num >= ST1202_MAX_LEDS) {

Can this happen?

> +		dev_err(dev, "Invalid led number: %d (out of range). Possible values 0..11\n",
> +			led_num);
> +		return count;
> +	}
> +
> +	if (!count)
> +		return -EINVAL;
> +
> +	ret = sscanf(buf, "%s", duration_str);
> +	if (ret == 0) {
> +		dev_err(dev, "sscanf failed with error :%d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = kstrtoul(duration_str, 10, &duration);
> +	if (ret)
> +		return ret;
> +
> +	mutex_lock(&chip->lock);
> +
> +	ret = st1202_duration_pattern_write(chip, pattern, duration);
> +	if (ret != 0)
> +		goto exit;
> +
> +	ret = st1202_write_reg(chip, ST1202_CONFIG_REG,
> +				(ST1202_CONFIG_REG_PATS | ST1202_CONFIG_REG_PATSR | pattern));
> +	if (ret != 0)
> +		dev_err(dev, "Failed writing value %ld to register [0x%x], error: %d\n",
> +			(ST1202_CONFIG_REG_PATS | ST1202_CONFIG_REG_PATSR | pattern),
> +			ST1202_CONFIG_REG, ret);
> +
> +exit:
> +	mutex_unlock(&chip->lock);
> +	return count;
> +}
> +
> +static ssize_t st1202_patt_seq_rep_show(struct device *dev,
> +					struct device_attribute *attr, char *buf)
> +{
> +	struct st1202_chip *chip;
> +	unsigned int ret;
> +	u8 value;
> +
> +	chip = dev_get_drvdata(dev);
> +
> +	mutex_lock(&chip->lock);
> +
> +	ret = st1202_read_reg(chip, ST1202_PATTERN_REP, &value);
> +	if (ret != 0)
> +		dev_err(dev, "Reading register [0x%x] failed, error: %d\n",
> +			ST1202_PATTERN_REP, ret);
> +
> +	mutex_unlock(&chip->lock);
> +	return sysfs_emit(buf, "Pattern sequence register, repetition value = %d (times)\n",
> +			 value);

Maybe reorder this code to:
    - have the mutex_unlock, just after st1202_read_reg() and before if 
(ret != 0)
    - display something else in case of error? Right now we display 
potentially some garbage without saying so.

> +}
> +
> +static ssize_t st1202_patt_seq_rep_store(struct device *dev,
> +					struct device_attribute *attr,
> +					const char *buf, size_t count)
> +{
> +	struct st1202_chip *chip;
> +	unsigned int ret;
> +	unsigned long duration;
> +
> +	chip = dev_get_drvdata(dev);
> +
> +	if (!count)
> +		return -EINVAL;
> +
> +	ret = kstrtoul(buf, 10, &duration);
> +	if (ret)
> +		return ret;
> +
> +	mutex_lock(&chip->lock);
> +
> +	ret = st1202_write_reg(chip, ST1202_PATTERN_REP, duration);
> +	if (ret != 0)
> +		dev_err(dev, "Writing register [0x%x] failed, error: %d\n",
> +			ST1202_PATTERN_REP, ret);
> +
> +	mutex_unlock(&chip->lock);
> +	return count;
> +}
> +
> +static ssize_t st1202_channel_mA_current_show(struct device *dev,
> +						struct device_attribute *attr,
> +						char *buf)
> +{
> +	struct st1202_chip *chip;
> +	struct dev_ext_attribute *eattr;
> +	u8 value;
> +	int led_num, ret;
> +
> +	chip = dev_get_drvdata(dev->parent);
> +	eattr = container_of(attr, struct dev_ext_attribute, attr);
> +	led_num = (int)eattr->var;

This does not compile for me.
based on other similar pattern, should it be

	map = (struct st1202_led_pattern_map *)eattr->var;

	led_num = (int)map->led_num;
?

> +
> +	if (led_num < 0 || led_num >= ST1202_MAX_LEDS) {

Can this happen?

> +		dev_err(dev, "Invalid led number: %d (out of range). Possible values 0..11\n",
> +				led_num);
> +		return -EINVAL;
> +	}
> +
> +	mutex_lock(&chip->lock);
> +
> +	ret = st1202_read_reg(chip, ST1202_ILED_REG0 + led_num, &value);
> +	if (ret != 0)
> +		dev_err(dev, "Reading analog dimming register [0x%x] failed, error: %d\n",
> +			led_num, ret);
> +
> +	mutex_unlock(&chip->lock);
> +	return sysfs_emit(buf, "Channel[%d] = %d mA\n", led_num,
> +			 st1202_prescalar_to_miliamps(value));

Same comment as in other show() function.

> +}
> +
> +static ssize_t st1202_pwm_pattern_show(struct device *dev,
> +					struct device_attribute *attr, char *buf)
> +{
> +	struct st1202_chip *chip;
> +	struct dev_ext_attribute *eattr;
> +	struct st1202_led_pattern_map *map;
> +
> +	u16 value;
> +	int led_num, pattern, ret;
> +
> +	chip = dev_get_drvdata(dev->parent);
> +	eattr = container_of(attr, struct dev_ext_attribute, attr);
> +	map = (struct st1202_led_pattern_map *)eattr->var;
> +
> +	led_num = (int)map->led_num;
> +	pattern = (int)map->pattern;
> +
> +	if (led_num < 0 || led_num >= ST1202_MAX_LEDS) {

Can this happen?

> +		dev_err(dev, "Invalid led number: %d (out of range). Possible values 0..11\n",
> +			led_num);
> +		goto validity_exit;
> +	}
> +
> +	mutex_lock(&chip->lock);
> +
> +	ret = st1202_pwm_pattern_read(chip, led_num, pattern, &value);
> +	if (ret != 0)
> +		goto exit;
> +
> +exit:
> +	mutex_unlock(&chip->lock);
> +validity_exit:
> +	return sysfs_emit(buf, "Pattern[%d][led(channel) %d]: PWM = 0x%03X\n",
> +		pattern, led_num, value);

Same comment as in other show() function.

> +}
> +
> +static ssize_t st1202_pwm_pattern_store(struct device *dev, struct device_attribute *attr,
> +					const char *buf, size_t count)
> +{
> +	struct st1202_chip *chip;
> +	struct dev_ext_attribute *eattr;
> +	struct st1202_led_pattern_map *map;
> +	unsigned int pwm_value;
> +	int led_num, pattern, ret;
> +
> +	chip = dev_get_drvdata(dev->parent);
> +	eattr = container_of(attr, struct dev_ext_attribute, attr);
> +	map = (struct st1202_led_pattern_map *)eattr->var;
> +
> +	led_num = (int)map->led_num;
> +	pattern = (int)map->pattern;
> +
> +	if (led_num < 0 || led_num >= ST1202_MAX_LEDS) {

Can this happen?

> +		dev_err(dev, "Invalid led number: %d (out of range). Possible values 0..11\n",
> +			led_num);
> +		return count;
> +	}
> +
> +	if (!count)
> +		return -EINVAL;
> +
> +	ret = sscanf(buf, "%X", &pwm_value);
> +	if (ret == 0) {
> +		dev_err(dev, "sscanf failed with error :%d\n", ret);
> +		return ret;
> +	}
> +
> +	mutex_lock(&chip->lock);
> +
> +	ret = st1202_pwm_pattern_write(chip, led_num, pattern, pwm_value);
> +	if (ret != 0)
> +		goto exit;
> +
> +	ret = st1202_write_reg(chip, ST1202_CONFIG_REG,
> +				(ST1202_CONFIG_REG_PATS | ST1202_CONFIG_REG_PATSR | pattern));
> +	if (ret != 0)
> +		dev_err(dev, "Failed writing value %ld to register [0x%x], error: %d\n",
> +			(ST1202_CONFIG_REG_PATS | ST1202_CONFIG_REG_PATSR | pattern),
> +			ST1202_CONFIG_REG, ret);
> +
> +exit:
> +	mutex_unlock(&chip->lock);
> +	return count;
> +}
> +
> +static struct device_attribute dev_attr_st1202_patt_seq_rep = __ATTR(pattern_seq_rep,
> +								0644,
> +								st1202_patt_seq_rep_show,
> +								st1202_patt_seq_rep_store);
> +
> +#define ST1202_EXT_ATTR(patt, lednum)	\
> +(&((struct st1202_led_pattern_map[]){	\
> +	{.led_num = lednum,		\
> +	.pattern = patt}		\
> +})[0])
> +
> +#define ST1202_PATT_EXT_ATTR(pattern, led_num)							\
> +static struct dev_ext_attribute dev_ext_attr_patt_pwm_##pattern##led_num = {			\
> +	.attr =  __ATTR(pwm_pattern##pattern, 0644,						\
> +			st1202_pwm_pattern##_show, st1202_pwm_pattern##_store),			\
> +	.var = (void *) ST1202_EXT_ATTR(pattern, led_num),					\
> +};												\
> +static struct dev_ext_attribute dev_ext_attr_patt_duration_##pattern##led_num = {		\
> +	.attr =  __ATTR(duration_pattern##pattern, 0644,					\
> +			st1202_duration_pattern##_show, st1202_duration_pattern##_store),	\
> +	.var = (void *) ST1202_EXT_ATTR(pattern, led_num),					\
> +};
> +
> +#define ST1202_LED_CURRENT_EXTATTR(led_num)							\
> +static struct dev_ext_attribute dev_attr_current_mA##led_num =  {				\
> +	.attr = __ATTR(current_mA, 0444, st1202_channel_mA_current_show, NULL),		\
> +	.var = (void *)led_num, };

Ending }; could be on its own line.
\ alignement could be improved in the #define.

> +
> +#define ST1202_MAP_ALL_PATTERNS_TO_LEDNUM(led_num)		\
> +ST1202_PATT_EXT_ATTR(0, led_num)				\
> +ST1202_PATT_EXT_ATTR(1, led_num)				\
> +ST1202_PATT_EXT_ATTR(2, led_num)				\
> +ST1202_PATT_EXT_ATTR(3, led_num)				\
> +ST1202_PATT_EXT_ATTR(4, led_num)				\
> +ST1202_PATT_EXT_ATTR(5, led_num)				\
> +ST1202_PATT_EXT_ATTR(6, led_num)				\
> +ST1202_PATT_EXT_ATTR(7, led_num)				\
> +ST1202_LED_CURRENT_EXTATTR(led_num)
> +
> +ST1202_MAP_ALL_PATTERNS_TO_LEDNUM(ST1202_LED_CHANNEL_0)
> +ST1202_MAP_ALL_PATTERNS_TO_LEDNUM(ST1202_LED_CHANNEL_1)
> +ST1202_MAP_ALL_PATTERNS_TO_LEDNUM(ST1202_LED_CHANNEL_2)
> +ST1202_MAP_ALL_PATTERNS_TO_LEDNUM(ST1202_LED_CHANNEL_3)
> +ST1202_MAP_ALL_PATTERNS_TO_LEDNUM(ST1202_LED_CHANNEL_4)
> +ST1202_MAP_ALL_PATTERNS_TO_LEDNUM(ST1202_LED_CHANNEL_5)
> +ST1202_MAP_ALL_PATTERNS_TO_LEDNUM(ST1202_LED_CHANNEL_6)
> +ST1202_MAP_ALL_PATTERNS_TO_LEDNUM(ST1202_LED_CHANNEL_7)
> +ST1202_MAP_ALL_PATTERNS_TO_LEDNUM(ST1202_LED_CHANNEL_8)
> +ST1202_MAP_ALL_PATTERNS_TO_LEDNUM(ST1202_LED_CHANNEL_9)
> +ST1202_MAP_ALL_PATTERNS_TO_LEDNUM(ST1202_LED_CHANNEL_10)
> +ST1202_MAP_ALL_PATTERNS_TO_LEDNUM(ST1202_LED_CHANNEL_11)
> +
> +#define ST1202_EXT_ATTR_LED_PWM(patt, lednum)			\
> +&dev_ext_attr_patt_pwm_##patt##lednum.attr.attr,		\
> +&dev_ext_attr_patt_duration_##patt##lednum.attr.attr
> +
> +#define ST1202_MAP_EXT_ATTR_TO_ALL_PATTERNS_ARRAY(lednum)			\
> +static struct attribute *led_attrs##lednum[] = {				\
> +	ST1202_EXT_ATTR_LED_PWM(0, lednum),					\
> +	ST1202_EXT_ATTR_LED_PWM(1, lednum),					\
> +	ST1202_EXT_ATTR_LED_PWM(2, lednum),					\
> +	ST1202_EXT_ATTR_LED_PWM(3, lednum),					\
> +	ST1202_EXT_ATTR_LED_PWM(4, lednum),					\
> +	ST1202_EXT_ATTR_LED_PWM(5, lednum),					\
> +	ST1202_EXT_ATTR_LED_PWM(6, lednum),					\
> +	ST1202_EXT_ATTR_LED_PWM(7, lednum),					\
> +	&dev_attr_current_mA##lednum.attr.attr,					\
> +	NULL									\
> +};										\
> +static struct attribute_group led_attr_group##lednum = {			\

static const struct?

> +	.attrs = led_attrs##lednum,						\
> +};										\
> +static const struct attribute_group *st1202_led_groups##lednum[] = {		\
> +	&led_attr_group##lednum,						\
> +	NULL									\
> +};
> +
> +ST1202_MAP_EXT_ATTR_TO_ALL_PATTERNS_ARRAY(0)
> +ST1202_MAP_EXT_ATTR_TO_ALL_PATTERNS_ARRAY(1)
> +ST1202_MAP_EXT_ATTR_TO_ALL_PATTERNS_ARRAY(2)
> +ST1202_MAP_EXT_ATTR_TO_ALL_PATTERNS_ARRAY(3)
> +ST1202_MAP_EXT_ATTR_TO_ALL_PATTERNS_ARRAY(4)
> +ST1202_MAP_EXT_ATTR_TO_ALL_PATTERNS_ARRAY(5)
> +ST1202_MAP_EXT_ATTR_TO_ALL_PATTERNS_ARRAY(6)
> +ST1202_MAP_EXT_ATTR_TO_ALL_PATTERNS_ARRAY(7)
> +ST1202_MAP_EXT_ATTR_TO_ALL_PATTERNS_ARRAY(8)
> +ST1202_MAP_EXT_ATTR_TO_ALL_PATTERNS_ARRAY(9)
> +ST1202_MAP_EXT_ATTR_TO_ALL_PATTERNS_ARRAY(10)
> +ST1202_MAP_EXT_ATTR_TO_ALL_PATTERNS_ARRAY(11)

...

> +static int st1202_dt_init(struct st1202_chip *chip)
> +{
> +	struct device_node *np, *child;
> +	struct st1202_led *led;
> +	int err, reg;
> +
> +	np = dev_of_node(&chip->client->dev);
> +
> +	for_each_child_of_node(np, child) {

for_each_child_of_node_scoped() would simplify error handling paths.

> +		err = of_property_read_u32(child, "reg", &reg);
> +		if (err) {
> +			of_node_put(child);
> +			dev_err(&chip->client->dev, "Failed to get child node, error: %d\n", err);

Nitpick: return dev_err_probe()?
(same for other calls below)

> +			return err;
> +		}
> +		if (reg < 0 || reg >= ST1202_MAX_LEDS) {
> +			of_node_put(child);
> +			dev_err(&chip->client->dev, "Invalid led number: %d (out of range). Possible values 0..11\n",
> +				reg);
> +			return -EINVAL;
> +		}
> +
> +		led = &chip->leds[reg];
> +		led->led_cdev.name = of_get_property(child, "label", NULL) ?:
> +							child->name;
> +
> +		err = of_property_read_u32(child, "active", &led->is_active);

If is_active is changed to a bool, of_property_read_bool()?

> +		if (err) {
> +			of_node_put(child);
> +			dev_err(&chip->client->dev, "Failed to get child node, error: %d\n", err);
> +			return err;
> +		}
> +		led->led_cdev.brightness_set = st1202_brightness_set;
> +		led->led_cdev.brightness_get = st1202_brightness_get;
> +	}
> +	return 0;
> +}
> +
> +static int st1202_setup(struct st1202_chip *chip)
> +{
> +	int ret;
> +
> +	mutex_lock(&chip->lock);

Using guard(mutex)(&chip->lock) would simplify code below and allow 
using return dev_error_probe().

The mutex_lock()/mutex_unlock() in the middle of the function looks 
useless to me, the probe has not completed yet and we can sleep within a 
mutex.

> +
> +	/**
> +	 * Once the supply voltage is applied, the LED1202 executes some
> +	 * internal checks, afterwords it stops the oscillator and puts
> +	 * the internal LDO in quiescent mode.
> +	 * To start the device, EN bit must be set inside the "Device Enable" register
> +	 * at address 01h.
> +	 * As soon as EN is set, the LED1202 loads the adjustment parameters from the internal
> +	 * non-volatile memory and performs an auto-calibration procedure in order to increase
> +	 * the output current precision.
> +	 * Such initialization lasts about 6.5 ms.

Formatting could be slightly improve to better match the 80-char limit, 
without adding any new LoC.

> +	 */
> +
> +	/* reset the chip during setup */
> +	ret = st1202_write_reg(chip, ST1202_DEV_ENABLE, BIT(7));
> +	if (ret < 0) {
> +		dev_err(&chip->client->dev, "Failed writing to register [0x%x], error: %d\n",
> +			ST1202_DEV_ENABLE, ret);
> +	goto exit;

1 tabulation missing.

> +	}
> +
> +	/* enable the device */
> +	ret = st1202_write_reg(chip, ST1202_DEV_ENABLE, BIT(0));
> +	if (ret < 0) {
> +		dev_err(&chip->client->dev, "Failed writing to register [0x%x], error: %d\n",
> +			ST1202_DEV_ENABLE, ret);
> +		goto exit;
> +	}
> +
> +	mutex_unlock(&chip->lock);
> +
> +	/* duration of initialization */
> +	usleep_range(6500, 10000);
> +
> +	mutex_lock(&chip->lock);
> +	/* set Pattern sequence repetition register to inifite loop */
> +	ret = st1202_write_reg(chip, ST1202_PATTERN_REP, ST1202_PATTERN_REP_INF_LOOP);
> +	if (ret < 0) {
> +		dev_err(&chip->client->dev, "Failed writing to register [0x%x], error: %d\n",
> +			ST1202_PATTERN_REP, ret);
> +		goto exit;
> +	}
> +	/* deactivate all leds (channels) and activate only the device tree active ones */
> +	ret = st1202_write_reg(chip, ST1202_CHAN_ENABLE_LOW, ST1202_CHAN_DISABLE_ALL);
> +	if (ret < 0) {
> +		dev_err(&chip->client->dev, "Failed writing to register [0x%x], error: %d\n",
> +			ST1202_CHAN_ENABLE_LOW, ret);
> +		goto exit;
> +	}
> +	ret = st1202_write_reg(chip, ST1202_CHAN_ENABLE_HIGH, ST1202_CHAN_DISABLE_ALL);
> +	if (ret < 0) {
> +		dev_err(&chip->client->dev, "Failed writing to register [0x%x], error: %d\n",
> +			ST1202_CHAN_ENABLE_HIGH, ret);
> +		goto exit;
> +	}
> +
> +exit:
> +	mutex_unlock(&chip->lock);
> +	return ret;
> +}
> +
> +static int st1202_probe(struct i2c_client *client)
> +{
> +	struct st1202_chip *chip;
> +	struct st1202_led *led;
> +	int ret;
> +	int i;
> +
> +	dev_info(&client->dev, "ST1202 I2C driver");

Not sure this is useful.

> +
> +	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_BYTE_DATA)) {
> +		dev_err(&client->dev, "SMBUS Byte Data not Supported\n");
> +		return -EIO;
> +	}
> +
> +	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
> +	if (!chip)
> +		return -ENOMEM;
> +
> +	i2c_set_clientdata(client, chip);
> +
> +	devm_mutex_init(&client->dev, &chip->lock);
> +	chip->client = client;
> +
> +	/* Device tree setup */
> +	ret = st1202_dt_init(chip);
> +	if (ret < 0)
> +		goto exit;
> +
> +	/* Configuration setup */
> +	ret = st1202_setup(chip);
> +	if (ret < 0)
> +		goto exit;
> +
> +	for (i = 0; i < ST1202_MAX_LEDS; i++) {
> +		led = &chip->leds[i];
> +		led->chip = chip;
> +		led->led_num = i;
> +		if (led->is_active) {
> +			ret = st1202_channel_activate(led->chip, led->led_num);
> +			if (ret < 0) {
> +				dev_err(&client->dev, "Failed to register LED class dev, error: %d\n",
> +					ret);
> +				goto exit;
> +			}
> +
> +			led->led_cdev.groups = st1202_led_groups[i];
> +
> +			ret = devm_led_classdev_register(&client->dev,
> +						    &led->led_cdev);
> +			if (ret < 0) {
> +				dev_err(&client->dev, "Failed to register LED class dev, error: %d\n",
> +					ret);
> +				goto exit;
> +			}
> +		}
> +	}
> +
> +	client->dev.driver->dev_groups = st1202_device_groups;
> +	return 0;
> +
> +exit:
> +	for (i = 0; i < ST1202_MAX_LEDS; i++)
> +		devm_led_classdev_unregister(&client->dev,  &chip->leds[i].led_cdev);
> +	mutex_destroy(&chip->lock);
> +	devm_kfree(&client->dev, chip);

All these clean-up functions should already be called by the framework 
and could be removed.

So direct return and return dev_error_probe() could be used above

> +	return ret;
> +}

...

CJ


