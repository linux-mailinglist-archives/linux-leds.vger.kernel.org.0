Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C164B244039
	for <lists+linux-leds@lfdr.de>; Thu, 13 Aug 2020 23:04:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbgHMVER (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 13 Aug 2020 17:04:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726486AbgHMVEQ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 13 Aug 2020 17:04:16 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B128C061757
        for <linux-leds@vger.kernel.org>; Thu, 13 Aug 2020 14:04:16 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id ba10so5254614edb.3
        for <linux-leds@vger.kernel.org>; Thu, 13 Aug 2020 14:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Dd/yWB0SM6M3GhjoCVmn3ZkZNf8OuX8romN/ARI3DMM=;
        b=BHG2G2RrgtprQgRG1ZaQL/6hG8wSBhegdSZB3cUYPTq9X9hsPu42TYSw/UAFH5FYLb
         gzUOfqOpHVCwsnaaN3SJrZmV96xnUNwv5qh9gqG2Tih3oXAmQSvQPBFirwDSz7+ssHMG
         l23FeuDrPZN3KPfQgo9mihqwwDtAN9WulTKPKTrLpNHiX2IpU3GogDq0yTJgrTGYFpP4
         et7fhn6/J1N0E8Z3zeAihGBPMh1NnXfMeVHyXu4C+ITybdf3rNaka+HRGXgW5rC8B0qO
         YnCFnJ983gbyx9RzUPIp+g2zAgIIJ5IgzPLVCgsfTfZ3OyA47bHvChbJgQJy37q5S1ha
         kgiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Dd/yWB0SM6M3GhjoCVmn3ZkZNf8OuX8romN/ARI3DMM=;
        b=ntoDm3K/whFZFbqluhSHXTuvHVWmkgprxI/lvmGISgI3LDT5Ugz6ZSf4OfJ4VPZF7H
         CnSo+CihMSiyGhNs/+RBIBeGlE4RNoVJDMFd/V+Ac1LNcq+AFpWaLbTAibmMjEjpme59
         5dxwDgMjt/cA2MZgTeUwhdeG1wIEZc8WrablzqXvcScY3OAJPBMV0T9V/D2E0EhvLUFa
         3VSV4hFzJ1T/F8SZq5VYlL/NrS3fYQsjxWG8o7B94C/jqjEYDF5Pmau8PdHnT8yy6gKi
         ruAHFXTMk2b8MdJeewZpc3WLgEyetIqGezM9LKa7LLo1hN2QkAlAdh4h54y5Y+Hx4BSe
         7OOg==
X-Gm-Message-State: AOAM533U14hEAdejlO4eNFoGUjGNtU1qoYKQQ3JIMpqjXP9vEe6u27dO
        GM0KDCAF/gW2S/lfgnw0gBA=
X-Google-Smtp-Source: ABdhPJwsIyTmipaD8xHl2lhnj3Xxsl31C14N47zr72BsTPSERduHev/QpO3CjyxCpco6CAi2jJVxuQ==
X-Received: by 2002:a50:f288:: with SMTP id f8mr6635938edm.247.1597352654715;
        Thu, 13 Aug 2020 14:04:14 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:542e:b60d:359c:ac79? ([2a01:110f:b59:fd00:542e:b60d:359c:ac79])
        by smtp.gmail.com with ESMTPSA id s9sm5473267edt.36.2020.08.13.14.04.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2020 14:04:14 -0700 (PDT)
Subject: Re: [PATCH 2/2] leds: rt8515: Add Richtek RT8515 LED driver
To:     Linus Walleij <linus.walleij@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     linux-leds@vger.kernel.org, newbytee@protonmail.com,
        Stephan Gerhold <stephan@gerhold.net>
References: <20200812090711.2644688-1-linus.walleij@linaro.org>
 <20200812090711.2644688-2-linus.walleij@linaro.org>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <c45a2758-cb43-2ccb-4056-ed25d73fa3f8@gmail.com>
Date:   Thu, 13 Aug 2020 23:04:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200812090711.2644688-2-linus.walleij@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Linus,

Thank you for the patch. Please find my comments below.

On 8/12/20 11:07 AM, Linus Walleij wrote:
> This adds a driver for the Richtek RT8515 dual channel
> torch/flash white LED driver.
> 
> This LED driver is found in some mobile phones from
> Samsung such as the GT-S7710 and GT-I8190.
> 
> Cc: newbytee@protonmail.com
> Cc: Stephan Gerhold <stephan@gerhold.net>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>   drivers/leds/Kconfig       |  11 ++
>   drivers/leds/Makefile      |   1 +
>   drivers/leds/leds-rt8515.c | 299 +++++++++++++++++++++++++++++++++++++
>   3 files changed, 311 insertions(+)
>   create mode 100644 drivers/leds/leds-rt8515.c
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 1c181df24eae..e2c03e4e54f5 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -901,6 +901,17 @@ config LEDS_IP30
>   	  To compile this driver as a module, choose M here: the module
>   	  will be called leds-ip30.
>   
> +config LEDS_RT8515
> +	tristate "LED support for Richtek RT8515 flash/torch LED"
> +	depends on LEDS_CLASS_FLASH
> +	depends on GPIOLIB
> +	help
> +	  This option enables support for the Richtek RT8515 flash
> +	  and torch LEDs found on some mobile phones.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called leds-rt8515.
> +
>   config LEDS_SGM3140
>   	tristate "LED support for the SGM3140"
>   	depends on LEDS_CLASS_FLASH
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index c2c7d7ade0d0..debbf505034a 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -78,6 +78,7 @@ obj-$(CONFIG_LEDS_PM8058)		+= leds-pm8058.o
>   obj-$(CONFIG_LEDS_POWERNV)		+= leds-powernv.o
>   obj-$(CONFIG_LEDS_PWM)			+= leds-pwm.o
>   obj-$(CONFIG_LEDS_REGULATOR)		+= leds-regulator.o
> +obj-$(CONFIG_LEDS_RT8515)		+= leds-rt8515.o
>   obj-$(CONFIG_LEDS_S3C24XX)		+= leds-s3c24xx.o
>   obj-$(CONFIG_LEDS_SC27XX_BLTC)		+= leds-sc27xx-bltc.o
>   obj-$(CONFIG_LEDS_SGM3140)		+= leds-sgm3140.o
> diff --git a/drivers/leds/leds-rt8515.c b/drivers/leds/leds-rt8515.c
> new file mode 100644
> index 000000000000..ff104ad37129
> --- /dev/null
> +++ b/drivers/leds/leds-rt8515.c
> @@ -0,0 +1,299 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * LED driver for Richtek RT8515 flash/torch white LEDs
> + * found on some Samsung mobile phones.
> + * This is a 1.5A Boost dual channel driver produced around 2011.
> + *
> + * Linus Walleij <linus.walleij@linaro.org>
> + */
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/led-class-flash.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <media/v4l2-flash-led-class.h>
> +
> +#define RT8515_FLASH_MAX 16
> +#define RT8515_TORCH_MAX 100
> +
> +#define RT8515_TIMEOUT_DEFAULT		250000U /* 250ms */
> +#define RT8515_MAX_TIMEOUT_DEFAULT	300000U /* 300ms */
> +
> +struct rt8515 {
> +	struct led_classdev_flash fled;
> +	struct v4l2_flash *v4l2_flash;
> +	struct mutex lock;
> +	struct regulator *reg;
> +	struct gpio_desc *ent;
> +	struct gpio_desc *enf;
> +	struct timer_list powerdown_timer;
> +	u32 max_timeout; /* Flash max timeout */
> +};
> +
> +static struct rt8515 *to_rt8515(struct led_classdev_flash *fled)
> +{
> +	return container_of(fled, struct rt8515, fled);
> +}
> +
> +/* This is setting the torch light level */
> +static int rt8515_led_brightness_set(struct led_classdev *led,
> +				     enum led_brightness brightness)
> +{
> +	struct led_classdev_flash *fled = lcdev_to_flcdev(led);
> +	struct rt8515 *rt = to_rt8515(fled);
> +	int i;
> +
> +	mutex_lock(&rt->lock);
> +
> +	if (brightness == LED_OFF) {
> +		/* Off */
> +		gpiod_set_value(rt->enf, 0);
> +		gpiod_set_value(rt->ent, 0);
> +	} else if (brightness < RT8515_TORCH_MAX) {
> +		/* Step it up to movie mode brightness using the flash pin */
> +		for (i = 0; i < brightness; i++) {
> +			gpiod_set_value(rt->ent, 0);
> +			udelay(1);
> +			gpiod_set_value(rt->ent, 1);
> +			udelay(1);
> +		}

You need this loop here and below in the *strobe_set().
Wrapping it with a function would improve readability.

> +	} else {
> +		/* Max torch brightness requested */
> +		gpiod_set_value(rt->ent, 1);
> +	}
> +
> +	mutex_unlock(&rt->lock);
> +
> +	return 0;
> +}
> +
> +static int rt8515_led_flash_strobe_set(struct led_classdev_flash *fled,
> +				       bool state)
> +{
> +	struct rt8515 *rt = to_rt8515(fled);
> +	struct led_flash_setting *timeout = &fled->timeout;
> +	int brightness = 4; /* max 16 */
> +	int i;
> +
> +	mutex_lock(&rt->lock);
> +
> +	if (state) {
> +		/* Enable LED flash mode */
> +		for (i = 0; i < brightness; i++) {
> +			gpiod_set_value(rt->enf, 0);
> +			udelay(1);
> +			gpiod_set_value(rt->enf, 1);
> +			udelay(1);
> +		}
> +		/* Set timeout */
> +		mod_timer(&rt->powerdown_timer,
> +			  jiffies + usecs_to_jiffies(timeout->val));
> +	} else {
> +		del_timer_sync(&rt->powerdown_timer);
> +		/* Turn the LED off */
> +		gpiod_set_value(rt->enf, 0);
> +		gpiod_set_value(rt->ent, 0);
> +	}
> +
> +	fled->led_cdev.brightness = LED_OFF;
> +	/* After this the torch LED will be disabled */
> +
> +	mutex_unlock(&rt->lock);
> +
> +	return 0;
> +}
> +
> +static int rt8515_led_flash_strobe_get(struct led_classdev_flash *fled,
> +				       bool *state)
> +{
> +	struct rt8515 *rt = to_rt8515(fled);
> +
> +	*state = timer_pending(&rt->powerdown_timer);
> +
> +	return 0;
> +}
> +
> +static int rt8515_led_flash_timeout_set(struct led_classdev_flash *fled,
> +					u32 timeout)
> +{
> +	/* The timeout is stored in the led-class-flash core */
> +	return 0;
> +}
> +
> +static const struct led_flash_ops rt8515_flash_ops = {
> +	.strobe_set = rt8515_led_flash_strobe_set,
> +	.strobe_get = rt8515_led_flash_strobe_get,
> +	.timeout_set = rt8515_led_flash_timeout_set,
> +};
> +
> +static void rt8515_powerdown_timer(struct timer_list *t)
> +{
> +	struct rt8515 *rt = from_timer(rt, t, powerdown_timer);
> +
> +	/* Turn the LED off */
> +	gpiod_set_value(rt->enf, 0);
> +	gpiod_set_value(rt->ent, 0);
> +}
> +
> +static void rt8515_init_flash_timeout(struct rt8515 *rt)
> +{
> +	struct led_classdev_flash *fled = &rt->fled;
> +	struct led_flash_setting *s;
> +
> +	/* Init flash timeout setting */
> +	s = &fled->timeout;
> +	s->min = 1;
> +	s->max = rt->max_timeout;
> +	s->step = 1;
> +	/*
> +	 * Set default timeout to RT8515_DEFAULT_TIMEOUT except if
> +	 * max_timeout from DT is lower.
> +	 */
> +	s->val = min(rt->max_timeout, RT8515_TIMEOUT_DEFAULT);
> +}
> +
> +#if IS_ENABLED(CONFIG_V4L2_FLASH_LED_CLASS)
> +/* Configure the V2L2 flash subdevice */
> +static void rt8515_init_v4l2_flash_config(struct rt8515 *rt,
> +					  struct v4l2_flash_config *v4l2_sd_cfg)
> +{
> +	struct led_classdev *led = &rt->fled.led_cdev;
> +	struct led_flash_setting *s;
> +
> +	strscpy(v4l2_sd_cfg->dev_name, led->dev->kobj.name,
> +		sizeof(v4l2_sd_cfg->dev_name));
> +
> +	/* Init flash intensity setting */
> +	s = &v4l2_sd_cfg->intensity;
> +	s->min = 0;
> +	s->max = rt->fled.led_cdev.max_brightness;
> +	s->step = 1;

struct v4l2_flash_config's intensity property tells V4L2 flash framework
how to convert LED class brightness levels to microamperes used by
the V4L2 flash subdevice.

See max77693_init_v4l2_flash_config() in drivers/leds/leds-max77693.c
for a reference.

> +	s->val = s->max;
> +}
> +
> +#else
> +static void rt8515_init_v4l2_flash_config(struct rt8515 *rt,
> +					  struct v4l2_flash_config *v4l2_sd_cfg)
> +{
> +}
> +#endif
> +
> +static int rt8515_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct fwnode_handle *child;
> +	struct rt8515 *rt;
> +	struct led_classdev *led;
> +	struct led_classdev_flash *fled;
> +	struct led_init_data init_data = {};
> +	struct v4l2_flash_config v4l2_sd_cfg = {};
> +	int ret;
> +
> +	rt = devm_kzalloc(dev, sizeof(*rt), GFP_KERNEL);
> +	if (!rt)
> +		return -ENOMEM;
> +
> +	fled = &rt->fled;
> +	led = &fled->led_cdev;
> +
> +	/* ENF - Enable Flash line */
> +	rt->enf = devm_gpiod_get(dev, "enf", GPIOD_OUT_LOW);
> +	if (IS_ERR(rt->enf)) {
> +		dev_err(dev, "cannot get ENF (enable flash) GPIO\n");
> +		return PTR_ERR(rt->enf);
> +	}
> +
> +	/* ENT - Enable Torch line */
> +	rt->ent = devm_gpiod_get(dev, "ent", GPIOD_OUT_LOW);
> +	if (IS_ERR(rt->ent)) {
> +		dev_err(dev, "cannot get ENT (enable torch) GPIO\n");
> +		return PTR_ERR(rt->ent);
> +	}
> +
> +	child = fwnode_get_next_available_child_node(dev->fwnode, NULL);
> +	if (!child) {
> +		dev_err(dev,
> +			"No fwnode child node found for connected LED.\n");
> +		return -EINVAL;
> +	}
> +	init_data.fwnode = child;
> +
> +	ret = fwnode_property_read_u32(child, "flash-max-timeout-us",
> +				       &rt->max_timeout);
> +	if (ret) {
> +		rt->max_timeout = RT8515_MAX_TIMEOUT_DEFAULT;
> +		dev_warn(dev,
> +			 "flash-max-timeout-us property missing\n");
> +	}
> +	timer_setup(&rt->powerdown_timer, rt8515_powerdown_timer, 0);
> +	rt8515_init_flash_timeout(rt);
> +
> +	fled->ops = &rt8515_flash_ops;
> +
> +	led->max_brightness = RT8515_TORCH_MAX;
> +	led->brightness_set_blocking = rt8515_led_brightness_set;
> +	led->flags |= LED_CORE_SUSPENDRESUME | LED_DEV_CAP_FLASH;
> +	led->name = "torch";

Please remove above line - you're using LED *ext registration API
but this would prevent LED core from using automating LED name
composition feature based on DT 'function' and 'color' properties.

> +
> +	mutex_init(&rt->lock);
> +
> +	platform_set_drvdata(pdev, rt);
> +
> +	ret = devm_led_classdev_flash_register_ext(dev, fled, &init_data);
> +	if (ret) {
> +		dev_err(dev, "can't register LED %s\n", led->name);
> +		mutex_destroy(&rt->lock);
> +		return ret;
> +	}
> +
> +	rt8515_init_v4l2_flash_config(rt, &v4l2_sd_cfg);
> +
> +	/* Create a V4L2 Flash device if V4L2 flash is enabled */
> +	rt->v4l2_flash = v4l2_flash_init(dev, child, fled, NULL, &v4l2_sd_cfg);
> +	if (IS_ERR(rt->v4l2_flash)) {
> +		ret = PTR_ERR(rt->v4l2_flash);
> +		dev_err(dev, "failed to register V4L2 flash device (%d)\n",
> +			ret);
> +		/*
> +		 * Continue without the V4L2 flash
> +		 * (we still have the classdev)
> +		 */
> +	}
> +
> +	return 0;
> +}
> +
> +static int rt8515_remove(struct platform_device *pdev)
> +{
> +	struct rt8515 *rt = platform_get_drvdata(pdev);
> +
> +	v4l2_flash_release(rt->v4l2_flash);
> +	del_timer_sync(&rt->powerdown_timer);
> +	mutex_destroy(&rt->lock);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id rt8515_match[] = {
> +	{ .compatible = "richtek,rt8515", },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, rt8515_match);
> +
> +static struct platform_driver rt8515_driver = {
> +	.driver = {
> +		.name  = "rt8515",
> +		.of_match_table = rt8515_match,
> +	},
> +	.probe  = rt8515_probe,
> +	.remove = rt8515_remove,
> +};
> +module_platform_driver(rt8515_driver);
> +
> +MODULE_AUTHOR("Linus Walleij <linus.walleij@linaro.org>");
> +MODULE_DESCRIPTION("Richtek RT8515 LED driver");
> +MODULE_LICENSE("GPL v2");
> 

-- 
Best regards,
Jacek Anaszewski
