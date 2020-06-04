Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57D891EE531
	for <lists+linux-leds@lfdr.de>; Thu,  4 Jun 2020 15:21:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728502AbgFDNVF (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 4 Jun 2020 09:21:05 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:51864 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728450AbgFDNVE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 4 Jun 2020 09:21:04 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 1EC851C0BD2; Thu,  4 Jun 2020 15:21:03 +0200 (CEST)
Date:   Thu, 4 Jun 2020 15:21:02 +0200
From:   Pavel Machek <pavel@denx.de>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v18 4/4] leds: multicolor: Introduce a multicolor class
 definition
Message-ID: <20200604132102.GC7222@duo.ucw.cz>
References: <20200324181434.24721-1-dmurphy@ti.com>
 <20200324181434.24721-5-dmurphy@ti.com>
 <f43bf4c5-948d-b87f-9b95-98fcfeaae2fa@gmail.com>
 <9a707fe6-31c6-da9e-9372-51ca21bf3c88@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="sHrvAb52M6C8blB9"
Content-Disposition: inline
In-Reply-To: <9a707fe6-31c6-da9e-9372-51ca21bf3c88@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--sHrvAb52M6C8blB9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > +Description:	read
> > > +		Maximum intensity level for the LED color within the array.
> > > +		The max intensities for each color must be entered based on the
> > > +		color_index array.
> > I wonder if we should mention here that each LED within a cluster should
> > have the same maximum intensity for linear color lightness calculation
> > via brightness file.
>=20
> Does it really have to?

Yes it does. Anything else is unneccessarily complex.

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--sHrvAb52M6C8blB9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXtj1PgAKCRAw5/Bqldv6
8qatAJ4u6W8VQzR8pf32e+wX/xMXb1e10QCeOOW9iBoX3jcny6s21E32jzpK7jM=
=DoKN
-----END PGP SIGNATURE-----

--sHrvAb52M6C8blB9--
