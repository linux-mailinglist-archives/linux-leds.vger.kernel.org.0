Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6006B91927
	for <lists+linux-leds@lfdr.de>; Sun, 18 Aug 2019 21:07:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727030AbfHRTH4 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 18 Aug 2019 15:07:56 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:45454 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726950AbfHRTH4 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 18 Aug 2019 15:07:56 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 3023F81452; Sun, 18 Aug 2019 21:07:41 +0200 (CEST)
Date:   Sun, 18 Aug 2019 21:07:53 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Colin King <colin.king@canonical.com>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: trigger: timer: remove redundant assignment to ret
Message-ID: <20190818190753.GA1093@amd>
References: <20190818190004.15833-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="vkogqOf2sHV7VnPd"
Content-Disposition: inline
In-Reply-To: <20190818190004.15833-1-colin.king@canonical.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun 2019-08-18 20:00:03, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> Variable ret is initialized to a value that is never read and it
> is re-assigned later. The initialization is redundant and can be
> removed.

Yes, it can. But it is not buggy or exceptionaly ugly.

> diff --git a/drivers/leds/trigger/ledtrig-timer.c b/drivers/leds/trigger/=
ledtrig-timer.c
> index 34a68604c46c..b4688d1d9d2b 100644
> --- a/drivers/leds/trigger/ledtrig-timer.c
> +++ b/drivers/leds/trigger/ledtrig-timer.c
> @@ -28,7 +28,7 @@ static ssize_t led_delay_on_store(struct device *dev,
>  {
>  	struct led_classdev *led_cdev =3D led_trigger_get_led(dev);
>  	unsigned long state;
> -	ssize_t ret =3D -EINVAL;
> +	ssize_t ret;
> =20
>  	ret =3D kstrtoul(buf, 10, &state);
>  	if (ret)

Make it ssizr_t ret =3D kstrtoul() and I may agree it is a cleanup...

Best regards,
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--vkogqOf2sHV7VnPd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl1ZogkACgkQMOfwapXb+vJi6gCgiHOeyae6/Zq/og/YqsyD6Tgf
7r0AoIaNRD+K8OeIqL5cDXleOm/m5H97
=w4eN
-----END PGP SIGNATURE-----

--vkogqOf2sHV7VnPd--
