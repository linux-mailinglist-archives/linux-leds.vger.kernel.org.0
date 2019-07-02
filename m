Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 608215CE0A
	for <lists+linux-leds@lfdr.de>; Tue,  2 Jul 2019 13:00:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725858AbfGBLAI (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 2 Jul 2019 07:00:08 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:37250 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725767AbfGBLAH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 2 Jul 2019 07:00:07 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x62AxvvU029361;
        Tue, 2 Jul 2019 05:59:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1562065197;
        bh=CCDyBlchKQUNLZy4YuJIfjqXr+CRxvVcBqTPhxg7wrM=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=P9n/3E0mUEX3DmGp2fFy7bzfV48YR4UL0DZuoWjZYUAcp0/B48qwJf7visdv79lpd
         /q9z3e4fdg3CwJMttpTz3sBr21Xjo4vCzyIgiYnEGRDkEEr81RddQORCSXKpDUJdlm
         6yBJogoUW0Ygo9JSq/nqkCeVDGI2cecdH2osVJ8M=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x62AxulH000350
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 2 Jul 2019 05:59:57 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 2 Jul
 2019 05:59:56 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 2 Jul 2019 05:59:56 -0500
Received: from [10.250.97.31] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x62AxsFr013069;
        Tue, 2 Jul 2019 05:59:54 -0500
Subject: Re: [PATCH 3/4] backlight: add led-backlight driver
To:     Daniel Thompson <daniel.thompson@linaro.org>
CC:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <lee.jones@linaro.org>,
        <jingoohan1@gmail.com>, <dmurphy@ti.com>,
        <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <tomi.valkeinen@ti.com>
References: <20190701151423.30768-1-jjhiblot@ti.com>
 <20190701151423.30768-4-jjhiblot@ti.com>
 <20190702095434.d426lichmaffz7a5@holly.lan>
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
Message-ID: <531e237c-b570-5270-6fc3-6629a8bf7acd@ti.com>
Date:   Tue, 2 Jul 2019 12:59:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190702095434.d426lichmaffz7a5@holly.lan>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Daniel,

On 02/07/2019 11:54, Daniel Thompson wrote:
> On Mon, Jul 01, 2019 at 05:14:22PM +0200, Jean-Jacques Hiblot wrote:
>> From: Tomi Valkeinen <tomi.valkeinen@ti.com>
>>
>> This patch adds a led-backlight driver (led_bl), which is mostly similar to
>> pwm_bl except the driver uses a LED class driver to adjust the brightness
>> in the HW.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
>> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
>> ---
>>   drivers/video/backlight/Kconfig  |   7 +
>>   drivers/video/backlight/Makefile |   1 +
>>   drivers/video/backlight/led_bl.c | 217 +++++++++++++++++++++++++++++++
>>   3 files changed, 225 insertions(+)
>>   create mode 100644 drivers/video/backlight/led_bl.c
>>
>> diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
>> index 8b081d61773e..585a1787618c 100644
>> --- a/drivers/video/backlight/Kconfig
>> +++ b/drivers/video/backlight/Kconfig
>> @@ -458,6 +458,13 @@ config BACKLIGHT_RAVE_SP
>>   	help
>>   	  Support for backlight control on RAVE SP device.
>>   
>> +config BACKLIGHT_LED
>> +	tristate "Generic LED based Backlight Driver"
>> +	depends on LEDS_CLASS && OF
>> +	help
>> +	  If you have a LCD backlight adjustable by LED class driver, say Y
>> +	  to enable this driver.
>> +
>>   endif # BACKLIGHT_CLASS_DEVICE
>>   
>>   endmenu
>> diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
>> index 63c507c07437..2a67642966a5 100644
>> --- a/drivers/video/backlight/Makefile
>> +++ b/drivers/video/backlight/Makefile
>> @@ -57,3 +57,4 @@ obj-$(CONFIG_BACKLIGHT_TPS65217)	+= tps65217_bl.o
>>   obj-$(CONFIG_BACKLIGHT_WM831X)		+= wm831x_bl.o
>>   obj-$(CONFIG_BACKLIGHT_ARCXCNN) 	+= arcxcnn_bl.o
>>   obj-$(CONFIG_BACKLIGHT_RAVE_SP)		+= rave-sp-backlight.o
>> +obj-$(CONFIG_BACKLIGHT_LED)		+= led_bl.o
>> diff --git a/drivers/video/backlight/led_bl.c b/drivers/video/backlight/led_bl.c
>> new file mode 100644
>> index 000000000000..e699924cc2bc
>> --- /dev/null
>> +++ b/drivers/video/backlight/led_bl.c
>> @@ -0,0 +1,217 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) 2015-2018 Texas Instruments Incorporated -  http://www.ti.com/
>> + * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
>> + *
>> + * Based on pwm_bl.c
>> + */
>> +
>> +#include <linux/backlight.h>
>> +#include <linux/gpio/consumer.h>
>> +#include <linux/leds.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regulator/consumer.h>
>> +#include <linux/slab.h>
>> +
>> +struct led_bl_data {
>> +	struct device		*dev;
>> +	struct backlight_device	*bl_dev;
>> +
>> +	unsigned int		*levels;
>> +	bool			enabled;
>> +	struct regulator	*power_supply;
>> +	struct gpio_desc	*enable_gpio;
> For the PWM driver the power_supply and enable_gpio are part of managing
> a dumb LED driver device that is downstream of the PWM.
>
> What is their purpose when we wrap an LED device? Put another why why isn't
> the LED device driver responsible for this?

This question came up when the patch was first proposed in 2015. Here is 
the answer from Tomi at the time. It is still relevant.

"These are for the backlight, not for the LED chip. So "LED" here is a
chip that produces (most likely) a PWM signal, and "backlight" is the
collection of components that use the PWM to produce the backlight
itself, and use the power-supply and gpios."
  

>
>> +
>> +	struct led_classdev *led_cdev;
>> +
>> +	unsigned int max_brightness;
>> +	unsigned int default_brightness;
>> +};
>> +
>> +static void led_bl_set_brightness(struct led_bl_data *priv, int brightness)
>> +{
>> +	int err;
>> +
>> +	if (!priv->enabled) {
>> +		err = regulator_enable(priv->power_supply);
>> +		if (err < 0)
>> +			dev_err(priv->dev, "failed to enable power supply\n");
>> +
>> +		if (priv->enable_gpio)
>> +			gpiod_set_value_cansleep(priv->enable_gpio, 1);
>> +	}
>> +
>> +	led_set_brightness(priv->led_cdev, priv->levels[brightness]);
>> +
>> +	priv->enabled = true;
>> +}
>> +
>> +static void led_bl_power_off(struct led_bl_data *priv)
>> +{
>> +	if (!priv->enabled)
>> +		return;
>> +
>> +	led_set_brightness(priv->led_cdev, LED_OFF);
>> +
>> +	if (priv->enable_gpio)
>> +		gpiod_set_value_cansleep(priv->enable_gpio, 0);
>> +
>> +	regulator_disable(priv->power_supply);
>> +
>> +	priv->enabled = false;
>> +}
>> +
>> +static int led_bl_update_status(struct backlight_device *bl)
>> +{
>> +	struct led_bl_data *priv = bl_get_data(bl);
>> +	int brightness = bl->props.brightness;
>> +
>> +	if (bl->props.power != FB_BLANK_UNBLANK ||
>> +	    bl->props.fb_blank != FB_BLANK_UNBLANK ||
>> +	    bl->props.state & BL_CORE_FBBLANK)
>> +		brightness = 0;
>> +
>> +	if (brightness > 0)
>> +		led_bl_set_brightness(priv, brightness);
>> +	else
>> +		led_bl_power_off(priv);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct backlight_ops led_bl_ops = {
>> +	.update_status	= led_bl_update_status,
>> +};
>> +
>> +static int led_bl_parse_dt(struct device *dev,
>> +			   struct led_bl_data *priv)
>> +{
>> +	struct device_node *node = dev->of_node;
>> +	int num_levels;
>> +	u32 *levels;
>> +	u32 value;
>> +	int ret;
>> +
>> +	if (!node)
>> +		return -ENODEV;
>> +
>> +	num_levels = of_property_count_u32_elems(node, "brightness-levels");
> Is there any reason that this function cannot use the (more generic)
> device property API throughout this function?

No reason. The code is a bit old, and can do with an update.

Are you thinking of of_property_read_u32_array(), or another function ?

JJ

>
>
>
> Daniel.
>
>
>> +	if (num_levels < 0)
>> +		return num_levels;
>> +
>> +	levels = devm_kzalloc(dev, sizeof(u32) * num_levels, GFP_KERNEL);
>> +	if (!levels)
>> +		return -ENOMEM;
>> +
>> +	ret = of_property_read_u32_array(node, "brightness-levels",
>> +					 levels,
>> +					 num_levels);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	ret = of_property_read_u32(node, "default-brightness-level", &value);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	if (value >= num_levels) {
>> +		dev_err(dev, "invalid default-brightness-level\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	priv->levels = levels;
>> +	priv->max_brightness = num_levels - 1;
>> +	priv->default_brightness = value;
>> +
>> +	return 0;
>> +}
>> +
>> +static int led_bl_probe(struct platform_device *pdev)
>> +{
>> +	struct backlight_properties props;
>> +	struct led_bl_data *priv;
>> +	int ret;
>> +
>> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
>> +	if (!priv)
>> +		return -ENOMEM;
>> +
>> +	platform_set_drvdata(pdev, priv);
>> +
>> +	priv->dev = &pdev->dev;
>> +	priv->led_cdev = to_led_classdev(pdev->dev.parent);
>> +
>> +	ret = led_bl_parse_dt(&pdev->dev, priv);
>> +	if (ret < 0) {
>> +		if (ret != -EPROBE_DEFER)
>> +			dev_err(&pdev->dev, "failed to parse DT data\n");
>> +		return ret;
>> +	}
>> +
>> +	priv->enable_gpio = devm_gpiod_get_optional(&pdev->dev, "enable",
>> +			    GPIOD_OUT_LOW);
>> +	if (IS_ERR(priv->enable_gpio)) {
>> +		ret = PTR_ERR(priv->enable_gpio);
>> +		goto err;
>> +	}
>> +
>> +	priv->power_supply = devm_regulator_get(&pdev->dev, "power");
>> +	if (IS_ERR(priv->power_supply)) {
>> +		ret = PTR_ERR(priv->power_supply);
>> +		goto err;
>> +	}
>> +
>> +	memset(&props, 0, sizeof(struct backlight_properties));
>> +	props.type = BACKLIGHT_RAW;
>> +	props.max_brightness = priv->max_brightness;
>> +	priv->bl_dev = backlight_device_register(dev_name(&pdev->dev),
>> +			&pdev->dev, priv, &led_bl_ops, &props);
>> +	if (IS_ERR(priv->bl_dev)) {
>> +		dev_err(&pdev->dev, "failed to register backlight\n");
>> +		ret = PTR_ERR(priv->bl_dev);
>> +		goto err;
>> +	}
>> +
>> +	priv->bl_dev->props.brightness = priv->default_brightness;
>> +	backlight_update_status(priv->bl_dev);
>> +
>> +	return 0;
>> +
>> +err:
>> +
>> +	return ret;
>> +}
>> +
>> +static int led_bl_remove(struct platform_device *pdev)
>> +{
>> +	struct led_bl_data *priv = platform_get_drvdata(pdev);
>> +	struct backlight_device *bl = priv->bl_dev;
>> +
>> +	backlight_device_unregister(bl);
>> +
>> +	led_bl_power_off(priv);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct of_device_id led_bl_of_match[] = {
>> +	{ .compatible = "led-backlight" },
>> +	{ }
>> +};
>> +
>> +MODULE_DEVICE_TABLE(of, led_bl_of_match);
>> +
>> +static struct platform_driver led_bl_driver = {
>> +	.driver		= {
>> +		.name		= "led-backlight",
>> +		.of_match_table	= of_match_ptr(led_bl_of_match),
>> +	},
>> +	.probe		= led_bl_probe,
>> +	.remove		= led_bl_remove,
>> +};
>> +
>> +module_platform_driver(led_bl_driver);
>> +
>> +MODULE_DESCRIPTION("LED based Backlight Driver");
>> +MODULE_LICENSE("GPL");
>> +MODULE_ALIAS("platform:led-backlight");
>> -- 
>> 2.17.1
>>
