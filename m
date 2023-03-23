Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F7256C6718
	for <lists+linux-leds@lfdr.de>; Thu, 23 Mar 2023 12:51:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231737AbjCWLvV (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 Mar 2023 07:51:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229642AbjCWLvU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 Mar 2023 07:51:20 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C98E3401E
        for <linux-leds@vger.kernel.org>; Thu, 23 Mar 2023 04:51:19 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 3CC8C1C0E52; Thu, 23 Mar 2023 12:51:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
        t=1679572278;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=9HsirmLZfh83ZppZd4P6agJP7HFtClqC4IIjsTD+5gg=;
        b=VDzP8vhLVbiM03kiwTbrtmCkM6uJshzgOpe1AVmbiSWh2TGpW/KF04GXjaOKxmIV/ltGGQ
        NCnRqpq4S0We6kpQfMhjwu1guevbQaujqgosigcbj9iHlLkzUEDL8Y63XoAmFiH7BoqoOK
        VUM46x8HhGRih5b1WCqNvhdOYPICoL0=
Date:   Thu, 23 Mar 2023 12:51:17 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Liang He <windhl@126.com>
Cc:     matthias.bgg@gmail.com, gene_chen@richtek.com,
        linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] leds: mt6360: Add missing fwnode_handle_put()
Message-ID: <ZBw9NXkC0mgIJhBq@duo.ucw.cz>
References: <20230322034128.1856117-1-windhl@126.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="aCKLs85SJyDKK/4M"
Content-Disposition: inline
In-Reply-To: <20230322034128.1856117-1-windhl@126.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--aCKLs85SJyDKK/4M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> In mt6360_init_isnk_properties(), we should add
> fwnode_handle_put() when break out of the iteration
> fwnode_for_each_child_node() as it will automatically
> increase and decrease the refcounter.
>=20
> Fixes: 679f8652064b ("leds: Add mt6360 driver")
> Signed-off-by: Liang He <windhl@126.com>

I believe you got indentation wrong on }.

With that fixed:

Acked-by: Pavel Machek <pavel@ucw.cz>

BR,
							Pavel

> +++ b/drivers/leds/flash/leds-mt6360.c
> @@ -637,14 +637,17 @@ static int mt6360_init_isnk_properties(struct mt636=
0_led *led,
> =20
>  			ret =3D fwnode_property_read_u32(child, "reg", &reg);
>  			if (ret || reg > MT6360_LED_ISNK3 ||
> -			    priv->leds_active & BIT(reg))
> +			    priv->leds_active & BIT(reg)) {
> +				fwnode_handle_put(child);
>  				return -EINVAL;
> +				}
> =20
>  			ret =3D fwnode_property_read_u32(child, "color", &color);
>  			if (ret) {
>  				dev_err(priv->dev,
>  					"led %d, no color specified\n",
>  					led->led_no);
> +				fwnode_handle_put(child);
>  				return ret;
>  			}
> =20

--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--aCKLs85SJyDKK/4M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZBw9NQAKCRAw5/Bqldv6
8pWjAKCMT6x5/ny7hy/V3/9d6D/s3O4S9ACePHeL63oOu34UZFaGj3bjaEcWAHo=
=/GiA
-----END PGP SIGNATURE-----

--aCKLs85SJyDKK/4M--
