Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91616177433
	for <lists+linux-leds@lfdr.de>; Tue,  3 Mar 2020 11:30:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728372AbgCCKa4 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 3 Mar 2020 05:30:56 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:34248 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726661AbgCCKa4 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 3 Mar 2020 05:30:56 -0500
Received: by mail-io1-f68.google.com with SMTP id z190so3019193iof.1
        for <linux-leds@vger.kernel.org>; Tue, 03 Mar 2020 02:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=rcEtCWKyY4PJ5b6fVubScAwepmUAP7J4BWcDeedIssM=;
        b=jzn3p0giF74SiOTaPBBqqwDI1b0SOsC+P1EyQ68f0CbyR7bE9oYIbB+0a6w6cfEYrJ
         oOtgh0b/CBrALw3Q455v/s8fp+IZB3q1rztlabfaJxxrERqw9t1k711MRMmoZpgC9+w6
         zq0cUxoA8/TpF5j/xaBuAcvWlYMMvIbGcE96RSB4e2nI0qt+eRRAvntl4R8+9+58ugwJ
         1kzV/4Md7+Iq4J52YfoPSjWx9T1XTDxsOe9nOqwhf6k7+kwFI9xZ+LyzWuWwYxB68AC8
         PWXghlepTFKWHKMihlXM8ZAAUOFIc9vO9bIAL1kAW3cxxsN+leusc3D69V35udeAzLvL
         6VgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=rcEtCWKyY4PJ5b6fVubScAwepmUAP7J4BWcDeedIssM=;
        b=lSh/3JddXJWxRPYQHZt9Nl6Xt462FH9tQXx401QtWVVcmtUItURS+wVq/wIeh2pS5s
         aNAnwq11gHgp37Z/iWC0SXNmuw6sJJMiM2ihZY8D/eNf+ZGMCKHuy9OBVX3lhJQ78qUF
         IbQ3PA+1atLvOWU8Csc1v9MNdvEFHy2rW+FTLnpKPwnCFyTBSCzUOo1X1mQH6RKT6CDf
         Y2JBi+WkG21u3k5Aym1oZP7gCGICn3QmH8rkepsPBssVYUUPVksTgEytvd2OLuiZ1IdJ
         sE1M6EauyzboSBVhvFZiJn4BE79CHni/jxonPxXuQmDiq7eqarWWoDetm3+QirhPFTtf
         kavA==
X-Gm-Message-State: ANhLgQ01wofGNSCW8f6POQI9kNnNvYbzYkkYSjUW/S9887k1gzVaPI0/
        TfgxfBX3acZt6GnE2mgcqq4NhYNOeyQ1eGc+Raehond4zQ8=
X-Google-Smtp-Source: ADFU+vt0bR6kRdtKjr1dnQJ/JQs/OxNGUrTFNgAlZs41aO3YFGhwEoeDQRPPXNaqFM9Mz1ZZRQzyrph169enxq6eJXM=
X-Received: by 2002:a6b:f209:: with SMTP id q9mr3506518ioh.197.1583231455856;
 Tue, 03 Mar 2020 02:30:55 -0800 (PST)
MIME-Version: 1.0
References: <1582727592-4510-1-git-send-email-nbelin@baylibre.com>
 <1582727592-4510-4-git-send-email-nbelin@baylibre.com> <85f536f0-0078-08a5-5eeb-e401d1ed8782@gmail.com>
In-Reply-To: <85f536f0-0078-08a5-5eeb-e401d1ed8782@gmail.com>
From:   Nicolas Belin <nbelin@baylibre.com>
Date:   Tue, 3 Mar 2020 11:30:45 +0100
Message-ID: <CAJZgTGFMks7Fm+tWpYAAjxBLgD0nk9cfBiVZcAhojaXCvqfLPA@mail.gmail.com>
Subject: Re: [PATCH RFC v2 3/3] drivers: leds: add support for apa102c leds
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        devicetree@vger.kernel.org, baylibre-upstreaming@groups.io
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Jacek,

That's a shame that it is not going to be upstreamed soon as it making
my led driver much nicer :)
So what's the plan with the multicolor framework?
I am happy to send a new version to fix your remark and then adapt my
driver to the future changes in the Framework.

Let me know what you think.

Thanks,

Regards,

