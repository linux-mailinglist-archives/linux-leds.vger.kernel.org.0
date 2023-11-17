Return-Path: <linux-leds+bounces-24-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 906577EF271
	for <lists+linux-leds@lfdr.de>; Fri, 17 Nov 2023 13:15:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF514280BF8
	for <lists+linux-leds@lfdr.de>; Fri, 17 Nov 2023 12:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCC2A1A70D;
	Fri, 17 Nov 2023 12:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bGz6trMK"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD394DDA7
	for <linux-leds@vger.kernel.org>; Fri, 17 Nov 2023 12:15:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7F63C433C8;
	Fri, 17 Nov 2023 12:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700223336;
	bh=gus7ga/hslqFc90wOge8RCSDecxTYpVkhWQk6MjClOA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bGz6trMKWPqu5saBtofRgNGtLC6NRcKmuuEr9LV/K064zWRQmHi9RqbD1WgdZxrtw
	 VN75+bY+DS3/N/kdzxGRyhgscaTY0+HdWn8dkJsp/Hy/0vMHGAkze2MxXfnZYv7yyz
	 sbsXiZMtT42LgQnqC/0aDuLgrNcI6ttN6Vk0h4vULd777XyMMp/4XZP0u2bnq7NPES
	 RNVTbiXambLxkiPDQiuyKENApFT9oDbOouUTgW7keYLBeIagU/kRktU9XKS+XJV3NM
	 e9y7XFjnNi8i5/tRtt82HkNh2MFohkS8baYgpY050UuleOonHmrZOKdoxXyuE76SVo
	 m0/Q+uT+rF/Sg==
Date: Fri, 17 Nov 2023 12:15:31 +0000
From: Lee Jones <lee@kernel.org>
To: Naresh Solanki <naresh.solanki@9elements.com>
Cc: Pavel Machek <pavel@ucw.cz>,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [RESEND PATCH v3] leds: max5970: Add support for max5970
Message-ID: <20231117121531.GC137434@google.com>
References: <20230914114521.1491390-1-naresh.solanki@9elements.com>
 <20230920130528.GG13143@google.com>
 <CABqG17j_gCr8xw65qjn4Kh7ChdraZbLsyGOsCmFEEWG3txjE4A@mail.gmail.com>
 <20230921103156.GB3449785@google.com>
 <CABqG17ibzHiYmzCZ6ZpAa8BZhj5N+0dQ0aa1yebtCk0YYVdsFQ@mail.gmail.com>
 <CABqG17h8hxgmMA=G5hitzgjNSX_BZ2utFsMZni9evn0Nogu0GA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABqG17h8hxgmMA=G5hitzgjNSX_BZ2utFsMZni9evn0Nogu0GA@mail.gmail.com>

On Thu, 09 Nov 2023, Naresh Solanki wrote:

> Hey Lee,
> 
> Is there anything specific you'd suggest changing in the current
> patchset, or are we good to proceed?

What do you mean by proceed?

You are good to make changes and submit a subsequent version.

Not entirely sure what you're asking.

