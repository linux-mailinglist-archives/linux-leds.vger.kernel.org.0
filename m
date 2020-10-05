Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 969F42836E2
	for <lists+linux-leds@lfdr.de>; Mon,  5 Oct 2020 15:50:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725970AbgJENuu (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 5 Oct 2020 09:50:50 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:56702 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbgJENuu (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 5 Oct 2020 09:50:50 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 30C841C0B77; Mon,  5 Oct 2020 15:50:47 +0200 (CEST)
Date:   Mon, 5 Oct 2020 15:50:46 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek Behun <kabel@blackhole.sk>
Cc:     ultracoolguy@tutanota.com, Dmurphy <dmurphy@ti.com>,
        Linux Leds <linux-leds@vger.kernel.org>,
        Trivial <trivial@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: lm3697: Fix out-of-bound access
Message-ID: <20201005135046.GA26765@duo.ucw.cz>
References: <MIiYgay--3-2@tutanota.com>
 <20201005141334.36d9441a@blackhole.sk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="n8g4imXOkfNTN/H1"
Content-Disposition: inline
In-Reply-To: <20201005141334.36d9441a@blackhole.sk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--n8g4imXOkfNTN/H1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >  	if (ret)
> >  		dev_err(&priv->client->dev, "Cannot write OUTPUT config\n");
> >=20
> > -	for (i =3D 0; i < LM3697_MAX_CONTROL_BANKS; i++) {
> > +	for (i =3D 0; i < priv->num_leds; i++) {
>=20
> Ultracoolguy is correct that this for cycle should not iterate
> LM3697_MAX_CONTROL_BANKS. Instead, the count check in lm3697_probe should=
 be changed from
>=20
>   if (!count)
> to
>   if (!count || count > LM3697_MAX_CONTROL_BANKS)
>=20
> (the error message should also be changed, or maybe dropped, and the
> error code changed from -ENODEV to -EINVAL, if we use || operator).

I guess Dan (or someone else?) can submit simple one-liner I could
apply into -for-next (and maybe stable), and then we can sort the
naming etc in the driver? Gettings banks vs. LEDs right would be nice.

Thanks and best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--n8g4imXOkfNTN/H1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX3sktgAKCRAw5/Bqldv6
8nn/AJ9plJ17mUe1BmlOkkLDOrp60YN95wCgitYQ9BT4aZATHV5sfkRBbnCA9lM=
=xGtn
-----END PGP SIGNATURE-----

--n8g4imXOkfNTN/H1--
