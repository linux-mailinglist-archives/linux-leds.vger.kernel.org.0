Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D08D2DDBB7
	for <lists+linux-leds@lfdr.de>; Fri, 18 Dec 2020 00:02:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730665AbgLQXAo (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 17 Dec 2020 18:00:44 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:54902 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730054AbgLQXAo (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 17 Dec 2020 18:00:44 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 821971C0B7D; Thu, 17 Dec 2020 23:59:46 +0100 (CET)
Date:   Thu, 17 Dec 2020 23:59:43 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     David Laight <David.Laight@ACULAB.COM>
Cc:     'Marek Behun' <marek.behun@nic.cz>,
        Abanoub Sameh <abanoubsameh8@gmail.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Abanoub Sameh <abanoubsameh@protonmail.com>,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] leds: led-core: Get rid of enum led_brightness
Message-ID: <20201217225942.GA8241@amd>
References: <20201211014840.1554095-1-abanoubsameh@protonmail.com>
 <20201211135628.1fe1af79@nic.cz>
 <2ae41868b2604a489927b5903529afb4@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ZPt4rx8FFjLCG7dd"
Content-Disposition: inline
In-Reply-To: <2ae41868b2604a489927b5903529afb4@AcuMS.aculab.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > On Fri, 11 Dec 2020 03:48:40 +0200
> > Abanoub Sameh <abanoubsameh8@gmail.com> wrote:
> >=20
> > > This gets rid of enum led_brightness in the main led files,
> > > because it is deprecated, and an int can be used instead,
> > > or maybe even a uint8_t since it only goes up to 255.
> > > Next we can also patch the other files to get rid of it completely.
> >=20
> > 1. unsigned int should be used IMO
> >   - using int may force all implementers to check for negative value
> >     and return -EINVAL, which is stupid
> >   - some LED controllers may offer more than 8bit brightness value, so
> >     no uint8_t
>=20
> More than 8 bits would be good.
> While not really relevant for actual 'brightness' it allows
> for 'strange' things be encoded in the brightness field.

I have headlamp which can do 0.1lumens to 750lumens. Some go down to
0.01 lumens. More than 8 bits definitely makes sense.

Display backlights also need great ranges.

> While extra parameters could be added, they are only really usable
> by code that knows they are present.
> So encoding in the 'brightness' sort of makes sense.

No.
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--ZPt4rx8FFjLCG7dd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl/b4t4ACgkQMOfwapXb+vLCvwCfQaX9fJwM0k0zZHrmFS8c8AS7
udMAniG4GbiBy7E61PVgFrlWfMn5E7+k
=LUnF
-----END PGP SIGNATURE-----

--ZPt4rx8FFjLCG7dd--
