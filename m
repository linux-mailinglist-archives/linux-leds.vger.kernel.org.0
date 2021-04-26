Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12D5536B1E1
	for <lists+linux-leds@lfdr.de>; Mon, 26 Apr 2021 12:50:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233068AbhDZKvP (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 26 Apr 2021 06:51:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232823AbhDZKvO (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 26 Apr 2021 06:51:14 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECB5AC061574;
        Mon, 26 Apr 2021 03:50:28 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id r128so60594041lff.4;
        Mon, 26 Apr 2021 03:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=liqi5FsD5cM7tPT6eP/6jHy/oHunqM3YiydXA1FG9JU=;
        b=fsY8FjuXVfrZqSYjgY+KhyBZOxGtxHfbsf8hcDVWjb0dQrPICp8mER6gkpbptMsLGH
         +073LRhLww1IKpugbUFN4satcakNyI+HAyXjee+TEtWxRJlbCbGvfOn1ik5oWP6KLAnQ
         KYWwywBbG8a2bagpv77HPAvFrDs6G4GPbGa++gxsOdoTuWOCcZJyKhQVCMzUEJtyFPEQ
         5HwrSJF4YXjY5Y7QfZ/ywqurOW/dDl/wdcEmYomCbWe3ti9KkClxhhH3/45zYlIqYVw2
         3aVp/OhZVtWjj4wrQ9cTB3B4h6McW4WWQJ+YP/5kaewlXX46di7ODZBa+qSY8EoUlMYm
         vv0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=liqi5FsD5cM7tPT6eP/6jHy/oHunqM3YiydXA1FG9JU=;
        b=EHqIS4zZPAJvW5glW/CHjSFjzfp0se+hULBR6AedEDgpBkqGeNulMSed+0tIkQg6mP
         QO0XWmEvM3yXLqoU3JggihzzF5g7RjngQn1t2+HiAiDiN7G5297oc4lR9BoZTGsnBywR
         u9xBPe7qxfhvffWA/so2av9gJQDvadvzX3RPuaOjBFN8UTJTXYnGWkaaeJrsqJkXTG3c
         Bb3GBM2YOgV1XaXVvR89G4Htj3Qdb/vIJncU7/4BVrlPZnkXjUZexZMQVgeu9oPUrg+o
         3qVo+Xkk0O6n2DX/X3qj75B/o3HK1WaDXp3nZc57FdP1B5N3uhZJqiFcnGi5XJAGcSso
         2NTg==
X-Gm-Message-State: AOAM532X1EwM7Q/Xaau4JvzeGGVyxaPCfuAgNEqWvaEZCvUgI9NcXlXS
        6OEh5EkDTAeeQaiuoqC5oqtjuqllIjygz1DSfkw=
X-Google-Smtp-Source: ABdhPJxXaBli/4qy+O0K4m6qEGRvea6p7H65wZvL/NayD+TIB0Hroj4rg+AyWGGctaA+tLotR0jxc6yshTALvk6n150=
X-Received: by 2002:a05:6512:131c:: with SMTP id x28mr12328260lfu.638.1619434227251;
 Mon, 26 Apr 2021 03:50:27 -0700 (PDT)
MIME-Version: 1.0
References: <1619421491-31494-1-git-send-email-u0084500@gmail.com>
 <1619421491-31494-4-git-send-email-u0084500@gmail.com> <20210426101955.uvuzzsiig27xyuxc@maple.lan>
In-Reply-To: <20210426101955.uvuzzsiig27xyuxc@maple.lan>
From:   ChiYuan Huang <u0084500@gmail.com>
Date:   Mon, 26 Apr 2021 18:50:15 +0800
Message-ID: <CADiBU39F8+GM4z7xJPpDVS7riPGi02BrurvMmnHMEPeKBQJ_tg@mail.gmail.com>
Subject: Re: [RESEND PATCH v6 4/4] backlight: rt4831: Adds support for Richtek
 RT4831 backlight
To:     Daniel Thompson <daniel.thompson@linaro.org>
Cc:     Lee Jones <lee.jones@linaro.org>, lgirdwood@gmail.com,
        Mark Brown <broonie@kernel.org>, jingoohan1@gmail.com,
        b.zolnierkie@samsung.com, Pavel Machek <pavel@ucw.cz>,
        Rob Herring <robh+dt@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        lkml <linux-kernel@vger.kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, cy_huang <cy_huang@richtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

Daniel Thompson <daniel.thompson@linaro.org> =E6=96=BC 2021=E5=B9=B44=E6=9C=
=8826=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=886:19=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> On Mon, Apr 26, 2021 at 03:18:11PM +0800, cy_huang wrote:
> > From: ChiYuan Huang <cy_huang@richtek.com>
> >
> > Adds support for Richtek RT4831 backlight.
> >
> > Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> > Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> > ---
> > Resend this v6 patch series to loop devicetree reviewers.
> >
> > For next, if the typo in Kconfig 'common' to 'commonly' can be added th=
e below line
> > Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> > ---
>
> This isn't the best way to handle feedback from multiple maintainers.
>
> It is great to see you are keeping track of feedback. However it doesn't
> make sense to RESEND an old patchset and acknowledge that you haven't
> fixed a typo yet.
>
> It would be better to fix the typo and to resend a v7.
>
You can refer to the below reply
https://lkml.org/lkml/2021/4/23/229

>
> Daniel.
>
>
> >  drivers/video/backlight/Kconfig            |   8 ++
> >  drivers/video/backlight/Makefile           |   1 +
> >  drivers/video/backlight/rt4831-backlight.c | 203 +++++++++++++++++++++=
++++++++
> >  3 files changed, 212 insertions(+)
> >  create mode 100644 drivers/video/backlight/rt4831-backlight.c
> >
> > diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/=
Kconfig
> > index d83c87b..de96441 100644
> > --- a/drivers/video/backlight/Kconfig
> > +++ b/drivers/video/backlight/Kconfig
> > @@ -289,6 +289,14 @@ config BACKLIGHT_QCOM_WLED
> >         If you have the Qualcomm PMIC, say Y to enable a driver for the
> >         WLED block. Currently it supports PM8941 and PMI8998.
> >
> > +config BACKLIGHT_RT4831
> > +     tristate "Richtek RT4831 Backlight Driver"
> > +     depends on MFD_RT4831
> > +     help
> > +       This enables support for Richtek RT4831 Backlight driver.
> > +       It's common used to drive the display WLED. There're four chann=
els
> > +       inisde, and each channel can provide up to 30mA current.
> > +
> >  config BACKLIGHT_SAHARA
> >       tristate "Tabletkiosk Sahara Touch-iT Backlight Driver"
> >       depends on X86
> > diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight=
/Makefile
> > index 685f3f1..cae2c83 100644
> > --- a/drivers/video/backlight/Makefile
> > +++ b/drivers/video/backlight/Makefile
> > @@ -49,6 +49,7 @@ obj-$(CONFIG_BACKLIGHT_PANDORA)             +=3D pand=
ora_bl.o
> >  obj-$(CONFIG_BACKLIGHT_PCF50633)     +=3D pcf50633-backlight.o
> >  obj-$(CONFIG_BACKLIGHT_PWM)          +=3D pwm_bl.o
> >  obj-$(CONFIG_BACKLIGHT_QCOM_WLED)    +=3D qcom-wled.o
> > +obj-$(CONFIG_BACKLIGHT_RT4831)               +=3D rt4831-backlight.o
> >  obj-$(CONFIG_BACKLIGHT_SAHARA)               +=3D kb3886_bl.o
> >  obj-$(CONFIG_BACKLIGHT_SKY81452)     +=3D sky81452-backlight.o
> >  obj-$(CONFIG_BACKLIGHT_TOSA)         +=3D tosa_bl.o
> > diff --git a/drivers/video/backlight/rt4831-backlight.c b/drivers/video=
/backlight/rt4831-backlight.c
> > new file mode 100644
> > index 00000000..42155c7
> > --- /dev/null
> > +++ b/drivers/video/backlight/rt4831-backlight.c
> > @@ -0,0 +1,203 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +
> > +#include <dt-bindings/leds/rt4831-backlight.h>
> > +#include <linux/backlight.h>
> > +#include <linux/bitops.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/property.h>
> > +#include <linux/regmap.h>
> > +
> > +#define RT4831_REG_BLCFG     0x02
> > +#define RT4831_REG_BLDIML    0x04
> > +#define RT4831_REG_ENABLE    0x08
> > +
> > +#define RT4831_BLMAX_BRIGHTNESS      2048
> > +
> > +#define RT4831_BLOVP_MASK    GENMASK(7, 5)
> > +#define RT4831_BLOVP_SHIFT   5
> > +#define RT4831_BLPWMEN_MASK  BIT(0)
> > +#define RT4831_BLEN_MASK     BIT(4)
> > +#define RT4831_BLCH_MASK     GENMASK(3, 0)
> > +#define RT4831_BLDIML_MASK   GENMASK(2, 0)
> > +#define RT4831_BLDIMH_MASK   GENMASK(10, 3)
> > +#define RT4831_BLDIMH_SHIFT  3
> > +
> > +struct rt4831_priv {
> > +     struct device *dev;
> > +     struct regmap *regmap;
> > +     struct backlight_device *bl;
> > +};
> > +
> > +static int rt4831_bl_update_status(struct backlight_device *bl_dev)
> > +{
> > +     struct rt4831_priv *priv =3D bl_get_data(bl_dev);
> > +     int brightness =3D backlight_get_brightness(bl_dev);
> > +     unsigned int enable =3D brightness ? RT4831_BLEN_MASK : 0;
> > +     u8 v[2];
> > +     int ret;
> > +
> > +     if (brightness) {
> > +             v[0] =3D (brightness - 1) & RT4831_BLDIML_MASK;
> > +             v[1] =3D ((brightness - 1) & RT4831_BLDIMH_MASK) >> RT483=
1_BLDIMH_SHIFT;
> > +
> > +             ret =3D regmap_raw_write(priv->regmap, RT4831_REG_BLDIML,=
 v, sizeof(v));
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     return regmap_update_bits(priv->regmap, RT4831_REG_ENABLE, RT4831=
_BLEN_MASK, enable);
> > +
> > +}
> > +
> > +static int rt4831_bl_get_brightness(struct backlight_device *bl_dev)
> > +{
> > +     struct rt4831_priv *priv =3D bl_get_data(bl_dev);
> > +     unsigned int val;
> > +     u8 v[2];
> > +     int ret;
> > +
> > +     ret =3D regmap_read(priv->regmap, RT4831_REG_ENABLE, &val);
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (!(val & RT4831_BLEN_MASK))
> > +             return 0;
> > +
> > +     ret =3D regmap_raw_read(priv->regmap, RT4831_REG_BLDIML, v, sizeo=
f(v));
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D (v[1] << RT4831_BLDIMH_SHIFT) + (v[0] & RT4831_BLDIML_MAS=
K) + 1;
> > +
> > +     return ret;
> > +}
> > +
> > +static const struct backlight_ops rt4831_bl_ops =3D {
> > +     .options =3D BL_CORE_SUSPENDRESUME,
> > +     .update_status =3D rt4831_bl_update_status,
> > +     .get_brightness =3D rt4831_bl_get_brightness,
> > +};
> > +
> > +static int rt4831_parse_backlight_properties(struct rt4831_priv *priv,
> > +                                          struct backlight_properties =
*bl_props)
> > +{
> > +     struct device *dev =3D priv->dev;
> > +     u8 propval;
> > +     u32 brightness;
> > +     unsigned int val =3D 0;
> > +     int ret;
> > +
> > +     /* common properties */
> > +     ret =3D device_property_read_u32(dev, "max-brightness", &brightne=
ss);
> > +     if (ret)
> > +             brightness =3D RT4831_BLMAX_BRIGHTNESS;
> > +
> > +     bl_props->max_brightness =3D min_t(u32, brightness, RT4831_BLMAX_=
BRIGHTNESS);
> > +
> > +     ret =3D device_property_read_u32(dev, "default-brightness", &brig=
htness);
> > +     if (ret)
> > +             brightness =3D bl_props->max_brightness;
> > +
> > +     bl_props->brightness =3D min_t(u32, brightness, bl_props->max_bri=
ghtness);
> > +
> > +     /* vendor properties */
> > +     if (device_property_read_bool(dev, "richtek,pwm-enable"))
> > +             val =3D RT4831_BLPWMEN_MASK;
> > +
> > +     ret =3D regmap_update_bits(priv->regmap, RT4831_REG_BLCFG, RT4831=
_BLPWMEN_MASK, val);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D device_property_read_u8(dev, "richtek,bled-ovp-sel", &pro=
pval);
> > +     if (ret)
> > +             propval =3D RT4831_BLOVPLVL_21V;
> > +
> > +     propval =3D min_t(u8, propval, RT4831_BLOVPLVL_29V);
> > +     ret =3D regmap_update_bits(priv->regmap, RT4831_REG_BLCFG, RT4831=
_BLOVP_MASK,
> > +                              propval << RT4831_BLOVP_SHIFT);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D device_property_read_u8(dev, "richtek,channel-use", &prop=
val);
> > +     if (ret) {
> > +             dev_err(dev, "richtek,channel-use DT property missing\n")=
;
> > +             return ret;
> > +     }
> > +
> > +     if (!(propval & RT4831_BLCH_MASK)) {
> > +             dev_err(dev, "No channel specified\n");
> > +             return -EINVAL;
> > +     }
> > +
> > +     return regmap_update_bits(priv->regmap, RT4831_REG_ENABLE, RT4831=
_BLCH_MASK, propval);
> > +}
> > +
> > +static int rt4831_bl_probe(struct platform_device *pdev)
> > +{
> > +     struct rt4831_priv *priv;
> > +     struct backlight_properties bl_props =3D { .type =3D BACKLIGHT_RA=
W,
> > +                                              .scale =3D BACKLIGHT_SCA=
LE_LINEAR };
> > +     int ret;
> > +
> > +     priv =3D devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> > +     if (!priv)
> > +             return -ENOMEM;
> > +
> > +     priv->dev =3D &pdev->dev;
> > +
> > +     priv->regmap =3D dev_get_regmap(pdev->dev.parent, NULL);
> > +     if (!priv->regmap) {
> > +             dev_err(&pdev->dev, "Failed to init regmap\n");
> > +             return -ENODEV;
> > +     }
> > +
> > +     ret =3D rt4831_parse_backlight_properties(priv, &bl_props);
> > +     if (ret) {
> > +             dev_err(&pdev->dev, "Failed to parse backlight properties=
\n");
> > +             return ret;
> > +     }
> > +
> > +     priv->bl =3D devm_backlight_device_register(&pdev->dev, pdev->nam=
e, &pdev->dev, priv,
> > +                                               &rt4831_bl_ops, &bl_pro=
ps);
> > +     if (IS_ERR(priv->bl)) {
> > +             dev_err(&pdev->dev, "Failed to register backlight\n");
> > +             return PTR_ERR(priv->bl);
> > +     }
> > +
> > +     backlight_update_status(priv->bl);
> > +     platform_set_drvdata(pdev, priv);
> > +
> > +     return 0;
> > +}
> > +
> > +static int rt4831_bl_remove(struct platform_device *pdev)
> > +{
> > +     struct rt4831_priv *priv =3D platform_get_drvdata(pdev);
> > +     struct backlight_device *bl_dev =3D priv->bl;
> > +
> > +     bl_dev->props.brightness =3D 0;
> > +     backlight_update_status(priv->bl);
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct of_device_id __maybe_unused rt4831_bl_of_match[] =
=3D {
> > +     { .compatible =3D "richtek,rt4831-backlight", },
> > +     {}
> > +};
> > +MODULE_DEVICE_TABLE(of, rt4831_bl_of_match);
> > +
> > +static struct platform_driver rt4831_bl_driver =3D {
> > +     .driver =3D {
> > +             .name =3D "rt4831-backlight",
> > +             .of_match_table =3D rt4831_bl_of_match,
> > +     },
> > +     .probe =3D rt4831_bl_probe,
> > +     .remove =3D rt4831_bl_remove,
> > +};
> > +module_platform_driver(rt4831_bl_driver);
> > +
> > +MODULE_AUTHOR("ChiYuan Huang <cy_huang@richtek.com>");
> > +MODULE_LICENSE("GPL v2");
> > --
> > 2.7.4
> >
