Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A04944B95D
	for <lists+linux-leds@lfdr.de>; Wed, 10 Nov 2021 00:29:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232078AbhKIXc1 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 9 Nov 2021 18:32:27 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:55264 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232057AbhKIXcT (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 9 Nov 2021 18:32:19 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 273E71C0B80; Wed, 10 Nov 2021 00:29:32 +0100 (CET)
Date:   Wed, 10 Nov 2021 00:29:31 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Florian Eckert <fe@dev.tdt.de>
Cc:     robh+dt@kernel.org, Eckert.Florian@googlemail.com,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] leds: ktd20xx: Add the KTD20xx family of the RGB
 LEDs driver from Kinetic
Message-ID: <20211109232930.GB26764@amd>
References: <20211109100822.5412-1-fe@dev.tdt.de>
 <20211109100822.5412-2-fe@dev.tdt.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="NMuMz9nt05w80d4+"
Content-Disposition: inline
In-Reply-To: <20211109100822.5412-2-fe@dev.tdt.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--NMuMz9nt05w80d4+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

hi!

> Introduce the KTD2061/58/59/60 RGB LEDs driver. The difference in these
> parts are the address number on the I2C bus the device is listen on.
>=20
> All KT20xx device could control up to 12 LEDs. The chip can be operated
> in two variants.

How are the variants selected?

> Variant 1:
> The device has the ability to group LED outputs into two banks so that
> the two LED banks can be controlled with the same color. This could not
> be done via the LEDs 'sysfs' entry because of the limitation on the color
> register count. The color of the two banks can be configured via device
> 'sysfs' entry for all LEDs at once [current_color0|current_color1].
> Which color the LED is to be used can be set via the 'sysfs' of the
> individual LEDs via the 'multi_intensity' file. Valid values for the
> colors (RGB) are 0 | 1. The value 0 selects the color register 0 and the
> value 1 selects the color register 1.

So... you can select two colors (current_color0, current_color1), and
then then each of the 12 LEDs get one of those colors. What about
intensities? Can brightness be set arbitrarily for each LED?

> Variant 2:
> The device can also set the LED color independently. Since the chip only
> has two color registers, but we want to control the 12 LEDs
> independently via the 'led-class-multicolour' sysfs entry,
> the full RGB color depth cannot be used. Due to this limitation, only 7
> colors and the color black (off) can be set. To use this mode the color
> registers must be preset via the device tree or the device 'sysfs'. The
> color registers 0 must be preset with 0x00 (Red=3D0x00 Green=3D0x00 Blue=
=3D0x00).
> The color register1 should be preset all with the same value. This value
> depends on which light intensity is to be used in the setup.

So now we have 7 colors we can select from. That sounds better than
two colors. Why would we ever want to use variant 1?

Can we simply pretend this is 7 LED RGB driver?

> +/* Device attribute for color0 register
> + *
> + * The device attribute colour1 is intended to adjust the colour space.

Use color, not colour. Plus run this through checkpatch.

> + * The colour strength can be controlled via the current in 125uA steps.

I don't know what "colour strength" is.

> +/*
> + * The chip also offers the option "Fade rate".
> + */
> +static ssize_t faderate_show(struct device *dev, struct device_attribute=
 *a,
> +		char *buf)
> +{
> +	struct i2c_client *client =3D to_i2c_client(dev);
> +	struct ktd20xx *chip =3D i2c_get_clientdata(client);
> +	unsigned int value;
> +
> +	mutex_lock(&chip->lock);
> +	regmap_field_read(chip->faderate, &value);
> +	mutex_unlock(&chip->lock);
> +
> +	return sprintf(buf, "%d\n", value);
> +}

That's way too hardware specific.

Best regards,
									Pavel
--=20
http://www.livejournal.com/~pavelmachek

--NMuMz9nt05w80d4+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmGLBFoACgkQMOfwapXb+vLgVgCfSAOGWebHBAMez7RBh1oGoRAp
6NsAn1cX05E3bf9cg2jmYsFiD+QpeE0W
=DsMc
-----END PGP SIGNATURE-----

--NMuMz9nt05w80d4+--
