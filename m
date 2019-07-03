Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D7E75E138
	for <lists+linux-leds@lfdr.de>; Wed,  3 Jul 2019 11:45:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725796AbfGCJpG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 3 Jul 2019 05:45:06 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:46306 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725847AbfGCJpD (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 3 Jul 2019 05:45:03 -0400
Received: by mail-wr1-f67.google.com with SMTP id n4so1962867wrw.13
        for <linux-leds@vger.kernel.org>; Wed, 03 Jul 2019 02:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XMrfeO8rC6KYy1I7W8ym9ucuIOucZ+jMt5wCTJWnayQ=;
        b=MTCD9X5aO1e/wrry83VsK4FRuKEqSYABz/HICiYZTVfd6LrgiadMAOZeooeZdIwE1x
         3YJ9XJ5rAXJHiW/AJmKhMALwNhQsv/H9ysBNQPD4y7Sn25G4PQtkDfpK1fr+XSGaBmr5
         xn4V26NbBAZFxdMz+r2M1PXcLxpbXey8+dsgmcQZE5hKDUbOZnTatfza7G5T/sSPNi0u
         XzmuRM4olmFtMJCzMpY3ttL421HNUOa63Y2mWn5gmdkdkJzzeRrtOVg8OA5xVQy3VxQe
         XjFGPalptHMfEg94e5v51yuLTPykgWA0eC/YP5kjMtGUqIVfLZysYg3o/1cdg0uABxEe
         61Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XMrfeO8rC6KYy1I7W8ym9ucuIOucZ+jMt5wCTJWnayQ=;
        b=TR0dOonvIBucE+8AbPscV053RyojlPbkstxkfXBTuJ8B/G7DjHLulWEZ3CERqbfIVH
         JgM8Vp5Vlymjdj3jF9jCC9b153dhm19V8fw66N/p6Efg4XfIuuOV0vJR+BDKtLfPffHT
         g4EVnKjzgOSYgegGtdn9I296KcT0vbHBe1rKvv2JTqizmM/qNQCjPKMKyAXkGKK8RCu/
         POgYL58usIUHsO2dIITOXz0uC1TYPCnWqtkXa9PMHq20rQbR7+fcaw9f9N3NihMDcrpO
         MQ/v1HatPo9L880L1YQONvdJItIxaaC1vhaV9ksRmH3X0kEcUOAHryeim1dZ0x+1q++N
         3krg==
X-Gm-Message-State: APjAAAWqj9EVHq6pRNkWJ+iBct5yrJ4iVflrfJ6qsLXhMz7RVtKCzWXY
        6Bj/M79kTKaw3BhYKRXhPccLwg==
X-Google-Smtp-Source: APXvYqycrGz8EdlY79JpVw+u7VFQUlWWluWG45oMIAjnb4RQlLCMwQLW5rxnnk+9E+yRo2cq3pPmpQ==
X-Received: by 2002:adf:f70b:: with SMTP id r11mr2741929wrp.324.1562147099945;
        Wed, 03 Jul 2019 02:44:59 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id p11sm2045357wrm.53.2019.07.03.02.44.58
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 03 Jul 2019 02:44:59 -0700 (PDT)
Date:   Wed, 3 Jul 2019 10:44:57 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Jean-Jacques Hiblot <jjhiblot@ti.com>
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        mark.rutland@arm.com, lee.jones@linaro.org, jingoohan1@gmail.com,
        dmurphy@ti.com, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        tomi.valkeinen@ti.com
Subject: Re: [PATCH 3/4] backlight: add led-backlight driver
Message-ID: <20190703094457.etmbbjhhssbdkveo@holly.lan>
References: <20190701151423.30768-1-jjhiblot@ti.com>
 <20190701151423.30768-4-jjhiblot@ti.com>
 <20190702095434.d426lichmaffz7a5@holly.lan>
 <531e237c-b570-5270-6fc3-6629a8bf7acd@ti.com>
 <20190702130434.frbx7jkec27ejbpo@holly.lan>
 <72c45311-c710-dc2d-a6de-68e44ea8436a@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <72c45311-c710-dc2d-a6de-68e44ea8436a@ti.com>
User-Agent: NeoMutt/20180716
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Jul 02, 2019 at 05:17:21PM +0200, Jean-Jacques Hiblot wrote:
> Daniel,
> 
> On 02/07/2019 15:04, Daniel Thompson wrote:
> > On Tue, Jul 02, 2019 at 12:59:53PM +0200, Jean-Jacques Hiblot wrote:
> > > Hi Daniel,
> > > 
> > > On 02/07/2019 11:54, Daniel Thompson wrote:
> > > > On Mon, Jul 01, 2019 at 05:14:22PM +0200, Jean-Jacques Hiblot wrote:
> > > > > From: Tomi Valkeinen <tomi.valkeinen@ti.com>
> > > > > 
> > > > > This patch adds a led-backlight driver (led_bl), which is mostly similar to
> > > > > pwm_bl except the driver uses a LED class driver to adjust the brightness
> > > > > in the HW.
> > > > > 
> > > > > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> > > > > Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
> > > > > ---
> > > > >    drivers/video/backlight/Kconfig  |   7 +
> > > > >    drivers/video/backlight/Makefile |   1 +
> > > > >    drivers/video/backlight/led_bl.c | 217 +++++++++++++++++++++++++++++++
> > > > >    3 files changed, 225 insertions(+)
> > > > >    create mode 100644 drivers/video/backlight/led_bl.c
> > > > > 
> > > > > diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
> > > > > index 8b081d61773e..585a1787618c 100644
> > > > > --- a/drivers/video/backlight/Kconfig
> > > > > +++ b/drivers/video/backlight/Kconfig
> > > > > @@ -458,6 +458,13 @@ config BACKLIGHT_RAVE_SP
> > > > >    	help
> > > > >    	  Support for backlight control on RAVE SP device.
> > > > > +config BACKLIGHT_LED
> > > > > +	tristate "Generic LED based Backlight Driver"
> > > > > +	depends on LEDS_CLASS && OF
> > > > > +	help
> > > > > +	  If you have a LCD backlight adjustable by LED class driver, say Y
> > > > > +	  to enable this driver.
> > > > > +
> > > > >    endif # BACKLIGHT_CLASS_DEVICE
> > > > >    endmenu
> > > > > diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
> > > > > index 63c507c07437..2a67642966a5 100644
> > > > > --- a/drivers/video/backlight/Makefile
> > > > > +++ b/drivers/video/backlight/Makefile
> > > > > @@ -57,3 +57,4 @@ obj-$(CONFIG_BACKLIGHT_TPS65217)	+= tps65217_bl.o
> > > > >    obj-$(CONFIG_BACKLIGHT_WM831X)		+= wm831x_bl.o
> > > > >    obj-$(CONFIG_BACKLIGHT_ARCXCNN) 	+= arcxcnn_bl.o
> > > > >    obj-$(CONFIG_BACKLIGHT_RAVE_SP)		+= rave-sp-backlight.o
> > > > > +obj-$(CONFIG_BACKLIGHT_LED)		+= led_bl.o
> > > > > diff --git a/drivers/video/backlight/led_bl.c b/drivers/video/backlight/led_bl.c
> > > > > new file mode 100644
> > > > > index 000000000000..e699924cc2bc
> > > > > --- /dev/null
> > > > > +++ b/drivers/video/backlight/led_bl.c
> > > > > @@ -0,0 +1,217 @@
> > > > > +// SPDX-License-Identifier: GPL-2.0
> > > > > +/*
> > > > > + * Copyright (C) 2015-2018 Texas Instruments Incorporated -  http://www.ti.com/
> > > > > + * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
> > > > > + *
> > > > > + * Based on pwm_bl.c
> > > > > + */
> > > > > +
> > > > > +#include <linux/backlight.h>
> > > > > +#include <linux/gpio/consumer.h>
> > > > > +#include <linux/leds.h>
> > > > > +#include <linux/module.h>
> > > > > +#include <linux/platform_device.h>
> > > > > +#include <linux/regulator/consumer.h>
> > > > > +#include <linux/slab.h>
> > > > > +
> > > > > +struct led_bl_data {
> > > > > +	struct device		*dev;
> > > > > +	struct backlight_device	*bl_dev;
> > > > > +
> > > > > +	unsigned int		*levels;
> > > > > +	bool			enabled;
> > > > > +	struct regulator	*power_supply;
> > > > > +	struct gpio_desc	*enable_gpio;
> > > > For the PWM driver the power_supply and enable_gpio are part of managing
> > > > a dumb LED driver device that is downstream of the PWM.
> > > > 
> > > > What is their purpose when we wrap an LED device? Put another why why isn't
> > > > the LED device driver responsible for this?
> > > This question came up when the patch was first proposed in 2015. Here is the
> > > answer from Tomi at the time. It is still relevant.
> > > 
> > > "These are for the backlight, not for the LED chip. So "LED" here is a
> > > chip that produces (most likely) a PWM signal, and "backlight" is the
> > > collection of components that use the PWM to produce the backlight
> > > itself, and use the power-supply and gpios."
> > Expanded significantly in the associated thread, right?
> > https://patchwork.kernel.org/patch/7293991/
> > 
> > Also still relevant is whether the LED device is being correctly
> > modelled if the act of turning on the LED doesn't, in fact, turn the LED
> > on. Is it *really* a correct implementation of an LED device that
> > setting it to LED_FULL using sysfs doesn't cause it to light up?
> 
> What I understood from the discussion between Rob and Tomi is that the
> child-node of the LED controller should be considered a backlight device,
> not a simple LED. I'm not sure if the sysfs interface is still relevant in
> that case. Maybe it should just be disabled by the backlight driver
> (possible with led_sysfs_disable())

led_sysfs_disable() sounds like a sensible change but that's not quite
what I mean.

It is more a thought experiment to see if the power control *should* be
implemented by the backlight. Consider what happens if we *don't*
enable CONFIG_BACKLIGHT_LED in the kernel: we would still have an LED
device and it would not work correctly.

In other words I naively expect turning on an LED using the LED API 
(any of them, sysfs or kernel) to result in the LED turning on.
Implementing a workaround in the client for what appears to be
something missing in the LED driver strikes me as odd. Why shouldn't
the regulator be managed in the LED driver?


> > Actually there is another area where I think an LED backlight should
> > perhaps be held to a higher standard than a PWM backlight and that is
> > handling backlights composed of multiple LEDs.
> > 
> > Using the TLC591xx examples from the thread above... these are
> > multi-channel (8 or 16) LED controllers and I don't think its
> > speculative to assume that a backlight could constructed using
> > one of these could require multiple LEDs.
> 
> In that case, the device-tree model must be quite different.
> 
> Actually the best way to do that is to use the model from Tomi
> https://patchwork.kernel.org/patch/7293991/ and modify it to handle more
> than one LED
> <https://patchwork.kernel.org/patch/7293991/>
> 
> I'm not completely sure that people would start making real backlight this
> way though. It is much more probable that the ouput of the led ctrl is
> connected to a single control input of a real backlight than to actual LEDs.

I'm afraid I don't follow this. If you have a backlight composed of mutliple
strings why wouldn't each string be attached directly to the output an of LED
driver chip such as the TLC591xx family.


Daniel.


> 
> 
> JJ
> 
> > 
> > 
> > Daniel.
> > 
> > 
> > > > > +
> > > > > +	struct led_classdev *led_cdev;
> > > > > +
> > > > > +	unsigned int max_brightness;
> > > > > +	unsigned int default_brightness;
> > > > > +};
> > > > > +
> > > > > +static void led_bl_set_brightness(struct led_bl_data *priv, int brightness)
> > > > > +{
> > > > > +	int err;
> > > > > +
> > > > > +	if (!priv->enabled) {
> > > > > +		err = regulator_enable(priv->power_supply);
> > > > > +		if (err < 0)
> > > > > +			dev_err(priv->dev, "failed to enable power supply\n");
> > > > > +
> > > > > +		if (priv->enable_gpio)
> > > > > +			gpiod_set_value_cansleep(priv->enable_gpio, 1);
> > > > > +	}
> > > > > +
> > > > > +	led_set_brightness(priv->led_cdev, priv->levels[brightness]);
> > > > > +
> > > > > +	priv->enabled = true;
> > > > > +}
> > > > > +
> > > > > +static void led_bl_power_off(struct led_bl_data *priv)
> > > > > +{
> > > > > +	if (!priv->enabled)
> > > > > +		return;
> > > > > +
> > > > > +	led_set_brightness(priv->led_cdev, LED_OFF);
> > > > > +
> > > > > +	if (priv->enable_gpio)
> > > > > +		gpiod_set_value_cansleep(priv->enable_gpio, 0);
> > > > > +
> > > > > +	regulator_disable(priv->power_supply);
> > > > > +
> > > > > +	priv->enabled = false;
> > > > > +}
> > > > > +
> > > > > +static int led_bl_update_status(struct backlight_device *bl)
> > > > > +{
> > > > > +	struct led_bl_data *priv = bl_get_data(bl);
> > > > > +	int brightness = bl->props.brightness;
> > > > > +
> > > > > +	if (bl->props.power != FB_BLANK_UNBLANK ||
> > > > > +	    bl->props.fb_blank != FB_BLANK_UNBLANK ||
> > > > > +	    bl->props.state & BL_CORE_FBBLANK)
> > > > > +		brightness = 0;
> > > > > +
> > > > > +	if (brightness > 0)
> > > > > +		led_bl_set_brightness(priv, brightness);
> > > > > +	else
> > > > > +		led_bl_power_off(priv);
> > > > > +
> > > > > +	return 0;
> > > > > +}
> > > > > +
> > > > > +static const struct backlight_ops led_bl_ops = {
> > > > > +	.update_status	= led_bl_update_status,
> > > > > +};
> > > > > +
> > > > > +static int led_bl_parse_dt(struct device *dev,
> > > > > +			   struct led_bl_data *priv)
> > > > > +{
> > > > > +	struct device_node *node = dev->of_node;
> > > > > +	int num_levels;
> > > > > +	u32 *levels;
> > > > > +	u32 value;
> > > > > +	int ret;
> > > > > +
> > > > > +	if (!node)
> > > > > +		return -ENODEV;
> > > > > +
> > > > > +	num_levels = of_property_count_u32_elems(node, "brightness-levels");
> > > > Is there any reason that this function cannot use the (more generic)
> > > > device property API throughout this function?
> > > No reason. The code is a bit old, and can do with an update.
> > > 
> > > Are you thinking of of_property_read_u32_array(), or another function ?
> > > 
> > > JJ
> > > 
> > > > 
> > > > 
> > > > Daniel.
> > > > 
> > > > 
> > > > > +	if (num_levels < 0)
> > > > > +		return num_levels;
> > > > > +
> > > > > +	levels = devm_kzalloc(dev, sizeof(u32) * num_levels, GFP_KERNEL);
> > > > > +	if (!levels)
> > > > > +		return -ENOMEM;
> > > > > +
> > > > > +	ret = of_property_read_u32_array(node, "brightness-levels",
> > > > > +					 levels,
> > > > > +					 num_levels);
> > > > > +	if (ret < 0)
> > > > > +		return ret;
> > > > > +
> > > > > +	ret = of_property_read_u32(node, "default-brightness-level", &value);
> > > > > +	if (ret < 0)
> > > > > +		return ret;
> > > > > +
> > > > > +	if (value >= num_levels) {
> > > > > +		dev_err(dev, "invalid default-brightness-level\n");
> > > > > +		return -EINVAL;
> > > > > +	}
> > > > > +
> > > > > +	priv->levels = levels;
> > > > > +	priv->max_brightness = num_levels - 1;
> > > > > +	priv->default_brightness = value;
> > > > > +
> > > > > +	return 0;
> > > > > +}
> > > > > +
> > > > > +static int led_bl_probe(struct platform_device *pdev)
> > > > > +{
> > > > > +	struct backlight_properties props;
> > > > > +	struct led_bl_data *priv;
> > > > > +	int ret;
> > > > > +
> > > > > +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> > > > > +	if (!priv)
> > > > > +		return -ENOMEM;
> > > > > +
> > > > > +	platform_set_drvdata(pdev, priv);
> > > > > +
> > > > > +	priv->dev = &pdev->dev;
> > > > > +	priv->led_cdev = to_led_classdev(pdev->dev.parent);
> > > > > +
> > > > > +	ret = led_bl_parse_dt(&pdev->dev, priv);
> > > > > +	if (ret < 0) {
> > > > > +		if (ret != -EPROBE_DEFER)
> > > > > +			dev_err(&pdev->dev, "failed to parse DT data\n");
> > > > > +		return ret;
> > > > > +	}
> > > > > +
> > > > > +	priv->enable_gpio = devm_gpiod_get_optional(&pdev->dev, "enable",
> > > > > +			    GPIOD_OUT_LOW);
> > > > > +	if (IS_ERR(priv->enable_gpio)) {
> > > > > +		ret = PTR_ERR(priv->enable_gpio);
> > > > > +		goto err;
> > > > > +	}
> > > > > +
> > > > > +	priv->power_supply = devm_regulator_get(&pdev->dev, "power");
> > > > > +	if (IS_ERR(priv->power_supply)) {
> > > > > +		ret = PTR_ERR(priv->power_supply);
> > > > > +		goto err;
> > > > > +	}
> > > > > +
> > > > > +	memset(&props, 0, sizeof(struct backlight_properties));
> > > > > +	props.type = BACKLIGHT_RAW;
> > > > > +	props.max_brightness = priv->max_brightness;
> > > > > +	priv->bl_dev = backlight_device_register(dev_name(&pdev->dev),
> > > > > +			&pdev->dev, priv, &led_bl_ops, &props);
> > > > > +	if (IS_ERR(priv->bl_dev)) {
> > > > > +		dev_err(&pdev->dev, "failed to register backlight\n");
> > > > > +		ret = PTR_ERR(priv->bl_dev);
> > > > > +		goto err;
> > > > > +	}
> > > > > +
> > > > > +	priv->bl_dev->props.brightness = priv->default_brightness;
> > > > > +	backlight_update_status(priv->bl_dev);
> > > > > +
> > > > > +	return 0;
> > > > > +
> > > > > +err:
> > > > > +
> > > > > +	return ret;
> > > > > +}
> > > > > +
> > > > > +static int led_bl_remove(struct platform_device *pdev)
> > > > > +{
> > > > > +	struct led_bl_data *priv = platform_get_drvdata(pdev);
> > > > > +	struct backlight_device *bl = priv->bl_dev;
> > > > > +
> > > > > +	backlight_device_unregister(bl);
> > > > > +
> > > > > +	led_bl_power_off(priv);
> > > > > +
> > > > > +	return 0;
> > > > > +}
> > > > > +
> > > > > +static const struct of_device_id led_bl_of_match[] = {
> > > > > +	{ .compatible = "led-backlight" },
> > > > > +	{ }
> > > > > +};
> > > > > +
> > > > > +MODULE_DEVICE_TABLE(of, led_bl_of_match);
> > > > > +
> > > > > +static struct platform_driver led_bl_driver = {
> > > > > +	.driver		= {
> > > > > +		.name		= "led-backlight",
> > > > > +		.of_match_table	= of_match_ptr(led_bl_of_match),
> > > > > +	},
> > > > > +	.probe		= led_bl_probe,
> > > > > +	.remove		= led_bl_remove,
> > > > > +};
> > > > > +
> > > > > +module_platform_driver(led_bl_driver);
> > > > > +
> > > > > +MODULE_DESCRIPTION("LED based Backlight Driver");
> > > > > +MODULE_LICENSE("GPL");
> > > > > +MODULE_ALIAS("platform:led-backlight");
> > > > > -- 
> > > > > 2.17.1
> > > > > 
