Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEF0CBF0DD
	for <lists+linux-leds@lfdr.de>; Thu, 26 Sep 2019 13:10:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725806AbfIZLKs (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 26 Sep 2019 07:10:48 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:47284 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725280AbfIZLKr (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 26 Sep 2019 07:10:47 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 920F68073E; Thu, 26 Sep 2019 13:10:29 +0200 (CEST)
Date:   Thu, 26 Sep 2019 13:10:43 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, linus.walleij@linaro.org,
        shawnguo@kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Tony Lindgren <tony@atomide.com>,
        =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>
Subject: Re: [PATCH v9 01/15] leds: multicolor: Add sysfs interface definition
Message-ID: <20190926111043.GA9310@amd>
References: <20190925174616.3714-1-dmurphy@ti.com>
 <20190925174616.3714-2-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="FL5UXtIhxfXey3p5"
Content-Disposition: inline
In-Reply-To: <20190925174616.3714-2-dmurphy@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--FL5UXtIhxfXey3p5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> diff --git a/Documentation/leds/leds-class-multicolor.rst b/Documentation=
/leds/leds-class-multicolor.rst
> new file mode 100644
> index 000000000000..87a1588d7619
> --- /dev/null
> +++ b/Documentation/leds/leds-class-multicolor.rst
> @@ -0,0 +1,96 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Multi Color LED handling under Linux
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Description
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +The multi color class groups monochrome LEDs and allows controlling two
> +aspects of the final combined color: hue and lightness. The former is
> +controlled via <color>_intensity files and the latter is controlled
> +via brightness file.
> +
> +For more details on hue and lightness notions please refer to
> +https://en.wikipedia.org/wiki/CIECAM02.
> +
> +Note that intensity files only cache the written value and the actual
> +change of hardware state occurs upon writing brightness file. This
> +allows for changing many factors of the perceived color in a virtually
> +unnoticeable way for the human observer.

So unlike previous versions, userspace will need to write 4 files
instead of one in the common case.

> +Directory Layout Example
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +root:/sys/class/leds/rgb:grouped_leds# ls -lR colors/
> +-rw-rwxr-- 1 root root 4096 Jul 7 03:10 red_max_intensity
> +--w--wx-w- 1 root root 4096 Jul 7 03:10 red_intensity
> +-rw-rwxr-- 1 root root 4096 Jul 7 03:10 green_max_intensity
> +--w--wx-w- 1 root root 4096 Jul 7 03:10 green_intensity
> +-rw-rwxr-- 1 root root 4096 Jul 7 03:10 blue_max_intensity
> +--w--wx-w- 1 root root 4096 Jul 7 03:10 blue_intensity

Permissions are way off here.

> +A user first writes the color LED brightness file with the brightness le=
vel that
> +is necessary to achieve a blueish violet output from the RGB LED group.
> +
> +echo 138 > /sys/class/leds/rgb:grouped_leds/red_intensity
> +echo 43 > /sys/class/leds/rgb:grouped_leds/green_intensity
> +echo 226 > /sys/class/leds/rgb:grouped_leds/blue_intensity

No, you can't tell what kind of color this will result in.

Will you be on ELCE/OSS in Lyon?

Best regards,
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--FL5UXtIhxfXey3p5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl2MnLMACgkQMOfwapXb+vILagCeOf78G3cZfahKAYIBij0zbt7n
2pwAoLQrjSBz+1Qdgi/kjANengzMfcM2
=mTZW
-----END PGP SIGNATURE-----

--FL5UXtIhxfXey3p5--
