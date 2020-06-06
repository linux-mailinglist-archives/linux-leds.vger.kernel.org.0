Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB9BB1F07C3
	for <lists+linux-leds@lfdr.de>; Sat,  6 Jun 2020 17:53:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728714AbgFFPx1 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 6 Jun 2020 11:53:27 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:59560 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727100AbgFFPx1 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 6 Jun 2020 11:53:27 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 2C2871C0C0B; Sat,  6 Jun 2020 17:53:25 +0200 (CEST)
Date:   Sat, 6 Jun 2020 17:53:24 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, devicetree@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v26 03/15] leds: multicolor: Introduce a multicolor class
 definition
Message-ID: <20200606155324.GA21130@amd>
References: <20200604120504.32425-1-dmurphy@ti.com>
 <20200604120504.32425-4-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="OgqxwSJOaUobr8KG"
Content-Disposition: inline
In-Reply-To: <20200604120504.32425-4-dmurphy@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--OgqxwSJOaUobr8KG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Introduce a multicolor class that groups colored LEDs
> within a LED node.
>=20
> The multi color class groups monochrome LEDs and allows controlling two
> aspects of the final combined color: hue and lightness. The former is
> controlled via the intensity file and the latter is controlled
> via brightness file.
>=20
> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Signed-off-by: Dan Murphy <dmurphy@ti.com>

> diff --git a/Documentation/ABI/testing/sysfs-class-led-multicolor b/Docum=
entation/ABI/testing/sysfs-class-led-multicolor
> new file mode 100644
> index 000000000000..7d33a82a4b07
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-class-led-multicolor
> @@ -0,0 +1,34 @@
> +What:		/sys/class/leds/<led>/brightness
> +Date:		March 2020
> +KernelVersion:	5.8
> +Contact:	Dan Murphy <dmurphy@ti.com>
> +Description:	read/write
> +		Writing to this file will update all LEDs within the group to a
> +		calculated percentage of what each color LED intensity is set
> +		to. The percentage is calculated for each grouped LED via the
> +		equation below:

> +		led_brightness =3D brightness * multi_intensity/max_brightness
> +
> +		For additional details please refer to
> +		Documentation/leds/leds-class-multicolor.rst.
> +
> +		The value of the color is from 0 to
> +		/sys/class/leds/<led>/max_brightness.

It is not too clear to me what "color" means here.

It would be worth mentioning that this is single integer.

> +What:		/sys/class/leds/<led>/multi_index
> +Date:		March 2020
> +KernelVersion:	5.8
> +Contact:	Dan Murphy <dmurphy@ti.com>
> +Description:	read
> +		The multi_index array, when read, will output the LED colors
> +		by name as they are indexed in the multi_intensity file.

This should specify that it is array of strings.

> +What:		/sys/class/leds/<led>/multi_intensity
> +Date:		March 2020
> +KernelVersion:	5.8
> +Contact:	Dan Murphy <dmurphy@ti.com>
> +Description:	read/write
> +		Intensity level for the LED color within the array.
> +		The intensities for each color must be entered based on the
> +		multi_index array.

I'd mention here that it is array of integers, and what the maximum
values are.

> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9533,6 +9533,14 @@ F:	Documentation/devicetree/bindings/leds/
>  F:	drivers/leds/
>  F:	include/linux/leds.h
> =20
> +LED MULTICOLOR FRAMEWORK
> +M:	Dan Murphy <dmurphy@ti.com>
> +L:	linux-leds@vger.kernel.org

I'd like to be mentioned here, too. "M: Pavel Machek
<pavel@ucw.cz>". And I'm not sure if I should be taking MAINTAINER
file update through a LED tree. Should definitely go to separate
patch.

> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 9cdc4cfc5d11..fe7d90d4fa23 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -30,6 +30,16 @@ config LEDS_CLASS_FLASH
>  	  for the flash related features of a LED device. It can be built
>  	  as a module.
> =20
> +config LEDS_CLASS_MULTI_COLOR
> +	tristate "LED MultiColor LED Class Support"

"LED MultiColor Class Support"

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--OgqxwSJOaUobr8KG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl7bu/QACgkQMOfwapXb+vIzgQCfSrppct2w8jufcl83cYjriW8p
LL4An0F9azcmyG2TDnmsc9jyN8wb+0mg
=atC2
-----END PGP SIGNATURE-----

--OgqxwSJOaUobr8KG--
