Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEA826CD02
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jul 2019 12:52:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390018AbfGRKwi (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 18 Jul 2019 06:52:38 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:55889 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389762AbfGRKwi (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 18 Jul 2019 06:52:38 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id AD2C18027C; Thu, 18 Jul 2019 12:52:23 +0200 (CEST)
Date:   Thu, 18 Jul 2019 12:52:34 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     linux-leds@vger.kernel.org, dmurphy@ti.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh@kernel.org, dtor@google.com, linux@roeck-us.net
Subject: Re: [PATCH v5 00/26] Add generic support for composing LED class
 device name
Message-ID: <20190718105233.GA3859@amd>
References: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
 <405b2806-342a-952d-67ab-47516225c54e@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="OgqxwSJOaUobr8KG"
Content-Disposition: inline
In-Reply-To: <405b2806-342a-952d-67ab-47516225c54e@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--OgqxwSJOaUobr8KG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Hi all,
>=20
> I need explicit acks for some patches from this series, that
> were either requested improvements or I modified them by myself
> after v4.
>=20
> The patches I am talking about are the following:
>=20
> 1/26
> 21/26
> 23/26
> 25/26

Acked-by: Pavel Machek <pavel@ucw.cz>

> 26/26 would be nice to have but I presume it needs more discussion
> and analysis.

Idea is good, but I'd sort the file in different way.

Best regards,
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--OgqxwSJOaUobr8KG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl0wT3EACgkQMOfwapXb+vI1tACcCTFYaHPYF4l3AuLVbz3Ti/Pn
+nQAniCt8QUkaqGmg4Y5QMHqfyVCFSzD
=7Pli
-----END PGP SIGNATURE-----

--OgqxwSJOaUobr8KG--
