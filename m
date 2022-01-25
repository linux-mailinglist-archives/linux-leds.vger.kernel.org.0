Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0BF749BF47
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jan 2022 00:01:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234557AbiAYXBu (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 25 Jan 2022 18:01:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234571AbiAYXBr (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 25 Jan 2022 18:01:47 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F82BC061748;
        Tue, 25 Jan 2022 15:01:47 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id x7so59585841lfu.8;
        Tue, 25 Jan 2022 15:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YhFtXsk2xyTFCdYj1UYrOjlveN/JyZw8H49EHztTd6M=;
        b=RvUwiEaOoAO0/QRDN3UHpgaQFBtqKZ4Tc4QEM36en/c5QI1CkGX6VeozophiKyNySR
         QlJdV/jADgygmuLRRR1YzEwFNyj/ejkGxtgS3OBkQvhYAg2ZDPDxooQozKJKKPykPq0h
         ByTgmSbiPh2mr6r51eTOieYJ/BaBFi7uQmoRQLJqxwxrSGVAW0KY9BGz0SjWB+/F0NC0
         IiSIUlMaon68adrTkz/n5JZ9wZ+ddbUIjnNXzo4veOO9fgKFLtZwWR9iljkU5XrBWrsW
         RmLzxnIyMpzvX7yuyRRwjFFAU0YwbMcfet30g2cr9xTcnLZWTbFhNh3rO8Ic3SNCfRQq
         Ecog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YhFtXsk2xyTFCdYj1UYrOjlveN/JyZw8H49EHztTd6M=;
        b=O9keqiryfTfVnrNVo3ro4wAoPOSg5qBCgZBoKuetEq77ljQjev43oGiKNrx8RJ3mtN
         u6HW/GpPrhk3hVkve+y5W6mmbEBJASD+ZIJSqPbXHkkdrJXphU8Itg2le3QVfxRSbiDM
         V8cKfxqFQPjtmx7PUMJLQ0qvrqzhG9IHXq4nYnoBpme7hPmaJCc41rn3k70cf6zfrAzj
         Xh5VLq8QIHpNxlQHd62nMizWhxFicYFDY+NXvqg1YYo8dZzTAjyoSDHZ0KgpuorhYAns
         +AdcbW1xsVzvoWtuRkHgJwv+Uk9feFHc7y5nwrRDULFXVpO96JePRvvmNZve+jH1zNHD
         cgrQ==
X-Gm-Message-State: AOAM530Fx/Sal9IDtuS6a9uOpuCa6kaXTa+tDEdQZQP9PizMzDAY4EM8
        vdTbb2ly2jor9TuoxZ9K3n1AZhr24Z4=
X-Google-Smtp-Source: ABdhPJyqylIi4jB0VSZ0S9RKFJIsMcOsk8xrDJ6Bb0h48k1qqi0rKkb2x/kIjAhJ7CRFRAx5Z1UxCg==
X-Received: by 2002:a05:6512:131d:: with SMTP id x29mr13078289lfu.330.1643151705327;
        Tue, 25 Jan 2022 15:01:45 -0800 (PST)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id f24sm1620675lfk.297.2022.01.25.15.01.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jan 2022 15:01:44 -0800 (PST)
Subject: Re: [RFC PATCH 2/2] leds: Add PWM multicolor driver
To:     sven@svenschwermer.de, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pwm@vger.kernel.org
Cc:     Sven Schwermer <sven.schwermer@disruptive-technologies.com>,
        pavel@ucw.cz, robh+dt@kernel.org, thierry.reding@gmail.com,
        u.kleine-koenig@pengutronix.de, lee.jones@linaro.org
References: <20220125092239.2006333-1-sven@svenschwermer.de>
 <20220125092239.2006333-3-sven@svenschwermer.de>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <7362affb-5a6b-866a-c125-8f51651810d0@gmail.com>
Date:   Wed, 26 Jan 2022 00:01:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220125092239.2006333-3-sven@svenschwermer.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Sven,

Thanks for the patch. Few comments below.

On 1/25/22 10:22 AM, sven@svenschwermer.de wrote:
> From: Sven Schwermer <sven.schwermer@disruptive-technologies.com>
> 
> By allowing to group multiple monochrome PWM LEDs into multicolor LEDs,
> all involved LEDs can be controlled in-sync. This enables using effects
> using triggers, etc.
> 
> Signed-off-by: Sven Schwermer <sven.schwermer@disruptive-technologies.com>
> ---
>   drivers/leds/Kconfig               |   8 ++
>   drivers/leds/Makefile              |   1 +
>   drivers/leds/leds-pwm-multicolor.c | 184 +++++++++++++++++++++++++++++
>   3 files changed, 193 insertions(+)
>   create mode 100644 drivers/leds/leds-pwm-multicolor.c
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index b6742b4231bf..2e5058696fa6 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -586,6 +586,14 @@ config LEDS_PWM
>   	help
>   	  This option enables support for pwm driven LEDs
>   
> +config LEDS_PWM_MULTICOLOR
> +	tristate "PWM driven multi-color LED Support"
> +	depends on LEDS_CLASS_MULTICOLOR
> +	depends on PWM
> +	help
> +	  This option enables support for PWM driven monochrome LEDs that are
> +	  grouped into multicolor LEDs.
> +
>   config LEDS_REGULATOR
>   	tristate "REGULATOR driven LED support"
>   	depends on LEDS_CLASS
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index 2a698df9da57..152f69374632 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -79,6 +79,7 @@ obj-$(CONFIG_LEDS_PCA963X)		+= leds-pca963x.o
>   obj-$(CONFIG_LEDS_PM8058)		+= leds-pm8058.o
>   obj-$(CONFIG_LEDS_POWERNV)		+= leds-powernv.o
>   obj-$(CONFIG_LEDS_PWM)			+= leds-pwm.o
> +obj-$(CONFIG_LEDS_PWM_MULTICOLOR)	+= leds-pwm-multicolor.o
>   obj-$(CONFIG_LEDS_REGULATOR)		+= leds-regulator.o
>   obj-$(CONFIG_LEDS_S3C24XX)		+= leds-s3c24xx.o
>   obj-$(CONFIG_LEDS_SC27XX_BLTC)		+= leds-sc27xx-bltc.o
> diff --git a/drivers/leds/leds-pwm-multicolor.c b/drivers/leds/leds-pwm-multicolor.c
> new file mode 100644
> index 000000000000..c54bed4536d3
> --- /dev/null
> +++ b/drivers/leds/leds-pwm-multicolor.c
> @@ -0,0 +1,184 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * PWM-based multi-color LED control
> + *
> + * Copyright 2022 Sven Schwermer <sven.schwermer@disruptive-technologies.com>
> + */
> +
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/platform_device.h>
> +#include <linux/led-class-multicolor.h>
> +#include <linux/leds.h>
> +#include <linux/err.h>
> +#include <linux/pwm.h>
> +#include <linux/mutex.h>
> +
> +struct pwm_led {
> +	struct pwm_device *pwm;
> +	struct pwm_state pwmstate;
> +};
> +
> +struct pwm_mc_led {
> +	struct led_classdev_mc mc_cdev;
> +	struct mutex lock;
> +	struct pwm_led leds[];
> +};
> +
> +static int led_pwm_mc_set(struct led_classdev *cdev,
> +			  enum led_brightness brightness)
> +{
> +	int i;
> +	unsigned long long duty;
> +	int ret = 0;
> +	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(cdev);
> +	struct pwm_mc_led *priv = container_of(mc_cdev, struct pwm_mc_led, mc_cdev);
> +
> +	led_mc_calc_color_components(mc_cdev, brightness);
> +
> +	mutex_lock(&priv->lock);
> +
> +	for (i = 0; i < mc_cdev->num_colors; ++i) {
> +		duty = priv->leds[i].pwmstate.period;
> +		duty *= mc_cdev->subled_info[i].brightness;
> +		do_div(duty, cdev->max_brightness);
> +
> +		priv->leds[i].pwmstate.duty_cycle = duty;
> +		priv->leds[i].pwmstate.enabled = duty > 0;
> +		ret = pwm_apply_state(priv->leds[i].pwm,
> +				      &priv->leds[i].pwmstate);
> +		if (ret)
> +			break;
> +	}
> +
> +	mutex_unlock(&priv->lock);
> +
> +	return ret;
> +}
> +
> +static int led_pwm_mc_probe(struct platform_device *pdev)
> +{
> +	struct fwnode_handle *mcnode, *fwnode;
> +	int count = 0;
> +	struct pwm_mc_led *priv;
> +	struct mc_subled *subled;
> +	struct led_classdev *cdev;
> +	struct pwm_led *pwmled;
> +	u32 color;
> +	int ret = 0;
> +	struct led_init_data init_data = {};
> +
> +	mcnode = device_get_named_child_node(&pdev->dev, "multi-led");
> +	if (!mcnode) {
> +		dev_err(&pdev->dev, "expected multi-led node\n");
> +		ret = -ENODEV;
> +		goto out;
> +	}
> +
> +	/* count the nodes inside the multi-led node */
> +	fwnode_for_each_child_node(mcnode, fwnode)
> +		++count;
> +
> +	priv = devm_kzalloc(&pdev->dev, struct_size(priv, leds, count),
> +			    GFP_KERNEL);
> +	if (!priv) {
> +		ret = -ENOMEM;
> +		goto out;
> +	}
> +	mutex_init(&priv->lock);
> +
> +	subled = devm_kcalloc(&pdev->dev, count, sizeof(*subled), GFP_KERNEL);
> +	if (!subled) {
> +		ret = -ENOMEM;
> +		goto destroy_mutex;
> +	}
> +	priv->mc_cdev.subled_info = subled;
> +
> +	/* init the multicolor's LED class device */
> +	cdev = &priv->mc_cdev.led_cdev;
> +	fwnode_property_read_string(mcnode, "label", &cdev->name);

LED core has the support for parsing LED name, so you can skip it.

> +	cdev->brightness = LED_OFF;

devm_kzalloc() handles that.

> +	fwnode_property_read_u32(mcnode, "max-brightness",
> +				 &cdev->max_brightness);
> +	cdev->flags = LED_CORE_SUSPENDRESUME;
> +	cdev->brightness_set_blocking = led_pwm_mc_set;
> +
> +	/* iterate over the nodes inside the multi-led node */
> +	fwnode_for_each_child_node(mcnode, fwnode) {
> +		pwmled = &priv->leds[priv->mc_cdev.num_colors];
> +		pwmled->pwm = devm_fwnode_pwm_get(&pdev->dev, fwnode, NULL);
> +		if (IS_ERR(pwmled->pwm)) {
> +			ret = PTR_ERR(pwmled->pwm);
> +			dev_err(&pdev->dev, "unable to request PWM: %d\n", ret);
> +			goto destroy_mutex;
> +		}
> +		pwm_init_state(pwmled->pwm, &pwmled->pwmstate);
> +
> +		ret = fwnode_property_read_u32(fwnode, "color", &color);
> +		if (ret) {
> +			dev_err(&pdev->dev, "cannot read color: %d\n", ret);
> +			goto destroy_mutex;
> +		}
> +
> +		subled[priv->mc_cdev.num_colors].color_index = color;
> +		subled[priv->mc_cdev.num_colors].channel =
> +			priv->mc_cdev.num_colors;

channel property can be meaningful only for the LED controllers that can
control many LED outputs. In case of pwm controllers you're using LED id
to pwmstate mapping in led_pwm_mc_set().

> +		++priv->mc_cdev.num_colors;
> +	}
> +
> +	init_data.fwnode = mcnode;
> +	ret = devm_led_classdev_multicolor_register_ext(&pdev->dev,
> +							&priv->mc_cdev,
> +							&init_data);
> +	if (ret) {
> +		dev_err(&pdev->dev,
> +			"failed to register multicolor PWM led for %s: %d\n",
> +			cdev->name, ret);
> +		goto destroy_mutex;
> +	}
> +
> +	ret = led_pwm_mc_set(cdev, cdev->brightness);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to set led PWM value for %s: %d",
> +			cdev->name, ret);
> +		goto destroy_mutex;
> +	}
> +
> +	platform_set_drvdata(pdev, priv);
> +	return 0;
> +
> +destroy_mutex:
> +	mutex_destroy(&priv->lock);
> +out:
> +	return ret;
> +}
> +
> +static int led_pwm_mc_remove(struct platform_device *pdev)
> +{
> +	struct pwm_mc_led *priv = platform_get_drvdata(pdev);
> +
> +	mutex_destroy(&priv->lock);
> +	return 0;
> +}
> +
> +static const struct of_device_id of_pwm_leds_mc_match[] = {
> +	{ .compatible = "pwm-leds-multicolor", },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, of_pwm_leds_mc_match);
> +
> +static struct platform_driver led_pwm_mc_driver = {
> +	.probe		= led_pwm_mc_probe,
> +	.remove		= led_pwm_mc_remove,
> +	.driver		= {
> +		.name	= "leds_pwm_multicolor",
> +		.of_match_table = of_pwm_leds_mc_match,
> +	},
> +};
> +
> +module_platform_driver(led_pwm_mc_driver);
> +
> +MODULE_AUTHOR("Sven Schwermer <sven.schwermer@disruptive-technologies.com>");
> +MODULE_DESCRIPTION("multi-color PWM LED driver");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:leds-pwm-multicolor");
> 

-- 
Best regards,
Jacek Anaszewski
