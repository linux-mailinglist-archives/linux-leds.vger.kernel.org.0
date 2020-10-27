Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 049B429A7CD
	for <lists+linux-leds@lfdr.de>; Tue, 27 Oct 2020 10:27:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2894380AbgJ0J1g (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 27 Oct 2020 05:27:36 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:45601 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408373AbgJ0J1g (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 27 Oct 2020 05:27:36 -0400
Received: by mail-lj1-f196.google.com with SMTP id t13so791534ljk.12;
        Tue, 27 Oct 2020 02:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=K2NtbP1umVFTWI1Q3UevvPc06v6h6+rr/VTYbTyZHFY=;
        b=SRX5GeGuzAee0bOFMO5fLIu4Mlc0dtGgkj3Vaiz/hnionsvpM7sJfHtgkybKf3s1h/
         fUGUQHVlKhmEtRRN0tYim7JcHeWIeRwhi2bpmDYlgCcuLXOYQXSVbTMo1tG/exFy7yFS
         RjHaF94ihcM+D0bwDUwypWuvB/7u5Ak6bFaduBLv5rDVtwd7BHwVP6KNPP4Yj/9TTTFR
         4qJxNSbSe9oi92r9GMPY15TfCwLZh8O1C6YL3n6aIQOn1gOQDAT5Qt60V4c96wntGTRp
         l7pplas0lkZO8I0WP+LNvVtMa9/u2ktZbyJYnXHD5cABERpN3iu45soUNvPSJCNe6RrG
         Y1RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=K2NtbP1umVFTWI1Q3UevvPc06v6h6+rr/VTYbTyZHFY=;
        b=rqc1HQmxhdqstpK1Dx3T4tw3zJAroo07Y2KyyMeoqEjbCUdnyaF8zUVfCHFZUlZNOa
         vBkglb0Z9VgKs++OxhRiNNSPB8zjmwz5qB3TOy9+UtRqsc/tU8xUpafocI/9Eedd3kyK
         WS9mgtg28zPmTrjdRlAvNTTF4WaKmWxXz20UKvzPuaGLhdOyRUUbHPBQCfW02lsplDbv
         pXtHdlNtYb3XViFUdMCsh4o6ju396qXCVQccK+kdkFb/uyqfdUHGjwNSuP8E9zUeJ6Ml
         t1Q55tbzZx3ZfX23tvo5KSCOKLjpLZIbSJ+Nzhb+z6cOqqv5z8XwqLbgDuCDAVJzF+xG
         Ms5w==
X-Gm-Message-State: AOAM530N1+AqbVbwJrEdgF0g1PFDiEQk1x/FDfMqGu0+dZLUJruvwO1d
        6GeURsnVnOA6ephhQRT5d1OZ7535k+xWzWRBFJ4=
X-Google-Smtp-Source: ABdhPJxEejzje6L5pObRW4g0OJBS56IDDCtvxEJU6XIZpaLRTLK9iiRsNwJhyqh5yYMw1qFU4SY4+hsGeRh+C/MM/dg=
X-Received: by 2002:a2e:a547:: with SMTP id e7mr725164ljn.283.1603790853283;
 Tue, 27 Oct 2020 02:27:33 -0700 (PDT)
MIME-Version: 1.0
References: <1603784069-24114-1-git-send-email-u0084500@gmail.com> <20201027082900.GA21354@amd>
In-Reply-To: <20201027082900.GA21354@amd>
From:   ChiYuan Huang <u0084500@gmail.com>
Date:   Tue, 27 Oct 2020 17:27:21 +0800
Message-ID: <CADiBU3915nyB2OE_bqPy8kVqPhKbdTpBe8ay_ZAoFwuJoL-BfQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] leds: rt4505: Add support for Richtek RT4505 flash
 led controller
To:     Pavel Machek <pavel@ucw.cz>
Cc:     dmurphy@ti.com, robh+dt@kernel.org, linux-leds@vger.kernel.org,
        lkml <linux-kernel@vger.kernel.org>,
        cy_huang <cy_huang@richtek.com>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel Machek <pavel@ucw.cz> =E6=96=BC 2020=E5=B9=B410=E6=9C=8827=E6=97=A5 =
=E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=884:29=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi!
>
> > From: ChiYuan Huang <cy_huang@richtek.com>
> >
> > Add support for RT4505 flash led controller. It can support up to 1.5A
> > flash current with hardware timeout and low input voltage
> > protection.
>
> Please use upper-case "LED" everywhere.
>
> This should be 2nd in the series, after DT changes.
Sure, will ack in next series patch.
>
> > Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> > ---
> >  drivers/leds/Kconfig       |  11 ++
> >  drivers/leds/Makefile      |   1 +
> >  drivers/leds/leds-rt4505.c | 397 +++++++++++++++++++++++++++++++++++++=
++++++++
> >  3 files changed, 409 insertions(+)
> >  create mode 100644 drivers/leds/leds-rt4505.c
>
> Lets put this into drivers/leds/flash/. (Yes, you'll have to create
> it).
OK
>
>
> > +     help
> > +       This option enables support for the RT4505 flash led controller=
.
>
> Information where it is used would be welcome here.
How about to add the below line for the extra information?
Usually used to company with the camera device on smartphone/tablet product=
s
>
> > +       It can support up to 1.5A flash strobe current with hardware ti=
meout
> > +       and low input voltage protection.
>
> This does not / should not be here.
OK
> > +
> > +static int rt4505_torch_brightness_set(struct led_classdev *lcdev, enu=
m led_brightness level)
> > +{
>
> 80 columns, where easy.
I'll review all source code to meet the 80 column limit.
>
> > +     struct rt4505_priv *priv =3D container_of(lcdev, struct rt4505_pr=
iv, flash.led_cdev);
> > +     u32 val =3D 0;
> > +     int ret;
> > +
> > +     mutex_lock(&priv->lock);
> > +
> > +     if (level !=3D LED_OFF) {
> > +             ret =3D regmap_update_bits(priv->regmap, RT4505_REG_ILED,=
 RT4505_ITORCH_MASK,
> > +                                      (level - 1) << RT4505_ITORCH_SHI=
FT);
> > +             if (ret)
> > +                     goto unlock;
> > +
> > +             val =3D RT4505_TORCH_SET;
> > +     }
> > +
> > +     ret =3D regmap_update_bits(priv->regmap, RT4505_REG_ENABLE, RT450=
5_ENABLE_MASK, val);
> > +
> > +unlock:
> > +     mutex_unlock(&priv->lock);
> > +     return ret;
> > +}
>
> Why is the locking needed? What will the /sys/class/leds interface
> look like on system with your flash?

The original thought is because there's still another way to control
flash like as v4l2.
But after reviewing the source code, led sysfs node will be protected
by led_cdev->led_access.
And V4L2 flash will also be protected by v4l2_fh_is_singular API.
I think the whole locking in the source code code may be removed. Right?
>
> > +static int rt4505_flash_strobe_get(struct led_classdev_flash *fled_cde=
v, bool *state)
> > +{
> > +     struct rt4505_priv *priv =3D container_of(fled_cdev, struct rt450=
5_priv, flash);
> > +     u32 val;
> > +     int ret;
> > +
> > +     mutex_lock(&priv->lock);
> > +
> > +     ret =3D regmap_read(priv->regmap, RT4505_REG_ENABLE, &val);
> > +     if (ret)
> > +             goto unlock;
> > +
> > +     *state =3D ((val & RT4505_FLASH_GET) =3D=3D RT4505_FLASH_GET) ? t=
rue : false;
>
> No need for ? ... part.
Do you mean this function is not needed? If yes, it can be removed.
But if it removed, led sysfs flash_strobe show will be not supported.
>
> > +static bool rt4505_is_accessible_reg(struct device *dev, unsigned int =
reg)
> > +{
> > +     if (reg =3D=3D RT4505_REG_RESET || (reg >=3D RT4505_REG_CONFIG  &=
& reg <=3D RT4505_REG_FLAGS))
> > +             return true;
>
> Make this two stagements.
Like as the below one?? Or separate it into two if case.
if (reg =3D=3D RT4505_REG_RESET ||
       reg >=3D RT4505_REG_CONFIG  && reg <=3D RT4505_REG_FLAGS))
>
> Otherwise... looks like easy simple driver, thanks.
>
> Best regards,
>                                                                 Pavel
> --
> http://www.livejournal.com/~pavelmachek
