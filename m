Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19FBB128B83
	for <lists+linux-leds@lfdr.de>; Sat, 21 Dec 2019 21:28:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726940AbfLUU2A (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 21 Dec 2019 15:28:00 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:50242 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726593AbfLUU2A (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 21 Dec 2019 15:28:00 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id ED6E61C24A9; Sat, 21 Dec 2019 21:27:55 +0100 (CET)
Date:   Sat, 21 Dec 2019 21:27:55 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Cc:     linux-realtek-soc@lists.infradead.org, linux-leds@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC 22/25] leds: tm1826: Add combined glyph support
Message-ID: <20191221202755.GN32732@amd>
References: <20191212033952.5967-1-afaerber@suse.de>
 <20191212033952.5967-23-afaerber@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="SqfawxHnX56H7Ukl"
Content-Disposition: inline
In-Reply-To: <20191212033952.5967-23-afaerber@suse.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--SqfawxHnX56H7Ukl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2019-12-12 04:39:49, Andreas F=E4rber wrote:
> Allow to squeeze the text "HEllO" into a 4-digit display,
> as seen on MeLE V9 TV box.
>=20
> Enable this combining mode only if the text would overflow.

"HEll,nO"!

:-)

Ok, it is kind of cool, but... Can you take a look at
drivers/auxdisplay/charlcd.c ? It seems to support some kind of text
displays...

Best regards,
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--SqfawxHnX56H7Ukl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl3+gEsACgkQMOfwapXb+vKK3ACfVq3b4sY2SeAWp3klGsyflcuZ
Sj0AnRfKrSM5NY59RyJTDgkcQrhrSqhF
=zSWs
-----END PGP SIGNATURE-----

--SqfawxHnX56H7Ukl--
