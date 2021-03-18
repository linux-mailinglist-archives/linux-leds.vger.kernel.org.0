Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83B71340F40
	for <lists+linux-leds@lfdr.de>; Thu, 18 Mar 2021 21:37:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233115AbhCRUhO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 18 Mar 2021 16:37:14 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:48580 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233084AbhCRUhN (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 18 Mar 2021 16:37:13 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 887E31C0B7C; Thu, 18 Mar 2021 21:37:12 +0100 (CET)
Date:   Thu, 18 Mar 2021 21:37:12 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Rahul Tanwar <rtanwar@maxlinear.com>
Cc:     Arnd Bergmann <arnd@kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Adam Borowski <kilobyte@angband.pl>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        John Crispin <john@phrozen.org>,
        Hauke Mehrtens <hmehrtens@maxlinear.com>,
        Cheol Yong Kim <ckim@maxlinear.com>,
        Qiming Wu <qwu@maxlinear.com>
Subject: Re: [PATCH 1/1] leds: lgm: Improve Kconfig help
Message-ID: <20210318203711.GA8429@amd>
References: <8ae0456a08ef1a2491fd382b273ff7259e6fcbd0.1615969806.git.rtanwar@maxlinear.com>
 <MN2PR19MB3693EEA37EA1FC18238FE45EB16A9@MN2PR19MB3693.namprd19.prod.outlook.com>
 <20210318075552.GA2331@amd>
 <MN2PR19MB3693318349FCCF3201E8EA80B1699@MN2PR19MB3693.namprd19.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="wac7ysb48OaltWcw"
Content-Disposition: inline
In-Reply-To: <MN2PR19MB3693318349FCCF3201E8EA80B1699@MN2PR19MB3693.namprd19.prod.outlook.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--wac7ysb48OaltWcw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!


> >  > help
> >  > - Parallel to serial conversion, which is also called SSO
> >  > controller,
> >  > - can drive external shift register for LED outputs.
> >  > - This enables LED support for Serial Shift Output controller(SSO).
> >  > + This option enables support for LEDs connected to GPIO lines on
> >  > + Lightning Mountain(LGM) SoC. These LEDs are driven by a Serial
> >  > + Shift Output(SSO) controller. The driver supports hardware
> >=20
> > What is Lightning Mountain? The codename is not widely known. Where
> > can we find that hardware? Notebooks? Phones? Only some development
> > boards?
> >=20
>=20
> Lightning Mountain is generically a network processor with a primary=20
> targeted application as Gateway SoC. It has already been added as a=20
> valid Intel Atom processor variant in=20
> arch/x86/include/asm/intel-family.h as below:

Yep, but Kconfig users are not going to read header files.

If the SoC is not shipping in any products, state so.

> >  > *
> >  > - * Copyright (c) 2020 Intel Corporation.
> >  > + * Copyright (c) 2021 MaxLinear, Inc.
> >  > */
> >  >
> >=20
> > I don't think you can do that, and I don't think you should be doing
> > it in the same patch.
>=20
> Well noted. Will revert it back now and update later in a separate=20
> patch. Thanks.

Don't. You can't update copyright like that.

								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--wac7ysb48OaltWcw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmBTufcACgkQMOfwapXb+vIi6wCgh+jfNVDq4t4Lp0ipP1ajsy82
O+0AniEb6gxxkylOv0nwB3vg7woAnh13
=HWCd
-----END PGP SIGNATURE-----

--wac7ysb48OaltWcw--
