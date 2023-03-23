Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08C5F6C60E6
	for <lists+linux-leds@lfdr.de>; Thu, 23 Mar 2023 08:36:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230387AbjCWHgW (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 Mar 2023 03:36:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231140AbjCWHgS (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 Mar 2023 03:36:18 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0CBE17CF7;
        Thu, 23 Mar 2023 00:36:13 -0700 (PDT)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1DBA18B;
        Thu, 23 Mar 2023 08:36:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1679556971;
        bh=ER8fZix82y+H8kvq4/OAYKfbqFytO/UhpcY/GoytO8o=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=YpiHbCB3AMSMJngQclzwHV2uqFYoTnr+pADXFmUDTlDZRM7pqSImpGT83eW75Dw2c
         QAHEJHdefbepDxYmjy0VjETu/lHpjmGL89lHelLyhd1cbbBt2PPUUnhHzvOENHjeFa
         BVvy0bUEerpMylXbnno9KnYfTvY4yXhJ5RuuyWpQ=
Message-ID: <aac749fa-3f33-6fb3-cfea-e7a11fd1d384@ideasonboard.com>
Date:   Thu, 23 Mar 2023 07:36:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 3/3] leds: tps68470: Add LED control for tps68470
To:     Kate Hsuan <hpa@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Daniel Scally <djrscally@gmail.com>,
        Mark Gross <markgross@kernel.org>
References: <20230321153718.1355511-1-hpa@redhat.com>
 <20230321153718.1355511-4-hpa@redhat.com>
Content-Language: en-US
From:   Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20230321153718.1355511-4-hpa@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Kate

On 21/03/2023 15:37, Kate Hsuan wrote:
> There are two LED controllers, LEDA indicator LED and LEDB flash LED for
> tps68470. LEDA can be enabled by setting TPS68470_ILEDCTL_ENA. Moreover,
> tps68470 provides four levels of power status for LEDB. If the
> properties called "ti,ledb-current" can be found, the current will be
> set according to the property values. These two LEDs can be controlled
> through the LED class of sysfs (tps68470-leda and tps68470-ledb).
> 
> Signed-off-by: Kate Hsuan <hpa@redhat.com>
> ---

This looks good to me now: Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
>   drivers/leds/Kconfig         |  12 +++
>   drivers/leds/Makefile        |   1 +
>   drivers/leds/leds-tps68470.c | 185 +++++++++++++++++++++++++++++++++++
>   3 files changed, 198 insertions(+)
>   create mode 100644 drivers/leds/leds-tps68470.c
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 9dbce09eabac..ab9073b2cfef 100644
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
> +	  It provides two LED controllers, with the ability to drive 2
> +	  indicator LEDs and 2 flash LEDs.
> +
> +	  To compile this driver as a module, choose M and it will be
> +	  called leds-tps68470
> +
>   config LEDS_IP30
>   	tristate "LED support for SGI Octane machines"
>   	depends on LEDS_CLASS
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index d30395d11fd8..515a69953e73 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -80,6 +80,7 @@ obj-$(CONFIG_LEDS_TCA6507)		+= leds-tca6507.o
>   obj-$(CONFIG_LEDS_TI_LMU_COMMON)	+= leds-ti-lmu-common.o
>   obj-$(CONFIG_LEDS_TLC591XX)		+= leds-tlc591xx.o
>   obj-$(CONFIG_LEDS_TPS6105X)		+= leds-tps6105x.o
> +obj-$(CONFIG_LEDS_TPS68470)		+= leds-tps68470.o
>   obj-$(CONFIG_LEDS_TURRIS_OMNIA)		+= leds-turris-omnia.o
>   obj-$(CONFIG_LEDS_WM831X_STATUS)	+= leds-wm831x-status.o
>   obj-$(CONFIG_LEDS_WM8350)		+= leds-wm8350.o
> diff --git a/drivers/leds/leds-tps68470.c b/drivers/leds/leds-tps68470.c
> new file mode 100644
> index 000000000000..35aeb5db89c8
> --- /dev/null
> +++ b/drivers/leds/leds-tps68470.c
> @@ -0,0 +1,185 @@
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
> +#include <linux/leds.h>
> +#include <linux/mfd/tps68470.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +
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
> +	struct regmap *regmap = tps68470->regmap;
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
> +		return dev_err_probe(led_cdev->dev, -EINVAL, "failed on reading register\n");
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
> +}
> +
> +
> +static int tps68470_ledb_current_init(struct platform_device *pdev,
> +				      struct tps68470_device *tps68470)
> +{
> +	int ret = 0;
> +	unsigned int curr;
> +
> +	/* configure LEDB current if the properties can be got */
> +	if (!device_property_read_u32(&pdev->dev, "ti,ledb-current", &curr)) {
> +		if (curr > CTRLB_16MA) {
> +			dev_err(&pdev->dev,
> +				"Invalid LEDB current value: %d\n",
> +				curr);
> +			return -EINVAL;
> +		}
> +		ret = regmap_update_bits(tps68470->regmap, TPS68470_REG_ILEDCTL,
> +					 TPS68470_ILEDCTL_CTRLB, curr);
> +	}
> +	return ret;
> +}
> +
> +static int tps68470_leds_probe(struct platform_device *pdev)
> +{
> +	int i = 0;
> +	int ret = 0;
> +	struct tps68470_device *tps68470;
> +	struct tps68470_led *led;
> +	struct led_classdev *lcdev;
> +
> +	tps68470 = devm_kzalloc(&pdev->dev, sizeof(struct tps68470_device),
> +				GFP_KERNEL);
> +	if (!tps68470)
> +		return -ENOMEM;
> +
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
> +
> +		if (i == TPS68470_ILED_B) {
> +			ret = tps68470_ledb_current_init(pdev, tps68470);
> +			if (ret)
> +				goto err_exit;
> +		}
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

