Return-Path: <linux-leds+bounces-4036-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 49219A3E1C3
	for <lists+linux-leds@lfdr.de>; Thu, 20 Feb 2025 18:05:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B204517F6F6
	for <lists+linux-leds@lfdr.de>; Thu, 20 Feb 2025 17:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0BAA212B22;
	Thu, 20 Feb 2025 17:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GmKp9n/N"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A1220D4E2;
	Thu, 20 Feb 2025 17:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740071026; cv=none; b=NO6Li4z0yOUf3GpLP6fjSPqe2coupiI6J/SKu64XaL0FG5ywyc91AXnKYVpvCADNEE3j7G178YhN1td8ef6GQ/37yjbeCKkH/3zH8rkmffGwK3ymdokGIBfFNoLO8u/5MPCn8fDhKkF4ZkUcLmbskvUbWxlJmH1fPNuzvkxOjb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740071026; c=relaxed/simple;
	bh=gpPQRWVleKseipjb4fepOYISx5fxOTAg2iTAl0luXkY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZspZWCd09NLEXpkBa49ucOHbcYMYw0MXQqmnRsnwg/KCqnl7EhYm8CbdYo6AVBhNX2UsI6Orb3wSOtPZRFIylf3sqNZyHLBWjKw07MsNkAPyljieIuKdnR5dI7uod/i1Y7NvTM/xwBEVx5/9MkjY2r/652X8E8wX2Tue2RmbFiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GmKp9n/N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C786C4CED1;
	Thu, 20 Feb 2025 17:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740071026;
	bh=gpPQRWVleKseipjb4fepOYISx5fxOTAg2iTAl0luXkY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GmKp9n/Nq6ReteFJTiEsO99lxULkhB/fCSWlWUHqR2aRG+0wIzl3EEHDNOjwwTy1V
	 KslPpGf+gm8BmhK2/hMPKvHOriNfQc/7qHvRTR6EhBt9GED4fXnccaFMgBg8MBnzQi
	 ch7GjMJwCY00EpZE8hStaxstTQ/jzIvbckqq3EipemFvdxRkUTgenkfFjJACaeixm7
	 EOLABECyiH108wojZNMG7YR4J0Tdzq8RC/4zZxHz6bKhfnaRGogiYFBSD1/vQvP4cz
	 ivILl0Kld3fCgAsxVCkVVzWJk/+f9Jk4F0g3SwvhJJcais19jDAKQeu4FrtS1qIGcU
	 K7y9cjdFfWHIA==
Date: Thu, 20 Feb 2025 17:03:41 +0000
From: Conor Dooley <conor@kernel.org>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Steffen Trumtrar <kernel@pengutronix.de>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: leds: add lp5860 LED controller
Message-ID: <20250220-gab-bagful-ce588df069d2@spud>
References: <20250220-v6-14-topic-ti-lp5860-v1-0-42874bdc7513@pengutronix.de>
 <20250220-v6-14-topic-ti-lp5860-v1-1-42874bdc7513@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dhzeSjOqKqWIB870"
Content-Disposition: inline
In-Reply-To: <20250220-v6-14-topic-ti-lp5860-v1-1-42874bdc7513@pengutronix.de>


--dhzeSjOqKqWIB870
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2025 at 01:57:56PM +0100, Steffen Trumtrar wrote:
> The lp5860 is a LED matrix driver with 18 constant current sinks and 11
> scan switches for 198 LED dots:
>   * Supply range from 2.7 V to 5.5 V
>   * 0.1mA - 50mA per current sink
>   * 1MHz I2C and 12MHz SPI control interface
>   * 8-bit analog dimming
>   * 8/16-bit PWM dimming
>   * individual ON and OFF control for each LED dot
>   * globat 3-bit Maximum Current setting for all LED dots
>   * individual LED dot open/short detection
>=20
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---
>  .../devicetree/bindings/leds/leds-lp5860.yaml      | 112 +++++++++++++++=
++++++
>  1 file changed, 112 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/leds/leds-lp5860.yaml b/Do=
cumentation/devicetree/bindings/leds/leds-lp5860.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..a4e39fd843f3f260ee9c1103e=
2cb27dcb230608c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-lp5860.yaml
> @@ -0,0 +1,112 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/leds-lp5860.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: LED driver for LP5860 RGB LED from Texas Instruments.
> +
> +maintainers:
> +  - Steffen Trumtrar <kernel@pengutronix.de>
> +
> +description: |
> +  The LP5860 is multi-channel, I2C and SPI RGB LED Driver that can group=
 RGB LEDs
> +  into a LED group or control them individually.
> +
> +  For more product information please see the link below:
> +  https://www.ti.com/lit/ds/symlink/lp5860.pdf
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,lp5860
> +
> +  reg:
> +    maxItems: 1
> +
> +  spi-max-frequency:
> +    maximum: 12000000
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +patternProperties:
> +  '^multi-led@[0-9a-f]$':
> +    type: object
> +    $ref: leds-class-multicolor.yaml#
> +    unevaluatedProperties: false
> +
> +    properties:
> +      reg:
> +        minItems: 1
> +        maxItems: 12
> +        description:
> +          This property denotes the LED module number(s) that is used
> +          for the child node.

I'm not really sure what you're attmpting here with the minItems: 1, maxIte=
ms: 12.
Are you sure you didn't mean maxItems: 1, minimum: 1, maximum: 12?

--dhzeSjOqKqWIB870
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ7dgbQAKCRB4tDGHoIJi
0sGgAP9DjLiuO1VdyejSM94HneZbw3cYQ5Q/w8hX8xcR6NuCewEAoVc5hCWOfsok
t/hqvo6z6ObYxefQwx2nXChXoVmwlgA=
=9jeY
-----END PGP SIGNATURE-----

--dhzeSjOqKqWIB870--

