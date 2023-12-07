Return-Path: <linux-leds+bounces-312-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B86808E76
	for <lists+linux-leds@lfdr.de>; Thu,  7 Dec 2023 18:18:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4F1B1C203BC
	for <lists+linux-leds@lfdr.de>; Thu,  7 Dec 2023 17:18:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F047248CDD;
	Thu,  7 Dec 2023 17:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RbTTwS+L"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD361433B9;
	Thu,  7 Dec 2023 17:18:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4AD3C433C8;
	Thu,  7 Dec 2023 17:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701969513;
	bh=66JMbMuX4AYxelynC3Ne6j5CsaJjJ0MIOrMHqrN63I8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RbTTwS+LIkADPVMWjvU2TmMwhavexszXtfiV6JPJg3bClqH9I3jcs7kAOnvAhJcjZ
	 aSoS0T/3+qHcMUammD4rGONcLFRIy/ykrxdDq77zyZjRPm+EUuKYHjcxNvjMz8yQuI
	 efbdW3BBa5oWDzu7wUury7Ya4Zv3882sgjt4BA/2cirTYh+qnbKMuVuK5M/CdI07BN
	 Rdl9L8nweP7fYGK2OQq1PhyaqG9AQzbDE2WVg7WWFqgw/q2cobAnf6P16yAeabUva4
	 69rXnzBrgkxp+Hm7ziHzGHKxMQ3j7z0AnmhV85k5aCNhbl8cljwIgKapVGJo1kOkfL
	 AXlHgjMZt0GXA==
Date: Thu, 7 Dec 2023 17:18:28 +0000
From: Conor Dooley <conor@kernel.org>
To: Martin Kurbanov <mmkurbanov@salutedevices.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	kernel@salutedevices.com
Subject: Re: [PATCH v1 2/2] dt-bindings: leds: aw200xx: add 'interrupts'
 property
Message-ID: <20231207-purple-mulled-776447ea26f3@spud>
References: <20231207125938.175119-1-mmkurbanov@salutedevices.com>
 <20231207125938.175119-3-mmkurbanov@salutedevices.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oVyXoo7fHC9IKh7M"
Content-Disposition: inline
In-Reply-To: <20231207125938.175119-3-mmkurbanov@salutedevices.com>


--oVyXoo7fHC9IKh7M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 07, 2023 at 03:59:38PM +0300, Martin Kurbanov wrote:
> Added support for interrupt to the LED controller driver, which
> indicates the finished of the auto-breath pattern.
>=20
> Signed-off-by: Martin Kurbanov <mmkurbanov@salutedevices.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  Documentation/devicetree/bindings/leds/awinic,aw200xx.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/leds/awinic,aw200xx.yaml b=
/Documentation/devicetree/bindings/leds/awinic,aw200xx.yaml
> index 54d6d1f08e24..7ab35b7a3fe6 100644
> --- a/Documentation/devicetree/bindings/leds/awinic,aw200xx.yaml
> +++ b/Documentation/devicetree/bindings/leds/awinic,aw200xx.yaml
> @@ -44,6 +44,9 @@ properties:
>    enable-gpios:
>      maxItems: 1
> =20
> +  interrupts:
> +    maxItems: 1
> +
>  patternProperties:
>    "^led@[0-9a-f]+$":
>      type: object
> @@ -137,6 +140,7 @@ additionalProperties: false
>  examples:
>    - |
>      #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
>      #include <dt-bindings/leds/common.h>
> =20
>      i2c {
> @@ -149,6 +153,8 @@ examples:
>              #address-cells =3D <1>;
>              #size-cells =3D <0>;
>              enable-gpios =3D <&gpio 3 GPIO_ACTIVE_HIGH>;
> +            interrupt-parent =3D <&gpio_intc>;
> +            interrupts =3D <13 IRQ_TYPE_LEVEL_LOW>;
> =20
>              led@0 {
>                  reg =3D <0x0>;
> --=20
> 2.40.0
>=20

--oVyXoo7fHC9IKh7M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXH+ZAAKCRB4tDGHoIJi
0qhtAP47F/B1cUNLeC+Zw8DZQCsevoFvAnB3JIN089SDrE8Q+QD/ZPUbAwPkUDer
6ezZuuXwJuzVYZ/dwLRWpbJpm2jsmQM=
=seS0
-----END PGP SIGNATURE-----

--oVyXoo7fHC9IKh7M--

