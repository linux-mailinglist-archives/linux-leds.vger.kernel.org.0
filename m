Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F4AD1700BB
	for <lists+linux-leds@lfdr.de>; Wed, 26 Feb 2020 15:08:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726695AbgBZOI5 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 26 Feb 2020 09:08:57 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:42016 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726278AbgBZOI4 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 26 Feb 2020 09:08:56 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id A0F481C0411; Wed, 26 Feb 2020 15:08:54 +0100 (CET)
Date:   Wed, 26 Feb 2020 15:08:54 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Ondrej Jirman <megous@megous.com>
Cc:     linux-sunxi@googlegroups.com,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <mripard@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/4] leds: axp20x: Support charger LED on AXP20x like
 PMICs
Message-ID: <20200226140854.GJ4080@duo.ucw.cz>
References: <20200223131435.681620-1-megous@megous.com>
 <20200223131435.681620-3-megous@megous.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="pMCBjikF2xGw87uL"
Content-Disposition: inline
In-Reply-To: <20200223131435.681620-3-megous@megous.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--pMCBjikF2xGw87uL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> There is single LED that can be turned on and off by the user, or set to
> be controlled by the charger in 2 different modes.
>=20
> The driver initializes the LED to be controlled by the charger, but
> allows to switch it to user control, and change the mode of charging
> indication via a sysfs.

You'd need to document new "control" file.

But hold on, it is not an only driver with this "user-or-hardware"
feature, and we want to have a common solution. And that solution is
probably to have "hw-charger" trigger _just for this_ LED.

I can easily take a driver that always handles it as a "user" LED, if
you can get ACKs from device tree people on the documentation patches.=20

> +	led->regmap =3D axp20x->regmap;
> +
> +	led->cdev.name =3D "axp20x-chgarger-led";

typo.

> +static void axp20x_led_shutdown(struct platform_device *pdev)
> +{
> +	struct axp20x_led *led =3D platform_get_drvdata(pdev);
> +
> +	/* On shutdown, we want to give LED control back to the PMIC,
> +	 * so that it doesn't stay on, while the system is off.
> +	 */

Comment style.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--pMCBjikF2xGw87uL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXlZ79gAKCRAw5/Bqldv6
8nOWAJ9NQxUKukUGwa5fNg6SxG8/V3ZUsACgmEnR1/qSwGL7JhaQyk2Eu8m93Ok=
=jl8u
-----END PGP SIGNATURE-----

--pMCBjikF2xGw87uL--
