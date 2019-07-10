Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1218064C8A
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jul 2019 21:09:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727734AbfGJTJx (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 10 Jul 2019 15:09:53 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:47183 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727612AbfGJTJx (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 10 Jul 2019 15:09:53 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 8811880552; Wed, 10 Jul 2019 21:09:39 +0200 (CEST)
Date:   Wed, 10 Jul 2019 21:09:50 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jean-Jacques Hiblot <jjhiblot@ti.com>
Cc:     jacek.anaszewski@gmail.com, robh+dt@kernel.org,
        mark.rutland@arm.com, lee.jones@linaro.org,
        daniel.thompson@linaro.org, jingoohan1@gmail.com, dmurphy@ti.com,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, tomi.valkeinen@ti.com
Subject: Re: [PATCH v3 1/4] leds: Add of_led_get() and led_put()
Message-ID: <20190710190949.GA22995@amd>
References: <20190710123932.28244-1-jjhiblot@ti.com>
 <20190710123932.28244-2-jjhiblot@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="zhXaljGHf11kAtnf"
Content-Disposition: inline
In-Reply-To: <20190710123932.28244-2-jjhiblot@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--zhXaljGHf11kAtnf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2019-07-10 14:39:29, Jean-Jacques Hiblot wrote:
> From: Tomi Valkeinen <tomi.valkeinen@ti.com>
>=20
> This patch adds basic support for a kernel driver to get a LED device.
> This will be used by the led-backlight driver.
>=20
> Only OF version is implemented for now, and the behavior is similar to
> PWM's of_pwm_get() and pwm_put().
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>


> @@ -214,6 +215,55 @@ static int led_resume(struct device *dev)
> =20
>  static SIMPLE_DEV_PM_OPS(leds_class_dev_pm_ops, led_suspend, led_resume);
> =20
> +static int led_match_led_node(struct device *led_dev, const void *data)
> +{
> +	return led_dev->of_node =3D=3D data ? 1 : 0;
> +}

Get rid of the "? 1 : 0"?


> +	led_node =3D of_parse_phandle(np, "leds", index);
> +	if (!led_node)
> +		return ERR_PTR(-ENOENT);
> +	led_dev =3D class_find_device(leds_class, NULL, led_node,
> +		led_match_led_node);
> +	of_node_put(led_node);
> +
> +	if (!led_dev)
> +		return ERR_PTR(-EPROBE_DEFER);

Won't this defer probe "forever" when the driver is not available?

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--zhXaljGHf11kAtnf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl0mN/0ACgkQMOfwapXb+vLwOACgqRt52HSMt592gFClzK2iP415
y24AnjCg6g9zaxvJONjBcQDCZzcUUDDj
=tRvd
-----END PGP SIGNATURE-----

--zhXaljGHf11kAtnf--
