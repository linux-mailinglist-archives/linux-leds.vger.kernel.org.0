Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D61264C99
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jul 2019 21:13:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728086AbfGJTNR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 10 Jul 2019 15:13:17 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:47276 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727612AbfGJTNR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 10 Jul 2019 15:13:17 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 81550805CD; Wed, 10 Jul 2019 21:13:03 +0200 (CEST)
Date:   Wed, 10 Jul 2019 21:13:14 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jean-Jacques Hiblot <jjhiblot@ti.com>
Cc:     jacek.anaszewski@gmail.com, robh+dt@kernel.org,
        mark.rutland@arm.com, lee.jones@linaro.org,
        daniel.thompson@linaro.org, jingoohan1@gmail.com, dmurphy@ti.com,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, tomi.valkeinen@ti.com
Subject: Re: [PATCH v3 3/4] dt-bindings: backlight: Add led-backlight binding
Message-ID: <20190710191314.GC22995@amd>
References: <20190710123932.28244-1-jjhiblot@ti.com>
 <20190710123932.28244-4-jjhiblot@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ABTtc+pdwF7KHXCz"
Content-Disposition: inline
In-Reply-To: <20190710123932.28244-4-jjhiblot@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--ABTtc+pdwF7KHXCz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2019-07-10 14:39:31, Jean-Jacques Hiblot wrote:
> Add DT binding for led-backlight.
>=20
> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
> ---
>  .../bindings/leds/backlight/led-backlight.txt | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/led-=
backlight.txt
>=20
> diff --git a/Documentation/devicetree/bindings/leds/backlight/led-backlig=
ht.txt b/Documentation/devicetree/bindings/leds/backlight/led-backlight.txt
> new file mode 100644
> index 000000000000..0444eec8efe1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/led-backlight.txt
> @@ -0,0 +1,28 @@
> +led-backlight bindings
> +
> +This binding is used to describe a basic backlight device made of
> LEDs.

Ok.

> +It can also be used to describe a backlight device controlled by the out=
put of
> +a LED driver.

? The LED driver should better be driving some LEDs...

> +Required properties:
> +  - compatible: "led-backlight"
> +  - leds: a list of LEDs
> +
> +Optional properties:
> +  - brightness-levels: Array of distinct brightness levels. The levels m=
ust be
> +                       in the range accepted by the underlying LED devic=
es.
> +                       This is used to translate a backlight brightness =
level
> +                       into a LED brightness level. if not provided, the
> +                       identity mapping is used.

"If it is not"
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--ABTtc+pdwF7KHXCz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl0mOMkACgkQMOfwapXb+vLScQCfaBoq0kMp1lvV8fNKwcWoHrBM
pnIAn3yAtCE4fHZ7pIAA9TiO8ghJ1kHM
=sILE
-----END PGP SIGNATURE-----

--ABTtc+pdwF7KHXCz--
