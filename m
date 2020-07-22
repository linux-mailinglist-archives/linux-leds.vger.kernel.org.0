Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF5A52299B3
	for <lists+linux-leds@lfdr.de>; Wed, 22 Jul 2020 16:04:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731566AbgGVOEr (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 22 Jul 2020 10:04:47 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:36216 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728837AbgGVOEr (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 22 Jul 2020 10:04:47 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 8680F1C0BD8; Wed, 22 Jul 2020 16:04:43 +0200 (CEST)
Date:   Wed, 22 Jul 2020 16:04:43 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Denis Osterland-Heim <denis.osterland@diehl.com>
Cc:     "dmurphy@ti.com" <dmurphy@ti.com>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v6 1/2] leds: pwm: add support for default-state device
 property
Message-ID: <20200722140443.6cagitx3dozgjazh@duo.ucw.cz>
References: <20200713054259.7608-1-Denis.Osterland@diehl.com>
 <20200713054259.7608-2-Denis.Osterland@diehl.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="v2ovlewz76qvmngn"
Content-Disposition: inline
In-Reply-To: <20200713054259.7608-2-Denis.Osterland@diehl.com>
User-Agent: NeoMutt/20180716
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--v2ovlewz76qvmngn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> This patch adds support for "default-state" devicetree property, which
> allows to defer pwm init to first use of led.
>=20
> This allows to configure the PWM early in bootloader to let the LED
> blink until an application in Linux userspace sets something different.
>=20
> Signed-off-by: Denis Osterland-Heim <Denis.Osterland@diehl.com>
> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

> +#define LEDS_PWM_DEFSTATE_OFF	0
> +#define LEDS_PWM_DEFSTATE_ON	1
> +#define LEDS_PWM_DEFSTATE_KEEP	2

Turn this into enum; no need for prefix as this is private to the driver.

>  struct led_pwm {
>  	const char	*name;
>  	const char	*default_trigger;
>  	u8		active_low;
> +	u8		default_state;
>  	unsigned int	max_brightness;
>  };
> =20
> @@ -88,7 +93,30 @@ static int led_pwm_add(struct device *dev, struct led_=
pwm_priv *priv,
> =20
>  	led_data->cdev.brightness_set_blocking =3D led_pwm_set;
> =20
> -	pwm_init_state(led_data->pwm, &led_data->pwmstate);
> +	/* init PWM state */
> +	if (led->default_state =3D=3D LEDS_PWM_DEFSTATE_KEEP) {
> +		pwm_get_state(led_data->pwm, &led_data->pwmstate);
> +		if (!led_data->pwmstate.period) {
> +			led->default_state =3D LEDS_PWM_DEFSTATE_OFF;
> +			dev_warn(dev,
> +				"failed to read period for %s, default to off",
> +				led->name);
> +		}
> +	}
> +	if (led->default_state !=3D LEDS_PWM_DEFSTATE_KEEP)
> +		pwm_init_state(led_data->pwm, &led_data->pwmstate);
> +
> +	/* set brightness */
> +	if (led->default_state =3D=3D LEDS_PWM_DEFSTATE_ON)
> +		led_data->cdev.brightness =3D led->max_brightness;
> +	else if (led->default_state =3D=3D LEDS_PWM_DEFSTATE_KEEP) {
> +		uint64_t brightness;
> +
> +		brightness =3D led->max_brightness;
> +		brightness *=3D led_data->pwmstate.duty_cycle;
> +		do_div(brightness, led_data->pwmstate.period);
> +		led_data->cdev.brightness =3D brightness;
> +	}

Try to clean this up... switch() might help. Maybe two of them.

> @@ -134,6 +166,16 @@ static int led_pwm_create_fwnode(struct device *dev,=
 struct led_pwm_priv *priv)
>  		fwnode_property_read_u32(fwnode, "max-brightness",
>  					 &led.max_brightness);
> =20
> +		if (!fwnode_property_read_string(fwnode, "default-state",
> +						 &state)) {
> +			if (!strcmp(state, "keep"))
> +				led.default_state =3D LEDS_PWM_DEFSTATE_KEEP;
> +			else if (!strcmp(state, "on"))
> +				led.default_state =3D LEDS_PWM_DEFSTATE_ON;
> +			else
> +				led.default_state =3D LEDS_PWM_DEFSTATE_OFF;
> +		}

Actually... Move the enum to core, and add helper for this. We don't
want to see this duplicated.

> The contents of the above mentioned e-mail is not legally binding. This e=
-mail contains confidential and/or legally protected information. Please in=
form us if you have received this e-mail by
> mistake and delete it in such a case. Each unauthorized reproduction, dis=
closure, alteration, distribution and/or publication of this e-mail is stri=
ctly prohibited.=20
> - For general information on data protection and your respective rights p=
lease visit https://www.diehl.com/group/en/transparency-and-information-obl=
igations/

Get rid of this.
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--v2ovlewz76qvmngn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXxhHewAKCRAw5/Bqldv6
8rmuAJ4rvbdm8hCC5wda9/NyXq6BFCfuYQCglCBcKWz5JOVJkDmRIX+8DtvNYdc=
=Hxhr
-----END PGP SIGNATURE-----

--v2ovlewz76qvmngn--
