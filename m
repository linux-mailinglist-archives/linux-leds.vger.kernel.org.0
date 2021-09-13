Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB0D24087FE
	for <lists+linux-leds@lfdr.de>; Mon, 13 Sep 2021 11:16:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238319AbhIMJSI (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 13 Sep 2021 05:18:08 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:55952 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238002AbhIMJSI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 13 Sep 2021 05:18:08 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id BA57F1C0BA4; Mon, 13 Sep 2021 11:16:51 +0200 (CEST)
Date:   Mon, 13 Sep 2021 11:16:50 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Donovan Drews <donovancarldrews@gmail.com>
Cc:     linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: lp50xx: Fix bank enable mask
Message-ID: <20210913091650.GA11752@amd>
References: <20210828214253.16207-1-donovancarldrews@gmail.com>
 <CAHP10D8mwCb-_dacVDiLTQkr-YzppNAydR76kSG=YP-xZhK0Uw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="cNdxnHkX5QqsyA0e"
Content-Disposition: inline
In-Reply-To: <CAHP10D8mwCb-_dacVDiLTQkr-YzppNAydR76kSG=YP-xZhK0Uw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--cNdxnHkX5QqsyA0e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun 2021-09-12 13:54:26, Donovan Drews wrote:
> Just bumping this patch in case it was overlooked.

Please don't. Patches are not usually merged during the -rc1 time.

Best regards,
								Pavel

> On Sat, Aug 28, 2021 at 2:43 PM DonDrews <donovancarldrews@gmail.com> wro=
te:
>=20
> >         Fixes an issue where previously 0 is used as a sentinel when
> >         moving device tree configuration into the bank enable mask. This
> >         prevented the first LED from being added to bank control.
> >
> > Signed-off-by: DonDrews <donovancarldrews@gmail.com>
> > ---
> >  drivers/leds/leds-lp50xx.c | 10 ++++------
> >  1 file changed, 4 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
> > index 401df1e2e05d..45f56caea182 100644
> > --- a/drivers/leds/leds-lp50xx.c
> > +++ b/drivers/leds/leds-lp50xx.c
> > @@ -347,17 +347,15 @@ static int lp50xx_brightness_set(struct led_class=
dev
> > *cdev,
> >         return ret;
> >  }
> >
> > -static int lp50xx_set_banks(struct lp50xx *priv, u32 led_banks[])
> > +static int lp50xx_set_banks(struct lp50xx *priv, u32 led_banks[], int
> > num_leds)
> >  {
> >         u8 led_config_lo, led_config_hi;
> >         u32 bank_enable_mask =3D 0;
> >         int ret;
> >         int i;
> >
> > -       for (i =3D 0; i < priv->chip_info->max_modules; i++) {
> > -               if (led_banks[i])
> > -                       bank_enable_mask |=3D (1 << led_banks[i]);
> > -       }
> > +       for (i =3D 0; i < num_leds; i++)
> > +               bank_enable_mask |=3D (1 << led_banks[i]);
> >
> >         led_config_lo =3D bank_enable_mask;
> >         led_config_hi =3D bank_enable_mask >> 8;
> > @@ -413,7 +411,7 @@ static int lp50xx_probe_leds(struct fwnode_handle
> > *child, struct lp50xx *priv,
> >                         return ret;
> >                 }
> >
> > -               ret =3D lp50xx_set_banks(priv, led_banks);
> > +               ret =3D lp50xx_set_banks(priv, led_banks, num_leds);
> >                 if (ret) {
> >                         dev_err(priv->dev, "Cannot setup banked LEDs\n"=
);
> >                         return ret;
> > --
> > 2.17.1
> >
> >

--=20
http://www.livejournal.com/~pavelmachek

--cNdxnHkX5QqsyA0e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmE/FwEACgkQMOfwapXb+vLMBACgqOVs0eLeXvSN+cwHtBR9lFN7
YYoAoJDMulPWFhHrei7xsb/p/xIzbFbV
=Ogsm
-----END PGP SIGNATURE-----

--cNdxnHkX5QqsyA0e--
