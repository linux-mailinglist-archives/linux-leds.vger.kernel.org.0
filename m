Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7ED2163486
	for <lists+linux-leds@lfdr.de>; Tue, 18 Feb 2020 22:13:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726820AbgBRVNO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 18 Feb 2020 16:13:14 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:50690 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726339AbgBRVNO (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 18 Feb 2020 16:13:14 -0500
Received: by mail-wm1-f68.google.com with SMTP id a5so4239143wmb.0;
        Tue, 18 Feb 2020 13:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=B9JbCjJxTt4IaGHbZoF9D6JCj782n2TxRiALq9oTbew=;
        b=Eq/SsYlowh/upq3pmVqYXwsa6HRYCNRUQrNjJ65JONGRPzbAGMsy4ks6ehtL0PmTJm
         uznBh1YKGxtieX0p9bqOkQI+4VQP++5vIcKO76VbrA+iCl5NVxDsOKkEZbZ6BeGPg47C
         Kyc9pgzrBGVx27ImCpFE+zYkI8TBoDmP8iaOYs706KZOup1UHTU8GjBUlYiTYg0VBYn1
         /1JTkw1ErDwQqb279LU/Rj+N4KgJnGu/dFCZrynaKUBIQQZH82tsK6NgOiVXiRn20lm6
         kqhHTYFLeSGmWpq8L7pk+EJ7103hBdvzXSiknbjPA4tU434uLW5PKuEWWAIlZ71KWjmN
         0snA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=B9JbCjJxTt4IaGHbZoF9D6JCj782n2TxRiALq9oTbew=;
        b=KGEdJmOXtecKoBKU+QFdCtePa56wBIp1jrTFL7fewHUBTi1kvtINvXO88/wNsa/GLv
         ecxQB+k2mla86RK/a0imEDCoT7i901J3zuYcmuFvtGCfjkWdarK/womuLh/mrpqG4/uB
         brPsHzMHnaDPA+7DDo4TfXaeB6kWClNjBHzby1elL3ZzHWTufmhj5Q0wUN18MaxTMpOR
         WOXOBjM126SD9PhwQ6y77Sv45cpqSNkG40VnuzYaifYlY8pENmnAKRgTCvyiHrm2oMKO
         pyTIYDLJZEBQGHl9gRrwRDLslNNFNwooRvGNCjY00lr3jP4x5z6CfQN1LdzQBy6aBYIj
         H/kQ==
X-Gm-Message-State: APjAAAUQQyXLludU2sr2Z690G6kNMsLMw8wf6MJ+3sewedvVTEpAS+Cr
        lVRrdOoIQpm2pCUdw1DbOEk=
X-Google-Smtp-Source: APXvYqy2IB/B6lbM0dHQfm+5EZwNVvg0TC2n/Li18aJPOMpLUmns2sQiSRzt1e90fHM05Fsic1u2QQ==
X-Received: by 2002:a1c:7d93:: with SMTP id y141mr5025416wmc.111.1582060389261;
        Tue, 18 Feb 2020 13:13:09 -0800 (PST)
Received: from [192.168.1.23] (afcx122.neoplus.adsl.tpnet.pl. [95.49.75.122])
        by smtp.gmail.com with ESMTPSA id w11sm7596330wrt.35.2020.02.18.13.13.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2020 13:13:08 -0800 (PST)
Subject: Re: [PATCH 3/3] drivers: leds: add support for apa102c leds
To:     Nicolas Belin <nbelin@baylibre.com>, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, pavel@ucw.cz, dmurphy@ti.com
References: <1582018657-5720-1-git-send-email-nbelin@baylibre.com>
 <1582018657-5720-4-git-send-email-nbelin@baylibre.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <00d63872-0856-602a-e24b-4e27300d9254@gmail.com>
Date:   Tue, 18 Feb 2020 22:13:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1582018657-5720-4-git-send-email-nbelin@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Nicolas,

On 2/18/20 10:37 AM, Nicolas Belin wrote:
> Initilial commit in order to support the apa102c RGB leds.
> 
> Signed-off-by: Nicolas Belin <nbelin@baylibre.com>
> ---
>  drivers/leds/Kconfig        |  11 ++
>  drivers/leds/Makefile       |   1 +
>  drivers/leds/leds-apa102c.c | 268 ++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 280 insertions(+)
>  create mode 100644 drivers/leds/leds-apa102c.c
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index d82f1dea3711..4fafeaaf6ee8 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -69,6 +69,17 @@ config LEDS_AN30259A
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called leds-an30259a.
>  
> +config LEDS_APA102C
> +	tristate "LED Support for Shiji APA102C"
> +	depends on LEDS_CLASS
> +	depends on SPI
> +	help
> +	  This option enables support for the Shiji Lighthing APA102C RGB full color
> +	  LEDs.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called leds-apa102c.
> +
>  config LEDS_APU
>  	tristate "Front panel LED support for PC Engines APU/APU2/APU3 boards"
>  	depends on LEDS_CLASS
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index d7e1107753fb..ab17f90347cb 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -9,6 +9,7 @@ obj-$(CONFIG_LEDS_TRIGGERS)		+= led-triggers.o
>  # LED Platform Drivers
>  obj-$(CONFIG_LEDS_88PM860X)		+= leds-88pm860x.o
>  obj-$(CONFIG_LEDS_AAT1290)		+= leds-aat1290.o
> +obj-$(CONFIG_LEDS_APA102C)		+= leds-apa102c.o
>  obj-$(CONFIG_LEDS_APU)			+= leds-apu.o
>  obj-$(CONFIG_LEDS_AS3645A)		+= leds-as3645a.o
>  obj-$(CONFIG_LEDS_AN30259A)		+= leds-an30259a.o
> diff --git a/drivers/leds/leds-apa102c.c b/drivers/leds/leds-apa102c.c
> new file mode 100644
> index 000000000000..e7abe3f5b7c2
> --- /dev/null
> +++ b/drivers/leds/leds-apa102c.c
> @@ -0,0 +1,268 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/*
> + * Copyright (C) 2020 BayLibre, SAS
> + * Author: Nicolas Belin <nbelin@baylibre.com>
> + */

Please use "//" comment style for all the above lines.

> +
> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/spi/spi.h>
> +#include <uapi/linux/uleds.h>
> +
> +/*
> + *  APA102C SPI protocol description:
> + *  +------+----------------------------------------+------+
> + *  |START |               DATA FIELD:              | END  |
> + *  |FRAME |               N LED FRAMES             |FRAME |
> + *  +------+------+------+------+------+-----+------+------+
> + *  | 0*32 | LED1 | LED2 | LED3 | LED4 | --- | LEDN | 1*32 |
> + *  +------+------+------+------+------+-----+------+------+
> + *
> + *  +-----------------------------------+
> + *  |START FRAME 32bits                 |
> + *  +--------+--------+--------+--------+
> + *  |00000000|00000000|00000000|00000000|
> + *  +--------+--------+--------+--------+
> + *
> + *  +------------------------------------+
> + *  |LED  FRAME 32bits                   |
> + *  +---+-----+--------+--------+--------+
> + *  |111|LUMA |  BLUE  | GREEN  |  RED   |
> + *  +---+-----+--------+--------+--------+
> + *  |3b |5bits| 8bits  | 8bits  | 8bits  |
> + *  +---+-----+--------+--------+--------+
> + *  |MSB   LSB|MSB  LSB|MSB  LSB|MSB  LSB|
> + *  +---+-----+--------+--------+--------+
> + *
> + *  +-----------------------------------+
> + *  |END FRAME 32bits                   |
> + *  +--------+--------+--------+--------+
> + *  |11111111|11111111|11111111|11111111|
> + *  +--------+--------+--------+--------+
> + */
> +
> +/* apa102c default settings */
> +#define CR_MAX_BRIGHTNESS	GENMASK(7, 0)
> +#define LM_MAX_BRIGHTNESS	GENMASK(4, 0)
> +#define CH_NUM			4
> +#define START_BYTE		0
> +#define END_BYTE		GENMASK(7, 0)
> +#define LED_FRAME_HEADER	GENMASK(7, 5)
> +
> +enum led_channels {
> +	RED,
> +	GREEN,
> +	BLUE,
> +	LUMA,
> +};
> +
> +struct apa102c_led {
> +	char			name[LED_MAX_NAME_SIZE];
> +	struct apa102c		*priv;
> +	struct led_classdev	ldev;
> +	u8			brightness;

Please drop this one, struct led_classdev already holds brightness
value.

> +};
> +
> +struct apa102c {
> +	size_t			led_count;
> +	struct device		*dev;
> +	struct mutex		lock;
> +	struct spi_device	*spi;
> +	u8			*buf;
> +	struct apa102c_led	leds[];
> +};
> +
> +static int apa102c_sync(struct apa102c *priv)
> +{
> +	int	ret;
> +	size_t	i;
> +	size_t	bytes = 0;
> +
> +	for (i = 0; i < 4; i++)
> +		priv->buf[bytes++] = START_BYTE;
> +
> +	for (i = 0; i < priv->led_count; i++) {
> +		priv->buf[bytes++] = LED_FRAME_HEADER |
> +				     priv->leds[i * CH_NUM + LUMA].brightness;
> +		priv->buf[bytes++] = priv->leds[i * CH_NUM + BLUE].brightness;
> +		priv->buf[bytes++] = priv->leds[i * CH_NUM + GREEN].brightness;
> +		priv->buf[bytes++] = priv->leds[i * CH_NUM + RED].brightness;

This is odd. You create separate LED class device for each color anyway,
so this seems pointless. We have pending LED multi color framework patch
set, as Dan mentioned, so you could try to use it. If you want to have
the patch set accepted quicker then just set brightness for one LED at
a time. You will be able to add LED multicolor class support later when
it will be ready.

> +	}
> +
> +	for (i = 0; i < 4; i++)
> +		priv->buf[bytes++] = END_BYTE;
> +
> +	ret = spi_write(priv->spi, priv->buf, bytes);
> +
> +	return ret;
> +}
> +
> +static int apa102c_set_sync(struct led_classdev *ldev,
> +			   enum led_brightness brightness)
> +{
> +	int			ret;
> +	struct apa102c_led	*led = container_of(ldev,
> +						    struct apa102c_led,
> +						    ldev);
> +
> +	dev_dbg(led->priv->dev, "Set brightness of %s to %d\n",
> +		led->name, brightness);
> +
> +	mutex_lock(&led->priv->lock);
> +	led->brightness = (u8)brightness;
> +	ret = apa102c_sync(led->priv);
> +	mutex_unlock(&led->priv->lock);
> +
> +	return ret;
> +}
> +
> +static int apa102c_probe_dt(struct apa102c *priv)
> +{
> +	u32			i = 0;
> +	int			j = 0;
> +	struct apa102c_led	*led;
> +	struct fwnode_handle	*child;
> +	struct device_node	*np;
> +	int			ret;
> +	int			use_index;
> +	const char		*str;
> +	static const char	* const rgb_name[] = {"red",
> +						      "green",
> +						      "blue",
> +						      "luma"};

We have LED_COLOR_ID* definitions in dt-bindings/leds/common.h
for red, green and blue. And regarding "luma" - what is specificity
of that one? If neither of existing definitions fits for it then
you are welcome to submit a patch adding LED_COLOR_ID_LUMA.

> +
> +	device_for_each_child_node(priv->dev, child) {
> +		np = to_of_node(child);
> +
> +		ret = fwnode_property_read_u32(child, "reg", &i);
> +		if (ret)
> +			return ret;
> +
> +		if (i >= priv->led_count)
> +			return -EINVAL;
> +
> +		/* use the index to create the name if the label is not set */
> +		use_index = fwnode_property_read_string(child, "label", &str);
> +
> +		/* for each physical LED, 4 LEDs are created representing
> +		 * the 4 components: red, green, blue and global luma.
> +		 */
> +		for (j = 0; j < CH_NUM; j++) {
> +			led = &priv->leds[i * CH_NUM + j];
> +
> +			if (use_index)
> +				snprintf(led->name, sizeof(led->name),
> +					 "apa102c:%s:%d", rgb_name[j], i);
> +			else
> +				snprintf(led->name, sizeof(led->name),
> +					 "apa102c:%s:%s", rgb_name[j], str);

LED core already handles LED name composition. Please refer to existing
LED class drivers that use devm_led_classdev_register_ext() API and use
it in your driver.

> +
> +			fwnode_property_read_string(child,
> +						    "linux,default-trigger",
> +						    &led->ldev.default_trigger);
> +
> +			led->priv			 = priv;
> +			led->ldev.name			 = led->name;
> +			if (j == LUMA) {
> +				led->ldev.brightness	 = led->brightness

What do you want to achieve here?

> +							 = LM_MAX_BRIGHTNESS;
> +				led->ldev.max_brightness = LM_MAX_BRIGHTNESS;
> +			} else {
> +				led->ldev.brightness	 = led->brightness
> +							 = 0;
> +				led->ldev.max_brightness = CR_MAX_BRIGHTNESS;
> +			}
> +
> +			led->ldev.brightness_set_blocking = apa102c_set_sync;
> +
> +			ret = devm_led_classdev_register(priv->dev, &led->ldev);

As mentioned above - new *ext API will make your life easier.

> +			if (ret) {
> +				dev_err(priv->dev,
> +					"failed to register LED %s, err %d",
> +					led->name, ret);
> +				fwnode_handle_put(child);
> +				return ret;
> +			}
> +
> +			led->ldev.dev->of_node = np;
> +
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int apa102c_probe(struct spi_device *spi)
> +{
> +	struct apa102c	*priv;
> +	size_t		led_count;
> +	int		ret;
> +
> +	led_count = device_get_child_node_count(&spi->dev);
> +	if (!led_count) {
> +		dev_err(&spi->dev, "No LEDs defined in device tree!");
> +		return -ENODEV;
> +	}
> +
> +	priv = devm_kzalloc(&spi->dev,
> +			    struct_size(priv, leds, led_count * CH_NUM),
> +			    GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->buf = devm_kzalloc(&spi->dev, led_count * CH_NUM + 8, GFP_KERNEL);
> +	if (!priv->buf)
> +		return -ENOMEM;
> +
> +	mutex_init(&priv->lock);
> +	priv->led_count	= led_count;
> +	priv->dev	= &spi->dev;
> +	priv->spi	= spi;
> +
> +	ret = apa102c_probe_dt(priv);
> +	if (ret)
> +		return ret;
> +
> +	/* Set the LEDs with default values at start */
> +	apa102c_sync(priv);
> +	if (ret)
> +		return ret;
> +
> +	spi_set_drvdata(spi, priv);
> +
> +	return 0;
> +}
> +
> +static int apa102c_remove(struct spi_device *spi)
> +{
> +	struct apa102c *priv = spi_get_drvdata(spi);
> +
> +	mutex_destroy(&priv->lock);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id apa102c_dt_ids[] = {
> +	{ .compatible = "shiji,apa102c", },
> +	{},
> +};
> +
> +MODULE_DEVICE_TABLE(of, apa102c_dt_ids);
> +
> +static struct spi_driver apa102c_driver = {
> +	.probe		= apa102c_probe,
> +	.remove		= apa102c_remove,
> +	.driver = {
> +		.name		= KBUILD_MODNAME,
> +		.of_match_table	= apa102c_dt_ids,
> +	},
> +};
> +
> +module_spi_driver(apa102c_driver);
> +
> +MODULE_AUTHOR("Nicolas Belin <nbelin@baylibre.com>");
> +MODULE_DESCRIPTION("apa102c LED driver");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("spi:apa102c");
> 

-- 
Best regards,
Jacek Anaszewski
