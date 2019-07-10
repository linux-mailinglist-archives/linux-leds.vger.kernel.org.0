Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 429F564CA2
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jul 2019 21:17:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728215AbfGJTQ7 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 10 Jul 2019 15:16:59 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:47390 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727612AbfGJTQ7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 10 Jul 2019 15:16:59 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 80691805E5; Wed, 10 Jul 2019 21:16:46 +0200 (CEST)
Date:   Wed, 10 Jul 2019 21:16:57 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Nick Stoughton <nstoughton@logitech.com>
Cc:     linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: leds-lp5562 allow firmware files up to the maximum
 length
Message-ID: <20190710191657.GE22995@amd>
References: <CACpbN90YPxnsm1Py4t2-npk0b8A06+OZTtc8kom_smMDUyFEVw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="PPYy/fEw/8QCHSq3"
Content-Disposition: inline
In-Reply-To: <CACpbN90YPxnsm1Py4t2-npk0b8A06+OZTtc8kom_smMDUyFEVw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--PPYy/fEw/8QCHSq3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


On Wed 2019-07-10 07:30:31, Nick Stoughton wrote:
> Firmware files are in ASCII, using 2 hex characters per byte. The
> maximum length of a firmware string is therefore
>=20
> 16 (commands) * 2 (bytes per command) * 2 (characters per byte) =3D 64
>=20
> Signed-off-by: Nick Stoughton <nstoughton@logitech.com>

Acked-by: Pavel Machek <pavel@ucw.cz>
								Pavel
> ---
>  drivers/leds/leds-lp5562.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/leds/leds-lp5562.c b/drivers/leds/leds-lp5562.c
> index 37632fc63741..e00117e3b50d 100644
> --- a/drivers/leds/leds-lp5562.c
> +++ b/drivers/leds/leds-lp5562.c
> @@ -260,7 +260,11 @@ static void lp5562_firmware_loaded(struct
> lp55xx_chip *chip)
>  {
>         const struct firmware *fw =3D chip->fw;
>=20
> -       if (fw->size > LP5562_PROGRAM_LENGTH) {
> +        /*
> +         * the firmware is encoded in ascii hex character, with 2 chars
> +         * per byte
> +         */
> +       if (fw->size > (LP5562_PROGRAM_LENGTH * 2)) {
>                 dev_err(&chip->cl->dev, "firmware data size overflow: %zu=
\n",
>                         fw->size);
>                 return;

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--PPYy/fEw/8QCHSq3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl0mOakACgkQMOfwapXb+vJRxgCdEUCxePKmF0/uQZMXOX1MIjpP
jFIAoIyZQ9AeK32RuLtlWpHkYCvQSRnS
=U+mw
-----END PGP SIGNATURE-----

--PPYy/fEw/8QCHSq3--
