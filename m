Return-Path: <linux-leds+bounces-2496-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 636D995A12A
	for <lists+linux-leds@lfdr.de>; Wed, 21 Aug 2024 17:15:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 206592816E6
	for <lists+linux-leds@lfdr.de>; Wed, 21 Aug 2024 15:15:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1FB4136344;
	Wed, 21 Aug 2024 15:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bXSlTZpz"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4311C687;
	Wed, 21 Aug 2024 15:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724253339; cv=none; b=Z+RczSoDBdNVHH0HwK90RczuqVFJi+fKCZLat78msGdj1bJkFwTdZanaS9nqBkg4KEYgbT29SKr9CPp1zLLYPBkbTmMPY2ommhVqI4IS/d90ODOUplIAGxoNT3krTcKfA8cRCuhZha6aG2V9ellG+1lfChSJ+CBmnY0flozk6qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724253339; c=relaxed/simple;
	bh=FJYPsdYawKYl01qsiVlAOjDtCqHpfz4B9K70zZhnR24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=avKwmNsqKD5yn1DVqqIepymhXnwC0i4gmUkbfKEQLdimx4+ttKFPUa+N9PjJ2kOjLcYi+2/EKcnqdtJpU6Iia2+IY7lpDESSfiq7jshb1DeJI9GAtk0mt7agn287cojN0DmPmoP+tR4Lqu7AG3eVtdcJSmzlZqpfPH3s6pmOuJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bXSlTZpz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04B64C32781;
	Wed, 21 Aug 2024 15:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724253339;
	bh=FJYPsdYawKYl01qsiVlAOjDtCqHpfz4B9K70zZhnR24=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bXSlTZpzz5AWfUGjWVY0A7g2zIrMyzt9QIQa8BxSjCFpZdsqdTuPruzkOjGkrB2t7
	 KdCpUPxuXAS+6kVebsMO4UJnDV/KlATthmpvFotU2e1Os4GMkCNVoTOZDaub+AkRNe
	 GVQw4g4+fKuaepB1uBIK2f7j79ejCt/GUd0K/LOuAws+e1N8d0M+jEIgIyN0PGS7r1
	 /ARW0VdScYaA5XS1fsUb0wmkwu5b73WL8WCrFsjcI/9gCZnzi91UIw781Tl/ZvsuXy
	 Yx5y0VO/pfvjaYjRxNdKYVevxQGSpUlSF0mZV5IQ7dPE1gPtlOZ8QhH5Dv4I9JoY24
	 HwKgyBmbQaTIA==
Date: Wed, 21 Aug 2024 16:15:34 +0100
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Dan Murphy <dmurphy@ti.com>,
	"open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/1] dt-bindings: leds: convert leds-lm3692x to yaml
 format
Message-ID: <20240821-sizable-jumbo-1a114a8cc53a@spud>
References: <20240820183544.496419-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wepu50H+RhG8Sfqs"
Content-Disposition: inline
In-Reply-To: <20240820183544.496419-1-Frank.Li@nxp.com>


--wepu50H+RhG8Sfqs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 20, 2024 at 02:35:43PM -0400, Frank Li wrote:
> Convert binding doc leds-lm3592x to yaml format.
> Additional change
> - Add ref to common.yaml for child node
> - Add i2c node at example
>=20
> Fix below warning:
> arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dtb: /soc@0/bus@30800000/=
i2c@30a40000/backlight@36:
> 	failed to match any schema with compatible: ['ti,lm36922']
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> diff --git a/Documentation/devicetree/bindings/leds/ti.lm36922.yaml b/Doc=
umentation/devicetree/bindings/leds/ti.lm36922.yaml
> new file mode 100644
> index 0000000000000..ac98547b78bd2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/ti.lm36922.yaml
> @@ -0,0 +1,100 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/ti.lm36922.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments - LM3692x Highly Efficient White LED Driver
> +
> +maintainers:
> +  - Dan Murphy <dmurphy@ti.com>
> +
> +description: |
> +  The LM3692x is an ultra-compact, highly efficient,
> +  white-LED driver designed for LCD display backlighting.
> +
> +  The main difference between the LM36922 and LM36923 is the number of
> +  LED strings it supports. The LM36922 supports two strings while the LM=
36923
> +  supports three strings.
> +
> +  For more product information please see the link below:
> +  https://www.ti.com/lit/ds/snvsa29/snvsa29.pdf
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,lm36922
> +      - ti,lm36923
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +  enable-gpios:
> +    description: gpio pin to enable/disable the device.

I think the description could be replaced with just marking the property
as "true", both here and for the supply. The descriptions are statements
of the obvious.

> +
> +  vled-supply:
> +    description: LED supply
> +
> +  ti,ovp-microvolt:
> +    description: Overvoltage protection.
> +    default: 29000000
> +    enum: [17000000, 21000000, 25000000, 29000000]
> +
> +patternProperties:
> +  '^led@[0-9a-f]+$':

There's no need for such a permissive pattern here, since reg is limited
to the range 0-3. Additionally, I would add an
allOf:
  - if:
      properties:
        compatible:
          contains:
            const: ti,lm36922
    then:
      properties:
        led@3: false

or similar to restrict the third entry instead of doing so in prose.

Thanks,
Conor.

> +    type: object
> +    $ref: common.yaml
> +    properties:
> +      reg:
> +        enum: [0, 1, 2, 3]
> +        description: |
> +          0 - Will enable all LED sync paths
> +          1 - Will enable the LED1 sync
> +          2 - Will enable the LED2 sync
> +          3 - Will enable the LED3 sync (LM36923 only)
> +
> +    unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/leds/common.h>
> +
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        led-controller@36 {
> +            compatible =3D "ti,lm36922";
> +            reg =3D <0x36>;
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
> +
> +            enable-gpios =3D <&gpio1 28 GPIO_ACTIVE_HIGH>;
> +            vled-supply =3D <&vbatt>;
> +            ti,ovp-microvolt =3D <29000000>;
> +
> +            led@0 {
> +                reg =3D <0>;
> +                function =3D LED_FUNCTION_BACKLIGHT;
> +                color =3D <LED_COLOR_ID_WHITE>;
> +                linux,default-trigger =3D "backlight";
> +                led-max-microamp =3D <20000>;
> +            };
> +        };
> +    };
> +
> --=20
> 2.34.1
>=20

--wepu50H+RhG8Sfqs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZsYElgAKCRB4tDGHoIJi
0pVnAQCBzlnN6Oj9cpu1Vc1Z155wOMcAInD7qD/43g5LVo5cSQD/bTnklp11Wul3
m+HsdG0lL/WiFsELtKYBuyql4FUuhAs=
=p8pu
-----END PGP SIGNATURE-----

--wepu50H+RhG8Sfqs--

