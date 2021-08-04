Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A6233E0511
	for <lists+linux-leds@lfdr.de>; Wed,  4 Aug 2021 17:59:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239688AbhHDP7y (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 4 Aug 2021 11:59:54 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:39246 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239291AbhHDP7x (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 4 Aug 2021 11:59:53 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id F15DD1C0B76; Wed,  4 Aug 2021 17:59:39 +0200 (CEST)
Date:   Wed, 4 Aug 2021 17:59:39 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Sicelo <absicsz@gmail.com>
Cc:     linux-leds@vger.kernel.org
Subject: Re: lp5523/lp5xx-common : Keyboard and RGB LEDs Not Working on Nokia
 N900
Message-ID: <20210804155939.GC25072@amd>
References: <YHXOotfNMEdG9oXQ@tp440p.steeds.sam>
 <YIV1uaHQwjq0CoFy@tp440p.steeds.sam>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="XMCwj5IQnwKtuyBG"
Content-Disposition: inline
In-Reply-To: <YIV1uaHQwjq0CoFy@tp440p.steeds.sam>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--XMCwj5IQnwKtuyBG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > For some time now, the keyboard LEDs on Nokia N900 have not been
> > working. In dmesg is the error:
> >  =20
> >     lp5523x probe of 2-0032 failed with error -22
> >=20
> > and consequently they do not get populated under /sys/class/leds.
> >=20
> > I have finally had time to look into this, and found that the N900 dts
> > falls short of the current lp55xx binding specs. I have updated it and
> > will be submitting a separate patch. However, this was not enough to
>=20
> I have since realized that I should have included the adjusted dts in
> the initial email. Please find it attached in this follow-up email and
> sincere apologies for this ommission.
>=20
> > make them work, and a new error appeared:
> >=20
> >     [11363.247375] lp5523x 2-0032: GPIO lookup for consumer enable
> >     [11363.254394] lp5523x 2-0032: using device tree for GPIO lookup
> >     [11363.254455] of_get_named_gpiod_flags: can't parse 'enable-gpios'=
 property of node '/ocp@68000000/i2c@48072000/lp5523@32[0]'
> >     [11363.254547] of_get_named_gpiod_flags: parsed 'enable-gpio' prope=
rty of node '/ocp@68000000/i2c@48072000/lp5523@32[0]' - status (0)
> >     [11363.254638] gpio gpiochip1: Persistence not supported for GPIO 9
> >     [11363.254669] gpio-41 (enable): no flags found for enable
> >     [11363.295959] lp5523x 2-0032: device detection err: -121
> >     [11363.303710] lp5523x: probe of 2-0032 failed with error -121
> >=20
> >=20
> > This is because the chip does not get enabled even though dts contains:
> >=20
> >     enable-gpios =3D <&gpio2 9 GPIO_ACTIVE_HIGH>; /* 41 */
> >=20
> > which is correct for this board.
> >=20
> >=20
> > I came up with this patch (against 5.12-rc6), which makes it work again.
> >=20
> >=20
> > diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55=
xx-common.c
> > index 81de1346bf5d..9af84fc335b3 100644
> > --- a/drivers/leds/leds-lp55xx-common.c
> > +++ b/drivers/leds/leds-lp55xx-common.c
> > @@ -694,7 +694,7 @@ struct lp55xx_platform_data *lp55xx_of_populate_pda=
ta(struct device *dev,
> >         of_property_read_u8(np, "clock-mode", &pdata->clock_mode);
> >=20
> >         pdata->enable_gpiod =3D devm_gpiod_get_optional(dev, "enable",
> > -                                                     GPIOD_ASIS);
> > +                                                     GPIOD_OUT_HIGH);
> >         if (IS_ERR(pdata->enable_gpiod))
> >                 return ERR_CAST(pdata->enable_gpiod);

This does not look obviously bad. If this is sent as patch I can
simply apply, I'll likely do it.

> > However, I am not sure if this is a proper way to fix the issue, or if
> > it is a dirty hack. It looks like all the chips handled by this driver
> > (lp5521, lp5523, lp5562, and lp8501) get enabled by pulling their ENable
> > pin high, so I suppose it is fine, but would like to get some feedback
> > before submitting a cleaned up patch. It is also possible that this
> > should be defined via dts elsewhere, although at this point I am not
> > sure how.
> >=20
> > Looking forward to your help.

But I can't take dts changes; these should likely be in same series
and cc-ed to relevant maintainers.

Best regards,
							Pavel
--=20
http://www.livejournal.com/~pavelmachek

--XMCwj5IQnwKtuyBG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmEKuWoACgkQMOfwapXb+vJr0gCgiDdsZ+9wmMjM1VzViYAfdkUQ
x3gAnRydVt+FLslyrNQp1CFwDrcM61Tf
=BOCn
-----END PGP SIGNATURE-----

--XMCwj5IQnwKtuyBG--
