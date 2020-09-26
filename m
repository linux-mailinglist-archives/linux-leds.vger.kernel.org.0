Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AD772799A6
	for <lists+linux-leds@lfdr.de>; Sat, 26 Sep 2020 15:27:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727408AbgIZN1U (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 26 Sep 2020 09:27:20 -0400
Received: from vm1.sequanux.org ([188.165.36.56]:50611 "EHLO vm1.sequanux.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725208AbgIZN1U (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 26 Sep 2020 09:27:20 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by vm1.sequanux.org (Postfix) with ESMTP id 3A9B91085FD;
        Sat, 26 Sep 2020 15:27:19 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at vm1.sequanux.org
Received: from vm1.sequanux.org ([127.0.0.1])
        by localhost (vm1.sequanux.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id qQfBZDFjpb96; Sat, 26 Sep 2020 15:27:17 +0200 (CEST)
Received: from localhost (softwrestling.org [188.165.144.248])
        by vm1.sequanux.org (Postfix) with ESMTPSA id EE50910812B;
        Sat, 26 Sep 2020 15:27:16 +0200 (CEST)
Date:   Sat, 26 Sep 2020 15:27:16 +0200
From:   Simon Guinot <simon.guinot@sequanux.org>
To:     Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
Cc:     linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        dmurphy@ti.com
Subject: Re: [PATCH leds 1/2] leds: ns2: convert to fwnode API
Message-ID: <20200926132716.GI4828@kw.sim.vm.gnt>
References: <20200923141840.6333-1-kabel@kernel.org>
 <20200923141840.6333-2-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="r5lq+205vWdkqwtk"
Content-Disposition: inline
In-Reply-To: <20200923141840.6333-2-kabel@kernel.org>
User-Agent: Mutt/1.6.0 (2016-04-01)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--r5lq+205vWdkqwtk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2020 at 04:18:39PM +0200, Marek Beh=C3=BAn wrote:
> Convert from OF api to fwnode API, so that it is possible to bind this
> driver without device-tree.
>=20
> The fwnode API does not expose a function to read a specific element of
> an array. We therefore change the types of the ns2_led_modval structure
> so that we can read the whole modval array with one fwnode call.
>=20
> Signed-off-by: Marek Beh=C3=BAn <kabel@kernel.org>
> Cc: Simon Guinot <simon.guinot@sequanux.org>
> ---
>  drivers/leds/leds-ns2.c | 60 ++++++++++++++++++++---------------------
>  1 file changed, 29 insertions(+), 31 deletions(-)

=2E..

> -static int ns2_led_register(struct device *dev, struct device_node *np,
> +static int ns2_led_register(struct device *dev, struct fwnode_handle *no=
de,
>  			    struct ns2_led *led)
>  {
>  	struct led_init_data init_data =3D {};
>  	struct ns2_led_modval *modval;
>  	enum ns2_led_modes mode;
> -	int nmodes, ret, i;
> +	int nmodes, ret;
> =20
> -	led->cmd =3D devm_gpiod_get_from_of_node(dev, np, "cmd-gpio", 0,
> -					       GPIOD_ASIS, np->name);
> +	led->cmd =3D devm_fwnode_gpiod_get_index(dev, node, "cmd-gpio", 0,
> +					       GPIOD_ASIS,
> +					       fwnode_get_name(node));
>  	if (IS_ERR(led->cmd))
>  		return PTR_ERR(led->cmd);
> =20
> -	led->slow =3D devm_gpiod_get_from_of_node(dev, np, "slow-gpio", 0,
> -						GPIOD_ASIS, np->name);
> +	led->slow =3D devm_fwnode_gpiod_get_index(dev, node, "slow-gpio", 0,
> +						GPIOD_ASIS,
> +						fwnode_get_name(node));

Hi Marek,

You need to remove the "-gpio" suffix for the con_id parameter. It is
automatically and systematically appended in the fwnode_gpiod_get_index
function...

With this change, I can confirm that the led-ns2 driver is still working
using the DT path after applying the two fwnode patches (merged on the
top of the "linux,default-trigger" series). I tested it on a d2 Network
board.

I need a little bit more time to test the fwnode support on my x86
boards (with board setup files).=20

Simon

--r5lq+205vWdkqwtk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEXW8DgovlR3VS5hA0zyg/RDPmszoFAl9vQbQACgkQzyg/RDPm
szoRWg/+JK4dhtzQdoAUzSNpmNgEb4+ws2vI4YkfF6LNnXnEWaIlUN0toZZ688Yx
2uSUXIjJSNxavIT9HFBp1A1X+Nz1AdRv8coIb6UAJKI8Vj/XXnj7XH7jdTuvX3a5
VrYdVq3kqDplKEm0b2gI34heoU0VhzEc21dMPmQy5pkBTIzX2Or3Wl9FaGPwJ4kz
8g80a61CanQaR1Ozhf5EIOYYv5hUvrnon++jtJfdMM8rXduoPeSa6OBRXvVncO3Y
oZSKwaKBCF+yeF5uw+B/EUdQcX0ZihtXyKS6UjxmKQu6XOmdLbc9Cg/50EH/y21G
uC3CHhtcLunMJGnd/GkD9f/EEF+W1Y61NNR80SjPuMFYhSsKU0p1/F9PCEEIXx2O
do/EU32A0CsSW0d1pC9iUHNxqA5JSoPL1qLjzsXe3EjD5IE5hBB2sWBy94RsupWK
bal47Ep8vrQHBY2x5P4HVaO78XtjWjYGeyc39tNO/OPTs5rilAPmO5+UTBE/NtAL
nradZiN75iCfCHLU+vyMwg8R7XSyGAMFv/xicxtrmFf41Tsx1LP1jx1E9bH22vMq
1Al0/omL1JMFe9575Nqbi7kcun6CQ9GydOd+9p6fZq5HHpYMCGyIhVUYRrMAGtI+
4rvhEjv9JDuVfqd4I+DhwOWkdnCXWTuY8bCjApLTQvDr5KtU05U=
=qlJO
-----END PGP SIGNATURE-----

--r5lq+205vWdkqwtk--
