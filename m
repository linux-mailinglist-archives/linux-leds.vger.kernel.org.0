Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FCD7130AC9
	for <lists+linux-leds@lfdr.de>; Mon,  6 Jan 2020 00:47:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727188AbgAEXrL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 5 Jan 2020 18:47:11 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:39398 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726773AbgAEXrL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 5 Jan 2020 18:47:11 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 824451C2453; Mon,  6 Jan 2020 00:47:09 +0100 (CET)
Date:   Mon, 6 Jan 2020 00:47:08 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/9] leds: lm3692x: Allow to set ovp and brigthness
 mode
Message-ID: <20200105234708.GA7598@amd>
References: <cover.1578134779.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="X1bOJ3K7DJ5YkBrT"
Content-Disposition: inline
In-Reply-To: <cover.1578134779.git.agx@sigxcpu.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--X1bOJ3K7DJ5YkBrT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Overvoltage protection and brightness mode are currently hardcoded
> as 29V and disabled in the driver. Make these configurable via DT.
>=20
> Besides addressing review comments v3 folds in the patches to
> disable the chip and turn of the regulator on brightness 0 from
>=20
>   https://lore.kernel.org/linux-leds/20191226101419.GE4033@amd/T/#t
>=20
> Besides addressing review comments v2 also allows to limit the maximum led
> current.

> Patches are against next-20191220.

I applied everything but the "exponential" changes and the last
one. I'll apply the last one if I get version that applies on top of
leds tree.

Best regards,
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--X1bOJ3K7DJ5YkBrT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl4SdXwACgkQMOfwapXb+vJaMQCgwV3gy5DFAEFexXL3O3QhZr1C
264An3kUacGLDJhhGUg/OGlcCubROOow
=E8m6
-----END PGP SIGNATURE-----

--X1bOJ3K7DJ5YkBrT--
