Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31992262BDE
	for <lists+linux-leds@lfdr.de>; Wed,  9 Sep 2020 11:30:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726489AbgIIJae (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 9 Sep 2020 05:30:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725826AbgIIJac (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 9 Sep 2020 05:30:32 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FCE5C061573;
        Wed,  9 Sep 2020 02:30:32 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id md22so1072667pjb.0;
        Wed, 09 Sep 2020 02:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f2279BonLAVVWCMfCaFUngcoVi5EiMYWkHxInhXYdiw=;
        b=THQ3JIpXmopRL+ZAgZdbsI/vfwizNSZMr0fC/PNt7eLrv1ehTAmuSsCtVZoZ5ZSBoX
         8/IpDqrb3Zkz9y6yEvohxxpwSejaUcs7SyuwiYcyIhG5DV41B1RSdERVcrHEUOOnuD+p
         nOSJrlLj7rG9w2i+fpgXXyCmxOpa3G/w3miH2nef9SXHPK0s6Gq1ivqYlIrIIgWBG9LV
         Z6as46+HxaawhtRZKs4Y2yhjmXVlr6+EztfnfQmJBvCnU1CCPKlC98I1ISN6MP2i73kb
         PsSW9MWY1AGdUnV0YnscdqNuJKJW6mXxaJO+Hn64BtpaR3iyfmmpiRUCYcEMr4VKktyS
         fe+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f2279BonLAVVWCMfCaFUngcoVi5EiMYWkHxInhXYdiw=;
        b=uk/BI93mV9Zd89CAm3r9567+Ii400JElvAKTezxXHjwZWRsIx31IyrO5S1G92c/rIh
         oZVabKiqtg4wFDC2/9NoQFJGQubXZVP7O9E1qQcTIXiuW75KqeXK85ELJztGkuxGMsjc
         oEj+xF9pgELjtN5nJVUBLVQb5jrN5cbnXv5tMniJ6dh7ZcZ7zdGKdUH0eBH3f4ctG+8T
         wx/MsOZ3L+ghl0s4Eo2ndUFk5/SnUgFF9Wt7dwGZvjNV2pRVdf+vJ7Nh3LpGLS++bzZm
         QYwUvNIJqrV1CUOWcqLz4EQ/QVKeGgIAt3Li2bzWTQwA3RNR14iJsb+ngwpu4ChH6mlO
         zyRQ==
X-Gm-Message-State: AOAM531vMjVRLCN8UNXlXDPDwhBFyFGpPyZuR+FqLTzbaQjpgBU/ssW8
        m1uAMQ3JRUfFwS3zEKZsC1SsNQ/CG+70pf0vD0s=
X-Google-Smtp-Source: ABdhPJxj1jpsTrOrXD5rOnNbLwDExSltBdrdbj6t7zbm+kph22q6w5+iA1LOyPNkeQ54nJj0WSCgXr5ntdA+Uqs88zw=
X-Received: by 2002:a17:90a:b387:: with SMTP id e7mr55873pjr.228.1599643831603;
 Wed, 09 Sep 2020 02:30:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200905130336.967622-1-luka.kovacic@sartura.hr> <20200905130336.967622-5-luka.kovacic@sartura.hr>
In-Reply-To: <20200905130336.967622-5-luka.kovacic@sartura.hr>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 9 Sep 2020 12:30:14 +0300
Message-ID: <CAHp75VfwPa9zL6HCz+qqXJ1rK2JB=ewRiK1qdrgsyxixA5R5Lg@mail.gmail.com>
Subject: Re: [PATCH 4/7] drivers: leds: Add the iEi WT61P803 PUZZLE LED driver
To:     Luka Kovacic <luka.kovacic@sartura.hr>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-hwmon@vger.kernel.org,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Jason Cooper <jason@lakedaemon.net>,
        Gregory Clement <gregory.clement@bootlin.com>,
        luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat, Sep 5, 2020 at 4:10 PM Luka Kovacic <luka.kovacic@sartura.hr> wrote:
>
> Add support for the iEi WT61P803 PUZZLE LED driver.
> Currently only the front panel power LED is supported.
>
> This driver depends on the iEi WT61P803 PUZZLE MFD driver.

Can we make it OF independent?
See below how to achieve this.

> Signed-off-by: Luka Kovacic <luka.kovacic@sartura.hr>
> Cc: Luka Perkov <luka.perkov@sartura.hr>
> ---
>  drivers/leds/Kconfig                    |   8 ++
>  drivers/leds/Makefile                   |   1 +
>  drivers/leds/leds-iei-wt61p803-puzzle.c | 184 ++++++++++++++++++++++++
>  3 files changed, 193 insertions(+)
>  create mode 100644 drivers/leds/leds-iei-wt61p803-puzzle.c
>
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 1c181df24eae..8a25fb753dec 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -332,6 +332,14 @@ config LEDS_IPAQ_MICRO
>           Choose this option if you want to use the notification LED on
>           Compaq/HP iPAQ h3100 and h3600.
>
> +config LEDS_IEI_WT61P803_PUZZLE
> +       tristate "LED Support for the iEi WT61P803 PUZZLE MCU"
> +       depends on LEDS_CLASS
> +       depends on MFD_IEI_WT61P803_PUZZLE
> +       help
> +         This option enables support for LEDs controlled by the iEi WT61P803
> +         M801 MCU.
> +
>  config LEDS_HP6XX
>         tristate "LED Support for the HP Jornada 6xx"
>         depends on LEDS_CLASS
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index c2c7d7ade0d0..cd362437fefd 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -34,6 +34,7 @@ obj-$(CONFIG_LEDS_HP6XX)              += leds-hp6xx.o
>  obj-$(CONFIG_LEDS_INTEL_SS4200)                += leds-ss4200.o
>  obj-$(CONFIG_LEDS_IP30)                        += leds-ip30.o
>  obj-$(CONFIG_LEDS_IPAQ_MICRO)          += leds-ipaq-micro.o
> +obj-$(CONFIG_LEDS_IEI_WT61P803_PUZZLE) += leds-iei-wt61p803-puzzle.o
>  obj-$(CONFIG_LEDS_IS31FL319X)          += leds-is31fl319x.o
>  obj-$(CONFIG_LEDS_IS31FL32XX)          += leds-is31fl32xx.o
>  obj-$(CONFIG_LEDS_KTD2692)             += leds-ktd2692.o
> diff --git a/drivers/leds/leds-iei-wt61p803-puzzle.c b/drivers/leds/leds-iei-wt61p803-puzzle.c
> new file mode 100644
> index 000000000000..50d1e4e81571
> --- /dev/null
> +++ b/drivers/leds/leds-iei-wt61p803-puzzle.c
> @@ -0,0 +1,184 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +/* iEi WT61P803 PUZZLE MCU LED Driver
> + *
> + * Copyright (C) 2020 Sartura Ltd.
> + * Author: Luka Kovacic <luka.kovacic@sartura.hr>
> + */
> +
> +#include <linux/module.h>
> +#include <linux/mfd/iei-wt61p803-puzzle.h>

> +#include <linux/of.h>
> +#include <linux/of_device.h>

of*.h -> mod_devicetable.h

> +#include <linux/platform_device.h>

+ property.h

> +#include <linux/slab.h>
> +
> +#include <linux/leds.h>
> +
> +#define CMD_CHAR(x) (char)(x)
> +
> +/**
> + * enum iei_wt61p803_puzzle_led_state - LED state values

> + *

This is not needed.

> + * @IEI_LED_OFF: The LED is turned off
> + * @IEI_LED_ON: The LED is turned on
> + * @IEI_LED_BLINK_5HZ: The LED will blink with a freq of 5 Hz
> + * @IEI_LED_BLINK_1HZ: The LED will blink with a freq of 1 Hz
> + */
> +enum iei_wt61p803_puzzle_led_state {
> +       IEI_LED_OFF = 0x30,
> +       IEI_LED_ON = 0x31,
> +       IEI_LED_BLINK_5HZ = 0x32,
> +       IEI_LED_BLINK_1HZ = 0x33

Can we leave a comma here?

> +};
> +
> +/**
> + * struct iei_wt61p803_puzzle_led - MCU LED Driver

> + *

This is not needed.

> + * @mcu: MCU struct pointer
> + * @lock: General mutex lock for LED operations
> + * @led_power_state: State of the front panel power LED
> + */
> +struct iei_wt61p803_puzzle_led {
> +       struct iei_wt61p803_puzzle *mcu;
> +       struct mutex lock;
> +
> +       int led_power_state;
> +};
> +
> +static inline struct iei_wt61p803_puzzle_led *
> +               cdev_to_iei_wt61p803_puzzle_led(struct led_classdev *led_cdev)

It's a rather strange indentation.

> +{
> +       return dev_get_drvdata(led_cdev->dev->parent);
> +}
> +
> +static int iei_wt61p803_puzzle_led_brightness_set_blocking
> +       (struct led_classdev *cdev, enum led_brightness brightness)

Ditto.

> +{
> +       struct iei_wt61p803_puzzle_led *mcu_led =
> +               cdev_to_iei_wt61p803_puzzle_led(cdev);

> +       unsigned char led_power_cmd[5] = { '@', 'R', '1',
> +               CMD_CHAR(IEI_LED_OFF) };

Ditto.

> +

This is not needed.

> +       int ret;

> +

Ditto.

> +       size_t reply_size = 0;

> +       unsigned char *resp_buf = kmalloc(IEI_WT61P803_PUZZLE_BUF_SIZE, GFP_KERNEL);

Please move the assignment closer to its use and add an error check.
Btw, how big is the buffer?

> +       mutex_lock(&mcu_led->lock);
> +
> +       if (brightness == LED_OFF) {
> +               led_power_cmd[3] = CMD_CHAR(IEI_LED_OFF);
> +               mcu_led->led_power_state = LED_OFF;
> +       } else {
> +               led_power_cmd[3] = CMD_CHAR(IEI_LED_ON);
> +               mcu_led->led_power_state = LED_ON;
> +       }
> +
> +       mutex_unlock(&mcu_led->lock);
> +
> +       ret = iei_wt61p803_puzzle_write_command(mcu_led->mcu, led_power_cmd,
> +                       sizeof(led_power_cmd), resp_buf, &reply_size);
> +
> +       kfree(resp_buf);
> +
> +       return ret;
> +}
> +
> +static enum led_brightness
> +iei_wt61p803_puzzle_led_brightness_get(struct led_classdev *cdev)
> +{
> +       struct iei_wt61p803_puzzle_led *mcu_led =
> +               cdev_to_iei_wt61p803_puzzle_led(cdev);

> +

This is not needed.

> +       int led_state;
> +
> +       mutex_lock(&mcu_led->lock);
> +       led_state = mcu_led->led_power_state;
> +       mutex_unlock(&mcu_led->lock);
> +
> +       return led_state;
> +}
> +
> +static int iei_wt61p803_puzzle_led_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct iei_wt61p803_puzzle *mcu = dev_get_drvdata(dev->parent);

> +       struct device_node *np = dev->of_node;

Drop this.

> +

This is not needed.

> +       struct iei_wt61p803_puzzle_led *mcu_led;

> +       struct device_node *child;

struct fwnode_handle *child;

> +

This is not needed

> +       int ret;
> +
> +       mcu_led = devm_kzalloc(dev, sizeof(*mcu_led), GFP_KERNEL);
> +       if (!mcu_led)
> +               return -ENOMEM;
> +
> +       mcu_led->mcu = mcu;
> +
> +       /* The default LED power state is 1 */
> +       mcu_led->led_power_state = 1;
> +
> +       /* Init the mutex lock */
> +       mutex_init(&mcu_led->lock);
> +
> +       dev_set_drvdata(dev, mcu_led);
> +

> +       for_each_child_of_node(np, child) {

device_for_each_child_node()

> +               struct led_classdev *led;
> +               u32 reg;
> +
> +               led = devm_kzalloc(dev, sizeof(*led), GFP_KERNEL);
> +               if (!led)
> +                       return -ENOMEM;
> +

> +               ret = of_property_read_u32(child, "reg", &reg);

fwnode_property_read_u32()

> +               if (ret || reg > 1) {

> +                       dev_err(dev, "Could not register 'reg' of %s\n",
> +                               child->name);

%pfw

> +                       continue;
> +               }
> +

> +               if (of_property_read_string(child, "label", &led->name))

of_ -> fwnode_

> +                       led->name = child->name;

devm_kasprintf()

See, for example, drivers/leds/leds-max77650.c for such approach.

> +
> +               of_property_read_string(child, "linux,default-trigger",
> +                               &led->default_trigger);

of_ -> fwnode_

> +
> +               led->brightness_set_blocking =
> +                       iei_wt61p803_puzzle_led_brightness_set_blocking;
> +               led->brightness_get = iei_wt61p803_puzzle_led_brightness_get;
> +
> +               led->max_brightness = 1;
> +
> +               ret = devm_led_classdev_register(dev, led);
> +               if (ret) {
> +                       dev_err(dev, "Could not register %s\n", led->name);
> +                       return ret;
> +               }
> +       }
> +
> +       return 0;

> +

This is not needed.

> +}
> +
> +static const struct of_device_id iei_wt61p803_puzzle_led_of_match[] = {
> +       { .compatible = "iei,wt61p803-puzzle-leds" },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(of, iei_wt61p803_puzzle_led_of_match);
> +
> +static struct platform_driver iei_wt61p803_puzzle_led_driver = {
> +       .driver = {
> +               .name = "iei-wt61p803-puzzle-led",
> +               .of_match_table = iei_wt61p803_puzzle_led_of_match,
> +       },
> +       .probe = iei_wt61p803_puzzle_led_probe,
> +};
> +module_platform_driver(iei_wt61p803_puzzle_led_driver);
> +
> +MODULE_DESCRIPTION("iEi WT61P803 PUZZLE front panel LED driver");
> +MODULE_AUTHOR("Luka Kovacic <luka.kovacic@sartura.hr>");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:leds-iei-wt61p803-puzzle");
> --
> 2.20.1
>


-- 
With Best Regards,
Andy Shevchenko
