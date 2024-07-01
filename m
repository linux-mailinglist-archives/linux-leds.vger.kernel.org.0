Return-Path: <linux-leds+bounces-2175-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8AB91E36D
	for <lists+linux-leds@lfdr.de>; Mon,  1 Jul 2024 17:10:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1556B281320
	for <lists+linux-leds@lfdr.de>; Mon,  1 Jul 2024 15:10:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AC5216C6B7;
	Mon,  1 Jul 2024 15:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rnNRA/vU"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B56084DE9;
	Mon,  1 Jul 2024 15:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719846625; cv=none; b=Et2gwmZk4+ELeaZWM7lzm7STRhHIgA8O6o+UkXMqRSxGL84jk+5nKIdsimPDHSqs4mG1sA/6mMqHapu5qhQDJTssTglfUgOPtikGqJXKWXjESIZxVbApsNJYIksMuKivRGGKmkihZLrM/oNvfYddc2f9a4g7+w5qaC5osPFufG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719846625; c=relaxed/simple;
	bh=uMGStMbzxwlJZO4KySBthDgc/kAaIkSsDWQ43zyVXvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HflY6+pbT1MArJriAYejqK2bIWVDudUvO9KL/1vWGyhJFFynCpAhxZxaQo2nTZfQrJc7syQHoN54y9kpCbWjOtu/fhJovqqNRv25QDtcaSiIjH7JHseoamZOcAbxvCWwQudacdbdYxT2OIc/nwyfzsN/jvZzNmm+ABQOGrdy7tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rnNRA/vU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF78CC116B1;
	Mon,  1 Jul 2024 15:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719846624;
	bh=uMGStMbzxwlJZO4KySBthDgc/kAaIkSsDWQ43zyVXvE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rnNRA/vUezZDc2dvDCS12djRt+Ufgy/hN/TPbWGKXbefQciN2pya4YPpjH/nR74H3
	 xrMNiCk009GXNlACvg3AOMZ9aCY9Kr8Et4gUyWtcDuIeERud4D6pZaoSHyO0rkYGOd
	 fIc5N2fkdenKFHJEp2jXSRMbg+jhnGHW0KNlXtnqkeOJZMWSvftZpX+9diK27Id3/w
	 2NcQZKnZgRXSW5qds31CSehJsloYGdEyaFWMSE8x6hZcLrBAGX20GcpHOEOEvLTP6j
	 jmX0fBoIgElPs66AsPTM0adpCuPwfyr6378LKnjyLD04oDwnLEmu5UsRO6hQDPn9s8
	 KHb1OMiHPSNLQ==
Date: Mon, 1 Jul 2024 16:10:20 +0100
From: Conor Dooley <conor@kernel.org>
To: Lucca fachinetti <luccafachinetti@gmail.com>
Cc: pavel@ucw.cz, dmurphy@ti.com, robh+dt@kernel.org, lee@kernel.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, g.luiztrevisan@gmail.com
Subject: Re: [PATCH 1/1] dt-bindings: leds: max77650: convert the binding
 document to yaml
Message-ID: <20240701-overview-video-34f025ede104@spud>
References: <20240628225551.107833-1-luccafachinetti@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="l11dlNPa9t6leBoq"
Content-Disposition: inline
In-Reply-To: <20240628225551.107833-1-luccafachinetti@gmail.com>


