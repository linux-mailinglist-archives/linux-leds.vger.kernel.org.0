Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C48C4DB4E2
	for <lists+linux-leds@lfdr.de>; Wed, 16 Mar 2022 16:30:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239747AbiCPPbL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 16 Mar 2022 11:31:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352778AbiCPPbK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 16 Mar 2022 11:31:10 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61C4B674C0
        for <linux-leds@vger.kernel.org>; Wed, 16 Mar 2022 08:29:55 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id t1so3205738edc.3
        for <linux-leds@vger.kernel.org>; Wed, 16 Mar 2022 08:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aAS642lFBqjlhsf5RlFdIdZVy2Eh+3afsyOUGSF8sfk=;
        b=fClOp2s37b1Nd+tGa2Wys0Azps89LK524Mk7PJomzRiUjpI63kcz2F7ZP2m7WRdRv4
         bfyhnB12+UAXeFSkk2Rtc3rar6JSS7bYs8+SFwDlF7NrQn5lc4G7i/9Ww0kmXpDLCVXd
         XbufGSTa0rzhOvAH4GZnBC5kR8olegEdZBR0MoRU2Y+tzgFiiWI5athMQ+1UZKIIDzlg
         YiV4f0vlbYib0/JZVD2BPgjYSwoqhIgrhgtdVhYN7nOh1dIUni+5DSlLA4ubViIKC8LB
         NPKDSmcXjO2c/qd0i40Z/TTpIkcdUJEkPMj775ePZ3L78kx+duLg0a4lzWCHy/ulhmrd
         lb2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aAS642lFBqjlhsf5RlFdIdZVy2Eh+3afsyOUGSF8sfk=;
        b=iHHSG/2iOrgz/UOY4QmgYcEWN/On2aGO5foW/mkL3BY/V4ecmOrh7LNcEHX6KtuivC
         Fwf/5BwBdqWW/eCthhlO2Ugjd9++RKRG9P41WNT10+UMv8kJPgYXGrCxy52RphLT3IHk
         Fbf3jHSch/QNBEeyeZCL9uhN2/HI3yYw1app9opkAnsyNWTU9Eawiw5AJIQ0/iZGHWC7
         M7bRPXHVZ9RchqimfIGsE1tYGzKPYMHiQavXcw1yp74stLXM15xO+ZGIteMXqzT/VXoL
         7AsH23A1tt1nvHln/Wdd8GHYmU0n65qu1PzKaWtYdkIQ2ZvngJD8eo74A5DzYoMpjvxb
         qTNg==
X-Gm-Message-State: AOAM5308uaLpA1ZtFgR7hVwlt0BCVW6aJq+uQXCO4+mEDxYLb1gkJPSa
        ISrc/IlxSXwT6caCRdeU2AjHnMiO+JJwCtjzEVkM9phgLbE=
X-Google-Smtp-Source: ABdhPJwueLN9bBpg6eYGwxPWW+qqHys+VAVLGo0fmT15srULiCPOrDDOugNBJ3DHYPIss0N3X+9xbD3rZesR6rez4f0=
X-Received: by 2002:a05:6402:17dc:b0:418:efa5:f445 with SMTP id
 s28-20020a05640217dc00b00418efa5f445mr7107edy.125.1647444593846; Wed, 16 Mar
 2022 08:29:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220314121221.1175437-1-i.vozvakhov@corp.mail.ru>
In-Reply-To: <20220314121221.1175437-1-i.vozvakhov@corp.mail.ru>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 16 Mar 2022 17:28:40 +0200
Message-ID: <CAHp75VdAO9dY0njEXP0o7QVFN7e5GyJDAPtuS27kKVkYQpZdZA@mail.gmail.com>
Subject: Re: [PATCH] leds: add LED driver for Worldsemi WS2812B
To:     Ivan Vozvakhov <i.vozvakhov@corp.mail.ru>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Mar 14, 2022 at 7:23 PM Ivan Vozvakhov <i.vozvakhov@corp.mail.ru> wrote:
>
> This patch adds a LED class driver (powered by SPI)
> for the WS2812B LEDs that's is widely used in

that's --> that

> consumer electronic devices and DIY.

Any links to the datasheet?

You may add it as a Datasheet: tag.

...

> +maintainers:
> +  - Ivan Vozvakhov <i.vozvakhov@vk.team>

By email I can't think of this being the same person as the author /
submitter of the patch. Can you elaborate why the addresses are
different?

...

> +description: |
> +  Bindings for the Worldsemi WS2812B LED's powered by SPI.

