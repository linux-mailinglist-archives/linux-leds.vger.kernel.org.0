Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE2842768D0
	for <lists+linux-leds@lfdr.de>; Thu, 24 Sep 2020 08:21:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726859AbgIXGVX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 24 Sep 2020 02:21:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726852AbgIXGVX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 24 Sep 2020 02:21:23 -0400
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com [IPv6:2607:f8b0:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF04CC0613CE;
        Wed, 23 Sep 2020 23:21:22 -0700 (PDT)
Received: by mail-il1-x142.google.com with SMTP id y2so2073634ila.0;
        Wed, 23 Sep 2020 23:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2QCuAsAnPZ84dWE2f3z8HYI+deWW3HrO+4EJeaF6gpY=;
        b=FgU40QuXZXwjqIBe3WzexGwce2Aot5+ChvB0BMApSXLSWE3zK3SquoVtzA+rib1Di5
         bwsjMiShAyRAL4K3UzUx+xOyJDA18xJHEldqVk4YlA2y8yRiq6YQySCIe1tL/LZLt0qd
         qzgleBS97I9zp6fyUIge+CnIUBQsY93Z0hvNC+q9zmbUKWTfeXVzKv32txSb5XyumXn0
         Vf3cVmGkz+zZWtLbjEQFbzirTkKqhh8JNOz04xDANOQpvDqNETXxDGMHLRc7UOeQoDbh
         5j4cADS6IKrnw/p8zFHnmiUxNDO2JNaBXdH/u0e/gHdGLJlOLHs0FtSVChbu2s5u5JOV
         cj8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2QCuAsAnPZ84dWE2f3z8HYI+deWW3HrO+4EJeaF6gpY=;
        b=MSExQ+gjiVWVY9N2IRbaH5ux9VSuu6p53OPF0wnf6JzZEqIHWAbhTa9/5ZQW2niViH
         1BKQIJyQep7GoBT3RBARJ4bpOAxr1vXgGrUuyD/xrEjmD8kMi4mK0NUyLg1UFOXL71dg
         ClYLHxaggpcXEOdhhpr0ooeXrlTnROrkeFyQP8vC8KmKzij8ikEzrm51AVAyh2YL1ccZ
         y5aAKJxL7kLK+pXBibM9/u1gGKUD86f1xshuR3S75afFm+ZkEuZ3Q961Q6AzqBTBj2AL
         xwP9TtGyzydnbTs+jnXR99CZYzzaxN8zBjvqRj2QbvmYCGqOcgygMuzMDbDiw96E0Xcg
         tSDg==
X-Gm-Message-State: AOAM531LJEEWBoWv3xtYoxVi0VzPP+0PnrKt8y0nyJSChvxciTJSl127
        oW+TMNlquDwRb3YM+18X1ZKlgW2GusNqvymD0I4=
X-Google-Smtp-Source: ABdhPJwQzZ3vzTT4R3CTI14Of/NB/rBSlUaYsBSkzUR3fqMfM7kxIqUkW50W2d9gPsRF586SKwCGbXiCV8xhZM8lfNA=
X-Received: by 2002:a92:1589:: with SMTP id 9mr2791271ilv.292.1600928481841;
 Wed, 23 Sep 2020 23:21:21 -0700 (PDT)
MIME-Version: 1.0
References: <1600865452-19649-1-git-send-email-gene.chen.richtek@gmail.com>
 <1600865452-19649-3-git-send-email-gene.chen.richtek@gmail.com> <e82fd413-8343-5115-150e-02d96eecf6e8@gmail.com>
In-Reply-To: <e82fd413-8343-5115-150e-02d96eecf6e8@gmail.com>
From:   Gene Chen <gene.chen.richtek@gmail.com>
Date:   Thu, 24 Sep 2020 14:21:10 +0800
Message-ID: <CAE+NS35BwgGD3GjKv5E08ECqKCortJxB-yHP9-kteqPiKm9edQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] leds: mt6360: Add LED driver for MT6360
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

Jacek Anaszewski <jacek.anaszewski@gmail.com> =E6=96=BC 2020=E5=B9=B49=E6=
=9C=8824=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=885:49=E5=AF=AB=E9=81=
=93=EF=BC=9A

