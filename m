Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98784B15A1
	for <lists+linux-leds@lfdr.de>; Thu, 12 Sep 2019 22:55:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727723AbfILUzz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 12 Sep 2019 16:55:55 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:40541 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726308AbfILUzz (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 12 Sep 2019 16:55:55 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id C73D6821D5; Thu, 12 Sep 2019 22:55:38 +0200 (CEST)
Date:   Thu, 12 Sep 2019 22:55:52 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, robh+dt@kernel.org,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/9] documention: leds: Add multicolor class
 documentation
Message-ID: <20190912205551.GA13514@amd>
References: <20190911180115.21035-1-dmurphy@ti.com>
 <20190911180115.21035-3-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="HcAYCG3uE/tztfnV"
Content-Disposition: inline
In-Reply-To: <20190911180115.21035-3-dmurphy@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--HcAYCG3uE/tztfnV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> +Directory Layout Example
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +root:/sys/class/leds/rgb:grouped_leds# ls -lR colors/
> +colors/:
> +drwxr-xr-x    2 root     root             0 Jun 28 20:21 blue
> +drwxr-xr-x    2 root     root             0 Jun 28 20:21 green
> +drwxr-xr-x    2 root     root             0 Jun 28 20:21 red
> +-rw-------    1 root     root          4096 Jun 28 20:21 color_mix
> +
> +colors/blue:
> +-rw-------    1 root     root          4096 Jun 28 20:21 intensity
> +-r--------    1 root     root          4096 Jun 28 20:27 max_intensity
> +-r--------    1 root     root          4096 Jun 28 20:21 color_id

I don't really like the directories... A bit too much complexity, and
it will have a memory footprint, too.

I'd expect max_intensity to be same for all the leds in
rgb:grouped_leds... Could we simply rely on max_brightness file?

[If not, would one "max_intensity" file in rgb:grouped_leds be
enough?]

Best regards,
							Pavel
						=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--HcAYCG3uE/tztfnV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl16sNcACgkQMOfwapXb+vJAWQCgv45O0b24CFkyAeFWaKrZst6o
LxsAoKz7kOpifqn3qlBEfyLGzEhgf2jR
=hZFc
-----END PGP SIGNATURE-----

--HcAYCG3uE/tztfnV--
