Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD9F544B95A
	for <lists+linux-leds@lfdr.de>; Wed, 10 Nov 2021 00:29:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231886AbhKIXcJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 9 Nov 2021 18:32:09 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:55248 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231825AbhKIXcI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 9 Nov 2021 18:32:08 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 7834B1C0B80; Wed, 10 Nov 2021 00:29:19 +0100 (CET)
Date:   Wed, 10 Nov 2021 00:29:17 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Florian Eckert <fe@dev.tdt.de>
Cc:     robh+dt@kernel.org, Eckert.Florian@googlemail.com,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] leds: Add KTD20xx RGB LEDs driver from Kinetic
Message-ID: <20211109232917.GA26764@amd>
References: <20211109100822.5412-1-fe@dev.tdt.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="XsQoSWH+UP9D9v3l"
Content-Disposition: inline
In-Reply-To: <20211109100822.5412-1-fe@dev.tdt.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Introduce the KTD2061/58/59/60 RGB LEDs driver. The difference in these
> parts are the address number on the I2C bus the device is listen on.
>=20
> All KT20xx device could control up to 12 LEDs. The chip can be operated
> in two variants.
>=20
> Florian Eckert (2):
>   leds: ktd20xx: Add the KTD20xx family of the RGB LEDs driver from
>     Kinetic
>   dt: bindings: KTD20xx: Introduce the ktd20xx family of RGB drivers

That's... not a nice piece of hardware.

We'll want dt changes first, driver next please.

If this uses non-standard interface, it will need to be
documented. But I would like to understand the limitations first.

Do you have actual device where this is used?

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--XsQoSWH+UP9D9v3l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmGLBE0ACgkQMOfwapXb+vIwjwCfUaNP3zYETY01eMZ8NjAolH5r
riAAnijD4dSTzDnmBgW7O6RKB0dVJIie
=ig8L
-----END PGP SIGNATURE-----

--XsQoSWH+UP9D9v3l--
