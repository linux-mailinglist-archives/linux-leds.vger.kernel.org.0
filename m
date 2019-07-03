Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F02895EEE2
	for <lists+linux-leds@lfdr.de>; Thu,  4 Jul 2019 00:00:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726821AbfGCWAs (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 3 Jul 2019 18:00:48 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:38187 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726736AbfGCWAs (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 3 Jul 2019 18:00:48 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id E8843805B0; Thu,  4 Jul 2019 00:00:32 +0200 (CEST)
Date:   Thu, 4 Jul 2019 00:00:43 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh@kernel.org, dtor@google.com,
        linux@roeck-us.net, dmurphy@ti.com,
        Baolin Wang <baolin.wang@linaro.org>,
        Daniel Mack <daniel@zonque.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Oleh Kravchenko <oleg@kaa.org.ua>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Simon Shields <simon@lineageos.org>
Subject: Re: [PATCH v5 05/26] leds: core: Add support for composing LED class
 device names
Message-ID: <20190703220043.GA876@amd>
References: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
 <20190609190803.14815-6-jacek.anaszewski@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="5mCyUwZo2JvN/JJP"
Content-Disposition: inline
In-Reply-To: <20190609190803.14815-6-jacek.anaszewski@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--5mCyUwZo2JvN/JJP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

Sorry for the delay.

> @@ -27,6 +29,18 @@ EXPORT_SYMBOL_GPL(leds_list_lock);
>  LIST_HEAD(leds_list);
>  EXPORT_SYMBOL_GPL(leds_list);
> =20
> +const char *led_colors[LED_COLOR_ID_MAX] =3D {

const char * const , if we want to play that game?


> +	[LED_COLOR_ID_WHITE] =3D "white",
> +	[LED_COLOR_ID_RED] =3D "red",
> +	[LED_COLOR_ID_GREEN] =3D "green",
> +	[LED_COLOR_ID_BLUE] =3D "blue",
> +	[LED_COLOR_ID_AMBER] =3D "amber",
> +	[LED_COLOR_ID_VIOLET] =3D "violet",
> +	[LED_COLOR_ID_YELLOW] =3D "yellow",
> +	[LED_COLOR_ID_IR] =3D "ir",
> +};
> +EXPORT_SYMBOL_GPL(led_colors);
> +

> +	if (fwnode_property_present(fwnode, "label")) {
> +		ret =3D fwnode_property_read_string(fwnode, "label", &props->label);
> +		if (ret)
> +			dev_err(dev, "Error parsing \'label\' property (%d)\n", ret);
> +		return;

I don't think you need to escape ' with \.

> +	if (fwnode_property_present(fwnode, "function")) {
> +		ret =3D fwnode_property_read_string(fwnode, "function", &props->functi=
on);
> +		if (ret) {
> +			dev_err(dev,
> +				"Error parsing \'function\' property (%d)\n",
> +				ret);
> +		}
> +	} else {
> +		return;
> +	}

> +
> +	if (fwnode_property_present(fwnode, "function-enumerator")) {

I'd do if (!fwnode_property_present()) return; in both occasions, to
save an indentation level; but that's nitpicking.

> +	if (props.label) {
> +		/*
> +		 * If init_data.devicename is NULL, then it indicates that
> +		 * DT label should be used as-is for LED class device name.
> +		 * Otherwise the label is prepended with devicename to compose
> +		 * the final LED class device name.
> +		 */
> +		if (!devicename) {
> +			strncpy(led_classdev_name, props.label,
> +				LED_MAX_NAME_SIZE);
> +		} else {
> +			snprintf(led_classdev_name, LED_MAX_NAME_SIZE, "%s:%s",
> +				 devicename, props.label);
> +		}

Unlike snprintf(), strncpy() does not guarantee NULL termination.

I did not check the shell script.

With that fixed,

Acked-by: Pavel Machek <pavel@ucw.cz>

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--5mCyUwZo2JvN/JJP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl0dJYsACgkQMOfwapXb+vIsIQCdHeXyY51Wi7XK3/jnfTSCSYyv
OasAoKFj4QE6Bn6SkRH40Pkbh0DKIheX
=vR+B
-----END PGP SIGNATURE-----

--5mCyUwZo2JvN/JJP--
