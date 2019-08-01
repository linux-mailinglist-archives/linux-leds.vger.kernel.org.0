Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 588D57E4D3
	for <lists+linux-leds@lfdr.de>; Thu,  1 Aug 2019 23:36:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389199AbfHAVg0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 1 Aug 2019 17:36:26 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:55531 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389189AbfHAVgY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 1 Aug 2019 17:36:24 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id B8A2080333; Thu,  1 Aug 2019 23:36:09 +0200 (CEST)
Date:   Thu, 1 Aug 2019 23:36:20 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Dan Murphy <dmurphy@ti.com>, tony@atomide.com, sre@kernel.org,
        nekit1000@gmail.com, mpartap@gmx.net, merlijn@wizzup.org,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] leds: lm3532: Fix brightness control for i2c mode
Message-ID: <20190801213620.GA30096@amd>
References: <20190801151421.21486-1-dmurphy@ti.com>
 <3e304b9a-e7fc-9294-1950-ee9bc5956305@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="8t9RHnE3ZwKMSgU+"
Content-Disposition: inline
In-Reply-To: <3e304b9a-e7fc-9294-1950-ee9bc5956305@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

If we are going to complain about coding style... this should really
be split, one change per patch.

> > @@ -161,18 +167,18 @@ struct lm3532_data {
> >  };
> > =20
> >  static const struct reg_default lm3532_reg_defs[] =3D {
> > -	{LM3532_REG_OUTPUT_CFG, 0xe4},
> > +	{LM3532_REG_OUTPUT_CFG, 0x24},
> >  	{LM3532_REG_STARTSHUT_RAMP, 0xc0},
> >  	{LM3532_REG_RT_RAMP, 0xc0},
> >  	{LM3532_REG_PWM_A_CFG, 0x82},
> >  	{LM3532_REG_PWM_B_CFG, 0x82},
> >  	{LM3532_REG_PWM_C_CFG, 0x82},
> >  	{LM3532_REG_ZONE_CFG_A, 0xf1},
> > -	{LM3532_REG_CTRL_A_BRT, 0xf3},
> > +	{LM3532_REG_CTRL_A_FS_CURR, 0x13},
> >  	{LM3532_REG_ZONE_CFG_B, 0xf1},
> > -	{LM3532_REG_CTRL_B_BRT, 0xf3},
> > +	{LM3532_REG_CTRL_B_FS_CURR, 0x13},
> >  	{LM3532_REG_ZONE_CFG_C, 0xf1},
> > -	{LM3532_REG_CTRL_C_BRT, 0xf3},
> > +	{LM3532_REG_CTRL_C_FS_CURR, 0x13},
> >  	{LM3532_REG_ENABLE, 0xf8},
> >  	{LM3532_ALS_CONFIG, 0x44},
> >  	{LM3532_REG_ZN_0_HI, 0x35},

Default register values; are they related to the rest?

> > @@ -302,7 +308,7 @@ static int lm3532_led_disable(struct lm3532_led *le=
d_data)
> >  	int ret;
> > =20
> >  	ret =3D regmap_update_bits(led_data->priv->regmap, LM3532_REG_ENABLE,
> > -					 ctrl_en_val, ~ctrl_en_val);
> > +					 ctrl_en_val, 0);
> >  	if (ret) {
> >  		dev_err(led_data->priv->dev, "Failed to set ctrl:%d\n", ret);
> >  		return ret;

This should have no functional impact, its just a clenaup, probably
should go separately.=20

> > @@ -339,11 +345,9 @@ static int lm3532_brightness_set(struct led_classd=
ev *led_cdev,
> >  	if (ret)
> >  		goto unlock;
> > =20
> > -	brightness_reg =3D LM3532_REG_CTRL_A_BRT + led->control_bank * 2;
> > -	brt_val =3D brt_val / LM3532_BRT_VAL_ADJUST;
> > -
> > +	brightness_reg =3D LM3532_REG_ZONE_TRGT_A + led->control_bank * 5 +
> > +			 (led->ctrl_brt_pointer >> 2);
> >  	ret =3D regmap_write(led->priv->regmap, brightness_reg, brt_val);
> > -
> >  unlock:
> >  	mutex_unlock(&led->priv->lock);
> >  	return ret;

This is the core change, AFAICT.

> > @@ -356,8 +360,29 @@ static int lm3532_init_registers(struct lm3532_led=
 *led)
> >  	unsigned int output_cfg_val =3D 0;
> >  	unsigned int output_cfg_shift =3D 0;
> >  	unsigned int output_cfg_mask =3D 0;
> > +	int brightness_config_reg;
> > +	int brightness_config_val;
> >  	int ret, i;
> > =20
> > +	if (drvdata->enable_gpio)
> > +		gpiod_direction_output(drvdata->enable_gpio, 1);
> > +
> > +	brightness_config_reg =3D LM3532_REG_ZONE_CFG_A + led->control_bank *=
 2;
> > +	/* This could be hard coded to the default value but the control
>=20

Code is moved, probably should go in separately. We'll have less fun
bisecting problems when things are separate...

Thanks and best regards,
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--8t9RHnE3ZwKMSgU+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl1DW1QACgkQMOfwapXb+vL+rgCfSBWOu4JdJgQtyh3cTbH7hjH4
hYAAnRFbZTF3VD43ou/STBeinT4yQQpI
=2Ow8
-----END PGP SIGNATURE-----

--8t9RHnE3ZwKMSgU+--
