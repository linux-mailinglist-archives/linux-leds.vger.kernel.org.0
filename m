Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A308C9D07
	for <lists+linux-leds@lfdr.de>; Thu,  3 Oct 2019 13:17:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729870AbfJCLRR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 3 Oct 2019 07:17:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:53772 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729241AbfJCLRR (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 3 Oct 2019 07:17:17 -0400
Received: from earth.universe (dyndsl-037-138-174-173.ewe-ip-backbone.de [37.138.174.173])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D48992133F;
        Thu,  3 Oct 2019 11:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570101436;
        bh=II5B/sbWqqiAcZ3eAEeX7O3XDip0LCoLkQ4L9GRTQ2M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VpJ5/IipiXKNzI8lzhlon8MhIlvdAt34WVQ+nhC8kv4TZaZQM+IehGjALlJ+orVm6
         X/EEqiWnlkguK/AD4MTEkh3xImJjycY57g0QrBMESoAptsETJ6OIPZlSclljKfA31K
         TJaYLCHam+49GN/TWu4ryWPfKpVlhHTgeLu32MvE=
Received: by earth.universe (Postfix, from userid 1000)
        id 627E53C0CA1; Thu,  3 Oct 2019 13:17:13 +0200 (CEST)
Date:   Thu, 3 Oct 2019 13:17:13 +0200
From:   Sebastian Reichel <sre@kernel.org>
To:     Jean-Jacques Hiblot <jjhiblot@ti.com>
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        mark.rutland@arm.com, lee.jones@linaro.org,
        daniel.thompson@linaro.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, tomi.valkeinen@ti.com,
        dmurphy@ti.com, linux-leds@vger.kernel.org
Subject: Re: [PATCH v8 4/5] dt-bindings: backlight: Add led-backlight binding
Message-ID: <20191003111713.ooc4n3isz47wnn4v@earth.universe>
References: <20191003082812.28491-1-jjhiblot@ti.com>
 <20191003082812.28491-5-jjhiblot@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ujrlezysj74uzozf"
Content-Disposition: inline
In-Reply-To: <20191003082812.28491-5-jjhiblot@ti.com>
User-Agent: NeoMutt/20180716
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--ujrlezysj74uzozf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Oct 03, 2019 at 10:28:11AM +0200, Jean-Jacques Hiblot wrote:
> Add DT binding for led-backlight.
>=20
> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

> ---
>  .../bindings/leds/backlight/led-backlight.txt | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/led-=
backlight.txt
>=20
> diff --git a/Documentation/devicetree/bindings/leds/backlight/led-backlig=
ht.txt b/Documentation/devicetree/bindings/leds/backlight/led-backlight.txt
> new file mode 100644
> index 000000000000..4c7dfbe7f67a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/led-backlight.txt
> @@ -0,0 +1,28 @@
> +led-backlight bindings
> +
> +This binding is used to describe a basic backlight device made of LEDs.
> +It can also be used to describe a backlight device controlled by the out=
put of
> +a LED driver.
> +
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
> +                       into a LED brightness level. If it is not provide=
d, the
> +                       identity mapping is used.
> +
> +  - default-brightness-level: The default brightness level.
> +
> +Example:
> +
> +	backlight {
> +		compatible =3D "led-backlight";
> +
> +		leds =3D <&led1>, <&led2>;
> +		brightness-levels =3D <0 4 8 16 32 64 128 255>;
> +		default-brightness-level =3D <6>;
> +	};
> --=20
> 2.17.1
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--ujrlezysj74uzozf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl2V2KoACgkQ2O7X88g7
+prCPg//Y+6iSy63FAPebAskUElu3y0Mfdiy76jSPcbO9/0s55cmBxyzra2So8Cu
q9wfbVm0swD+BZz/XTnKdYWzNUt4WORzSAM4liazcED+GYFN52dYFe9CRv1HMMYn
q5mYggZgMquemXXS9xsXhAu9mVKLZqfqfhbQyaWxsUnnkVob1NaIL466CxY4w67Z
aWDfXjcykV6VxszFA8fJbUeitO94ajYf2v641mCAbsZb9gpk92QbnncqvCxb2R+c
xfVHwS9UPDhzKUYAPwLH38VdCU3TLsvkC8F4ZEPEB6jyQ+BMFZgXRxYtkiBzKrbV
WmCepLcxr6jScH95iUBbkctDzFNtkg3kqEt/uUEuitws+nwuYYndeAs+RhYdYtzd
CPI/lOZyeqb9faA0A5UJXMewt+4ZW6DnYZN3gaSAgk+3R48oluC/7ZD4PgYOe0Yd
nIj25DS/WJuUYxtSeE9f3WZE4rgngBhtPRFlXr1HxCf2m/MFh8sxI9dVPIUj2GJn
xuiE/osyU3W+oF9+KP1rwJ/9byZh57qqgrNglqi6S3qHKrLgHDFOGhAtmJpQjKV3
ro/uuZsIxZvr1hKE5FFIFB70EmbhJImJMkhqT95cPOBBQOOvX5oZjN6WeNp6y8sa
KWZcp3HmeJCUYbFrKkJRG+4L/rkL/EI16rV87xkViyAPRMuwvkM=
=WVML
-----END PGP SIGNATURE-----

--ujrlezysj74uzozf--
