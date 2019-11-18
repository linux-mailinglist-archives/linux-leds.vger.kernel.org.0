Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 447DD1009DA
	for <lists+linux-leds@lfdr.de>; Mon, 18 Nov 2019 18:01:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726695AbfKRRBO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 18 Nov 2019 12:01:14 -0500
Received: from foss.arm.com ([217.140.110.172]:37214 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726427AbfKRRBO (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 18 Nov 2019 12:01:14 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 947BD1FB;
        Mon, 18 Nov 2019 09:01:13 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 026763F703;
        Mon, 18 Nov 2019 09:01:12 -0800 (PST)
Date:   Mon, 18 Nov 2019 17:01:11 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Sven Van Asbroeck <thesven73@gmail.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Grigoryev Denis <grigoryev@fastwel.ru>,
        Axel Lin <axel.lin@ingics.com>, Dan Murphy <dmurphy@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH v1 1/4] tps6105x: add optional devicetree support
Message-ID: <20191118170111.GL9761@sirena.org.uk>
References: <20191118165400.21985-1-TheSven73@gmail.com>
 <20191118165400.21985-2-TheSven73@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4oF+6Ged69J0+4/e"
Content-Disposition: inline
In-Reply-To: <20191118165400.21985-2-TheSven73@gmail.com>
X-Cookie: no maintenance:
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--4oF+6Ged69J0+4/e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2019 at 11:53:57AM -0500, Sven Van Asbroeck wrote:

> 	tps61052@33 {
> 		compatible =3D "ti,tps61052";
> 		reg =3D <0x33>;
>=20
> 		regulator {
> 			compatible =3D "ti,tps6105x-regulator";
> 		};

We shouldn't need a compatible here, the MFD should just instantiate any
children it has.  This also doesn't document any actual regulators on
the device.

--4oF+6Ged69J0+4/e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3SzlYACgkQJNaLcl1U
h9C0AQf+PilXEdM8POFA/pohdo6vlL+sDny5SKG71tCYQ69MJZnHrrxX3mFryP06
D3AbTr4JQzd2PY6nBev/3LXrAzQOGg9KlFrp6Y6n7NIFpGwSOYceewD6abtPC6fL
7ss/L9ksyULzAI3Fo3aawOnTO/9E7nA5omSnJjz2/myTcvT6LRK/gajlmZEoBB4a
SDDUyphWfe7B1DNuZmaCWpcW8N0WYazByoV4NCH0haqueYtcgcYap1vO6JyVh9e9
/TAFSENMFes5NeAOYwagvCvJNs5sTdS6rF1cGCwwj8FeDe+VAydYL9QCPLd/F+j2
ZHrVgIc2XeJAn/8FO3Vk4mmgGioyqA==
=SUqe
-----END PGP SIGNATURE-----

--4oF+6Ged69J0+4/e--
