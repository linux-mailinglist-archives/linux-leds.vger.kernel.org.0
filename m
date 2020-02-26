Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E8DF17007B
	for <lists+linux-leds@lfdr.de>; Wed, 26 Feb 2020 14:53:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727198AbgBZNxs (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 26 Feb 2020 08:53:48 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:40336 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727255AbgBZNxs (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 26 Feb 2020 08:53:48 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id C77FB1C0411; Wed, 26 Feb 2020 14:53:46 +0100 (CET)
Date:   Wed, 26 Feb 2020 14:53:43 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     qiwuchen55@gmail.com
Cc:     jacek.anaszewski@gmail.com, dmurphy@ti.com,
        linux-leds@vger.kernel.org, chenqiwu <chenqiwu@xiaomi.com>
Subject: Re: [PATCH] leds: use devm_platform_ioremap_resource_byname()
Message-ID: <20200226135343.GG4080@duo.ucw.cz>
References: <1581695301-16604-1-git-send-email-qiwuchen55@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="iAL9S67WQOXgEPD9"
Content-Disposition: inline
In-Reply-To: <1581695301-16604-1-git-send-email-qiwuchen55@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--iAL9S67WQOXgEPD9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> From: chenqiwu <chenqiwu@xiaomi.com>
>=20
> Use devm_platform_ioremap_resource_byname() instead of calling
> platform_get_resource_byname() and devm_ioremap_resource() separately.
>=20
> Signed-off-by: chenqiwu <chenqiwu@xiaomi.com>

Was this tested? Can you cc driver authors to get it tested?

> index ef22e1e..76af9d8 100644
> --- a/drivers/leds/leds-cobalt-qube.c
> +++ b/drivers/leds/leds-cobalt-qube.c
> @@ -36,15 +36,9 @@ static void qube_front_led_set(struct led_classdev *le=
d_cdev,
> =20
>  static int cobalt_qube_led_probe(struct platform_device *pdev)
>  {
> -	struct resource *res;
> -
> -	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (!res)
> -		return -EBUSY;
> -
> -	led_port =3D devm_ioremap(&pdev->dev, res->start, resource_size(res));
> -	if (!led_port)
> -		return -ENOMEM;
> +	led_port =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(led_port))
> +		return PTR_ERR(led_port);
> =20
>  	led_value =3D LED_FRONT_LEFT | LED_FRONT_RIGHT;
>  	writeb(led_value, led_port);
> diff --git a/drivers/leds/leds-cobalt-raq.c b/drivers/leds/leds-cobalt-ra=
q.c
> index 045c239..8b1317d 100644
> --- a/drivers/leds/leds-cobalt-raq.c
> +++ b/drivers/leds/leds-cobalt-raq.c
> @@ -65,16 +65,11 @@ static void raq_power_off_led_set(struct led_classdev=
 *led_cdev,
> =20
>  static int cobalt_raq_led_probe(struct platform_device *pdev)
>  {
> -	struct resource *res;
>  	int retval;
> =20
> -	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (!res)
> -		return -EBUSY;
> -
> -	led_port =3D devm_ioremap(&pdev->dev, res->start, resource_size(res));
> -	if (!led_port)
> -		return -ENOMEM;
> +	led_port =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(led_port))
> +		return PTR_ERR(led_port);
> =20
>  	retval =3D led_classdev_register(&pdev->dev, &raq_power_off_led);
>  	if (retval)
> @@ -90,6 +85,7 @@ static int cobalt_raq_led_probe(struct platform_device =
*pdev)
>  	led_classdev_unregister(&raq_power_off_led);
> =20
>  err_null:
> +	devm_ioremap_release(&pdev->dev, led_port);
>  	led_port =3D NULL;
> =20
>  	return retval;

How is it that manual devm_ioremap_release() is neccessary here but
not in the other driver?

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--iAL9S67WQOXgEPD9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXlZ4ZwAKCRAw5/Bqldv6
8vfyAJ4mu9/ivCAHv+XlF9gRywTfVey6hACgrvqjk+pvlxz0ZxtZIjQiP5r1eWg=
=BqyJ
-----END PGP SIGNATURE-----

--iAL9S67WQOXgEPD9--
