Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F25E42419C1
	for <lists+linux-leds@lfdr.de>; Tue, 11 Aug 2020 12:29:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728590AbgHKK34 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 11 Aug 2020 06:29:56 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:53932 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728346AbgHKK34 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 11 Aug 2020 06:29:56 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 809AD1C0BDD; Tue, 11 Aug 2020 12:29:53 +0200 (CEST)
Date:   Tue, 11 Aug 2020 12:29:53 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, robh@kernel.org, marek.behun@nic.cz,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v32 2/6] leds: lp50xx: Add the LP50XX family of the RGB
 LED driver
Message-ID: <20200811102953.nio3rslben3oymxb@duo.ucw.cz>
References: <20200722153146.8767-1-dmurphy@ti.com>
 <20200722153146.8767-3-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="lntfdynxwgttg4sl"
Content-Disposition: inline
In-Reply-To: <20200722153146.8767-3-dmurphy@ti.com>
User-Agent: NeoMutt/20180716
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--lntfdynxwgttg4sl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Introduce the LP5036/30/24/18/12/9 RGB LED driver.
> The difference in these parts are the number of
> LED outputs where the:
>=20
> LP5036 can control 36 LEDs
> LP5030 can control 30 LEDs
> LP5024 can control 24 LEDs
> LP5018 can control 18 LEDs
> LP5012 can control 12 LEDs
> LP5009 can control 9 LEDs
>=20
> The device has the ability to group LED outputs into control banks
> so that multiple LED banks can be controlled with the same mixing and
> brightness. Or the LED outputs can also be controlled independently.
>=20

> diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
> new file mode 100644
> index 000000000000..f4ef9b7f21b2
> --- /dev/null
> +++ b/drivers/leds/leds-lp50xx.c
> @@ -0,0 +1,791 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// TI LP50XX LED chip family driver
> +// Copyright (C) 2018 Texas Instruments Incorporated - https://www.ti.co=
m/

I assume 2018-2020


> +#define LP5012_OUT0_CLR		0x0b
> +#define LP5012_OUT1_CLR		0x0c
> +#define LP5012_OUT2_CLR		0x0d
> +#define LP5012_OUT3_CLR		0x0e
> +#define LP5012_OUT4_CLR		0x0f
> +#define LP5012_OUT5_CLR		0x10
> +#define LP5012_OUT6_CLR		0x11
> +#define LP5012_OUT7_CLR		0x12
> +#define LP5012_OUT8_CLR		0x13
> +#define LP5012_OUT9_CLR		0x14
> +#define LP5012_OUT10_CLR	0x15
> +#define LP5012_OUT11_CLR	0x16
> +
> +#define LP5024_OUT0_CLR		0x0f
> +#define LP5024_OUT1_CLR		0x10
> +#define LP5024_OUT2_CLR		0x11
> +#define LP5024_OUT3_CLR		0x12
> +#define LP5024_OUT4_CLR		0x13
> +#define LP5024_OUT5_CLR		0x14
> +#define LP5024_OUT6_CLR		0x15
> +#define LP5024_OUT7_CLR		0x16
> +#define LP5024_OUT8_CLR		0x17
> +#define LP5024_OUT9_CLR		0x18
> +#define LP5024_OUT10_CLR	0x19
> +#define LP5024_OUT11_CLR	0x1a
> +#define LP5024_OUT12_CLR	0x1b
> +#define LP5024_OUT13_CLR	0x1c
> +#define LP5024_OUT14_CLR	0x1d
> +#define LP5024_OUT15_CLR	0x1e
> +#define LP5024_OUT16_CLR	0x1f
> +#define LP5024_OUT17_CLR	0x20
> +#define LP5024_OUT18_CLR	0x21
> +#define LP5024_OUT19_CLR	0x22
> +#define LP5024_OUT20_CLR	0x23
> +#define LP5024_OUT21_CLR	0x24
> +#define LP5024_OUT22_CLR	0x25
> +#define LP5024_OUT23_CLR	0x26