--l11dlNPa9t6leBoq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2024 at 07:55:51PM -0300, Lucca fachinetti wrote:
> From: Lucca Fachinetti <luccafachinetti@gmail.com>
>=20
> Convert the binding document for max77650 LED module to yaml.
>=20
> Signed-off-by: Lucca Fachinetti <luccafachinetti@gmail.com>
> ---
>  .../bindings/leds/leds-is31fl32xx.txt         | 52 --------------
>  .../bindings/leds/leds-is31fl32xx.yaml        | 67 +++++++++++++++++++
>  2 files changed, 67 insertions(+), 52 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/leds/leds-is31fl32x=
x.txt
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-is31fl32x=
x.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt b=
/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt
> deleted file mode 100644
> index 926c2117942c..000000000000
> --- a/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt
> +++ /dev/null
> @@ -1,52 +0,0 @@
> -Binding for ISSI IS31FL32xx and Si-En SN32xx LED Drivers
> -
> -The IS31FL32xx/SN32xx family of LED drivers are I2C devices with multiple
> -constant-current channels, each with independent 256-level PWM control.
> -Each LED is represented as a sub-node of the device.
> -
> -Required properties:
> -- compatible: one of
> -	issi,is31fl3236
> -	issi,is31fl3235
> -	issi,is31fl3218
> -	issi,is31fl3216
> -	si-en,sn3218
> -	si-en,sn3216
> -- reg: I2C slave address
> -- address-cells : must be 1
> -- size-cells : must be 0
> -
> -LED sub-node properties:
> -- reg : LED channel number (1..N)
> -- label :  (optional)
> -  see Documentation/devicetree/bindings/leds/common.txt
> -- linux,default-trigger :  (optional)
> -  see Documentation/devicetree/bindings/leds/common.txt
> -
> -
> -Example:
> -
> -is31fl3236: led-controller@3c {
> -	compatible =3D "issi,is31fl3236";
> -	reg =3D <0x3c>;
> -	#address-cells =3D <1>;
> -	#size-cells =3D <0>;
> -
> -	led@1 {
> -		reg =3D <1>;
> -		label =3D "EB:blue:usr0";
> -	};
> -	led@2 {
> -		reg =3D <2>;
> -		label =3D "EB:blue:usr1";
> -	};
> -	...
> -	led@36 {
> -		reg =3D <36>;
> -		label =3D "EB:blue:usr35";
> -	};
> -};
> -
> -For more product information please see the links below:
> -http://www.issi.com/US/product-analog-fxled-driver.shtml
> -http://www.si-en.com/product.asp?parentid=3D890
> diff --git a/Documentation/devicetree/bindings/leds/leds-is31fl32xx.yaml =
b/Documentation/devicetree/bindings/leds/leds-is31fl32xx.yaml
> new file mode 100644
> index 000000000000..0f4c7c3440c6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-is31fl32xx.yaml

Can you call the binding after one of the compatible strings please?

> @@ -0,0 +1,67 @@
> + # SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/leds-is31fl32xx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: LED driver for is31fl32xx and Si-En SN32xx.
> +
> +maintainers:
> +  - Pavel Machek <pavel@ucw.cz>
> +  - Lee Jones <lee@kernel.org>
> +
> +description: |

The | here likely isn't needed, the formatting isn't really worth
preserving....

> +  Binding for ISSI is31fl32xx and Si-En SN32xx LED Drivers

Especially as this line is just duplicating the title.

> +
> +  The is31fl32xx/SN32xx family of LED drivers are I2C devices with multi=
ple
> +  constant-current channels, each with independent 256-level PWM control.
> +  Each LED is represented as a sub-node of the device.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - issi,is31fl3236
> +      - issi,is31fl3235
> +      - issi,is31fl3218
> +      - issi,is31fl3216
> +      - si-en,sn3218
> +      - si-en,sn3216
> +
> +  reg:
> +    maxItems: 1
> +    description:
> +      I2C slave address
> +
> +  '#address-cells':
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^led@[1-9][0-9]*$":
> +    type: object

You're missing a ref to leds/common.yaml here, where the label and
trigger properties are described.

> +    description: |

And this | isn't needed either.


> +      Properties for a single subnode LED.
> +    additionalProperties: false
> +
> +    properties:
> +      reg:
> +        minItems: 1
> +        description:
> +          LED channel number (1..N)
> +
> +      label: true
> +
> +      linux,default-trigger: true
> +
> +    required:
> +      - reg
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#size-cells"
> +  - "#address-cells"
> +
> +additionalProperties: false

You should add the example from the text binding to the yaml one too, so
that dt_binding_check can be used to validate the binding versus the
example.

Thanks,
Conor.

--l11dlNPa9t6leBoq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZoLG3AAKCRB4tDGHoIJi
0oveAQDrEkT8y+mekejUR5G6oMeeh21OrH/t1S893yr/b29rmgD9H6wTfUdNZr8f
IgsYiMnsWJbgnOofEUxW3dQ+rOo5kgk=
=oMtZ
-----END PGP SIGNATURE-----

--l11dlNPa9t6leBoq--

