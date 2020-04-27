Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FBB01BA06E
	for <lists+linux-leds@lfdr.de>; Mon, 27 Apr 2020 11:51:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727022AbgD0JvF (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 27 Apr 2020 05:51:05 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:60140 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726485AbgD0JvF (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 27 Apr 2020 05:51:05 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 046F01C0244; Mon, 27 Apr 2020 11:51:03 +0200 (CEST)
Date:   Mon, 27 Apr 2020 11:51:02 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Icenowy Zheng <icenowy@aosc.io>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v3 2/2] leds: add sgm3140 driver
Message-ID: <20200427095102.GA21572@duo.ucw.cz>
References: <20200421191354.1443017-1-luca@z3ntu.xyz>
 <20200421191354.1443017-3-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="pWyiEgJYm5f9v55/"
Content-Disposition: inline
In-Reply-To: <20200421191354.1443017-3-luca@z3ntu.xyz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--pWyiEgJYm5f9v55/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Add a driver for the SGMICRO SGM3140 Buck/Boost Charge Pump LED driver.
>=20
> This device is controlled by two GPIO pins, one for enabling and the
> second one for switching between torch and flash mode.
>=20
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>

Thanks, applied, but... I may remove it again.

> +++ b/drivers/leds/leds-sgm3140.c
> @@ -0,0 +1,320 @@
> +// SPDX-License-Identifier: GPL-2.0

Would you consider GPL-2+?

> +#if IS_ENABLED(CONFIG_V4L2_FLASH_LED_CLASS)
> +static void sgm3140_init_v4l2_flash_config(struct sgm3140 *priv,

Ok.

> +static int sgm3140_probe(struct platform_device *pdev)
> +{
=2E..
> +	led_cdev->brightness_set_blocking =3D sgm3140_brightness_set;
> +	led_cdev->max_brightness =3D LED_ON;

Don't do this, unless you really have 255 levels of brightness.

> +	/* Create V4L2 Flash subdev */
> +	priv->v4l2_flash =3D v4l2_flash_init(&pdev->dev,
> +					   child_node,
> +					   fled_cdev, NULL,
> +					   &v4l2_sd_cfg);
> +	if (IS_ERR(priv->v4l2_flash)) {

Does this need some #ifdef guards?

> +		ret =3D PTR_ERR(priv->v4l2_flash);
> +		goto err;
> +	}
> +
> +	return ret;

Should this return 0?

> +err:
> +	fwnode_handle_put(child_node);
> +	return ret;
> +}

Does non-error path needs handle_put, too?

Best regards,
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--pWyiEgJYm5f9v55/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXqarBgAKCRAw5/Bqldv6
8tcQAKCWUTuRy7TvgT2+F1Aj1oFotUcn9wCgvlDQBHg5Trhv/KEKFw2CkG70ke8=
=EEZa
-----END PGP SIGNATURE-----

--pWyiEgJYm5f9v55/--
