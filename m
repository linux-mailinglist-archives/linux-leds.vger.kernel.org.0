Return-Path: <linux-leds+bounces-2500-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2C695A69A
	for <lists+linux-leds@lfdr.de>; Wed, 21 Aug 2024 23:30:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7D4EBB20B21
	for <lists+linux-leds@lfdr.de>; Wed, 21 Aug 2024 21:30:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDE9E178361;
	Wed, 21 Aug 2024 21:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kms0sWoH"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB11A16FF3B;
	Wed, 21 Aug 2024 21:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724275834; cv=none; b=Taa6rklcHSfr62uCGPWa526EbaFijOM9nGM9Q4UhbHD26pX8dF/0qprXwBeNUV3zWFQwTO/AQYtCmxHqr5Z562xGpU1HLjSkEpJTRvDzOR1qECEyCDex1D/EvNtFCtHfT6eKN+dXJEH0iIVh0Fp4YuFPx52aZ/cmB2yoMi8Ibuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724275834; c=relaxed/simple;
	bh=lUkRjpbqR8oHtn/IJBgQ1mJvqc51sR87H/MyJIO5T8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G/4JUjlDTAdFMNy8wunRys5AVPd3T/csUynjeCOiolvHk6dH9pU1z7N1J5PHhwFHfowWgR60uRxJk/Y9785zqNmlZmS5RLUFE1UKJFLUPul1D0oqL5DFlGWtJCcglvTcBw8NwTDWJ4AgI4wRCbuNQwymJGdEJSBp5WMkwgOnerA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kms0sWoH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17E5BC4AF0E;
	Wed, 21 Aug 2024 21:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724275834;
	bh=lUkRjpbqR8oHtn/IJBgQ1mJvqc51sR87H/MyJIO5T8s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kms0sWoHZPdLTBcsJS10PFW5gDcxmEJ1bcTGBZH2sETUWazZBKKjFYmsrhBD4Eprb
	 LkYg1VVuxUth28L7a4eTZ7RzU0zrVq2MtqImfB9JMfuF3m0VYRl/vtIXjbumho7eRZ
	 Wi1YzV8AfJBN+SnUDPXqiY7kixvTVGfCWzo/0T5hxzwWJXG4tjZcivNe+MiDpHMRFM
	 x4xxSlnjX2bth0kMupUU6iTjeII4Uvnp/k6EdgBA+aA85tMCI8E7qUkXrqkwd5uDEV
	 /9Q9tlYKcEmiG2qZvilqUpHQlbbNKB3AsaDMNA5w8uZGhBp/F0qX142V4U2+Si6I+X
	 BpuFq3ueUNYNQ==
Date: Wed, 21 Aug 2024 22:30:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Dan Murphy <dmurphy@ti.com>,
	"open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/1] dt-bindings: leds: convert leds-lm3692x to yaml
 format
Message-ID: <20240821-harmful-reflex-2a4c612519d8@spud>
References: <20240820183544.496419-1-Frank.Li@nxp.com>
 <20240821-sizable-jumbo-1a114a8cc53a@spud>
 <ZsYXvvhNxmXQAIVo@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pH+X0yQAg/LfW/1N"
Content-Disposition: inline
In-Reply-To: <ZsYXvvhNxmXQAIVo@lizhi-Precision-Tower-5810>


