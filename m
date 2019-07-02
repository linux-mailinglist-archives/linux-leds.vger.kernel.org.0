Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B90B5CFFC
	for <lists+linux-leds@lfdr.de>; Tue,  2 Jul 2019 15:04:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726702AbfGBNEk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 2 Jul 2019 09:04:40 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:45972 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725922AbfGBNEj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 2 Jul 2019 09:04:39 -0400
Received: by mail-wr1-f66.google.com with SMTP id f9so17693700wre.12
        for <linux-leds@vger.kernel.org>; Tue, 02 Jul 2019 06:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Fyfau+RlzEIjiOFOStTWiAtmi5R3duGRP2/XKV3vjcg=;
        b=Q9m0RigwufA/kGsLQJI0fkkOnWmhnfJTEjpDZlSyRzwaAj4sklnFNN2D6KURtd95sj
         g256NtY3DWpYFRBKhA/r7M8EzDBctjvhFBU72OIlIbFcNxO/xgNS0Z54/8wBLecfvFSH
         zjd4UQV3vka+v/IdhyKeTI8Yn6uv9WYKndONyh2JvMKA9wSNzKz6V1+91aXFoiwXuJX5
         BBEforocXRtj1MkTS3v6DNTxYejZqVpW6yDgVukPXOFc8GaE+LqRmeXanDD1XjDAG8H0
         hcfYbOhSFKgXkLZMpSs0abx02P6R+npZZs0OlDzDh4HixAlv4Z98CPabg5hRpdqPzHp1
         OmqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Fyfau+RlzEIjiOFOStTWiAtmi5R3duGRP2/XKV3vjcg=;
        b=PDbvQeRG6DH9Uajzwe/FU7fKCgEFsl5GCgA+83+N73ZNam7pjQQ4PUo/K/YH6FeyjW
         ddG0hRdvBRZeuelFd4oRetDwwJqZuJd47JC6T73bCdsaj1dhth9qC/DBGj3HSmzuR3Cn
         h4xniW6Buo87qVCLqZw6jXP8PgIr61ydlh9x5d+zvraU2zhkrX2jAFZWrI4UN7oK5jYy
         3vW4mmGpxx69jSeOqiVDLz/PAFPxX6piilHTabjgNCBNteybYI3YyIrDRouXKaP+ejs+
         VsHTHTd7CndwpdXYnaT7XTo3j+987x7pE6jIcm8CorCI2eaHf0YGiCrpASsl171QIquf
         ySHQ==
X-Gm-Message-State: APjAAAWxHsvEHyKjF3ljykSOJ+Kzided2oGp+8/Ra6sD3TpzVsE/OIpe
        y/w9BmLcv/Mv2pWnz+npN+8Opw==
X-Google-Smtp-Source: APXvYqweXfqoN6Yw+yoq1IDRapWzMa/djQd3FxSWAOVcXvsFqW142XyKr3IEcpUJKiOUtdt46i1Yxg==
X-Received: by 2002:a5d:4647:: with SMTP id j7mr25280508wrs.334.1562072676691;
        Tue, 02 Jul 2019 06:04:36 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id x6sm15718993wru.0.2019.07.02.06.04.35
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 02 Jul 2019 06:04:35 -0700 (PDT)
Date:   Tue, 2 Jul 2019 14:04:34 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Jean-Jacques Hiblot <jjhiblot@ti.com>
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        mark.rutland@arm.com, lee.jones@linaro.org, jingoohan1@gmail.com,
        dmurphy@ti.com, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        tomi.valkeinen@ti.com
Subject: Re: [PATCH 3/4] backlight: add led-backlight driver
Message-ID: <20190702130434.frbx7jkec27ejbpo@holly.lan>
References: <20190701151423.30768-1-jjhiblot@ti.com>
 <20190701151423.30768-4-jjhiblot@ti.com>
 <20190702095434.d426lichmaffz7a5@holly.lan>
 <531e237c-b570-5270-6fc3-6629a8bf7acd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <531e237c-b570-5270-6fc3-6629a8bf7acd@ti.com>
