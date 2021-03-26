Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FDEF34A8F5
	for <lists+linux-leds@lfdr.de>; Fri, 26 Mar 2021 14:50:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229986AbhCZNuA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 26 Mar 2021 09:50:00 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:58144 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229848AbhCZNtn (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 26 Mar 2021 09:49:43 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 117891C0B79; Fri, 26 Mar 2021 14:49:40 +0100 (CET)
Date:   Fri, 26 Mar 2021 14:49:39 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Hermes Zhang <chenhui.zhang@axis.com>
Cc:     dmurphy@ti.com, robh+dt@kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        chenhuiz@axis.com, lkml@axis.com, kernel@axis.com
Subject: Re: [PATCH v2 2/2] leds: leds-multi-gpio: Add multiple GPIOs LED
 driver
Message-ID: <20210326134939.GA11578@duo.ucw.cz>
References: <20210326052801.17666-1-chenhui.zhang@axis.com>
 <20210326052801.17666-3-chenhui.zhang@axis.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="nFreZHaLTZJo0R7j"
Content-Disposition: inline
In-Reply-To: <20210326052801.17666-3-chenhui.zhang@axis.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--nFreZHaLTZJo0R7j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Introduce a new multiple GPIOs LED driver. This LED will made of
> multiple GPIOs (up to 8) and will map different brightness to different
> GPIOs states which defined in dts file.
>=20
> Signed-off-by: Hermes Zhang <chenhuiz@axis.com>


> index 000000000000..7aef82701f86
> --- /dev/null
> +++ b/drivers/leds/simple/Kconfig
> @@ -0,0 +1,23 @@
> +menuconfig LEDS_SIMPLE
> +	bool "Simple LED support"
> +	depends on LEDS_CLASS
> +	help
> +	  This option enables simple leds support for the leds class.
> +	  If unsure, say Y.

No need for new config symbol.

> +	if (ret !=3D 1 << gpios->ndescs) {

I'd do (ret !=3D (1 << gpios->ndescs))

> +	priv =3D devm_kzalloc(dev, sizeof(struct multi_gpio_led_priv)
> +			+ sizeof(u8) * nr_states , GFP_KERNEL);

Sizeof(u8) is always 1, no need for space before , .=20

> +	of_property_read_string(node, "default-state", &state);
> +	if (!strcmp(state, "on"))
> +		multi_gpio_led_set(&priv->cdev, priv->cdev.max_brightness);
> +	else
> +		multi_gpio_led_set(&priv->cdev, 0);

No need for default-state handling, unless you are using it.

Best regards,
									Pavel

--=20
http://www.livejournal.com/~pavelmachek

--nFreZHaLTZJo0R7j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYF3mcwAKCRAw5/Bqldv6
8iiPAJ47/ujR5FS1TCSuqXA9z24+8Rw4oACgsOhBEfa0VYT6Dm0hl4/t3FGpQx8=
=ox8t
-----END PGP SIGNATURE-----

--nFreZHaLTZJo0R7j--