>
> Hi Gene,
>
> Thank you for the update. I have some more comments below.
>
> On 9/23/20 2:50 PM, Gene Chen wrote:
> > From: Gene Chen <gene_chen@richtek.com>
> >
> > Add MT6360 LED driver include 2-channel Flash LED with torch/strobe mod=
e,
> > and 4-channel RGB LED support Register/Flash/Breath Mode
> >
> > Signed-off-by: Gene Chen <gene_chen@richtek.com>
> > ---
> >   drivers/leds/Kconfig       |  11 +
> >   drivers/leds/Makefile      |   1 +
> >   drivers/leds/leds-mt6360.c | 705 ++++++++++++++++++++++++++++++++++++=
+++++++++
> >   3 files changed, 717 insertions(+)
> >   create mode 100644 drivers/leds/leds-mt6360.c
> >
> > diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> > index 1c181df..5561b08 100644
> > --- a/drivers/leds/Kconfig
> > +++ b/drivers/leds/Kconfig
> > @@ -271,6 +271,17 @@ config LEDS_MT6323
> >         This option enables support for on-chip LED drivers found on
> >         Mediatek MT6323 PMIC.
> >
> > +config LEDS_MT6360
> > +     tristate "LED Support for Mediatek MT6360 PMIC"
> > +     depends on LEDS_CLASS_FLASH && OF
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
> > index 0000000..1c3486e
> > --- /dev/null
> > +++ b/drivers/leds/leds-mt6360.c
> > @@ -0,0 +1,705 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +
> > +#include <linux/delay.h>
> > +#include <linux/init.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/kernel.h>
> > +#include <linux/led-class-flash.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/property.h>
> > +#include <linux/regmap.h>
> > +#include <media/v4l2-flash-led-class.h>
> > +
> > +enum {
> > +     MT6360_LED_ISNK1 =3D 0,
> > +     MT6360_LED_ISNK2,
> > +     MT6360_LED_ISNK3,
> > +     MT6360_LED_ISNK4,
>
> One question about these ISINKs - how are they exploited in your device?
> Are these LEDs used to indicate camera activity or it is one RGB LED
> for status? And what functionality has the remaining amber one (sticking
> to the naming from your DT bindings)?
>
> Can you share how the documenation for this device describes the purpose
> of these sinks, if it does it at all?
>
> I got probably mislead by your naming in the driver and got fixed on
> their function as camera activity indicators, for which V4L2 has
> support. If that is not the case, then you'd better switch to using
> multicolor framework for all four "indicator" LEDs.
>

It's one RGB LED for status, not for camera.

The MT6360 integrates a three-channel RGB LED driver, designed to
provide a variety of lighting effects for mobile device applications.
The RGB LED driver includes a smart LED string controller, and it can
drive 3 channels of LEDs with a sink current of up to 24mA. The
default setting of RGB_ISINK1 is auto mode for TA charging indicator,
and RGB_ISINK1 also supports software mode. It provides three
operation modes for the RGB LEDs: flash mode, breath mode, and
register mode. The device can increase or decrease the brightness of
the RGB LEDs upon command via the I2C interface. The RGB_ISINK4
provide more sink current up to 150mA, which we can moonlight mode.

Do you mean we should remove "isink register v4l2 device, only need
register ledclass device"?

> > +     MT6360_LED_FLASH1,
> > +     MT6360_LED_FLASH2,
> > +     MT6360_MAX_LEDS
> > +};
> > +
> > +#define MT6360_REG_RGBEN             0x380
> > +#define MT6360_REG_ISNK(_led_no)     (0x381 + (_led_no))
> > +#define MT6360_ISNK_ENMASK(_led_no)  BIT(7 - (_led_no))
> > +#define MT6360_ISNK_MASK             GENMASK(4, 0)
> > +#define MT6360_CHRINDSEL_MASK                BIT(3)
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
> > +#define MT6360_ISNK1_STEPUA          2000
> > +#define MT6360_ISNK1_MAXUA           24000
> > +#define MT6360_ISNK4_STEPUA          5000
> > +#define MT6360_ISNK4_MAXUA           150000
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
> > +     unsigned int fled_strobe_used;
> > +     unsigned int fled_torch_used;
> > +     unsigned int leds_active;
> > +     unsigned int leds_count;
> > +     struct mt6360_led leds[];
> > +};
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
>
> You meed mutex protection in all functions acessing device registers.
>

ACK

> > +     ret =3D regmap_update_bits(priv->regmap, MT6360_REG_ISNK(led->led=
_no),
> > +                              MT6360_ISNK_MASK, level);
> > +     if (ret)
> > +             return ret;
> > +
> > +     return regmap_update_bits(priv->regmap, MT6360_REG_RGBEN, enable_=
mask, val);
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
>
> Above assignment must be made under mutex.
>

ACK

> > +     int ret;
> > +
> > +     /* Only one set of flash control logic, use the flag to avoid str=
obe is currently used */
> > +     if (priv->fled_strobe_used) {
> > +             dev_warn(lcdev->dev, "Please disable strobe first [%d]\n"=
, priv->fled_strobe_used);
> > +             return -EBUSY;
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
> > +                     return ret;
> > +     }
> > +
> > +     ret =3D regmap_update_bits(priv->regmap, MT6360_REG_FLEDEN, enabl=
e_mask, val);
> > +     if (ret)
> > +             return ret;
> > +
> > +     priv->fled_torch_used =3D curr;
>
> Ditto. And everything between as well of course.
>

ACK

