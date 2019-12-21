Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F0F2128AF6
	for <lists+linux-leds@lfdr.de>; Sat, 21 Dec 2019 20:02:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726736AbfLUTCn (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 21 Dec 2019 14:02:43 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:41174 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726593AbfLUTCn (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 21 Dec 2019 14:02:43 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 74FAC1C24DF; Sat, 21 Dec 2019 20:02:41 +0100 (CET)
Date:   Sat, 21 Dec 2019 20:02:40 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Zahari Petkov <zahari@balena.io>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] leds: pca963x: Fix open-drain initialization
Message-ID: <20191221190240.GB4199@amd>
References: <20191118210255.GA99907@majorz.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="E39vaYmALEf/7YXx"
Content-Disposition: inline
In-Reply-To: <20191118210255.GA99907@majorz.localdomain>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--E39vaYmALEf/7YXx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2019-11-18 23:02:55, Zahari Petkov wrote:
> Before commit bb29b9cccd95 ("leds: pca963x: Add bindings to invert
> polarity") Mode register 2 was initialized directly with either 0x01
> or 0x05 for open-drain or totem pole (push-pull) configuration.
>=20
> Afterwards, MODE2 initialization started using bitwise operations on
> top of the default MODE2 register value (0x05). Using bitwise OR for
> setting OUTDRV with 0x01 and 0x05 does not produce correct results.
> When open-drain is used, instead of setting OUTDRV to 0, the driver
> keeps it as 1:
>=20
> Open-drain: 0x05 | 0x01 -> 0x05 (0b101 - incorrect)
> Totem pole: 0x05 | 0x05 -> 0x05 (0b101 - correct but still wrong)
>=20
> Now OUTDRV setting uses correct bitwise operations for initialization:
>=20
> Open-drain: 0x05 & ~0x04 -> 0x01 (0b001 - correct)
> Totem pole: 0x05 | 0x04 -> 0x05 (0b101 - correct)
>=20
> Additional MODE2 register definitions are introduced now as well.

Thanks, applied.
								Pavel
							=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--E39vaYmALEf/7YXx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl3+bFAACgkQMOfwapXb+vI6/QCcDa/XaVJ4hspNhTLtt6t4ZaPF
oNYAn3VloD0vlMsPJigwil6/Q6bd6SvH
=C5rA
-----END PGP SIGNATURE-----

--E39vaYmALEf/7YXx--
