Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B749817EBD0
	for <lists+linux-leds@lfdr.de>; Mon,  9 Mar 2020 23:18:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727097AbgCIWSx (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 9 Mar 2020 18:18:53 -0400
Received: from retiisi.org.uk ([95.216.213.190]:51644 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726656AbgCIWSw (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 9 Mar 2020 18:18:52 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 3132D634C87;
        Tue, 10 Mar 2020 00:18:05 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1jBQir-0001Fd-8K; Tue, 10 Mar 2020 00:18:05 +0200
Date:   Tue, 10 Mar 2020 00:18:05 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Icenowy Zheng <icenowy@aosc.io>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 3/3] leds: add sgm3140 driver
Message-ID: <20200309221805.GD2619@valkosipuli.retiisi.org.uk>
References: <20200309203558.305725-1-luca@z3ntu.xyz>
 <20200309203558.305725-4-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200309203558.305725-4-luca@z3ntu.xyz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Luca,

Thanks for the patch.

On Mon, Mar 09, 2020 at 09:35:58PM +0100, Luca Weiss wrote:
> Add a driver for the SGMICRO SGM3140 Buck/Boost Charge Pump LED driver.
> 
> This device is controlled by two GPIO pins, one for enabling and the
> second one for switching between torch and flash mode.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
> Changes since RFC:
> - address review comments from Jacek Anaszewski:
>   - implement strobe_get op
>   - implement timeout_set op
>   - init v4l2_sd_cfg variable
>   - remove init_data.devicename assignemnt
>   - use devm_ version of led_classdev_flash_register_ext
>   - release child_node in case of success
> 
>  drivers/leds/Kconfig        |   9 ++
>  drivers/leds/Makefile       |   1 +
>  drivers/leds/leds-sgm3140.c | 260 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 270 insertions(+)
>  create mode 100644 drivers/leds/leds-sgm3140.c
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 4b68520ac251..9206fc66799d 100644
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
> +	  Pump LED Driver.
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
> index 000000000000..357f4cbb279a
> --- /dev/null
> +++ b/drivers/leds/leds-sgm3140.c
> @@ -0,0 +1,260 @@
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
> +#define FLASH_TIMEOUT_DEFAULT		250000 /* 250ms */
> +#define FLASH_MAX_TIMEOUT_DEFAULT	300000 /* 300ms */

Add U, and you can remove the cast elsewhere.

> +
> +struct sgm3140 {
> +	struct gpio_desc *flash_gpio;
> +	struct gpio_desc *enable_gpio;
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
> +
> +	if (state) {
> +		gpiod_set_value_cansleep(priv->flash_gpio, 1);
> +		gpiod_set_value_cansleep(priv->enable_gpio, 1);
> +		mod_timer(&priv->powerdown_timer,
> +			  jiffies + usecs_to_jiffies(priv->timeout));
> +	} else {
> +		gpiod_set_value_cansleep(priv->enable_gpio, 0);
> +		gpiod_set_value_cansleep(priv->flash_gpio, 0);
> +		del_timer_sync(&priv->powerdown_timer);
> +	}
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
> +static int sgm3140_timeout_set(struct led_classdev_flash *fled_cdev, u32 timeout)
> +{
> +	struct sgm3140 *priv = flcdev_to_sgm3140(fled_cdev);
> +
> +	priv->timeout = timeout;
> +
> +	return 0;
> +}
> +
> +struct led_flash_ops sgm3140_flash_ops = {

const?

> +	.strobe_set = sgm3140_strobe_set,
> +	.strobe_get = sgm3140_strobe_get,
> +	.timeout_set = sgm3140_timeout_set,
> +};
> +
> +int sgm3140_brightness_set(struct led_classdev *led_cdev,
> +			   enum led_brightness brightness)

static

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

You'll need a work queue to use sleeping gpiod_set. In this case, I'd use
gpiod_set_value() instead, as elsewhere. I think it's unlikely you'd come
across a board where it'd sleep.

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
> +					   struct v4l2_flash_config *v4l2_sd_cfg)
> +{
> +	struct led_classdev *led_cdev = &priv->fled_cdev.led_cdev;
> +	struct led_flash_setting *s;
> +
> +	strlcpy(v4l2_sd_cfg->dev_name, led_cdev->dev->kobj.name,
> +		sizeof(v4l2_sd_cfg->dev_name));

strscpy()?

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

The prototype doesn't change. I'd put the #if ... #endif inside the
function. Up to you.

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

You could wrap this. There are a few more above and below, too.

> +		return -EINVAL;
> +	}
> +
> +
> +	ret = of_property_read_u32(child_node, "flash-max-timeout-us",
> +				   &priv->max_timeout);
> +	if (ret < 0) {
> +		priv->max_timeout = FLASH_MAX_TIMEOUT_DEFAULT;
> +		dev_warn(&pdev->dev, "flash-max-timeout-us DT property missing\n");
> +	}
> +
> +	/*
> +	 * Set default timeout to FLASH_DEFAULT_TIMEOUT except if max_timeout
> +	 * from DT is lower.
> +	 */
> +	priv->timeout = min(priv->max_timeout, (u32)FLASH_TIMEOUT_DEFAULT);
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
> +	ret = devm_led_classdev_flash_register_ext(&pdev->dev, fled_cdev, &init_data);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "Failed to register flash device: %d\n",
> +			ret);
> +		goto err;
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
> +		goto err;
> +	}
> +
> +err:
> +	of_node_put(child_node);
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

-- 
Kind regards,

Sakari Ailus
