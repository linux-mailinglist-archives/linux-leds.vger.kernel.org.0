Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21E8730F580
	for <lists+linux-leds@lfdr.de>; Thu,  4 Feb 2021 15:57:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236990AbhBDO4E (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 4 Feb 2021 09:56:04 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:44518 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236982AbhBDOzp (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 4 Feb 2021 09:55:45 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id E525A1C0B79; Thu,  4 Feb 2021 15:55:03 +0100 (CET)
Date:   Thu, 4 Feb 2021 15:55:03 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Sven Schuchmann <schuchmann@schleissheimer.de>
Cc:     Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] leds: lp50xx: add setting of default intensity
 from DT
Message-ID: <20210204145503.GD14305@duo.ucw.cz>
References: <20210204143803.28140-1-schuchmann@schleissheimer.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="5gxpn/Q6ypwruk0T"
Content-Disposition: inline
In-Reply-To: <20210204143803.28140-1-schuchmann@schleissheimer.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--5gxpn/Q6ypwruk0T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2021-02-04 14:38:03, Sven Schuchmann wrote:
> In order to use a multicolor-led together with a trigger
> the led needs to have an intensity set to see something.
> The trigger changes the brightness of the led but if there
> is no intensity we actually see nothing.
>=20
> This patch adds the ability to set the default intensity
> of each multi-led node so that it is turned on from DT.
> If no intensity is given the led will be initialized
> with full intensity.

> Signed-off-by: Sven Schuchmann <schuchmann@schleissheimer.de>

Check your email headers, empty To: is strange.

> diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
> index 79bc071c31fb..e8aa36c7e963 100644
> --- a/drivers/leds/leds-lp50xx.c
> +++ b/drivers/leds/leds-lp50xx.c
> @@ -504,6 +504,24 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
>  			num_colors++;
>  		}
> =20
> +		if (fwnode_property_count_u32(child, "default-intensity")
> +			=3D=3D num_colors) {
> +
> +			int j, def_int[LP50XX_LEDS_PER_MODULE];

No need for empty line?


> +			ret =3D fwnode_property_read_u32_array(child,
> +				"default-intensity", def_int, num_colors);
> +			if (ret) {
> +				dev_err(&priv->client->dev,
> +					"Cannot read default-intensity: %d\n",
> +					ret);
> +				goto child_out;
> +			}

Just ignore such error?

Best regards,
									Pavel
--=20
http://www.livejournal.com/~pavelmachek

--5gxpn/Q6ypwruk0T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYBwKxwAKCRAw5/Bqldv6
8n4kAKDArF1ccOZdvNpMwNbEL7cmt6eTogCgh7RMntmvmdIaLF3NfqXaQYziIWA=
=9Ern
-----END PGP SIGNATURE-----

--5gxpn/Q6ypwruk0T--
