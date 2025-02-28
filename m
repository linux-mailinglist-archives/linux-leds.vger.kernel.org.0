Return-Path: <linux-leds+bounces-4131-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9148A4A162
	for <lists+linux-leds@lfdr.de>; Fri, 28 Feb 2025 19:24:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C920B173D89
	for <lists+linux-leds@lfdr.de>; Fri, 28 Feb 2025 18:24:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1052527604C;
	Fri, 28 Feb 2025 18:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R7eV4+FK"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D2B276046;
	Fri, 28 Feb 2025 18:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740767075; cv=none; b=GeZ9a67Y6t4VYrzEUSEljgD22rCwCTRTVk+OLcqX294Q2FH42opBR/YtGBNz6v2J2nMyrHnrW5e6rkAKaSuoHa1JimCra+dQsnuRre8F6Nf8IBp/NYc0ZB2jFUhlPU0fo1qT7vRh6SLE+rQbiZLWElc4xek+X29vGAywnHpDt5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740767075; c=relaxed/simple;
	bh=hFss+V64FKtbHUiLgnvmpNjzRUCCQs/2WuN6Q/rdJEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GI6WVQtoleeJOk5CZo/xlznRjPplz/b3gZYWKuDQB1bZwlm2HLkR/mMx/97K4Y/Q/NfFSkYoJNNmdT+7dyyX95H0I7Hytzu6JH3xjexqdAGK5x7dF67gc/1MYO/2eFUnfIGTwS84s1YhkzgPPwRKIOAuL7PDJhJomvoU2r9Hi78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R7eV4+FK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51D1EC4CEE2;
	Fri, 28 Feb 2025 18:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740767074;
	bh=hFss+V64FKtbHUiLgnvmpNjzRUCCQs/2WuN6Q/rdJEs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R7eV4+FKgbQlKK3BuaqhU2mEmGNYyMQfgn476SJd1/pZLHAF9wNpCgWSYypBotMrq
	 SFTb6EJdvs3Vg1Zxl8ipIPnSuwh8sa0UF5pbasXl9L1OKV2aVtR6mBMk5y0RqnuYAF
	 WzWiJ39gnvXww2DVbcxgBM32kVx5/5LmKo3+QbIZwEEmc2athx3AFX9QAlufp4WRRp
	 OYBNRhqAu7vGxUb2+JkjP4JcieD8heVBeHizePdaFKgvm892ctkSq+Xsgz/46oc2Fz
	 zMOSDcPktTbvZCZvkKbqYKyndZJhCxfUL2CgF+DkeDVW03bPDn0DrGVAuJ5xFLQik+
	 EDs6/6PlJH77g==
Date: Fri, 28 Feb 2025 18:24:30 +0000
From: Conor Dooley <conor@kernel.org>
To: Matthias Fend <matthias.fend@emfend.at>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	bsp-development.geo@leica-geosystems.com
Subject: Re: [PATCH 1/2] dt-bindings: leds: add Texas Instruments TPS6131x
 flash LED driver
Message-ID: <20250228-zipfile-net-69e4bbebd8d6@spud>
References: <20250228-leds-tps6131x-v1-0-d1071d90f9ea@emfend.at>
 <20250228-leds-tps6131x-v1-1-d1071d90f9ea@emfend.at>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LTXo1e2XtcxG1y4X"
Content-Disposition: inline
In-Reply-To: <20250228-leds-tps6131x-v1-1-d1071d90f9ea@emfend.at>


--LTXo1e2XtcxG1y4X
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2025 at 11:31:23AM +0100, Matthias Fend wrote:
> Document Texas Instruments TPS61310/TPS61311 flash LED driver devicetree
> bindings.
>=20
> Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
> ---
>  .../devicetree/bindings/leds/ti,tps6131x.yaml      | 123 +++++++++++++++=
++++++
>  1 file changed, 123 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/leds/ti,tps6131x.yaml b/Do=
cumentation/devicetree/bindings/leds/ti,tps6131x.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..c08b3cef7abcec07237d32714=
56ff1f888b2b809
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/ti,tps6131x.yaml

With a filename matching one of the compatibles in the file,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> @@ -0,0 +1,123 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/ti,tps6131x.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments TPS6131X flash LED driver
> +
> +maintainers:
> +  - Matthias Fend <matthias.fend@emfend.at>
> +
> +description: |
> +  The TPS61310/TPS61311 is a flash LED driver with I2C interface.
> +  Its power stage is capable of supplying a maximum total current of rou=
ghly 1500mA.
> +  The TPS6131x provides three constant-current sinks, capable of sinking
> +  up to 2 =D7 400mA (LED1 and LED3) and 800mA (LED2) in flash mode.
> +  In torch mode, each sink (LED1, LED2, LED3) supports currents up to 17=
5mA.
> +
> +  The data sheet can be found at:
> +    https://www.ti.com/lit/ds/symlink/tps61310.pdf
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,tps61310
> +      - ti,tps61311
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: GPIO connected to NRESET pin
> +
> +  ti,valley-current-limit:
> +    type: boolean
> +    description:
> +      Reduce the valley peak current limit from 1750mA to 1250mA (TPS613=
10) or
> +      from 2480mA to 1800mA (TPS61311).
> +
> +  led:
> +    type: object
> +    $ref: common.yaml#
> +    unevaluatedProperties: false
> +
> +    properties:
> +      led-sources:
> +        allOf:
> +          - minItems: 1
> +            maxItems: 3
> +            items:
> +              enum: [1, 2, 3]
> +
> +      led-max-microamp:
> +        anyOf:
> +          - minimum: 25000
> +            maximum: 350000
> +            multipleOf: 50000
> +          - minimum: 25000
> +            maximum: 525000
> +            multipleOf: 25000
> +
> +      flash-max-microamp:
> +        anyOf:
> +          - minimum: 25000
> +            maximum: 800000
> +            multipleOf: 50000
> +          - minimum: 25000
> +            maximum: 1500000
> +            multipleOf: 25000
> +
> +      flash-max-timeout-us:
> +        enum: [ 5300, 10700, 16000, 21300, 26600, 32000, 37300, 68200, 7=
1500,
> +                102200, 136300, 170400, 204500, 340800, 579300, 852000 ]
> +
> +    required:
> +      - led-sources
> +      - led-max-microamp
> +      - flash-max-microamp
> +      - flash-max-timeout-us
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#address-cells'
> +  - '#size-cells'
> +  - led
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/leds/common.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +      #address-cells =3D <1>;
> +      #size-cells =3D <0>;
> +
> +      led-controller@33 {
> +        compatible =3D "ti,tps61310";
> +        reg =3D <0x33>;
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        reset-gpios =3D <&gpio1 0 GPIO_ACTIVE_LOW>;
> +
> +        tps61310_flash: led {
> +          function =3D LED_FUNCTION_FLASH;
> +          color =3D <LED_COLOR_ID_WHITE>;
> +          led-sources =3D <1>, <2>, <3>;
> +          led-max-microamp =3D <525000>;
> +          flash-max-microamp =3D <1500000>;
> +          flash-max-timeout-us =3D <852000>;
> +        };
> +      };
> +    };
>=20
> --=20
> 2.34.1
>=20

--LTXo1e2XtcxG1y4X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ8H/XgAKCRB4tDGHoIJi
0jUeAP0a+qzuVsXmjlgmLl6z3Gyxonrx4RKhuAi9VtBd5aNZawD/Zgjrck1Y1OLR
DjlVas5c3ZcarodzgxNWgZ/3Djf+sgg=
=bVW4
-----END PGP SIGNATURE-----

--LTXo1e2XtcxG1y4X--

