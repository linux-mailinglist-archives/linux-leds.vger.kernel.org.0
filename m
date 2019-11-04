Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0625BEDB71
	for <lists+linux-leds@lfdr.de>; Mon,  4 Nov 2019 10:16:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728121AbfKDJQH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 4 Nov 2019 04:16:07 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:33902 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728138AbfKDJQH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 4 Nov 2019 04:16:07 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 0A5EF1C06D1; Mon,  4 Nov 2019 10:09:54 +0100 (CET)
Date:   Mon, 4 Nov 2019 10:09:53 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Zahari Petkov <zahari@balena.io>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: pca963x: Fix open-drain initialization
Message-ID: <20191103170327.GA32107@duo.ucw.cz>
References: <20191014123604.GA743117@majorz.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="YrQNB5Deg1WGKZi3"
Content-Disposition: inline
In-Reply-To: <20191014123604.GA743117@majorz.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--YrQNB5Deg1WGKZi3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2019-10-14 15:36:04, Zahari Petkov wrote:
> OUTDRV setting (bit 2) of Mode register 2 has a default value of 1.
> During initialization when open-drain is used, instead of setting
> OUTDRV to 0, the driver keeps it as 1. OUTDRV setting is now correctly
> initialized to 0 when open-drain is used.
>=20
> Additionally the BIT macro is used for improved readibility.

You change more than you describe in the changelog.

> +++ b/drivers/leds/leds-pca963x.c
> @@ -438,12 +438,12 @@ static int pca963x_probe(struct i2c_client *client,
>  						    PCA963X_MODE2);
>  		/* Configure output: open-drain or totem pole (push-pull) */
>  		if (pdata->outdrv =3D=3D PCA963X_OPEN_DRAIN)
> -			mode2 |=3D 0x01;
> +			mode2 &=3D ~BIT(2);

| 0 -> & ~0x04;

>  		else
> -			mode2 |=3D 0x05;
> +			mode2 |=3D BIT(2);

| 5 -> | 0x04;

Are you sure?

Additionaly, we already have defines for bits in mode2 register:

#define PCA963X_MODE2_DMBLNK    0x20    /* Enable blinking */

So if you care about readability, perhaps you should add defines for
invert/ open drain there, and then use them?

Please keep using 0xab instead of BIT() for consistency with the rest
of the driver.

Thanks,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--YrQNB5Deg1WGKZi3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXb/q4QAKCRAw5/Bqldv6
8pWYAKCNeL3o7KILasXNNJmBd0PmZDU7sQCcDF0QGo5nS/+txwnWzTJBaReK+ug=
=6E28
-----END PGP SIGNATURE-----

--YrQNB5Deg1WGKZi3--