> +#define LP5036_OUT0_CLR		0x14
> +#define LP5036_OUT1_CLR		0x15
> +#define LP5036_OUT2_CLR		0x16
> +#define LP5036_OUT3_CLR		0x17
> +#define LP5036_OUT4_CLR		0x18
> +#define LP5036_OUT5_CLR		0x19
> +#define LP5036_OUT6_CLR		0x1a
> +#define LP5036_OUT7_CLR		0x1b
> +#define LP5036_OUT8_CLR		0x1c
> +#define LP5036_OUT9_CLR		0x1d
> +#define LP5036_OUT10_CLR	0x1e
> +#define LP5036_OUT11_CLR	0x1f
> +#define LP5036_OUT12_CLR	0x20
> +#define LP5036_OUT13_CLR	0x21
> +#define LP5036_OUT14_CLR	0x22
> +#define LP5036_OUT15_CLR	0x23
> +#define LP5036_OUT16_CLR	0x24
> +#define LP5036_OUT17_CLR	0x25
> +#define LP5036_OUT18_CLR	0x26
> +#define LP5036_OUT19_CLR	0x27
> +#define LP5036_OUT20_CLR	0x28
> +#define LP5036_OUT21_CLR	0x29
> +#define LP5036_OUT22_CLR	0x2a
> +#define LP5036_OUT23_CLR	0x2b
> +#define LP5036_OUT24_CLR	0x2c
> +#define LP5036_OUT25_CLR	0x2d
> +#define LP5036_OUT26_CLR	0x2e
> +#define LP5036_OUT27_CLR	0x2f
> +#define LP5036_OUT28_CLR	0x30
> +#define LP5036_OUT29_CLR	0x31
> +#define LP5036_OUT30_CLR	0x32
> +#define LP5036_OUT31_CLR	0x33
> +#define LP5036_OUT32_CLR	0x34
> +#define LP5036_OUT33_CLR	0x35
> +#define LP5036_OUT34_CLR	0x36
> +#define LP5036_OUT35_CLR	0x37

These are really useless. Please get rid of them.

> +#define LP5009_MAX_LED_MODULES	2
> +#define LP5012_MAX_LED_MODULES	4
> +#define LP5018_MAX_LED_MODULES	6
> +#define LP5024_MAX_LED_MODULES	8
> +#define LP5030_MAX_LED_MODULES	10
> +#define LP5036_MAX_LED_MODULES	12
> +
> +#define LP5009_MAX_LEDS	(LP5009_MAX_LED_MODULES * LP50XX_LEDS_PER_MODULE)
> +#define LP5012_MAX_LEDS	(LP5012_MAX_LED_MODULES * LP50XX_LEDS_PER_MODULE)
> +#define LP5018_MAX_LEDS	(LP5018_MAX_LED_MODULES * LP50XX_LEDS_PER_MODULE)
> +#define LP5024_MAX_LEDS	(LP5024_MAX_LED_MODULES * LP50XX_LEDS_PER_MODULE)
> +#define LP5030_MAX_LEDS	(LP5030_MAX_LED_MODULES * LP50XX_LEDS_PER_MODULE)
> +#define LP5036_MAX_LEDS	(LP5036_MAX_LED_MODULES *  LP50XX_LEDS_PER_MODUL=
E)

As are these. In general, when define is used just once, please think
if we really need it.

> +static int lp50xx_probe_dt(struct lp50xx *priv)
> +{
> +	struct fwnode_handle *child =3D NULL;
> +	struct fwnode_handle *led_node =3D NULL;
> +	struct led_init_data init_data =3D {};
> +	struct led_classdev *led_cdev;
> +	struct mc_subled *mc_led_info;
> +	struct lp50xx_led *led;
> +	int num_colors;
> +	u32 color_id;
> +	size_t i =3D 0;

No reason this has to be size_t. Int?

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--lntfdynxwgttg4sl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXzJzIQAKCRAw5/Bqldv6
8jwAAJ9Yru0d8eEJ1s1ZPt666hXIlgwzaACfS9DsSExP7fW6ZZqe9kNSlcJo06A=
=DGUE
-----END PGP SIGNATURE-----

--lntfdynxwgttg4sl--
