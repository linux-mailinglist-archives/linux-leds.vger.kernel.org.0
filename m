Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9567E17D3AC
	for <lists+linux-leds@lfdr.de>; Sun,  8 Mar 2020 13:08:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbgCHMI6 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 8 Mar 2020 08:08:58 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:46902 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726279AbgCHMI6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 8 Mar 2020 08:08:58 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 324B71C0319; Sun,  8 Mar 2020 13:08:56 +0100 (CET)
Date:   Sun, 8 Mar 2020 13:08:55 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     linux-leds@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] leds: add sgm3140 driver
Message-ID: <20200308120855.GA29321@duo.ucw.cz>
References: <20200227185015.212479-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="y0ulUmNC+osPPQO6"
Content-Disposition: inline
In-Reply-To: <20200227185015.212479-1-luca@z3ntu.xyz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--y0ulUmNC+osPPQO6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Add a driver for the SGMICRO SGM3140 Buck/Boost Charge Pump LED driver.

That's pinephone, right?

> This device is controller by two GPIO lines, one for enabling the LED
> and the second one for switching between torch and flash mode.
>=20
> The device will automatically switch to torch mode after being in flash
> mode for about 250-300ms, so after that time the driver will turn the
> LED off again automatically.

I don't quite see how this is supposed to work.

> Hi, this driver is controllable via sysfs and v4l2 APIs (as documented
> in Documentation/leds/leds-class-flash.rst).
>=20
> The following is possible:
>=20
> # Torch on
> echo 1 > /sys/class/leds/white\:flash/brightness
> # Torch off
> echo 0 > /sys/class/leds/white\:flash/brightness
> # Activate flash
> echo 1 > /sys/class/leds/white\:flash/flash_strobe

So.. "activate flash" will turn the LED on in very bright mode, then
put it back to previous brightness after a timeout?

What happens if some kind of malware does flash_strobe every 300msec?

> # Torch on
> v4l2-ctl -d /dev/video1 -c led_mode=3D2
> # Torch off
> v4l2-ctl -d /dev/video1 -c led_mode=3D0
> # Activate flash
> v4l2-ctl -d /dev/video1 -c strobe=3D1
>=20
> Unfortunately the last command (enabling the 'flash' via v4l2 results in
> the following being printed and nothing happening:
>=20
>   VIDIOC_S_EXT_CTRLS: failed: Resource busy
>   strobe: Resource busy
>=20
> Unfortunately I couldn't figure out the reason so I'm hoping to get some
> guidance for this. iirc it worked at some point but then stopped.

Actually, LED flash drivers are getting quite common. Having common
code (so we could just say this is led flash, register it to both v4l
and LED) might be quite interesting.

Unfortunately, some LED flashes also have integrated red LED for
indication, further complicating stuff.

> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index 2da39e896ce8..38d57dd53e4b 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -85,6 +85,7 @@ obj-$(CONFIG_LEDS_LM3601X)		+=3D leds-lm3601x.o
>  obj-$(CONFIG_LEDS_TI_LMU_COMMON)	+=3D leds-ti-lmu-common.o
>  obj-$(CONFIG_LEDS_LM3697)		+=3D leds-lm3697.o
>  obj-$(CONFIG_LEDS_LM36274)		+=3D leds-lm36274.o
> +obj-$(CONFIG_LEDS_SGM3140)		+=3D leds-sgm3140.o

I would not mind "flash" drivers going to separate directory.

> +int sgm3140_brightness_set(struct led_classdev *led_cdev,
> +			   enum led_brightness brightness)
> +{
> +	struct led_classdev_flash *fled_cdev =3D lcdev_to_flcdev(led_cdev);
> +	struct sgm3140 *priv =3D flcdev_to_sgm3140(fled_cdev);
> +
> +	if (brightness =3D=3D LED_OFF)
> +		gpiod_set_value_cansleep(priv->enable_gpio, 0);
> +	else
> +		gpiod_set_value_cansleep(priv->enable_gpio, 1);
> +
> +	return 0;
> +}

Umm. So this cancels running strobe?

> +static void sgm3140_powerdown_timer(struct timer_list *t)
> +{
> +	struct sgm3140 *priv =3D from_timer(priv, t, powerdown_timer);
> +
> +	gpiod_set_value_cansleep(priv->enable_gpio, 0);
> +	gpiod_set_value_cansleep(priv->flash_gpio, 0);
> +}

And this does not return to previous brightness.

Do we want to provide the "strobe" functionality through sysfs at all?
Should we make it v4l-only, and independend of the LED stuff?

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--y0ulUmNC+osPPQO6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXmTgVwAKCRAw5/Bqldv6
8gI9AKC+38d/h8HCQJ9hmjMQkdEjx4sxjQCfWf8+7GcqR11vwa1Xmg1qh9jZoZM=
=CLfP
-----END PGP SIGNATURE-----

--y0ulUmNC+osPPQO6--
