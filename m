Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DB5727A1AD
	for <lists+linux-leds@lfdr.de>; Sun, 27 Sep 2020 17:44:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726315AbgI0Poa (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 27 Sep 2020 11:44:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbgI0Poa (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 27 Sep 2020 11:44:30 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 301D0C0613D4
        for <linux-leds@vger.kernel.org>; Sun, 27 Sep 2020 08:44:30 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id j2so8529462ioj.7
        for <linux-leds@vger.kernel.org>; Sun, 27 Sep 2020 08:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g/TKrTodAH/CavUw5O+bcIpPmr35KdslNAu5/T0EqGU=;
        b=suZDQuX4uS+LzwhVqnrWwi+DakAfJrF6ATr3UlYsVxiShYeBq7JHd5zg4lJKTQZodr
         N8JFp8CCNBYqvNw+eiaWWHH/v5MkuLKJGq5SspTAhRMCSxhcgJSF3KBL60ajMYF1zbsZ
         OcVnyEkGHGbbyD/oD2b+f3v3DJnZbex4qGK2vWy1NFhSXWYGrgEYP7vf0QvSmsnd4gYY
         U/lIE4bMdEqwXEq6qQBhlyqmIKOQCRUNMNfAhxeCYry+1Am5b/4Xki/T6z74iqM4xTv0
         ykIsimv//Pw8CgDznCJt1CI67sdUZClWvRqLUy1ung7b6CgXYaOmnlIXMQ86XomrbGoa
         YJgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g/TKrTodAH/CavUw5O+bcIpPmr35KdslNAu5/T0EqGU=;
        b=NLpCFB/Sb8A1MWQMVUuKyeGl8kP2UnR+L6NCc71QICpKtS13kikpRtWtfrdxEMdrks
         KSWN8F15HzlMH4DGGF4sy5a+9Qd0kXzUxGZzI+a3wsl26QyLpKXjGH9z8IZTnP8ihLAN
         dSkXhbFuAE6mMAgAB1eH71YyM+ZmMWbcjvaSxwhelPoI4pl9DkAf5oDT2Q80QUMyrmOv
         GvRF47TZ8d1PWc7rQWe73NvSoWtJY6g/8r0AIFNbP5r7fFoNtq8uMINCQKwAS5KynHnM
         8Ec8WtBLgva4ytQKTCFhJXf1gzgpbXAy/jqPf0w6eD9VU8sZF/atDC0LnwSoMwFHLvMk
         DUSw==
X-Gm-Message-State: AOAM533y70PgUQICyR90psLJKAlSvAkwqGGs7ujcQQVVcCGAiwjfCUdY
        fxFfzM1EHmJ24xycDFHy0njcNxJLUh6Fpm2eqQMJTw==
X-Google-Smtp-Source: ABdhPJxpzy2P75QgnXAVWSjTi/IdUIaPp3CaMsBr/63IlT1RzZyJNMXa+Ky1LLpsMrBlZ7QCQkYY0dUIHjs7fI1I31k=
X-Received: by 2002:a5d:870c:: with SMTP id u12mr4773220iom.129.1601221469251;
 Sun, 27 Sep 2020 08:44:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200926135514.26189-1-luka.kovacic@sartura.hr>
 <20200926135514.26189-5-luka.kovacic@sartura.hr> <20200926200923.4641533d@nic.cz>
In-Reply-To: <20200926200923.4641533d@nic.cz>
From:   Luka Kovacic <luka.kovacic@sartura.hr>
Date:   Sun, 27 Sep 2020 17:44:30 +0200
Message-ID: <CADZsf3a0xv+DqWg5OcQKNOXutEQ_t0J+_hZkP4bRgZn=SiBwbw@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] drivers: leds: Add the iEi WT61P803 PUZZLE LED driver
To:     Marek Behun <marek.behun@nic.cz>
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
        Luka Perkov <luka.perkov@sartura.hr>,
        Robert Marko <robert.marko@sartura.hr>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

The microcontroller on this platform is currently only physically wired to one
LED, but should support multiple LEDs in software (this could possibly be
used in future platforms).

Thus I'd like to keep the support for multiple LEDs prepared. As I am not able
to test multiple LEDs functionality, I will just keep the framework prepared.

Also I'll use the devm_led_classdev_register_ext() API, thanks for
letting me know.

Kind regards,
Luka

On Sat, Sep 26, 2020 at 8:09 PM Marek Behun <marek.behun@nic.cz> wrote:
>
> On Sat, 26 Sep 2020 15:55:11 +0200
> Luka Kovacic <luka.kovacic@sartura.hr> wrote:
>
> > Add support for the iEi WT61P803 PUZZLE LED driver.
> > Currently only the front panel power LED is supported.
> >
> > This driver depends on the iEi WT61P803 PUZZLE MFD driver.
> >
> > Signed-off-by: Luka Kovacic <luka.kovacic@sartura.hr>
> > Cc: Luka Perkov <luka.perkov@sartura.hr>
> > Cc: Robert Marko <robert.marko@sartura.hr>
> > ---
> >  drivers/leds/Kconfig                    |   8 ++
> >  drivers/leds/Makefile                   |   1 +
> >  drivers/leds/leds-iei-wt61p803-puzzle.c | 174 ++++++++++++++++++++++++
> >  3 files changed, 183 insertions(+)
> >  create mode 100644 drivers/leds/leds-iei-wt61p803-puzzle.c
> >
> > diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> > index 1c181df24eae..8a25fb753dec 100644
> > --- a/drivers/leds/Kconfig
> > +++ b/drivers/leds/Kconfig
> > @@ -332,6 +332,14 @@ config LEDS_IPAQ_MICRO
> >         Choose this option if you want to use the notification LED on
> >         Compaq/HP iPAQ h3100 and h3600.
> >
> > +config LEDS_IEI_WT61P803_PUZZLE
> > +     tristate "LED Support for the iEi WT61P803 PUZZLE MCU"
> > +     depends on LEDS_CLASS
> > +     depends on MFD_IEI_WT61P803_PUZZLE
> > +     help
> > +       This option enables support for LEDs controlled by the iEi WT61P803
> > +       M801 MCU.
> > +
> >  config LEDS_HP6XX
> >       tristate "LED Support for the HP Jornada 6xx"
> >       depends on LEDS_CLASS
> > diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> > index c2c7d7ade0d0..cd362437fefd 100644
> > --- a/drivers/leds/Makefile
> > +++ b/drivers/leds/Makefile
> > @@ -34,6 +34,7 @@ obj-$(CONFIG_LEDS_HP6XX)            += leds-hp6xx.o
> >  obj-$(CONFIG_LEDS_INTEL_SS4200)              += leds-ss4200.o
> >  obj-$(CONFIG_LEDS_IP30)                      += leds-ip30.o
> >  obj-$(CONFIG_LEDS_IPAQ_MICRO)                += leds-ipaq-micro.o
> > +obj-$(CONFIG_LEDS_IEI_WT61P803_PUZZLE)       += leds-iei-wt61p803-puzzle.o
> >  obj-$(CONFIG_LEDS_IS31FL319X)                += leds-is31fl319x.o
> >  obj-$(CONFIG_LEDS_IS31FL32XX)                += leds-is31fl32xx.o
> >  obj-$(CONFIG_LEDS_KTD2692)           += leds-ktd2692.o
> > diff --git a/drivers/leds/leds-iei-wt61p803-puzzle.c b/drivers/leds/leds-iei-wt61p803-puzzle.c
> > new file mode 100644
> > index 000000000000..b9a977575a23
> > --- /dev/null
> > +++ b/drivers/leds/leds-iei-wt61p803-puzzle.c
> > @@ -0,0 +1,174 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/* iEi WT61P803 PUZZLE MCU LED Driver
> > + *
> > + * Copyright (C) 2020 Sartura Ltd.
> > + * Author: Luka Kovacic <luka.kovacic@sartura.hr>
> > + */
> > +
> > +#include <linux/leds.h>
> > +#include <linux/mfd/iei-wt61p803-puzzle.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/property.h>
> > +#include <linux/slab.h>
> > +
> > +enum iei_wt61p803_puzzle_led_state {
> > +     IEI_LED_OFF = 0x30,
> > +     IEI_LED_ON = 0x31,
> > +     IEI_LED_BLINK_5HZ = 0x32,
> > +     IEI_LED_BLINK_1HZ = 0x33,
> > +};
> > +
> > +/**
> > + * struct iei_wt61p803_puzzle_led - MCU LED Driver
> > + *
> > + * @mcu:             MCU struct pointer
> > + * @response_buffer  Global MCU response buffer allocation
> > + * @lock:            General mutex lock for LED operations
> > + * @led_power_state: State of the front panel power LED
> > + */
> > +struct iei_wt61p803_puzzle_led {
> > +     struct iei_wt61p803_puzzle *mcu;
> > +     unsigned char *response_buffer;
> > +     struct mutex lock;
> > +     int led_power_state;
> > +};
> > +
> > +static inline struct iei_wt61p803_puzzle_led *cdev_to_iei_wt61p803_puzzle_led
> > +     (struct led_classdev *led_cdev)
> > +{
> > +     return dev_get_drvdata(led_cdev->dev->parent);
> > +}
> > +
> > +static int iei_wt61p803_puzzle_led_brightness_set_blocking(struct led_classdev *cdev,
> > +             enum led_brightness brightness)
> > +{
> > +     struct iei_wt61p803_puzzle_led *mcu_led =
> > +             cdev_to_iei_wt61p803_puzzle_led(cdev);
> > +     unsigned char led_power_cmd[5] = {
> > +             IEI_WT61P803_PUZZLE_CMD_HEADER_START,
> > +             IEI_WT61P803_PUZZLE_CMD_LED,
> > +             IEI_WT61P803_PUZZLE_CMD_LED_POWER,
> > +             (char)IEI_LED_OFF
> > +     };
> > +     unsigned char *resp_buf = mcu_led->response_buffer;
> > +     size_t reply_size;
> > +
> > +     mutex_lock(&mcu_led->lock);
> > +     if (brightness == LED_OFF) {
> > +             led_power_cmd[3] = (char)IEI_LED_OFF;
> > +             mcu_led->led_power_state = LED_OFF;
> > +     } else {
> > +             led_power_cmd[3] = (char)IEI_LED_ON;
> > +             mcu_led->led_power_state = LED_ON;
> > +     }
> > +     mutex_unlock(&mcu_led->lock);
> > +
> > +     return iei_wt61p803_puzzle_write_command(mcu_led->mcu, led_power_cmd,
> > +                     sizeof(led_power_cmd), resp_buf, &reply_size);
> > +}
> > +
> > +static enum led_brightness
> > +iei_wt61p803_puzzle_led_brightness_get(struct led_classdev *cdev)
> > +{
> > +     struct iei_wt61p803_puzzle_led *mcu_led =
> > +             cdev_to_iei_wt61p803_puzzle_led(cdev);
> > +     int led_state;
> > +
> > +     mutex_lock(&mcu_led->lock);
> > +     led_state = mcu_led->led_power_state;
> > +     mutex_unlock(&mcu_led->lock);
> > +
> > +     return led_state;
> > +}
> > +
> > +static int iei_wt61p803_puzzle_led_probe(struct platform_device *pdev)
> > +{
> > +     struct device *dev = &pdev->dev;
> > +     struct iei_wt61p803_puzzle *mcu = dev_get_drvdata(dev->parent);
> > +     struct iei_wt61p803_puzzle_led *mcu_led;
> > +     struct fwnode_handle *child;
> > +     const char *label;
> > +     int ret;
> > +
> > +     mcu_led = devm_kzalloc(dev, sizeof(*mcu_led), GFP_KERNEL);
> > +     if (!mcu_led)
> > +             return -ENOMEM;
> > +
> > +     mcu_led->response_buffer = devm_kzalloc(dev,
> > +                     IEI_WT61P803_PUZZLE_BUF_SIZE, GFP_KERNEL);
> > +     if (!mcu_led->response_buffer)
> > +             return -ENOMEM;
> > +
> > +     mcu_led->mcu = mcu;
> > +     mcu_led->led_power_state = 1;
> > +     mutex_init(&mcu_led->lock);
> > +     dev_set_drvdata(dev, mcu_led);
> > +
> > +     device_for_each_child_node(dev, child) {
> > +             struct led_classdev *led;
> > +             u32 reg;
> > +
> > +             led = devm_kzalloc(dev, sizeof(*led), GFP_KERNEL);
>
> Avoid multiple allocations.
>
> Please look
> at
> https://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/commit/?h=for-next&id=4351dceba0ff929f667867f9bb69210f08f61717
>
> To avoid multiple allocations, please use flexible array members.
>
> Does this controller support multiple LEDs? The device tree you
> provided only defines one.
>
> If it supports multiple LED:
> Rename the mcu_led to mcu_leds, or chip, or (semantically best in this
> driver) priv.
> Add member
>   struct led_classdev leds[];
> to that structure.
> Then allocate by
>   count = device_get_child_node_count(dev);
>   priv = devm_kzalloc(dev, struct_size(priv, leds, count), GFP_KERNEL);
>
> If the device supports only one LED, just put
>   struct led_classdev cdev;
> to the private structure of this driver. And don't use
> device_for_each_child_node, just check whether there is exactly one
> child node (device_get_child_node_count), get it via
>   child = device_get_next_child_node(dev, NULL);
> and after registering the LED
>   fwnode_handle_put(child);
> This was done in:
> https://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/commit/?h=for-next&id=e92e7e8aa066904def9a5d584ece7fb6ae512dbd
>
> > +             if (!led) {
> > +                     ret = -ENOMEM;
> > +                     goto err_child_node;
> > +             }
> > +
> > +             ret = fwnode_property_read_u32(child, "reg", &reg);
> > +             if (ret || reg > 1) {
> > +                     dev_err(dev, "Could not register 'reg' (%lu)\n", (unsigned long)reg);
> > +                     ret = -EINVAL;
> > +                     goto err_child_node;
> > +             }
> > +
> > +             if (fwnode_property_read_string(child, "label", &label)) {
> > +                     led->name = "iei-wt61p803-puzzle-led::";
> > +             } else {
> > +                     led->name = devm_kasprintf(dev, GFP_KERNEL,
> > +                                     "iei-wt61p803-puzzle-led:%s", label);
> > +                     if (!led->name) {
> > +                             ret = -ENOMEM;
> > +                             goto err_child_node;
> > +                     }
> > +             }
>
> Parsing of label is done by LED core if you use
> devm_led_classdev_register_ext. Also, label is obsolete. The LED name
> should be composed from color, function and device.
> Also please dont pass devicename "iei-wt61p803-puzzle-led" here. We
> want to make the LED subsystem derive the device name somehow, and
> afterwards we would need to change this. Also the devicename should
> refer to the device the LED is triggering to (ie. if the LED is set in
> devicetree to trigger on activity on eth0, the devicename should be
> eth0 or something, not the name of this driver).
>
> Just remove this code and let devm_led_classdev_register_ext do its
> thing.
>
> > +
> > +             fwnode_property_read_string(child, "linux,default-trigger",
> > +                             &led->default_trigger);
> > +
>
> Parsing of linux,default-trigger is done by LED core if you use
> devm_led_classdev_register_ext.
>
> > +             led->brightness_set_blocking = iei_wt61p803_puzzle_led_brightness_set_blocking;
> > +             led->brightness_get = iei_wt61p803_puzzle_led_brightness_get;
> > +             led->max_brightness = 1;
> > +
> > +             ret = devm_led_classdev_register(dev, led);
>
> Please use extended LED registration API, with
> devm_led_classdev_register_ext. Pass init_data with fwnode member set
> to child.
>
> > +             if (ret) {
> > +                     dev_err(dev, "Could not register %s\n", led->name);
> > +                     goto err_child_node;
> > +             }
> > +     }
> > +     return 0;
> > +err_child_node:
> > +     fwnode_handle_put(child);
> > +     return ret;
> > +}
> > +
> > +static const struct of_device_id iei_wt61p803_puzzle_led_of_match[] = {
> > +     { .compatible = "iei,wt61p803-puzzle-leds" },
> > +     { }
> > +};
> > +MODULE_DEVICE_TABLE(of, iei_wt61p803_puzzle_led_of_match);
> > +
> > +static struct platform_driver iei_wt61p803_puzzle_led_driver = {
> > +     .driver = {
> > +             .name = "iei-wt61p803-puzzle-led",
> > +             .of_match_table = iei_wt61p803_puzzle_led_of_match,
> > +     },
> > +     .probe = iei_wt61p803_puzzle_led_probe,
> > +};
> > +module_platform_driver(iei_wt61p803_puzzle_led_driver);
> > +
> > +MODULE_DESCRIPTION("iEi WT61P803 PUZZLE front panel LED driver");
> > +MODULE_AUTHOR("Luka Kovacic <luka.kovacic@sartura.hr>");
> > +MODULE_LICENSE("GPL");
> > +MODULE_ALIAS("platform:leds-iei-wt61p803-puzzle");
>
> Marek
