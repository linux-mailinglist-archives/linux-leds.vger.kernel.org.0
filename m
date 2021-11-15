Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5778450668
	for <lists+linux-leds@lfdr.de>; Mon, 15 Nov 2021 15:11:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232118AbhKOOOj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 15 Nov 2021 09:14:39 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:41504 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235121AbhKOONy (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 15 Nov 2021 09:13:54 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id B56A21C0B7F; Mon, 15 Nov 2021 15:10:57 +0100 (CET)
Date:   Mon, 15 Nov 2021 15:10:56 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Sander Vanheule <sander@svanheule.net>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: led-core: Update fwnode with device_set_node
Message-ID: <20211115141056.GB14175@duo.ucw.cz>
References: <20211113211113.573881-1-sander@svanheule.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="gj572EiMnwbLXET9"
Content-Disposition: inline
In-Reply-To: <20211113211113.573881-1-sander@svanheule.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--gj572EiMnwbLXET9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat 2021-11-13 22:11:13, Sander Vanheule wrote:
> Update a newly created device's fwnode and of_node pointers using the
> recently added device_set_node helper. This keeps some firmware node
> specifics out of led-class and should help tracking future changes
> regarding device firmware node updates.
>=20
> Signed-off-by: Sander Vanheule <sander@svanheule.net>

Thanks, applied.
							Pavel
						=09
> ---
>  drivers/leds/led-class.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index f4bb02f6e042..6a8ea94834fa 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -375,10 +375,8 @@ int led_classdev_register_ext(struct device *parent,
>  		mutex_unlock(&led_cdev->led_access);
>  		return PTR_ERR(led_cdev->dev);
>  	}
> -	if (init_data && init_data->fwnode) {
> -		led_cdev->dev->fwnode =3D init_data->fwnode;
> -		led_cdev->dev->of_node =3D to_of_node(init_data->fwnode);
> -	}
> +	if (init_data && init_data->fwnode)
> +		device_set_node(led_cdev->dev, init_data->fwnode);
> =20
>  	if (ret)
>  		dev_warn(parent, "Led %s renamed to %s due to name collision",
> --=20
> 2.33.1

--=20
http://www.livejournal.com/~pavelmachek

--gj572EiMnwbLXET9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYZJqcAAKCRAw5/Bqldv6
8iAuAJ48s1Ind0LaGP8AAwkCEX5i5QLDBwCfbH1VTEH0jAPlhrLxnaVis9aec14=
=KzwF
-----END PGP SIGNATURE-----

--gj572EiMnwbLXET9--
