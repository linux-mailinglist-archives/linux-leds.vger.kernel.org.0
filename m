Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63ACEA48B7
	for <lists+linux-leds@lfdr.de>; Sun,  1 Sep 2019 12:23:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728610AbfIAKXU (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 1 Sep 2019 06:23:20 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:47015 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728506AbfIAKXU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 1 Sep 2019 06:23:20 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id D6319812FD; Sun,  1 Sep 2019 12:23:03 +0200 (CEST)
Date:   Sun, 1 Sep 2019 12:23:17 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 2/2] leds: trigger: gpio: Convert to use kstrtox()
Message-ID: <20190901102316.GA29681@amd>
References: <20190830150820.63450-1-andriy.shevchenko@linux.intel.com>
 <20190830150820.63450-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="BOKacYhQ+x31HxR3"
Content-Disposition: inline
In-Reply-To: <20190830150820.63450-2-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--BOKacYhQ+x31HxR3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2019-08-30 18:08:20, Andy Shevchenko wrote:
> sscanf() is a heavy one and moreover requires additional boundary checks.
> Convert driver to use kstrtox() and replace kstrtoul() by kstrtobool()
> in gpio_trig_inverted_store().
>=20
> While here, check the desired brightness against maximum defined for
> a certain LED.

One change per patch, please.

Because this one will not end well.

> @@ -60,10 +60,10 @@ static ssize_t gpio_trig_brightness_store(struct devi=
ce *dev,
>  	unsigned desired_brightness;
>  	int ret;
> =20
> -	ret =3D sscanf(buf, "%u", &desired_brightness);
> -	if (ret < 1 || desired_brightness > 255) {
> +	ret =3D kstrtouint(buf, 10, &desired_brightness);
> +	if (ret || desired_brightness > gpio_data->led->max_brightness) {
>  		dev_err(dev, "invalid value\n");
> -		return -EINVAL;
> +		return ret ? ret : -EINVAL;
>  	}

We have people writing 255 into brightness, because that's what we
used to do even for on/off LEDS. It is expected to work even for leds
with max_brightness of 1.

So... we want to saturate here, not return -EINVAL. (And we will
eventually want to switch on/off leds to max_brightness =3D 1...)

> @@ -86,16 +86,13 @@ static ssize_t gpio_trig_inverted_store(struct device=
 *dev,
>  {
>  	struct led_classdev *led =3D led_trigger_get_led(dev);
>  	struct gpio_trig_data *gpio_data =3D led_trigger_get_drvdata(dev);
> -	unsigned long inverted;
> +	bool inverted;
>  	int ret;
> =20
> -	ret =3D kstrtoul(buf, 10, &inverted);
> -	if (ret < 0)
> +	ret =3D kstrtobool(buf, &inverted);
> +	if (ret)
>  		return ret;
> =20
> -	if (inverted > 1)
> -		return -EINVAL;
> -
>  	gpio_data->inverted =3D inverted;
> =20
>  	/* After inverting, we need to update the LED. */

So, this accepted 0/1. Now it also accepts true false and many other pairs.

Which... might be ok. But probably should be separated.

Best regards,
									Pavel
								=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--BOKacYhQ+x31HxR3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl1rnBQACgkQMOfwapXb+vLFOACcDxDJ7U3kqZ0uPT9D/SsKYQk/
nc8AnRj3wEhO8V8B8tyC0abvXk6LrIJJ
=lFAx
-----END PGP SIGNATURE-----

--BOKacYhQ+x31HxR3--
