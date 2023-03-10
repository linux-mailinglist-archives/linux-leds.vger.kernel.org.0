Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC3C36B3C93
	for <lists+linux-leds@lfdr.de>; Fri, 10 Mar 2023 11:43:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229928AbjCJKne (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 10 Mar 2023 05:43:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230094AbjCJKn3 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 10 Mar 2023 05:43:29 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FD592213B;
        Fri, 10 Mar 2023 02:43:09 -0800 (PST)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1AC7EEF;
        Fri, 10 Mar 2023 11:43:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1678444987;
        bh=byZlTT6gn9d54vRBsBgNVEzzMXZ/G+34sAv8I4k3kbA=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=UPxJ7byFum9roFxJAXBwxspXY1IBS09bHycwORPtrt8YfIXLdtiqetTeu/j5SY9K9
         ekBY3ajoXtBmCnKA+hGnMv2JI11QxlDF4g6HIuVVVULBdyUmEFCI7F2X+48lx8Hxz0
         WtsF+5Ws3HZljkywYvBhjI6K/FKeGT+gy0erHXTU=
Message-ID: <6644d2ef-10c8-43df-987c-b688d3f75f11@ideasonboard.com>
Date:   Fri, 10 Mar 2023 10:43:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 3/4] leds: tps68470: Add LED control for tps68470
To:     Kate Hsuan <hpa@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Daniel Scally <djrscally@gmail.com>,
        Mark Gross <markgross@kernel.org>
References: <20230310095635.813262-1-hpa@redhat.com>
 <20230310095635.813262-4-hpa@redhat.com>
Content-Language: en-US
From:   Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20230310095635.813262-4-hpa@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Kate - thanks for the v2

On 10/03/2023 09:56, Kate Hsuan wrote:
> There are two LED controllers, LEDA indicator LED and LEDB flash LED for
> tps68470. LEDA can be enabled by setting TPS68470_ILEDCTL_ENA. Moreover,
> tps68470 provides four levels of power status for LEDB. If the
> properties called "ti,ledb-current" can be found, the current will be
> set according to the property values. These two LEDs can be controlled
> through the LED class of sysfs (tps68470-leda and tps68470-ledb).
> 
> Signed-off-by: Kate Hsuan <hpa@redhat.com>
> ---
>   drivers/leds/Kconfig         |  12 +++
>   drivers/leds/Makefile        |   1 +
>   drivers/leds/leds-tps68470.c | 182 +++++++++++++++++++++++++++++++++++
>   3 files changed, 195 insertions(+)
>   create mode 100644 drivers/leds/leds-tps68470.c
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 9dbce09eabac..fd26036b3c61 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -827,6 +827,18 @@ config LEDS_TPS6105X
>   	  It is a single boost converter primarily for white LEDs and
>   	  audio amplifiers.
>   
> +config LEDS_TPS68470
> +	tristate "LED support for TI TPS68470"
> +	depends on LEDS_CLASS
> +	depends on INTEL_SKL_INT3472
> +	help
> +	  This driver supports TPS68470 PMIC with LED chip.
> +	  It provide two LED controllers, including an indicator LED
> +	  and a flash LED.

s/provide/provides. Also maybe "It provides two LED controllers, with the ability to drive 2 
indicator LEDs and 2 flash LEDs". I actually got the WLED part working now finally so I'll send 
patches on top of this series if that's ok?

