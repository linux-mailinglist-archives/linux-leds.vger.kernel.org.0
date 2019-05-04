Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C100613B20
	for <lists+linux-leds@lfdr.de>; Sat,  4 May 2019 18:12:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726230AbfEDQMk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 4 May 2019 12:12:40 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:39152 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726217AbfEDQMk (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 4 May 2019 12:12:40 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 6477B80313; Sat,  4 May 2019 18:12:28 +0200 (CEST)
Date:   Sat, 4 May 2019 18:12:37 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     list@c-mauderer.de
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Christian Mauderer <oss@c-mauderer.de>
Subject: Re: [PATCH 1/2] dt-bindings: leds: Add binding for ubnt-spi LED.
Message-ID: <20190504161237.GA24060@amd>
References: <20190504122825.11883-1-list@c-mauderer.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="J/dobhs11T7y2rNN"
Content-Disposition: inline
In-Reply-To: <20190504122825.11883-1-list@c-mauderer.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--J/dobhs11T7y2rNN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat 2019-05-04 14:28:24, list@c-mauderer.de wrote:
> From: Christian Mauderer <oss@c-mauderer.de>
>=20
> This patch adds the binding documentation for the LED controller found
> in Ubiquity airCube ISP devices.
>=20
> Signed-off-by: Christian Mauderer <oss@c-mauderer.de>
> ---
>=20
> I tested the patches with a 4.14 and a 4.19 kernel on the current OpenWRT.
> Although I didn't get the kernel running due to file system problems they=
 build
> fine with a 5.1-rc7.
>=20
> I shortly described the protocol of the controller in a comment in the dr=
iver
> file in the second patch.
>=20
> Checkpatch gives the following warning for both patches:
>=20
>   WARNING: added, moved or deleted file(s), does MAINTAINERS need
> updating?

Ignore that :-).

> diff --git a/Documentation/devicetree/bindings/leds/leds-ubnt-spi.txt b/D=
ocumentation/devicetree/bindings/leds/leds-ubnt-spi.txt
> new file mode 100644
> index 000000000000..ab1478cdc139
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-ubnt-spi.txt
> @@ -0,0 +1,49 @@
> +Binding for the controller based LED found in Ubiquity airCube ISP and m=
ost
> +likely some other Ubiquity devices.

It would be good to know what chip it is.. and name the binding
accordingly.

Alternatively, call its led-spi-byte, or something, as it is really
trivial protocol. Maybe other chips will have same interface?

> +Example for the airCube ISP (with SPI controller matching that device):
> +
> +led_spi {
> +	compatible =3D "spi-gpio";
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +
> +	gpio-sck =3D <&gpio 3 GPIO_ACTIVE_HIGH>;
> +	gpio-mosi =3D <&gpio 2 GPIO_ACTIVE_HIGH>;
> +	cs-gpios =3D <&gpio 1 GPIO_ACTIVE_HIGH>;
> +	num-chipselects =3D <1>;
> +
> +	led_ubnt@0 {
> +		compatible =3D "ubnt,spi-led";
> +		reg =3D <0>;
> +		spi-max-frequency =3D <100000>;
> +
> +		led {
> +			label =3D "system";
> +			/* keep the LED slightly on to show powered device */
> +			ubnt-spi,off_bright =3D /bits/ 8 <4>;
> +		};
> +	};
> +};

Otherwise looks good to me,

Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--J/dobhs11T7y2rNN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzNufUACgkQMOfwapXb+vIO8QCdETjkj7yT1KkKezOd83CRZ96K
DMkAoLrHGuBriWED+hd3nfBTrFNU/L5B
=7/sq
-----END PGP SIGNATURE-----

--J/dobhs11T7y2rNN--
