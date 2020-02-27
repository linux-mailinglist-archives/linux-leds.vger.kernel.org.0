Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E699171582
	for <lists+linux-leds@lfdr.de>; Thu, 27 Feb 2020 11:58:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728680AbgB0K6L (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 27 Feb 2020 05:58:11 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:35872 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728744AbgB0K6K (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 27 Feb 2020 05:58:10 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 1F1B71C013C; Thu, 27 Feb 2020 11:58:09 +0100 (CET)
Date:   Thu, 27 Feb 2020 11:58:08 +0100
From:   Pavel Machek <pavel@denx.de>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v17 00/17] Multi Color LED Framework
Message-ID: <20200227105808.GA27003@duo.ucw.cz>
References: <20200127150032.31350-1-dmurphy@ti.com>
 <42d9687b-b488-22cf-0e9a-ff635b2094e3@ti.com>
 <20200225101940.GB16252@amd>
 <be76fdac-9d32-b9b2-c01d-3aa315b14463@gmail.com>
 <20200226125903.GA2800@duo.ucw.cz>
 <20f6bdd5-e899-aead-8c35-1c3a3d09145f@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="gBBFr7Ir9EOA20Yy"
Content-Disposition: inline
In-Reply-To: <20f6bdd5-e899-aead-8c35-1c3a3d09145f@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--gBBFr7Ir9EOA20Yy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi, Jacek!

(and thanks for doing this).

> We have here long lasting discussion related to LED multicolor class
> sysfs interface design. We went through several iterations and worked
> out the solution with individual file per each color sub-LED in the
> color directory as shown below:
>=20
> /sys/class/leds/<led>/colors/<color>_intensity
>=20
> This is in line with one-value-per-file sysfs rule, that is being
> frequently highlighted, and we even had not so long ago a patch
> for led cpu trigger solving the problem caused by this rule not
> being adhered to.

Yep. One of the problems is that it is nice to change all the hardware
channels at once to produce color (it is often on i2c -- and slow), so
current proposals use "interesting" kind of latching.

> Now we have the voice below bringing to attention another caveat
> from sysfs documentation:
>=20
> "it is socially acceptable to express an array of values of the same
> type"
>=20
> and proposing the interface in the form of two files:
>=20
> channel_intensity (file containing array of u32's)
> channel_names (usually containing "red green blue")

And thus I want to have it in one file, so it is naturaly atomic. RGB
leds with 3 channels are common; I have not user yet, but there are
RGBW with 4 channels (and some more exotic stuff). I don't expect to
have more than 5 channels.

Best regards,
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--gBBFr7Ir9EOA20Yy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXlegwAAKCRAw5/Bqldv6
8mskAKCOR+FzZhQ+xON7Lm1SAo0O69112ACeKN7hUuClPLCjgJWr/mFOK3vWzdc=
=Q6Vn
-----END PGP SIGNATURE-----

--gBBFr7Ir9EOA20Yy--
