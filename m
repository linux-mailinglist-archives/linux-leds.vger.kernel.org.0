Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 338E818E25E
	for <lists+linux-leds@lfdr.de>; Sat, 21 Mar 2020 16:20:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727383AbgCUPUp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 21 Mar 2020 11:20:45 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:52352 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727028AbgCUPUp (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 21 Mar 2020 11:20:45 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id CF6FD1C032C; Sat, 21 Mar 2020 16:20:42 +0100 (CET)
Date:   Sat, 21 Mar 2020 16:20:37 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Denis Osterland-Heim <denis.osterland@diehl.com>
Cc:     "dmurphy@ti.com" <dmurphy@ti.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "uwe@kleine-koenig.org" <uwe@kleine-koenig.org>
Subject: Re: [PATCH v4 3/5] leds: pwm: check result of led_pwm_set() in
 led_pwm_add()
Message-ID: <20200321152037.GB8386@duo.ucw.cz>
References: <20200321081321.15614-1-Denis.Osterland@diehl.com>
 <20200321081321.15614-4-Denis.Osterland@diehl.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="8GpibOaaTibBMecb"
Content-Disposition: inline
In-Reply-To: <20200321081321.15614-4-Denis.Osterland@diehl.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--8GpibOaaTibBMecb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> led_pwm_set() now returns an error when setting the PWM fails.
>=20
> Cc: Uwe Kleine-K=F6nig <uwe@kleine-koenig.org>
> Signed-off-by: Denis Osterland-Heim <Denis.Osterland@diehl.com>

I applied 1 and 2, but 3 failed for me. I'll push updated -next, can
you see what is going on there?

Best regards,
								Pavel

> +++ b/drivers/leds/leds-pwm.c
> @@ -91,15 +91,21 @@ static int led_pwm_add(struct device *dev, struct led=
_pwm_priv *priv,
>  	pwm_init_state(led_data->pwm, &led_data->pwmstate);
> =20
>  	ret =3D devm_led_classdev_register(dev, &led_data->cdev);
> -	if (ret =3D=3D 0) {
> -		priv->num_leds++;
> -		led_pwm_set(&led_data->cdev, led_data->cdev.brightness);
> -	} else {
> +	if (ret) {
>  		dev_err(dev, "failed to register PWM led for %s: %d\n",
>  			led->name, ret);
> +		return ret;
>  	}
> =20
> -	return ret;
> +	ret =3D led_pwm_set(&led_data->cdev, led_data->cdev.brightness);
> +	if (ret) {
> +		dev_err(dev, "failed to set led PWM value for %s: %d",
> +			led->name, ret);
> +		return ret;
> +	}
> +
> +	priv->num_leds++;
> +	return 0;
>  }
> =20
>  static int led_pwm_create_fwnode(struct device *dev, struct
> led_pwm_priv *priv)

>=20
> The contents of the above mentioned e-mail is not legally
> binding. This e-mail contains confidential and/or legally protected
> information. Please inform us if you have received this e-mail by

This is lie. Please don't do this.
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--8GpibOaaTibBMecb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXnYwxQAKCRAw5/Bqldv6
8kXiAJ4npfPQ8vzqkySsj2s8Qpj/BC45GwCgwKItekyjd/+ilSTTBVyp1/byw3A=
=rXOy
-----END PGP SIGNATURE-----

--8GpibOaaTibBMecb--
