Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A213285E15
	for <lists+linux-leds@lfdr.de>; Wed,  7 Oct 2020 13:28:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727559AbgJGL17 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 7 Oct 2020 07:27:59 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:59568 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726129AbgJGL16 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 7 Oct 2020 07:27:58 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id BB2F61C0BAE; Wed,  7 Oct 2020 13:27:56 +0200 (CEST)
Date:   Wed, 7 Oct 2020 13:27:56 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Luka Kovacic <luka.kovacic@sartura.hr>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-leds@vger.kernel.org, lee.jones@linaro.org, dmurphy@ti.com,
        robh+dt@kernel.org, jdelvare@suse.com, linux@roeck-us.net,
        marek.behun@nic.cz, luka.perkov@sartura.hr, robert.marko@sartura.hr
Subject: Re: [PATCH v4 4/6] drivers: leds: Add the iEi WT61P803 PUZZLE LED
 driver
Message-ID: <20201007112756.GD12224@duo.ucw.cz>
References: <20201007004901.39859-1-luka.kovacic@sartura.hr>
 <20201007004901.39859-5-luka.kovacic@sartura.hr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="fXStkuK2IQBfcDe+"
Content-Disposition: inline
In-Reply-To: <20201007004901.39859-5-luka.kovacic@sartura.hr>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--fXStkuK2IQBfcDe+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Add support for the iEi WT61P803 PUZZLE LED driver.
> Currently only the front panel power LED is supported.
>=20
> This driver depends on the iEi WT61P803 PUZZLE MFD driver.

> +static int iei_wt61p803_puzzle_led_brightness_set_blocking(struct led_cl=
assdev *cdev,
> +							   enum led_brightness brightness)
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

Are you sure you need the mutex?

> +	ret =3D devm_led_classdev_register_ext(dev, &priv->cdev, &init_data);
> +	if (ret) {
> +		dev_err(dev, "Could not register LED\n");
> +		goto err_child_node;
> +	}
> +	return 0;
> +err_child_node:
> +	fwnode_handle_put(child);
> +	return ret;
> +}

Is the fwnode_handle_put(child); missing in non-error path somewhere?

> +MODULE_LICENSE("GPL");

Make sure this is consistent with file header. GPLv2+, if you can.

Best regards,

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--fXStkuK2IQBfcDe+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX32mPAAKCRAw5/Bqldv6
8qoDAJsGLSdnj7pS5+jNN106nqxPCn+sIwCgjgVV9LxT/eQ1kyFjPAxMgU23t+U=
=NwvO
-----END PGP SIGNATURE-----

--fXStkuK2IQBfcDe+--
