Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A47627D0A
	for <lists+linux-leds@lfdr.de>; Thu, 23 May 2019 14:43:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729863AbfEWMn4 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 May 2019 08:43:56 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:59424 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729361AbfEWMn4 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 May 2019 08:43:56 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 816968037F; Thu, 23 May 2019 14:43:44 +0200 (CEST)
Date:   Thu, 23 May 2019 14:43:54 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, broonie@kernel.org,
        lgirdwood@gmail.com, lee.jones@linaro.org,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: Re: [RESEND PATCH v4 5/6] dt-bindings: leds: Add LED bindings for
 the LM36274
Message-ID: <20190523124354.GA20354@amd>
References: <20190522192733.13422-1-dmurphy@ti.com>
 <20190522192733.13422-6-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="envbJBWh7q8WU6mo"
Content-Disposition: inline
In-Reply-To: <20190522192733.13422-6-dmurphy@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--envbJBWh7q8WU6mo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2019-05-22 14:27:32, Dan Murphy wrote:
> Add the LM36274 LED specific bindings.
>=20
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
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
> +the I2C bus and/or controlled via a logic level PWM input from 60 ??A to=
 30 mA.

??A -> uA.

Otherwise:

Acked-by: Pavel Machek <pavel@ucw.cz>
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--envbJBWh7q8WU6mo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzmlYoACgkQMOfwapXb+vKqwQCguE1tYsJKSdrCZlp4APCde3/D
J+AAnRSO8dODevspq37ZGOhKif55TPKL
=vVX+
-----END PGP SIGNATURE-----

--envbJBWh7q8WU6mo--
