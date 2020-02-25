Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7011416BE78
	for <lists+linux-leds@lfdr.de>; Tue, 25 Feb 2020 11:19:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730143AbgBYKTn (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 25 Feb 2020 05:19:43 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:37896 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728958AbgBYKTn (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 25 Feb 2020 05:19:43 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 321491C0411; Tue, 25 Feb 2020 11:19:41 +0100 (CET)
Date:   Tue, 25 Feb 2020 11:19:40 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v17 00/17] Multi Color LED Framework
Message-ID: <20200225101940.GB16252@amd>
References: <20200127150032.31350-1-dmurphy@ti.com>
 <42d9687b-b488-22cf-0e9a-ff635b2094e3@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="RASg3xLB4tUQ4RcS"
Content-Disposition: inline
In-Reply-To: <42d9687b-b488-22cf-0e9a-ff635b2094e3@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--RASg3xLB4tUQ4RcS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >   leds: lp5521: Add multicolor framework multicolor brightness support
> >   leds: lp55xx: Fix checkpatch file permissions issues
> >   leds: lp5523: Fix checkpatch issues in the code
> >   dt: bindings: Update lp55xx binding to recommended LED naming
>=20
> I have no open comments on this patchset except for a DT change requested=
 by
> Shawn Gao but this change should wait till after this patchset is merged.
>=20
> Is there something holding this up?

Yes... my time; sorry about that.

The fact that it changes API makes it important to get it right, and
hard/impossible to fix it once it is merged... and I don't think this
is the right interface (sorry).

In particular, I don't think having directory per channel is a good
idea. It makes atomic updates impossible (minor), but will also
increase memory consuption (to a point where led-per-channel might
be cheaper), and will make userspace do 3x ammount of syscalls in the
common case.

And we can do better; sysfs files with arrays are okay. So I'd like to
see

channel_intensity (file containing array of u32's)

channel_names (usually containing "red green blue")

(I'm not sure if max_intensity is good idea; i believe we could simply
fix it to UINT32_MAX without bad effects).

And yes, I realize I should have spoken up sooner / more
forcefully. Sorry again.

Best regards,

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--RASg3xLB4tUQ4RcS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl5U9LwACgkQMOfwapXb+vLepwCfRO9jL+n3chuM5zr6441ZTzZs
3kAAn0cydRLo1MP2Yyt+P1+l1tD/XPIy
=/4Qw
-----END PGP SIGNATURE-----

--RASg3xLB4tUQ4RcS--
