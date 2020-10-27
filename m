Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B40B29A90C
	for <lists+linux-leds@lfdr.de>; Tue, 27 Oct 2020 11:07:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2897333AbgJ0KGi (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 27 Oct 2020 06:06:38 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:35585 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2897330AbgJ0KGi (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 27 Oct 2020 06:06:38 -0400
Received: by mail-lj1-f196.google.com with SMTP id x16so1086970ljh.2;
        Tue, 27 Oct 2020 03:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=eyVyvzmEHK63Q//bnH9rZE2nEJFh8CSVrmNWz1XpH3s=;
        b=hPclqYObaWFUknOArAbmWETI3lYJ/CcTjgJo5Nlm5H0WmQLxJyVAuNyfQkbkGHOq+Y
         Y86IPCzuE5tu4I7d0BjcKk3YnSk/r9gJ2RDdO1B3QEr/1Q1f9q4QmwlOJzngmsgu7Dqf
         skLJkVJlgxLLS6MuVq23AytKFDfg+FGu004gk00P77afQ73bzuPE4MFxF53tpiTKDqvR
         LrStk6ekahhIXDmpzY2hXLdHI8GojtU2qa3kFVx09Mx4RTnU+jOA6Ot/IQDsXF3L4e5G
         4XacKEJ7Ip/RFGRSIHrMXiyABLZvG7uBfyc0u8t8uzd3ZyIxZtYxuk59OJNb62011PIj
         1PXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=eyVyvzmEHK63Q//bnH9rZE2nEJFh8CSVrmNWz1XpH3s=;
        b=DfFt5VwmCtBtpEbk3CylVxAf9bKPWK+aDDCnPN7mqwzczegyHWbJ34Rirwv1PGxxis
         DB8Ut4tO9sAWDbjZKA9VnN5Dumz8jZwr5V1BNXz+TgJOvkmLzoOXeyTeOI8jGZC4KFcj
         5K0/9KEa1HtRnoInToOZtu1WzsUGPwZeIw/2jS716tLR4S2GBVBkAJnAgtSRnjFLkRNz
         8IBFidh/Zfnq7mKFmP1WlF0VyM7jIjjJcweq/5whyDcJW+8x+8g4021497oHCRwFN5sE
         jleYcQfRciJHhY8L3/K8te+VNkT2Rb8BrELbT5wn4+kQICR7xj0wydHikwPWesmmReew
         1ErQ==
X-Gm-Message-State: AOAM533N9z/gZhAVNZEvUSUXeNdDzdxNOHI/410TSzQzNpR51T6EtKdZ
        Uo4Iu1GsqXDWWvIWbGJdAXZYkHRu6MWxAfyv6IU4c5pMk0AFo20D
X-Google-Smtp-Source: ABdhPJzo7KvLCXkTK6bR2S8X6XdVkbrYOm1xzEJ/Sm1tPfIkTe1EYjus1V/2GF1jcf+O1ySwwMtDi6dkOXtTmDXXK2k=
X-Received: by 2002:a2e:8e96:: with SMTP id z22mr725989ljk.154.1603793193039;
 Tue, 27 Oct 2020 03:06:33 -0700 (PDT)
MIME-Version: 1.0
References: <1603784069-24114-1-git-send-email-u0084500@gmail.com>
 <20201027082900.GA21354@amd> <CADiBU3915nyB2OE_bqPy8kVqPhKbdTpBe8ay_ZAoFwuJoL-BfQ@mail.gmail.com>
In-Reply-To: <CADiBU3915nyB2OE_bqPy8kVqPhKbdTpBe8ay_ZAoFwuJoL-BfQ@mail.gmail.com>
From:   ChiYuan Huang <u0084500@gmail.com>
Date:   Tue, 27 Oct 2020 18:06:21 +0800
Message-ID: <CADiBU3_HBVa5hNv8VZcdS+pQJYBH6od-8Q7st2126AeBt1zThg@mail.gmail.com>
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

Hi, Parvel:
  Continue the last mail, I'm confused about the rule 80-characters-per-lin=
e.
I check some information about submitting changes.
https://www.phoronix.com/scan.php?page=3Dnews_item&px=3DLinux-Kernel-Deprec=
ates-80-Col
Could you help to explain the current rule about this limit? still 80
characters per line? or it has been changed to 100.

ChiYuan Huang <u0084500@gmail.com> =E6=96=BC 2020=E5=B9=B410=E6=9C=8827=E6=
=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=885:27=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Pavel Machek <pavel@ucw.cz> =E6=96=BC 2020=E5=B9=B410=E6=9C=8827=E6=97=A5=
 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=884:29=E5=AF=AB=E9=81=93=EF=BC=9A
> >
> > Hi!
> >
> > > From: ChiYuan Huang <cy_huang@richtek.com>
> > >
> > > Add support for RT4505 flash led controller. It can support up to 1.5=
A
> > > flash current with hardware timeout and low input voltage
> > > protection.
> >
> > Please use upper-case "LED" everywhere.
> >
> > This should be 2nd in the series, after DT changes.
> Sure, will ack in next series patch.
> >
> > > Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> > > ---
> > >  drivers/leds/Kconfig       |  11 ++
> > >  drivers/leds/Makefile      |   1 +
> > >  drivers/leds/leds-rt4505.c | 397 +++++++++++++++++++++++++++++++++++=
++++++++++
> > >  3 files changed, 409 insertions(+)
> > >  create mode 100644 drivers/leds/leds-rt4505.c
> >
> > Lets put this into drivers/leds/flash/. (Yes, you'll have to create
> > it).
> OK
> >
> >
> > > +     help
> > > +       This option enables support for the RT4505 flash led controll=
er.
> >
> > Information where it is used would be welcome here.
> How about to add the below line for the extra information?
> Usually used to company with the camera device on smartphone/tablet produ=
cts
> >
> > > +       It can support up to 1.5A flash strobe current with hardware =
timeout
> > > +       and low input voltage protection.
> >
> > This does not / should not be here.
> OK
> > > +
> > > +static int rt4505_torch_brightness_set(struct led_classdev *lcdev, e=
num led_brightness level)
> > > +{
> >
> > 80 columns, where easy.
> I'll review all source code to meet the 80 column limit.
> >
> > > +     struct rt4505_priv *priv =3D container_of(lcdev, struct rt4505_=
priv, flash.led_cdev);
> > > +     u32 val =3D 0;
> > > +     int ret;
> > > +
> > > +     mutex_lock(&priv->lock);
> > > +
> > > +     if (level !=3D LED_OFF) {
> > > +             ret =3D regmap_update_bits(priv->regmap, RT4505_REG_ILE=
D, RT4505_ITORCH_MASK,
> > > +                                      (level - 1) << RT4505_ITORCH_S=
HIFT);
> > > +             if (ret)
> > > +                     goto unlock;
> > > +
> > > +             val =3D RT4505_TORCH_SET;
> > > +     }
> > > +
> > > +     ret =3D regmap_update_bits(priv->regmap, RT4505_REG_ENABLE, RT4=
505_ENABLE_MASK, val);
> > > +
> > > +unlock:
> > > +     mutex_unlock(&priv->lock);
> > > +     return ret;
> > > +}
> >
> > Why is the locking needed? What will the /sys/class/leds interface
> > look like on system with your flash?
>
> The original thought is because there's still another way to control
> flash like as v4l2.
> But after reviewing the source code, led sysfs node will be protected
> by led_cdev->led_access.
> And V4L2 flash will also be protected by v4l2_fh_is_singular API.
> I think the whole locking in the source code code may be removed. Right?
> >
> > > +static int rt4505_flash_strobe_get(struct led_classdev_flash *fled_c=
dev, bool *state)
> > > +{
> > > +     struct rt4505_priv *priv =3D container_of(fled_cdev, struct rt4=
505_priv, flash);
> > > +     u32 val;
> > > +     int ret;
> > > +
> > > +     mutex_lock(&priv->lock);
> > > +
> > > +     ret =3D regmap_read(priv->regmap, RT4505_REG_ENABLE, &val);
> > > +     if (ret)
> > > +             goto unlock;
> > > +
> > > +     *state =3D ((val & RT4505_FLASH_GET) =3D=3D RT4505_FLASH_GET) ?=
 true : false;
> >
> > No need for ? ... part.
> Do you mean this function is not needed? If yes, it can be removed.
> But if it removed, led sysfs flash_strobe show will be not supported.
> >
> > > +static bool rt4505_is_accessible_reg(struct device *dev, unsigned in=
t reg)
> > > +{
> > > +     if (reg =3D=3D RT4505_REG_RESET || (reg >=3D RT4505_REG_CONFIG =
 && reg <=3D RT4505_REG_FLAGS))
> > > +             return true;
> >
> > Make this two stagements.
> Like as the below one?? Or separate it into two if case.
> if (reg =3D=3D RT4505_REG_RESET ||
>        reg >=3D RT4505_REG_CONFIG  && reg <=3D RT4505_REG_FLAGS))
> >
> > Otherwise... looks like easy simple driver, thanks.
> >
> > Best regards,
> >                                                                 Pavel
> > --
> > http://www.livejournal.com/~pavelmachek
