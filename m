Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4670B31B6B2
	for <lists+linux-leds@lfdr.de>; Mon, 15 Feb 2021 10:50:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230254AbhBOJtq (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 15 Feb 2021 04:49:46 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:59292 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230300AbhBOJtq (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 15 Feb 2021 04:49:46 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 340731C0B76; Mon, 15 Feb 2021 10:49:02 +0100 (CET)
Date:   Mon, 15 Feb 2021 10:49:00 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Arnd Bergmann <arnd@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>, Dan Murphy <dmurphy@ti.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] leds: rt8515: add V4L2_FLASH_LED_CLASS dependency
Message-ID: <20210215094900.GA27528@amd>
References: <20210204153951.1551156-1-arnd@kernel.org>
 <CACRpkdYpHAN5XYLxRj4Rktzj+LbGRFYwtUU72gqUwE=AEt0j6g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="qDbXVdCdHGoSgWSk"
Content-Disposition: inline
In-Reply-To: <CACRpkdYpHAN5XYLxRj4Rktzj+LbGRFYwtUU72gqUwE=AEt0j6g@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--qDbXVdCdHGoSgWSk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > The leds-rt8515 driver can optionall use the v4l2 flash led class,
> > but it causes a link error when that class is in a loadable module
> > and the rt8515 driver itself is built-in:
> >
> > ld.lld: error: undefined symbol: v4l2_flash_init
> > >>> referenced by leds-rt8515.c
> > >>>               leds/flash/leds-rt8515.o:(rt8515_probe) in archive
> > drivers/built-in.a
> >
> > Adding 'depends on V4L2_FLASH_LED_CLASS' in Kconfig would avoid that,
> > but it would make it impossible to use the driver without the
> > v4l2 support.
> >
> > Add the same dependency that the other users of this class have
> > instead, which just prevents the broken configuration.
> >
> > Fixes: e1c6edcbea13 ("leds: rt8515: Add Richtek RT8515 LED driver")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>=20
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>=20
> > +       depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
>=20
> This kind of thing that looks like a truism but isn't is one of the
> most unintuitive
> things about KConfig :/ no idea what to do about it though.

This is the way it is usually fixed. Anyway, I applied it and pushed
it to Linus and it is now merged.

> I remember making a program for the C64 in early 1990ies with joke input
> such as y/n/m (yes/no/maybe), sadly in Kconfig this is no joke.

:-).

Best regards,
									Pavel
--=20
http://www.livejournal.com/~pavelmachek

--qDbXVdCdHGoSgWSk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmAqQ4wACgkQMOfwapXb+vJ84wCePlrB8GFpTx6yYq42G0Et6bnE
gywAoIIxpXsLxLBNQVJHh2dDlDsr/FYJ
=Uyd8
-----END PGP SIGNATURE-----

--qDbXVdCdHGoSgWSk--
