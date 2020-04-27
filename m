Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 889641BA373
	for <lists+linux-leds@lfdr.de>; Mon, 27 Apr 2020 14:17:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726963AbgD0MRh (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 27 Apr 2020 08:17:37 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:47698 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726260AbgD0MRh (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 27 Apr 2020 08:17:37 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 2434B1C024D; Mon, 27 Apr 2020 14:17:36 +0200 (CEST)
Date:   Mon, 27 Apr 2020 14:17:20 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     qiwuchen55@gmail.com
Cc:     florian@openwrt.org, yuasa@linux-mips.org,
        jacek.anaszewski@gmail.com, dmurphy@ti.com,
        linux-leds@vger.kernel.org, chenqiwu <chenqiwu@xiaomi.com>
Subject: Re: [PATCH v2] leds: use devm_platform_ioremap_resource() API to
 simplify code
Message-ID: <20200427121720.GC544@duo.ucw.cz>
References: <cover.1582732388.git.chenqiwu@xiaomi.com>
 <66479474345d3df541eca961d953c6b4420c87ce.1582732388.git.chenqiwu@xiaomi.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="da4uJneut+ArUgXk"
Content-Disposition: inline
In-Reply-To: <66479474345d3df541eca961d953c6b4420c87ce.1582732388.git.chenqiwu@xiaomi.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--da4uJneut+ArUgXk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> From: chenqiwu <chenqiwu@xiaomi.com>
>=20
> 1. Use a wrapped API devm_platform_ioremap_resource() instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately to simplify code.
> 2. Add error checking and error processing for led driver probe.
>=20
> Signed-off-by: chenqiwu <chenqiwu@xiaomi.com>

Do you still want me to apply this?

Did someone test it?

> +++ b/drivers/leds/leds-cobalt-qube.c
> @@ -36,20 +36,22 @@ static void qube_front_led_set(struct led_classdev *l=
ed_cdev,
> =20
>  static int cobalt_qube_led_probe(struct platform_device *pdev)
>  {
> -	struct resource *res;
> +	int retval;
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
>  	led_value =3D LED_FRONT_LEFT | LED_FRONT_RIGHT;
>  	writeb(led_value, led_port);
> =20
> -	return devm_led_classdev_register(&pdev->dev, &qube_front_led);
> +	retval =3D devm_led_classdev_register(&pdev->dev, &qube_front_led);
> +	if (retval) {
> +		devm_ioremap_release(&pdev->dev, led_port);
> +		led_port =3D NULL;
> +	}

Do we need to do the devm_..._release?
									Pavel
								=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--da4uJneut+ArUgXk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXqbNUAAKCRAw5/Bqldv6
8jmMAKCEBnNku281uacd+bG0qR1ALiRcmACfcYjcI72JZWGmMqZ4yuVc23DbX0c=
=cWXS
-----END PGP SIGNATURE-----

--da4uJneut+ArUgXk--
