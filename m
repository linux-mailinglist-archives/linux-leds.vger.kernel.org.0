Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06FD9270DCF
	for <lists+linux-leds@lfdr.de>; Sat, 19 Sep 2020 13:58:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726097AbgISL6v (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 19 Sep 2020 07:58:51 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:57052 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726041AbgISL6u (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 19 Sep 2020 07:58:50 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id C23DF1C0B7F; Sat, 19 Sep 2020 13:58:47 +0200 (CEST)
Date:   Sat, 19 Sep 2020 13:58:47 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Moll Markus <mmoll@de.pepperl-fuchs.com>
Cc:     "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        Riku Voipio <riku.voipio@iki.fi>
Subject: Re: [PATCH 1/2] leds: pca9532: correct shift computation in
 pca9532_getled
Message-ID: <20200919115847.GA21747@duo.ucw.cz>
References: <6a16ba71ed624748b6601933397e697e@de.pepperl-fuchs.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="bp/iNruPH9dso1Pn"
Content-Disposition: inline
In-Reply-To: <6a16ba71ed624748b6601933397e697e@de.pepperl-fuchs.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Each led occupies two bits in the register, so the required shift is
> LED_NUM(id) * 2, exactly as in pca9532_setled. Furthermore, irrelevant
> higher bits need to be masked appropriately.
>=20
> The function is used to implement 'default-status =3D "keep"', which did
> not work properly before.

Actually, dropping "keep" support if noone uses it would be best.

I can take the patch, too, but it makes sense to merge the two.

> Important Information:
> This e-mail message including its attachments contains confidential

=2E..and send it without this trailer.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--bp/iNruPH9dso1Pn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX2XydwAKCRAw5/Bqldv6
8nhRAJ9d9fTC5fQa3zV5NeceO6DRErE+1ACePA0LGN6AyQ9WnEoGySDWz4a/du0=
=Fu74
-----END PGP SIGNATURE-----

--bp/iNruPH9dso1Pn--
