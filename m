Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 892F4112B9A
	for <lists+linux-leds@lfdr.de>; Wed,  4 Dec 2019 13:38:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726604AbfLDMiA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 4 Dec 2019 07:38:00 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:54886 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726586AbfLDMiA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 4 Dec 2019 07:38:00 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 39BFF1C25EC; Wed,  4 Dec 2019 13:37:58 +0100 (CET)
Date:   Wed, 4 Dec 2019 13:37:57 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Jean-Jacques Hiblot <jjhiblot@ti.com>
Cc:     jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, tomi.valkeinen@ti.com
Subject: Re: [PATCH v7 2/2] leds: Add control of the voltage/current
 regulator to the LED core
Message-ID: <20191125163738.GC3816@amd>
References: <20191021174751.4421-1-jjhiblot@ti.com>
 <20191021174751.4421-3-jjhiblot@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="CdrF4e02JqNVZeln"
Content-Disposition: inline
In-Reply-To: <20191021174751.4421-3-jjhiblot@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--CdrF4e02JqNVZeln
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> A LED is usually powered by a voltage/current regulator. Let the LED core
> know about it. This allows the LED core to turn on or off the power supply
> as needed.
>=20
> Because turning ON/OFF a regulator might block, it is not done
> synchronously but done in a workqueue. Turning ON the regulator is
> always

How will this interact with LEDs that can be used from atomic context?

> +static ssize_t regulator_auto_off_store(struct device *dev,
> +		struct device_attribute *attr, const char *buf, size_t size)
> +{
> +	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
> +	ssize_t ret =3D size;
> +	bool auto_off;
> +
> +	if (strncmp(buf, "enable\n", size) =3D=3D 0)
> +		auto_off =3D true;
> +	else if (strncmp(buf, "disable\n", size) =3D=3D 0)
> +		auto_off =3D false;
> +	else
> +		return -EINVAL;

Sounds like device power management to me. Is it compatible with that?

> @@ -135,6 +203,8 @@ static void set_brightness_delayed(struct work_struct=
 *ws)
>  	    (led_cdev->flags & LED_HW_PLUGGABLE)))
>  		dev_err(led_cdev->dev,
>  			"Setting an LED's brightness failed (%d)\n", ret);
> +
> +	 led_handle_regulator(led_cdev);
>  }
>

You only modify set_brigthness_delays, so this will not work at all
for non-blocking LEDs, right?

>  static void led_set_software_blink(struct led_classdev *led_cdev,
> @@ -189,6 +259,7 @@ static void led_blink_setup(struct led_classdev *led_=
cdev,
>  void led_init_core(struct led_classdev *led_cdev)
>  {
>  	INIT_WORK(&led_cdev->set_brightness_work, set_brightness_delayed);
> +	INIT_DELAYED_WORK(&led_cdev->reg_off_work, turn_off_regulator_delayed);
> =20

Could this re-use the workqueue? Many systems will not need
regulators, so this is overhead...

> +			/*
> +			 * the regulator must  be turned off. This cannot be

Use "The", and fix double spaces between must and be.

> +		} else if (regulator_on && old =3D=3D REG_R_OFF_U_OFF) {
> +			/*
> +			 * the regulator must be enabled. This cannot be here

"The"

> +		/*
> +		 * small optimization. Cancel the work that had been started

"Small."

> +#include <linux/regulator/consumer.h>
> +
> +/*
> + * The regulator state tracks 2 boolean variables:
> + * - the state of regulator (or more precisely the state required by
> + *   led core layer, as many users can interact with the same regulator).
> + *   It is tracked by bit 0.
> + * - the state last asked-for by the LED user. It is tracked by bit 1.
> + */
> +#define REG_R_ON BIT(0)
> +#define REG_U_ON BIT(1)
> +
> +enum {	REG_R_OFF_U_OFF =3D 0,
> +	REG_R_ON_U_OFF =3D REG_R_ON,
> +	REG_R_OFF_U_ON =3D REG_U_ON,
> +	REG_R_ON_U_ON =3D REG_R_ON | REG_U_ON
> +};

That's quite weird use of enum.

> +++ b/include/linux/leds.h
> @@ -149,6 +149,15 @@ struct led_classdev {
> =20
>  	/* Ensures consistent access to the LED Flash Class device */
>  	struct mutex		led_access;
> +
> +	/* regulator */

"Regulator".

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--CdrF4e02JqNVZeln
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXeeopQAKCRAw5/Bqldv6
8uypAJ9qIc1TE8M1YLh8IbRiajmjRpCowACcDMrhUrZ+kLOC4MH0sIilzbC58Bo=
=AhQV
-----END PGP SIGNATURE-----

--CdrF4e02JqNVZeln--
