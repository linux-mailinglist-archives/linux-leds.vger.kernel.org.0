Return-Path: <linux-leds+bounces-6410-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E5ACB80E3
	for <lists+linux-leds@lfdr.de>; Fri, 12 Dec 2025 07:49:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 296703048D56
	for <lists+linux-leds@lfdr.de>; Fri, 12 Dec 2025 06:49:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E1F02F7AAA;
	Fri, 12 Dec 2025 06:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SNywqCtl"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA611F130B;
	Fri, 12 Dec 2025 06:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765522184; cv=none; b=DRRtU0/ZxYkEI66K8iPJTNdd6zhiEHcTLdkmict3BPMINRlF3Dvb+lxn/xJrK0WaW0Bh3mspxjQgCCjIkaSabSoyrh1K29Yj1JhvGrdPvuGqigf4YgDRA3x0sUXYPYBqKNQn0p3/cLZaT3gapCXPbfSpypcITYMvCbDV5CPcInY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765522184; c=relaxed/simple;
	bh=CrmDTzoQQxRCJy5+Z9nm+Lb/SZ8a3k90tvdg8i8DU3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=edQdpUNGRoptc3vv+MUroad5xf5af7d2oDjU1v/XrY5J4F6RwJzS7rGsfKq8wkaQcTW3q8gDsTDfNa2sF4aTjX5SdRuKscBcf1OJiMnB3AdYf0i2g2lJq1X7sitKQ2xRfO5SuDVgy7dfYeUHHikeruFP0SHHH39UDTRiLttoF9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SNywqCtl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 778A4C4CEF1;
	Fri, 12 Dec 2025 06:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765522183;
	bh=CrmDTzoQQxRCJy5+Z9nm+Lb/SZ8a3k90tvdg8i8DU3k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SNywqCtlcKtwRTKkxXfi1uPMU+u6Sga0XmZrU1Zq9JRBzAHg0jKtZmRrrBIa5o9DH
	 Jg6ml2y0YYRY1ciZXl5aoIeVix1POyFJ2NT+Gh4iU1T2YsYi0SeOWyBBhE2Xcz2qDQ
	 uCvYlCXr6/am2D3DW3xZUkAlQq3lWgQtte9r1JFh3o3rBnTHWXm0jBv1GpccQHNCXG
	 VHPz/5Q1MQa/sxTKgI0mtsrjGnKo503Nnk0I2tVvyqQEMoXOcbU5H3FRORlgP0LrHL
	 BNZQQAbD+OCP3bse1ho+qoqs9rKCTclCIhpYnZAuG07MhCocFwuoaycdJE6rHrRcAP
	 IoKFGX2DeUFTA==
Received: by venus (Postfix, from userid 1000)
	id DF37D181F29; Fri, 12 Dec 2025 15:49:41 +0900 (JST)
Date: Fri, 12 Dec 2025 15:49:41 +0900
From: Sebastian Reichel <sre@kernel.org>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	linux-leds@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] leds: led-class: Only Add LED to leds_list when it is
 fully ready
Message-ID: <2bbtf7out2t52pge4hezfc7dryu6te2qstfm5kzez7zrw3dvqq@wxvqnjbulxc4>
References: <20251211163727.366441-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uykfwaownruc6xph"
Content-Disposition: inline
In-Reply-To: <20251211163727.366441-1-johannes.goede@oss.qualcomm.com>


--uykfwaownruc6xph
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] leds: led-class: Only Add LED to leds_list when it is
 fully ready
MIME-Version: 1.0

Hi,

On Thu, Dec 11, 2025 at 05:37:27PM +0100, Hans de Goede wrote:
> Before this change the LED was added to leds_list before led_init_core()
> gets called adding it the list before led_classdev.set_brightness_work ge=
ts
> initialized.
>=20
> This leaves a window where led_trigger_register() of a LED's default
> trigger will call led_trigger_set() which calls led_set_brightness()
> which in turn will end up queueing the *uninitialized*
> led_classdev.set_brightness_work.
>=20
> This race gets hit by the lenovo-thinkpad-t14s EC driver which registers
> 2 LEDs with a default trigger provided by snd_ctl_led.ko in quick
> succession. The first led_classdev_register() causes an async modprobe of
> snd_ctl_led to run and that async modprobe manages to exactly hit
> the window where the second LED is on the leds_list without led_init_core=
()
> being called for it, resulting in:
>=20
>  ------------[ cut here ]------------
>  WARNING: CPU: 11 PID: 5608 at kernel/workqueue.c:4234 __flush_work+0x344=
/0x390
>  Hardware name: LENOVO 21N2S01F0B/21N2S01F0B, BIOS N42ET93W (2.23 ) 09/01=
/2025
>  ...
>  Call trace:
>   __flush_work+0x344/0x390 (P)
>   flush_work+0x2c/0x50
>   led_trigger_set+0x1c8/0x340
>   led_trigger_register+0x17c/0x1c0
>   led_trigger_register_simple+0x84/0xe8
>   snd_ctl_led_init+0x40/0xf88 [snd_ctl_led]
>   do_one_initcall+0x5c/0x318
>   do_init_module+0x9c/0x2b8
>   load_module+0x7e0/0x998
>=20
> Close the race window by moving the adding of the LED to leds_list to
> after the led_init_core() call.
>=20
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: stable@vger.kernel.org
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---