User-Agent: NeoMutt/20180716
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Jul 02, 2019 at 12:59:53PM +0200, Jean-Jacques Hiblot wrote:
> Hi Daniel,
> 
> On 02/07/2019 11:54, Daniel Thompson wrote:
> > On Mon, Jul 01, 2019 at 05:14:22PM +0200, Jean-Jacques Hiblot wrote:
> > > From: Tomi Valkeinen <tomi.valkeinen@ti.com>
> > > 
> > > This patch adds a led-backlight driver (led_bl), which is mostly similar to
> > > pwm_bl except the driver uses a LED class driver to adjust the brightness
> > > in the HW.
> > > 
> > > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> > > Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
> > > ---
> > >   drivers/video/backlight/Kconfig  |   7 +
> > >   drivers/video/backlight/Makefile |   1 +
> > >   drivers/video/backlight/led_bl.c | 217 +++++++++++++++++++++++++++++++
> > >   3 files changed, 225 insertions(+)
> > >   create mode 100644 drivers/video/backlight/led_bl.c
> > > 
> > > diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
> > > index 8b081d61773e..585a1787618c 100644
> > > --- a/drivers/video/backlight/Kconfig
> > > +++ b/drivers/video/backlight/Kconfig
> > > @@ -458,6 +458,13 @@ config BACKLIGHT_RAVE_SP
> > >   	help
> > >   	  Support for backlight control on RAVE SP device.
> > > +config BACKLIGHT_LED
> > > +	tristate "Generic LED based Backlight Driver"
> > > +	depends on LEDS_CLASS && OF
> > > +	help
> > > +	  If you have a LCD backlight adjustable by LED class driver, say Y
> > > +	  to enable this driver.
> > > +
> > >   endif # BACKLIGHT_CLASS_DEVICE
> > >   endmenu
> > > diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
> > > index 63c507c07437..2a67642966a5 100644
> > > --- a/drivers/video/backlight/Makefile
> > > +++ b/drivers/video/backlight/Makefile
> > > @@ -57,3 +57,4 @@ obj-$(CONFIG_BACKLIGHT_TPS65217)	+= tps65217_bl.o
> > >   obj-$(CONFIG_BACKLIGHT_WM831X)		+= wm831x_bl.o
> > >   obj-$(CONFIG_BACKLIGHT_ARCXCNN) 	+= arcxcnn_bl.o
> > >   obj-$(CONFIG_BACKLIGHT_RAVE_SP)		+= rave-sp-backlight.o
> > > +obj-$(CONFIG_BACKLIGHT_LED)		+= led_bl.o
> > > diff --git a/drivers/video/backlight/led_bl.c b/drivers/video/backlight/led_bl.c
> > > new file mode 100644
> > > index 000000000000..e699924cc2bc
> > > --- /dev/null
> > > +++ b/drivers/video/backlight/led_bl.c
> > > @@ -0,0 +1,217 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Copyright (C) 2015-2018 Texas Instruments Incorporated -  http://www.ti.com/
> > > + * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
> > > + *
> > > + * Based on pwm_bl.c
> > > + */
> > > +
> > > +#include <linux/backlight.h>
> > > +#include <linux/gpio/consumer.h>
> > > +#include <linux/leds.h>
> > > +#include <linux/module.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/regulator/consumer.h>
> > > +#include <linux/slab.h>
> > > +
> > > +struct led_bl_data {
> > > +	struct device		*dev;
> > > +	struct backlight_device	*bl_dev;
> > > +
> > > +	unsigned int		*levels;
> > > +	bool			enabled;
> > > +	struct regulator	*power_supply;
> > > +	struct gpio_desc	*enable_gpio;
> > For the PWM driver the power_supply and enable_gpio are part of managing
> > a dumb LED driver device that is downstream of the PWM.
> > 
> > What is their purpose when we wrap an LED device? Put another why why isn't
> > the LED device driver responsible for this?
> 
> This question came up when the patch was first proposed in 2015. Here is the
> answer from Tomi at the time. It is still relevant.
> 
> "These are for the backlight, not for the LED chip. So "LED" here is a
> chip that produces (most likely) a PWM signal, and "backlight" is the
> collection of components that use the PWM to produce the backlight
> itself, and use the power-supply and gpios."

Expanded significantly in the associated thread, right?
https://patchwork.kernel.org/patch/7293991/

Also still relevant is whether the LED device is being correctly
modelled if the act of turning on the LED doesn't, in fact, turn the LED
on. Is it *really* a correct implementation of an LED device that
setting it to LED_FULL using sysfs doesn't cause it to light up?

Actually there is another area where I think an LED backlight should
perhaps be held to a higher standard than a PWM backlight and that is
handling backlights composed of multiple LEDs.

Using the TLC591xx examples from the thread above... these are
multi-channel (8 or 16) LED controllers and I don't think its
speculative to assume that a backlight could constructed using
one of these could require multiple LEDs.


Daniel.


> 
> > 
> > > +
> > > +	struct led_classdev *led_cdev;
> > > +
> > > +	unsigned int max_brightness;
> > > +	unsigned int default_brightness;
> > > +};
> > > +
> > > +static void led_bl_set_brightness(struct led_bl_data *priv, int brightness)
> > > +{
> > > +	int err;
> > > +
> > > +	if (!priv->enabled) {
> > > +		err = regulator_enable(priv->power_supply);
> > > +		if (err < 0)
> > > +			dev_err(priv->dev, "failed to enable power supply\n");
> > > +
> > > +		if (priv->enable_gpio)
> > > +			gpiod_set_value_cansleep(priv->enable_gpio, 1);
> > > +	}
> > > +
> > > +	led_set_brightness(priv->led_cdev, priv->levels[brightness]);
> > > +
> > > +	priv->enabled = true;
> > > +}
> > > +
> > > +static void led_bl_power_off(struct led_bl_data *priv)
> > > +{
> > > +	if (!priv->enabled)
> > > +		return;
> > > +
> > > +	led_set_brightness(priv->led_cdev, LED_OFF);
> > > +
> > > +	if (priv->enable_gpio)
> > > +		gpiod_set_value_cansleep(priv->enable_gpio, 0);
> > > +
> > > +	regulator_disable(priv->power_supply);
> > > +
> > > +	priv->enabled = false;
> > > +}
> > > +
> > > +static int led_bl_update_status(struct backlight_device *bl)
> > > +{
> > > +	struct led_bl_data *priv = bl_get_data(bl);
> > > +	int brightness = bl->props.brightness;
> > > +
> > > +	if (bl->props.power != FB_BLANK_UNBLANK ||
> > > +	    bl->props.fb_blank != FB_BLANK_UNBLANK ||
> > > +	    bl->props.state & BL_CORE_FBBLANK)
> > > +		brightness = 0;
> > > +
> > > +	if (brightness > 0)
> > > +		led_bl_set_brightness(priv, brightness);
> > > +	else
> > > +		led_bl_power_off(priv);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static const struct backlight_ops led_bl_ops = {
> > > +	.update_status	= led_bl_update_status,
> > > +};
> > > +
> > > +static int led_bl_parse_dt(struct device *dev,
> > > +			   struct led_bl_data *priv)
> > > +{
> > > +	struct device_node *node = dev->of_node;
> > > +	int num_levels;
> > > +	u32 *levels;
> > > +	u32 value;
> > > +	int ret;
> > > +
> > > +	if (!node)
> > > +		return -ENODEV;
> > > +
> > > +	num_levels = of_property_count_u32_elems(node, "brightness-levels");
> > Is there any reason that this function cannot use the (more generic)
> > device property API throughout this function?
> 
> No reason. The code is a bit old, and can do with an update.
> 
> Are you thinking of of_property_read_u32_array(), or another function ?
> 
> JJ
> 
> > 
> > 
> > 
> > Daniel.
> > 
> > 
> > > +	if (num_levels < 0)
> > > +		return num_levels;
> > > +
> > > +	levels = devm_kzalloc(dev, sizeof(u32) * num_levels, GFP_KERNEL);
> > > +	if (!levels)
> > > +		return -ENOMEM;
> > > +
> > > +	ret = of_property_read_u32_array(node, "brightness-levels",
> > > +					 levels,
> > > +					 num_levels);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	ret = of_property_read_u32(node, "default-brightness-level", &value);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	if (value >= num_levels) {
> > > +		dev_err(dev, "invalid default-brightness-level\n");
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	priv->levels = levels;
> > > +	priv->max_brightness = num_levels - 1;
> > > +	priv->default_brightness = value;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int led_bl_probe(struct platform_device *pdev)
> > > +{
> > > +	struct backlight_properties props;
> > > +	struct led_bl_data *priv;
> > > +	int ret;
> > > +
> > > +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> > > +	if (!priv)
> > > +		return -ENOMEM;
> > > +
> > > +	platform_set_drvdata(pdev, priv);
> > > +
> > > +	priv->dev = &pdev->dev;
> > > +	priv->led_cdev = to_led_classdev(pdev->dev.parent);
> > > +
> > > +	ret = led_bl_parse_dt(&pdev->dev, priv);
> > > +	if (ret < 0) {
> > > +		if (ret != -EPROBE_DEFER)
> > > +			dev_err(&pdev->dev, "failed to parse DT data\n");
> > > +		return ret;
> > > +	}
> > > +
> > > +	priv->enable_gpio = devm_gpiod_get_optional(&pdev->dev, "enable",
> > > +			    GPIOD_OUT_LOW);
> > > +	if (IS_ERR(priv->enable_gpio)) {
> > > +		ret = PTR_ERR(priv->enable_gpio);
> > > +		goto err;
> > > +	}
> > > +
> > > +	priv->power_supply = devm_regulator_get(&pdev->dev, "power");
> > > +	if (IS_ERR(priv->power_supply)) {
> > > +		ret = PTR_ERR(priv->power_supply);
> > > +		goto err;
> > > +	}
> > > +
> > > +	memset(&props, 0, sizeof(struct backlight_properties));
> > > +	props.type = BACKLIGHT_RAW;
> > > +	props.max_brightness = priv->max_brightness;
> > > +	priv->bl_dev = backlight_device_register(dev_name(&pdev->dev),
> > > +			&pdev->dev, priv, &led_bl_ops, &props);
> > > +	if (IS_ERR(priv->bl_dev)) {
> > > +		dev_err(&pdev->dev, "failed to register backlight\n");
> > > +		ret = PTR_ERR(priv->bl_dev);
> > > +		goto err;
> > > +	}
> > > +
> > > +	priv->bl_dev->props.brightness = priv->default_brightness;
> > > +	backlight_update_status(priv->bl_dev);
> > > +
> > > +	return 0;
> > > +
> > > +err:
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static int led_bl_remove(struct platform_device *pdev)
> > > +{
> > > +	struct led_bl_data *priv = platform_get_drvdata(pdev);
> > > +	struct backlight_device *bl = priv->bl_dev;
> > > +
> > > +	backlight_device_unregister(bl);
> > > +
> > > +	led_bl_power_off(priv);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static const struct of_device_id led_bl_of_match[] = {
> > > +	{ .compatible = "led-backlight" },
> > > +	{ }
> > > +};
> > > +
> > > +MODULE_DEVICE_TABLE(of, led_bl_of_match);
> > > +
> > > +static struct platform_driver led_bl_driver = {
> > > +	.driver		= {
> > > +		.name		= "led-backlight",
> > > +		.of_match_table	= of_match_ptr(led_bl_of_match),
> > > +	},
> > > +	.probe		= led_bl_probe,
> > > +	.remove		= led_bl_remove,
> > > +};
> > > +
> > > +module_platform_driver(led_bl_driver);
> > > +
> > > +MODULE_DESCRIPTION("LED based Backlight Driver");
> > > +MODULE_LICENSE("GPL");
> > > +MODULE_ALIAS("platform:led-backlight");
> > > -- 
> > > 2.17.1
> > > 
