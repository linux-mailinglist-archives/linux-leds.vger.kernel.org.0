Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C745165B67
	for <lists+linux-leds@lfdr.de>; Thu, 20 Feb 2020 11:25:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727233AbgBTKZv (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 20 Feb 2020 05:25:51 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:37081 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726799AbgBTKZu (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 20 Feb 2020 05:25:50 -0500
Received: by mail-io1-f67.google.com with SMTP id k24so4077613ioc.4
        for <linux-leds@vger.kernel.org>; Thu, 20 Feb 2020 02:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ozNFWI7YKFU4IR2PNM9sYLJwGbs+eCqB6rhMngengUc=;
        b=BlT4wGq9jCSKjiSZx0M7vsF6hxJGALlV/CpyMGZB0dWchMU2kpfgbnB8G+HN8WiR82
         qgUIyH9C8pk/W8fDX6F0CSZAURHpeMJJJMVEEe5AsgA78ARQegvNHWJSy3F8CCnUgRse
         QIvSYCHbHLOIyPrqj/D/3TGSm/VaXAS5/Nme+to2EuPuqHb1ClsroSIIG84lUFEiSSYq
         tncEGla+J/2ZVcPgVbeXgVK0QtIVWosLzuEo/jfOBsHObyyQfzN/CfG+HwWK0gJD5QQY
         J6b0OIGMPz62mU9/2ERE2Rh3kSXKWCAhPxiu/AxY4g7+ZyxB6qx1UEdU0x/G6VQYJkwE
         NXBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ozNFWI7YKFU4IR2PNM9sYLJwGbs+eCqB6rhMngengUc=;
        b=r5/KrytWTBgAXtWxBiQrXyiEOrOA9gEPqOd1a9Folbey65GKCtOnAsq9G2JcscLtax
         3eGhFLr4pahTi7HMXB6BIMui6uK+9vKroeSIwjK57StNQfBeha6K8YX9r7dbI1dGDpIK
         4Fp5jaKsMII8KhMNi5zQ2T0PQapOUM+8pNTje+v+feTc/JS+Ijc88WKZJAVPotPv2V0K
         dPlP9hzZEnDdOPezi02irDx3wdJZ9NzDjA2KermbiFqAmd8yfMaF9qiHh14YXyxicqdA
         edrfBtiLgoZqsPUePAV99NFTvCOGwJOGD+hLpsPoiAhaH217MTm5j+eb2Dq64r3+vWhg
         PMnA==
X-Gm-Message-State: APjAAAVkVQ+/7uf5EkJaVhQCg8ALx1rPk8RuPGKpMF+eyOJwRy2D/oSb
        MaCGmqzwP9gS2pflm5LvSG8SxpGtd7pyTqujwORV6g==
X-Google-Smtp-Source: APXvYqxzG+7Qi4bbwmjolrEsiUjVhoKzeAKruUgrRRLIYEfNQ9BQ8Y1SRmPuW5qLbSwyURy9kp8aieW/Igj2C/vLE0U=
X-Received: by 2002:a5d:9c8c:: with SMTP id p12mr23632189iop.72.1582194348453;
 Thu, 20 Feb 2020 02:25:48 -0800 (PST)
MIME-Version: 1.0
References: <1582018657-5720-1-git-send-email-nbelin@baylibre.com>
 <1582018657-5720-4-git-send-email-nbelin@baylibre.com> <00d63872-0856-602a-e24b-4e27300d9254@gmail.com>
In-Reply-To: <00d63872-0856-602a-e24b-4e27300d9254@gmail.com>
From:   Nicolas Belin <nbelin@baylibre.com>
Date:   Thu, 20 Feb 2020 11:25:37 +0100
Message-ID: <CAJZgTGErq0mvsaWiaqrjPR+UPX591Tv-O3m6n1zt0M_-Fiz4fQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] drivers: leds: add support for apa102c leds
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        pavel@ucw.cz, dmurphy@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Jacek,

Thanks for you feedback.
I am going to use multicolor framework as Dan mentioned, and fix the
issues you pointed out.

Regards,

Nicolas

Le mar. 18 f=C3=A9vr. 2020 =C3=A0 22:13, Jacek Anaszewski
<jacek.anaszewski@gmail.com> a =C3=A9crit :
>
> Hi Nicolas,
>
> On 2/18/20 10:37 AM, Nicolas Belin wrote:
> > Initilial commit in order to support the apa102c RGB leds.
> >
> > Signed-off-by: Nicolas Belin <nbelin@baylibre.com>
> > ---
> >  drivers/leds/Kconfig        |  11 ++
> >  drivers/leds/Makefile       |   1 +
> >  drivers/leds/leds-apa102c.c | 268 ++++++++++++++++++++++++++++++++++++=
++++++++
> >  3 files changed, 280 insertions(+)
> >  create mode 100644 drivers/leds/leds-apa102c.c
> >
> > diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> > index d82f1dea3711..4fafeaaf6ee8 100644
> > --- a/drivers/leds/Kconfig
> > +++ b/drivers/leds/Kconfig
> > @@ -69,6 +69,17 @@ config LEDS_AN30259A
> >         To compile this driver as a module, choose M here: the module
> >         will be called leds-an30259a.
> >
> > +config LEDS_APA102C
> > +     tristate "LED Support for Shiji APA102C"
> > +     depends on LEDS_CLASS
> > +     depends on SPI
> > +     help
> > +       This option enables support for the Shiji Lighthing APA102C RGB=
 full color
> > +       LEDs.
> > +
> > +       To compile this driver as a module, choose M here: the module
> > +       will be called leds-apa102c.
> > +
> >  config LEDS_APU
> >       tristate "Front panel LED support for PC Engines APU/APU2/APU3 bo=
ards"
> >       depends on LEDS_CLASS
> > diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> > index d7e1107753fb..ab17f90347cb 100644
> > --- a/drivers/leds/Makefile
> > +++ b/drivers/leds/Makefile
> > @@ -9,6 +9,7 @@ obj-$(CONFIG_LEDS_TRIGGERS)           +=3D led-triggers=
.o
> >  # LED Platform Drivers
> >  obj-$(CONFIG_LEDS_88PM860X)          +=3D leds-88pm860x.o
> >  obj-$(CONFIG_LEDS_AAT1290)           +=3D leds-aat1290.o
> > +obj-$(CONFIG_LEDS_APA102C)           +=3D leds-apa102c.o
> >  obj-$(CONFIG_LEDS_APU)                       +=3D leds-apu.o
> >  obj-$(CONFIG_LEDS_AS3645A)           +=3D leds-as3645a.o
> >  obj-$(CONFIG_LEDS_AN30259A)          +=3D leds-an30259a.o
> > diff --git a/drivers/leds/leds-apa102c.c b/drivers/leds/leds-apa102c.c
> > new file mode 100644
> > index 000000000000..e7abe3f5b7c2
> > --- /dev/null
> > +++ b/drivers/leds/leds-apa102c.c
> > @@ -0,0 +1,268 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +/*
> > + * Copyright (C) 2020 BayLibre, SAS
> > + * Author: Nicolas Belin <nbelin@baylibre.com>
> > + */
>
> Please use "//" comment style for all the above lines.
>
> > +
> > +#include <linux/leds.h>
> > +#include <linux/module.h>
> > +#include <linux/of_device.h>
> > +#include <linux/spi/spi.h>
> > +#include <uapi/linux/uleds.h>
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
> > +#define CR_MAX_BRIGHTNESS    GENMASK(7, 0)
> > +#define LM_MAX_BRIGHTNESS    GENMASK(4, 0)
> > +#define CH_NUM                       4
> > +#define START_BYTE           0
> > +#define END_BYTE             GENMASK(7, 0)
> > +#define LED_FRAME_HEADER     GENMASK(7, 5)
> > +
> > +enum led_channels {
> > +     RED,
> > +     GREEN,
> > +     BLUE,
> > +     LUMA,
> > +};
> > +
> > +struct apa102c_led {
> > +     char                    name[LED_MAX_NAME_SIZE];
> > +     struct apa102c          *priv;
> > +     struct led_classdev     ldev;
> > +     u8                      brightness;
>
> Please drop this one, struct led_classdev already holds brightness
> value.
>
> > +};
> > +
> > +struct apa102c {
> > +     size_t                  led_count;
> > +     struct device           *dev;
> > +     struct mutex            lock;
> > +     struct spi_device       *spi;
> > +     u8                      *buf;
> > +     struct apa102c_led      leds[];
> > +};
> > +
> > +static int apa102c_sync(struct apa102c *priv)
> > +{
> > +     int     ret;
> > +     size_t  i;
> > +     size_t  bytes =3D 0;
> > +
> > +     for (i =3D 0; i < 4; i++)
> > +             priv->buf[bytes++] =3D START_BYTE;
> > +
> > +     for (i =3D 0; i < priv->led_count; i++) {
> > +             priv->buf[bytes++] =3D LED_FRAME_HEADER |
> > +                                  priv->leds[i * CH_NUM + LUMA].bright=
ness;
> > +             priv->buf[bytes++] =3D priv->leds[i * CH_NUM + BLUE].brig=
htness;
> > +             priv->buf[bytes++] =3D priv->leds[i * CH_NUM + GREEN].bri=
ghtness;
> > +             priv->buf[bytes++] =3D priv->leds[i * CH_NUM + RED].brigh=
tness;
>
> This is odd. You create separate LED class device for each color anyway,
> so this seems pointless. We have pending LED multi color framework patch
> set, as Dan mentioned, so you could try to use it. If you want to have
> the patch set accepted quicker then just set brightness for one LED at
> a time. You will be able to add LED multicolor class support later when
> it will be ready.
>
> > +     }
> > +
> > +     for (i =3D 0; i < 4; i++)
> > +             priv->buf[bytes++] =3D END_BYTE;
> > +
> > +     ret =3D spi_write(priv->spi, priv->buf, bytes);
> > +
> > +     return ret;
> > +}
> > +
> > +static int apa102c_set_sync(struct led_classdev *ldev,
> > +                        enum led_brightness brightness)
> > +{
> > +     int                     ret;
> > +     struct apa102c_led      *led =3D container_of(ldev,
> > +                                                 struct apa102c_led,
> > +                                                 ldev);
> > +
> > +     dev_dbg(led->priv->dev, "Set brightness of %s to %d\n",
> > +             led->name, brightness);
> > +
> > +     mutex_lock(&led->priv->lock);
> > +     led->brightness =3D (u8)brightness;
> > +     ret =3D apa102c_sync(led->priv);
> > +     mutex_unlock(&led->priv->lock);
> > +
> > +     return ret;
> > +}
> > +
> > +static int apa102c_probe_dt(struct apa102c *priv)
> > +{
> > +     u32                     i =3D 0;
> > +     int                     j =3D 0;
> > +     struct apa102c_led      *led;
> > +     struct fwnode_handle    *child;
> > +     struct device_node      *np;
> > +     int                     ret;
> > +     int                     use_index;
> > +     const char              *str;
> > +     static const char       * const rgb_name[] =3D {"red",
> > +                                                   "green",
> > +                                                   "blue",
> > +                                                   "luma"};
>
> We have LED_COLOR_ID* definitions in dt-bindings/leds/common.h
> for red, green and blue. And regarding "luma" - what is specificity
> of that one? If neither of existing definitions fits for it then
> you are welcome to submit a patch adding LED_COLOR_ID_LUMA.
>
> > +
> > +     device_for_each_child_node(priv->dev, child) {
> > +             np =3D to_of_node(child);
> > +
> > +             ret =3D fwnode_property_read_u32(child, "reg", &i);
> > +             if (ret)
> > +                     return ret;
> > +
> > +             if (i >=3D priv->led_count)
> > +                     return -EINVAL;
> > +
> > +             /* use the index to create the name if the label is not s=
et */
> > +             use_index =3D fwnode_property_read_string(child, "label",=
 &str);
> > +
> > +             /* for each physical LED, 4 LEDs are created representing
> > +              * the 4 components: red, green, blue and global luma.
> > +              */
> > +             for (j =3D 0; j < CH_NUM; j++) {
> > +                     led =3D &priv->leds[i * CH_NUM + j];
> > +
> > +                     if (use_index)
> > +                             snprintf(led->name, sizeof(led->name),
> > +                                      "apa102c:%s:%d", rgb_name[j], i)=
;
> > +                     else
> > +                             snprintf(led->name, sizeof(led->name),
> > +                                      "apa102c:%s:%s", rgb_name[j], st=
r);
>
> LED core already handles LED name composition. Please refer to existing
> LED class drivers that use devm_led_classdev_register_ext() API and use
> it in your driver.
>
> > +
> > +                     fwnode_property_read_string(child,
> > +                                                 "linux,default-trigge=
r",
> > +                                                 &led->ldev.default_tr=
igger);
> > +
> > +                     led->priv                        =3D priv;
> > +                     led->ldev.name                   =3D led->name;
> > +                     if (j =3D=3D LUMA) {
> > +                             led->ldev.brightness     =3D led->brightn=
ess
>
> What do you want to achieve here?
>
> > +                                                      =3D LM_MAX_BRIGH=
TNESS;
> > +                             led->ldev.max_brightness =3D LM_MAX_BRIGH=
TNESS;
> > +                     } else {
> > +                             led->ldev.brightness     =3D led->brightn=
ess
> > +                                                      =3D 0;
> > +                             led->ldev.max_brightness =3D CR_MAX_BRIGH=
TNESS;
> > +                     }
> > +
> > +                     led->ldev.brightness_set_blocking =3D apa102c_set=
_sync;
> > +
> > +                     ret =3D devm_led_classdev_register(priv->dev, &le=
d->ldev);
>
> As mentioned above - new *ext API will make your life easier.
>
> > +                     if (ret) {
> > +                             dev_err(priv->dev,
> > +                                     "failed to register LED %s, err %=
d",
> > +                                     led->name, ret);
> > +                             fwnode_handle_put(child);
> > +                             return ret;
> > +                     }
> > +
> > +                     led->ldev.dev->of_node =3D np;
> > +
> > +             }
> > +     }
> > +
> > +     return 0;
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
> > +                         struct_size(priv, leds, led_count * CH_NUM),
> > +                         GFP_KERNEL);
> > +     if (!priv)
> > +             return -ENOMEM;
> > +
> > +     priv->buf =3D devm_kzalloc(&spi->dev, led_count * CH_NUM + 8, GFP=
_KERNEL);
> > +     if (!priv->buf)
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
