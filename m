Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E25B1C454B
	for <lists+linux-leds@lfdr.de>; Mon,  4 May 2020 20:14:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731074AbgEDSAx (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 4 May 2020 14:00:53 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:47478 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731069AbgEDSAw (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 4 May 2020 14:00:52 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 67F4E1C0220; Mon,  4 May 2020 20:00:49 +0200 (CEST)
Date:   Mon, 4 May 2020 20:00:49 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     nikitos.tr@gmail.com
Cc:     dmurphy@ti.com, robh+dt@kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 1/3] leds: add aw2013 driver
Message-ID: <20200504180049.GA5067@duo.ucw.cz>
References: <20200504162934.4693-1-nikitos.tr@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="/04w6evG8XlLl3ft"
Content-Disposition: inline
In-Reply-To: <20200504162934.4693-1-nikitos.tr@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--/04w6evG8XlLl3ft
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> +#define AW2013_NAME "aw2013"

That's.... not really useful define. Make it NAME? Drop it?

> +#define AW2013_TIME_STEP 130

I'd add comment with /* units */.

> +#define STATE_OFF 0
> +#define STATE_KEEP 1
> +#define STATE_ON 2

We should add enum into core for this...

> +static int aw2013_chip_init(struct aw2013 *chip)
> +{
> +	int i, ret;
> +
> +	ret =3D regmap_write(chip->regmap, AW2013_GCR, AW2013_GCR_ENABLE);
> +	if (ret) {
> +		dev_err(&chip->client->dev, "Failed to enable the chip: %d\n",
> +			ret);
> +		goto error;
> +	}
> +
> +	for (i =3D 0; i < chip->num_leds; i++) {
> +		ret =3D regmap_update_bits(chip->regmap,
> +					 AW2013_LCFG(chip->leds[i].num),
> +					 AW2013_LCFG_IMAX_MASK,
> +					 chip->leds[i].imax);
> +		if (ret) {
> +			dev_err(&chip->client->dev,
> +				"Failed to set maximum current for led %d: %d\n",
> +				chip->leds[i].num, ret);
> +			goto error;
> +		}
> +	}
> +
> +error:
> +	return ret;
> +}

No need for goto if you are just returning.

> +static bool aw2013_chip_in_use(struct aw2013 *chip)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < chip->num_leds; i++)
> +		if (chip->leds[i].cdev.brightness)
> +			return true;
> +
> +	return false;
> +}

How is this going to interact with ledstate =3D=3D KEEP?

> +static int aw2013_brightness_set(struct led_classdev *cdev,
> +				 enum led_brightness brightness)
> +{
> +	struct aw2013_led *led =3D container_of(cdev, struct aw2013_led, cdev);
> +	int ret, num;
> +
> +	mutex_lock(&led->chip->mutex);
> +
> +	if (aw2013_chip_in_use(led->chip)) {
> +		ret =3D aw2013_chip_enable(led->chip);
> +		if (ret)
> +			return ret;
> +	}

You are returning with mutex held.

> +	/* Never on - just set to off */
> +	if (!*delay_on)
> +		return aw2013_brightness_set(&led->cdev, LED_OFF);
> +
> +	/* Never off - just set to brightness */
> +	if (!*delay_off)
> +		return aw2013_brightness_set(&led->cdev, led->cdev.brightness);

Is this dance neccessary? Should we do it in the core somewhere?

> +		} else {
> +			led->imax =3D 1; // 5mA
> +			dev_info(&client->dev,
> +				 "DT property led-max-microamp is missing!\n");
> +		}

Lets remove the exclamation mark.

> +		led->num =3D source;
> +		led->chip =3D chip;
> +		led->fwnode =3D of_fwnode_handle(child);
> +
> +		if (!of_property_read_string(child, "default-state", &str)) {
> +			if (!strcmp(str, "on"))
> +				led->default_state =3D STATE_ON;
> +			else if (!strcmp(str, "keep"))
> +				led->default_state =3D STATE_KEEP;
> +			else
> +				led->default_state =3D STATE_OFF;
> +		}

We should really have something in core for this. Should we support
arbitrary brightness there?

> +static void aw2013_read_current_state(struct aw2013 *chip)
> +{
> +	int i, led_on;
> +
> +	regmap_read(chip->regmap, AW2013_LCTR, &led_on);
> +
> +	for (i =3D 0; i < chip->num_leds; i++) {
> +		if (!(led_on & AW2013_LCTR_LE(chip->leds[i].num))) {
> +			chip->leds[i].cdev.brightness =3D LED_OFF;
> +			continue;
> +		}
> +		regmap_read(chip->regmap, AW2013_REG_PWM(chip->leds[i].num),
> +			    &chip->leds[i].cdev.brightness);
> +	}
> +}
> +
> +static void aw2013_init_default_state(struct aw2013_led *led)
> +{
> +	switch (led->default_state) {
> +	case STATE_ON:
> +		led->cdev.brightness =3D LED_FULL;
> +		break;
> +	case STATE_OFF:
> +		led->cdev.brightness =3D LED_OFF;
> +	} /* On keep - just set brightness that was retrieved previously */
> +
> +	aw2013_brightness_set(&led->cdev, led->cdev.brightness);
> +}

Aha; I guess this makes "keeping" the state to work. Do you really
need that functionality?

Pretty nice driver, thanks.

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--/04w6evG8XlLl3ft
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXrBYUQAKCRAw5/Bqldv6
8vgWAJ9WeR5dGSlwHlUTp6MxPEwVtyx+6wCgj7lyJGhIoXq2ucnLkhPzBdInxUU=
=U8CV
-----END PGP SIGNATURE-----

--/04w6evG8XlLl3ft--
