Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C377917B04A
	for <lists+linux-leds@lfdr.de>; Thu,  5 Mar 2020 22:09:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726220AbgCEVJZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 5 Mar 2020 16:09:25 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:45411 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726049AbgCEVJZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 5 Mar 2020 16:09:25 -0500
Received: by mail-wr1-f66.google.com with SMTP id v2so8736983wrp.12;
        Thu, 05 Mar 2020 13:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=v3nmlG5WW8EgUPfTBq0i2mzF8udv2ouRmLVEPlRbuSM=;
        b=QsTYwcBItY86U7KCEkQdkGPMFM5i8bU99WzSum3aACEJxBKCfvM4jw3A7diyUf3NWJ
         NEfsxprPXymwHr+DfX1IvbcHpcWkTmqFOUpBPQi7pQbjTARzysSYWNXUA8IBuqVhNgnG
         6JD5QuYQDbp9ljH62vBjTMx6qwq83jnVXsPqHhD0sK29wyc1CQT/aCFuZd3MX2mv551y
         /uNUhh0L1mXyGC9AdGPCf4AtLUmsf+WG8i8r5OyAlOLHlhYAgq2tWcR8RdOLnGK1Zh79
         Kn3lnQE2EOMlUiOh88tndQ1RQJOM2VtI9Sa5TNjdDO5RpbSOFeOVDnQecjbfHhhj7G5E
         FeNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=v3nmlG5WW8EgUPfTBq0i2mzF8udv2ouRmLVEPlRbuSM=;
        b=qT5GzQm/3QIXebDB+gfDndDTy4yLa54sm6gnsVEhR/rQUjFQrjv0myVtTIf6RUk1O4
         WMKNzrJ8h1c6Uz0wB8qt5r5OzrUOBApgc5a+2qYu1+epLsdQCSteEfp6Sdux5Enpnm9i
         DMSUgG+Q0JrjuckFdz8neAXzDof4K7bD0RS6cmPQSAJ4EW6rMnb5Uk0JJBOwTBsN20Ls
         Fvq7lbHMWoXOUcAmjQK08ClFoG715fNKt7tXu2bdqvpu/b3CeuN43qkwok/Chqao/XmV
         1g722wkgun9MUsckMhB/A6juuIbl1ADWcig5oz4LTzP8nFYavBGSavYeN4+y9QwTeAqb
         rYcg==
X-Gm-Message-State: ANhLgQ3pciYpZ2462yXE1tQqODNeSPgr0O8BfJONkSkaxqbfX+XbITGy
        xFcFoJnplUScACHBgsrzSk+4rwYp
X-Google-Smtp-Source: ADFU+vsHmGwe48p3E6UvzJbaHurLdTe5AdyzpWx2oCGRkK1LDmfPSbEwdSpQp0ecKJNZWTj4VrQOeQ==
X-Received: by 2002:adf:eb0a:: with SMTP id s10mr731945wrn.405.1583442559348;
        Thu, 05 Mar 2020 13:09:19 -0800 (PST)
Received: from [192.168.1.23] (afam183.neoplus.adsl.tpnet.pl. [95.49.12.183])
        by smtp.gmail.com with ESMTPSA id o26sm10222760wmc.33.2020.03.05.13.09.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2020 13:09:18 -0800 (PST)
Subject: Re: [RFC PATCH] leds: add sgm3140 driver
To:     Luca Weiss <luca@z3ntu.xyz>, linux-leds@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>, linux-kernel@vger.kernel.org
References: <20200227185015.212479-1-luca@z3ntu.xyz>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <8d174b46-f7d0-119b-d8b0-ad89ecb1872f@gmail.com>
Date:   Thu, 5 Mar 2020 22:09:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200227185015.212479-1-luca@z3ntu.xyz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Luca,

Thank you for the patch.

