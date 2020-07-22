Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 179402291C4
	for <lists+linux-leds@lfdr.de>; Wed, 22 Jul 2020 09:11:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728394AbgGVHLI (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 22 Jul 2020 03:11:08 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:51584 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727096AbgGVHLI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 22 Jul 2020 03:11:08 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 2B3751C0BF1; Wed, 22 Jul 2020 09:11:05 +0200 (CEST)
Date:   Wed, 22 Jul 2020 09:10:55 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, robh@kernel.org, marek.behun@nic.cz,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v31 03/12] leds: lp50xx: Add the LP50XX family of the RGB
 LED driver
Message-ID: <20200722071055.GA8984@amd>
References: <20200716182007.18389-1-dmurphy@ti.com>
 <20200716182007.18389-4-dmurphy@ti.com>
 <20200721210554.GC5966@amd>
 <c774fab9-124b-da2e-6f7c-614f34322942@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="OXfL5xGRrasGEqWY"
Content-Disposition: inline
In-Reply-To: <c774fab9-124b-da2e-6f7c-614f34322942@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >>+			ret =3D fwnode_property_read_u32_array(child,
> >>+							     "reg",
> >>+							     led_banks,
> >>+							     ret);
> >Move this to subfunction to reduce the indentation? (Or, just refactor
> >it somehow).
>=20
> Actually I can just put it all on the same line since the 80 character
> requirement is relaxed.

No.

You have too long and too complex function, with too many blocks
inside each other. Please fix it.

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--OXfL5xGRrasGEqWY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl8X5n8ACgkQMOfwapXb+vIx7QCeJ+80yzhE3zdJ33JsSBF1CbS9
i0EAn1cgjVdwOdcgTvETrwYx8ha/r9B5
=x2Vm
-----END PGP SIGNATURE-----

--OXfL5xGRrasGEqWY--
