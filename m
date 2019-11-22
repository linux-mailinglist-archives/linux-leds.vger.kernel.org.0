Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F447107346
	for <lists+linux-leds@lfdr.de>; Fri, 22 Nov 2019 14:32:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726747AbfKVNce (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 22 Nov 2019 08:32:34 -0500
Received: from foss.arm.com ([217.140.110.172]:47614 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726633AbfKVNcd (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 22 Nov 2019 08:32:33 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA49731B;
        Fri, 22 Nov 2019 05:32:32 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 617BF3F703;
        Fri, 22 Nov 2019 05:32:32 -0800 (PST)
Date:   Fri, 22 Nov 2019 13:32:30 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Sven Van Asbroeck <thesven73@gmail.com>,
        Axel Lin <axel.lin@ingics.com>, Dan Murphy <dmurphy@ti.com>,
        devicetree@vger.kernel.org, Grigoryev Denis <grigoryev@fastwel.ru>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>
Subject: Re: Applied "tps6105x: add optional devicetree support" to the
 regulator tree
Message-ID: <20191122133230.GD6849@sirena.org.uk>
References: <20191119154611.29625-2-TheSven73@gmail.com>
 <applied-20191119154611.29625-2-TheSven73@gmail.com>
 <20191122073124.GA3296@dell>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Qrgsu6vtpU/OV/zm"
Content-Disposition: inline
In-Reply-To: <20191122073124.GA3296@dell>
X-Cookie: sillema sillema nika su
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--Qrgsu6vtpU/OV/zm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 22, 2019 at 07:31:24AM +0000, Lee Jones wrote:
> On Wed, 20 Nov 2019, Mark Brown wrote:

> > Example: put chip in regulator mode:

> > i2c0 {
> > 	tps61052@33 {
> > 		compatible =3D "ti,tps61052";
> > 		reg =3D <0x33>;
> >=20
> > 		regulator {
> >                             regulator-min-microvolt =3D <5000000>;
> >                             regulator-max-microvolt =3D <5000000>;
> >                             regulator-always-on;
> > 		};
> > 	};
> > };

> ?

Sorry, I completely missed that this was adding a MFD file - the binding
only mentioned regulator stuff and I clearly didn't look at the
filename.  Do you want me to drop it?

--Qrgsu6vtpU/OV/zm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3X420ACgkQJNaLcl1U
h9A+dwf9F8AlkRemvtREyMZpewdCJ0ovvR/f76eStncNGq9odeCRfkw7R9l7SDZx
gCd0WiEkEMecVYjARC8uYv6pJ/CyVDD0UvVp5ZmLc7cJRFgyKWzOfyIQoM+1BDwI
nzPzQim+DdOmmjB+3/gxHQ4JAjBx9R9S+D/NwQGpLQdEQHhzrKDvLz3BY1mvLJCh
1wBvAX2x/xnHwVkQ4wH4mmyQnvE2uWXeuv9kyv9b8iW/jREtFBrK9w/m8SyyVUjO
8kInYGaOgmwHKX3PSzy+6tKNT8KpGPIdzLgUOji8JUxy0yK2cRfXPrQwzKGA3N1x
ypeqE8aNQ6TS3kcHieEFIb3OVrD1Ag==
=YBx2
-----END PGP SIGNATURE-----

--Qrgsu6vtpU/OV/zm--
