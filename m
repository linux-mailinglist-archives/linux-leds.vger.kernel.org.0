Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DE4829A694
	for <lists+linux-leds@lfdr.de>; Tue, 27 Oct 2020 09:29:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2894799AbgJ0I3E (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 27 Oct 2020 04:29:04 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:35672 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2894797AbgJ0I3E (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 27 Oct 2020 04:29:04 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 68AFD1C0B7F; Tue, 27 Oct 2020 09:29:01 +0100 (CET)
Date:   Tue, 27 Oct 2020 09:29:00 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     cy_huang <u0084500@gmail.com>
Cc:     dmurphy@ti.com, robh+dt@kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, cy_huang@richtek.com,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v1 1/2] leds: rt4505: Add support for Richtek RT4505
 flash led controller
Message-ID: <20201027082900.GA21354@amd>
References: <1603784069-24114-1-git-send-email-u0084500@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="J/dobhs11T7y2rNN"
Content-Disposition: inline
In-Reply-To: <1603784069-24114-1-git-send-email-u0084500@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--J/dobhs11T7y2rNN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> From: ChiYuan Huang <cy_huang@richtek.com>
>=20
> Add support for RT4505 flash led controller. It can support up to 1.5A
> flash current with hardware timeout and low input voltage
> protection.

Please use upper-case "LED" everywhere.

This should be 2nd in the series, after DT changes.

> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> ---
>  drivers/leds/Kconfig       |  11 ++
>  drivers/leds/Makefile      |   1 +
>  drivers/leds/leds-rt4505.c | 397 +++++++++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 409 insertions(+)
>  create mode 100644 drivers/leds/leds-rt4505.c

Lets put this into drivers/leds/flash/. (Yes, you'll have to create
it).


> +	help
> +	  This option enables support for the RT4505 flash led controller.

Information where it is used would be welcome here.

> +	  It can support up to 1.5A flash strobe current with hardware timeout
> +	  and low input voltage protection.

This does not / should not be here.
> +
> +static int rt4505_torch_brightness_set(struct led_classdev *lcdev, enum =
led_brightness level)
> +{

80 columns, where easy.

> +	struct rt4505_priv *priv =3D container_of(lcdev, struct rt4505_priv, fl=
ash.led_cdev);
> +	u32 val =3D 0;
> +	int ret;
> +
> +	mutex_lock(&priv->lock);
> +
> +	if (level !=3D LED_OFF) {
> +		ret =3D regmap_update_bits(priv->regmap, RT4505_REG_ILED, RT4505_ITORC=
H_MASK,
> +					 (level - 1) << RT4505_ITORCH_SHIFT);
> +		if (ret)
> +			goto unlock;
> +
> +		val =3D RT4505_TORCH_SET;
> +	}
> +
> +	ret =3D regmap_update_bits(priv->regmap, RT4505_REG_ENABLE, RT4505_ENAB=
LE_MASK, val);
> +
> +unlock:
> +	mutex_unlock(&priv->lock);
> +	return ret;
> +}

Why is the locking needed? What will the /sys/class/leds interface
look like on system with your flash?

> +static int rt4505_flash_strobe_get(struct led_classdev_flash *fled_cdev,=
 bool *state)
> +{
> +	struct rt4505_priv *priv =3D container_of(fled_cdev, struct rt4505_priv=
, flash);
> +	u32 val;
> +	int ret;
> +
> +	mutex_lock(&priv->lock);
> +
> +	ret =3D regmap_read(priv->regmap, RT4505_REG_ENABLE, &val);
> +	if (ret)
> +		goto unlock;
> +
> +	*state =3D ((val & RT4505_FLASH_GET) =3D=3D RT4505_FLASH_GET) ? true : =
false;

No need for ? ... part.

> +static bool rt4505_is_accessible_reg(struct device *dev, unsigned int re=
g)
> +{
> +	if (reg =3D=3D RT4505_REG_RESET || (reg >=3D RT4505_REG_CONFIG  && reg =
<=3D RT4505_REG_FLAGS))
> +		return true;

Make this two stagements.

Otherwise... looks like easy simple driver, thanks.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--J/dobhs11T7y2rNN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl+X2kwACgkQMOfwapXb+vLQ7ACfdRhgoq+ELbs1YrC/k4qEE376
hWcAn2qLD+x2DD1zEWNh12yTPEPIOMgB
=lwCH
-----END PGP SIGNATURE-----

--J/dobhs11T7y2rNN--
