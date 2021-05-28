Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F16C83940A5
	for <lists+linux-leds@lfdr.de>; Fri, 28 May 2021 12:08:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235361AbhE1KKF (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 May 2021 06:10:05 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:33904 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236134AbhE1KJg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 28 May 2021 06:09:36 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id B459B1C0B76; Fri, 28 May 2021 12:08:00 +0200 (CEST)
Date:   Fri, 28 May 2021 12:08:00 +0200
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
Subject: Re: [PATCH v1 08/28] leds: lgm-sso: Put fwnode in any case during
 ->probe()
Message-ID: <20210528100800.GF2209@amd>
References: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
 <20210510095045.3299382-9-andy.shevchenko@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="XIiC+We3v3zHqZ6Z"
Content-Disposition: inline
In-Reply-To: <20210510095045.3299382-9-andy.shevchenko@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--XIiC+We3v3zHqZ6Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> @@ -734,10 +736,15 @@ static int sso_led_dt_parse(struct sso_led_priv *pr=
iv)
>  	if (fw_ssoled) {
>  		ret =3D __sso_led_dt_parse(priv, fw_ssoled);
>  		if (ret)
> -			return ret;
> +			goto err_child_out;
>  	}
> =20
> +	fwnode_handle_put(fw_ssoled);
>  	return 0;
> +
> +err_child_out:
> +	fwnode_handle_put(fw_ssoled);
> +	return ret;
>  }

Just delete the return and you get the same effect, no? No need to
have two exits here.

BR,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--XIiC+We3v3zHqZ6Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmCwwP8ACgkQMOfwapXb+vJFFgCfTO8m6PRaoO1kxGQZZxAB50sg
CY8An2ZXYs6NRc0DO1Obnq5Xd6Xjx+ZJ
=yqyJ
-----END PGP SIGNATURE-----

--XIiC+We3v3zHqZ6Z--