> +
> +	  To compile this driver as a module, choose M and it will be
> +	  called leds-tps68470
> +
>   config LEDS_IP30
>   	tristate "LED support for SGI Octane machines"
>   	depends on LEDS_CLASS
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index d30395d11fd8..b284bc0daa98 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -84,6 +84,7 @@ obj-$(CONFIG_LEDS_TURRIS_OMNIA)		+= leds-turris-omnia.o
>   obj-$(CONFIG_LEDS_WM831X_STATUS)	+= leds-wm831x-status.o
>   obj-$(CONFIG_LEDS_WM8350)		+= leds-wm8350.o
>   obj-$(CONFIG_LEDS_WRAP)			+= leds-wrap.o
> +obj-$(CONFIG_LEDS_TPS68470)		+= leds-tps68470.o
>   
>   # LED SPI Drivers
>   obj-$(CONFIG_LEDS_CR0014114)		+= leds-cr0014114.o
> diff --git a/drivers/leds/leds-tps68470.c b/drivers/leds/leds-tps68470.c
> new file mode 100644
> index 000000000000..98bb56153690
> --- /dev/null
> +++ b/drivers/leds/leds-tps68470.c
> @@ -0,0 +1,182 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * LED driver for TPS68470 PMIC
> + *
> + * Copyright (C) 2023 Red Hat
> + *
> + * Authors:
> + *	Kate Hsuan <hpa@redhat.com>
> + */
> +
> +#include <linux/gpio/driver.h>

Not needed I think?

> +#include <linux/mfd/tps68470.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/leds.h>

