Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C729F337B71
	for <lists+linux-leds@lfdr.de>; Thu, 11 Mar 2021 18:57:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229814AbhCKR5F (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 11 Mar 2021 12:57:05 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:54964 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229879AbhCKR4t (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 11 Mar 2021 12:56:49 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 143641C0B77; Thu, 11 Mar 2021 18:56:47 +0100 (CET)
Date:   Thu, 11 Mar 2021 18:56:46 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Hermes Zhang <chenhui.zhang@axis.com>
Cc:     Dan Murphy <dmurphy@ti.com>, kernel@axis.com,
        Hermes Zhang <chenhuiz@axis.com>, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: leds-dual-gpio: Add dual GPIO LEDs driver
Message-ID: <20210311175646.GA11088@duo.ucw.cz>
References: <20210311130408.10820-1-chenhui.zhang@axis.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="qMm9M+Fa2AknHoGS"
Content-Disposition: inline
In-Reply-To: <20210311130408.10820-1-chenhui.zhang@axis.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!


> From: Hermes Zhang <chenhuiz@axis.com>
>=20
> Introduce a new Dual GPIO LED driver. These two GPIOs LED will act as
> one LED as normal GPIO LED but give the possibility to change the
> intensity in four levels: OFF, LOW, MIDDLE and HIGH.

Do you have hardware that uses it?

Seems reasonably sane, but:

> +config LEDS_DUAL_GPIO
> +	tristate "LED Support for Dual GPIO connected LEDs"
> +	depends on LEDS_CLASS
> +	depends on GPIOLIB || COMPILE_TEST

This will break compile, right?

Describe which hardware needs it in Kconfig.

> index 2a698df9da57..10015cc81f79 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile

Put it into leds/simple . You may need to create it.

No dts bindings etc?

> +#define GPIO_LOGICAL_ON   1
> +#define GPIO_LOGICAL_OFF  0

Let's not do that.

> +	priv =3D container_of(led_cdev, struct gpio_dual_leds_priv, cdev);
> +
> +	if (value =3D=3D LED_FULL) {
> +		gpiod_set_value(priv->low_gpio, GPIO_LOGICAL_ON);
> +		gpiod_set_value(priv->high_gpio, GPIO_LOGICAL_ON);
> +	} else if (value < LED_FULL && value > LED_HALF) {
> +		/* Enable high only */
> +		gpiod_set_value(priv->low_gpio, GPIO_LOGICAL_OFF);
> +		gpiod_set_value(priv->high_gpio, GPIO_LOGICAL_ON);
> +	} else if (value <=3D LED_HALF && value > LED_OFF) {
> +		/* Enable low only */
> +		gpiod_set_value(priv->low_gpio, GPIO_LOGICAL_ON);
> +		gpiod_set_value(priv->high_gpio, GPIO_LOGICAL_OFF);
> +	} else {
> +		gpiod_set_value(priv->low_gpio, GPIO_LOGICAL_OFF);
> +		gpiod_set_value(priv->high_gpio, GPIO_LOGICAL_OFF);
> +	}
> +}

Make max brightness 4 and use logical operations to set the right
values.

> +	priv->cdev.name =3D of_get_property(node, "label", NULL);
> +	priv->cdev.max_brightness =3D LED_FULL;

=3D 3.


> +static const struct of_device_id of_gpio_dual_leds_match[] =3D {
> +	{ .compatible =3D "gpio-dual-leds", },

Need dts docs for this.


> +MODULE_DESCRIPTION("Dual GPIO LED driver");
> +MODULE_LICENSE("GPL v2");

MODULE_AUTHOR?

GPL v2+ if you can do that easily.

Best regards,
								Pavel

--=20
http://www.livejournal.com/~pavelmachek

--qMm9M+Fa2AknHoGS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYEpZ3gAKCRAw5/Bqldv6
8mJ0AJ9f/8ma0HFtMfdwbHjo117qF//KggCfdOMBp2A2ug22BKkVZdL/UA6RD+M=
=mBc4
-----END PGP SIGNATURE-----

--qMm9M+Fa2AknHoGS--
