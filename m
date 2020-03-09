Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BD9F17DCD9
	for <lists+linux-leds@lfdr.de>; Mon,  9 Mar 2020 11:00:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725796AbgCIKAD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 9 Mar 2020 06:00:03 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:33635 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726384AbgCIKAD (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 9 Mar 2020 06:00:03 -0400
Received: by mail-io1-f67.google.com with SMTP id r15so8534920iog.0
        for <linux-leds@vger.kernel.org>; Mon, 09 Mar 2020 03:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=XYsp5YfT9GHQXn9e9Uo27I/6IbA8wOJ+MyIiypQnqBg=;
        b=ykt2W3nYoRuWrtAqOa+Jsr1xjyONntaqQ876szsFgg3yWgfwa9XzXjUfH4F/gZVOBg
         Y9xx8CFdkMRq7xUeBvduDNkuPFoYCglGOfhrApb5BAdr9kBgyCwIqK9Z84coYwaM/Adu
         k9QLcYz62w2GtU1xDOZj1x+ELpMqDnZVm3dqgzFHFec2LLjNezgEyIZcAV3bU0E6rLHI
         RJ6rxJr98//K83vCDNZ2VRBF8gze0k7o7Ae+SZDqK4pz0CrE7JMVKISOi/cLdxLcOCND
         bE/65iiH3L6juRm+qDW85/MHQTiwS9ktu8u8535W0pjnP61bY7tl4PVcMqC8QZL/s3a8
         0OkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=XYsp5YfT9GHQXn9e9Uo27I/6IbA8wOJ+MyIiypQnqBg=;
        b=qQDyeK5rH2IXu9uPfkM3nmoAIOKomLXZy7rCT9TUiNE49Ciy7kDZaStpiKqLqXaP4N
         DxJOetuZU1iIiZaQCP5WEUCKGMDEeJ2ArwCAthB0jnK2Dw4rUvrcwNu1+J4Cf34rVB4f
         TvTHPmBdk/4KG+2/sGHQfb1tKU2qmUegy7Ps94oAMJjxkooXZSGgpgL1b/hGomMVnk7Q
         lxzdtGzrF1Efx0yehickPuTWXwXkpoEDTDgn+8Z4ydu6/18PrcbDAwprqmQoCwAXpG5J
         +FG1M+a7Y57G2mSFAbcCTFNs5Lm3I21cQ1oe+WYaXqdjfm5cq47dKhWLqKzTw9l2Yk8f
         iQkg==
X-Gm-Message-State: ANhLgQ0FqYtzymy4bJF11Rzaaz0kG2Ff4W9WA4WudMmVS1brfd8nvwJd
        V3j7grnq1olBj75UDY+trgs/tJTPV0e9sc0pwI2T8w==
X-Google-Smtp-Source: ADFU+vv/Q5BFWC4z6ovabVtmzjjAwANH9fR51mgOt+AmYdVu7DeLah+kQkB3dEeMKXvxBunc5jReHmubRgb5xmImDZI=
X-Received: by 2002:a02:ac90:: with SMTP id x16mr3235208jan.12.1583748001402;
 Mon, 09 Mar 2020 03:00:01 -0700 (PDT)
MIME-Version: 1.0
References: <1583502010-16210-1-git-send-email-nbelin@baylibre.com>
 <1583502010-16210-4-git-send-email-nbelin@baylibre.com> <f599f5f7-4023-10c0-a582-4dce2a601b95@gmail.com>
In-Reply-To: <f599f5f7-4023-10c0-a582-4dce2a601b95@gmail.com>
From:   Nicolas Belin <nbelin@baylibre.com>
Date:   Mon, 9 Mar 2020 10:59:50 +0100
Message-ID: <CAJZgTGH4g79ohvGi0RbD3LS7p422Q44h4_7sTWFwjiqS4U+zvA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] drivers: leds: add support for apa102c leds
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        devicetree@vger.kernel.org, baylibre-upstreaming@groups.io
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Jacek,