--pH+X0yQAg/LfW/1N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 21, 2024 at 12:37:18PM -0400, Frank Li wrote:
> On Wed, Aug 21, 2024 at 04:15:34PM +0100, Conor Dooley wrote:
> > On Tue, Aug 20, 2024 at 02:35:43PM -0400, Frank Li wrote:
> > > Convert binding doc leds-lm3592x to yaml format.
> > > Additional change
> > > - Add ref to common.yaml for child node
> > > - Add i2c node at example
> > >
> > > Fix below warning:
> > > arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dtb: /soc@0/bus@30800=
000/i2c@30a40000/backlight@36:
> > > 	failed to match any schema with compatible: ['ti,lm36922']
> > >
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > diff --git a/Documentation/devicetree/bindings/leds/ti.lm36922.yaml b=
/Documentation/devicetree/bindings/leds/ti.lm36922.yaml
> > > new file mode 100644
> > > index 0000000000000..ac98547b78bd2
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/leds/ti.lm36922.yaml
> > > @@ -0,0 +1,100 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/leds/ti.lm36922.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Texas Instruments - LM3692x Highly Efficient White LED Driver
> > > +
> > > +maintainers:
> > > +  - Dan Murphy <dmurphy@ti.com>
> > > +
> > > +description: |
> > > +  The LM3692x is an ultra-compact, highly efficient,
> > > +  white-LED driver designed for LCD display backlighting.
> > > +
> > > +  The main difference between the LM36922 and LM36923 is the number =
of
> > > +  LED strings it supports. The LM36922 supports two strings while th=
e LM36923
> > > +  supports three strings.
> > > +
> > > +  For more product information please see the link below:
> > > +  https://www.ti.com/lit/ds/snvsa29/snvsa29.pdf
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - ti,lm36922
> > > +      - ti,lm36923
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  "#address-cells":
> > > +    const: 1
> > > +
> > > +  "#size-cells":
> > > +    const: 0
> > > +
> > > +  enable-gpios:
> > > +    description: gpio pin to enable/disable the device.
> >
> > I think the description could be replaced with just marking the property
> > as "true", both here and for the supply. The descriptions are statements
> > of the obvious.
> >
> > > +
> > > +  vled-supply:
> > > +    description: LED supply
> > > +
> > > +  ti,ovp-microvolt:
> > > +    description: Overvoltage protection.
> > > +    default: 29000000
> > > +    enum: [17000000, 21000000, 25000000, 29000000]
> > > +
> > > +patternProperties:
> > > +  '^led@[0-9a-f]+$':
> >
> > There's no need for such a permissive pattern here, since reg is limited
>=20
> I am confused about it.  I think it at least need led@X pattern. Do
> you means
>    '^led@[0-3]+$'

Yeah, that is what I meant - not that the pattern should be removed.
The + I don't think you should have though, only a single digit is
possible.

>=20
> Frank
>=20
> > to the range 0-3. Additionally, I would add an
> > allOf:
> >   - if:
> >       properties:
> >         compatible:
> >           contains:
> >             const: ti,lm36922
> >     then:
> >       properties:
> >         led@3: false
> >
> > or similar to restrict the third entry instead of doing so in prose.
> >
> > Thanks,
> > Conor.
> >
> > > +    type: object
> > > +    $ref: common.yaml
> > > +    properties:
> > > +      reg:
> > > +        enum: [0, 1, 2, 3]
> > > +        description: |
> > > +          0 - Will enable all LED sync paths
> > > +          1 - Will enable the LED1 sync
> > > +          2 - Will enable the LED2 sync
> > > +          3 - Will enable the LED3 sync (LM36923 only)
> > > +
> > > +    unevaluatedProperties: false
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - "#address-cells"
> > > +  - "#size-cells"
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/gpio/gpio.h>
> > > +    #include <dt-bindings/leds/common.h>
> > > +
> > > +    i2c {
> > > +        #address-cells =3D <1>;
> > > +        #size-cells =3D <0>;
> > > +
> > > +        led-controller@36 {
> > > +            compatible =3D "ti,lm36922";
> > > +            reg =3D <0x36>;
> > > +            #address-cells =3D <1>;
> > > +            #size-cells =3D <0>;
> > > +
> > > +            enable-gpios =3D <&gpio1 28 GPIO_ACTIVE_HIGH>;
> > > +            vled-supply =3D <&vbatt>;
> > > +            ti,ovp-microvolt =3D <29000000>;
> > > +
> > > +            led@0 {
> > > +                reg =3D <0>;
> > > +                function =3D LED_FUNCTION_BACKLIGHT;
> > > +                color =3D <LED_COLOR_ID_WHITE>;
> > > +                linux,default-trigger =3D "backlight";
> > > +                led-max-microamp =3D <20000>;
> > > +            };
> > > +        };
> > > +    };
> > > +
> > > --
> > > 2.34.1
> > >
>=20
>=20

--pH+X0yQAg/LfW/1N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZsZcdQAKCRB4tDGHoIJi
0slOAQCEyosjU/qY/WEXY3QPaqrwuIst2ZpPRFa+3AY0IYMkCQD/cQAGpmf0eFtG
V0Y/QKEj2ilkf3C/yT38/co0i+Z/mgw=
=RHBa
-----END PGP SIGNATURE-----

--pH+X0yQAg/LfW/1N--

