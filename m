Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF35F228F9
	for <lists+linux-leds@lfdr.de>; Sun, 19 May 2019 23:04:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729417AbfESVEk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 19 May 2019 17:04:40 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:59175 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726066AbfESVEk (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 19 May 2019 17:04:40 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 5A68580378; Sun, 19 May 2019 23:04:26 +0200 (CEST)
Date:   Sun, 19 May 2019 23:04:36 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     Marek Behun <marek.behun@nic.cz>, linux-leds@vger.kernel.org,
        jacek.anaszewski@gmail.com
Subject: Re: Multicolor Framework: brightness-model vs curve definition
Message-ID: <20190519210435.GA31403@amd>
References: <20190501225120.1ce3cfc6@nic.cz>
 <20190504155016.GA7421@amd>
 <3a258168-27f4-0e13-40b8-cc8113371fe9@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="M9NhX3UHpAaciwkO"
Content-Disposition: inline
In-Reply-To: <3a258168-27f4-0e13-40b8-cc8113371fe9@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--M9NhX3UHpAaciwkO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >> I have been thinking about the last Multicolor Framework proposal by
> >> Dan.
> >=20
> > We talked on the phone... and I promissed some links.
> >=20
> > I'd really prefer drivers to present output power to the of the
> > kernel/userland, and deal with the RGB conversion else where. So if
> > driver was asked for (20, 50, 100), red output would go to (20/1000) W,
> > green (50/1000) W, ...
> >=20
> > RGB is described here:
> >=20
> > https://en.wikipedia.org/wiki/RGB_color_model (see section
> > "nonlinearity")
> >=20
> > https://en.wikipedia.org/wiki/Gamma_correction
> >=20
> > And concrete values are here:
> >=20
> > https://en.wikipedia.org/wiki/SRGB#Specification_of_the_transformation
> >=20
> > While playing with colors, I came up with this:
> >=20
> > https://github.com/pavelmachek/unicsy_demo/blob/master/monitor/notint.py
> >=20
> > See change_color for exact transformation (it could be improvede,
> > linear part is not there). It can be also used to display same color
> > on monitor and LED. It get somehow reasonable results for me...
> >=20
>=20
> Does this use the multi color framework interfaces defined here?
>=20
> https://lore.kernel.org/patchwork/patch/1060683/
>=20
> Minus the sync, sync_enable and brightness_model interfaces.  It does not=
 look like that after looking
> at the notint script.
>=20
> Or is this your own multicolor framework implementation?
>=20
> We could meld these ideas together.

This uses legacy kernel interfaces. It is meant to demonstrate that
arbitrary color setting is feasible.
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--M9NhX3UHpAaciwkO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzhxOMACgkQMOfwapXb+vJ0AACeN5BMlNbYoxQdcRu9ZaeTlXAT
nMgAoMOw6DlY1WNj1xKf0JYvYnfN+lnr
=csU7
-----END PGP SIGNATURE-----

--M9NhX3UHpAaciwkO--