> > +
> > +     return 0;
> > +}
> > +
> > +static int mt6360_flash_brightness_set(struct led_classdev_flash *fl_c=
dev, u32 brightness)
> > +{
> > +     /*
> > +      * Due to the current spike when turning on flash, only let brigh=
tness keep by framework
>
> s/keep by/to be kept/
>
> > +      * This empty function is used to prevent led_classdev_flash regi=
ster ops check
>
> s/led_classdev_flash/led_classdev_flash()/
> s/check/check failure/
>
> And please put dots at the end of sentences.
>

ACK

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
> > +
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
> > +
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
> > +
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
> > +
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
>
> level++ fits better here.
>

ACK

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
> > +
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
> > +{
> > +     struct led_classdev *lcdev;
> > +     struct led_flash_setting *s =3D &config->intensity;
> > +
> > +     switch (led->led_no) {
> > +     case MT6360_LED_ISNK1 ... MT6360_LED_ISNK4:
> > +             lcdev =3D &led->isnk;
> > +
> > +             if (led->led_no =3D=3D MT6360_LED_ISNK4)
> > +                     s->step =3D MT6360_ISNK4_STEPUA;
> > +             else
> > +                     s->step =3D MT6360_ISNK1_STEPUA;
> > +
> > +             s->min =3D 0;
> > +             s->val =3D lcdev->brightness * s->step;
> > +             s->max =3D lcdev->max_brightness * s->step;
> > +             break;
> > +     default:
> > +             lcdev =3D &led->flash.led_cdev;
> > +
> > +             s->min =3D MT6360_ITORCH_MINUA;
> > +             s->step =3D MT6360_ITORCH_STEPUA;
> > +             s->val =3D s->max =3D s->min + (lcdev->max_brightness - 1=
) * s->step;
> > +
> > +             config->has_external_strobe =3D 1;
> > +     }
> > +
> > +     snprintf(config->dev_name, sizeof(config->dev_name), "%s", lcdev-=
>name);
>
> You're using devm_led_classdev_register_ext() so lcdev->name remains
> uninitialized, but even if you used non-ext API, it wouldn't necessary
> contain the final LED name, if renaming had occurred.
>
> Please use below instead:
>
> strscpy(config->dev_name, lcdev->dev->kobj.name,  sizeof(config->dev_name=
));
>
>

ACK

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
> > +     switch (led->led_no) {
> > +     case MT6360_LED_ISNK1 ... MT6360_LED_ISNK4:
> > +             if (led->led_no =3D=3D MT6360_LED_ISNK1) {
> > +                     /* Change isink1 to SW control mode, disconnect i=
t with charger state */
> > +                     ret =3D regmap_update_bits(priv->regmap, MT6360_R=
EG_RGBEN,
> > +                                              MT6360_CHRINDSEL_MASK, M=
T6360_CHRINDSEL_MASK);
> > +                     if (ret) {
> > +                             dev_err(parent, "Failed to config ISNK1 t=
o SW mode\n");
> > +                             return ret;
> > +                     }
> > +             }
> > +
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
> > +
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
> > +     struct led_classdev *isnk =3D &led->isnk;
> > +     struct mt6360_priv *priv =3D led->priv;
> > +     u32 step_uA, max_uA;
> > +     u32 val;
> > +     int ret;
> > +
> > +     if (led->led_no =3D=3D MT6360_LED_ISNK4) {
> > +             step_uA =3D MT6360_ISNK4_STEPUA;
> > +             max_uA =3D MT6360_ISNK4_MAXUA;
> > +     } else {
> > +             step_uA =3D MT6360_ISNK1_STEPUA;
> > +             max_uA =3D MT6360_ISNK1_MAXUA;
> > +     }
> > +
> > +     ret =3D fwnode_property_read_u32(init_data->fwnode, "led-max-micr=
oamp", &val);
> > +     if (ret) {
> > +             dev_warn(priv->dev, "Not specified led-max-microamp, conf=
ig to the minimum step\n");
> > +             val =3D 1 * step_uA;
> > +     } else
> > +             val =3D clamp_align(val, 0, max_uA, step_uA);
> > +
> > +     isnk->max_brightness =3D val / step_uA;
> > +     isnk->brightness_set_blocking =3D mt6360_isnk_brightness_set;
> > +
> > +     fwnode_property_read_string(init_data->fwnode, "linux,default-tri=
gger",
> > +                                 &isnk->default_trigger);
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
> > +     if (!count || count > MT6360_MAX_LEDS)
>
> Please add dev_err() here.
>

dev_err(&pdev->dev, "No child node or node count over max led number
%d\n", count);

> > +             return -EINVAL;
> > +
> > +     priv =3D devm_kzalloc(&pdev->dev, struct_size(priv, leds, count),=
 GFP_KERNEL);
> > +     if (!priv)
> > +             return -ENOMEM;
> > +
> > +     priv->leds_count =3D count;
> > +     priv->dev =3D &pdev->dev;
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
> > +             if (reg >=3D MT6360_MAX_LEDS || priv->leds_active & BIT(r=
eg))
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
> > +             switch (reg) {
> > +             case MT6360_LED_ISNK1 ... MT6360_LED_ISNK4:
> > +                     ret =3D mt6360_init_isnk_properties(led, &init_da=
ta);
> > +                     break;
> > +             default:
> > +                     ret =3D mt6360_init_flash_properties(led, &init_d=
ata);
> > +             }
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
