Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B1B3900F1
	for <lists+linux-leds@lfdr.de>; Fri, 16 Aug 2019 13:49:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727007AbfHPLtL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 16 Aug 2019 07:49:11 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:56985 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726981AbfHPLtL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 16 Aug 2019 07:49:11 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 039FE80F7D; Fri, 16 Aug 2019 13:48:55 +0200 (CEST)
Date:   Fri, 16 Aug 2019 13:49:08 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org
Subject: Re: [PATCH v1] leds: Allow to call led_classdev_unregister()
 unconditionally
Message-ID: <20190816114908.GA10081@amd>
References: <20190816105229.81234-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="KsGdsel6WgEHnImy"
Content-Disposition: inline
In-Reply-To: <20190816105229.81234-1-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> If in the certain driver the LED is optional, and it's a majority of them,
> the call of led_classdev_unregister() still requires some additional chec=
ks.
>=20
> The usual pattern on unregistering is to check for NULL, but we also check
> for IS_ERR() in case device_create_with_groups() fails.
>=20
> The change will reduce a burden in a lot of drivers to repeatedly check
> for above conditions.

I don't see majority of calls being protected.  Doing nothing on NULL
sounds reasonable. I'm less sure about "IS_ERR"...

Best regards,
								Pavel


> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/leds/led-class.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index d231240c2047..80b62b807ea0 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -287,6 +287,7 @@ int led_classdev_register_ext(struct device *parent,
>  		ret =3D led_add_brightness_hw_changed(led_cdev);
>  		if (ret) {
>  			device_unregister(led_cdev->dev);
> +			led_cdev->dev =3D NULL;
>  			mutex_unlock(&led_cdev->led_access);
>  			return ret;
>  		}
> @@ -332,6 +333,9 @@ EXPORT_SYMBOL_GPL(led_classdev_register_ext);
>   */
>  void led_classdev_unregister(struct led_classdev *led_cdev)
>  {
> +	if (IS_ERR_OR_NULL(led_cdev->dev))
> +		return;
> +
>  #ifdef CONFIG_LEDS_TRIGGERS
>  	down_write(&led_cdev->trigger_lock);
>  	if (led_cdev->trigger)

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--KsGdsel6WgEHnImy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl1WmDMACgkQMOfwapXb+vLAqwCgwEfZsPpP8aTxekaC7DrTTxD1
800AnA0moAo6E9uVijC1jiYk5gm/UXbG
=OdR7
-----END PGP SIGNATURE-----

--KsGdsel6WgEHnImy--
