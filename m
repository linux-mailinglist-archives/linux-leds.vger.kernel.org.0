Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9999137124
	for <lists+linux-leds@lfdr.de>; Thu,  6 Jun 2019 12:01:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727846AbfFFKBk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 6 Jun 2019 06:01:40 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:45752 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726972AbfFFKBj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 6 Jun 2019 06:01:39 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 4A078803EE; Thu,  6 Jun 2019 12:01:27 +0200 (CEST)
Date:   Thu, 6 Jun 2019 12:01:37 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, broonie@kernel.org,
        lgirdwood@gmail.com, lee.jones@linaro.org,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 4/5] dt-bindings: leds: Add LED bindings for the
 LM36274
Message-ID: <20190606100136.GF975@amd>
References: <20190605125634.7042-1-dmurphy@ti.com>
 <20190605125634.7042-5-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="JcvBIhDvR6w3jUPA"
Content-Disposition: inline
In-Reply-To: <20190605125634.7042-5-dmurphy@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--JcvBIhDvR6w3jUPA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

>  .../devicetree/bindings/leds/leds-lm36274.txt | 82 +++++++++++++++++++
>  1 file changed, 82 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-lm36274.t=
xt
>=20
> diff --git a/Documentation/devicetree/bindings/leds/leds-lm36274.txt b/Do=
cumentation/devicetree/bindings/leds/leds-lm36274.txt
> new file mode 100644
> index 000000000000..329393700191
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-lm36274.txt
> @@ -0,0 +1,82 @@
> +* Texas Instruments LM36274 4-Channel LCD Backlight Driver w/Integrated =
Bias
> +
> +The LM36274 is an integrated four-channel WLED driver and LCD bias suppl=
y.
> +The backlight boost provides the power to bias four parallel LED strings=
 with
> +up to 29V total output voltage. The 11-bit LED current is programmable v=
ia
> +the I2C bus and/or controlled via a logic level PWM input from 60 =CE=BC=
A to 30 mA.
> +
> +Parent device properties are documented in ../mfd/ti_lmu.txt
> +Regulator properties are documented in ../regulator/lm363x-regulator.txt

Should these paths follow the same format as below
(Documentation/devicetree/bindings)

?

Otherwise looks good.

Acked-by: Pavel Machek <pavel@ucw.cz>
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--JcvBIhDvR6w3jUPA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlz45IAACgkQMOfwapXb+vIJUwCeLojs/AGqWQF2DQiuVlw1Xz1P
GqYAni4oAYbSvZ9Ki4SlbbOWLhRVDGHT
=q2SH
-----END PGP SIGNATURE-----

--JcvBIhDvR6w3jUPA--
