Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2531B1B8988
	for <lists+linux-leds@lfdr.de>; Sat, 25 Apr 2020 23:14:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726327AbgDYVOx (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 25 Apr 2020 17:14:53 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:38264 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726234AbgDYVOx (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 25 Apr 2020 17:14:53 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id C207C1C0239; Sat, 25 Apr 2020 23:14:50 +0200 (CEST)
Date:   Sat, 25 Apr 2020 23:14:50 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>
Cc:     linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com,
        jonas.gorski@gmail.com, rpurdie@rpsys.net
Subject: Re: [PATCH v2] leds-bcm6328: support second hw blinking interval
Message-ID: <20200425211450.GA27781@amd>
References: <20200424124621.23005-1-noltari@gmail.com>
 <20200424133243.27303-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="liOOAslEiF7prFVr"
Content-Disposition: inline
In-Reply-To: <20200424133243.27303-1-noltari@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--liOOAslEiF7prFVr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Add support for both configurable HW blinking intervals.

The code could use ... better documentation and better changelog. What
is the current blinking interval and what other interval does this
add?

Best regards,
								Pavel

> Signed-off-by: =C1lvaro Fern=E1ndez Rojas <noltari@gmail.com>
> ---
>  v2: remove LED from the other interval
>=20
>  drivers/leds/leds-bcm6328.c | 56 ++++++++++++++++++++++++++-----------
>  1 file changed, 40 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/leds/leds-bcm6328.c b/drivers/leds/leds-bcm6328.c
> index 42e1b7598c3a..a5a57a8d2a1c 100644
> --- a/drivers/leds/leds-bcm6328.c
> +++ b/drivers/leds/leds-bcm6328.c
> @@ -24,12 +24,16 @@
> =20
>  #define BCM6328_LED_MAX_COUNT		24
>  #define BCM6328_LED_DEF_DELAY		500
> +#define BCM6328_LED_INTERVAL_NUM	2
>  #define BCM6328_LED_INTERVAL_MS		20
> =20
>  #define BCM6328_LED_INTV_MASK		0x3f
> -#define BCM6328_LED_FAST_INTV_SHIFT	6
> -#define BCM6328_LED_FAST_INTV_MASK	(BCM6328_LED_INTV_MASK << \
> -					 BCM6328_LED_FAST_INTV_SHIFT)
> +#define BCM6328_LED_INTV1_SHIFT		0
> +#define BCM6328_LED_INTV1_MASK		(BCM6328_LED_INTV_MASK << \
> +					 BCM6328_LED_INTV1_SHIFT)
> +#define BCM6328_LED_INTV2_SHIFT		6
> +#define BCM6328_LED_INTV2_MASK		(BCM6328_LED_INTV_MASK << \
> +					 BCM6328_LED_INTV2_SHIFT)
>  #define BCM6328_SERIAL_LED_EN		BIT(12)
>  #define BCM6328_SERIAL_LED_MUX		BIT(13)
>  #define BCM6328_SERIAL_LED_CLK_NPOL	BIT(14)
> @@ -45,8 +49,8 @@
> =20
>  #define BCM6328_LED_MODE_MASK		3
>  #define BCM6328_LED_MODE_ON		0
> -#define BCM6328_LED_MODE_FAST		1
> -#define BCM6328_LED_MODE_BLINK		2
> +#define BCM6328_LED_MODE_INTV1		1
> +#define BCM6328_LED_MODE_INTV2		2
>  #define BCM6328_LED_MODE_OFF		3
>  #define BCM6328_LED_SHIFT(X)		((X) << 1)
> =20
> @@ -127,7 +131,8 @@ static void bcm6328_led_set(struct led_classdev *led_=
cdev,
>  	unsigned long flags;
> =20
>  	spin_lock_irqsave(led->lock, flags);
> -	*(led->blink_leds) &=3D ~BIT(led->pin);
> +	led->blink_leds[0] &=3D ~BIT(led->pin);
> +	led->blink_leds[1] &=3D ~BIT(led->pin);
>  	if ((led->active_low && value =3D=3D LED_OFF) ||
>  	    (!led->active_low && value !=3D LED_OFF))
>  		bcm6328_led_mode(led, BCM6328_LED_MODE_ON);
> @@ -176,20 +181,37 @@ static int bcm6328_blink_set(struct led_classdev *l=
ed_cdev,
>  	}
> =20
>  	spin_lock_irqsave(led->lock, flags);
> -	if (*(led->blink_leds) =3D=3D 0 ||
> -	    *(led->blink_leds) =3D=3D BIT(led->pin) ||
> -	    *(led->blink_delay) =3D=3D delay) {
> +	if (led->blink_leds[0] =3D=3D 0 ||
> +	    led->blink_leds[0] =3D=3D BIT(led->pin) ||
> +	    led->blink_delay[0] =3D=3D delay) {
>  		unsigned long val;
> =20
> -		*(led->blink_leds) |=3D BIT(led->pin);
> -		*(led->blink_delay) =3D delay;
> +		led->blink_leds[0] |=3D BIT(led->pin);
> +		led->blink_leds[1] &=3D ~BIT(led->pin);
> +		led->blink_delay[0] =3D delay;
> =20
>  		val =3D bcm6328_led_read(led->mem + BCM6328_REG_INIT);
> -		val &=3D ~BCM6328_LED_FAST_INTV_MASK;
> -		val |=3D (delay << BCM6328_LED_FAST_INTV_SHIFT);
> +		val &=3D ~BCM6328_LED_INTV1_MASK;
> +		val |=3D (delay << BCM6328_LED_INTV1_SHIFT);
>  		bcm6328_led_write(led->mem + BCM6328_REG_INIT, val);
> =20
> -		bcm6328_led_mode(led, BCM6328_LED_MODE_BLINK);
> +		bcm6328_led_mode(led, BCM6328_LED_MODE_INTV1);
> +		rc =3D 0;
> +	} else if (led->blink_leds[1] =3D=3D 0 ||
> +		   led->blink_leds[1] =3D=3D BIT(led->pin) ||
> +		   led->blink_delay[1] =3D=3D delay) {
> +		unsigned long val;
> +
> +		led->blink_leds[0] &=3D ~BIT(led->pin);
> +		led->blink_leds[1] |=3D BIT(led->pin);
> +		led->blink_delay[1] =3D delay;
> +
> +		val =3D bcm6328_led_read(led->mem + BCM6328_REG_INIT);
> +		val &=3D ~BCM6328_LED_INTV2_MASK;
> +		val |=3D (delay << BCM6328_LED_INTV2_SHIFT);
> +		bcm6328_led_write(led->mem + BCM6328_REG_INIT, val);
> +
> +		bcm6328_led_mode(led, BCM6328_LED_MODE_INTV2);
>  		rc =3D 0;
>  	} else {
>  		dev_dbg(led_cdev->dev,
> @@ -358,11 +380,13 @@ static int bcm6328_leds_probe(struct platform_devic=
e *pdev)
>  	if (!lock)
>  		return -ENOMEM;
> =20
> -	blink_leds =3D devm_kzalloc(dev, sizeof(*blink_leds), GFP_KERNEL);
> +	blink_leds =3D devm_kcalloc(dev, BCM6328_LED_INTERVAL_NUM,
> +				  sizeof(*blink_leds), GFP_KERNEL);
>  	if (!blink_leds)
>  		return -ENOMEM;
> =20
> -	blink_delay =3D devm_kzalloc(dev, sizeof(*blink_delay), GFP_KERNEL);
> +	blink_delay =3D devm_kcalloc(dev, BCM6328_LED_INTERVAL_NUM,
> +				   sizeof(*blink_delay), GFP_KERNEL);
>  	if (!blink_delay)
>  		return -ENOMEM;
> =20

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--liOOAslEiF7prFVr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl6kqEoACgkQMOfwapXb+vJOnQCdFQ4x4IV+Svmec1yGlow7cpQ4
m8gAoIMfae4iJSx9EZSKgEVnQypeJYq4
=Hjmv
-----END PGP SIGNATURE-----

--liOOAslEiF7prFVr--