LEDs

> +  Used SPI-MOSI only.

I believe you meant slightly different, i.e. "The only SPI MOSI wire
is in use." But then the question here is, what about CS?

...

> +config LEDS_WS2812B
> +        tristate "LED Support for Worldsemi WS2812B"
> +        depends on LEDS_CLASS
> +        depends on SPI

> +        depends on OF

It should be quite good justification why this (OF) depency is here

> +        help
> +          This option enables support for WS2812B LED's

LEDs

> +          through SPI.

...

> +/*
> + * LEDs driver for Worldsemi WS2812B through SPI

> + * SPI-MOSI for data transfer

Isn't it obvious?

> + * Required DMA transfers

Why?

> + * Copyright (C) 2022 Ivan Vozvakhov <i.vozvakhov@vk.team>
> + *
> + * Inspired by (C) Martin Sperl <kernel@martin.sperl.org>

Inspired by a person? Or by some work done by this person? I would
recommend finding somebody for a proof-reading the English text in the
comments and similar pieces of this contribution.

> + *

Redundant blank line.

> + */

...

> +#include <linux/of.h>

I believe this can be replaced by mod_devicetable.h and property.h,
and the latter one if it's really needed. Let's see below...

> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +#include <linux/workqueue.h>
> +#include <linux/spi/spi.h>
> +#include <linux/uaccess.h>
> +#include <linux/miscdevice.h>

Perhaps ordered?

...

> +#define SPI_BUS_SPEED_HZ 2500000

Why? It should come at least from DT.

> +/*
> + * Basically, SPI pull-up MOSI line, but for correct state it should be pull-down

the correct
pulled-down

> + * (RES is detected by low signal).
> + * SPI-MOSI for some controllers could have z-state with pull-down for MOSI

a Z-state

> + * before first SPI-CLK edges.

the first

> + * To eliminate it, send RES sequence before first bit's.
> + */

...

> +/*
> + * Ioctl interface for set's several led's at one time.

IOCTL
LEDs

> + *
> + * [start_led, stop_led)
> + */
> +struct ws2812b_multi_set {
> +       int start_led;
> +       int stop_led;

> +       uint8_t *brightnesses;

AFAIUC this is not gonna work in IOCTLs.

> +};
> +
> +#define LEDS_WS2812B_IOCTL_MAGIC    'z'
> +#define LEDS_WS2812B_IOCTL_MULTI_SET    \
> +       _IOW(LEDS_WS2812B_IOCTL_MAGIC, 0x01, struct ws2812b_multi_set)
> +#define LEDS_WS2812B_IOCTL_GET_LEDS_NUMBER      \
> +       _IOR(LEDS_WS2812B_IOCTL_MAGIC, 0x02, int)

Where is the documentation part?
And why do you need a non-standard IOCTL?

> +/*
> + * Each led's state bits coded by 3 bits,

If I got right the meaning it should be something like:
"Each of the LED state is coded by 3 bits,"

> + * 8 led's one-color state (actual LED) would take 24 real-bits.

LEDs

> + * That 24 bits divided into high, medium, low groups.
> + * All possible states defined there (see brightess_encode func. for masks).
> + */
> +const char byte2encoding_h[] = {
> +       0x92, 0x93, 0x9a, 0x9b,
> +       0xd2, 0xd3, 0xda, 0xdb

Here and elsewhere in similar cases leave the comma at the end.

> +};

...

> +static void brightess_encode(
> +               struct ws2812b_encoding *enc,
> +               const uint8_t val)

You have issues with indentation. Same applies to many other places in
this patch.

> +{
> +       enc->h = byte2encoding_h[(val >> 5) & 0x07];
> +       enc->m = byte2encoding_m[(val >> 3) & 0x03];
> +       enc->l = byte2encoding_l[(val >> 0) & 0x07];

Use GENMASK().

> +}

...

> +       led_enc = (struct ws2812b_encoding *)((uint8_t *)led_enc + DELAY_BEFORE_FIRST_DATA);

Urgh! Why so many interesting castings? Can you avoid this?

...

> +       for (i = 0; i < priv->num_leds; i++, led_enc++, led++)

Why do you need the last two increments? Wouldn't array indices work?

...

> +               brightness = kmalloc(sizeof(uint8_t) * leds_to_change, GFP_KERNEL);
> +               if (!brightness)
> +                       return -ENOMEM;
> +
> +               if (copy_from_user(brightness, ms.brightnesses,
> +                                       sizeof(uint8_t) * leds_to_change)) {
> +                       ret = -EFAULT;
> +                       break;
> +               }

