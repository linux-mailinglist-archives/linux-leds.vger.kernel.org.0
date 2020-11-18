Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB7D82B7B0E
	for <lists+linux-leds@lfdr.de>; Wed, 18 Nov 2020 11:19:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725774AbgKRKSy (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 18 Nov 2020 05:18:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725446AbgKRKSy (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 18 Nov 2020 05:18:54 -0500
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07B65C0613D4;
        Wed, 18 Nov 2020 02:18:54 -0800 (PST)
Received: by mail-oi1-x244.google.com with SMTP id d9so1646854oib.3;
        Wed, 18 Nov 2020 02:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Pc6idY7nqDyuGRPUeuvVfmsX56U3MxHLPP7zeY7IpFs=;
        b=t5qAtAIYHA8aKQP6ZNbWLV6dKwYszM9XP+m3xyED1Uqqy/cHI7rpmgvzs0ZOupu7DP
         KzvKXQrnwlQ0zeuX5YD8gmS0nnjsjUYBAVvyzVhU6dgIC+dxDsd9U1Eh/JWELhbKvBeP
         /BUyJrCV+BVNRBmtmCXxd1ItVHoLK1zMkoNR+vZf2z0M3Zko3YKPE/4ZOU67qm41Jgto
         +j5uPUkonxHlJwEJtXb3/fWpU6dXrRSDi4R/2+0MoThbmsI33EjKja8+1XDRpMBj0H59
         OvC/KeDngn7bE+J/vw+zOpzlgMpXtAJJ+WPrOegxP99ogFok1WBijwuVotYvUq5vBFwW
         c76g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Pc6idY7nqDyuGRPUeuvVfmsX56U3MxHLPP7zeY7IpFs=;
        b=jyB2TCUzDz8B/hLnDZc7zNHimsK/yaq34Y1z2gDE55w2s0zS8ip5yl42oxxBJIb6RT
         NW1j5ZOpTdgNQMzcX7J7Dj9ioIcWHHrvER0HO9ouXB79/vZhEf6Q85fqk85sctKW8b8C
         c5wOx9KavnO0pspswhdGRieM/Ew1f3Fbj3S61sWakQGyQ4CJKZqaPqtoMT9/31XA9h1N
         2pVADeIZZJ8cD0zzY2OykRFDlcA7hxQDKosK/s0HXlOmH0nhr9crdZJvDMIZSjdjfinV
         nj1/YUtSRWYr58thLebe09uc5mD2zDCj0QIwx1Pj0HRN+rj2SkQOZUE4bof665TbtWNV
         ggmw==
X-Gm-Message-State: AOAM533fUQ5C/1cAP+FNjpHud6goEwUOYtEVlzEkPMZfrVyh6MDsLoQs
        ji1yrNoD7RMszg7DEM8pNtADeb9qVMcE7JLzdb8=
X-Google-Smtp-Source: ABdhPJwKeBpRSzrMUAeocK+aPvZ/tb7JRUPWqTdix2Amf8JD07kucKSumHblx9stSKlcyiJZ1dExLXPpfreoRetMACI=
X-Received: by 2002:aca:4783:: with SMTP id u125mr2272464oia.23.1605694733206;
 Wed, 18 Nov 2020 02:18:53 -0800 (PST)
MIME-Version: 1.0
References: <1605610537-18085-1-git-send-email-gene.chen.richtek@gmail.com>
 <1605610537-18085-3-git-send-email-gene.chen.richtek@gmail.com> <293d7e99-adf8-941a-7456-7d83adc5f27f@gmail.com>
In-Reply-To: <293d7e99-adf8-941a-7456-7d83adc5f27f@gmail.com>
From:   Gene Chen <gene.chen.richtek@gmail.com>
Date:   Wed, 18 Nov 2020 18:18:41 +0800
Message-ID: <CAE+NS37yAbedXuberk+-ojCWHCqMRi0UT_ibbfbjYfsu0WYxcw@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] leds: mt6360: Add LED driver for MT6360
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Gene Chen <gene_chen@richtek.com>, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek Anaszewski <jacek.anaszewski@gmail.com> =E6=96=BC 2020=E5=B9=B411=E6=
=9C=8818=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=886:25=E5=AF=AB=E9=81=
=93=EF=BC=9A
>
> Hi Gene,
>
> On 11/17/20 11:55 AM, Gene Chen wrote:
> > From: Gene Chen <gene_chen@richtek.com>
> >
> > Add MT6360 LED driver include 2-channel Flash LED with torch/strobe mod=
e,
> > 3-channel RGB LED support Register/Flash/Breath Mode, and 1-channel for
> > moonlight LED.
> >
> > Signed-off-by: Gene Chen <gene_chen@richtek.com>
> > ---
> >   drivers/leds/Kconfig       |  13 +
> >   drivers/leds/Makefile      |   1 +
> >   drivers/leds/leds-mt6360.c | 817 ++++++++++++++++++++++++++++++++++++=
+++++++++
> >   3 files changed, 831 insertions(+)
> >   create mode 100644 drivers/leds/leds-mt6360.c
> >
> > diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> > index 1c181df..4f533bc 100644
> > --- a/drivers/leds/Kconfig
> > +++ b/drivers/leds/Kconfig
> > @@ -271,6 +271,19 @@ config LEDS_MT6323
> >         This option enables support for on-chip LED drivers found on
> >         Mediatek MT6323 PMIC.
> >
> > +config LEDS_MT6360
> > +     tristate "LED Support for Mediatek MT6360 PMIC"
> > +     depends on LEDS_CLASS && OF
> > +     depends on LEDS_CLASS_FLASH || !LEDS_CLASS_FLASH
> > +     depends on LEDS_CLASS_MULTICOLOR || !LEDS_CLASS_MULTICOLOR
> > +     depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
> > +     depends on MFD_MT6360
> > +     help
> > +       This option enables support for dual Flash LED drivers found on
> > +       Mediatek MT6360 PMIC.
> > +       Independent current sources supply for each flash LED support t=
orch
> > +       and strobe mode.
> > +
> >   config LEDS_S3C24XX
> >       tristate "LED Support for Samsung S3C24XX GPIO LEDs"
> >       depends on LEDS_CLASS
> > diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> > index c2c7d7a..5596427 100644
> > --- a/drivers/leds/Makefile
> > +++ b/drivers/leds/Makefile
> > @@ -66,6 +66,7 @@ obj-$(CONFIG_LEDS_MIKROTIK_RB532)   +=3D leds-rb532.o
> >   obj-$(CONFIG_LEDS_MLXCPLD)          +=3D leds-mlxcpld.o
> >   obj-$(CONFIG_LEDS_MLXREG)           +=3D leds-mlxreg.o
> >   obj-$(CONFIG_LEDS_MT6323)           +=3D leds-mt6323.o
> > +obj-$(CONFIG_LEDS_MT6360)            +=3D leds-mt6360.o
> >   obj-$(CONFIG_LEDS_NET48XX)          +=3D leds-net48xx.o
> >   obj-$(CONFIG_LEDS_NETXBIG)          +=3D leds-netxbig.o
> >   obj-$(CONFIG_LEDS_NIC78BX)          +=3D leds-nic78bx.o
> > diff --git a/drivers/leds/leds-mt6360.c b/drivers/leds/leds-mt6360.c
> > new file mode 100644
> > index 0000000..e3a30bd
> > --- /dev/null
> > +++ b/drivers/leds/leds-mt6360.c
> > @@ -0,0 +1,817 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +
> > +#include <linux/bitops.h>
> > +#include <linux/delay.h>
> > +#include <linux/init.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/kernel.h>
> > +#include <linux/led-class-flash.h>
> > +#include <linux/led-class-multicolor.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/property.h>
> > +#include <linux/regmap.h>
> > +#include <media/v4l2-flash-led-class.h>
> > +
> > +enum {
> > +     MT6360_LED_ISNK1 =3D 0,
> > +     MT6360_LED_ISNK2,
> > +     MT6360_LED_ISNK3,
> > +     MT6360_LED_ISNKML,
> > +     MT6360_LED_FLASH1,
> > +     MT6360_LED_FLASH2,
> > +     MT6360_LED_MULTICOLOR,
> > +     MT6360_MAX_LEDS =3D MT6360_LED_MULTICOLOR
> > +};
> > +
> > +#define MT6360_REG_RGBEN             0x380
> > +#define MT6360_REG_ISNK(_led_no)     (0x381 + (_led_no))
> > +#define MT6360_ISNK_ENMASK(_led_no)  BIT(7 - (_led_no))
> > +#define MT6360_ISNK_MASK             GENMASK(4, 0)
> > +#define MT6360_CHRINDSEL_MASK                BIT(3)
> > +
> > +#define MULTICOLOR_NUM_CHANNELS              3
> > +
> > +#define MT6360_REG_FLEDEN            0x37E
> > +#define MT6360_REG_STRBTO            0x373
> > +#define MT6360_REG_FLEDBASE(_id)     (0x372 + 4 * (_id - MT6360_LED_FL=
ASH1))
> > +#define MT6360_REG_FLEDISTRB(_id)    (MT6360_REG_FLEDBASE(_id) + 2)
> > +#define MT6360_REG_FLEDITOR(_id)     (MT6360_REG_FLEDBASE(_id) + 3)
> > +#define MT6360_REG_CHGSTAT2          0x3E1
> > +#define MT6360_REG_FLEDSTAT1         0x3E9
> > +#define MT6360_ITORCH_MASK           GENMASK(4, 0)
> > +#define MT6360_ISTROBE_MASK          GENMASK(6, 0)
> > +#define MT6360_STRBTO_MASK           GENMASK(6, 0)
> > +#define MT6360_TORCHEN_MASK          BIT(3)
> > +#define MT6360_STROBEN_MASK          BIT(2)
> > +#define MT6360_FLCSEN_MASK(_id)              BIT(MT6360_LED_FLASH2 - _=
id)
> > +#define MT6360_FLEDCHGVINOVP_MASK    BIT(3)
> > +#define MT6360_FLED1STRBTO_MASK              BIT(11)
> > +#define MT6360_FLED2STRBTO_MASK              BIT(10)
> > +#define MT6360_FLED1STRB_MASK                BIT(9)
> > +#define MT6360_FLED2STRB_MASK                BIT(8)
> > +#define MT6360_FLED1SHORT_MASK               BIT(7)
> > +#define MT6360_FLED2SHORT_MASK               BIT(6)
> > +#define MT6360_FLEDLVF_MASK          BIT(3)
> > +
> > +#define MT6360_ISNKRGB_STEPUA                2000
> > +#define MT6360_ISNKRGB_MAXUA         24000
> > +#define MT6360_ISNKML_STEPUA         5000
> > +#define MT6360_ISNKML_MAXUA          150000
> > +
> > +#define MT6360_ITORCH_MINUA          25000
> > +#define MT6360_ITORCH_STEPUA         12500
> > +#define MT6360_ITORCH_MAXUA          400000
> > +#define MT6360_ISTRB_MINUA           50000
> > +#define MT6360_ISTRB_STEPUA          12500
> > +#define MT6360_ISTRB_MAXUA           1500000
> > +#define MT6360_STRBTO_MINUS          64000
> > +#define MT6360_STRBTO_STEPUS         32000
> > +#define MT6360_STRBTO_MAXUS          2432000
> > +
> > +#define STATE_OFF                    0
> > +#define STATE_KEEP                   1
> > +#define STATE_ON                     2
> > +
> > +struct mt6360_led {
> > +     union {
> > +             struct led_classdev isnk;
> > +             struct led_classdev_mc mc;
> > +             struct led_classdev_flash flash;
> > +     };
> > +     struct v4l2_flash *v4l2_flash;
> > +     struct mt6360_priv *priv;
> > +     u32 led_no;
> > +     u32 default_state;
> > +};
> > +
> > +struct mt6360_priv {
> > +     struct device *dev;
> > +     struct regmap *regmap;
> > +     struct mutex lock;
> > +     unsigned int fled_strobe_used;
> > +     unsigned int fled_torch_used;
> > +     unsigned int leds_active;
> > +     unsigned int leds_count;
> > +     struct mt6360_led leds[];
> > +};
> > +
> > +static int mt6360_mc_brightness_set(struct led_classdev *lcdev, enum l=
ed_brightness level)
> > +{
> > +     struct led_classdev_mc *mccdev =3D lcdev_to_mccdev(lcdev);
> > +     struct mt6360_led *led =3D container_of(mccdev, struct mt6360_led=
, mc);
> > +     struct mt6360_priv *priv =3D led->priv;
> > +     u32 real_bright, enable_mask =3D 0, enable =3D 0;
> > +     int i, ret;
> > +
> > +     mutex_lock(&priv->lock);
> > +
> > +     led_mc_calc_color_components(mccdev, level);
> > +
> > +     for (i =3D 0; i < mccdev->num_colors; i++) {
> > +             struct mc_subled *subled =3D mccdev->subled_info + i;
> > +
> > +             real_bright =3D min(lcdev->max_brightness, subled->bright=
ness);
> > +             ret =3D regmap_update_bits(priv->regmap, MT6360_REG_ISNK(=
i), MT6360_ISNK_MASK,
> > +                                      real_bright);
> > +             if (ret)
> > +                     goto out;
> > +
> > +             enable_mask |=3D MT6360_ISNK_ENMASK(subled->channel);
> > +             if (real_bright)
> > +                     enable |=3D MT6360_ISNK_ENMASK(subled->channel);
> > +     }
> > +
> > +     ret =3D regmap_update_bits(priv->regmap, MT6360_REG_RGBEN, enable=
_mask, enable);
> > +
> > +out:
> > +     mutex_unlock(&priv->lock);
> > +     return ret;
> > +}
> > +
> > +static int mt6360_isnk_brightness_set(struct led_classdev *lcdev, enum=
 led_brightness level)
