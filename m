Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F055BA6AE4
	for <lists+linux-leds@lfdr.de>; Tue,  3 Sep 2019 16:12:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729452AbfICOMg (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 3 Sep 2019 10:12:36 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:57580 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728679AbfICOMf (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 3 Sep 2019 10:12:35 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 6A65481FA1; Tue,  3 Sep 2019 16:12:18 +0200 (CEST)
Date:   Tue, 3 Sep 2019 16:12:31 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Oleh Kravchenko <oleg@kaa.org.ua>
Cc:     linux-leds@vger.kernel.org
Subject: Re: [PATCH 1/2] leds: mlxreg: Fix possible buffer overflow
Message-ID: <20190903141231.GA8199@amd>
References: <20190903125020.20482-1-oleg@kaa.org.ua>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="envbJBWh7q8WU6mo"
Content-Disposition: inline
In-Reply-To: <20190903125020.20482-1-oleg@kaa.org.ua>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--envbJBWh7q8WU6mo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2019-09-03 15:50:19, Oleh Kravchenko wrote:
> Error was detected by PVS-Studio:
> V512 A call of the 'sprintf' function will lead to overflow of
> the buffer 'led_data->led_cdev_name'.

Are you sure this is correct fix? Will the name be always properly
null terminated?
									Pavel

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

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--envbJBWh7q8WU6mo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl1udM8ACgkQMOfwapXb+vLyewCfS/Yb3pzHTA4fG87yxCwzbaKi
w6UAoKS4Wi5+Fint28MAvVqs8UuZ7956
=7yO8
-----END PGP SIGNATURE-----

--envbJBWh7q8WU6mo--
