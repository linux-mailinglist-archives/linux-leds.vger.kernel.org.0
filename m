Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCF5129A9FE
	for <lists+linux-leds@lfdr.de>; Tue, 27 Oct 2020 11:48:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1418600AbgJ0Kqz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 27 Oct 2020 06:46:55 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:46296 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1418295AbgJ0Kqx (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 27 Oct 2020 06:46:53 -0400
Received: by mail-lf1-f67.google.com with SMTP id v6so1637415lfa.13;
        Tue, 27 Oct 2020 03:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=n+R+IbGIJxakdbmAkfda0p2uyxFEg7csUXtIV29lJrk=;
        b=SVfiFQtOYFa8vQUvYDmz3+JP27jTH3Is0VwBMhA6brpEQX6aqVVE7v8XoIXC2B/T9i
         /UUxqtpgP8QO3Lz0YUWWU9MDmV1vJOLSFZMOysi8BLFxWrHc5VPheqvm98i9KTmFnUFr
         QwLI7RApDDvh+pUFnpt7EfC8Nku9Bg4kLh5UKrH+hJ9giAWHOpBu3lgpQ8uZtQ9pRB9F
         L2V92yUWWTyMa2+ZzPWJGShHBSbJogVxfj+9recRWgOTjg2lm2LmwV1MVGqWZhA56P6n
         fEeHYGhjGnB1RJLuT6vCfwt+zfqcSizQCF1l+GZVM8ew92ojJ9hqFkEkNRQxB6Y44PQq
         F0oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=n+R+IbGIJxakdbmAkfda0p2uyxFEg7csUXtIV29lJrk=;
        b=MUBE4czwxNJ5K0+gsyD/7pHha6ughkwfRAzZAoqeiP+8mamBs2xYNPlB4kyp7XRDHg
         xT4eujr2+SwCzWjGqWlealRLexD1M4KOxKov5ZpoHLS1AtqGf9GRrPrCNUz/eqBTaxjU
         Vh45L4YYS4jWbPR2QwZdJ66rArJ/ez0LCv2seR9Z0R6W5qv/cAoYgMUhuv/9lR5HeHbw
         mu0Dl+/XH/Hbp4a7p9m8dqK8+KX5VDnwVo7wchZShi7/vEvXrTQIWb6sIoOB/QZPLRwa
         +w6WSVcADsdNJR3TExnqg6Se0lHYgQ/JRZnZxGPa8xnO2VjPgAdB3IlgnBms5N4y0xuN
         +JlQ==
X-Gm-Message-State: AOAM5315ZJRmc8I5eQZeQuoQY0Nk+dEwMQBZea92pPwEzWl4rkcAZ1oE
        ZNsRn1cSi1tCU9w3ebDvdzXUETDr4xgUzh5Q/34=
X-Google-Smtp-Source: ABdhPJzSxXRdGlZlEI7MXIMrUWEtGzO5f0hDcafc4ky8LbiK1uaq02psrtbhIjdejT+lZH8d5Mxsu4uDoIOyzBPaSLE=
X-Received: by 2002:ac2:5f95:: with SMTP id r21mr690659lfe.209.1603795610496;
 Tue, 27 Oct 2020 03:46:50 -0700 (PDT)
MIME-Version: 1.0
References: <1603784069-24114-1-git-send-email-u0084500@gmail.com>
 <20201027082900.GA21354@amd> <CADiBU3915nyB2OE_bqPy8kVqPhKbdTpBe8ay_ZAoFwuJoL-BfQ@mail.gmail.com>
 <20201027101535.GB13900@duo.ucw.cz>
In-Reply-To: <20201027101535.GB13900@duo.ucw.cz>
From:   ChiYuan Huang <u0084500@gmail.com>
Date:   Tue, 27 Oct 2020 18:46:39 +0800
Message-ID: <CADiBU39rQ=5vk31caa1rv32eyzFrYB78p8GubpSi21DS5JYQkA@mail.gmail.com>
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
=E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=886:15=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi!
>
> > > Please use upper-case "LED" everywhere.
> > >
> > > This should be 2nd in the series, after DT changes.
> > Sure, will ack in next series patch.
>
> Feel free to wait for dt ACKs before resending.
>
Yes, sure.
> > > > +     help
> > > > +       This option enables support for the RT4505 flash led contro=
ller.
> > >
> > > Information where it is used would be welcome here.
> > How about to add the below line for the extra information?
> > Usually used to company with the camera device on smartphone/tablet
> > products
>
> Yes, that would help.
>
> "It is commonly used in smartphones, such as Bell Packard T899" would
> be even better.

Sorry, We don't focus on specific products. It's a general part flash
led controller.
I'll change it like as below
"It's commonly used in smartphones and tablets to assist the builtin camera=
."
>
> > > > +     ret =3D regmap_update_bits(priv->regmap, RT4505_REG_ENABLE, R=
T4505_ENABLE_MASK, val);
> > > > +
> > > > +unlock:
> > > > +     mutex_unlock(&priv->lock);
> > > > +     return ret;
> > > > +}
> > >
> > > Why is the locking needed? What will the /sys/class/leds interface
> > > look like on system with your flash?
> >
> > The original thought is because there's still another way to control
> > flash like as v4l2.
> > But after reviewing the source code, led sysfs node will be protected
> > by led_cdev->led_access.
> > And V4L2 flash will also be protected by v4l2_fh_is_singular API.
> > I think the whole locking in the source code code may be removed. Right=
?
>
> Well, maybe you need it, I did not check..
>
> What will the /sys/class/leds interface look like on system with your fla=
sh?
>
> > > > +     *state =3D ((val & RT4505_FLASH_GET) =3D=3D RT4505_FLASH_GET)=
 ? true : false;
> > >
> > > No need for ? ... part.
> > Do you mean this function is not needed? If yes, it can be removed.
> > But if it removed, led sysfs flash_strobe show will be not supported.
>
> I meant "replace line with: *state =3D (val & RT4505_FLASH_GET) =3D=3D RT=
4505_FLASH_GET;"
Oh, I got it. redundant judgement.
>
> > > > +static bool rt4505_is_accessible_reg(struct device *dev, unsigned =
int reg)
> > > > +{
> > > > +     if (reg =3D=3D RT4505_REG_RESET || (reg >=3D RT4505_REG_CONFI=
G  && reg <=3D RT4505_REG_FLAGS))
> > > > +             return true;
> > >
> > > Make this two stagements.
> > Like as the below one?? Or separate it into two if case.
> > if (reg =3D=3D RT4505_REG_RESET ||
> >        reg >=3D RT4505_REG_CONFIG  && reg <=3D RT4505_REG_FLAGS))
>
> That would be fine, too... if you use just one space before "&&" :-).
Thx.
>
> Best regards,
>                                                         Pavel
> --
> http://www.livejournal.com/~pavelmachek
