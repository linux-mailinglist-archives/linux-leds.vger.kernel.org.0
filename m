Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38C1016FF5E
	for <lists+linux-leds@lfdr.de>; Wed, 26 Feb 2020 13:59:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726400AbgBZM7G (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 26 Feb 2020 07:59:06 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:34236 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726386AbgBZM7G (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 26 Feb 2020 07:59:06 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 468F01C0411; Wed, 26 Feb 2020 13:59:04 +0100 (CET)
Date:   Wed, 26 Feb 2020 13:59:03 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v17 00/17] Multi Color LED Framework
Message-ID: <20200226125903.GA2800@duo.ucw.cz>
References: <20200127150032.31350-1-dmurphy@ti.com>
 <42d9687b-b488-22cf-0e9a-ff635b2094e3@ti.com>
 <20200225101940.GB16252@amd>
 <be76fdac-9d32-b9b2-c01d-3aa315b14463@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ew6BAiZeqk4r7MaW"
Content-Disposition: inline
In-Reply-To: <be76fdac-9d32-b9b2-c01d-3aa315b14463@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--ew6BAiZeqk4r7MaW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > The fact that it changes API makes it important to get it right, and
> > hard/impossible to fix it once it is merged... and I don't think this
> > is the right interface (sorry).
> >=20
> > In particular, I don't think having directory per channel is a good
> > idea. It makes atomic updates impossible (minor),=20
>=20
> It is possible via brightness file, although it will need first writing
> intensity files, which only will cache colors, and actual write to hw
> occurs on write to brightness file. This has been discussed dozen of
> times throughout last year, and you even proposed the formula for
> calculating per-color-subled brightness basing on global brightness and
> intensity set for each color.

You are right, it is possible to make updates atomic with right kind
of latching (which is quite confusing).

> > but will also
> > increase memory consuption (to a point where led-per-channel might
> > be cheaper), and will make userspace do 3x ammount of syscalls in the
> > common case.
> >=20
> > And we can do better; sysfs files with arrays are okay. So I'd like to
> > see
>=20
> Let's first achieve broader consensus on this statement before we
> move forward with such design. Sysfs maintainer seems to be the best
> person to consult at first.

This is actually documented:

Documentation/filesystems/sysfs.txt

<quote>
Attributes should be ASCII text files, preferably with only one value
per file. It is noted that it may not be efficient to contain only one
value per file, so it is socially acceptable to express an array of
values of the same type.

Mixing types, expressing multiple lines of data, and doing fancy
formatting of data is heavily frowned upon. Doing these things may get
you publicly humiliated and your code rewritten without notice.
</quote>

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--ew6BAiZeqk4r7MaW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXlZrlwAKCRAw5/Bqldv6
8n/NAKCKU9K9JzjINSNvKz3r95fZTH6YewCeJqh+JZdF1q95vjN/nmX/wyOSbhI=
=wVDj
-----END PGP SIGNATURE-----

--ew6BAiZeqk4r7MaW--