Seems like NIH memdup_user()

...

> +static int ws2812b_parse_child_dt(const struct device *dev,
> +               struct device_node *child,
> +               struct ws2812b_led *led)
> +{
> +       struct led_classdev *ldev = &led->ldev;
> +       const char *state;
> +
> +       if (of_property_read_string(child, "label", &ldev->name))
> +               ldev->name = child->name;
> +
> +       state = of_get_property(child, "default-state", NULL);
> +       if (state) {
> +               if (!strcmp(state, "on")) {
> +                       ldev->brightness = LED_FULL;
> +               } else if (strcmp(state, "off")) {
> +                       dev_err(dev, "default-state can only be 'on' or 'off'");
> +                       return -EINVAL;
> +               }
> +               ldev->brightness = LED_OFF;
> +       }

Isn't it done in the LED core?

> +       ldev->brightness_set = ws2812b_led_set_brightness;
> +
> +       INIT_WORK(&led->work, ws2812b_led_work);
> +
> +       return 0;
> +}
> +
> +static int ws2812b_parse_dt(struct device *dev,
> +               struct ws2812b_priv *priv)
> +{
> +       struct device_node *child;

> +       int ret = 0, i = 0;

'ret = 0' is a redundant assignment.

> +       for_each_child_of_node(dev->of_node, child) {

device_for_each_child_node() ?

> +               struct ws2812b_led *led = &priv->leds[i];
> +
> +               led->priv = priv;
> +               led->dev = dev;
> +               led->child = child;
> +               led->num = i;
> +
> +               spin_lock_init(&led->led_data_lock);
> +
> +               ret = ws2812b_parse_child_dt(dev, child, led);
> +
> +               if (ret)
> +                       goto err;
> +
> +               ret = devm_led_classdev_register(dev, &led->ldev);
> +               if (ret) {
> +                       dev_err(dev, "failed to register led for %s: %d\n", led->ldev.name, ret);
> +                       goto err;
> +               }
> +
> +               led->ldev.dev->of_node = child;
> +               i++;
> +       }
> +
> +       return 0;
> +err:
> +       of_node_put(child);
> +       return ret;
> +}

...

> +static const struct of_device_id ws2812b_driver_ids[] = {
> +       { .compatible = "worldsemi,ws2812b" },

> +       {},

No comma for terminator entry.

> +};

...

> +       count_leds = of_get_child_count(dev->of_node);
> +       if (!count_leds) {
> +               dev_err(dev, "should define at least one led\n");
> +               return -EINVAL;

return dev_err_probe(...);

> +       }

...

> +       priv->leds = devm_kzalloc(dev, sizeof(struct ws2812b_led) * count_leds, GFP_KERNEL);

devm_kcalloc()

...

> +       len = DELAY_BEFORE_FIRST_DATA + count_leds * sizeof(struct ws2812b_encoding) + RESET_BYTES;

Needs a use of a macro from overflow.h. I believe it's struct_size() or so.

...

> +       if (of_property_read_string(dev->of_node, "device-name", &priv->mdev.name))

Is it standard binding?

> +               priv->mdev.name = DEFAULT_DEVICE_NAME;

...

> +       ret = misc_register(&priv->mdev);
> +       if (ret) {
> +               dev_err(dev, "can't register %s device\n", priv->mdev.name);
> +               return ret;

return dev_err_probe(...);

> +       }

...

> +       ret = ws2812b_parse_dt(dev, priv);
> +       if (ret)

Resource leak, no?

> +               return ret;

In general mixing devm with non-devm is a bad idea.

...

> +static int ws2812b_remove(struct spi_device *spi)
> +{
> +       struct ws2812b_priv *priv = spi_get_drvdata(spi);
> +       int i;
> +
> +       for (i = 0; i < priv->num_leds; i++) {
> +               led_classdev_unregister(&priv->leds[i].ldev);
> +               cancel_work_sync(&priv->leds[i].work);
> +       }
> +       cancel_work_sync(&priv->work_update_all);

Ditto.

> +       return 0;
> +}

...

> +       .driver = {
> +               .name = KBUILD_MODNAME,

> +               .owner = THIS_MODULE,

This is done by a macro. Read its implementation.

> +               .of_match_table = ws2812b_driver_ids,
> +       },
> +};

> +

Redundant blank line.

> +module_spi_driver(ws2812b_driver);

...

> +MODULE_ALIAS("spi:ws2812b");

Why?

-- 
With Best Regards,
Andy Shevchenko
