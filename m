Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90BA7916DA
	for <lists+linux-leds@lfdr.de>; Sun, 18 Aug 2019 15:47:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726261AbfHRNrr (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 18 Aug 2019 09:47:47 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:55281 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726115AbfHRNrr (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 18 Aug 2019 09:47:47 -0400
Received: by mail-wm1-f65.google.com with SMTP id p74so792788wme.4;
        Sun, 18 Aug 2019 06:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eYs8/D/eoNEH5KbjngXzXborMSUWNmItn9WmO4a26j4=;
        b=GxJZCYyV5biFxG9tnlc+YMlLd9HjrcaQrRJr7dDaNybAKVnBPCsR/DNp457Ugcx+4n
         Niz58ow9MY87VUx5h4ZjyiqfD0O9AqlcDMQnnB3VGDpe1ElCC6jyYd83mPXK0cZ+E7wT
         VjADjus0hcdyM2bZE0vxODHwySnX2WcLtiCN2CAxbciGna6CaxPb5nAr2xDEI8TeJFDq
         6vh0iZUSC/8T2bxxkOT9h+YetaIwX7o9wwC+70m03KHRYsEUFyT222IKfWzRbKzj06Zu
         QkgCVUNi/eiTwVi7WuUtJw+ZBrAtGTytzggQ+OEaw5w+WaiDVY3NdZvfP3kLWI7k3QaS
         TgqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=eYs8/D/eoNEH5KbjngXzXborMSUWNmItn9WmO4a26j4=;
        b=mq3XMhCuenCGTMB0HDUFbrW94giPljZa0/8ZLhUfcvtVPoqS5tgVZ8+7WwLgfXIAHH
         vW0G2kuCnK6WJ05UI0V4v5Pt7K37+SLdwkC/jsREsRGhxL/5ILydTMqWqKXSCmn4J6R8
         DsPjAH48mIGauHIUaBDKB3q99U4i0TOGIzQyIGHC56vuzsgyQWwda+/mFAp8PH2/LnIQ
         dT59tmApodiXyH6PeYFkLcjQJ83x7GJ7NroihKdvlDfIoD5FbNyc6QhLt023flcmAC8K
         1vrAFW9dyIVdTF2FeR4L7o9jKNvl1ro0R0JgUb4pluU7MrenArLHrMleyCE1UUF1TVFA
         P8Sw==
X-Gm-Message-State: APjAAAW3d6D1fuhNN/XzI5XdxICGf7NzJWvaSuMWjOEhA7arSsiD5CW4
        AEtpexPBmDrLV1tXnP3XrbBqkOiO
X-Google-Smtp-Source: APXvYqyf3VOWiIGeaFTVZFU/ZtcUM8d16TPiZQYf6AyaOFavi9u0Or7Sj8pn36AzLKhfXV4FJvMU2w==
X-Received: by 2002:a1c:6a03:: with SMTP id f3mr15166212wmc.35.1566136062390;
        Sun, 18 Aug 2019 06:47:42 -0700 (PDT)
Received: from [192.168.1.19] (dlz160.neoplus.adsl.tpnet.pl. [83.24.55.160])
        by smtp.gmail.com with ESMTPSA id h9sm9942478wrt.53.2019.08.18.06.47.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 18 Aug 2019 06:47:41 -0700 (PDT)
Subject: Re: [PATCH v4 2/2] leds: add LED driver for EL15203000 board
To:     Oleh Kravchenko <oleg@kaa.org.ua>, devicetree@vger.kernel.org,
        linux-leds@vger.kernel.org
References: <20190808203204.8614-1-oleg@kaa.org.ua>
 <20190808203204.8614-2-oleg@kaa.org.ua>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <e59f9411-e762-fd62-55f1-3e29bd5c36ad@gmail.com>
Date:   Sun, 18 Aug 2019 15:47:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190808203204.8614-2-oleg@kaa.org.ua>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Oleh,

Please find my review remarks below.

On 8/8/19 10:32 PM, Oleh Kravchenko wrote:
> This patch adds a LED class driver for the RGB LEDs found on
> the Crane Merchandising System EL15203000 LEDs board
> (aka RED LEDs board).
> 
> Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
> ---
>  .../testing/sysfs-class-led-driver-el15203000 |  22 +
>  drivers/leds/Kconfig                          |  13 +
>  drivers/leds/Makefile                         |   1 +
>  drivers/leds/leds-el15203000.c                | 478 ++++++++++++++++++
>  4 files changed, 514 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-class-led-driver-el15203000
>  create mode 100644 drivers/leds/leds-el15203000.c
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-led-driver-el15203000 b/Documentation/ABI/testing/sysfs-class-led-driver-el15203000
> new file mode 100644
> index 000000000000..91a483e493d9
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-class-led-driver-el15203000
> @@ -0,0 +1,22 @@
> +What:		/sys/class/leds/<led>/hw_pattern
> +Date:		August 2019
> +KernelVersion:	5.3
> +Description:
> +		Specify a hardware pattern for the EL15203000 LED.
> +		The LEDs board supports only predefined patterns by firmware
> +		for specific LEDs.
> +
> +		Breathing mode for Screen frame light tube:
> +		"0 4000 1 4000"
> +
> +		Cascade mode for Pipe LED:
> +		"1 800 2 800 4 800 8 800 16 800 1 800 2 800 4 800 8 800 16 800"

There's no point in repeating same sequence. Just require to provide it
once:

"1 800 2 800 4 800 8 800 16 800"

> +
> +		Inverted cascade mode for Pipe LED:
> +		"30 800 29 800 27 800 23 800 15 800 30 800 29 800 27 800 23 800 15 800"

The same story:

"30 800 29 800 27 800 23 800 15 800"

> +
> +		Bounce mode for Pipe LED:
> +		"1 800 2 800 4 800 8 800 16 800 16 800 8 800 4 800 2 800 1 800"
> +
> +		Inverted bounce mode for Pipe LED:
> +		"30 800 29 800 27 800 23 800 15 800 15 800 23 800 27 800 29 800 30 800"

These can be left as they are now.

> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 760f73a49c9f..0cbdb9ba5213 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -129,6 +129,19 @@ config LEDS_CR0014114
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
> index 1e9702ebffee..1f193ffc2feb 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -85,6 +85,7 @@ obj-$(CONFIG_LEDS_LM3601X)		+= leds-lm3601x.o
>  # LED SPI Drivers
>  obj-$(CONFIG_LEDS_CR0014114)		+= leds-cr0014114.o
>  obj-$(CONFIG_LEDS_DAC124S085)		+= leds-dac124s085.o
> +obj-$(CONFIG_LEDS_EL15203000)		+= leds-el15203000.o
>  
>  # LED Userspace Drivers
>  obj-$(CONFIG_LEDS_USER)			+= uleds.o
> diff --git a/drivers/leds/leds-el15203000.c b/drivers/leds/leds-el15203000.c
> new file mode 100644
> index 000000000000..c62da5ec6630
> --- /dev/null
> +++ b/drivers/leds/leds-el15203000.c
> @@ -0,0 +1,478 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2019 Crane Merchandising Systems. All rights reserved.
> +// Copyright (C) 2019 Oleh Kravchenko <oleg@kaa.org.ua>
> +
> +#include <linux/delay.h>
> +#include <linux/leds.h>
> +#include <linux/limits.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/spi/spi.h>
> +#include <uapi/linux/uleds.h>
> +
> +/*
> + * EL15203000 SPI protocol description:
> + * +-----+------------+
> + * | LED | BRIGHTNESS |
> + * +-----+------------+
> + * |  1  |      1     |
> + * +-----+------------+
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
> + * BRIGHTNESS:
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
> +#define EL_FW_DELAY_USEC	20000
> +
> +enum el15203000_brightness {

Please change 'brightness' to 'command' or so. Brightness is misleading
since this device supports in fact only one level of brightness for
non-pattern use case.

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
> +	char			name[LED_MAX_NAME_SIZE];

This field will not be needed if we switch to
devm_led_classdev_register_ext().

> +	u8			reg;
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
> +	unsigned long	jdelay, udelay, now;
> +
> +	mutex_lock(&led->priv->lock);
> +
> +	dev_dbg(led->priv->dev, "Set brightness of %s to %d",
> +		led->name, brightness);
> +
> +	/* to avoid SPI mistiming with firmware we should wait some time */
> +	now = jiffies;
> +	if (time_after(led->priv->delay, now)) {
> +		jdelay = led->priv->delay - now;
> +		udelay = jiffies_to_usecs(jdelay);
> +
> +		dev_dbg(led->priv->dev, "Wait %luus (%lu jiffies) to sync",
> +			udelay, jdelay);
> +
> +		usleep_range(udelay, udelay + 1);
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
> +static int led_pattern_cmp(const struct led_pattern *p1, u32 p1_len,
> +			   const struct led_pattern *p2, u32 p2_len)
> +{
> +	u32 i;
> +
> +	if (p1_len != p2_len)
> +		return -1;
> +
> +	for (i = 0; i < p1_len; i ++)
> +		if (p1[i].delta_t != p2[i].delta_t ||
> +		    p1[i].brightness != p2[i].brightness)
> +			return -1;
> +
> +	return 0;
> +}
> +
> +int el15203000_pattern_set_S(struct led_classdev *ldev,
> +			     struct led_pattern *pattern,
> +			     u32 len, int repeat)
> +{
> +	struct el15203000_led	*led = container_of(ldev,
> +						    struct el15203000_led,
> +						    ldev);
> +	struct led_pattern	scr_pattern[] = {{
> +		.delta_t	= 4000,
> +		.brightness	= 0,
> +	}, {
> +		.delta_t	= 4000,
> +		.brightness	= 1,
> +	}};
> +
> +	if (repeat > 0)
> +		return -EINVAL;
> +
> +	if (led_pattern_cmp(scr_pattern, ARRAY_SIZE(scr_pattern), pattern, len))
> +		return -EINVAL;
> +
> +	dev_dbg(led->priv->dev, "Breathing mode for '%s'", led->name);
> +
> +	return el15203000_cmd(led, EL_SCREEN_BREATHING);
> +}
> +
> +int el15203000_pattern_set_P(struct led_classdev *ldev,
> +			   struct led_pattern *pattern,
> +			   u32 len, int repeat)
> +{
> +	struct el15203000_led	*led = container_of(ldev,
> +						    struct el15203000_led,
> +						    ldev);
> +
> +	struct led_pattern cascade[] = {{
> +		.delta_t	= 800,
> +		.brightness	= 1,
> +	}, {
> +		.delta_t	= 800,
> +		.brightness	= 2,
> +	}, {
> +		.delta_t	= 800,
> +		.brightness	= 4,
> +	}, {
> +		.delta_t	= 800,
> +		.brightness	= 8,
> +	}, {
> +		.delta_t	= 800,
> +		.brightness	= 16,
> +	}, {
> +		.delta_t	= 800,
> +		.brightness	= 1,
> +	}, {
> +		.delta_t	= 800,
> +		.brightness	= 2,
> +	}, {
> +		.delta_t	= 800,
> +		.brightness	= 4,
> +	}, {
> +		.delta_t	= 800,
> +		.brightness	= 8,
> +	}, {
> +		.delta_t	= 800,
> +		.brightness	= 16,
> +	}};
> +
> +	struct led_pattern inv_cascade[] = {{
> +		.delta_t	= 800,
> +		.brightness	= 30,
> +	}, {
> +		.delta_t	= 800,
> +		.brightness	= 29,
> +	}, {
> +		.delta_t	= 800,
> +		.brightness	= 27,
> +	}, {
> +		.delta_t	= 800,
> +		.brightness	= 23,
> +	}, {
> +		.delta_t	= 800,
> +		.brightness	= 15,
> +	}, {
> +		.delta_t	= 800,
> +		.brightness	= 30,
> +	}, {
> +		.delta_t	= 800,
> +		.brightness	= 29,
> +	}, {
> +		.delta_t	= 800,
> +		.brightness	= 27,
> +	}, {
> +		.delta_t	= 800,
> +		.brightness	= 23,
> +	}, {
> +		.delta_t	= 800,
> +		.brightness	= 15,
> +	}};
> +
> +	struct led_pattern	bounce[] = {{
> +		.delta_t	= 800,
> +		.brightness	= 1,
> +	}, {
> +		.delta_t	= 800,
> +		.brightness	= 2,
> +	}, {
> +		.delta_t	= 800,
> +		.brightness	= 4,
> +	}, {
> +		.delta_t	= 800,
> +		.brightness	= 8,
> +	}, {
> +		.delta_t	= 800,
> +		.brightness	= 16,
> +	}, {
> +		.delta_t	= 800,
> +		.brightness	= 16,
> +	}, {
> +		.delta_t	= 800,
> +		.brightness	= 8,
> +	}, {
> +		.delta_t	= 800,
> +		.brightness	= 4,
> +	}, {
> +		.delta_t	= 800,
> +		.brightness	= 2,
> +	}, {
> +		.delta_t	= 800,
> +		.brightness	= 1,
> +	}};
> +
> +	struct led_pattern	inv_bounce[] = {{
> +		.delta_t	= 800,
> +		.brightness	= 30,
> +	}, {
> +		.delta_t	= 800,
> +		.brightness	= 29,
> +	}, {
> +		.delta_t	= 800,
> +		.brightness	= 27,
> +	}, {
> +		.delta_t	= 800,
> +		.brightness	= 23,
> +	}, {
> +		.delta_t	= 800,
> +		.brightness	= 15,
> +	}, {
> +		.delta_t	= 800,
> +		.brightness	= 15,
> +	}, {
> +		.delta_t	= 800,
> +		.brightness	= 23,
> +	}, {
> +		.delta_t	= 800,
> +		.brightness	= 27,
> +	}, {
> +		.delta_t	= 800,
> +		.brightness	= 29,
> +	}, {
> +		.delta_t	= 800,
> +		.brightness	= 30,
> +	}};

There is no need for these arrays. We can come up with formulas for
validating the pattern tuples. Basically all of them involve differences
in brightness being powers of two:

"1 800 2 800 4 800 8 800 16 800"

Here each next step should be equal to (1 << i) staring from i = 0.

"30 800 29 800 27 800 23 800 15 800"

brightness = 30;
for (i = 0; i < pattern_len; i++) {
	br_diff = (i > 0) ? (1 << (i - 1)) : 0;
	brightness -= br_diff;
}

"1 800 2 800 4 800 8 800 16 800 16 800 8 800 4 800 2 800 1 800"

"30 800 29 800 27 800 23 800 15 800 15 800 23 800 27 800 29 800 30 800"

Above two can be handled by slightly modifying what I proposed above.

And for delta_t just require by default always 800.

> +	if (repeat > 0)
> +		return -EINVAL;
> +
> +	if (!led_pattern_cmp(cascade, ARRAY_SIZE(cascade), pattern, len)) {
> +		dev_dbg(led->priv->dev, "Cascade mode for '%s'", led->name);
> +		return el15203000_cmd(led, EL_PIPE_CASCADE);
> +	} else if (!led_pattern_cmp(inv_cascade, ARRAY_SIZE(inv_cascade), pattern, len)) {
> +		dev_dbg(led->priv->dev, "Inverse cascade mode for '%s'", led->name);
> +		return el15203000_cmd(led, EL_PIPE_INV_CASCADE);
> +	} else if (!led_pattern_cmp(bounce, ARRAY_SIZE(bounce), pattern, len)) {
> +		dev_dbg(led->priv->dev, "Bounce mode for '%s'", led->name);
> +		return el15203000_cmd(led, EL_PIPE_BOUNCE);
> +	} else if (!led_pattern_cmp(inv_bounce, ARRAY_SIZE(inv_bounce), pattern, len)) {
> +		dev_dbg(led->priv->dev, "Inverse bounce mode for '%s'", led->name);
> +		return el15203000_cmd(led, EL_PIPE_INV_BOUNCE);
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +int el15203000_pattern_clear(struct led_classdev *ldev)
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
> +	size_t			i = 0;
> +	struct el15203000_led	*led;
> +	struct fwnode_handle	*child;
> +	int			ret;
> +	const char		*str;
> +	u32			reg;
> +
> +	device_for_each_child_node(priv->dev, child) {
		struct led_init_data init_data = {};

Please add above declaration here.

> +		led = &priv->leds[i];
> +
> +		ret = fwnode_property_read_u32(child, "reg", &reg);
> +		if (ret) {
> +			dev_err(priv->dev, "LED without ID number");
> +			fwnode_handle_put(child);
> +
> +			return ret;
> +		}
> +
> +		if (reg > U8_MAX) {
> +			dev_err(priv->dev, "LED value %d is invalid", reg);
> +			fwnode_handle_put(child);
> +
> +			return -EINVAL;
> +		}
> +
> +		led->reg = reg;
> +
> +		ret = fwnode_property_read_string(child, "label", &str);
> +		if (ret)
> +			str = ":";
> +		snprintf(led->name, sizeof(led->name), "el15203000:%s", str);

And instead of the four above lines please just do the below assignment:

		init_data.fwnode = child;

but let's do it right before calling devm_led_classdev_register_ext().

> +
> +		fwnode_property_read_string(child, "linux,default-trigger",
> +					    &led->ldev.default_trigger);
> +
> +		led->ldev.max_brightness	  = LED_ON;
> +		led->priv			  = priv;
> +		led->ldev.name			  = led->name;

Please also remove the above line.

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
> +		ret = devm_led_classdev_register(priv->dev, &led->ldev);

And here let's switch to the new LED registration API:

		ret = devm_led_classdev_register_ext(priv->dev, &led->ldev, &init_data);


> +		if (ret) {
> +			dev_err(priv->dev,
> +				"failed to register LED device %s, err %d",
> +				led->name, ret);
> +			fwnode_handle_put(child);
> +			return ret;
> +		}
> +
> +		i++;
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
> +	dev_dbg(priv->dev, "%zd LEDs registered", priv->count);

Please remove this debug log.

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

Please also fix the issues checkpatch.pl complains about.

-- 
Best regards,
Jacek Anaszewski
