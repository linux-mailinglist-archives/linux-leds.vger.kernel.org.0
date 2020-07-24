Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8759722C3E9
	for <lists+linux-leds@lfdr.de>; Fri, 24 Jul 2020 12:58:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbgGXK62 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 24 Jul 2020 06:58:28 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:47440 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726114AbgGXK61 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 24 Jul 2020 06:58:27 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 9882F1C0BD2; Fri, 24 Jul 2020 12:58:25 +0200 (CEST)
Date:   Fri, 24 Jul 2020 12:58:25 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek =?utf-8?B?QmVow7pu?= <marek.behun@nic.cz>
Cc:     linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com,
        Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v7 2/3] leds: initial support for Turris Omnia LEDs
Message-ID: <20200724105825.wyorw3jr2kaa3ucr@duo.ucw.cz>
References: <20200723125320.3572-1-marek.behun@nic.cz>
 <20200723125320.3572-3-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="de3c47j54rb443wk"
Content-Disposition: inline
In-Reply-To: <20200723125320.3572-3-marek.behun@nic.cz>
User-Agent: NeoMutt/20180716
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--de3c47j54rb443wk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> This adds basic support for LEDs on the front side of CZ.NIC's Turris
> Omnia router.
>=20
> There are 12 RGB LEDs. The controller supports HW triggering mode for
> the LEDs, but this driver does not support it yet, and sets all the LEDs
> defined in device-tree into SW mode upon probe.
>=20
> This driver uses the multicolor LED framework.
>=20
> Signed-off-by: Marek Beh=FAn <marek.behun@nic.cz>
> Reviewed-by: Dan Murphy <dmurphy@ti.com>
> ---
>  drivers/leds/Kconfig             |  11 ++
>  drivers/leds/Makefile            |   1 +
>  drivers/leds/leds-turris-omnia.c | 295 +++++++++++++++++++++++++++++++
>  3 files changed, 307 insertions(+)
>  create mode 100644 drivers/leds/leds-turris-omnia.c

Whoever told you to use defines here was evil:

> +#define OMNIA_CMD_LED_COLOR_LED		1
> +#define OMNIA_CMD_LED_COLOR_R		2
> +#define OMNIA_CMD_LED_COLOR_G		3
> +#define OMNIA_CMD_LED_COLOR_B		4
> +#define OMNIA_CMD_LED_COLOR_LEN		5

> +static int omnia_led_brightness_set_blocking(struct led_classdev *cdev,
> +					     enum led_brightness brightness)
> +{
> +	struct led_classdev_mc *mc_cdev =3D lcdev_to_mccdev(cdev);
> +	struct omnia_leds *leds =3D dev_get_drvdata(cdev->dev->parent);
> +	struct omnia_led *led =3D to_omnia_led(mc_cdev);
> +	u8 buf[OMNIA_CMD_LED_COLOR_LEN], state;
> +	int ret;
> +
> +	mutex_lock(&leds->lock);
> +
> +	led_mc_calc_color_components(&led->mc_cdev, brightness);
> +
> +	buf[OMNIA_CMD] =3D CMD_LED_COLOR;
> +	buf[OMNIA_CMD_LED_COLOR_LED] =3D led->reg;
> +	buf[OMNIA_CMD_LED_COLOR_R] =3D mc_cdev->subled_info[0].brightness;
> +	buf[OMNIA_CMD_LED_COLOR_G] =3D mc_cdev->subled_info[1].brightness;
> +	buf[OMNIA_CMD_LED_COLOR_B] =3D mc_cdev->subled_info[2].brightness;

Aha, it is LED vs LEN, but please don't obscure code with macros like
that. It is important to see that buf[] is fully initialized, macros
hide that.

> +	state =3D CMD_LED_STATE_LED(led->reg);
> +	if (buf[OMNIA_CMD_LED_COLOR_R] || buf[OMNIA_CMD_LED_COLOR_G] || buf[OMN=
IA_CMD_LED_COLOR_B])
> +		state |=3D CMD_LED_STATE_ON;

I'd make this conditional on mc_cdev->subled_info[0].brightness[x],
not buf, but...


> +	int ret, count;
> +
> +	count =3D of_get_available_child_count(np);
> +	if (!count) {
> +		dev_err(dev, "LEDs are not defined in device tree!\n");
> +		return -ENODEV;
> +	} else if (count > OMNIA_BOARD_LEDS) {
> +		dev_err(dev, "Too many LEDs defined in device tree!\n");
> +		return -EINVAL;
> +	}

Should count be unsigned?

Or better, should we check it is _exactly_ OMNIA_BOARD_LEDS as we only
support this known hardware?

[I suppose I'll apply it anyway; these can be fixed post-merge].

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--de3c47j54rb443wk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXxq+0QAKCRAw5/Bqldv6
8tOWAJ4jtM/jJjeOdm3RNfIqqjeMJlbBdwCfczh/fO/6vW3R94pdxTLtE9tu9uo=
=uDan
-----END PGP SIGNATURE-----

--de3c47j54rb443wk--
