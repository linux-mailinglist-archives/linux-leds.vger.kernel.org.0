Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71E5327F2B8
	for <lists+linux-leds@lfdr.de>; Wed, 30 Sep 2020 21:48:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728916AbgI3TsD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 30 Sep 2020 15:48:03 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:49294 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725799AbgI3TsD (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 30 Sep 2020 15:48:03 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id B36711C0B76; Wed, 30 Sep 2020 21:48:00 +0200 (CEST)
Date:   Wed, 30 Sep 2020 21:48:00 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Luka Kovacic <luka.kovacic@sartura.hr>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-leds@vger.kernel.org,
        lee.jones@linaro.org, dmurphy@ti.com, robh+dt@kernel.org,
        jdelvare@suse.com, linux@roeck-us.net, andrew@lunn.ch,
        jason@lakedaemon.net, gregory.clement@bootlin.com,
        marek.behun@nic.cz, luka.perkov@sartura.hr, robert.marko@sartura.hr
Subject: Re: [PATCH v3 4/7] drivers: leds: Add the iEi WT61P803 PUZZLE LED
 driver
Message-ID: <20200930194759.GA24378@amd>
References: <20200930014058.44460-1-luka.kovacic@sartura.hr>
 <20200930014058.44460-5-luka.kovacic@sartura.hr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="PNTmBPCT7hxwcZjr"
Content-Disposition: inline
In-Reply-To: <20200930014058.44460-5-luka.kovacic@sartura.hr>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--PNTmBPCT7hxwcZjr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> +static int iei_wt61p803_puzzle_led_brightness_set_blocking(struct led_cl=
assdev *cdev,
> +		enum led_brightness brightness)
> +{
> +	struct iei_wt61p803_puzzle_led *priv =3D cdev_to_iei_wt61p803_puzzle_le=
d(cdev);
> +	unsigned char *resp_buf =3D priv->response_buffer;
> +	unsigned char led_power_cmd[5] =3D {
> +		IEI_WT61P803_PUZZLE_CMD_HEADER_START,
> +		IEI_WT61P803_PUZZLE_CMD_LED,
> +		IEI_WT61P803_PUZZLE_CMD_LED_POWER,
> +		(char)IEI_LED_OFF
> +	};
> +	size_t reply_size;
> +
> +	mutex_lock(&priv->lock);
> +	if (brightness =3D=3D LED_OFF) {
> +		led_power_cmd[3] =3D (char)IEI_LED_OFF;
> +		priv->led_power_state =3D LED_OFF;
> +	} else {
> +		led_power_cmd[3] =3D (char)IEI_LED_ON;
> +		priv->led_power_state =3D LED_ON;
> +	}
> +	mutex_unlock(&priv->lock);
> +
> +	return iei_wt61p803_puzzle_write_command(priv->mcu, led_power_cmd,
> +			sizeof(led_power_cmd), resp_buf, &reply_size);
> +}

Is the mutex needed? If so, should it include the
iei_wt61p803_puzzle_write_command()? Does
iei_wt61p803_puzzle_write_command() have internal locking to prevent
two messages from being mingled?

Best regards,
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--PNTmBPCT7hxwcZjr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl904O8ACgkQMOfwapXb+vJOSQCguV6B9JSD9i7nKfA/RwRRVT4C
7acAn2vNyJo369bnI3lFJ7V+FVzDajV0
=hxl0
-----END PGP SIGNATURE-----

--PNTmBPCT7hxwcZjr--
