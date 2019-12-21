Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEBDC128B08
	for <lists+linux-leds@lfdr.de>; Sat, 21 Dec 2019 20:18:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727130AbfLUTSs (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 21 Dec 2019 14:18:48 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:42350 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726107AbfLUTSs (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 21 Dec 2019 14:18:48 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 183EE1C24DF; Sat, 21 Dec 2019 20:18:46 +0100 (CET)
Date:   Sat, 21 Dec 2019 20:18:44 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] leds: lm3692x: Allow to set ovp and brigthness mode
Message-ID: <20191221191844.GH32732@amd>
References: <cover.1576499103.git.agx@sigxcpu.org>
 <9c87a17aefbf758d58f199f7046114ee7505a1fa.1576499103.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="qVHblb/y9DPlgkHs"
Content-Disposition: inline
In-Reply-To: <9c87a17aefbf758d58f199f7046114ee7505a1fa.1576499103.git.agx@sigxcpu.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--qVHblb/y9DPlgkHs
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Overvoltage protection and brightness mode are currently hardcoded
> as disabled in the driver. Make these configurable via DT.

What exactly is overvoltage protection good for? Should we default to
29V if we have no other information?

> Signed-off-by: Guido G=FCnther <agx@sigxcpu.org>

> +	ret =3D device_property_read_u32(&led->client->dev,
> +				       "ti,overvoltage-volts", &ovp);
> +	if (!ret) {
> +		switch (ovp) {
> +		case 0:
> +			break;
> +		case 22:
> +			led->boost_ctrl |=3D LM3692X_OVP_21V;
> +			break;

Should be case 21.
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--qVHblb/y9DPlgkHs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl3+cBQACgkQMOfwapXb+vJxQQCffJ2NjyY7c/s7I8yjL5BAdYLV
ho8AoItTrqmebvpajLGxvXiH7PJ3+TUR
=EGy9
-----END PGP SIGNATURE-----

--qVHblb/y9DPlgkHs--
