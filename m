Return-Path: <linux-leds+bounces-5219-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2AAB2120A
	for <lists+linux-leds@lfdr.de>; Mon, 11 Aug 2025 18:33:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A854450747A
	for <lists+linux-leds@lfdr.de>; Mon, 11 Aug 2025 16:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D65E02D6E43;
	Mon, 11 Aug 2025 16:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LzaJfVEl"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86DE2D4817;
	Mon, 11 Aug 2025 16:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754928728; cv=none; b=AvMIjujxcf61dKCDc/bCciiDJOPBOlOU/IBGbuIMbNqPk2pA2bebi+FOxDugZMbC4RL8pdKUeYP8ZuZx1+7ZRKSQ4AWdP9k/AYig1gTrZq9Otlobb8+nLAwgHgkdNU6YCqenv08+HC/SScOOd2SE9XdJIREF4Qm0DJ3Q17O56vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754928728; c=relaxed/simple;
	bh=ywB2J7ZtGdpNwTs5xx/wUpxuvR6/Qw9lbD1G2ulil+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rl3gsuHxdIq2+XKCiEdJjSnaafLKTgWn9iJrco21A8Vy/9yWICvkhAw8ZnYnjGqSqaIjTj7K6Azuh4X62OMvcYEiNs56RhI9IJ2/p7vNNBHK6kc4tZ5pSSK3ZIF5qMk8M84nd+QhzZsLfbxBq2K/qdrAFz+kU5Y+kgLUvKrCEh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LzaJfVEl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92CC1C4CEED;
	Mon, 11 Aug 2025 16:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754928728;
	bh=ywB2J7ZtGdpNwTs5xx/wUpxuvR6/Qw9lbD1G2ulil+4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LzaJfVEl3M/Ys3WfHZ9dLYbAm7auCaWvW/s4YH+7GSZcPf0mUlTZguwPJCtvpH7GF
	 L6Lhba1BWh9vLiFbS8jmINS2Cww+GLUaLep5CHuJi4g3A10hZfY8CE1DZDLuXHR3vo
	 rnHZz4w1wSzqK0CkspWvZSNGWPd4xMvvQNsRsaZt4J0/R6Fgs/kChA1HVzG0rohErO
	 D/jS9qAv0IGK7nbN6FbNrJDlCi2vjckCtupQ7qqEbrJuldmHXTkDHFn1L/2yzdKZzC
	 OF9hdX8oFPVFscbSwb7CMG1pvpyXu9xtJn3MfMpm60uCXiM4e69kSC6s6V3bg/Mflp
	 YQzxt+93tYqxg==
Date: Mon, 11 Aug 2025 17:12:02 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Li Jun <jun.li@nxp.com>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RESEND 0/2] dt-bindings: Drop 'db' suffix duplicating
 dtschema
Message-ID: <20250811-pretext-nurture-f26afcb71bc4@spud>
References: <20250811-dt-bindings-db-v1-0-457301523bb5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i7RBXh8TXneQyLtd"
Content-Disposition: inline
In-Reply-To: <20250811-dt-bindings-db-v1-0-457301523bb5@linaro.org>


--i7RBXh8TXneQyLtd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 11, 2025 at 03:54:02PM +0200, Krzysztof Kozlowski wrote:
> Resending because all dependencies are merged.
>=20
> Please take individual patches via respective subsystems (phy, leds).
>=20
> Previously:
> - Link to v1: https://lore.kernel.org/r/20250627-dt-bindings-db-v1-0-d5c7=
072acbee@linaro.org
>=20
> Best regards,
> Krzysztof

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--i7RBXh8TXneQyLtd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaJoWUgAKCRB4tDGHoIJi
0jEAAP9vwCB8aZKzy3TpMtP3zqVyMGQwcwldZvWKjvk5CrVmKgD/UvaQDx8AyMC8
Dc/Ub+g7NWs3WeUczFQzekOgSwe1QQw=
=6OLD
-----END PGP SIGNATURE-----

--i7RBXh8TXneQyLtd--

