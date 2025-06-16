Return-Path: <linux-leds+bounces-4809-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD21ADB4CD
	for <lists+linux-leds@lfdr.de>; Mon, 16 Jun 2025 17:03:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 257A21717F6
	for <lists+linux-leds@lfdr.de>; Mon, 16 Jun 2025 15:03:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3CE721C9F1;
	Mon, 16 Jun 2025 15:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dZ0NC/kF"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B785B202F87;
	Mon, 16 Jun 2025 15:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750086189; cv=none; b=EoybEH1Xn0ExNzMGTzq6kfSjoYB5FQkko5f04rEwHsomQO847H9NfRqDEThohvCIuUcOF8AbUtfqGbhmDVncQutcpgTkKIHZ4Ode+oPYsH7zz6pdG2AMqrzOrEwfehPr0Rvdk2sxoS5yrH1ydr+ucATkbTxR6qd1yiPo5vDcDwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750086189; c=relaxed/simple;
	bh=SIrqC6AzkZF8lFmesrPLyw+dA3BwFQ1jQV+GgwGaIk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gZ87k1L1EWrthoTER6SY4jNZYTuc4wDs+wPvIkeBxqlQRIWJInrguSnpoIxGegGhBqYSntcUOjdlnibVZU32CqW8AhqR7FZxvItBWBTyog0UU7ahLc8KLKKW9NG9Ghq1nF7MDnYZ1bswfWcwVeaTgNGvBYZrTDrgFWWlEhQPZ1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dZ0NC/kF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BADEC4CEEA;
	Mon, 16 Jun 2025 15:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750086189;
	bh=SIrqC6AzkZF8lFmesrPLyw+dA3BwFQ1jQV+GgwGaIk4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dZ0NC/kFfaKpX5BpyjbfSJoehXzzC+i4H+qNug1L/P1bcT1Ju06gWnBuO54bh80kC
	 OZX8wbFzagzIOE8b+aKCar9MdA/wooEeCGxIK5r1z8v8/68KHTUTTOevCpbpdGGtLl
	 z2cVOLQeSfHysv4VRzAw/sj9RlJ3Wy+24WuSSowPkCGh5AxBEmxiywdujE9ga4O8Eu
	 EWynAzPJY9uWVyL1r7Fl+kD0iHC5lmy6MXLWIHBWtYoy6Sani2301AfOc7g4AMzWZP
	 RoBKBHQGeCZcLaOVRaqjc7Ny/fQmuhXw3TjN9B+4e13xvH/3oGwPJukj/r8DJBm8Tt
	 KXz8TRh8CPT5A==
Date: Mon, 16 Jun 2025 16:03:04 +0100
From: Conor Dooley <conor@kernel.org>
To: Johan Adolfsson <johan.adolfsson@axis.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kernel@axis.com
Subject: Re: [PATCH v6 2/2] dt-bindings: leds: lp50xx: Document child reg,
 fix example
Message-ID: <20250616-zealous-scariness-48b47a0818a5@spud>
References: <20250616-led-fix-v6-0-b9df5b63505d@axis.com>
 <20250616-led-fix-v6-2-b9df5b63505d@axis.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4/6/wVc4KLozcveW"
Content-Disposition: inline
In-Reply-To: <20250616-led-fix-v6-2-b9df5b63505d@axis.com>


--4/6/wVc4KLozcveW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 01:25:35PM +0200, Johan Adolfsson wrote:
> The led child reg node is the index within the bank, document that
> and update the example accordingly.
>=20
> Signed-off-by: Johan Adolfsson <johan.adolfsson@axis.com>
> ---
>  .../devicetree/bindings/leds/leds-lp50xx.yaml       | 21 ++++++++++++++-=
------
>  1 file changed, 14 insertions(+), 7 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml b/Do=
cumentation/devicetree/bindings/leds/leds-lp50xx.yaml
> index 402c25424525..cb450aed718c 100644
> --- a/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
> +++ b/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
> @@ -81,7 +81,14 @@ patternProperties:
> =20
>          properties:
>            reg:
> -            maxItems: 1
> +            items:
> +              - minimum: 0
> +                maximum: 2
> +
> +            description:
> +              This property denotes the index within the LED bank.

> +              The value will act as the index in the multi_index file to=
 give
> +              consistent result independent of devicetree processing ord=
er.

This looks like commentary on the particulars of the driver
implementation in linux, which shouldn't be in a binding.

> =20
>          required:
>            - reg
> @@ -138,18 +145,18 @@ examples:
>                  color =3D <LED_COLOR_ID_RGB>;
>                  function =3D LED_FUNCTION_STANDBY;
> =20
> -                led@3 {
> -                    reg =3D <0x3>;
> +                led@0 {
> +                    reg =3D <0x0>;

Do you have any explanation for why these numbers, outside the range you
said is valid, were in the binding's example?
Additionally, can you mention in the commit message what the source was
for the 0-2 range?

Cheers,
Conor.

>                      color =3D <LED_COLOR_ID_RED>;
>                  };
> =20
> -                led@4 {
> -                    reg =3D <0x4>;
> +                led@1 {
> +                    reg =3D <0x1>;
>                      color =3D <LED_COLOR_ID_GREEN>;
>                  };
> =20
> -                led@5 {
> -                    reg =3D <0x5>;
> +                led@2 {
> +                    reg =3D <0x2>;
>                      color =3D <LED_COLOR_ID_BLUE>;
>                  };
>              };
>=20
> --=20
> 2.30.2
>=20

--4/6/wVc4KLozcveW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaFAyKAAKCRB4tDGHoIJi
0q/PAP9gatx3SgO62Of1KYNl6uc3Rfq9AOBv7EwLyKx0phLFbgD9HSWb0upXrKOB
Q3H7ztxnvcdarwbtFSxKCE7nRhJsoA0=
=slMW
-----END PGP SIGNATURE-----

--4/6/wVc4KLozcveW--

