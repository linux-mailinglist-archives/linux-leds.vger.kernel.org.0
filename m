Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD56E6B6DEA
	for <lists+linux-leds@lfdr.de>; Mon, 13 Mar 2023 04:22:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229641AbjCMDWV (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 12 Mar 2023 23:22:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229623AbjCMDWT (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 12 Mar 2023 23:22:19 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69D1D27D6C
        for <linux-leds@vger.kernel.org>; Sun, 12 Mar 2023 20:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678677687;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IGPhvBPoVAwRHSSTA2NbHlJPpu91svaFrlN4CxHXALc=;
        b=QxkDXFDKMhT9tWBjoike12I+U0e82vWOFkryR1cUTZNzrVcc1EJu4L70Xx83OR8pX8FadA
        MF7Ozlbyum9XMRXCcGPrsN8BkJX40vvCX+38Zl32WNMPzm0Ac1pR9tHH+e++LUrmMgEJWF
        Nm6AEmvESoppOYPHsD4QVVd05/9PGDc=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-328-6r5Ljop5Mxum-hBRX92jJg-1; Sun, 12 Mar 2023 23:21:24 -0400
X-MC-Unique: 6r5Ljop5Mxum-hBRX92jJg-1
Received: by mail-pg1-f199.google.com with SMTP id t12-20020a65608c000000b005091ec4f2d4so466261pgu.20
        for <linux-leds@vger.kernel.org>; Sun, 12 Mar 2023 20:21:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678677681;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IGPhvBPoVAwRHSSTA2NbHlJPpu91svaFrlN4CxHXALc=;
        b=i39TtOwgLAvHRU2z435rEUtgmmAX1M0mIWaTNaVex+1s2hirHxNZXx6XT051WVVZ2G
         qkPnuXAzYfOIZL9dJqKBVhBtx727CPIJAN7Wj2kbTQTpb7pXixLXw9pNeQXBu2cw6q7V
         ZLY300RCLnwpfdP8bY4rGrxSfKcZxZ45uASAE5GDkr++n+WpLD9jWUlNHhvudy+NMbtt
         0eo2+Fjo7D4JwCyW3TwTKmLITw/4k9Us6BUIQCKhnZ5Cq3/ya2YDkCdLsTiRGV5Aka3s
         a9Pagb2BMYxGkOuoTvVOP+MAgRtkZu5TujY8pYo/rdK2PJ4z8pMPVqNu3Nj/oPr8nIKO
         xfyQ==
X-Gm-Message-State: AO0yUKUaQWpMH0O0NxPPYGcdu3gTvaQ0jy3xqEGWL087nsbIPTZglXi+
        6bFmHRmdTxH/41j/GUYpRbm4uMHxWIJltWp86G7wzh6V3FyDWIIr8hjTJd29UkReyVmwJInGMPz
        ZoTgbMWisanS+SGuDP5c+x31wvkshkXIapAffFAV84txKrQ==
X-Received: by 2002:a63:8c1d:0:b0:503:2535:44c3 with SMTP id m29-20020a638c1d000000b00503253544c3mr11048631pgd.4.1678677681120;
        Sun, 12 Mar 2023 20:21:21 -0700 (PDT)
X-Google-Smtp-Source: AK7set+aM9TI42paO53bSL28doOddvzjpz5GG1QVV5dXk4xagL7/qVSl6keo/SYKsq6CscxHLqhH4ddk34sokqzjajM=
X-Received: by 2002:a63:8c1d:0:b0:503:2535:44c3 with SMTP id
 m29-20020a638c1d000000b00503253544c3mr11048628pgd.4.1678677680668; Sun, 12
 Mar 2023 20:21:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230310095635.813262-1-hpa@redhat.com> <20230310095635.813262-4-hpa@redhat.com>
 <6644d2ef-10c8-43df-987c-b688d3f75f11@ideasonboard.com>
In-Reply-To: <6644d2ef-10c8-43df-987c-b688d3f75f11@ideasonboard.com>
From:   Kate Hsuan <hpa@redhat.com>
Date:   Mon, 13 Mar 2023 11:21:09 +0800
Message-ID: <CAEth8oGnoTb9JrfKN7v61biWAoH39LnXw4OtXQQCvy+9J7f2_Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] leds: tps68470: Add LED control for tps68470
To:     Dan Scally <dan.scally@ideasonboard.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Daniel Scally <djrscally@gmail.com>,
        Mark Gross <markgross@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

On Fri, Mar 10, 2023 at 6:43=E2=80=AFPM Dan Scally <dan.scally@ideasonboard=
.com> wrote:
>
> Hi Kate - thanks for the v2
>
> On 10/03/2023 09:56, Kate Hsuan wrote:
> > There are two LED controllers, LEDA indicator LED and LEDB flash LED fo=
r
> > tps68470. LEDA can be enabled by setting TPS68470_ILEDCTL_ENA. Moreover=
,
> > tps68470 provides four levels of power status for LEDB. If the
> > properties called "ti,ledb-current" can be found, the current will be
> > set according to the property values. These two LEDs can be controlled
> > through the LED class of sysfs (tps68470-leda and tps68470-ledb).
> >
> > Signed-off-by: Kate Hsuan <hpa@redhat.com>
> > ---
> >   drivers/leds/Kconfig         |  12 +++
> >   drivers/leds/Makefile        |   1 +
> >   drivers/leds/leds-tps68470.c | 182 ++++++++++++++++++++++++++++++++++=
+
> >   3 files changed, 195 insertions(+)
> >   create mode 100644 drivers/leds/leds-tps68470.c
> >
> > diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> > index 9dbce09eabac..fd26036b3c61 100644
> > --- a/drivers/leds/Kconfig
> > +++ b/drivers/leds/Kconfig
> > @@ -827,6 +827,18 @@ config LEDS_TPS6105X
> >         It is a single boost converter primarily for white LEDs and
> >         audio amplifiers.
> >
> > +config LEDS_TPS68470
> > +     tristate "LED support for TI TPS68470"
> > +     depends on LEDS_CLASS
> > +     depends on INTEL_SKL_INT3472
> > +     help
> > +       This driver supports TPS68470 PMIC with LED chip.
> > +       It provide two LED controllers, including an indicator LED
> > +       and a flash LED.
>
> s/provide/provides. Also maybe "It provides two LED controllers, with the=
 ability to drive 2

I'll revise the description in the v3 patch.

> indicator LEDs and 2 flash LEDs". I actually got the WLED part working no=
w finally so I'll send
> patches on top of this series if that's ok?

Sounds good! That would be great! Thank you


>
> > +
> > +       To compile this driver as a module, choose M and it will be
> > +       called leds-tps68470
> > +
> >   config LEDS_IP30
> >       tristate "LED support for SGI Octane machines"
> >       depends on LEDS_CLASS
> > diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> > index d30395d11fd8..b284bc0daa98 100644
> > --- a/drivers/leds/Makefile
> > +++ b/drivers/leds/Makefile
> > @@ -84,6 +84,7 @@ obj-$(CONFIG_LEDS_TURRIS_OMNIA)             +=3D leds=
-turris-omnia.o
> >   obj-$(CONFIG_LEDS_WM831X_STATUS)    +=3D leds-wm831x-status.o
> >   obj-$(CONFIG_LEDS_WM8350)           +=3D leds-wm8350.o
> >   obj-$(CONFIG_LEDS_WRAP)                     +=3D leds-wrap.o
> > +obj-$(CONFIG_LEDS_TPS68470)          +=3D leds-tps68470.o
> >
> >   # LED SPI Drivers
> >   obj-$(CONFIG_LEDS_CR0014114)                +=3D leds-cr0014114.o
> > diff --git a/drivers/leds/leds-tps68470.c b/drivers/leds/leds-tps68470.=
c
> > new file mode 100644
> > index 000000000000..98bb56153690
> > --- /dev/null
> > +++ b/drivers/leds/leds-tps68470.c
> > @@ -0,0 +1,182 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * LED driver for TPS68470 PMIC
> > + *
> > + * Copyright (C) 2023 Red Hat
> > + *
> > + * Authors:
> > + *   Kate Hsuan <hpa@redhat.com>
> > + */
> > +
> > +#include <linux/gpio/driver.h>
>
> Not needed I think?

removed

>
> > +#include <linux/mfd/tps68470.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +#include <linux/leds.h>
>
> Alphabetical order?

Okay.

> > +
> > +#define lcdev_to_led(led_cdev) \
> > +     container_of(led_cdev, struct tps68470_led, lcdev)
> > +
> > +#define led_to_tps68470(led, index) \
> > +     container_of(led, struct tps68470_device, leds[index])
> > +
> > +enum tps68470_led_ids {
> > +     TPS68470_ILED_A,
> > +     TPS68470_ILED_B,
> > +     TPS68470_NUM_LEDS
> > +};
> > +
> > +static const char *tps68470_led_names[] =3D {
> > +     [TPS68470_ILED_A] =3D "tps68470-iled_a",
> > +     [TPS68470_ILED_B] =3D "tps68470-iled_b",
> > +};
> > +
> > +struct tps68470_led {
> > +     unsigned int led_id;
> > +     struct led_classdev lcdev;
> > +};
> > +
> > +struct tps68470_device {
> > +     struct device *dev;
> > +     struct regmap *regmap;
> > +     struct tps68470_led leds[TPS68470_NUM_LEDS];
> > +};
> > +
> > +enum ctrlb_current {
> > +     CTRLB_2MA       =3D 0,
> > +     CTRLB_4MA       =3D 1,
> > +     CTRLB_8MA       =3D 2,
> > +     CTRLB_16MA      =3D 3,
> > +};
> > +
> > +static int tps68470_brightness_set(struct led_classdev *led_cdev, enum=
 led_brightness brightness)
> > +{
> > +     struct tps68470_led *led =3D lcdev_to_led(led_cdev);
> > +     struct tps68470_device *tps68470 =3D led_to_tps68470(led, led->le=
d_id);
> > +     struct regmap *regmap =3D tps68470->regmap
> This would work fine as is...but I would maybe add something like
>
>         if (state > LED_ON)
>                 return -EINVAL;
>
> So that brightness values of > 1 aren't just silently accepted...or does =
the LED core already
> prevent that? If so it's fine.

I think it is unnecessary.
The LED framework already handles this. Since we already set
"max_brightness" for the device, the framework will check the
"brightness" value and make sure the value isn't greater than
"max_brightness".

>
> > +
> > +     switch (led->led_id) {
> > +     case TPS68470_ILED_A:
> > +             return regmap_update_bits(regmap, TPS68470_REG_ILEDCTL, T=
PS68470_ILEDCTL_ENA,
> > +                                       brightness ? TPS68470_ILEDCTL_E=
NA : 0);
> > +     case TPS68470_ILED_B:
> > +             return regmap_update_bits(regmap, TPS68470_REG_ILEDCTL, T=
PS68470_ILEDCTL_ENB,
> > +                                       brightness ? TPS68470_ILEDCTL_E=
NB : 0);
> > +     }
> > +     return -EINVAL;
> > +}
> > +
> > +static enum led_brightness tps68470_brightness_get(struct led_classdev=
 *led_cdev)
> > +{
> > +     struct tps68470_led *led =3D lcdev_to_led(led_cdev);
> > +     struct tps68470_device *tps68470 =3D led_to_tps68470(led, led->le=
d_id);
> > +     struct regmap *regmap =3D tps68470->regmap;
> > +     int ret =3D 0;
> > +     int value =3D 0;
> > +
> > +     ret =3D  regmap_read(regmap, TPS68470_REG_ILEDCTL, &value);
> > +     if (ret)
> > +             goto error;
>
> Just return dev_err_probe(led_cdev->dev, -EINVAL, "failed on reading regi=
ster\n") here imo.

Okay.

> > +
> > +     switch (led->led_id) {
> > +     case TPS68470_ILED_A:
> > +             value =3D value & TPS68470_ILEDCTL_ENA;
> > +             break;
> > +     case TPS68470_ILED_B:
> > +             value =3D value & TPS68470_ILEDCTL_ENB;
> > +             break;
> > +     }
> > +
> > +     return value ? LED_ON : LED_OFF;
> > +
> > +error:
> > +     dev_err(led_cdev->dev, "Failed on reading register\n");
> > +     return -EINVAL;
> > +}
> > +
> > +static int tps68470_leds_probe(struct platform_device *pdev)
> > +{
> > +     int i =3D 0;
> > +     int ret =3D 0;
> > +     unsigned int curr;
> > +     struct tps68470_device *tps68470;
> > +     struct tps68470_led *led;
> > +     struct led_classdev *lcdev;
> > +
> > +     tps68470 =3D devm_kzalloc(&pdev->dev, sizeof(struct tps68470_devi=
ce),
> > +                             GFP_KERNEL);
>
> No -ENOMEM check here?
>

I'll add a return value check here in the v3 patch.

> > +     tps68470->dev =3D &pdev->dev;
> > +     tps68470->regmap =3D dev_get_drvdata(pdev->dev.parent);
> > +
> > +     for (i =3D 0; i < TPS68470_NUM_LEDS; i++) {
> > +             led =3D &tps68470->leds[i];
> > +             lcdev =3D &led->lcdev;
> > +
> > +             led->led_id =3D i;
> > +
> > +             lcdev->name =3D devm_kasprintf(tps68470->dev, GFP_KERNEL,=
 "%s::%s",
> > +                                          tps68470_led_names[i], LED_F=
UNCTION_INDICATOR);
> > +             if (!lcdev->name)
> > +                     return -ENOMEM;
> > +
> > +             lcdev->max_brightness =3D 1;
> > +             lcdev->brightness =3D 0;
> > +             lcdev->brightness_set_blocking =3D tps68470_brightness_se=
t;
> > +             lcdev->brightness_get =3D tps68470_brightness_get;
> > +             lcdev->dev =3D &pdev->dev;
> > +
> > +             ret =3D devm_led_classdev_register(tps68470->dev, lcdev);
> > +             if (ret) {
> > +                     dev_err_probe(tps68470->dev, ret,
> > +                                   "error registering led\n");
> > +                     goto err_exit;
> > +             }
> > +     }
> > +
> > +     /* configure LEDB current if the properties can be got */
> > +     if (!device_property_read_u32(&pdev->dev, "ti,ledb-current", &cur=
r)) {
> > +             switch (curr) {
> > +             case  2:
> > +                     curr =3D CTRLB_2MA;
> > +                     break;
> > +             case  4:
> > +                     curr =3D CTRLB_4MA;
> > +                     break;
> > +             case  8:
> > +                     curr =3D CTRLB_8MA;
> > +                     break;
> > +             case 16:
> > +                     curr =3D CTRLB_16MA;
> > +                     break;
> > +             default:
> > +                     dev_err(&pdev->dev, "Invalid LEDB curr value: %d\=
n", curr);
> > +                     return -EINVAL;
>
> There's no jump to err_exit here...I think that this whole section should=
 go above the registration
> of the LEDS...and probably also into its own function.

Okay.

>
> > +             }
> > +             ret =3D regmap_update_bits(tps68470->regmap, TPS68470_REG=
_ILEDCTL,
> > +                                      TPS68470_ILEDCTL_CTRLB, curr);
> > +     }
> > +
> > +err_exit:
> > +     if (ret) {
> > +             for (i =3D 0; i < TPS68470_NUM_LEDS; i++) {
> > +                     if (tps68470->leds[i].lcdev.name)
> > +                             devm_led_classdev_unregister(&pdev->dev,
> > +                                                          &tps68470->l=
eds[i].lcdev);
> > +             }
> > +     }
> > +
> > +     return ret;
> > +}
> > +static struct platform_driver tps68470_led_driver =3D {
> > +     .driver =3D {
> > +                .name =3D "tps68470-led",
> > +     },
> > +     .probe =3D tps68470_leds_probe,
> > +};
> > +
> > +module_platform_driver(tps68470_led_driver);
> > +
> > +MODULE_ALIAS("platform:tps68470-led");
> > +MODULE_DESCRIPTION("LED driver for TPS68470 PMIC");
> > +MODULE_LICENSE("GPL v2");
>


Thank you

--=20
BR,
Kate

