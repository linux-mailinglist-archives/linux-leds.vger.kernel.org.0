Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11260ACFC9
	for <lists+linux-leds@lfdr.de>; Sun,  8 Sep 2019 18:41:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729784AbfIHQlG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 8 Sep 2019 12:41:06 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:38271 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729739AbfIHQlG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 8 Sep 2019 12:41:06 -0400
Received: by mail-wm1-f68.google.com with SMTP id o184so11977203wme.3;
        Sun, 08 Sep 2019 09:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QfX3wDJj7ouvjgCcGjsEodYcuULwEjjwmuUfusrqvUo=;
        b=Ap0RyqdBcwHXmUUbDHlIenE0eO/erCnyY3QM086BeREMGi64agSB+J+KYpVRyQ2SCl
         FaA3X08B6CZiLztH93GV6yr5bHxvYVyB5uVz9Fa7F/WXVpJUnOr4TSGO7+atIsP70lfe
         Cy/z8JMFUk6PuFfrCzhSHvoNB9rGk6ykqvTxcI91QP8srEvGJOshQh+VZEhxzAV2rxT5
         Ddy+KudZUnCxRK+RMumpe8Fod+O9KmA9oX2YE4kB0MG1ighlcE667lL3e2GTyPnhk0AC
         HaYOoKILqr7Dgi3oTCgi4UTuyIhWE/q1Odg5HaVzjuCNOBgyFdNPCWou/5hA9kp/uXjU
         L+Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=QfX3wDJj7ouvjgCcGjsEodYcuULwEjjwmuUfusrqvUo=;
        b=ToQtGbW6x2CcxJ23pzi/M6jm+d7BjZbX44KBe2L072ofWEvn/H7gQBFr8LSLMoqtv2
         kjr+Mr31lLCDEDIDE74J7m6/nH8ouAdYWZjlnA0nMnYKyDJSLSG4pIculMjX+hwlM331
         viMUDJyQ5qZqQ8xzptArAvjVxSXyf6vIyZ0WTPHCuD6P2OENqX1IP0AhkDr1geSC7Yat
         z0rbkItaHSyFMK5RaIGT12m8ySTwyH2CQSrIMEYml8X7TYfV6a5or0Exo5pA4XTiB6VC
         bEeQIJM6kDkPT5GenFVgw1oPMLuT9mE5QjwerIhiwj6NTp5DQETaB7F136GIsSFj2+Bt
         07+A==
X-Gm-Message-State: APjAAAWeW9fJ3OCLEAhADC6LClzGc7mBnRnjjZ5x/e/onE/uhnfzq5F0
        lNcLMkRTYxN721k3a1F7FL3T4h46
X-Google-Smtp-Source: APXvYqzjPaGlv0Xhs0DviT8a4yXk69uTlx5dE/On9jFKQEotthRZ9IAuAKrvcmIig6kArjs/q9mnIA==
X-Received: by 2002:a1c:c189:: with SMTP id r131mr15863390wmf.153.1567960861425;
        Sun, 08 Sep 2019 09:41:01 -0700 (PDT)
Received: from [192.168.1.19] (bdt94.neoplus.adsl.tpnet.pl. [83.28.5.94])
        by smtp.gmail.com with ESMTPSA id i73sm17487441wmg.33.2019.09.08.09.41.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 08 Sep 2019 09:41:00 -0700 (PDT)
Subject: Re: [PATCH v6 2/2] leds: add LED driver for EL15203000 board
To:     Oleh Kravchenko <oleg@kaa.org.ua>, devicetree@vger.kernel.org,
        linux-leds@vger.kernel.org, pavel@ucw.cz
References: <20190906132916.12423-1-oleg@kaa.org.ua>
 <20190906132916.12423-3-oleg@kaa.org.ua>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <c603c60e-766e-6c42-20f4-fc0abe3794d6@gmail.com>
Date:   Sun, 8 Sep 2019 18:40:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190906132916.12423-3-oleg@kaa.org.ua>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Oleh,

