Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DD11263EFD
	for <lists+linux-leds@lfdr.de>; Thu, 10 Sep 2020 09:49:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726228AbgIJHtw (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 10 Sep 2020 03:49:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728626AbgIJHtq (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 10 Sep 2020 03:49:46 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04F8FC061573;
        Thu, 10 Sep 2020 00:49:45 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id z13so6043445iom.8;
        Thu, 10 Sep 2020 00:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1PTiGOyennkCERiFVjnl2rpLQDxKh0UO1rwGXhcdHGQ=;
        b=vfyHU6z2AJeojj+DWgkbr8McnduBaV7heEabpt0g7kNPwmEEG10g4cZCf2g5RoUr8L
         Q9mrImohY/lrKLwhtTFKLikxUndWYRFzDTnnIPRyDhfOoe4z4P/rrfporvWxZjZQYhD6
         OduT7XQZbzNZhau4enoa/5whfKYXaBewGG8T1EMPWpUwZ5lRtug1Pyx7inuxUi1oOcxD
         gqtstBvTo5Sc7MjPW5IZT8o10fx+6AGZ9jn7DhZm0e0hFgln4T5seRFyRHUZOYGQL3lf
         qTbGjWNYed3kKGn9WQW/wwK5Gj+cSixputaA11nRgAQ9aXfQ9gSIz2/G+2rIJ2JJHM5N
         Suvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1PTiGOyennkCERiFVjnl2rpLQDxKh0UO1rwGXhcdHGQ=;
        b=o6fhXTSvn8MFlWEAKO/LN7wIEwOvJFPGB9BvGds5fRX9+25UdPl/FQQw9ga9W91r/C
         GpjAaGKN0ranep6y8jURWw9W7vtZt4BZooEj8cF4fWBsWOlE/6a1pRlUmNqzNf/O72IN
         OD33rgSvCrdooGyPb09ZugNtGi4Df/17bWJKvrSp8GvSZ6HCKaDU1/RhO6LAbpcihh1p
         a7IAx/N9K+rSsKwk/NZSpQgINDinC4+zPS0VDZLEylRXlVffXJ+wbaavO0kURNMJw7Mh
         KAEHeXG+XbqtNgFric4/W1BkU/+kt6iGEzZ/haUkUPzXykP/CbywH6RcPQ3WSIDWfZZh
         JGIw==
X-Gm-Message-State: AOAM533MCuRKxeTZ22m/JNaHY22M7LhaAIpr21r5za0gq+ekOWvbLXi4
        K93K2fsgRmmkjbCqbhzdFQ/RluFo+FyNsl1LioNJRSFDZu4=
X-Google-Smtp-Source: ABdhPJwgD4ZKx8mYopgg3XNY+Per6BffD+Xe9MaqvAy593SfYzFkMrwyS/vdUj1XLskp7sbFyMsOb1GTewknce7HAXI=
X-Received: by 2002:a02:ce8c:: with SMTP id y12mr7734842jaq.53.1599724185207;
 Thu, 10 Sep 2020 00:49:45 -0700 (PDT)
MIME-Version: 1.0
References: <1599474459-20853-1-git-send-email-gene.chen.richtek@gmail.com>
 <1599474459-20853-2-git-send-email-gene.chen.richtek@gmail.com> <20200908222544.GF1005@bug>
In-Reply-To: <20200908222544.GF1005@bug>
From:   Gene Chen <gene.chen.richtek@gmail.com>
Date:   Thu, 10 Sep 2020 07:49:33 +0800
Message-ID: <CAE+NS34h9qbdHkYDYDnHGgk+9mFNTRpKEMKNEFZ+Secf6JyoZg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] leds: mt6360: Add LED driver for MT6360
To:     Pavel Machek <pavel@ucw.cz>
Cc:     jacek.anaszewski@gmail.com, robh+dt@kernel.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Gene Chen <gene_chen@richtek.com>, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel Machek <pavel@ucw.cz> =E6=96=BC 2020=E5=B9=B49=E6=9C=889=E6=97=A5 =E9=
=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=886:25=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi!
>
> > From: Gene Chen <gene_chen@richtek.com>
> >
> > Add MT6360 LED driver include 2-channel Flash LED with torch/strobe mod=
e,
> > and 4-channel RGB LED support Register/Flash/Breath Mode
> >
> > Signed-off-by: Gene Chen <gene_chen@richtek.com>
> > ---
> >  drivers/leds/Kconfig       |  11 +
> >  drivers/leds/Makefile      |   1 +
> >  drivers/leds/leds-mt6360.c | 681 +++++++++++++++++++++++++++++++++++++=
++++++++
> >  3 files changed, 693 insertions(+)
> >  create mode 100644 drivers/leds/leds-mt6360.c
> >
> > +     help
> > +       This option enables support for dual Flash LED drivers found on
> > +       Mediatek MT6360 PMIC.
> > +       Independent current sources supply for each flash LED support t=
orch and strobe mode.
> > +       Includes Low-VF and short protection.
> > +
>
> 80 columns. And perhaps user does not need to know about protections... a=
nd actually
> about independend sources, either.
>

ACK

> "Enable this for RGB LED and flash LED support on..."?
>
> > +static int mt6360_torch_brightness_set(struct led_classdev *lcdev, enu=
m led_brightness level)
> > +{
> > +     struct mt6360_led *led =3D container_of(lcdev, struct mt6360_led,=
 flash.led_cdev);
> > +     struct mt6360_priv *priv =3D led->priv;
> > +     u32 enable_mask =3D MT6360_TORCHEN_MASK | MT6360_FLCSEN_MASK(led-=
>led_no);
> > +     u32 val =3D (level) ? MT6360_FLCSEN_MASK(led->led_no) : 0;
> > +     u32 prev =3D priv->fled_torch_used, curr;
> > +     int ret;
> > +
> > +     dev_dbg(lcdev->dev, "[%d] brightness %d\n", led->led_no, level);
> > +     if (priv->fled_strobe_used) {
> > +             dev_warn(lcdev->dev, "Please disable strobe first [%d]\n"=
, priv->fled_strobe_used);
> > +             return -EINVAL;
> > +     }
>
> So... how does its userland interface look like?
>

1. set FLED1 brightness
# echo 1 > /sys/class/leds/white:flash1/flash_brightness
2. enable FLED1 strobe
# echo 1 > /sys/class/leds/white:flash1/flash_strobe
3 . turn off FLED1 strobe (just used to gaurantee the strobe mode
flash leds must be turned off)
# echo 0 > /sys/class/leds/white:flash1/flash_strobe

> Best regards,
>                                                                         P=
avel
> --
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/b=
log.html
