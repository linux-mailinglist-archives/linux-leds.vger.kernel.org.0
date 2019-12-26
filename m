Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DA3512AB8D
	for <lists+linux-leds@lfdr.de>; Thu, 26 Dec 2019 11:13:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726442AbfLZKNj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 26 Dec 2019 05:13:39 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:42454 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726023AbfLZKNj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 26 Dec 2019 05:13:39 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 7E8E81C213B; Thu, 26 Dec 2019 11:13:37 +0100 (CET)
Date:   Thu, 26 Dec 2019 11:13:36 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/6] leds: lm3692x: Make sure we don't exceed the
 maximum led current
Message-ID: <20191226101336.GD4033@amd>
References: <cover.1577271823.git.agx@sigxcpu.org>
 <96dad031f3a9ff5bbc311d0ec8768b348b996bcf.1577271823.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="tEFtbjk+mNEviIIX"
Content-Disposition: inline
In-Reply-To: <96dad031f3a9ff5bbc311d0ec8768b348b996bcf.1577271823.git.agx@sigxcpu.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--tEFtbjk+mNEviIIX
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2019-12-25 12:07:19, Guido G=FCnther wrote:
1;2802;0c> The current is given by the formular from page 12 of
> https://www.ti.com/lit/ds/symlink/lm36922.pdf. We use this to limit the
> led's max_brightness using the led-max-microamp DT property.
>=20
> The formular for the lm36923 is identical according to the data
sheet.

formula?

>  static int lm3692x_probe_dt(struct lm3692x_led *led)
>  {
>  	struct fwnode_handle *child =3D NULL;
>  	struct led_init_data init_data =3D {};
> -	u32 ovp;
> +	u32 ovp, max_cur;
>  	bool exp_mode;
>  	int ret;
> =20
> @@ -397,6 +416,10 @@ static int lm3692x_probe_dt(struct lm3692x_led *led)
>  		return ret;
>  	}
> =20
> +	fwnode_property_read_u32(child, "led-max-microamp", &max_cur);
> +	led->led_dev.max_brightness =3D ret ? LED_FULL :
> +		lm3692x_max_brightness(led, max_cur);
> +

Umm. Should ret come from this fwnode_property_read_u32()?

With that fixed,

Acked-by: Pavel Machek <pavel@ucw.cz>

(Feel free to wait for Rob before resending the series, and I guess
you can merge it with the next one).

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--tEFtbjk+mNEviIIX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl4Eh9AACgkQMOfwapXb+vIglQCeMrwe/Mmp0WlahYYTtwHfe8sG
OTMAmwfEU5NP/YUQIzgkfjiT8CLprnMZ
=3xmI
-----END PGP SIGNATURE-----

--tEFtbjk+mNEviIIX--
