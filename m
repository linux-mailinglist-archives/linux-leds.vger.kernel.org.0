Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1AC6019DCE2
	for <lists+linux-leds@lfdr.de>; Fri,  3 Apr 2020 19:37:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728119AbgDCRh5 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 3 Apr 2020 13:37:57 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:34494 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727923AbgDCRh5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 3 Apr 2020 13:37:57 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 033HbifV117930;
        Fri, 3 Apr 2020 12:37:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1585935464;
        bh=IFFxpXiVXLZc2qdhczDR7D9a9oSa0u9xD7uIEB8/v8s=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=LHgVRVKs+2Yw3EMpFPwc5jXhmuvD6wl9t4Qj7Ojf2sJEbtTSEYjThBarCO9s3O6iE
         ia3KEFTbGSGMjQP7m/7710MOvzdExmuPDOLFwMwUREBOGXJKltoDKcsJ+nuYNY8lHB
         qqGcN9baI5AHSMjtu9FbstfIYYO9wK65LFv3+v9I=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 033Hbigk114605
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 3 Apr 2020 12:37:44 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 3 Apr
 2020 12:37:44 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 3 Apr 2020 12:37:44 -0500
Received: from [10.250.52.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 033Hbh1Q066898;
        Fri, 3 Apr 2020 12:37:43 -0500
Subject: Re: [PATCH v2 2/2] leds: add sgm3140 driver
To:     Luca Weiss <luca@z3ntu.xyz>, <linux-leds@vger.kernel.org>
CC:     Heiko Stuebner <heiko@sntech.de>, Icenowy Zheng <icenowy@aosc.io>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <~postmarketos/upstreaming@lists.sr.ht>
References: <20200330194757.2645388-1-luca@z3ntu.xyz>
 <20200330194757.2645388-3-luca@z3ntu.xyz>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <e29c3fee-068d-c3d7-a0e6-6877a616b3fa@ti.com>
Date:   Fri, 3 Apr 2020 12:31:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200330194757.2645388-3-luca@z3ntu.xyz>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Luca

On 3/30/20 2:47 PM, Luca Weiss wrote:
> Add a driver for the SGMICRO SGM3140 Buck/Boost Charge Pump LED driver.
>
> This device is controlled by two GPIO pins, one for enabling and the
> second one for switching between torch and flash mode.
>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
> Changes since v1:
> - Add vin-supply (keep track of 'enabled' state for that)
> - Wrap lines
> - static const -ify some structs and methods
> - use strscpy instead of strlcpy
> - remove u32 cast by adding 'U' suffix to constants
> - rebase on linux-next
>
>   drivers/leds/Kconfig        |   9 +
>   drivers/leds/Makefile       |   1 +
>   drivers/leds/leds-sgm3140.c | 317 ++++++++++++++++++++++++++++++++++++
>   3 files changed, 327 insertions(+)
>   create mode 100644 drivers/leds/leds-sgm3140.c
>
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 7599dbee8de1..f5beeff16bdd 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -871,6 +871,15 @@ config LEDS_IP30
>   	  To compile this driver as a module, choose M here: the module
>   	  will be called leds-ip30.
>   
> +config LEDS_SGM3140
> +	tristate "LED support for the SGM3140"
> +	depends on LEDS_CLASS_FLASH
> +	depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
> +	depends on OF
> +	help
> +	  This option enables support for the SGM3140 500mA Buck/Boost Charge
> +	  Pump LED Driver.
> +
>   comment "LED Triggers"
>   source "drivers/leds/trigger/Kconfig"
>   
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index fd61421f7d40..f60ed0c09d4c 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -77,6 +77,7 @@ obj-$(CONFIG_LEDS_PWM)			+= leds-pwm.o
>   obj-$(CONFIG_LEDS_REGULATOR)		+= leds-regulator.o
>   obj-$(CONFIG_LEDS_S3C24XX)		+= leds-s3c24xx.o
>   obj-$(CONFIG_LEDS_SC27XX_BLTC)		+= leds-sc27xx-bltc.o
> +obj-$(CONFIG_LEDS_SGM3140)		+= leds-sgm3140.o
>   obj-$(CONFIG_LEDS_SUNFIRE)		+= leds-sunfire.o
>   obj-$(CONFIG_LEDS_SYSCON)		+= leds-syscon.o
>   obj-$(CONFIG_LEDS_TCA6507)		+= leds-tca6507.o
> diff --git a/drivers/leds/leds-sgm3140.c b/drivers/leds/leds-sgm3140.c
> new file mode 100644
> index 000000000000..28fe5e34f931
> --- /dev/null
> +++ b/drivers/leds/leds-sgm3140.c
> @@ -0,0 +1,317 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (C) 2020 Luca Weiss <luca@z3ntu.xyz>
> +
> +#include <linux/gpio/consumer.h>
> +#include <linux/led-class-flash.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/platform_device.h>
> +
> +#include <media/v4l2-flash-led-class.h>
> +
> +#define FLASH_TIMEOUT_DEFAULT		250000U /* 250ms */
> +#define FLASH_MAX_TIMEOUT_DEFAULT	300000U /* 300ms */
> +
> +struct sgm3140 {
> +	bool enabled;
> +	struct gpio_desc *flash_gpio;
> +	struct gpio_desc *enable_gpio;
> +	struct regulator *vin_regulator;
> +
> +	/* current timeout in us */
> +	u32 timeout;
> +	/* maximum timeout in us */
> +	u32 max_timeout;
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
> +static int sgm3140_strobe_set(struct led_classdev_flash *fled_cdev, bool state)
> +{
> +	struct sgm3140 *priv = flcdev_to_sgm3140(fled_cdev);
> +	int ret;
> +
> +	if (priv->enabled == state)
> +		return 0;
> +
> +	if (state) {
> +		ret = regulator_enable(priv->vin_regulator);
> +		if (ret) {
> +			dev_err(fled_cdev->led_cdev.dev,
> +				"failed to enable regulator: %d\n", ret);
> +			return ret;
> +		}
> +		gpiod_set_value_cansleep(priv->flash_gpio, 1);
> +		gpiod_set_value_cansleep(priv->enable_gpio, 1);
> +		mod_timer(&priv->powerdown_timer,
> +			  jiffies + usecs_to_jiffies(priv->timeout));
> +	} else {
> +		del_timer_sync(&priv->powerdown_timer);
> +		gpiod_set_value_cansleep(priv->enable_gpio, 0);
> +		gpiod_set_value_cansleep(priv->flash_gpio, 0);
> +		ret = regulator_disable(priv->vin_regulator);
> +		if (ret) {
> +			dev_err(fled_cdev->led_cdev.dev,
> +				"failed to disable regulator: %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +	priv->enabled = state;
> +
> +	return 0;
> +}
> +
> +static int sgm3140_strobe_get(struct led_classdev_flash *fled_cdev, bool *state)
> +{
> +	struct sgm3140 *priv = flcdev_to_sgm3140(fled_cdev);
> +
> +	*state = timer_pending(&priv->powerdown_timer);
> +
> +	return 0;
> +}
> +
> +static int sgm3140_timeout_set(struct led_classdev_flash *fled_cdev,
> +			       u32 timeout)
> +{
> +	struct sgm3140 *priv = flcdev_to_sgm3140(fled_cdev);
> +
> +	priv->timeout = timeout;
> +
> +	return 0;
> +}
> +
> +static const struct led_flash_ops sgm3140_flash_ops = {
> +	.strobe_set = sgm3140_strobe_set,
> +	.strobe_get = sgm3140_strobe_get,
> +	.timeout_set = sgm3140_timeout_set,
> +};
> +
> +static int sgm3140_brightness_set(struct led_classdev *led_cdev,
> +				  enum led_brightness brightness)
> +{
> +	struct led_classdev_flash *fled_cdev = lcdev_to_flcdev(led_cdev);
> +	struct sgm3140 *priv = flcdev_to_sgm3140(fled_cdev);
> +	bool enable = brightness == LED_ON;
> +	int ret;
> +
> +	if (priv->enabled == enable)
> +		return 0;
> +
> +	if (enable) {
> +		ret = regulator_enable(priv->vin_regulator);
> +		if (ret) {
> +			dev_err(led_cdev->dev,
> +				"failed to enable regulator: %d\n", ret);
> +			return ret;
> +		}
> +		gpiod_set_value_cansleep(priv->enable_gpio, 1);
> +	} else {
> +		gpiod_set_value_cansleep(priv->enable_gpio, 0);
> +		ret = regulator_disable(priv->vin_regulator);
> +		if (ret) {
> +			dev_err(led_cdev->dev,
> +				"failed to disable regulator: %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +	priv->enabled = enable;
> +
> +	return 0;
> +}
> +
> +static void sgm3140_powerdown_timer(struct timer_list *t)
> +{
> +	struct sgm3140 *priv = from_timer(priv, t, powerdown_timer);
> +
> +	gpiod_set_value(priv->enable_gpio, 0);
> +	gpiod_set_value(priv->flash_gpio, 0);
> +	regulator_disable(priv->vin_regulator);
> +
> +	priv->enabled = false;
> +}
> +
> +static void sgm3140_init_flash_timeout(struct sgm3140 *priv)
> +{
> +	struct led_classdev_flash *fled_cdev = &priv->fled_cdev;
> +	struct led_flash_setting *s;
> +
> +	/* Init flash timeout setting */
> +	s = &fled_cdev->timeout;
> +	s->min = 1;
> +	s->max = priv->max_timeout;
> +	s->step = 1;
> +	s->val = FLASH_TIMEOUT_DEFAULT;
> +}
> +
> +#if IS_ENABLED(CONFIG_V4L2_FLASH_LED_CLASS)
> +static void sgm3140_init_v4l2_flash_config(struct sgm3140 *priv,
> +					struct v4l2_flash_config *v4l2_sd_cfg)
> +{
> +	struct led_classdev *led_cdev = &priv->fled_cdev.led_cdev;
> +	struct led_flash_setting *s;
> +
> +	strscpy(v4l2_sd_cfg->dev_name, led_cdev->dev->kobj.name,
> +		sizeof(v4l2_sd_cfg->dev_name));
> +
> +	/* Init flash intensity setting */
> +	s = &v4l2_sd_cfg->intensity;
> +	s->min = 0;
> +	s->max = 1;
> +	s->step = 1;
> +	s->val = 1;
> +}
> +
> +#else
> +static void sgm3140_init_v4l2_flash_config(struct sgm3140 *priv,
> +					struct v4l2_flash_config *v4l2_sd_cfg)
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
> +	struct v4l2_flash_config v4l2_sd_cfg = {};
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
> +			dev_err(&pdev->dev,
> +				"Failed to request flash gpio: %d\n", ret);
> +		return ret;
> +	}
> +
> +	priv->enable_gpio = devm_gpiod_get(&pdev->dev, "enable", GPIOD_OUT_LOW);
> +	ret = PTR_ERR_OR_ZERO(priv->enable_gpio);
> +	if (ret) {
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(&pdev->dev,
> +				"Failed to request enable gpio: %d\n", ret);
> +		return ret;
> +	}
> +
> +	priv->vin_regulator = devm_regulator_get(&pdev->dev, "vin");
> +	ret = PTR_ERR_OR_ZERO(priv->vin_regulator);
> +	if (ret) {
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(&pdev->dev,
> +				"Failed to request regulator: %d\n", ret);
> +		return ret;
This regulator is optional so why would you return here?  You should 
only return if -EPROBE_DEFER.
> +	}
> +
> +	child_node = of_get_next_available_child(pdev->dev.of_node, NULL);

Maybe this should be the first check before doing all the processing to 
make sure that the DT is not

malformed.

> +	if (!child_node) {
> +		dev_err(&pdev->dev,
> +			"No DT child node found for connected LED.\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = of_property_read_u32(child_node, "flash-max-timeout-us",
> +				   &priv->max_timeout);
> +	if (ret) {
> +		priv->max_timeout = FLASH_MAX_TIMEOUT_DEFAULT;
> +		dev_warn(&pdev->dev,
> +			 "flash-max-timeout-us DT property missing\n");
> +	}
> +
> +	/*
> +	 * Set default timeout to FLASH_DEFAULT_TIMEOUT except if max_timeout
> +	 * from DT is lower.
> +	 */
> +	priv->timeout = min(priv->max_timeout, FLASH_TIMEOUT_DEFAULT);
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
> +	sgm3140_init_flash_timeout(priv);
> +
> +	init_data.fwnode = of_fwnode_handle(child_node);
> +
> +	platform_set_drvdata(pdev, priv);
> +
> +	/* Register in the LED subsystem */
> +	ret = devm_led_classdev_flash_register_ext(&pdev->dev,
> +						   fled_cdev, &init_data);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to register flash device: %d\n",
> +			ret);
> +		goto err;
> +	}
> +
> +	sgm3140_init_v4l2_flash_config(priv, &v4l2_sd_cfg);
> +
> +	/* Create V4L2 Flash subdev */
> +	priv->v4l2_flash = v4l2_flash_init(&pdev->dev,
> +					   of_fwnode_handle(child_node),
> +					   fled_cdev, NULL,
> +					   &v4l2_sd_cfg);
> +	if (IS_ERR(priv->v4l2_flash)) {
> +		ret = PTR_ERR(priv->v4l2_flash);
> +		goto err;
Not sure why this is here you are not in a for loop and this will fall 
through anyway to the err label.
> +	}
> +
> +err:
> +	of_node_put(child_node);
> +	return ret;
> +}
> +
Dan
