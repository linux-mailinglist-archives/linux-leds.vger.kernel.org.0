Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7220041923B
	for <lists+linux-leds@lfdr.de>; Mon, 27 Sep 2021 12:31:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233829AbhI0KdQ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 27 Sep 2021 06:33:16 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:57166 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233828AbhI0KdQ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 27 Sep 2021 06:33:16 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id A61B81C0B7A; Mon, 27 Sep 2021 12:31:37 +0200 (CEST)
Date:   Mon, 27 Sep 2021 12:31:37 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Isaac Hazan <isaac.hazan@intel.com>,
        Lee Jones <lee.jones@linaro.org>,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] led-class-flash: fix -Wrestrict warning
Message-ID: <20210927103137.GA25707@duo.ucw.cz>
References: <20210927101610.1669830-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="4Ckj6UjgE2iN1+kY"
Content-Disposition: inline
In-Reply-To: <20210927101610.1669830-1-arnd@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/leds/led-class-flash.c | 2 +-
>  drivers/thunderbolt/xdomain.c  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/leds/led-class-flash.c b/drivers/leds/led-class-flas=
h.c
> index 185e17055317..6fe9d700dfef 100644
> --- a/drivers/leds/led-class-flash.c
> +++ b/drivers/leds/led-class-flash.c
> @@ -207,7 +207,7 @@ static ssize_t flash_fault_show(struct device *dev,
>  		mask <<=3D 1;
>  	}
> =20
> -	return sprintf(buf, "%s\n", buf);
> +	return strlen(strcat(buf, "\n"));
>  }
>  static DEVICE_ATTR_RO(flash_fault);
>

That's not just a warning. .. the code is crazy. I'll take it if you
split it from the thunderbolt change.

Best regards,
								Pavel

> diff --git a/drivers/thunderbolt/xdomain.c b/drivers/thunderbolt/xdomain.c
> index d66ea4d616fd..eff32499610f 100644
> --- a/drivers/thunderbolt/xdomain.c
> +++ b/drivers/thunderbolt/xdomain.c
> @@ -730,7 +730,7 @@ static ssize_t modalias_show(struct device *dev, stru=
ct device_attribute *attr,
> =20
>  	/* Full buffer size except new line and null termination */
>  	get_modalias(svc, buf, PAGE_SIZE - 2);
> -	return sprintf(buf, "%s\n", buf);
> +	return strlen(strcat(buf, "\n"));
>  }
>  static DEVICE_ATTR_RO(modalias);
> =20
> --=20
> 2.29.2

--=20
http://www.livejournal.com/~pavelmachek

--4Ckj6UjgE2iN1+kY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYVGdiQAKCRAw5/Bqldv6
8kRqAJwJEv2ANUJy1EMUAfdG56oMdJDwWQCeL/coOb+Z8MwJj2Y8AliUkjk6JS8=
=On5G
-----END PGP SIGNATURE-----

--4Ckj6UjgE2iN1+kY--