On 2/27/20 7:50 PM, Luca Weiss wrote:
> Add a driver for the SGMICRO SGM3140 Buck/Boost Charge Pump LED driver.
> 
> This device is controller by two GPIO lines, one for enabling the LED
> and the second one for switching between torch and flash mode.
> 
> The device will automatically switch to torch mode after being in flash
> mode for about 250-300ms, so after that time the driver will turn the
> LED off again automatically.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
> Hi, this driver is controllable via sysfs and v4l2 APIs (as documented
> in Documentation/leds/leds-class-flash.rst).
> 
> The following is possible:
> 
> # Torch on
> echo 1 > /sys/class/leds/white\:flash/brightness
> # Torch off
> echo 0 > /sys/class/leds/white\:flash/brightness
> # Activate flash
> echo 1 > /sys/class/leds/white\:flash/flash_strobe
> 
> # Torch on
> v4l2-ctl -d /dev/video1 -c led_mode=2
> # Torch off
> v4l2-ctl -d /dev/video1 -c led_mode=0
> # Activate flash
> v4l2-ctl -d /dev/video1 -c strobe=1

What is /dev/video1 ? Did you register vl42 flash subdev
in some v4l2 media controller device?

> 
> Unfortunately the last command (enabling the 'flash' via v4l2 results in
> the following being printed and nothing happening:
> 
>   VIDIOC_S_EXT_CTRLS: failed: Resource busy
>   strobe: Resource busy
> 
> Unfortunately I couldn't figure out the reason so I'm hoping to get some
> guidance for this. iirc it worked at some point but then stopped.

You have to be in flash mode to strobe i.e. led_mode=1.

> I will also write dt bindings for the driver once I have "strobe"
> working.
> 
> Regards,
> Luca
> 
>  drivers/leds/Kconfig        |   9 ++
>  drivers/leds/Makefile       |   1 +
>  drivers/leds/leds-sgm3140.c | 210 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 220 insertions(+)
>  create mode 100644 drivers/leds/leds-sgm3140.c
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 4b68520ac251..7c391af8b380 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -836,6 +836,15 @@ config LEDS_LM36274
>  	  Say Y to enable the LM36274 LED driver for TI LMU devices.
>  	  This supports the LED device LM36274.
>  
> +config LEDS_SGM3140
> +	tristate "LED support for the SGM3140"
> +	depends on LEDS_CLASS_FLASH
> +	depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
> +	depends on OF
> +	help
> +	  This option enables support for the SGM3140 500mA Buck/Boost Charge
> +	  Pump LED Driver. It has supports flash and torch mode.
> +
>  comment "LED Triggers"
>  source "drivers/leds/trigger/Kconfig"
>  
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index 2da39e896ce8..38d57dd53e4b 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -85,6 +85,7 @@ obj-$(CONFIG_LEDS_LM3601X)		+= leds-lm3601x.o
>  obj-$(CONFIG_LEDS_TI_LMU_COMMON)	+= leds-ti-lmu-common.o
>  obj-$(CONFIG_LEDS_LM3697)		+= leds-lm3697.o
>  obj-$(CONFIG_LEDS_LM36274)		+= leds-lm36274.o
> +obj-$(CONFIG_LEDS_SGM3140)		+= leds-sgm3140.o
>  
>  # LED SPI Drivers
>  obj-$(CONFIG_LEDS_CR0014114)		+= leds-cr0014114.o
> diff --git a/drivers/leds/leds-sgm3140.c b/drivers/leds/leds-sgm3140.c
> new file mode 100644
> index 000000000000..9e91392f0343
> --- /dev/null
> +++ b/drivers/leds/leds-sgm3140.c
> @@ -0,0 +1,210 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (C) 2020 Luca Weiss <luca@z3ntu.xyz>
> +
> +#include <linux/gpio/consumer.h>
> +#include <linux/led-class-flash.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +
> +#include <media/v4l2-flash-led-class.h>
> +
> +#define SGM3140_NAME "sgm3140"
> +
> +struct sgm3140 {
> +	struct gpio_desc *flash_gpio;
> +	struct gpio_desc *enable_gpio;
> +
> +	struct led_classdev_flash fled_cdev;
> +	struct v4l2_flash *v4l2_flash;
> +
> +	struct timer_list powerdown_timer;
> +};
> +
> +static struct sgm3140 *flcdev_to_sgm3140(struct led_classdev_flash *flcdev)
> +{
> +	return container_of(flcdev, struct sgm3140, fled_cdev);
> +}
> +
> +int sgm3140_strobe_set(struct led_classdev_flash *fled_cdev, bool state)
> +{
> +	struct sgm3140 *priv = flcdev_to_sgm3140(fled_cdev);
> +
> +	if (state) {
> +		gpiod_set_value_cansleep(priv->flash_gpio, 1);
> +		gpiod_set_value_cansleep(priv->enable_gpio, 1);
> +		mod_timer(&priv->powerdown_timer,
> +			  jiffies + msecs_to_jiffies(250));
> +	} else {
> +		gpiod_set_value_cansleep(priv->enable_gpio, 0);
> +		gpiod_set_value_cansleep(priv->flash_gpio, 0);
> +		del_timer_sync(&priv->powerdown_timer);
> +	}
> +
> +	return 0;
> +}
> +
> +struct led_flash_ops sgm3140_flash_ops = {
> +	.strobe_set = sgm3140_strobe_set,
> +};
> +
> +int sgm3140_brightness_set(struct led_classdev *led_cdev,
> +			   enum led_brightness brightness)
> +{
> +	struct led_classdev_flash *fled_cdev = lcdev_to_flcdev(led_cdev);
> +	struct sgm3140 *priv = flcdev_to_sgm3140(fled_cdev);
> +
> +	if (brightness == LED_OFF)
> +		gpiod_set_value_cansleep(priv->enable_gpio, 0);
> +	else
> +		gpiod_set_value_cansleep(priv->enable_gpio, 1);
> +
> +	return 0;
> +}
> +
> +static void sgm3140_powerdown_timer(struct timer_list *t)
> +{
> +	struct sgm3140 *priv = from_timer(priv, t, powerdown_timer);
> +
> +	gpiod_set_value_cansleep(priv->enable_gpio, 0);
> +	gpiod_set_value_cansleep(priv->flash_gpio, 0);

You could also implement strobe_get op and return from it a flag
indicating if LED is strobing.

> +}
> +
> +#if IS_ENABLED(CONFIG_V4L2_FLASH_LED_CLASS)
> +static void sgm3140_init_v4l2_flash_config(struct sgm3140 *priv,
> +					   struct v4l2_flash_config *v4l2_sd_cfg)
> +{
> +	struct led_classdev *led_cdev = &priv->fled_cdev.led_cdev;
> +	struct led_flash_setting *s;
> +
> +	strlcpy(v4l2_sd_cfg->dev_name, led_cdev->dev->kobj.name,
> +		sizeof(v4l2_sd_cfg->dev_name));
> +
> +	s = &v4l2_sd_cfg->intensity;
> +	s->min = 0;
> +	s->max = 1;
> +	s->step = 1;
> +	s->val = 1;
> +}
> +
> +#else
> +static void sgm3140_init_v4l2_flash_config(struct sgm3140 *priv,
> +					   struct v4l2_flash_config *v4l2_sd_cfg)
> +{
> +}
> +#endif
> +
> +static int sgm3140_probe(struct platform_device *pdev)
> +{
> +	struct sgm3140 *priv;
> +	struct led_classdev *led_cdev;
> +	struct led_classdev_flash *fled_cdev;
> +	struct led_init_data init_data = {};
> +	struct device_node *child_node;
> +	struct v4l2_flash_config v4l2_sd_cfg;

s/v4l2_sd_cfg;/v4l2_sd_cfg = {};/

Otherwise it is possible that some controls would be initialized
to random values.

> +	int ret;
> +
> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->flash_gpio = devm_gpiod_get(&pdev->dev, "flash", GPIOD_OUT_LOW);
> +	ret = PTR_ERR_OR_ZERO(priv->flash_gpio);
> +	if (ret) {
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(&pdev->dev, "Failed to request flash gpio: %d\n",
> +				ret);
> +		return ret;
> +	}
> +
> +	priv->enable_gpio = devm_gpiod_get(&pdev->dev, "enable", GPIOD_OUT_LOW);
> +	ret = PTR_ERR_OR_ZERO(priv->enable_gpio);
> +	if (ret) {
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(&pdev->dev, "Failed to request enable gpio: %d\n",
> +				ret);
> +		return ret;
> +	}
> +
> +	child_node = of_get_next_available_child(pdev->dev.of_node, NULL);
> +	if (!child_node) {
> +		dev_err(&pdev->dev, "No DT child node found for connected LED.\n");
> +		return -EINVAL;
> +	}
> +
> +	timer_setup(&priv->powerdown_timer, sgm3140_powerdown_timer, 0);
> +
> +	fled_cdev = &priv->fled_cdev;
> +	led_cdev = &fled_cdev->led_cdev;
> +
> +	fled_cdev->ops = &sgm3140_flash_ops;
> +
> +	led_cdev->brightness_set_blocking = sgm3140_brightness_set;
> +	led_cdev->max_brightness = LED_ON;
> +	led_cdev->flags |= LED_DEV_CAP_FLASH;
> +
> +	init_data.fwnode = of_fwnode_handle(child_node);
> +	init_data.devicename = SGM3140_NAME;

devicename should be skipped in new drivers.

> +
> +	platform_set_drvdata(pdev, priv);
> +
> +	/* Register in the LED subsystem */
> +	ret = led_classdev_flash_register_ext(&pdev->dev, fled_cdev, &init_data);

We already have devm_* prefixed version thereof.

> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "Failed to register flash device: %d\n",
> +			ret);
> +		goto err_flash_register;
> +	}
> +
> +	sgm3140_init_v4l2_flash_config(priv, &v4l2_sd_cfg);
> +
> +	/* Create V4L2 Flash subdev */
> +	priv->v4l2_flash = v4l2_flash_init(&pdev->dev, of_fwnode_handle(child_node),
> +					   fled_cdev, NULL,
> +					   &v4l2_sd_cfg);
> +	if (IS_ERR(priv->v4l2_flash)) {
> +		ret = PTR_ERR(priv->v4l2_flash);
> +		goto err_v4l2_flash_init;
> +	}
> +
> +	return 0;
> +
> +err_v4l2_flash_init:
> +	led_classdev_flash_unregister(fled_cdev);
> +err_flash_register:
> +	of_node_put(child_node);

You need to relase of_node also in case of success.

> +	return ret;
> +}
> +
> +static int sgm3140_remove(struct platform_device *pdev)
> +{
> +	struct sgm3140 *priv = platform_get_drvdata(pdev);
> +
> +	del_timer_sync(&priv->powerdown_timer);
> +
> +	v4l2_flash_release(priv->v4l2_flash);
> +	led_classdev_flash_unregister(&priv->fled_cdev);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id sgm3140_dt_match[] = {
> +	{ .compatible = "sgmicro,sgm3140" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, sgm3140_dt_match);
> +
> +static struct platform_driver sgm3140_driver = {
> +	.probe	= sgm3140_probe,
> +	.remove	= sgm3140_remove,
> +	.driver	= {
> +		.name	= "sgm3140",
> +		.of_match_table = sgm3140_dt_match,
> +	},
> +};
> +
> +module_platform_driver(sgm3140_driver);
> +
> +MODULE_AUTHOR("Luca Weiss <luca@z3ntu.xyz>");
> +MODULE_DESCRIPTION("SG Micro SGM3140 charge pump led driver");
> +MODULE_LICENSE("GPL v2");
> 

-- 
Best regards,
Jacek Anaszewski
