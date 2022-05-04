Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F3BF51AC8A
	for <lists+linux-leds@lfdr.de>; Wed,  4 May 2022 20:14:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376696AbiEDSS2 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 4 May 2022 14:18:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376829AbiEDSSV (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 4 May 2022 14:18:21 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F9138A7C8
        for <linux-leds@vger.kernel.org>; Wed,  4 May 2022 10:38:53 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 1F0F11C0BA5; Wed,  4 May 2022 19:38:52 +0200 (CEST)
Date:   Wed, 4 May 2022 19:38:51 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Riku Voipio <riku.voipio@iki.fi>, kernel@pengutronix.de,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH v3] leds: pca9532: Make pca9532_destroy_devices() return
 void
Message-ID: <20220504173851.GB8725@duo.ucw.cz>
References: <20211021121639.79179-1-u.kleine-koenig@pengutronix.de>
 <20211022101707.1194979-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="QTprm0S8XgL7H0Dt"
Content-Disposition: inline
In-Reply-To: <20211022101707.1194979-1-u.kleine-koenig@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--QTprm0S8XgL7H0Dt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Up to now pca9532_destroy_devices() returns always zero because it's
> always called with data !=3D NULL. Remove the never-taken error path and
> make it return void which makes it easier to see in the callers that
> there is no error to handle.
>=20
> Also the return value of i2c remove callbacks is ignored anyway.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Thank you, applied.

Best regards,
								Pavel



> ---
> How embarrassing, I fatfingered v2 that was supposed to fix compilation
> issues. I forgot to actuall add the needed changes and only adapted the
> commit log :-\
>=20
> This one is good now (I hope!)
>=20
> Sorry for the inconvenience,
> Uwe
>=20
>  drivers/leds/leds-pca9532.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
> index 017794bb87ae..f72b5d1be3a6 100644
> --- a/drivers/leds/leds-pca9532.c
> +++ b/drivers/leds/leds-pca9532.c
> @@ -318,13 +318,10 @@ static int pca9532_gpio_direction_output(struct gpi=
o_chip *gc, unsigned offset,
>  }
>  #endif /* CONFIG_LEDS_PCA9532_GPIO */
> =20
> -static int pca9532_destroy_devices(struct pca9532_data *data, int n_devs)
> +static void pca9532_destroy_devices(struct pca9532_data *data, int n_dev=
s)
>  {
>  	int i =3D n_devs;
> =20
> -	if (!data)
> -		return -EINVAL;
> -
>  	while (--i >=3D 0) {
>  		switch (data->leds[i].type) {
>  		case PCA9532_TYPE_NONE:
> @@ -346,8 +343,6 @@ static int pca9532_destroy_devices(struct pca9532_dat=
a *data, int n_devs)
>  	if (data->gpio.parent)
>  		gpiochip_remove(&data->gpio);
>  #endif
> -
> -	return 0;
>  }
> =20
>  static int pca9532_configure(struct i2c_client *client,
> @@ -555,7 +550,9 @@ static int pca9532_remove(struct i2c_client *client)
>  {
>  	struct pca9532_data *data =3D i2c_get_clientdata(client);
> =20
> -	return pca9532_destroy_devices(data, data->chip_info->num_leds);
> +	pca9532_destroy_devices(data, data->chip_info->num_leds);
> +
> +	return 0;
>  }
> =20
>  module_i2c_driver(pca9532_driver);
> --

--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--QTprm0S8XgL7H0Dt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYnK6KwAKCRAw5/Bqldv6
8i2PAJ9GS4D8sHIAa/9dkxyXsRkAZ8jLOQCgupPxZdgIHtx7YtREN9GWe+ZkiPI=
=jxYq
-----END PGP SIGNATURE-----

--QTprm0S8XgL7H0Dt--