Nicolas

Le mer. 26 f=C3=A9vr. 2020 =C3=A0 21:14, Jacek Anaszewski
<jacek.anaszewski@gmail.com> a =C3=A9crit :
>
> Hi Nicolas,
>
> Regardless of the fact that LED mc framework in current shape
> will probably not materialize in mainline, I have single
> remark regarding LED initialization. Please take a look below.
>
> On 2/26/20 3:33 PM, Nicolas Belin wrote:
> > Initilial commit in order to support the apa102c RGB leds. This
> > is based on the Multicolor Framework.
> >
> > Reviewed-by: Corentin Labbe <clabbe@baylibre.com>
> > Signed-off-by: Nicolas Belin <nbelin@baylibre.com>
> > ---
> >  drivers/leds/Kconfig        |   7 ++
> >  drivers/leds/Makefile       |   1 +
> >  drivers/leds/leds-apa102c.c | 291 ++++++++++++++++++++++++++++++++++++=
++++++++
> >  3 files changed, 299 insertions(+)
> >  create mode 100644 drivers/leds/leds-apa102c.c
> >
> > diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> > index 5dc6535a88ef..71e29727c6ec 100644
> > --- a/drivers/leds/Kconfig
> > +++ b/drivers/leds/Kconfig
> > @@ -79,6 +79,13 @@ config LEDS_AN30259A
> >         To compile this driver as a module, choose M here: the module
> >         will be called leds-an30259a.
> >
> > +config LEDS_APA102C
> > +     tristate "LED Support for Shiji APA102C"
> > +     depends on SPI
> > +     depends on LEDS_CLASS_MULTI_COLOR
> > +     help
> > +       This option enables support for APA102C LEDs.
> > +
> >  config LEDS_APU
> >       tristate "Front panel LED support for PC Engines APU/APU2/APU3 bo=
ards"
> >       depends on LEDS_CLASS
> > diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> > index b5305b7d43fb..8334cb6dc7e8 100644
> [...]
> > +
> > +             led->priv                       =3D priv;
> > +             led->ldev.max_brightness        =3D MAX_BRIGHTNESS;
> > +             fwnode_property_read_string(child, "linux,default-trigger=
",
> > +                                         &led->ldev.default_trigger);
> > +
> > +             init_data.fwnode =3D child;
> > +             init_data.devicename =3D APA_DEV_NAME;
> > +             init_data.default_label =3D ":";
>
> devicename property should be filled in new drivers only in case
> devname_mandatory is set to true.
> default_label property is for legacy drivers, for backward compatibility
> with old LED naming convention.
>
> For more information please refer to:
> - Documentation/leds/leds-class.rst, "LED Device Naming" section
> - struct led_init_data documention in linux/leds.h
>
> In effect you need only fwnode here,
>
> > +
> > +             num_colors =3D 0;
> > +             fwnode_for_each_child_node(child, grandchild) {
> > +                     ret =3D fwnode_property_read_u32(grandchild, "col=
or",
> > +                                                    &color_id);
> > +                     if (ret) {
> > +                             dev_err(priv->dev, "Cannot read color\n")=
;
> > +                             goto child_out;
> > +                     }
> > +
> > +                     set_bit(color_id, &led->mc_cdev.available_colors)=
;
> > +                     num_colors++;
> > +             }
> > +
> > +             if (num_colors !=3D 3) {
> > +                     ret =3D -EINVAL;
> > +                     dev_err(priv->dev, "There should be 3 colors\n");
> > +                     goto child_out;
> > +             }
> > +
> > +             if (led->mc_cdev.available_colors !=3D IS_RGB) {
> > +                     ret =3D -EINVAL;
> > +                     dev_err(priv->dev, "The led is expected to be RGB=
\n");
> > +                     goto child_out;
> > +             }
> > +
> > +             led->mc_cdev.num_leds =3D num_colors;
> > +             led->mc_cdev.led_cdev =3D &led->ldev;
> > +             led->ldev.brightness_set_blocking =3D apa102c_brightness_=
set;
> > +             ret =3D devm_led_classdev_multicolor_register_ext(priv->d=
ev,
>
> --
> Best regards,
> Jacek Anaszewski



--=20
Nicolas Belin
Software design engineer
BayLibre
www.baylibre.com
