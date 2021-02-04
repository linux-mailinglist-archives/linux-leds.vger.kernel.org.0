Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3FF830F575
	for <lists+linux-leds@lfdr.de>; Thu,  4 Feb 2021 15:56:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236924AbhBDOyH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 4 Feb 2021 09:54:07 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:44224 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236910AbhBDOwp (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 4 Feb 2021 09:52:45 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 046081C0B77; Thu,  4 Feb 2021 15:52:02 +0100 (CET)
Date:   Thu, 4 Feb 2021 15:52:01 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Sven Schuchmann <schuchmann@schleissheimer.de>
Cc:     Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] leds: lp50xx: add setting of default intensity
 from DT
Message-ID: <20210204145201.GB14305@duo.ucw.cz>
References: <20210204143726.27977-1-schuchmann@schleissheimer.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="i9LlY+UWpKt15+FH"
Content-Disposition: inline
In-Reply-To: <20210204143726.27977-1-schuchmann@schleissheimer.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--i9LlY+UWpKt15+FH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> In order to use a multicolor-led together with a trigger
> the led needs to have an intensity set to see something.
> The trigger changes the brightness of the led but if there
> is no intensity we actually see nothing.
>=20
> This patch adds the ability to set the default intensity
> of each multi-led node so that it is turned on from DT.
> If no intensity is given the led will be initialized
> with full intensity.
>=20
> Part 1 updates the documentation.
> Part 2 removes an unused variable.
> Part 3 sets the initial intensity to full.
> Part 4 reads the default intensity from DT
>=20

> diff --git a/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml b/Do=
cumentation/devicetree/bindings/leds/leds-lp50xx.yaml
> index c192b5feadc7..2bc25b2fc94d 100644
> --- a/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
> +++ b/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
> @@ -65,6 +65,11 @@ patternProperties:
>            This property denotes the LED module number(s) that is used on=
 the
>            for the child node.  The LED modules can either be used stand =
alone
>            or grouped into a module bank.
> +      default-intensity:
> +        minItems: 1
> +        maxItems: 3
> +        description:

Do we need more than three for RGBW and similar?

> +          The default intensity the multi-led gets initialised with.
> =20
>      patternProperties:
>        "(^led-[0-9a-f]$|led)":
> @@ -99,6 +104,7 @@ examples:
>                 reg =3D <0x1>;
>                 color =3D <LED_COLOR_ID_RGB>;
>                 function =3D LED_FUNCTION_CHARGING;
> +               default-intensity =3D <100 0 0>;
> =20
>                 led-0 {
>                     color =3D <LED_COLOR_ID_RED>;

Should this go to leds-class-multicolor.yaml ? Can you make example
<255 120 0> or something like that, so make it clear it is not
percent?

Best regards,
								Pavel

--=20
http://www.livejournal.com/~pavelmachek

--i9LlY+UWpKt15+FH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYBwKEQAKCRAw5/Bqldv6
8qDCAJ9wflBRRZLYVi6BEgHlTAhwQYyZVACfVYEypKKZM7iaduwzItW6tQ1Cgx0=
=fnWV
-----END PGP SIGNATURE-----

--i9LlY+UWpKt15+FH--