> > +{
> > +     struct mt6360_led *led =3D container_of(lcdev, struct mt6360_led,=
 isnk);
> > +     struct mt6360_priv *priv =3D led->priv;
> > +     u32 enable_mask =3D MT6360_ISNK_ENMASK(led->led_no);
> > +     u32 val =3D level ? MT6360_ISNK_ENMASK(led->led_no) : 0;
> > +     int ret;
> > +
> > +     mutex_lock(&priv->lock);
> > +
> > +     ret =3D regmap_update_bits(priv->regmap, MT6360_REG_ISNK(led->led=
_no), MT6360_ISNK_MASK,
> > +                              level);
> > +     if (ret)
> > +             goto out;
> > +
> > +     ret =3D regmap_update_bits(priv->regmap, MT6360_REG_RGBEN, enable=
_mask, val);
> > +
> > +out:
> > +     mutex_unlock(&priv->lock);
> > +     return ret;
> > +}
> > +
> > +static int mt6360_torch_brightness_set(struct led_classdev *lcdev, enu=
m led_brightness level)
> > +{
> > +     struct mt6360_led *led =3D container_of(lcdev, struct mt6360_led,=
 flash.led_cdev);
> > +     struct mt6360_priv *priv =3D led->priv;
> > +     u32 enable_mask =3D MT6360_TORCHEN_MASK | MT6360_FLCSEN_MASK(led-=
>led_no);
> > +     u32 val =3D level ? MT6360_FLCSEN_MASK(led->led_no) : 0;
> > +     u32 prev =3D priv->fled_torch_used, curr;
> > +     int ret;
> > +
> > +     mutex_lock(&priv->lock);
> > +
> > +     /* Only one set of flash control logic, use the flag to avoid str=
obe is currently used */
> > +     if (priv->fled_strobe_used) {
> > +             dev_warn(lcdev->dev, "Please disable strobe first [%d]\n"=
, priv->fled_strobe_used);
> > +             ret =3D -EBUSY;
> > +             goto out;
> > +     }
> > +
> > +     if (level)
> > +             curr =3D prev | BIT(led->led_no);
> > +     else
> > +             curr =3D prev & ~BIT(led->led_no);
> > +
> > +     if (curr)
> > +             val |=3D MT6360_TORCHEN_MASK;
> > +
> > +     if (level) {
> > +             ret =3D regmap_update_bits(priv->regmap, MT6360_REG_FLEDI=
TOR(led->led_no),
> > +                                      MT6360_ITORCH_MASK, level - 1);
> > +             if (ret)
> > +                     goto out;
> > +     }
> > +
> > +     ret =3D regmap_update_bits(priv->regmap, MT6360_REG_FLEDEN, enabl=
e_mask, val);
> > +     if (ret)
> > +             goto out;
> > +
> > +     priv->fled_torch_used =3D curr;
> > +
> > +out:
> > +     mutex_unlock(&priv->lock);
> > +     return ret;
> > +}
> > +
> > +static int mt6360_flash_brightness_set(struct led_classdev_flash *fl_c=
dev, u32 brightness)
> > +{
> > +     /*
> > +      * Due to the current spike when turning on flash, let brightness=
 to be kept by framework.
> > +      * This empty function is used to prevent led_classdev_flash regi=
ster ops check failure.
> > +      */
> > +     return 0;
> > +}
> > +
> > +static int _mt6360_flash_brightness_set(struct led_classdev_flash *fl_=
cdev, u32 brightness)
> > +{
> > +     struct mt6360_led *led =3D container_of(fl_cdev, struct mt6360_le=
d, flash);
> > +     struct mt6360_priv *priv =3D led->priv;
> > +     struct led_flash_setting *s =3D &fl_cdev->brightness;
> > +     u32 val =3D (brightness - s->min) / s->step;
> > +
> > +     return regmap_update_bits(priv->regmap, MT6360_REG_FLEDISTRB(led-=
>led_no),
> > +                              MT6360_ISTROBE_MASK, val);
> > +}
> > +
> > +static int mt6360_strobe_set(struct led_classdev_flash *fl_cdev, bool =
state)
> > +{
> > +     struct mt6360_led *led =3D container_of(fl_cdev, struct mt6360_le=
d, flash);
> > +     struct mt6360_priv *priv =3D led->priv;
> > +     struct led_classdev *lcdev =3D &fl_cdev->led_cdev;
> > +     struct led_flash_setting *s =3D &fl_cdev->brightness;
> > +     u32 enable_mask =3D MT6360_STROBEN_MASK | MT6360_FLCSEN_MASK(led-=
>led_no);
> > +     u32 val =3D state ? MT6360_FLCSEN_MASK(led->led_no) : 0;
> > +     u32 prev =3D priv->fled_strobe_used, curr;
> > +     int ret;
> > +
> > +     /* Only one set of flash control logic, use the flag to avoid tor=
ch is currently used */
> > +     if (priv->fled_torch_used) {
> > +             dev_warn(lcdev->dev, "Please disable torch first [0x%x]\n=
", priv->fled_torch_used);
> > +             return -EBUSY;
> > +     }
> > +
> > +     if (state)
> > +             curr =3D prev | BIT(led->led_no);
> > +     else
> > +             curr =3D prev & ~BIT(led->led_no);
> > +
> > +     if (curr)
> > +             val |=3D MT6360_STROBEN_MASK;
>
> You need to use mutex protection consequently in all ops
> accessing device registers.
>

ACK

> > +     ret =3D regmap_update_bits(priv->regmap, MT6360_REG_FLEDEN, enabl=
e_mask, val);
> > +     if (ret) {
> > +             dev_err(lcdev->dev, "[%d] control current source %d fail\=
n", led->led_no, state);
> > +             return ret;
> > +     }
> > +
> > +     /*
> > +      * If the flash need to be on, config the flash current ramping u=
p to the setting value
> > +      * Else, always recover back to the minimum one
> > +      */
> > +     ret =3D _mt6360_flash_brightness_set(fl_cdev, state ? s->val : s-=
>min);
> > +     if (ret)
> > +             return ret;
> > +
> > +     /* For the flash turn on/off, HW rampping up/down time is 5ms/500=
us, respectively */
> > +     if (!prev && curr)
> > +             usleep_range(5000, 6000);
> > +     else if (prev && !curr)
> > +             udelay(500);
> > +
> > +     priv->fled_strobe_used =3D curr;
> > +     return 0;
> > +}
> > +
> > +static int mt6360_strobe_get(struct led_classdev_flash *fl_cdev, bool =
*state)
> > +{
> > +     struct mt6360_led *led =3D container_of(fl_cdev, struct mt6360_le=
d, flash);
> > +     struct mt6360_priv *priv =3D led->priv;
>
> Ditto.
>

ACK

> > +     *state =3D !!(priv->fled_strobe_used & BIT(led->led_no));
> > +     return 0;
> > +}
> > +
> > +static int mt6360_timeout_set(struct led_classdev_flash *fl_cdev, u32 =
timeout)
> > +{
> > +     struct mt6360_led *led =3D container_of(fl_cdev, struct mt6360_le=
d, flash);
> > +     struct mt6360_priv *priv =3D led->priv;
> > +     struct led_flash_setting *s =3D &fl_cdev->timeout;
> > +     u32 val =3D (timeout - s->min) / s->step;
>
> Ditto.
>

ACK

> > +     return regmap_update_bits(priv->regmap, MT6360_REG_STRBTO, MT6360=
_STRBTO_MASK, val);
> > +
> > +}
> > +
> > +static int mt6360_fault_get(struct led_classdev_flash *fl_cdev, u32 *f=
ault)
> > +{
> > +     struct mt6360_led *led =3D container_of(fl_cdev, struct mt6360_le=
d, flash);
> > +     struct mt6360_priv *priv =3D led->priv;
> > +     u16 fled_stat;
> > +     unsigned int chg_stat, strobe_timeout_mask, fled_short_mask;
> > +     u32 rfault =3D 0;
> > +     int ret;
>
> Ditto.

Fault status is read only register, should I also use mutex to protect it?

>
> > +     ret =3D regmap_read(priv->regmap, MT6360_REG_CHGSTAT2, &chg_stat)=
;
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D regmap_raw_read(priv->regmap, MT6360_REG_FLEDSTAT1, &fled=
_stat, sizeof(fled_stat));
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (led->led_no =3D=3D MT6360_LED_FLASH1) {
> > +             strobe_timeout_mask =3D MT6360_FLED1STRBTO_MASK;
> > +             fled_short_mask =3D MT6360_FLED1SHORT_MASK;
> > +     } else {
> > +             strobe_timeout_mask =3D MT6360_FLED2STRBTO_MASK;
> > +             fled_short_mask =3D MT6360_FLED2SHORT_MASK;
> > +     }
> > +
> > +     if (chg_stat & MT6360_FLEDCHGVINOVP_MASK)
> > +             rfault |=3D LED_FAULT_INPUT_VOLTAGE;
> > +
> > +     if (fled_stat & strobe_timeout_mask)
> > +             rfault |=3D LED_FAULT_TIMEOUT;
> > +
> > +     if (fled_stat & fled_short_mask)
> > +             rfault |=3D LED_FAULT_SHORT_CIRCUIT;
> > +
> > +     if (fled_stat & MT6360_FLEDLVF_MASK)
> > +             rfault |=3D LED_FAULT_UNDER_VOLTAGE;
> > +
> > +     *fault =3D rfault;
> > +     return 0;
> > +}
> > +
> > +static const struct led_flash_ops mt6360_flash_ops =3D {
> > +     .flash_brightness_set =3D mt6360_flash_brightness_set,
> > +     .strobe_set =3D mt6360_strobe_set,
> > +     .strobe_get =3D mt6360_strobe_get,
> > +     .timeout_set =3D mt6360_timeout_set,
> > +     .fault_get =3D mt6360_fault_get,
> > +};
> > +
> > +static int mt6360_isnk_init_default_state(struct mt6360_led *led)
> > +{
> > +     struct mt6360_priv *priv =3D led->priv;
> > +     unsigned int regval;
> > +     u32 level;
> > +     int ret;
> > +
> > +     ret =3D regmap_read(priv->regmap, MT6360_REG_ISNK(led->led_no), &=
regval);
> > +     if (ret)
> > +             return ret;
> > +     level =3D regval & MT6360_ISNK_MASK;
> > +
> > +     ret =3D regmap_read(priv->regmap, MT6360_REG_RGBEN, &regval);
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (!(regval & MT6360_ISNK_ENMASK(led->led_no)))
> > +             level =3D LED_OFF;
> > +
> > +     switch (led->default_state) {
> > +     case STATE_ON:
> > +             led->isnk.brightness =3D led->isnk.max_brightness;
> > +             break;
> > +     case STATE_KEEP:
> > +             led->isnk.brightness =3D min(level, led->isnk.max_brightn=
ess);
> > +             break;
> > +     default:
> > +             led->isnk.brightness =3D LED_OFF;
> > +     }
> > +
> > +     return mt6360_isnk_brightness_set(&led->isnk, led->isnk.brightnes=
s);
> > +}
> > +
> > +static int mt6360_flash_init_default_state(struct mt6360_led *led)
> > +{
> > +     struct led_classdev_flash *flash =3D &led->flash;
> > +     struct mt6360_priv *priv =3D led->priv;
> > +     u32 enable_mask =3D MT6360_TORCHEN_MASK | MT6360_FLCSEN_MASK(led-=
>led_no);
> > +     u32 level;
> > +     unsigned int regval;
> > +     int ret;
> > +
> > +     ret =3D regmap_read(priv->regmap, MT6360_REG_FLEDITOR(led->led_no=
), &regval);
> > +     if (ret)
> > +             return ret;
> > +     level =3D regval & MT6360_ITORCH_MASK;
> > +
> > +     ret =3D regmap_read(priv->regmap, MT6360_REG_FLEDEN, &regval);
> > +     if (ret)
> > +             return ret;
> > +
> > +     if ((regval & enable_mask) =3D=3D enable_mask)
> > +             level +=3D 1;
> > +     else
> > +             level =3D LED_OFF;
> > +
> > +     switch (led->default_state) {
> > +     case STATE_ON:
> > +             flash->led_cdev.brightness =3D flash->led_cdev.max_bright=
ness;
> > +             break;
> > +     case STATE_KEEP:
> > +             flash->led_cdev.brightness =3D min(level, flash->led_cdev=
.max_brightness);
> > +             break;
> > +     default:
> > +             flash->led_cdev.brightness =3D LED_OFF;
> > +     }
> > +
> > +     return mt6360_torch_brightness_set(&flash->led_cdev, flash->led_c=
dev.brightness);
> > +}
> > +
> > +#if IS_ENABLED(CONFIG_V4L2_FLASH_LED_CLASS)
> > +static int mt6360_flash_external_strobe_set(struct v4l2_flash *v4l2_fl=
ash, bool enable)
> > +{
> > +     struct led_classdev_flash *flash =3D v4l2_flash->fled_cdev;
> > +     struct mt6360_led *led =3D container_of(flash, struct mt6360_led,=
 flash);
> > +     struct mt6360_priv *priv =3D led->priv;
> > +     u32 mask =3D MT6360_FLCSEN_MASK(led->led_no);
> > +     u32 val =3D enable ? mask : 0;
> > +     int ret;
>
> Mutex is needed here as well.
>

ACK

> > +     ret =3D regmap_update_bits(priv->regmap, MT6360_REG_FLEDEN, mask,=
 val);
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (enable)
> > +             priv->fled_strobe_used |=3D BIT(led->led_no);
> > +     else
> > +             priv->fled_strobe_used &=3D ~BIT(led->led_no);
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct v4l2_flash_ops v4l2_flash_ops =3D {
> > +     .external_strobe_set =3D mt6360_flash_external_strobe_set,
> > +};
> > +
> > +static void mt6360_init_v4l2_config(struct mt6360_led *led, struct v4l=
2_flash_config *config)
>
> s/mt6360_init_v4l2_config/mt6360_init_v4l2_flash_config/
>

ACK

> > +{
> > +     struct led_classdev *lcdev;
> > +     struct led_flash_setting *s =3D &config->intensity;
> > +
>
> Multicolor LEDs don't need to be registered with V4L2.
> I've explained before that I had been misled by the fact that you name
> these LEDs as "indicators", which for flash LED controllers usually
> means something different.
>
> Please drop the code under "if" branch.
>

ACK

> > +     if (led->led_no =3D=3D MT6360_LED_MULTICOLOR ||
> > +             (led->led_no >=3D MT6360_LED_ISNK1 && led->led_no <=3D MT=
6360_LED_ISNKML)) {
> > +             if (led->led_no !=3D MT6360_LED_MULTICOLOR)
> > +                     lcdev =3D &led->isnk;
> > +             else
> > +                     lcdev =3D &led->mc.led_cdev;
> > +
> > +             s->step =3D MT6360_ISNKRGB_STEPUA;
> > +
> > +             if (led->led_no =3D=3D MT6360_LED_ISNKML)
> > +                     s->step =3D MT6360_ISNKML_STEPUA;
> > +
> > +             s->min =3D 0;
> > +             s->val =3D lcdev->brightness * s->step;
> > +             s->max =3D lcdev->max_brightness * s->step;
> > +     } else {
> > +             lcdev =3D &led->flash.led_cdev;
> > +
> > +             s->min =3D MT6360_ITORCH_MINUA;
> > +             s->step =3D MT6360_ITORCH_STEPUA;
> > +             s->val =3D s->max =3D s->min + (lcdev->max_brightness - 1=
) * s->step;
> > +
> > +             config->has_external_strobe =3D 1;
>
> You also need to initialize flash faults config:
>
> config>flash_faults =3D ....
>
> > +     }
> > +
> > +     strscpy(config->dev_name, lcdev->dev->kobj.name, sizeof(config->d=
ev_name));
> > +}
> > +#else
> > +static const struct v4l2_flash_ops v4l2_flash_ops;
> > +
> > +static void mt6360_init_v4l2_config(struct mt6360_led *led, struct v4l=
2_flash_config *config)
> > +{
> > +}
> > +#endif
> > +
> > +static int mt6360_led_register(struct device *parent, struct mt6360_le=
d *led,
> > +                             struct led_init_data *init_data)
> > +{
> > +     struct mt6360_priv *priv =3D led->priv;
> > +     struct v4l2_flash_config v4l2_config =3D {0};
> > +     int ret;
> > +
> > +     if ((led->led_no =3D=3D MT6360_LED_ISNK1 || led->led_no =3D=3D MT=
6360_LED_MULTICOLOR) &&
> > +             (priv->leds_active & BIT(MT6360_LED_ISNK1))) {
> > +             /* Change isink1 to SW control mode, disconnect it with c=
harger state */
> > +             ret =3D regmap_update_bits(priv->regmap, MT6360_REG_RGBEN=
, MT6360_CHRINDSEL_MASK,
> > +                                      MT6360_CHRINDSEL_MASK);
> > +             if (ret) {
> > +                     dev_err(parent, "Failed to config ISNK1 to SW mod=
e\n");
> > +                     return ret;
> > +             }
> > +     }
> > +
> > +     switch (led->led_no) {
> > +     case MT6360_LED_MULTICOLOR:
> > +             ret =3D mt6360_mc_brightness_set(&led->mc.led_cdev, LED_O=
FF);
> > +             if (ret) {
> > +                     dev_err(parent, "Failed to init multicolor bright=
ness\n");
> > +                     return ret;
> > +             }
> > +
> > +             ret =3D devm_led_classdev_multicolor_register_ext(parent,=
 &led->mc, init_data);
> > +             if (ret) {
> > +                     dev_err(parent, "Couldn't register multicolor\n")=
;
> > +                     return ret;
> > +             }
>
> Don't register this LED with V4L2.
>

ACK

> > +             mt6360_init_v4l2_config(led, &v4l2_config);
> > +             led->v4l2_flash =3D v4l2_flash_indicator_init(parent, ini=
t_data->fwnode,
> > +                                                         &led->mc.led_=
cdev, &v4l2_config);
> > +             break;
> > +     case MT6360_LED_ISNK1 ... MT6360_LED_ISNKML:
> > +             ret =3D mt6360_isnk_init_default_state(led);
> > +             if (ret) {
> > +                     dev_err(parent, "Failed to init %d isnk state\n",=
 led->led_no);
> > +                     return ret;
> > +             }
> > +
> > +             ret =3D devm_led_classdev_register_ext(parent, &led->isnk=
, init_data);
> > +             if (ret) {
> > +                     dev_err(parent, "Couldn't register isink %d\n", l=
ed->led_no);
> > +                     return ret;
> > +             }
>
> As you've previously clarified these are not flash indicators, so no
> need to register them with V4L2.
>

ACK

> > +             mt6360_init_v4l2_config(led, &v4l2_config);
> > +             led->v4l2_flash =3D v4l2_flash_indicator_init(parent, ini=
t_data->fwnode, &led->isnk,
> > +                                                         &v4l2_config)=
;
> > +             break;
> > +     default:
> > +             ret =3D mt6360_flash_init_default_state(led);
> > +             if (ret) {
> > +                     dev_err(parent, "Failed to init %d flash state\n"=
, led->led_no);
> > +                     return ret;
> > +             }
> > +
> > +             ret =3D devm_led_classdev_flash_register_ext(parent, &led=
->flash, init_data);
>
> You need to add discussed no-ops for this function, or otherwise the
> compilation will break when CONFIG_LEDS_CLASS_FLASH will not be set, for
> which you now allow in your Kconfig entry.
>

ACK

> Discussed fixes for multicolor registration functions are needed as
> well. Please add the required patches at the beginning of this patch
> set.
>

Multicolor registration no-ops funciton return -EINVAL is available,
should I just fix flash device registration?

> > +             if (ret) {
> > +                     dev_err(parent, "Couldn't register flash %d\n", l=
ed->led_no);
> > +                     return ret;
> > +             }
> > +
> > +             mt6360_init_v4l2_config(led, &v4l2_config);
> > +             led->v4l2_flash =3D v4l2_flash_init(parent, init_data->fw=
node, &led->flash,
> > +                                               &v4l2_flash_ops, &v4l2_=
config);
> > +     }
> > +
> > +     if (IS_ERR(led->v4l2_flash)) {
> > +             dev_err(parent, "Failed to register %d v4l2 sd\n", led->l=
ed_no);
> > +             return PTR_ERR(led->v4l2_flash);
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static u32 clamp_align(u32 val, u32 min, u32 max, u32 step)
> > +{
> > +     u32 retval;
> > +
> > +     retval =3D clamp_val(val, min, max);
> > +     if (step > 1)
> > +             retval =3D rounddown(retval - min, step) + min;
> > +
> > +     return retval;
> > +}
> > +
> > +static int mt6360_init_isnk_properties(struct mt6360_led *led, struct =
led_init_data *init_data)
> > +{
> > +     struct led_classdev *lcdev;
> > +     struct mt6360_priv *priv =3D led->priv;
> > +     struct fwnode_handle *child;
> > +     u32 step_uA =3D MT6360_ISNKRGB_STEPUA, max_uA =3D MT6360_ISNKRGB_=
MAXUA;
> > +     u32 val;
> > +     int num_color =3D 0, ret;
> > +
> > +     if (led->led_no =3D=3D MT6360_LED_MULTICOLOR) {
> > +             struct mc_subled *sub_led;
> > +
> > +             sub_led =3D devm_kzalloc(priv->dev, sizeof(*sub_led) * MU=
LTICOLOR_NUM_CHANNELS,
> > +                                    GFP_KERNEL);
> > +             if (!sub_led)
> > +                     return -ENOMEM;
> > +
> > +             fwnode_for_each_child_node(init_data->fwnode, child) {
> > +                     u32 reg, color;
> > +
> > +                     ret =3D fwnode_property_read_u32(child, "reg", &r=
eg);
> > +                     if (ret || reg > MT6360_LED_ISNK3 || priv->leds_a=
ctive & BIT(reg))
> > +                             return -EINVAL;
> > +
> > +                     ret =3D fwnode_property_read_u32(child, "color", =
&color);
> > +                     if (ret) {
> > +                             dev_err(priv->dev, "led %d, no color spec=
ified\n", led->led_no);
> > +                             return ret;
> > +                     }
> > +
> > +                     priv->leds_active |=3D BIT(reg);
> > +                     sub_led[num_color].color_index =3D color;
> > +                     sub_led[num_color].channel =3D reg;
> > +                     num_color++;
> > +             }
> > +
> > +             if (num_color < 2) {
> > +                     dev_err(priv->dev, "Multicolor must include 2 or =
more led channel\n");
> > +                     return -EINVAL;
> > +             }
> > +
> > +             led->mc.num_colors =3D num_color;
> > +             led->mc.subled_info =3D sub_led;
> > +
> > +             lcdev =3D &led->mc.led_cdev;
> > +             lcdev->brightness_set_blocking =3D mt6360_mc_brightness_s=
et;
> > +     } else {
> > +             if (led->led_no =3D=3D MT6360_LED_ISNKML) {
> > +                     step_uA =3D MT6360_ISNKML_STEPUA;
> > +                     max_uA =3D MT6360_ISNKML_MAXUA;
> > +             }
> > +
> > +             lcdev =3D &led->isnk;
> > +             lcdev->brightness_set_blocking =3D mt6360_isnk_brightness=
_set;
> > +     }
> > +
> > +     ret =3D fwnode_property_read_u32(init_data->fwnode, "led-max-micr=
oamp", &val);
> > +     if (ret) {
> > +             dev_warn(priv->dev, "Not specified led-max-microamp, conf=
ig to the minimum\n");
> > +             val =3D step_uA;
> > +     } else
> > +             val =3D clamp_align(val, 0, max_uA, step_uA);
> > +
> > +     lcdev->max_brightness =3D val / step_uA;
> > +
> > +     fwnode_property_read_string(init_data->fwnode, "linux,default-tri=
gger",
> > +                                 &lcdev->default_trigger);
> > +
> > +     return 0;
> > +}
> > +
> > +static int mt6360_init_flash_properties(struct mt6360_led *led, struct=
 led_init_data *init_data)
> > +{
> > +     struct led_classdev_flash *flash =3D &led->flash;
> > +     struct led_classdev *lcdev =3D &flash->led_cdev;
> > +     struct mt6360_priv *priv =3D led->priv;
> > +     struct led_flash_setting *s;
> > +     u32 val;
> > +     int ret;
> > +
> > +     ret =3D fwnode_property_read_u32(init_data->fwnode, "led-max-micr=
oamp", &val);
> > +     if (ret) {
> > +             dev_warn(priv->dev, "Not specified led-max-microamp, conf=
ig to the minimum\n");
> > +             val =3D MT6360_ITORCH_MINUA;
> > +     } else
> > +             val =3D clamp_align(val, MT6360_ITORCH_MINUA, MT6360_ITOR=
CH_MAXUA,
> > +                               MT6360_ITORCH_STEPUA);
> > +
> > +     lcdev->max_brightness =3D (val - MT6360_ITORCH_MINUA) / MT6360_IT=
ORCH_STEPUA + 1;
> > +     lcdev->brightness_set_blocking =3D mt6360_torch_brightness_set;
> > +     lcdev->flags |=3D LED_DEV_CAP_FLASH;
> > +
> > +     ret =3D fwnode_property_read_u32(init_data->fwnode, "flash-max-mi=
croamp", &val);
> > +     if (ret) {
> > +             dev_warn(priv->dev, "Not specified flash-max-microamp, co=
nfig to the minimum\n");
> > +             val =3D MT6360_ISTRB_MINUA;
> > +     } else
> > +             val =3D clamp_align(val, MT6360_ISTRB_MINUA, MT6360_ISTRB=
_MAXUA, MT6360_ISTRB_STEPUA);
> > +
> > +     s =3D &flash->brightness;
> > +     s->min =3D MT6360_ISTRB_MINUA;
> > +     s->step =3D MT6360_ISTRB_STEPUA;
> > +     s->val =3D s->max =3D val;
> > +
> > +     /* Always configure as min level when off to prevent flash curren=
t spike */
> > +     ret =3D _mt6360_flash_brightness_set(flash, s->min);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D fwnode_property_read_u32(init_data->fwnode, "flash-max-ti=
meout-us", &val);
> > +     if (ret) {
> > +             dev_warn(priv->dev, "Not specified flash-max-timeout-us, =
config to the minimum\n");
> > +             val =3D MT6360_STRBTO_MINUS;
> > +     } else
> > +             val =3D clamp_align(val, MT6360_STRBTO_MINUS, MT6360_STRB=
TO_MAXUS,
> > +                               MT6360_STRBTO_STEPUS);
> > +
> > +     s =3D &flash->timeout;
> > +     s->min =3D MT6360_STRBTO_MINUS;
> > +     s->step =3D MT6360_STRBTO_STEPUS;
> > +     s->val =3D s->max =3D val;
> > +
> > +     flash->ops =3D &mt6360_flash_ops;
> > +
> > +     return 0;
> > +}
> > +
> > +static int mt6360_init_common_properties(struct mt6360_led *led, struc=
t led_init_data *init_data)
> > +{
> > +     const char * const states[] =3D { "off", "keep", "on" };
> > +     const char *str;
> > +     int ret;
> > +
> > +     if (!fwnode_property_read_string(init_data->fwnode, "default-stat=
e", &str)) {
> > +             ret =3D match_string(states, ARRAY_SIZE(states), str);
> > +             if (ret < 0)
> > +                     ret =3D STATE_OFF;
> > +
> > +             led->default_state =3D ret;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static void mt6360_v4l2_flash_release(struct mt6360_priv *priv)
> > +{
> > +     int i;
> > +
> > +     for (i =3D 0; i < priv->leds_count; i++) {
> > +             struct mt6360_led *led =3D priv->leds + i;
> > +
> > +             if (led->v4l2_flash)
> > +                     v4l2_flash_release(led->v4l2_flash);
> > +
> > +     }
> > +}
> > +
> > +static int mt6360_led_probe(struct platform_device *pdev)
> > +{
> > +     struct mt6360_priv *priv;
> > +     struct fwnode_handle *child;
> > +     size_t count;
> > +     int i =3D 0, ret;
> > +
> > +     count =3D device_get_child_node_count(&pdev->dev);
> > +     if (!count || count > MT6360_MAX_LEDS) {
> > +             dev_err(&pdev->dev, "No child node or node count over max=
 led number %lu\n", count);
> > +             return -EINVAL;
> > +     }
> > +
> > +     priv =3D devm_kzalloc(&pdev->dev, struct_size(priv, leds, count),=
 GFP_KERNEL);
> > +     if (!priv)
> > +             return -ENOMEM;
> > +
> > +     priv->leds_count =3D count;
> > +     priv->dev =3D &pdev->dev;
> > +     mutex_init(&priv->lock);
> > +
> > +     priv->regmap =3D dev_get_regmap(pdev->dev.parent, NULL);
> > +     if (!priv->regmap) {
> > +             dev_err(&pdev->dev, "Failed to get parent regmap\n");
> > +             return -ENODEV;
> > +     }
> > +
> > +     device_for_each_child_node(&pdev->dev, child) {
> > +             struct mt6360_led *led =3D priv->leds + i;
> > +             struct led_init_data init_data =3D { .fwnode =3D child, }=
;
> > +             u32 reg;
> > +
> > +             ret =3D fwnode_property_read_u32(child, "reg", &reg);
> > +             if (ret)
> > +                     goto out_flash_release;
> > +
> > +             if (reg > MT6360_MAX_LEDS || priv->leds_active & BIT(reg)=
)
> > +                     return -EINVAL;
> > +             priv->leds_active |=3D BIT(reg);
> > +
> > +             led->led_no =3D reg;
> > +             led->priv =3D priv;
> > +
> > +             ret =3D mt6360_init_common_properties(led, &init_data);
> > +             if (ret)
> > +                     goto out_flash_release;
> > +
> > +             if (reg =3D=3D MT6360_LED_MULTICOLOR ||
> > +                     (reg >=3D MT6360_LED_ISNK1 && reg <=3D MT6360_LED=
_ISNKML))
> > +                     ret =3D mt6360_init_isnk_properties(led, &init_da=
ta);
> > +             else
> > +                     ret =3D mt6360_init_flash_properties(led, &init_d=
ata);
> > +
> > +             if (ret)
> > +                     goto out_flash_release;
> > +
> > +             ret =3D mt6360_led_register(&pdev->dev, led, &init_data);
> > +             if (ret)
> > +                     goto out_flash_release;
> > +
> > +             i++;
> > +     }
> > +
> > +     platform_set_drvdata(pdev, priv);
> > +     return 0;
> > +
> > +out_flash_release:
> > +     mt6360_v4l2_flash_release(priv);
> > +     return ret;
> > +}
> > +
> > +static int mt6360_led_remove(struct platform_device *pdev)
> > +{
> > +     struct mt6360_priv *priv =3D platform_get_drvdata(pdev);
> > +
> > +     mt6360_v4l2_flash_release(priv);
> > +     return 0;
> > +}
> > +
> > +static const struct of_device_id __maybe_unused mt6360_led_of_id[] =3D=
 {
> > +     { .compatible =3D "mediatek,mt6360-led", },
> > +     {}
> > +};
> > +MODULE_DEVICE_TABLE(of, mt6360_led_of_id);
> > +
> > +static struct platform_driver mt6360_led_driver =3D {
> > +     .driver =3D {
> > +             .name =3D "mt6360-led",
> > +             .of_match_table =3D mt6360_led_of_id,
> > +     },
> > +     .probe =3D mt6360_led_probe,
> > +     .remove =3D mt6360_led_remove,
> > +};
> > +module_platform_driver(mt6360_led_driver);
> > +
> > +MODULE_AUTHOR("Gene Chen <gene_chen@richtek.com>");
> > +MODULE_DESCRIPTION("MT6360 LED Driver");
> > +MODULE_LICENSE("GPL v2");
> >
>
> --
> Best regards,
> Jacek Anaszewski