You seem to have not even compile-tested the patch :-(

In file included from ./include/linux/leds.h:12:0,
                 from drivers/leds/leds-el15203000.c:6:
drivers/leds/leds-el15203000.c: In function 'el15203000_probe_dt':
drivers/leds/leds-el15203000.c:254:50: error: 'reg' undeclared (first
use in this function)
    dev_err(priv->dev, "LED value %d is invalid", reg);
                                                  ^
./include/linux/device.h:1724:32: note: in definition of macro 'dev_err'
  _dev_err(dev, dev_fmt(fmt), ##__VA_ARGS__)
                                ^
drivers/leds/leds-el15203000.c:254:50: note: each undeclared identifier
is reported only once for each function it appears in
    dev_err(priv->dev, "LED value %d is invalid", reg);
                                                  ^
./include/linux/device.h:1724:32: note: in definition of macro 'dev_err'
  _dev_err(dev, dev_fmt(fmt), ##__VA_ARGS__)
                                ^


On 9/6/19 3:29 PM, Oleh Kravchenko wrote:
> This patch adds a LED class driver for the LEDs found on
> the Crane Merchandising System EL15203000 LEDs board
> (aka RED LEDs board).
> 
> Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
> ---
>  .../testing/sysfs-class-led-driver-el15203000 |  32 ++
>  drivers/leds/Kconfig                          |  13 +
>  drivers/leds/Makefile                         |   1 +
>  drivers/leds/leds-el15203000.c                | 356 ++++++++++++++++++
>  4 files changed, 402 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-class-led-driver-el15203000
>  create mode 100644 drivers/leds/leds-el15203000.c
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-led-driver-el15203000 b/Documentation/ABI/testing/sysfs-class-led-driver-el15203000
> new file mode 100644
> index 000000000000..5e9cbf49da59
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-class-led-driver-el15203000
> @@ -0,0 +1,32 @@
> +What:		/sys/class/leds/<led>/hw_pattern
> +Date:		September 2019
> +KernelVersion:	5.5
> +Description:
> +		Specify a hardware pattern for the EL15203000 LED.
> +		The LEDs board supports only predefined patterns by firmware
> +		for specific LEDs.
> +
> +		Breathing mode for Screen frame light tube:
> +		"0 4000 1 4000"
> +
> +		Cascade mode for Pipe LED:
> +		"1 800 2 800 4 800 8 800 16 800"
> +
> +		Inverted cascade mode for Pipe LED:
> +		"30 800 29 800 27 800 23 800 15 800"
> +
> +		Bounce mode for Pipe LED:
> +		"1 800 2 800 4 800 8 800 16 800 16 800 8 800 4 800 2 800 1 800"
> +
> +		Inverted bounce mode for Pipe LED:
> +		"30 800 29 800 27 800 23 800 15 800 15 800 23 800 27 800 29 800 30 800"
> +
> +What:		/sys/class/leds/<led>/repeat
> +Date:		September 2019
> +KernelVersion:	5.5
> +Description:
> +		EL15203000 supports only indefinitely patterns,
> +		so this file should always store -1.
> +
> +		For more info, please see:
> +		Documentation/ABI/testing/sysfs-class-led-trigger-pattern
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 1988de1d64c0..6e7703fd03d0 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -132,6 +132,19 @@ config LEDS_CR0014114
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called leds-cr0014114.
>  
> +config LEDS_EL15203000
> +	tristate "LED Support for Crane EL15203000"
> +	depends on LEDS_CLASS
> +	depends on SPI
> +	depends on OF
> +	help
> +	  This option enables support for EL15203000 LED Board
> +	  (aka RED LED board) which is widely used in coffee vending
> +	  machines produced by Crane Merchandising Systems.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called leds-el15203000.
> +
>  config LEDS_LM3530
>  	tristate "LCD Backlight driver for LM3530"
>  	depends on LEDS_CLASS
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index 41fb073a39c1..2da39e896ce8 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -89,6 +89,7 @@ obj-$(CONFIG_LEDS_LM36274)		+= leds-lm36274.o
>  # LED SPI Drivers
>  obj-$(CONFIG_LEDS_CR0014114)		+= leds-cr0014114.o
>  obj-$(CONFIG_LEDS_DAC124S085)		+= leds-dac124s085.o
> +obj-$(CONFIG_LEDS_EL15203000)		+= leds-el15203000.o
>  
>  # LED Userspace Drivers
>  obj-$(CONFIG_LEDS_USER)			+= uleds.o
> diff --git a/drivers/leds/leds-el15203000.c b/drivers/leds/leds-el15203000.c
> new file mode 100644
> index 000000000000..03d6d5be8094
> --- /dev/null
> +++ b/drivers/leds/leds-el15203000.c
> @@ -0,0 +1,356 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2019 Crane Merchandising Systems. All rights reserved.
> +// Copyright (C) 2019 Oleh Kravchenko <oleg@kaa.org.ua>
> +
> +#include <linux/delay.h>
> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/spi/spi.h>
> +
> +/*
> + * EL15203000 SPI protocol description:
> + * +-----+---------+
> + * | LED | COMMAND |
> + * +-----+---------+
> + * |  1  |    1    |
> + * +-----+---------+
> + * (*) LEDs MCU board expects 20 msec delay per byte.
> + *
> + * LEDs:
> + * +----------+--------------+-------------------------------------------+
> + * |    ID    |     NAME     |         DESCRIPTION                       |
> + * +----------+--------------+-------------------------------------------+
> + * | 'P' 0x50 |     Pipe     | Consists from 5 LEDs, controlled by board |
> + * +----------+--------------+-------------------------------------------+
> + * | 'S' 0x53 | Screen frame | Light tube around the screen              |
> + * +----------+--------------+-------------------------------------------+
> + * | 'V' 0x56 | Vending area | Highlights a cup of coffee                |
> + * +----------+--------------+-------------------------------------------+
> + *
> + * COMMAND:
> + * +----------+-----------------+--------------+--------------+
> + * |  VALUES  |       PIPE      | SCREEN FRAME | VENDING AREA |
> + * +----------+-----------------+--------------+--------------+
> + * | '0' 0x30 |                      Off                      |
> + * +----------+-----------------------------------------------+
> + * | '1' 0x31 |                      On                       |
> + * +----------+-----------------+--------------+--------------+
> + * | '2' 0x32 |     Cascade     |   Breathing  |
> + * +----------+-----------------+--------------+
> + * | '3' 0x33 | Inverse cascade |
> + * +----------+-----------------+
> + * | '4' 0x34 |     Bounce      |
> + * +----------+-----------------+
> + * | '5' 0x35 | Inverse bounce  |
> + * +----------+-----------------+
> + */
> +
> +/* EL15203000 default settings */
> +#define EL_FW_DELAY_USEC	20000ul
> +#define EL_PATTERN_DELAY_MSEC	800u
> +#define EL_PATTERN_LEN		10u
> +#define EL_PATTERN_HALF_LEN	(EL_PATTERN_LEN / 2)
> +
> +enum el15203000_command {
> +	/* for all LEDs */
> +	EL_OFF			= '0',
> +	EL_ON			= '1',
> +
> +	/* for Screen LED */
> +	EL_SCREEN_BREATHING	= '2',
> +
> +	/* for Pipe LED */
> +	EL_PIPE_CASCADE		= '2',
> +	EL_PIPE_INV_CASCADE	= '3',
> +	EL_PIPE_BOUNCE		= '4',
> +	EL_PIPE_INV_BOUNCE	= '5',
> +};
> +
> +struct el15203000_led {
> +	struct el15203000	*priv;
> +	struct led_classdev	ldev;
> +	u32			reg;
> +};
> +
> +struct el15203000 {
> +	struct device		*dev;
> +	struct mutex		lock;
> +	struct spi_device	*spi;
> +	unsigned long		delay;
> +	size_t			count;
> +	struct el15203000_led	leds[];
> +};
> +
> +static int el15203000_cmd(struct el15203000_led *led, u8 brightness)
> +{
> +	int		ret;
> +	u8		cmd[2];
> +	size_t		i;
> +
> +	mutex_lock(&led->priv->lock);
> +
> +	dev_dbg(led->priv->dev, "Set brightness of 0x%02x(%c) to 0x%02x(%c)",
> +		led->reg, led->reg, brightness, brightness);
> +
> +	/* to avoid SPI mistiming with firmware we should wait some time */
> +	if (time_after(led->priv->delay, jiffies)) {
> +		dev_dbg(led->priv->dev, "Wait %luus to sync",
> +			EL_FW_DELAY_USEC);
> +
> +		usleep_range(EL_FW_DELAY_USEC,
> +			     EL_FW_DELAY_USEC + 1);
> +	}
> +
> +	cmd[0] = led->reg;
> +	cmd[1] = brightness;
> +
> +	for (i = 0; i < ARRAY_SIZE(cmd); i++) {
> +		if (i)
> +			usleep_range(EL_FW_DELAY_USEC,
> +				     EL_FW_DELAY_USEC + 1);
> +
> +		ret = spi_write(led->priv->spi, &cmd[i], sizeof(cmd[i]));
> +		if (ret) {
> +			dev_err(led->priv->dev,
> +				"spi_write() error %d", ret);
> +			break;
> +		}
> +	}
> +
> +	led->priv->delay = jiffies + usecs_to_jiffies(EL_FW_DELAY_USEC);
> +
> +	mutex_unlock(&led->priv->lock);
> +
> +	return ret;
> +}
> +
> +static int el15203000_set_blocking(struct led_classdev *ldev,
> +				   enum led_brightness brightness)
> +{
> +	struct el15203000_led	*led = container_of(ldev,
> +						    struct el15203000_led,
> +						    ldev);
> +
> +	return el15203000_cmd(led, brightness == LED_OFF ? EL_OFF : EL_ON);
> +}
> +
> +static int el15203000_pattern_set_S(struct led_classdev *ldev,
> +				    struct led_pattern *pattern,
> +				    u32 len, int repeat)
> +{
> +	struct el15203000_led	*led = container_of(ldev,
> +						    struct el15203000_led,
> +						    ldev);
> +
> +	if (repeat > 0 || len != 2 ||
> +	    pattern[0].delta_t != 4000 || pattern[0].brightness != 0 ||
> +	    pattern[1].delta_t != 4000 || pattern[1].brightness != 1)
> +		return -EINVAL;
> +
> +	dev_dbg(led->priv->dev, "Breathing mode for 0x%02x(%c)",
> +		led->reg, led->reg);
> +
> +	return el15203000_cmd(led, EL_SCREEN_BREATHING);
> +}
> +
> +static bool is_cascade(const struct led_pattern *pattern, u32 len,
> +		       bool inv, bool right)
> +{
> +	int val, t;
> +	u32 i;
> +
> +	if (len != EL_PATTERN_HALF_LEN)
> +		return false;
> +
> +	val = right ? BIT(4) : BIT(0);
> +
> +	for (i = 0; i < len; i++) {
> +		t = inv ? ~val & GENMASK(4, 0) : val;
> +
> +		if (pattern[i].delta_t != EL_PATTERN_DELAY_MSEC ||
> +		    pattern[i].brightness != t)
> +			return false;
> +
> +		val = right ? val >> 1 : val << 1;
> +	}
> +
> +	return true;
> +}
> +
> +static bool is_bounce(const struct led_pattern *pattern, u32 len, bool inv)
> +{
> +	if (len != EL_PATTERN_LEN)
> +		return false;
> +
> +	return is_cascade(pattern, EL_PATTERN_HALF_LEN, inv, false) &&
> +	       is_cascade(pattern +  EL_PATTERN_HALF_LEN,
> +			  EL_PATTERN_HALF_LEN, inv, true);
> +}
> +
> +static int el15203000_pattern_set_P(struct led_classdev *ldev,
> +				    struct led_pattern *pattern,
> +				    u32 len, int repeat)
> +{
> +	struct el15203000_led	*led = container_of(ldev,
> +						    struct el15203000_led,
> +						    ldev);
> +
> +	if (repeat != -1)
> +		return -EINVAL;
> +
> +	if (is_cascade(pattern, len, false, false)) {
> +		dev_dbg(led->priv->dev, "Cascade mode for 0x%02x(%c)",
> +			led->reg, led->reg);
> +
> +		return el15203000_cmd(led, EL_PIPE_CASCADE);
> +	} else if (is_cascade(pattern, len, true, false)) {
> +		dev_dbg(led->priv->dev, "Inverse cascade mode for 0x%02x(%c)",
> +			led->reg, led->reg);
> +
> +		return el15203000_cmd(led, EL_PIPE_INV_CASCADE);
> +	} else if (is_bounce(pattern, len, false)) {
> +		dev_dbg(led->priv->dev, "Bounce mode for 0x%02x(%c)",
> +			led->reg, led->reg);
> +
> +		return el15203000_cmd(led, EL_PIPE_BOUNCE);
> +	} else if (is_bounce(pattern, len, true)) {
> +		dev_dbg(led->priv->dev, "Inverse bounce mode for 0x%02x(%c)",
> +			led->reg, led->reg);
> +
> +		return el15203000_cmd(led, EL_PIPE_INV_BOUNCE);
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static int el15203000_pattern_clear(struct led_classdev *ldev)
> +{
> +	struct el15203000_led	*led = container_of(ldev,
> +						    struct el15203000_led,
> +						    ldev);
> +
> +	return el15203000_cmd(led, EL_OFF);
> +}
> +
> +static int el15203000_probe_dt(struct el15203000 *priv)
> +{
> +	struct el15203000_led	*led = priv->leds;
> +	struct fwnode_handle	*child;
> +	int			ret;
> +
> +	device_for_each_child_node(priv->dev, child) {
> +		struct led_init_data	init_data = {};
> +
> +		ret = fwnode_property_read_u32(child, "reg", &led->reg);
> +		if (ret) {
> +			dev_err(priv->dev, "LED without ID number");
> +			fwnode_handle_put(child);
> +
> +			return ret;
> +		}
> +
> +		if (led->reg > U8_MAX) {
> +			dev_err(priv->dev, "LED value %d is invalid", reg);
> +			fwnode_handle_put(child);
> +
> +			return -EINVAL;
> +		}
> +
> +		fwnode_property_read_string(child, "linux,default-trigger",
> +					    &led->ldev.default_trigger);
> +
> +		led->priv			  = priv;
> +		led->ldev.max_brightness	  = LED_ON;
> +		led->ldev.brightness_set_blocking = el15203000_set_blocking;
> +
> +		if (reg == 'S') {
> +			led->ldev.pattern_set	= el15203000_pattern_set_S;
> +			led->ldev.pattern_clear	= el15203000_pattern_clear;
> +		} else if (reg == 'P') {
> +			led->ldev.pattern_set	= el15203000_pattern_set_P;
> +			led->ldev.pattern_clear	= el15203000_pattern_clear;
> +		}
> +
> +		init_data.fwnode = child;
> +		ret = devm_led_classdev_register_ext(priv->dev, &led->ldev,
> +						     &init_data);
> +		if (ret) {
> +			dev_err(priv->dev,
> +				"failed to register LED device %s, err %d",
> +				led->ldev.name, ret);
> +			fwnode_handle_put(child);
> +
> +			return ret;
> +		}
> +
> +		led++;

I recommend to use what I proposed before.

> +	}
> +
> +	return ret;
> +}
> +
> +static int el15203000_probe(struct spi_device *spi)
> +{
> +	struct el15203000	*priv;
> +	size_t			count;
> +	int			ret;
> +
> +	count = device_get_child_node_count(&spi->dev);
> +	if (!count) {
> +		dev_err(&spi->dev, "LEDs are not defined in device tree!");
> +		return -ENODEV;
> +	}
> +
> +	priv = devm_kzalloc(&spi->dev, struct_size(priv, leds, count),
> +			    GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	mutex_init(&priv->lock);
> +	priv->count	= count;
> +	priv->dev	= &spi->dev;
> +	priv->spi	= spi;
> +	priv->delay	= jiffies -
> +			  usecs_to_jiffies(EL_FW_DELAY_USEC);
> +
> +	ret = el15203000_probe_dt(priv);
> +	if (ret)
> +		return ret;
> +
> +	spi_set_drvdata(spi, priv);
> +
> +	return 0;
> +}
> +
> +static int el15203000_remove(struct spi_device *spi)
> +{
> +	struct el15203000 *priv = spi_get_drvdata(spi);
> +
> +	mutex_destroy(&priv->lock);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id el15203000_dt_ids[] = {
> +	{ .compatible = "crane,el15203000", },
> +	{},
> +};
> +
> +MODULE_DEVICE_TABLE(of, el15203000_dt_ids);
> +
> +static struct spi_driver el15203000_driver = {
> +	.probe		= el15203000_probe,
> +	.remove		= el15203000_remove,
> +	.driver = {
> +		.name		= KBUILD_MODNAME,
> +		.of_match_table	= el15203000_dt_ids,
> +	},
> +};
> +
> +module_spi_driver(el15203000_driver);
> +
> +MODULE_AUTHOR("Oleh Kravchenko <oleg@kaa.org.ua>");
> +MODULE_DESCRIPTION("el15203000 LED driver");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("spi:el15203000");
> 

-- 
Best regards,
Jacek Anaszewski
