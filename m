Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC0041EE542
	for <lists+linux-leds@lfdr.de>; Thu,  4 Jun 2020 15:24:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728337AbgFDNYI (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 4 Jun 2020 09:24:08 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:52238 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728224AbgFDNYI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 4 Jun 2020 09:24:08 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 9DCFD1C0BD2; Thu,  4 Jun 2020 15:24:06 +0200 (CEST)
Date:   Thu, 4 Jun 2020 15:24:06 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>
Cc:     linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com,
        jonas.gorski@gmail.com, rpurdie@rpsys.net
Subject: Re: [PATCH v3] leds-bcm6328: support second hw blinking interval
Message-ID: <20200604132406.GD7222@duo.ucw.cz>
References: <20200424133243.27303-1-noltari@gmail.com>
 <20200512100136.956872-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="rqzD5py0kzyFAOWN"
Content-Disposition: inline
In-Reply-To: <20200512100136.956872-1-noltari@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--rqzD5py0kzyFAOWN
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2020-05-12 12:01:36, =C1lvaro Fern=E1ndez Rojas wrote:
> Add support for both configurable HW blinking intervals.
>

The code could use ... better documentation and better changelog. What
is the current blinking interval and what other interval does this
add?

Best regards,
                                                                Pavel

> Signed-off-by: =C1lvaro Fern=E1ndez Rojas <noltari@gmail.com>
> ---
>  v3: add code documentation
>  v2: remove LED from the other interval
>=20
>  drivers/leds/leds-bcm6328.c | 83 ++++++++++++++++++++++++++++++-------
>  1 file changed, 67 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/leds/leds-bcm6328.c b/drivers/leds/leds-bcm6328.c
> index 42e1b7598c3a..050a77591f0b 100644
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
> @@ -127,12 +131,18 @@ static void bcm6328_led_set(struct led_classdev *le=
d_cdev,
>  	unsigned long flags;
> =20
>  	spin_lock_irqsave(led->lock, flags);
> -	*(led->blink_leds) &=3D ~BIT(led->pin);
> +
> +	/* Remove LED from cached HW blinking intervals */
> +	led->blink_leds[0] &=3D ~BIT(led->pin);
> +	led->blink_leds[1] &=3D ~BIT(led->pin);
> +
> +	/* Set LED on/off */
>  	if ((led->active_low && value =3D=3D LED_OFF) ||
>  	    (!led->active_low && value !=3D LED_OFF))
>  		bcm6328_led_mode(led, BCM6328_LED_MODE_ON);
>  	else
>  		bcm6328_led_mode(led, BCM6328_LED_MODE_OFF);
> +
>  	spin_unlock_irqrestore(led->lock, flags);
>  }
> =20
> @@ -176,20 +186,59 @@ static int bcm6328_blink_set(struct led_classdev *l=
ed_cdev,
>  	}
> =20
>  	spin_lock_irqsave(led->lock, flags);
> -	if (*(led->blink_leds) =3D=3D 0 ||
> -	    *(led->blink_leds) =3D=3D BIT(led->pin) ||
> -	    *(led->blink_delay) =3D=3D delay) {
> +	/*
> +	 * Check if any of the two configurable HW blinking intervals is
> +	 * available:
> +	 *   1. No LEDs assigned to the HW blinking interval.
> +	 *   2. LEDs with the same delay assigned.
> +	 */
> +	if (led->blink_leds[0] =3D=3D 0 ||
> +	    led->blink_leds[0] =3D=3D BIT(led->pin) ||
> +	    led->blink_delay[0] =3D=3D delay) {
> +		unsigned long val;
> +
> +		/* Add LED to the first HW blinking interval cache */
> +		led->blink_leds[0] |=3D BIT(led->pin);
> +
> +		/* Remove LED from the second HW blinking interval cache */
> +		led->blink_leds[1] &=3D ~BIT(led->pin);
> +
> +		/* Cache the LED in the first HW blinking interval delay */
> +		led->blink_delay[0] =3D delay;
> +
> +		/* Update the delay for the first HW blinking interval */
> +		val =3D bcm6328_led_read(led->mem + BCM6328_REG_INIT);
> +		val &=3D ~BCM6328_LED_INTV1_MASK;
> +		val |=3D (delay << BCM6328_LED_INTV1_SHIFT);
> +		bcm6328_led_write(led->mem + BCM6328_REG_INIT, val);
> +
> +		/* Set the LED to first HW blinking interval */
> +		bcm6328_led_mode(led, BCM6328_LED_MODE_INTV1);
> +
> +		rc =3D 0;
> +	} else if (led->blink_leds[1] =3D=3D 0 ||
> +		   led->blink_leds[1] =3D=3D BIT(led->pin) ||
> +		   led->blink_delay[1] =3D=3D delay) {
>  		unsigned long val;
> =20
> -		*(led->blink_leds) |=3D BIT(led->pin);
> -		*(led->blink_delay) =3D delay;
> +		/* Remove LED from the first HW blinking interval */
> +		led->blink_leds[0] &=3D ~BIT(led->pin);
> +
> +		/* Add LED to the second HW blinking interval */
> +		led->blink_leds[1] |=3D BIT(led->pin);
> =20
> +		/* Cache the LED in the first HW blinking interval delay */
> +		led->blink_delay[1] =3D delay;
> +
> +		/* Update the delay for the second HW blinking interval */
>  		val =3D bcm6328_led_read(led->mem + BCM6328_REG_INIT);
> -		val &=3D ~BCM6328_LED_FAST_INTV_MASK;
> -		val |=3D (delay << BCM6328_LED_FAST_INTV_SHIFT);
> +		val &=3D ~BCM6328_LED_INTV2_MASK;
> +		val |=3D (delay << BCM6328_LED_INTV2_SHIFT);
>  		bcm6328_led_write(led->mem + BCM6328_REG_INIT, val);
> =20
> -		bcm6328_led_mode(led, BCM6328_LED_MODE_BLINK);
> +		/* Set the LED to second HW blinking interval */
> +		bcm6328_led_mode(led, BCM6328_LED_MODE_INTV2);
> +
>  		rc =3D 0;
>  	} else {
>  		dev_dbg(led_cdev->dev,
> @@ -358,11 +407,13 @@ static int bcm6328_leds_probe(struct platform_devic=
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
> --=20
> 2.26.2

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--rqzD5py0kzyFAOWN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXtj19gAKCRAw5/Bqldv6
8g0lAJ4uzCC9Oa9qAwUccZHtjU0G59WWdACfXFrL3NA2jqlOFL3q9Mdejprp6mQ=
=+cQC
-----END PGP SIGNATURE-----

--rqzD5py0kzyFAOWN--
