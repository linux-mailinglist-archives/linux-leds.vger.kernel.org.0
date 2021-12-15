Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C43B4476333
	for <lists+linux-leds@lfdr.de>; Wed, 15 Dec 2021 21:26:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234302AbhLOU0X (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 15 Dec 2021 15:26:23 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:45734 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231725AbhLOU0V (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 15 Dec 2021 15:26:21 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 9CF231C0B9C; Wed, 15 Dec 2021 21:26:20 +0100 (CET)
Date:   Wed, 15 Dec 2021 21:26:16 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V2 2/2] leds: bcm63xxx: add support for BCM63138
 controller
Message-ID: <20211215202616.GB28336@duo.ucw.cz>
References: <20211124111952.22419-1-zajec5@gmail.com>
 <20211124111952.22419-2-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="0ntfKIWw70PvrIHh"
Content-Disposition: inline
In-Reply-To: <20211124111952.22419-2-zajec5@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--0ntfKIWw70PvrIHh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> It's a new controller first introduced in BCM63138 SoC. Later it was
> also used in BCM4908, some BCM68xx and some BCM63xxx SoCs.
>=20

> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index ed800f5da7d8..3bde795f0951 100644
> --- a/drivers/leds/Kconfig

Lets put it into drivers/leds/blink/, please.

> --- /dev/null
> +++ b/drivers/leds/leds-bcm63138.c
> @@ -0,0 +1,314 @@

> +#define BCM63138_LED_BITS				4				/* how many bits control a single LED =
*/
> +#define BCM63138_LED_MASK				((1 << BCM63138_LED_BITS) - 1)	/* 0xf */
> +#define BCM63138_LEDS_PER_REG				(32 / BCM63138_LED_BITS)	/* 8 */

I'm not sure these kinds of defines are useful.

> +static void bcm63138_leds_create_led(struct bcm63138_leds *leds,
> +				     struct device_node *np)
> +{
> +	struct led_init_data init_data =3D {
> +		.fwnode =3D of_fwnode_handle(np),
> +	};
> +	struct device *dev =3D leds->dev;
> +	struct bcm63138_led *led;
> +	struct pinctrl *pinctrl;
> +	const char *state;
> +	u32 bit;
> +	int err;
> +
> +	led =3D devm_kzalloc(dev, sizeof(*led), GFP_KERNEL);
> +	if (!led)
> +		return;

At least warn. User wants to know why his leds don't work.

> +	if (!of_property_read_string(np, "default-state", &state)) {
> +		if (!strcmp(state, "on"))
> +			led->cdev.brightness =3D LED_FULL;
> +		else
> +			led->cdev.brightness =3D LED_OFF;
> +	} else {
> +		led->cdev.brightness =3D LED_OFF;
> +	}

Do you actually need default-state support? Just remove it if not.

You support 4 bit brightness. You should set max_brightness to
15. LED_FULL is mistake (or very old API) in your case.

Otherwise looks quite sane.

Thank you,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--0ntfKIWw70PvrIHh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYbpPaAAKCRAw5/Bqldv6
8lP/AJ9Jxxu+ZcyW5A4NYHjHu7LAr6i7+wCeM0c6oBeyXVqpGlTNwhykMcCJozM=
=XETW
-----END PGP SIGNATURE-----

--0ntfKIWw70PvrIHh--
