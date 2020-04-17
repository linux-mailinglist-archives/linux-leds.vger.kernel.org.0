Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 262E41ADA9B
	for <lists+linux-leds@lfdr.de>; Fri, 17 Apr 2020 11:59:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726712AbgDQJ7T (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 17 Apr 2020 05:59:19 -0400
Received: from v6.sk ([167.172.42.174]:43478 "EHLO v6.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726618AbgDQJ7S (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 17 Apr 2020 05:59:18 -0400
Received: from localhost (v6.sk [IPv6:::1])
        by v6.sk (Postfix) with ESMTP id F1FFD610A6;
        Fri, 17 Apr 2020 09:58:45 +0000 (UTC)
Date:   Fri, 17 Apr 2020 11:58:43 +0200
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH v3] leds: ariel: Add driver for status LEDs on Dell Wyse
 3020
Message-ID: <20200417095041.GA448088@furthur.local>
References: <20200322074134.79237-1-lkundrak@v3.sk>
 <ef7e8f03-0a43-156e-b86e-3ab3887f0245@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ef7e8f03-0a43-156e-b86e-3ab3887f0245@ti.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, Apr 03, 2020 at 02:37:49PM -0500, Dan Murphy wrote:
> Lubomir
> 
> On 3/22/20 2:41 AM, Lubomir Rintel wrote:
> > This adds support for controlling the LEDs attached to the Embedded
> > Controller on a Dell Wyse 3020 "Ariel" board.
> > 
> > Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> > 
> > ---
> > Changes since v2:
> > - Hopefully sending out the correct patch this time...
> > 
> > Changes since v1:
> > - Reduce code duplication with a loop
> > - Drop "ariel:" prefix from led names
> > - Do not print a message after a successful probe
> > ---
> >   drivers/leds/Kconfig      |  11 ++++
> >   drivers/leds/Makefile     |   1 +
> >   drivers/leds/leds-ariel.c | 133 ++++++++++++++++++++++++++++++++++++++
> >   3 files changed, 145 insertions(+)
> >   create mode 100644 drivers/leds/leds-ariel.c
> > 
> > diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> > index d82f1dea37111..66424ee54cc01 100644
> > --- a/drivers/leds/Kconfig
> > +++ b/drivers/leds/Kconfig
> > @@ -83,6 +83,17 @@ config LEDS_APU
> >   	  To compile this driver as a module, choose M here: the
> >   	  module will be called leds-apu.
> > +config LEDS_ARIEL
> > +	tristate "Dell Wyse 3020 status LED support"
> > +	depends on LEDS_CLASS
> > +	depends on (MACH_MMP3_DT && MFD_ENE_KB3930) || COMPILE_TEST
> > +	help
> > +	  This driver adds support for controlling the front panel status
> > +	  LEDs on Dell Wyse 3020 (Ariel) board via the KB3930 Embedded
> > +	  Controller.
> > +
> > +	  Say Y to if your machine is a Dell Wyse 3020 thin client.
> > +
> >   config LEDS_AS3645A
> >   	tristate "AS3645A and LM3555 LED flash controllers support"
> >   	depends on I2C && LEDS_CLASS_FLASH
> > diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> > index d7e1107753fb1..bf3b22038d113 100644
> > --- a/drivers/leds/Makefile
> > +++ b/drivers/leds/Makefile
> > @@ -10,6 +10,7 @@ obj-$(CONFIG_LEDS_TRIGGERS)		+= led-triggers.o
> >   obj-$(CONFIG_LEDS_88PM860X)		+= leds-88pm860x.o
> >   obj-$(CONFIG_LEDS_AAT1290)		+= leds-aat1290.o
> >   obj-$(CONFIG_LEDS_APU)			+= leds-apu.o
> > +obj-$(CONFIG_LEDS_ARIEL)		+= leds-ariel.o
> >   obj-$(CONFIG_LEDS_AS3645A)		+= leds-as3645a.o
> >   obj-$(CONFIG_LEDS_AN30259A)		+= leds-an30259a.o
> >   obj-$(CONFIG_LEDS_BCM6328)		+= leds-bcm6328.o
> > diff --git a/drivers/leds/leds-ariel.c b/drivers/leds/leds-ariel.c
> > new file mode 100644
> > index 0000000000000..8fc56722e12f4
> > --- /dev/null
> > +++ b/drivers/leds/leds-ariel.c
> > @@ -0,0 +1,133 @@
> > +// SPDX-License-Identifier: BSD-2-Clause OR GPL-2.0-or-later
> > +/*
> > + * Dell Wyse 3020 a.k.a. "Ariel" Embedded Controller LED Driver
> > + *
> > + * Copyright (C) 2020 Lubomir Rintel
> > + */
> > +
> > +#include <linux/module.h>
> > +#include <linux/leds.h>
> > +#include <linux/regmap.h>
> > +#include <linux/of_platform.h>
> > +
> > +enum ec_index {
> > +	EC_BLUE_LED	= 0x01,
> > +	EC_AMBER_LED	= 0x02,
> 
> Defining the value after the 0x0 is unnecessary as enums are incremental
> only the first value needs to be defined if the following values are in
> numerical order

I believe this improves readability, especially in case such as this
where the actual numeric values matter.

> Can these also be #defined instead of an enum?  Not requesting them to be
> just wondering about the design decision here.

It seems to be that this is what enums are for and theres is no need to
get the preprocessor involved?

I guess this might be a personal preference, but it seems to me that
both enums and preprocessor defines are used across the code base.

> > +	EC_GREEN_LED	= 0x03,
> > +};
> > +
> > +enum {
> > +	EC_LED_OFF	= 0x00,
> > +	EC_LED_STILL	= 0x01,
> Same comment as above
> > +	EC_LED_FADE	= 0x02,
> > +	EC_LED_BLINK	= 0x03,
> > +};
> > +
> > +struct ariel_led {
> > +	struct regmap *ec_ram;
> > +	enum ec_index ec_index;
> > +	struct led_classdev led_cdev;
> > +};
> > +
> > +#define led_cdev_to_ariel_led(c) container_of(c, struct ariel_led, led_cdev)
> > +
> > +static enum led_brightness ariel_led_get(struct led_classdev *led_cdev)
> > +{
> > +	struct ariel_led *led = led_cdev_to_ariel_led(led_cdev);
> > +	unsigned int led_status = 0;
> > +
> > +	if (regmap_read(led->ec_ram, led->ec_index, &led_status))
> > +		return LED_OFF;
> > +
> > +	if (led_status == EC_LED_STILL)
> > +		return LED_FULL;
> > +	else
> else is not needed here
> > +		return LED_OFF;
> > +}

Yes, but should it be dropped? To me it seems like explicit else is
better than implicit fallthrough. It is better when it's obvious that
the LED_OFF is returned precisely only when the status is not
EC_LED_STILL and that nothing ever happens afterwards -- and the
compiler/linter will warn when anything unreachable is added afterwards.

Not that it matters too much here. It's just that I've done this
deliberately because it seems more readable to be and would prefer to
leave it that way unless you really really care about that.

> > +
> > +static void ariel_led_set(struct led_classdev *led_cdev,
> > +			  enum led_brightness brightness)
> > +{
> > +	struct ariel_led *led = led_cdev_to_ariel_led(led_cdev);
> > +
> > +	if (brightness == LED_OFF)
> > +		regmap_write(led->ec_ram, led->ec_index, EC_LED_OFF);
> > +	else
> > +		regmap_write(led->ec_ram, led->ec_index, EC_LED_STILL);
> > +}
> > +
> > +static int ariel_blink_set(struct led_classdev *led_cdev,
> > +			   unsigned long *delay_on, unsigned long *delay_off)
> > +{
> > +	struct ariel_led *led = led_cdev_to_ariel_led(led_cdev);
> > +
> > +	if (*delay_on == 0 && *delay_off == 0)
> > +		return -EINVAL;
> > +
> > +	if (*delay_on == 0) {
> > +		regmap_write(led->ec_ram, led->ec_index, EC_LED_OFF);
> > +	} else if (*delay_off == 0) {
> > +		regmap_write(led->ec_ram, led->ec_index, EC_LED_STILL);
> > +	} else {
> > +		*delay_on = 500;
> > +		*delay_off = 500;
> > +		regmap_write(led->ec_ram, led->ec_index, EC_LED_BLINK);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +#define NLEDS 3
> 
> This define needs to be more unique.
> 
> Something like EC_NLEDS or EC_NUM_LEDS and should be moved to the top of the
> file under the #includes
> 
> > +
> > +static int ariel_led_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct ariel_led *leds;
> > +	struct regmap *ec_ram;
> > +	int ret;
> > +	int i;
> > +
> > +	leds = devm_kcalloc(dev, NLEDS, sizeof(*leds), GFP_KERNEL);
> > +	if (!leds)
> > +		return -ENOMEM;
> > +
> > +	ec_ram = dev_get_regmap(dev->parent, "ec_ram");
> Maybe this should be checked before memory is allocated.

Will fix in next version.

> > +	if (!ec_ram)
> > +		return -ENODEV;
> > +
> > +	leds[0].ec_index = EC_BLUE_LED;
> > +	leds[0].led_cdev.name = "blue:power",
> > +	leds[0].led_cdev.default_trigger = "default-on";
> > +
> > +	leds[1].ec_index = EC_AMBER_LED;
> > +	leds[1].led_cdev.name = "amber:status",
> > +
> > +	leds[2].ec_index = EC_GREEN_LED;
> > +	leds[2].led_cdev.name = "green:status",
> > +	leds[2].led_cdev.default_trigger = "default-on";
> > +
> > +	for (i = 0; i < NLEDS; i++) {
> 
> I don't understand this loop.  i is incremented but never used.
> 
> should the below be leds[i]?

Sorry for this; I ended up botching this in an attempt to fix things up.
Will fix in the next version.

> 
> > +		leds[0].ec_ram = ec_ram;
> > +		leds[0].led_cdev.brightness_get = ariel_led_get;
> > +		leds[0].led_cdev.brightness_set = ariel_led_set;
> > +		leds[0].led_cdev.blink_set = ariel_blink_set;
> > +
> > +		ret = devm_led_classdev_register(dev, &leds[0].led_cdev);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> 
> Dan

Thank you!

Lubo

> 
> 
