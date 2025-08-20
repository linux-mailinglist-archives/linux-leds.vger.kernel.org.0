Return-Path: <linux-leds+bounces-5266-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD74FB2E63E
	for <lists+linux-leds@lfdr.de>; Wed, 20 Aug 2025 22:12:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D61927BBC6B
	for <lists+linux-leds@lfdr.de>; Wed, 20 Aug 2025 20:08:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1C1328688A;
	Wed, 20 Aug 2025 20:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BCxq1Q3d"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F4824503B;
	Wed, 20 Aug 2025 20:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755720488; cv=none; b=nNjmqtibVEaf+z7GDi9omMYRW9a65OiDwbGrkg4MEoTOlmLjVQ8dXKcOE2pgxHCsN1XKELeKZ54VGI1+7GK/vwMoHFRk7ARavGHUSXgMQClPtt+t2Rs2CN0lX+sufpAMxioDgKDrHpO45j+OWJE/vBb8OGo+VEaXZoGPZXNXMpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755720488; c=relaxed/simple;
	bh=/G9A7kPuah5GXIsWIFBAQ6+/j6rQ0Qtswu0ghfH3Xb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fNHaeoohh7YFW5Rxd6K9wyPUZ6tqGDGoBAQtEh4eaTDFysAVElRk/qLkvJe/YLLxYbzLJFHFnXBux0xvoWvsqGYPJjR9OWRfjEXJGXeQuqDz5rSGnmksRm44w964Cf4E+LlTps141dLAV7O9F0OQ7iuMdhOTu6gWKDYajVmYl0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BCxq1Q3d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36794C4CEE7;
	Wed, 20 Aug 2025 20:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755720488;
	bh=/G9A7kPuah5GXIsWIFBAQ6+/j6rQ0Qtswu0ghfH3Xb8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BCxq1Q3dN+NSRV/70cGCYfWY6SPW0Jtif+SbJ1rXtSxNzAtpr7XdC5j23EMEt77xo
	 WfaCgDKnQz5crq1DfldD+aSqNa3VeWAshOIGPrZUPJYr485J3JUawoxEN+Tyf988Io
	 d0m2RaNe7cq21emaTC3ehF+7/yne4A8eluQyArSda7T8bDVleAmQsLFa4b8ku1VXRE
	 X4sKIQwd1YhucqjHvOkRQZWdc+XIIaKQFVWItTJB3+yL0sASQ7DrVA8KOV8V4yumkS
	 NXrpDkDnqbzhNgIcxGBG1vl+PvadNNh8vcnxPVJMkJBpKlEdKG9LQFB95djlZFGNA+
	 E/7iimuegTseg==
Date: Wed, 20 Aug 2025 21:08:01 +0100
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Jean-Fran=E7ois?= Lessard <jefflessard3@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Boris Gjenero <boris.gjenero@gmail.com>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Paolo Sabatino <paolo.sabatino@gmail.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: vendor-prefixes: Add fdhisi,
 titanmec, princeton, winrise, wxicore
Message-ID: <20250820-wired-deserve-421d76bdd1c9@spud>
References: <20250820163120.24997-1-jefflessard3@gmail.com>
 <20250820163120.24997-2-jefflessard3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ptAdB7JQkIezWcQ4"
Content-Disposition: inline
In-Reply-To: <20250820163120.24997-2-jefflessard3@gmail.com>


--ptAdB7JQkIezWcQ4
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 20, 2025 at 12:31:14PM -0400, Jean-Fran=E7ois Lessard wrote:
> Add vendor prefixes:
> - fdhisi: Fuzhou Fuda Hisi Microelectronics Co., Ltd.
> - titanmec: Shenzhen Titan Micro Electronics Co., Ltd.
> - princeton: Princeton Technology Corp.
> - winrise: Shenzhen Winrise Technology Co., Ltd.
> - wxicore: Wuxi i-Core Electronics Co., Ltd.
>=20
> The titanmec prefix is based on the company's domain name titanmec.com.
> The remaining prefixes are based on company names, as these manufacturers=
 either
> lack active .com domains or their .com domains are occupied by unrelated
> businesses.
>=20
> The fdhisi and titanmec prefixes were originally identified by Andreas F=
=E4rber.
>=20
> CC: Andreas F=E4rber <afaerber@suse.de>
> Signed-off-by: Jean-Fran=E7ois Lessard <jefflessard3@gmail.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
but some reason why all these are being added together would be nice.

> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index 77160cd47..9fdba2911 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -540,6 +540,8 @@ patternProperties:
>      description: Fastrax Oy
>    "^fcs,.*":
>      description: Fairchild Semiconductor
> +  "^fdhisi,.*":
> +    description: Fuzhou Fuda Hisi Microelectronics Co., Ltd.
>    "^feixin,.*":
>      description: Shenzhen Feixin Photoelectic Co., Ltd
>    "^feiyang,.*":
> @@ -1233,6 +1235,8 @@ patternProperties:
>      description: Prime View International (PVI)
>    "^primux,.*":
>      description: Primux Trading, S.L.
> +  "^princeton,.*":
> +    description: Princeton Technology Corp.
>    "^probox2,.*":
>      description: PROBOX2 (by W2COMP Co., Ltd.)
>    "^pri,.*":
> @@ -1567,6 +1571,8 @@ patternProperties:
>      description: Texas Instruments
>    "^tianma,.*":
>      description: Tianma Micro-electronics Co., Ltd.
> +  "^titanmec,.*":
> +    description: Shenzhen Titan Micro Electronics Co., Ltd.
>    "^tlm,.*":
>      description: Trusted Logic Mobility
>    "^tmt,.*":
> @@ -1724,6 +1730,8 @@ patternProperties:
>      description: Wingtech Technology Co., Ltd.
>    "^winlink,.*":
>      description: WinLink Co., Ltd
> +  "^winrise,.*":
> +    description: Shenzhen Winrise Technology Co., Ltd.
>    "^winsen,.*":
>      description: Winsen Corp.
>    "^winstar,.*":
> @@ -1740,6 +1748,8 @@ patternProperties:
>      description: Wobo
>    "^wolfvision,.*":
>      description: WolfVision GmbH
> +  "^wxicore,.*":
> +    description: Wuxi i-Core Electronics Co., Ltd.
>    "^x-powers,.*":
>      description: X-Powers
>    "^xen,.*":
> --=20
> 2.43.0
>=20

--ptAdB7JQkIezWcQ4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKYrIQAKCRB4tDGHoIJi
0s9AAP9WOmOrTvsrhQrT0zhJmk7EDVOROhIxOhRWU9M3yp3KCQEA4tWmwkqk1NBL
6cTTXzgVb0/IKkD384C8m6M+moakRAk=
=PWXY
-----END PGP SIGNATURE-----

--ptAdB7JQkIezWcQ4--

