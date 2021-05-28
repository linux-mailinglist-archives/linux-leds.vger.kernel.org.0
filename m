Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4116A3940AD
	for <lists+linux-leds@lfdr.de>; Fri, 28 May 2021 12:11:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236425AbhE1KMd (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 May 2021 06:12:33 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:34412 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235672AbhE1KMd (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 28 May 2021 06:12:33 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 12C441C0B76; Fri, 28 May 2021 12:10:58 +0200 (CEST)
Date:   Fri, 28 May 2021 12:10:57 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Amireddy Mallikarjuna reddy 
        <mallikarjunax.reddy@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>,
        Abanoub Sameh <abanoubsameh8@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 21/28] leds: lm3697: Make error handling more robust
Message-ID: <20210528101057.GH2209@amd>
References: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
 <20210510095045.3299382-22-andy.shevchenko@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ZPDwMsyfds7q4mrK"
Content-Disposition: inline
In-Reply-To: <20210510095045.3299382-22-andy.shevchenko@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--ZPDwMsyfds7q4mrK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2021-05-10 12:50:38, Andy Shevchenko wrote:
> It's easy to miss necessary clean up, e.g. firmware node reference counti=
ng,
> during error path in ->probe(). Make it more robust by moving to a single
> point of return.
>=20
> Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>

You are now putting the handle even in the success case. Is that
right?
								Pavel

> ---
>  drivers/leds/leds-lm3697.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>=20
> diff --git a/drivers/leds/leds-lm3697.c b/drivers/leds/leds-lm3697.c
> index 9d35dd2a9bf0..6262ae69591e 100644
> --- a/drivers/leds/leds-lm3697.c
> +++ b/drivers/leds/leds-lm3697.c
> @@ -224,14 +224,12 @@ static int lm3697_probe_dt(struct lm3697 *priv)
>  		ret =3D fwnode_property_read_u32(child, "reg", &control_bank);
>  		if (ret) {
>  			dev_err(dev, "reg property missing\n");
> -			fwnode_handle_put(child);
>  			goto child_out;
>  		}
> =20
>  		if (control_bank > LM3697_CONTROL_B) {
>  			dev_err(dev, "reg property is invalid\n");
>  			ret =3D -EINVAL;
> -			fwnode_handle_put(child);
>  			goto child_out;
>  		}
> =20
> @@ -262,7 +260,6 @@ static int lm3697_probe_dt(struct lm3697 *priv)
>  						    led->num_leds);
>  		if (ret) {
>  			dev_err(dev, "led-sources property missing\n");
> -			fwnode_handle_put(child);
>  			goto child_out;
>  		}
> =20
> @@ -287,7 +284,6 @@ static int lm3697_probe_dt(struct lm3697 *priv)
>  						     &init_data);
>  		if (ret) {
>  			dev_err(dev, "led register err: %d\n", ret);
> -			fwnode_handle_put(child);
>  			goto child_out;
>  		}
> =20
> @@ -295,6 +291,7 @@ static int lm3697_probe_dt(struct lm3697 *priv)
>  	}
> =20
>  child_out:
> +	fwnode_handle_put(child);
>  	return ret;
>  }
> =20

--=20
http://www.livejournal.com/~pavelmachek

--ZPDwMsyfds7q4mrK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmCwwbEACgkQMOfwapXb+vLAGgCfYJHx7B9rkKtDWSxAKk4A4L7W
YxAAoJtkYxIhFPHHBvh+Hpy4kJoHy3+D
=C3z8
-----END PGP SIGNATURE-----

--ZPDwMsyfds7q4mrK--
