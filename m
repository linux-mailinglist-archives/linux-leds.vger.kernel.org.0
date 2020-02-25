Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5C3F16BE74
	for <lists+linux-leds@lfdr.de>; Tue, 25 Feb 2020 11:19:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730086AbgBYKTi (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 25 Feb 2020 05:19:38 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:37870 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728958AbgBYKTi (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 25 Feb 2020 05:19:38 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 2897A1C0411; Tue, 25 Feb 2020 11:19:36 +0100 (CET)
Date:   Tue, 25 Feb 2020 11:19:35 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/9] leds: lm3692x: Allow to set ovp and brigthness
 mode
Message-ID: <20200225101935.GA16252@amd>
References: <cover.1578134779.git.agx@sigxcpu.org>
 <20200105234708.GA7598@amd>
 <20200106094443.GB13043@bogon.m.sigxcpu.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="bg08WKrSYDhXBjb5"
Content-Disposition: inline
In-Reply-To: <20200106094443.GB13043@bogon.m.sigxcpu.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > Patches are against next-20191220.
> >=20
> > I applied everything but the "exponential" changes and the last
> > one. I'll apply the last one if I get version that applies on top of
> > leds tree.
>=20
> Thanks! Can I do anything to get the exponential part in? Is it because
> you want the exponential mode to move to the backlight binding?

You'd have to do some serious convincing, explaining why we absolutely
need the exponential stuff.

Most devices today use linear brightness, and userspace needs to know
the relation, especially for RGB stuff.

You can set bigger max-brightness, and then do in-driver conversion to
use full dynamic brightness range...?

Best regards,

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--bg08WKrSYDhXBjb5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl5U9LcACgkQMOfwapXb+vKmQwCeMlzPn+Eem1SMNkD3mahWvCZt
NMAAn0xlajNgoP4SO6bIQu8nJ4+2vhUo
=oqTC
-----END PGP SIGNATURE-----

--bg08WKrSYDhXBjb5--
