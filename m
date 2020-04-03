Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 961AF19DEA3
	for <lists+linux-leds@lfdr.de>; Fri,  3 Apr 2020 21:43:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727792AbgDCTnp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 3 Apr 2020 15:43:45 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:56846 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728001AbgDCTnp (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 3 Apr 2020 15:43:45 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 033Jha1S002351;
        Fri, 3 Apr 2020 14:43:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1585943016;
        bh=xXd+5AwGNJFgwyY081cDvIo2y0k7mAEOlzRr4E8sQog=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=umvOf9x4qMnPGdmEPSwB+KSzGQph3s4xg5mMRyFCP28ebfw2msfzd+/SH/seioXhU
         xS2FV2TjSPEg6xMsmmlsCvWI8uHB1lKI9Csv7K8d6aosE0ZIvnxU8h2xcL0Wd4Vl8s
         B2XGWUjU9Wu5VL5CgDSwWhnAEm0rakrIBevqi6j8=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 033JhaL6072883
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 3 Apr 2020 14:43:36 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 3 Apr
 2020 14:43:35 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 3 Apr 2020 14:43:35 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 033JhZ9S018356;
        Fri, 3 Apr 2020 14:43:35 -0500
Subject: Re: [PATCH v3] leds: ariel: Add driver for status LEDs on Dell Wyse
 3020
To:     Lubomir Rintel <lkundrak@v3.sk>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
CC:     Pavel Machek <pavel@ucw.cz>, <linux-kernel@vger.kernel.org>,
        <linux-leds@vger.kernel.org>
References: <20200322074134.79237-1-lkundrak@v3.sk>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <ef7e8f03-0a43-156e-b86e-3ab3887f0245@ti.com>
Date:   Fri, 3 Apr 2020 14:37:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200322074134.79237-1-lkundrak@v3.sk>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Lubomir

On 3/22/20 2:41 AM, Lubomir Rintel wrote:
> This adds support for controlling the LEDs attached to the Embedded
> Controller on a Dell Wyse 3020 "Ariel" board.
>
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
>
> ---
> Changes since v2:
> - Hopefully sending out the correct patch this time...
>
> Changes since v1:
> - Reduce code duplication with a loop
> - Drop "ariel:" prefix from led names
> - Do not print a message after a successful probe
> ---
>   drivers/leds/Kconfig      |  11 ++++
>   drivers/leds/Makefile     |   1 +
>   drivers/leds/leds-ariel.c | 133 ++++++++++++++++++++++++++++++++++++++
>   3 files changed, 145 insertions(+)
>   create mode 100644 drivers/leds/leds-ariel.c
>
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index d82f1dea37111..66424ee54cc01 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -83,6 +83,17 @@ config LEDS_APU
>   	  To compile this driver as a module, choose M here: the
>   	  module will be called leds-apu.
>   
> +config LEDS_ARIEL
> +	tristate "Dell Wyse 3020 status LED support"
> +	depends on LEDS_CLASS
> +	depends on (MACH_MMP3_DT && MFD_ENE_KB3930) || COMPILE_TEST
> +	help
> +	  This driver adds support for controlling the front panel status
> +	  LEDs on Dell Wyse 3020 (Ariel) board via the KB3930 Embedded
> +	  Controller.
> +
> +	  Say Y to if your machine is a Dell Wyse 3020 thin client.
> +
>   config LEDS_AS3645A
>   	tristate "AS3645A and LM3555 LED flash controllers support"
>   	depends on I2C && LEDS_CLASS_FLASH
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index d7e1107753fb1..bf3b22038d113 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -10,6 +10,7 @@ obj-$(CONFIG_LEDS_TRIGGERS)		+= led-triggers.o
>   obj-$(CONFIG_LEDS_88PM860X)		+= leds-88pm860x.o
>   obj-$(CONFIG_LEDS_AAT1290)		+= leds-aat1290.o
>   obj-$(CONFIG_LEDS_APU)			+= leds-apu.o
> +obj-$(CONFIG_LEDS_ARIEL)		+= leds-ariel.o
>   obj-$(CONFIG_LEDS_AS3645A)		+= leds-as3645a.o
>   obj-$(CONFIG_LEDS_AN30259A)		+= leds-an30259a.o
>   obj-$(CONFIG_LEDS_BCM6328)		+= leds-bcm6328.o
> diff --git a/drivers/leds/leds-ariel.c b/drivers/leds/leds-ariel.c
> new file mode 100644
> index 0000000000000..8fc56722e12f4
> --- /dev/null
> +++ b/drivers/leds/leds-ariel.c
> @@ -0,0 +1,133 @@
> +// SPDX-License-Identifier: BSD-2-Clause OR GPL-2.0-or-later
> +/*
> + * Dell Wyse 3020 a.k.a. "Ariel" Embedded Controller LED Driver
> + *
> + * Copyright (C) 2020 Lubomir Rintel
> + */
> +
> +#include <linux/module.h>
> +#include <linux/leds.h>
> +#include <linux/regmap.h>
> +#include <linux/of_platform.h>
> +
> +enum ec_index {
> +	EC_BLUE_LED	= 0x01,
> +	EC_AMBER_LED	= 0x02,

Defining the value after the 0x0 is unnecessary as enums are incremental 
only the first value needs to be defined if the following values are in 
numerical order

Can these also be #defined instead of an enum?  Not requesting them to 
be just wondering about the design decision here.

> +	EC_GREEN_LED	= 0x03,
> +};
> +
> +enum {
> +	EC_LED_OFF	= 0x00,
> +	EC_LED_STILL	= 0x01,
Same comment as above
> +	EC_LED_FADE	= 0x02,
> +	EC_LED_BLINK	= 0x03,
> +};
> +
> +struct ariel_led {
> +	struct regmap *ec_ram;
> +	enum ec_index ec_index;
> +	struct led_classdev led_cdev;
> +};
> +
> +#define led_cdev_to_ariel_led(c) container_of(c, struct ariel_led, led_cdev)
> +
> +static enum led_brightness ariel_led_get(struct led_classdev *led_cdev)
> +{
> +	struct ariel_led *led = led_cdev_to_ariel_led(led_cdev);
> +	unsigned int led_status = 0;
> +
> +	if (regmap_read(led->ec_ram, led->ec_index, &led_status))
> +		return LED_OFF;
> +
> +	if (led_status == EC_LED_STILL)
> +		return LED_FULL;
> +	else
else is not needed here
> +		return LED_OFF;
> +}
> +
> +static void ariel_led_set(struct led_classdev *led_cdev,
> +			  enum led_brightness brightness)
> +{
> +	struct ariel_led *led = led_cdev_to_ariel_led(led_cdev);
> +
> +	if (brightness == LED_OFF)
> +		regmap_write(led->ec_ram, led->ec_index, EC_LED_OFF);
> +	else
> +		regmap_write(led->ec_ram, led->ec_index, EC_LED_STILL);
> +}
> +
> +static int ariel_blink_set(struct led_classdev *led_cdev,
> +			   unsigned long *delay_on, unsigned long *delay_off)
> +{
> +	struct ariel_led *led = led_cdev_to_ariel_led(led_cdev);
> +
> +	if (*delay_on == 0 && *delay_off == 0)
> +		return -EINVAL;
> +
> +	if (*delay_on == 0) {
> +		regmap_write(led->ec_ram, led->ec_index, EC_LED_OFF);
> +	} else if (*delay_off == 0) {
> +		regmap_write(led->ec_ram, led->ec_index, EC_LED_STILL);
> +	} else {
> +		*delay_on = 500;
> +		*delay_off = 500;
> +		regmap_write(led->ec_ram, led->ec_index, EC_LED_BLINK);
> +	}
> +
> +	return 0;
> +}
> +
> +#define NLEDS 3

This define needs to be more unique.

Something like EC_NLEDS or EC_NUM_LEDS and should be moved to the top of 
the file under the #includes

> +
> +static int ariel_led_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct ariel_led *leds;
> +	struct regmap *ec_ram;
> +	int ret;
> +	int i;
> +
> +	leds = devm_kcalloc(dev, NLEDS, sizeof(*leds), GFP_KERNEL);
> +	if (!leds)
> +		return -ENOMEM;
> +
> +	ec_ram = dev_get_regmap(dev->parent, "ec_ram");
Maybe this should be checked before memory is allocated.
> +	if (!ec_ram)
> +		return -ENODEV;
> +
> +	leds[0].ec_index = EC_BLUE_LED;
> +	leds[0].led_cdev.name = "blue:power",
> +	leds[0].led_cdev.default_trigger = "default-on";
> +
> +	leds[1].ec_index = EC_AMBER_LED;
> +	leds[1].led_cdev.name = "amber:status",
> +
> +	leds[2].ec_index = EC_GREEN_LED;
> +	leds[2].led_cdev.name = "green:status",
> +	leds[2].led_cdev.default_trigger = "default-on";
> +
> +	for (i = 0; i < NLEDS; i++) {

I don't understand this loop.  i is incremented but never used.

should the below be leds[i]?

> +		leds[0].ec_ram = ec_ram;
> +		leds[0].led_cdev.brightness_get = ariel_led_get;
> +		leds[0].led_cdev.brightness_set = ariel_led_set;
> +		leds[0].led_cdev.blink_set = ariel_blink_set;
> +
> +		ret = devm_led_classdev_register(dev, &leds[0].led_cdev);
> +		if (ret)
> +			return ret;
> +	}
> +

Dan