Le ven. 6 mars 2020 =C3=A0 21:20, Jacek Anaszewski
<jacek.anaszewski@gmail.com> a =C3=A9crit :
>
> Hi Nicolas,
>
> On 3/6/20 2:40 PM, Nicolas Belin wrote:
> > Initilial commit in order to support the apa102c RGB leds. The
> > RGB and global brightness management is done by creating 4 leds
> > from the Led Framework per apa102c led.
> >
> > Signed-off-by: Nicolas Belin <nbelin@baylibre.com>
> > ---
> >  drivers/leds/Kconfig        |  11 ++
> >  drivers/leds/Makefile       |   1 +
> >  drivers/leds/leds-apa102c.c | 306 ++++++++++++++++++++++++++++++++++++=
++++++++
> >  3 files changed, 318 insertions(+)
> >  create mode 100644 drivers/leds/leds-apa102c.c
> >
> > diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> > index d82f1dea3711..28fa6c4f65cc 100644
> > --- a/drivers/leds/Kconfig
> > +++ b/drivers/leds/Kconfig
> > @@ -69,6 +69,17 @@ config LEDS_AN30259A
> >         To compile this driver as a module, choose M here: the module
> >         will be called leds-an30259a.
> >
> > +config LEDS_APA102C
> > +     tristate "LED Support for Shiji APA102C"
> > +     depends on SPI
> > +     depends on LEDS_CLASS
> > +     help
> > +       This option enables support for the APA102C RGB LEDs
> > +       from Shiji Lighting.
> > +
> > +       To compile this driver as a module, choose M here: the module
> > +       will be called leds-apa102c.
> > +
> >  config LEDS_APU
> >       tristate "Front panel LED support for PC Engines APU/APU2/APU3 bo=
ards"
> >       depends on LEDS_CLASS
> > diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> > index d7e1107753fb..28dfe82900c5 100644
> > --- a/drivers/leds/Makefile
> > +++ b/drivers/leds/Makefile
> > @@ -88,6 +88,7 @@ obj-$(CONFIG_LEDS_LM36274)          +=3D leds-lm36274=
.o
> >  obj-$(CONFIG_LEDS_TPS6105X)          +=3D leds-tps6105x.o
> >
> >  # LED SPI Drivers
> > +obj-$(CONFIG_LEDS_APA102C)           +=3D leds-apa102c.o
> >  obj-$(CONFIG_LEDS_CR0014114)         +=3D leds-cr0014114.o
> >  obj-$(CONFIG_LEDS_DAC124S085)                +=3D leds-dac124s085.o
> >  obj-$(CONFIG_LEDS_EL15203000)                +=3D leds-el15203000.o
> > diff --git a/drivers/leds/leds-apa102c.c b/drivers/leds/leds-apa102c.c
> > new file mode 100644
> > index 000000000000..0043e7a6235b
> > --- /dev/null
> > +++ b/drivers/leds/leds-apa102c.c
> > @@ -0,0 +1,306 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +#include <linux/leds.h>
> > +#include <linux/module.h>
> > +#include <linux/of_device.h>
> > +#include <linux/spi/spi.h>
> > +#include <uapi/linux/uleds.h>
> > +#include "leds.h"
> > +
> > +/*
> > + * Copyright (C) 2020 BayLibre, SAS
> > + * Author: Nicolas Belin <nbelin@baylibre.com>
> > + */
> > +
> > +/*
> > + *  APA102C SPI protocol description:
> > + *  +------+----------------------------------------+------+
> > + *  |START |               DATA FIELD:              | END  |
> > + *  |FRAME |               N LED FRAMES             |FRAME |
> > + *  +------+------+------+------+------+-----+------+------+
> > + *  | 0*32 | LED1 | LED2 | LED3 | LED4 | --- | LEDN | 1*32 |
> > + *  +------+------+------+------+------+-----+------+------+
> > + *
> > + *  +-----------------------------------+
> > + *  |START FRAME 32bits                 |
> > + *  +--------+--------+--------+--------+
> > + *  |00000000|00000000|00000000|00000000|
> > + *  +--------+--------+--------+--------+
> > + *
> > + *  +------------------------------------+
> > + *  |LED  FRAME 32bits                   |
> > + *  +---+-----+--------+--------+--------+
> > + *  |111|LUMA |  BLUE  | GREEN  |  RED   |
> > + *  +---+-----+--------+--------+--------+
> > + *  |3b |5bits| 8bits  | 8bits  | 8bits  |
> > + *  +---+-----+--------+--------+--------+
> > + *  |MSB   LSB|MSB  LSB|MSB  LSB|MSB  LSB|
> > + *  +---+-----+--------+--------+--------+
> > + *
> > + *  +-----------------------------------+
> > + *  |END FRAME 32bits                   |
> > + *  +--------+--------+--------+--------+
> > + *  |11111111|11111111|11111111|11111111|
> > + *  +--------+--------+--------+--------+
> > + */
> > +
> > +/* apa102c default settings */
> > +#define GLOBAL_MAX_BRIGHTNESS        GENMASK(4, 0)
> > +#define RGB_MAX_BRIGHTNESS   GENMASK(7, 0)
> > +#define START_BYTE           0
> > +#define END_BYTE             GENMASK(7, 0)
> > +#define LED_FRAME_HEADER     GENMASK(7, 5)
> > +
> > +struct apa102c_led {
> > +     struct apa102c          *priv;
> > +     char                    name[LED_MAX_NAME_SIZE];
>
> This is not needed, LED core takes care of parsing LED name.
>
> > +     int                     color_id;
> > +     struct led_classdev     cdev;
> > +};
> > +
> > +struct apa102c_rgbled {
> > +     /* the 4 components of the apa102c rgb led:
> > +      * global brightness, blue, green and red in that order
> > +      */
> > +     struct apa102c_led      component[4];
> > +};
> > +
> > +struct apa102c {
> > +     size_t                  led_count;
> > +     struct device           *dev;
> > +     struct mutex            lock;
> > +     struct spi_device       *spi;
> > +     u8                      *spi_buf;
> > +     struct apa102c_rgbled   rgb_leds[];
> > +};
> > +
> > +static int apa102c_sync(struct apa102c *priv)
> > +{
> > +     int     ret;
> > +     size_t  i;
> > +     struct apa102c_rgbled *leds =3D priv->rgb_leds;
> > +     u8      *buf =3D priv->spi_buf;
> > +
> > +     /* creating the data that will be sent to all the leds at once */
> > +     for (i =3D 0; i < 4; i++)
> > +             *buf++ =3D START_BYTE;
> > +
> > +     /* looping on each RGB led component, getting the global brightne=
ss
> > +      * then B, G and R values
> > +      */
> > +     for (i =3D 0; i < priv->led_count; i++) {
> > +             *buf++ =3D LED_FRAME_HEADER |
> > +                      leds[i].component[0].cdev.brightness;
> > +             *buf++ =3D leds[i].component[1].cdev.brightness;
> > +             *buf++ =3D leds[i].component[2].cdev.brightness;
> > +             *buf++ =3D leds[i].component[3].cdev.brightness;
> > +     }
>
> The problem is that in the monochrome LED approach (i.e. the only
> available one) you have to alter the state of only one LED - that
> on behalf of which the call is made.
>
> And anyway, you're doing here much too much, taking into account
> that this function is called from brightness_set op.
>
> Isn't it possible to update only one LED ?

No, it is not possible. When one LED is updated and as all the leds
are cascaded, the values for all the leds have to be sent using spi.
However, what I can do is not updating the full buffer and simply the
part that corresponds to the modified LED.

>
> > +
> > +     for (i =3D 0; i < 4; i++)
> > +             *buf++ =3D END_BYTE;
> > +
> > +     ret =3D spi_write(priv->spi, priv->spi_buf,
> > +                     (priv->led_count + 2) * sizeof(u32));
> > +
> > +     return ret;
> > +}
> > +
> > +static int apa102c_brightness_set(struct led_classdev *cdev,
> > +                        enum led_brightness brightness)
> > +{
> > +     int                     ret;
> > +     struct apa102c_led      *led =3D container_of(cdev,
> > +                                                 struct apa102c_led,
> > +                                                 cdev);
> > +
> > +     mutex_lock(&led->priv->lock);
> > +     /* updating the brightness then synching all the leds */
> > +     cdev->brightness =3D brightness;
>
> LED core handles that. Please drop this assignment.

OK

>
> > +     ret =3D apa102c_sync(led->priv);
> > +     mutex_unlock(&led->priv->lock);
> > +
> > +     return ret;
> > +}
> > +
> > +static int apa102c_probe_dt(struct apa102c *priv)
> > +{
> > +     int                     ret =3D 0;
> > +     u32                     i;
> > +     struct apa102c_rgbled   *rgb_led;
> > +     struct apa102c_led      *led;
> > +     struct fwnode_handle    *child;
> > +     const char              *rgb_led_name;
> > +     const char              *led_component_name;
> > +
> > +     /* each node corresponds to an rgb led */
> > +     device_for_each_child_node(priv->dev, child) {
> > +
> > +             ret =3D fwnode_property_read_u32(child, "reg", &i);
> > +             if (ret) {
> > +                     dev_err(priv->dev, "coudld not read reg %d\n", re=
t);
> > +                     goto child_out;
> > +             }
> > +
> > +             if (i >=3D priv->led_count) {
> > +                     ret =3D -EINVAL;
> > +                     dev_err(priv->dev, "reg value too big\n");
> > +                     goto child_out;
> > +             }
> > +
> > +             rgb_led =3D &priv->rgb_leds[i];
> > +             /* checking if this led config is already used by checkin=
g if
> > +              * the priv member of the global_brightness led as alread=
y
> > +              * been set
> > +              */
> > +             if (rgb_led->component[0].priv) {
> > +                     ret =3D -EINVAL;
> > +                     dev_err(priv->dev, "using the same reg value twic=
e\n");
> > +                     goto child_out;
> > +             }
> > +
> > +             ret =3D fwnode_property_read_string(child, "label",
> > +                                               &rgb_led_name);
> > +             if (ret) {
> > +                     ret =3D -EINVAL;
> > +                     dev_err(priv->dev, "missing rgb led name\n");
> > +                     goto child_out;
> > +             }
> > +
> > +             /* setting a color_id value for each of the 4 components =
of the
> > +              * apa102c RGB led. The first component is the global bri=
ghtness
> > +              * of the led and thus has no color. The order of the col=
ors
> > +              * after the global brightness is then blue, green and re=
d
> > +              * in that order. It corresponds to the order in which th=
e
> > +              * values are sent using spi
> > +              */
> > +             rgb_led->component[0].color_id =3D -1; //no color
> > +             rgb_led->component[1].color_id =3D LED_COLOR_ID_BLUE;
> > +             rgb_led->component[2].color_id =3D LED_COLOR_ID_GREEN;
> > +             rgb_led->component[3].color_id =3D LED_COLOR_ID_RED;
>
> Each LED has to have separate DT node. We haven't had so far use case
> with global brightness but I think it would be OK to add
> LED_COLOR_ID_LUMA for that. But please hold on with making any changes
> until Pavel will express his opinion on that.

It would be nice to have LED_COLOR_ID_LUMA. However, I don't feel like
it is really a color. I'll wait for Pavel's opinion.

>
> > +
> > +             /* now looping on each component and registering a corres=
ponding
> > +              * led
> > +              */
> > +             for (i =3D 0; i < 4; i++) {
> > +                     led =3D &rgb_led->component[i];
> > +                     if (led->color_id =3D=3D -1) {
> > +                             /* the global brightness has no defined n=
ame
> > +                              * so setting it to "brightness". It also=
 has
> > +                              * a different MAX_BRIGHTNESS value.
> > +                              * If a trigger is present, setting it on=
 this
> > +                              * component
> > +                              */
> > +                             led->cdev.max_brightness =3D
> > +                                     GLOBAL_MAX_BRIGHTNESS;
> > +                             led_component_name =3D "brightness";
> > +                             fwnode_property_read_string(child,
> > +                                     "linux,default-trigger",
> > +                                     &led->cdev.default_trigger);
> > +                     } else {
> > +                             /* using the color name defined by the fr=
amework
> > +                              * for the B, G and R components
> > +                              */
> > +                             led->cdev.max_brightness =3D RGB_MAX_BRIG=
HTNESS;
> > +                             led_component_name =3D led_colors[led->co=
lor_id];
> > +                     }
> > +
> > +                     /* the rest is common to all the components */
> > +                     led->priv =3D priv;
> > +                     led->cdev.brightness_set_blocking =3D
> > +                             apa102c_brightness_set;
> > +                     /* creating our own led name to differentiate the=
 4
> > +                      * components
> > +                      */
> > +                     snprintf(led->name, sizeof(led->name),
> > +                              "%s_%s", rgb_led_name, led_component_nam=
e);
> > +                     led->cdev.name =3D led->name;
> > +
>
> LED core can do the above for you, if only you provide it with LED
> fwnode.

I was doing that to have a led_name formatted as "label_color". I am
going to check for LED functions that could work for me and come back
to you if find other functions that are not present.

>
> > +                     ret =3D devm_led_classdev_register_ext(priv->dev,
> > +                                                          &led->cdev,
> > +                                                          NULL);
>
> There is no point in using *ext API and not passing led_init_data to it.
> Please pass struct led_init_data in the third argument, with initialized
> only its fwnode property.
>
> > +                     if (ret) {
> > +                             dev_err(priv->dev, "led register err: %d\=
n",
> > +                                     ret);
> > +                             goto child_out;
> > +                     }
> > +             }
> > +     }
> > +
> > +child_out:
> > +     return ret;
> > +}
> > +
> > +static int apa102c_probe(struct spi_device *spi)
> > +{
> > +     struct apa102c  *priv;
> > +     size_t          led_count;
> > +     int             ret;
> > +
> > +     led_count =3D device_get_child_node_count(&spi->dev);
> > +     if (!led_count) {
> > +             dev_err(&spi->dev, "No LEDs defined in device tree!");
> > +             return -ENODEV;
> > +     }
> > +
> > +     priv =3D devm_kzalloc(&spi->dev,
> > +                         struct_size(priv, rgb_leds, led_count),
> > +                         GFP_KERNEL);
> > +     if (!priv)
> > +             return -ENOMEM;
> > +
> > +     priv->spi_buf =3D devm_kzalloc(&spi->dev,
> > +                                  (led_count + 2) * sizeof(u32),
> > +                                   GFP_KERNEL);
> > +     if (!priv->spi_buf)
> > +             return -ENOMEM;
> > +
> > +     mutex_init(&priv->lock);
> > +     priv->led_count =3D led_count;
> > +     priv->dev       =3D &spi->dev;
> > +     priv->spi       =3D spi;
> > +
> > +     ret =3D apa102c_probe_dt(priv);
> > +     if (ret)
> > +             return ret;
> > +
> > +     /* Set the LEDs with default values at start */
> > +     apa102c_sync(priv);
> > +     if (ret)
> > +             return ret;
> > +
> > +     spi_set_drvdata(spi, priv);
> > +
> > +     return 0;
> > +}
> > +
> > +static int apa102c_remove(struct spi_device *spi)
> > +{
> > +     struct apa102c *priv =3D spi_get_drvdata(spi);
> > +
> > +     mutex_destroy(&priv->lock);
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct of_device_id apa102c_dt_ids[] =3D {
> > +     { .compatible =3D "shiji,apa102c", },
> > +     {},
> > +};
> > +
> > +MODULE_DEVICE_TABLE(of, apa102c_dt_ids);
> > +
> > +static struct spi_driver apa102c_driver =3D {
> > +     .probe          =3D apa102c_probe,
> > +     .remove         =3D apa102c_remove,
> > +     .driver =3D {
> > +             .name           =3D KBUILD_MODNAME,
> > +             .of_match_table =3D apa102c_dt_ids,
> > +     },
> > +};
> > +
> > +module_spi_driver(apa102c_driver);
> > +
> > +MODULE_AUTHOR("Nicolas Belin <nbelin@baylibre.com>");
> > +MODULE_DESCRIPTION("apa102c LED driver");
> > +MODULE_LICENSE("GPL v2");
> > +MODULE_ALIAS("spi:apa102c");
> >
>
> --
> Best regards,
> Jacek Anaszewski

Thanks,

Regards,

Nicolas
