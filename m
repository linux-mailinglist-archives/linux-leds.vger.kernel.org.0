Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60B522145F4
	for <lists+linux-leds@lfdr.de>; Sat,  4 Jul 2020 14:48:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbgGDMsq (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 4 Jul 2020 08:48:46 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:47434 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726766AbgGDMsq (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 4 Jul 2020 08:48:46 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id EAE5E1C0BD2; Sat,  4 Jul 2020 14:48:43 +0200 (CEST)
Date:   Sat, 4 Jul 2020 14:48:43 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, robh@kernel.org,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v29 01/16] dt: bindings: Add multicolor class dt bindings
 documention
Message-ID: <20200704124842.GB20088@amd>
References: <20200622185919.2131-1-dmurphy@ti.com>
 <20200622185919.2131-2-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="NDin8bjvE/0mNLFQ"
Content-Disposition: inline
In-Reply-To: <20200622185919.2131-2-dmurphy@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--NDin8bjvE/0mNLFQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Add DT bindings for the LEDs multicolor class framework.
> Add multicolor ID to the color ID list for device tree bindings.

Rob, can we get some reviews here? It would be good to move this
forward.

Best regards,
								Pavel

> CC: Rob Herring <robh@kernel.org>
> Acked-by: Pavel Machek <pavel@ucw.cz>
> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  .../bindings/leds/leds-class-multicolor.yaml  | 37 +++++++++++++++++++
>  include/dt-bindings/leds/common.h             |  3 +-
>  2 files changed, 39 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-class-mul=
ticolor.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/leds/leds-class-multicolor=
=2Eyaml b/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
> new file mode 100644
> index 000000000000..b55e1f1308a4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
> @@ -0,0 +1,37 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/leds-class-multicolor.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Common properties for the multicolor LED class.
> +
> +maintainers:
> +  - Dan Murphy <dmurphy@ti.com>
> +
> +description: |
> +  Bindings for multi color LEDs show how to describe current outputs of
> +  either integrated multi-color LED elements (like RGB, RGBW, RGBWA-UV
> +  etc.) or standalone LEDs, to achieve logically grouped multi-color LED
> +  modules. This is achieved by adding multi-led nodes layer to the
> +  monochrome LED bindings.
> +  The nodes and properties defined in this document are unique to the mu=
lticolor
> +  LED class.  Common LED nodes and properties are inherited from the com=
mon.txt
> +  within this documentation directory.
> +
> +patternProperties:
> +  "^multi-led@([0-9a-f])$":
> +    type: object
> +    description: Represents the LEDs that are to be grouped.
> +    properties:
> +      color:
> +        const: 8  # LED_COLOR_ID_MULTI
> +        description: |
> +          For multicolor LED support this property should be defined as
> +          LED_COLOR_ID_MULTI which can be found in include/linux/leds/co=
mmon.h.
> +
> +    $ref: "common.yaml#"
> +
> +    required:
> +      - color
> +...
> diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds=
/common.h
> index 0ce7dfc00dcb..a463ce6a8794 100644
> --- a/include/dt-bindings/leds/common.h
> +++ b/include/dt-bindings/leds/common.h
> @@ -30,7 +30,8 @@
>  #define LED_COLOR_ID_VIOLET	5
>  #define LED_COLOR_ID_YELLOW	6
>  #define LED_COLOR_ID_IR		7
> -#define LED_COLOR_ID_MAX	8
> +#define LED_COLOR_ID_MULTI	8
> +#define LED_COLOR_ID_MAX	9
> =20
>  /* Standard LED functions */
>  /* Keyboard LEDs, usually it would be input4::capslock etc. */
> --

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--NDin8bjvE/0mNLFQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl8AeqoACgkQMOfwapXb+vK5jgCeKLRaC8lShMPTAygJnOeEpl+n
L/AAn0pr1+fswWvwkRPIDrk4dKKDdGg+
=sCmq
-----END PGP SIGNATURE-----

--NDin8bjvE/0mNLFQ--