> On Mon, 30 Oct 2023 at 14:22, Naresh Solanki
> <naresh.solanki@9elements.com> wrote:
> >
> > Hi,
> >
> > On Thu, 21 Sept 2023 at 16:02, Lee Jones <lee@kernel.org> wrote:
> > >
> > > On Thu, 21 Sep 2023, Naresh Solanki wrote:
> > >
> > > > Hi
> > > >
> > > >
> > > > On Wed, 20 Sept 2023 at 18:35, Lee Jones <lee@kernel.org> wrote:
> > > > >
> > > > > On Thu, 14 Sep 2023, Naresh Solanki wrote:
> > > > >
> > > > > > From: Patrick Rudolph <patrick.rudolph@9elements.com>
> > > > > >
> > > > > > The MAX5970 is hot swap controller and has 4 indication LED.
> > > > > >
> > > > > > Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> > > > > > Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
> > > > > > ---
> > > > > > Changes in V3:
> > > > > > - Drop array for ddata variable.
> > > > > > Changes in V2:
> > > > > > - Add of_node_put before return.
> > > > > > - Code cleanup
> > > > > > - Refactor code & remove max5970_setup_led function.
> > > > > > ---
> > > > > >  drivers/leds/Kconfig        |  11 ++++
> > > > > >  drivers/leds/Makefile       |   1 +
> > > > > >  drivers/leds/leds-max5970.c | 110 ++++++++++++++++++++++++++++++++++++
> > > > > >  3 files changed, 122 insertions(+)
> > > > > >  create mode 100644 drivers/leds/leds-max5970.c
> > > > >
> > > > > Couple of nits and you're good to go.
> > > > >
> > > > > Once fixed please resubmit with my:
> > > > >
> > > > >   Reviewed-by: Lee Jones <lee@kernel.org>
> > > > >
> > > > > > diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> > > > > > index b92208eccdea..03ef527cc545 100644
> > > > > > --- a/drivers/leds/Kconfig
> > > > > > +++ b/drivers/leds/Kconfig
> > > > > > @@ -637,6 +637,17 @@ config LEDS_ADP5520
> > > > > >         To compile this driver as a module, choose M here: the module will
> > > > > >         be called leds-adp5520.
> > > > > >
> > > > > > +config LEDS_MAX5970
> > > > > > +     tristate "LED Support for Maxim 5970"
> > > > > > +     depends on LEDS_CLASS
> > > > > > +     depends on MFD_MAX5970
> > > > > > +     help
> > > > > > +       This option enables support for the Maxim MAX5970 & MAX5978 smart
> > > > > > +       switch indication LEDs via the I2C bus.
> > > > > > +
> > > > > > +       To compile this driver as a module, choose M here: the module will
> > > > > > +       be called leds-max5970.
> > > > > > +
> > > > > >  config LEDS_MC13783
> > > > > >       tristate "LED Support for MC13XXX PMIC"
> > > > > >       depends on LEDS_CLASS
> > > > > > diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> > > > > > index d7348e8bc019..6eaee0a753c6 100644
> > > > > > --- a/drivers/leds/Makefile
> > > > > > +++ b/drivers/leds/Makefile
> > > > > > @@ -56,6 +56,7 @@ obj-$(CONFIG_LEDS_LP8501)           += leds-lp8501.o
> > > > > >  obj-$(CONFIG_LEDS_LP8788)            += leds-lp8788.o
> > > > > >  obj-$(CONFIG_LEDS_LP8860)            += leds-lp8860.o
> > > > > >  obj-$(CONFIG_LEDS_LT3593)            += leds-lt3593.o
> > > > > > +obj-$(CONFIG_LEDS_MAX5970)           += leds-max5970.o
> > > > > >  obj-$(CONFIG_LEDS_MAX77650)          += leds-max77650.o
> > > > > >  obj-$(CONFIG_LEDS_MAX8997)           += leds-max8997.o
> > > > > >  obj-$(CONFIG_LEDS_MC13783)           += leds-mc13783.o
> > > > > > diff --git a/drivers/leds/leds-max5970.c b/drivers/leds/leds-max5970.c
> > > > > > new file mode 100644
> > > > > > index 000000000000..c9685990e26e
> > > > > > --- /dev/null
> > > > > > +++ b/drivers/leds/leds-max5970.c
> > > > > > @@ -0,0 +1,110 @@
> > > > > > +// SPDX-License-Identifier: GPL-2.0
> > > > > > +/*
> > > > > > + * Device driver for leds in MAX5970 and MAX5978 IC
> > > > > > + *
> > > > > > + * Copyright (c) 2022 9elements GmbH
> > > > > > + *
> > > > > > + * Author: Patrick Rudolph <patrick.rudolph@9elements.com>
> > > > > > + */
> > > > > > +
> > > > > > +#include <linux/leds.h>
> > > > > > +#include <linux/mfd/max5970.h>
> > > > > > +#include <linux/of.h>
> > > > > > +#include <linux/platform_device.h>
> > > > > > +#include <linux/regmap.h>
> > > > > > +
> > > > > > +#define ldev_to_maxled(c)       container_of(c, struct max5970_led, cdev)
> > > > > > +
> > > > > > +struct max5970_led {
> > > > > > +     struct device *dev;
> > > > > > +     struct regmap *regmap;
> > > > > > +     struct led_classdev cdev;
> > > > > > +     unsigned int index;
> > > > > > +};
> > > > > > +
> > > > > > +static int max5970_led_set_brightness(struct led_classdev *cdev,
> > > > > > +                                   enum led_brightness brightness)
> > > > > > +{
> > > > > > +     struct max5970_led *ddata = ldev_to_maxled(cdev);
> > > > > > +     int ret, val;
> > > > > > +
> > > > > > +     /* Set/clear corresponding bit for given led index */
> > > > > > +     val = !brightness ? BIT(ddata->index) : 0;
> > > > > > +
> > > > > > +     ret = regmap_update_bits(ddata->regmap, MAX5970_REG_LED_FLASH, BIT(ddata->index), val);
> > > > > > +     if (ret < 0)
> > > > > > +             dev_err(cdev->dev, "failed to set brightness %d", ret);
> > > > > > +
> > > > > > +     return ret;
> > > > > > +}
> > > > > > +
> > > > > > +static int max5970_led_probe(struct platform_device *pdev)
> > > > > > +{
> > > > > > +     struct device *dev = &pdev->dev;
> > > > > > +     struct device_node *np = dev_of_node(dev->parent);
> > > > > > +     struct regmap *regmap;
> > > > > > +     struct device_node *led_node;
> > > > > > +     struct device_node *child;
> > > > >
> > > > > Nit: You can place these on the same line.
> > > > Ack
> > > > >
> > > > > > +     struct max5970_led *ddata;
> > > > > > +     int ret = -ENODEV, num_leds = 0;
> > > > > > +
> > > > > > +     regmap = dev_get_regmap(pdev->dev.parent, NULL);
> > > > > > +     if (!regmap)
> > > > > > +             return -EPROBE_DEFER;
> > > > >
> > > > > Why are you deferring here?
> > > > This is a Leaf driver. Making sure the parent driver has initialized regmap.
> > >
> > > How can this driver initialise before the parent driver?
> > The parent driver in this case is simple_i2c_mfd.
> > Based on reference from other similar implementations, the regmap
> > check was adapted.
> > As you mentioned, your right that leaf driver will not start before parent
> > driver is loaded successfully so probably the DEFER might not be needed
> > here.
> >
> > Thanks,
> > Naresh
> > >
> > > --
> > > Lee Jones [李琼斯]

-- 
Lee Jones [李琼斯]

