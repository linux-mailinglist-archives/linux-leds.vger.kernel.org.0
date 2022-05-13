Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E92DD526366
	for <lists+linux-leds@lfdr.de>; Fri, 13 May 2022 16:03:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230316AbiEMODH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 13 May 2022 10:03:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229788AbiEMODG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 13 May 2022 10:03:06 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E75C1FD20
        for <linux-leds@vger.kernel.org>; Fri, 13 May 2022 07:03:04 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id D735B1C0B92; Fri, 13 May 2022 16:03:01 +0200 (CEST)
Date:   Fri, 13 May 2022 16:02:55 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH] leds: lm3601x: Don't use mutex after it was destroyed
Message-ID: <20220513140255.GA18001@duo.ucw.cz>
References: <20220513081832.263863-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="17pEHd4RhPHOinZp"
Content-Disposition: inline
In-Reply-To: <20220513081832.263863-1-u.kleine-koenig@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--17pEHd4RhPHOinZp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> The mutex might still be in use until the devm cleanup callback
> devm_led_classdev_flash_release() is called. This only happens some time
> after lm3601x_remove() completed.

I'm sure lots of "use after free" can be fixed by simply removing the
resource freeing... but lets fix this properly.

Best regards,
									Pavel

> +++ b/drivers/leds/flash/leds-lm3601x.c
> @@ -444,8 +444,6 @@ static int lm3601x_remove(struct i2c_client *client)
>  {
>  	struct lm3601x_led *led =3D i2c_get_clientdata(client);
> =20
> -	mutex_destroy(&led->lock);
> -
>  	return regmap_update_bits(led->regmap, LM3601X_ENABLE_REG,
>  			   LM3601X_ENABLE_MASK,
>  			   LM3601X_MODE_STANDBY);
> --=20
> 2.35.1

--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--17pEHd4RhPHOinZp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYn5lDwAKCRAw5/Bqldv6
8sDzAJ0WoqI2ccGFclICoPjjJU5EgJ6BSQCgmWLxXr27Jut6EAqfYVUcmiXwhOs=
=vDJ3
-----END PGP SIGNATURE-----

--17pEHd4RhPHOinZp--
