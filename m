Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4CCF29B3D4
	for <lists+linux-leds@lfdr.de>; Tue, 27 Oct 2020 15:56:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1781509AbgJ0Ozq (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 27 Oct 2020 10:55:46 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:33998 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1781489AbgJ0Ozo (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 27 Oct 2020 10:55:44 -0400
Received: by mail-lf1-f65.google.com with SMTP id z2so2753874lfr.1;
        Tue, 27 Oct 2020 07:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=IwrRvxTVDMC8QlGW8JTiTNlxMPmiVJGKtCzOj9qt2Dw=;
        b=A4DJHZlCnLCOsybSPXVcUXn3rnNb+2IJV6BI/YaxEtGSjjQn0n/K6BLIxOB64D8jaP
         2Hr/Y1a2VA3oEkaXl6svW4UKFOGqriV0bviBuRrYEjZINKOPJYI+3AnFfLrYGFXbQGIz
         NS2hFaUXr4k9IyEeYuY7thznSyUnibnDTmRIiWsddufW2pGydmAQIFEnPTihd/PrhApB
         W6rYqaK2RvXUCfXKht17hC1nw8YgF/W8pjXcZRAs4YDYoHwAp+1MiFlNVOHxUEbDOffw
         cfuwQ9MMmBI02Sz6+8om2s4ii1q0v97a7x9Ka8AXQbpRcY7BJVNncLAqJpoCWI7aKz+G
         61kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IwrRvxTVDMC8QlGW8JTiTNlxMPmiVJGKtCzOj9qt2Dw=;
        b=ZlCKEZRIhCvkEyugGycnO0fzU31K0RxpHXGzrnfBcwJ3+Opd6HXGYOJ4SN1GPvsM5G
         +RhQV+IbZfb+GDxUH/B4U4irm0jySHhCNpCCqeWwpK/OKLIxOfrpj0j7xnU+u16hcI2Q
         Is/BHHCsbqrD8cbMg58EHl+evckxpMpK99krTPuywLt5Yu7cGH+IxsptqxE6R0pAU8lx
         wOwlF0hZMb/8MVkE7u65IOQldddC0hzIrORnRydixncMUOYNE8+ZcVE73UKnjd2ECFw/
         Eo2L+YZeR1FjMQfND5W1IZ+U4kl1mrVeD0n6k/F3eolXzRN6icBNA56C2poWUBfxp4Kz
         ZD1g==
X-Gm-Message-State: AOAM5314goiTJz8SjrF0QGxRKcWdYCAfdpJQD07zZzA/dVHAv++WFAdv
        gAzWCbiTJJ98T+HM63LZJTQMdoXBVQP55GLcRiw=
X-Google-Smtp-Source: ABdhPJzBKVcF8PZjXetLA1qBmomAVFcyH9xIvRxKh4CUiKa/UUzXhy21atamTBRSe/BhrurcYj2c9/y4d45dkolOcTo=
X-Received: by 2002:a05:6512:612:: with SMTP id b18mr96603lfe.209.1603810540913;
 Tue, 27 Oct 2020 07:55:40 -0700 (PDT)
MIME-Version: 1.0
References: <1603784069-24114-1-git-send-email-u0084500@gmail.com>
 <20201027082900.GA21354@amd> <CADiBU3915nyB2OE_bqPy8kVqPhKbdTpBe8ay_ZAoFwuJoL-BfQ@mail.gmail.com>
 <20201027101535.GB13900@duo.ucw.cz> <CADiBU39rQ=5vk31caa1rv32eyzFrYB78p8GubpSi21DS5JYQkA@mail.gmail.com>
In-Reply-To: <CADiBU39rQ=5vk31caa1rv32eyzFrYB78p8GubpSi21DS5JYQkA@mail.gmail.com>
From:   ChiYuan Huang <u0084500@gmail.com>
Date:   Tue, 27 Oct 2020 22:55:29 +0800
Message-ID: <CADiBU38QUhc5bH8NoiDrxYBr9FYnC2Hmi5XQRn5Ww+wxEvBnJA@mail.gmail.com>
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

ChiYuan Huang <u0084500@gmail.com> =E6=96=BC 2020=E5=B9=B410=E6=9C=8827=E6=
=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=886:46=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Pavel Machek <pavel@ucw.cz> =E6=96=BC 2020=E5=B9=B410=E6=9C=8827=E6=97=A5=
 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=886:15=E5=AF=AB=E9=81=93=EF=BC=9A
> >
> > Hi!
> >
> > > > Please use upper-case "LED" everywhere.
> > > >
> > > > This should be 2nd in the series, after DT changes.
> > > Sure, will ack in next series patch.
> >
> > Feel free to wait for dt ACKs before resending.
> >
> Yes, sure.
> > > > > +     help
> > > > > +       This option enables support for the RT4505 flash led cont=
roller.
> > > >
> > > > Information where it is used would be welcome here.
> > > How about to add the below line for the extra information?
> > > Usually used to company with the camera device on smartphone/tablet
> > > products
> >
> > Yes, that would help.
> >
> > "It is commonly used in smartphones, such as Bell Packard T899" would
> > be even better.
>
> Sorry, We don't focus on specific products. It's a general part flash
> led controller.
> I'll change it like as below
> "It's commonly used in smartphones and tablets to assist the builtin came=
ra."
> >
> > > > > +     ret =3D regmap_update_bits(priv->regmap, RT4505_REG_ENABLE,=
 RT4505_ENABLE_MASK, val);
> > > > > +
> > > > > +unlock:
> > > > > +     mutex_unlock(&priv->lock);
> > > > > +     return ret;
> > > > > +}
> > > >
> > > > Why is the locking needed? What will the /sys/class/leds interface
> > > > look like on system with your flash?
> > >
> > > The original thought is because there's still another way to control
> > > flash like as v4l2.
> > > But after reviewing the source code, led sysfs node will be protected
> > > by led_cdev->led_access.
> > > And V4L2 flash will also be protected by v4l2_fh_is_singular API.
> > > I think the whole locking in the source code code may be removed. Rig=
ht?
> >
> > Well, maybe you need it, I did not check..
I found all led class is guaranteed by led_cdev->led_access lock.
And v4l2 ctrl handleris guaranteed by ctrl->handler->lock that defined
in v4l2-ctrl.c.
When entering v4l2 control mode, all led sysfs will be disabled.
To remove all lock operation is correct. Due to all operations are guarante=
ed.
In next series patch, I'll remove it.
How do you think?
> >
> > What will the /sys/class/leds interface look like on system with your f=
lash?
> >
> > > > > +     *state =3D ((val & RT4505_FLASH_GET) =3D=3D RT4505_FLASH_GE=
T) ? true : false;
> > > >
> > > > No need for ? ... part.
> > > Do you mean this function is not needed? If yes, it can be removed.
> > > But if it removed, led sysfs flash_strobe show will be not supported.
> >
> > I meant "replace line with: *state =3D (val & RT4505_FLASH_GET) =3D=3D =
RT4505_FLASH_GET;"
> Oh, I got it. redundant judgement.
> >
> > > > > +static bool rt4505_is_accessible_reg(struct device *dev, unsigne=
d int reg)
> > > > > +{
> > > > > +     if (reg =3D=3D RT4505_REG_RESET || (reg >=3D RT4505_REG_CON=
FIG  && reg <=3D RT4505_REG_FLAGS))
> > > > > +             return true;
> > > >
> > > > Make this two stagements.
> > > Like as the below one?? Or separate it into two if case.
> > > if (reg =3D=3D RT4505_REG_RESET ||
> > >        reg >=3D RT4505_REG_CONFIG  && reg <=3D RT4505_REG_FLAGS))
> >
> > That would be fine, too... if you use just one space before "&&" :-).
> Thx.
> >
> > Best regards,
> >                                                         Pavel
> > --
> > http://www.livejournal.com/~pavelmachek
