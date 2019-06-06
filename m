Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB03937142
	for <lists+linux-leds@lfdr.de>; Thu,  6 Jun 2019 12:07:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727848AbfFFKHK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 6 Jun 2019 06:07:10 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:45861 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726972AbfFFKHK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 6 Jun 2019 06:07:10 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id B88B4803EB; Thu,  6 Jun 2019 12:06:56 +0200 (CEST)
Date:   Thu, 6 Jun 2019 12:07:06 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, broonie@kernel.org,
        lgirdwood@gmail.com, lee.jones@linaro.org,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 5/5] leds: lm36274: Introduce the TI LM36274 LED driver
Message-ID: <20190606100706.GA1825@amd>
References: <20190605125634.7042-1-dmurphy@ti.com>
 <20190605125634.7042-6-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="bp/iNruPH9dso1Pn"
Content-Disposition: inline
In-Reply-To: <20190605125634.7042-6-dmurphy@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Introduce the LM36274 LED driver.  This driver uses the ti-lmu
> MFD driver to probe this LED driver.  The driver configures only the
> LED registers and enables the outputs according to the config file.
>=20
> The driver utilizes the TI LMU (Lighting Management Unit) LED common
> framework to set the brightness bits.

Nothing too bad, but...

> +static int lm36274_parse_dt(struct lm36274 *lm36274_data)
> +{
> +	struct fwnode_handle *child =3D NULL;
> +	char label[LED_MAX_NAME_SIZE];
> +	struct device *dev =3D &lm36274_data->pdev->dev;
> +	const char *name;
> +	int child_cnt;
> +	int ret =3D -EINVAL;
> +
> +	/* There should only be 1 node */
> +	child_cnt =3D device_get_child_node_count(dev);
> +	if (child_cnt !=3D 1)
> +		return ret;

I'd do direct "return -EINVAL" here.

> +	device_for_each_child_node(dev, child) {
> +		ret =3D fwnode_property_read_string(child, "label", &name);
> +		if (ret)
> +			snprintf(label, sizeof(label),
> +				"%s::", lm36274_data->pdev->name);
> +		else
> +			snprintf(label, sizeof(label),
> +				 "%s:%s", lm36274_data->pdev->name, name);
> +
> +		lm36274_data->num_leds =3D fwnode_property_read_u32_array(child,
> +							  "led-sources",
> +							  NULL, 0);
> +		if (lm36274_data->num_leds <=3D 0)
> +			return -ENODEV;
> +
> +		ret =3D fwnode_property_read_u32_array(child, "led-sources",
> +						     lm36274_data->led_sources,
> +						     lm36274_data->num_leds);
> +		if (ret) {
> +			dev_err(dev, "led-sources property missing\n");
> +			return -EINVAL;

Should it return ret here? If read array failed with -ENOMEM, we may
want to propagate that.

> +		}
> +
> +		fwnode_property_read_string(child, "linux,default-trigger",
> +					&lm36274_data->led_dev.default_trigger);
> +
> +	}
> +
> +	lm36274_data->lmu_data.regmap =3D lm36274_data->regmap;
> +	lm36274_data->lmu_data.max_brightness =3D MAX_BRIGHTNESS_11BIT;
> +	lm36274_data->lmu_data.msb_brightness_reg =3D LM36274_REG_BRT_MSB;
> +	lm36274_data->lmu_data.lsb_brightness_reg =3D LM36274_REG_BRT_LSB;
> +
> +	lm36274_data->led_dev.name =3D label;
> +	lm36274_data->led_dev.max_brightness =3D MAX_BRIGHTNESS_11BIT;
> +	lm36274_data->led_dev.brightness_set_blocking =3D lm36274_brightness_se=
t;
> +
> +	return ret;

I'd do "return 0" here. It is success. Yes, ret will always have that
value at this moment, but...

> +static int lm36274_probe(struct platform_device *pdev)
> +{
> +	struct ti_lmu *lmu =3D dev_get_drvdata(pdev->dev.parent);
> +	struct lm36274 *lm36274_data;
> +	int ret;
> +
> +	lm36274_data =3D devm_kzalloc(&pdev->dev, sizeof(*lm36274_data),
> +				    GFP_KERNEL);
> +	if (!lm36274_data) {
> +		ret =3D -ENOMEM;
> +		return ret;
> +	}

Just do return -ENOMEM;

Acked-by: Pavel Machek <pavel@ucw.cz>
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--bp/iNruPH9dso1Pn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlz45coACgkQMOfwapXb+vJpUQCglh9YImf4M842218a0pSSEMiW
hhUAmwQ5kL54IV8eBFctVi6Aelt85+0u
=5jN6
-----END PGP SIGNATURE-----

--bp/iNruPH9dso1Pn--