Alphabetical order?
> +
> +#define lcdev_to_led(led_cdev) \
> +	container_of(led_cdev, struct tps68470_led, lcdev)
> +
> +#define led_to_tps68470(led, index) \
> +	container_of(led, struct tps68470_device, leds[index])
> +
> +enum tps68470_led_ids {
> +	TPS68470_ILED_A,
> +	TPS68470_ILED_B,
> +	TPS68470_NUM_LEDS
> +};
> +
> +static const char *tps68470_led_names[] = {
> +	[TPS68470_ILED_A] = "tps68470-iled_a",
> +	[TPS68470_ILED_B] = "tps68470-iled_b",
> +};
> +
> +struct tps68470_led {
> +	unsigned int led_id;
> +	struct led_classdev lcdev;
> +};
> +
> +struct tps68470_device {
> +	struct device *dev;
> +	struct regmap *regmap;
> +	struct tps68470_led leds[TPS68470_NUM_LEDS];
> +};
> +
> +enum ctrlb_current {
> +	CTRLB_2MA	= 0,
> +	CTRLB_4MA	= 1,
> +	CTRLB_8MA	= 2,
> +	CTRLB_16MA	= 3,
> +};
> +
> +static int tps68470_brightness_set(struct led_classdev *led_cdev, enum led_brightness brightness)
> +{
> +	struct tps68470_led *led = lcdev_to_led(led_cdev);
> +	struct tps68470_device *tps68470 = led_to_tps68470(led, led->led_id);
> +	struct regmap *regmap = tps68470->regmap
This would work fine as is...but I would maybe add something like

	if (state > LED_ON)
		return -EINVAL;

So that brightness values of > 1 aren't just silently accepted...or does the LED core already 
prevent that? If so it's fine.

> +
> +	switch (led->led_id) {
> +	case TPS68470_ILED_A:
> +		return regmap_update_bits(regmap, TPS68470_REG_ILEDCTL, TPS68470_ILEDCTL_ENA,
> +					  brightness ? TPS68470_ILEDCTL_ENA : 0);
> +	case TPS68470_ILED_B:
> +		return regmap_update_bits(regmap, TPS68470_REG_ILEDCTL, TPS68470_ILEDCTL_ENB,
> +					  brightness ? TPS68470_ILEDCTL_ENB : 0);
> +	}
> +	return -EINVAL;
> +}
> +
> +static enum led_brightness tps68470_brightness_get(struct led_classdev *led_cdev)
> +{
> +	struct tps68470_led *led = lcdev_to_led(led_cdev);
> +	struct tps68470_device *tps68470 = led_to_tps68470(led, led->led_id);
> +	struct regmap *regmap = tps68470->regmap;
> +	int ret = 0;
> +	int value = 0;
> +
> +	ret =  regmap_read(regmap, TPS68470_REG_ILEDCTL, &value);
> +	if (ret)
> +		goto error;

Just return dev_err_probe(led_cdev->dev, -EINVAL, "failed on reading register\n") here imo.
> +
> +	switch (led->led_id) {
> +	case TPS68470_ILED_A:
> +		value = value & TPS68470_ILEDCTL_ENA;
> +		break;
> +	case TPS68470_ILED_B:
> +		value = value & TPS68470_ILEDCTL_ENB;
> +		break;
> +	}
> +
> +	return value ? LED_ON : LED_OFF;
> +
> +error:
> +	dev_err(led_cdev->dev, "Failed on reading register\n");
> +	return -EINVAL;
> +}
> +
> +static int tps68470_leds_probe(struct platform_device *pdev)
> +{
> +	int i = 0;
> +	int ret = 0;
> +	unsigned int curr;
> +	struct tps68470_device *tps68470;
> +	struct tps68470_led *led;
> +	struct led_classdev *lcdev;
> +
> +	tps68470 = devm_kzalloc(&pdev->dev, sizeof(struct tps68470_device),
> +				GFP_KERNEL);

No -ENOMEM check here?

> +	tps68470->dev = &pdev->dev;
> +	tps68470->regmap = dev_get_drvdata(pdev->dev.parent);
> +
> +	for (i = 0; i < TPS68470_NUM_LEDS; i++) {
> +		led = &tps68470->leds[i];
> +		lcdev = &led->lcdev;
> +
> +		led->led_id = i;
> +
> +		lcdev->name = devm_kasprintf(tps68470->dev, GFP_KERNEL, "%s::%s",
> +					     tps68470_led_names[i], LED_FUNCTION_INDICATOR);
> +		if (!lcdev->name)
> +			return -ENOMEM;
> +
> +		lcdev->max_brightness = 1;
> +		lcdev->brightness = 0;
> +		lcdev->brightness_set_blocking = tps68470_brightness_set;
> +		lcdev->brightness_get = tps68470_brightness_get;
> +		lcdev->dev = &pdev->dev;
> +
> +		ret = devm_led_classdev_register(tps68470->dev, lcdev);
> +		if (ret) {
> +			dev_err_probe(tps68470->dev, ret,
> +				      "error registering led\n");
> +			goto err_exit;
> +		}
> +	}
> +
> +	/* configure LEDB current if the properties can be got */
> +	if (!device_property_read_u32(&pdev->dev, "ti,ledb-current", &curr)) {
> +		switch (curr) {
> +		case  2:
> +			curr = CTRLB_2MA;
> +			break;
> +		case  4:
> +			curr = CTRLB_4MA;
> +			break;
> +		case  8:
> +			curr = CTRLB_8MA;
> +			break;
> +		case 16:
> +			curr = CTRLB_16MA;
> +			break;
> +		default:
> +			dev_err(&pdev->dev, "Invalid LEDB curr value: %d\n", curr);
> +			return -EINVAL;

There's no jump to err_exit here...I think that this whole section should go above the registration 
of the LEDS...and probably also into its own function.

> +		}
> +		ret = regmap_update_bits(tps68470->regmap, TPS68470_REG_ILEDCTL,
> +					 TPS68470_ILEDCTL_CTRLB, curr);
> +	}
> +
> +err_exit:
> +	if (ret) {
> +		for (i = 0; i < TPS68470_NUM_LEDS; i++) {
> +			if (tps68470->leds[i].lcdev.name)
> +				devm_led_classdev_unregister(&pdev->dev,
> +							     &tps68470->leds[i].lcdev);
> +		}
> +	}
> +
> +	return ret;
> +}
> +static struct platform_driver tps68470_led_driver = {
> +	.driver = {
> +		   .name = "tps68470-led",
> +	},
> +	.probe = tps68470_leds_probe,
> +};
> +
> +module_platform_driver(tps68470_led_driver);
> +
> +MODULE_ALIAS("platform:tps68470-led");
> +MODULE_DESCRIPTION("LED driver for TPS68470 PMIC");
> +MODULE_LICENSE("GPL v2");

