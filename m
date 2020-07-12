Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A727E21C833
	for <lists+linux-leds@lfdr.de>; Sun, 12 Jul 2020 11:07:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728264AbgGLJHf (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 12 Jul 2020 05:07:35 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:52998 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728070AbgGLJHf (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 12 Jul 2020 05:07:35 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 7B1901C0BD2; Sun, 12 Jul 2020 11:07:32 +0200 (CEST)
Date:   Sun, 12 Jul 2020 11:07:31 +0200
From:   Pavel Machek <pavel@denx.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Pavel Machek <pavel@denx.de>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, Jiri Slaby <jslaby@suse.com>,
        kernel@pengutronix.de, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v7 3/3] leds: trigger: implement a tty trigger
Message-ID: <20200712090731.GB13495@amd>
References: <20200707165958.16522-1-u.kleine-koenig@pengutronix.de>
 <20200707165958.16522-4-u.kleine-koenig@pengutronix.de>
 <20200712082453.GI8295@amd>
 <20200712084352.GA175558@kroah.com>
 <20200712085059.GA13495@amd>
 <20200712090217.GA177304@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="z6Eq5LdranGa6ru8"
Content-Disposition: inline
In-Reply-To: <20200712090217.GA177304@kroah.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--z6Eq5LdranGa6ru8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun 2020-07-12 11:02:17, Greg Kroah-Hartman wrote:
> On Sun, Jul 12, 2020 at 10:50:59AM +0200, Pavel Machek wrote:
> > On Sun 2020-07-12 10:43:52, Greg Kroah-Hartman wrote:
> > > On Sun, Jul 12, 2020 at 10:24:53AM +0200, Pavel Machek wrote:
> > > > > +++ b/drivers/leds/trigger/ledtrig-tty.c
> > > > > @@ -0,0 +1,192 @@
> > > > > +// SPDX-License-Identifier: GPL-2.0
> > > >=20
> > > > 2.0+ is preffered.
> > >=20
> > > No it is not, that's up to the developer.
> >=20
> > For code I maintain, yes it is.
>=20
> That's up to the developer of the code, not the maintainer, as the
> maintainer is not the copyright holder of it.  For new files, it is up
> to the author of that code.  No maintainer should impose a license rule
> like this on their subsystem, that's just not ok at all.  The only
> "rule" is that it is compatible with GPLv2, nothing else.

No, see for example device tree rules.

Plus, IIRC it was you who asked the developer to "doublecheck with
their legal" when you seen GPL-2.0+. You can't really prevent me from
doing the same.

								Pavel
--=20
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--z6Eq5LdranGa6ru8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl8K0tMACgkQMOfwapXb+vKCwgCgoseHv2o3muXSkuuEeyWG1IRH
lDEAoJsXm8RXUZqWrnhXUF5oTf/5+DfD
=P/sL
-----END PGP SIGNATURE-----

--z6Eq5LdranGa6ru8--
