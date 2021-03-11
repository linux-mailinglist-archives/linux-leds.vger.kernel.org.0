Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CF84337BA2
	for <lists+linux-leds@lfdr.de>; Thu, 11 Mar 2021 19:03:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbhCKSC7 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 11 Mar 2021 13:02:59 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:55668 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbhCKSC2 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 11 Mar 2021 13:02:28 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id DF94E1C0B77; Thu, 11 Mar 2021 19:02:25 +0100 (CET)
Date:   Thu, 11 Mar 2021 19:02:25 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Hermes Zhang <chenhui.zhang@axis.com>
Cc:     Dan Murphy <dmurphy@ti.com>, kernel@axis.com,
        Hermes Zhang <chenhuiz@axis.com>, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: leds-dual-gpio: Add dual GPIO LEDs driver
Message-ID: <20210311180225.GA11650@duo.ucw.cz>
References: <20210311130408.10820-1-chenhui.zhang@axis.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="h31gzZEtNLTqOjlF"
Content-Disposition: inline
In-Reply-To: <20210311130408.10820-1-chenhui.zhang@axis.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--h31gzZEtNLTqOjlF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> +	priv =3D devm_kzalloc(dev, sizeof(struct gpio_dual_leds_priv), GFP_KERN=
EL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->low_gpio =3D devm_gpiod_get(dev, "low", GPIOD_OUT_LOW);
> +	ret =3D PTR_ERR_OR_ZERO(priv->low_gpio);
> +	if (ret) {
> +		dev_err(dev, "cannot get low-gpios %d\n", ret);
> +		return ret;
> +	}
> +
> +	priv->high_gpio =3D devm_gpiod_get(dev, "high", GPIOD_OUT_LOW);
> +	ret =3D PTR_ERR_OR_ZERO(priv->high_gpio);
> +	if (ret) {
> +		dev_err(dev, "cannot get high-gpios %d\n", ret);
> +		return ret;
> +	}

Actually... I'd call it led-0 and led-1 or something. Someone may/will
come with 4-bit GPIO LED one day, and it would be cool if this could
be used with minimal effort.

Calling it multi_led in the driver/bindings would bnot be bad, either.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--h31gzZEtNLTqOjlF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYEpbMQAKCRAw5/Bqldv6
8jqjAKCWcWAkZNGGAxNOIktK1uCe6A8zRQCgjkpPZ+LbgMY8O6aNtfahC4gUE60=
=5aO+
-----END PGP SIGNATURE-----

--h31gzZEtNLTqOjlF--