heh, I've never hit this. But I guess that is not too surprising
considering it is a race condition. The change looks good to me:

Reviewed-by: Sebastian Reichel <sre@kernel.org>

> Note no Fixes tag as this problem has been around for a long long time,
> so I could not really find a good commit for the Fixes tag.

My suggestion would be:

Fixes: d23a22a74fde ("leds: delay led_set_brightness if stopping soft-blink=
")

It introduces the set_brightness_work with the INIT_WORK at the
wrong position (after the list addition).

Greetings,

-- Sebastian

>  drivers/leds/led-class.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index f3faf37f9a08..6b9fa060c3a1 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -560,11 +560,6 @@ int led_classdev_register_ext(struct device *parent,
>  #ifdef CONFIG_LEDS_BRIGHTNESS_HW_CHANGED
>  	led_cdev->brightness_hw_changed =3D -1;
>  #endif
> -	/* add to the list of leds */
> -	down_write(&leds_list_lock);
> -	list_add_tail(&led_cdev->node, &leds_list);
> -	up_write(&leds_list_lock);
> -
>  	if (!led_cdev->max_brightness)
>  		led_cdev->max_brightness =3D LED_FULL;
> =20
> @@ -574,6 +569,11 @@ int led_classdev_register_ext(struct device *parent,
> =20
>  	led_init_core(led_cdev);
> =20
> +	/* add to the list of leds */
> +	down_write(&leds_list_lock);
> +	list_add_tail(&led_cdev->node, &leds_list);
> +	up_write(&leds_list_lock);
> +
>  #ifdef CONFIG_LEDS_TRIGGERS
>  	led_trigger_set_default(led_cdev);
>  #endif
> --=20
> 2.52.0
>=20

--uykfwaownruc6xph
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmk7uwIACgkQ2O7X88g7
+po8rg//d5gOPEOwSFGmAlHdij3xR/FUKgkZ69TkzTLTMkx3VtBPY/LZjzV4rb6P
JkQpYVZNqF42LbiiDIci63Yx4Li486p3e94+pc8smMv6vN8BlIhdhp/wrFgqr6kl
PeVxt6EipfC68RynIIPp7LIiIk0Gmaj002l04S/ml7QSd9hCpTCu3505bLm3UguV
+VmnkHsX++VkClOiP8iICTo02tJxqUCrCErLdEEvToKrnslIqF27rWWQIUTzo2C3
jpM7/aUGmzklWMDR+gaq68H4df0DHZgBNyI65RvxhdhEZarwU2RmQlrHFNvH4HiS
2UQEGN2ho3xiF7ZtHkOZjXajTPgR5n6gb3mfBO088JLEZikdpU6fLFFvVONeZngA
FkJoVsV4HUZPuhm+iD+jUWTcmuBObQiJxQjGmCM+EtktLBfV6bcT5SPMbFfU2RQg
unEl7iK7Wb7eaY4I70a8dFLvtUyO7CGL1GiltXPM5ByZNoXm0DXnRgFCmF0kd0h9
HW11813pzEwj61Adi9kLyvFfKVs92tQCpUEtqqwBrAahNra2igoFcDgDsTUzVRi5
9aTblw6GBr4uqYAD3/M9H4I+BI8Dpjs22rRje+BhaC14l+dOCQ43VS5STzhtd1YY
3tJ4qKOCOZOzVov8F9Jik1NP8cJbhrz6z9Xh1oVqyJUy6ZYjSKc=
=Z3+n
-----END PGP SIGNATURE-----

--uykfwaownruc6xph--

