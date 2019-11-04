Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C373EDB72
	for <lists+linux-leds@lfdr.de>; Mon,  4 Nov 2019 10:16:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728269AbfKDJQI (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 4 Nov 2019 04:16:08 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:33908 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728251AbfKDJQI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 4 Nov 2019 04:16:08 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 395541C06CA; Mon,  4 Nov 2019 10:09:28 +0100 (CET)
Date:   Mon, 4 Nov 2019 10:09:27 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Oleh Kravchenko <oleg@kaa.org.ua>
Cc:     linux-leds@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [RESEND PATCH] leds: mlxreg: Fix possible buffer overflow
Message-ID: <20191104090927.GD12355@duo.ucw.cz>
References: <20191016072430.27020-1-oleg@kaa.org.ua>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="5p8PegU4iirBW1oA"
Content-Disposition: inline
In-Reply-To: <20191016072430.27020-1-oleg@kaa.org.ua>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--5p8PegU4iirBW1oA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2019-10-16 10:24:30, Oleh Kravchenko wrote:
> Error was detected by PVS-Studio:
> V512 A call of the 'sprintf' function will lead to overflow of
> the buffer 'led_data->led_cdev_name'.
>=20
> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Acked-by: Pavel Machek <pavel@ucw.cz>
> Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>

Thanks for resend, and sorry for the delay.

Note that this would only be security issue if someone did malicious
device tree... so... not a security issue :-).

Applied.

								Pavel

> index cabe379071a7..82aea1cd0c12 100644
> --- a/drivers/leds/leds-mlxreg.c
> +++ b/drivers/leds/leds-mlxreg.c
> @@ -228,8 +228,8 @@ static int mlxreg_led_config(struct mlxreg_led_priv_d=
ata *priv)
>  			brightness =3D LED_OFF;
>  			led_data->base_color =3D MLXREG_LED_GREEN_SOLID;
>  		}
> -		sprintf(led_data->led_cdev_name, "%s:%s", "mlxreg",
> -			data->label);
> +		snprintf(led_data->led_cdev_name, sizeof(led_data->led_cdev_name),
> +			 "mlxreg:%s", data->label);
>  		led_cdev->name =3D led_data->led_cdev_name;
>  		led_cdev->brightness =3D brightness;
>  		led_cdev->max_brightness =3D LED_ON;
> --=20
> 2.21.0

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--5p8PegU4iirBW1oA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXb/qxwAKCRAw5/Bqldv6
8p7+AKDBTNpFSDM3veonmG+QUTFreH/B9ACbBuY+p4KcjjbMYwyeZ9U6lqVkwu4=
=6EEK
-----END PGP SIGNATURE-----

--5p8PegU4iirBW1oA--
