Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F157C32B222
	for <lists+linux-leds@lfdr.de>; Wed,  3 Mar 2021 04:48:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232530AbhCCCiz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 2 Mar 2021 21:38:55 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:34006 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376822AbhCBIPA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 2 Mar 2021 03:15:00 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 65DF81C0B88; Tue,  2 Mar 2021 09:11:25 +0100 (CET)
Date:   Tue, 2 Mar 2021 09:11:24 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     kernel test robot <lkp@intel.com>, linux-leds@vger.kernel.org,
        Amireddy Mallikarjuna reddy 
        <mallikarjunax.reddy@linux.intel.com>, kbuild-all@lists.01.org,
        clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org
Subject: Re: drivers/leds/blink/leds-lgm-sso.c:123:19: error: field has
 incomplete type 'struct gpio_chip'
Message-ID: <20210302081124.GA10699@amd>
References: <202102280329.hv7RoHLA-lkp@intel.com>
 <20210228082913.GA27151@amd>
 <c4071c07-e882-96ca-a8fb-34ad1525305f@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Content-Disposition: inline
In-Reply-To: <c4071c07-e882-96ca-a8fb-34ad1525305f@infradead.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >>>> drivers/leds/blink/leds-lgm-sso.c:263:3: error: implicit declaration=
 of function 'gpiod_set_value' [-Werror,-Wimplicit-function-declaration]
> >>                    gpiod_set_value(led->gpiod, val);
> >>                    ^
> >>    drivers/leds/blink/leds-lgm-sso.c:263:3: note: did you mean
> >>                    'gpio_set_value'?
> >=20
> >=20
> > It looks like missing #include?
> >=20
> > While at it, can you do something with Kconfig help text? Move
> > existing one into comment in the driver, add something useful for end-u=
sers.
>=20
> The .config file does not set/enable GPIOLIB nor OF.
>=20
> AFAICT, this driver needs the addition of:
>=20
> #include <linux/gpio/consumer.h>
> #include <linux/gpio/driver.h>
> #include <linux/of.h>
>=20
> and the reference to
> 	gc->of_node           =3D dev->of_node;
> needs to be inside an
> #ifdef CONFIG_GPIO/#endif block.
>=20
> Also, <linux/gpio/driver.h> needs a stub for gpiochip_get_data().
>=20
> I have most of that ready (it's in the margin) but I can't
> send it tonight. Feel free to fix it up however you want to.

Looking forward. I may be confused, but it looks like original
author's email bounces, which is a bad sign.

What I meant... if you take a look at Kconfig help test, it is really
useless.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmA98ywACgkQMOfwapXb+vIiowCfeHP1kO+yiHNCiS1h/Vt4ADQ/
S4kAoMFlF0dR2l3F5Fb9DAVHFEI05cl3
=4l87
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--
