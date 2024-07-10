Return-Path: <linux-leds+bounces-2238-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5606692D37F
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jul 2024 15:54:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0AB331F2125E
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jul 2024 13:54:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FD2519346B;
	Wed, 10 Jul 2024 13:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LaMxRt7V"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4472E19345D;
	Wed, 10 Jul 2024 13:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720619624; cv=none; b=VcpeJ1K7/ruBQVtarqP49/crSFx3EZz6aoPHZc+AbWHjEaxEGRqoN7aSOFIYeFqlUKOS4a8TYv/6aMZYX5XrnHlRgij1fCwQVICOwsQq+9tLa2zzy+pE0eBznureL0WVCjfw8Jq2tFsg46gowd3UC30SqXOUJjqYZRVpVxZjiyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720619624; c=relaxed/simple;
	bh=vGpPx6cZx9db02mw99l7Nx02m19KetQfnLviBcUiZaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GBYR+tN9/21fChoryS5XhSx1MLrA8I/Z8aRtIr/KGFafttzyC5TZO78/jjFlTg9U3VvO1V6OWCJpwwim/KIovK/w83AAsEqd1hoxVgXXGs9VktEg9Dk7fN44Ue5gPo3TrGVPsOKq7eWSU9AvGY1fz7yYiwTKRWIgVYeUbET5w/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LaMxRt7V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8349BC32781;
	Wed, 10 Jul 2024 13:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720619623;
	bh=vGpPx6cZx9db02mw99l7Nx02m19KetQfnLviBcUiZaE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LaMxRt7VH04xJpnTkHg5LDtgBcfg65M6i12OVcdUKMf8+S4ukTs0J5UyoGZm3oSqm
	 9seU1j2HHToOZFhSvaIVEs50bMPtlosYkk9CL4NqaynmDSSbOv46bLGr/Ty38SZWlW
	 IBc37IE334CAAVy8GyMJTHKANN30NPqwST5iAq2cqNck6L74yzQQsgGuZhxpmUxmbn
	 aOMBbJjmbHjiueS6dTne5DGIwOFmhVFu61gdwznkdU/Q83rcp/49u4nG4vVx/ho57X
	 ifNPL2/7ZDSJQWs2d0sblhXDG5Qy+k30A3bhTk0WW3/913MCwQ6CupJAXJ1x6bnL+b
	 /b/3MhwpMATmw==
Date: Wed, 10 Jul 2024 14:53:39 +0100
From: Conor Dooley <conor@kernel.org>
To: pieterjanca@gmail.com
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Isai Gaspar <isaiezequiel.gaspar@nxp.com>,
	Marek Vasut <marex@denx.de>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: leds: pca995x: Add new nxp,pca9956b
 compatible
Message-ID: <20240710-curve-await-f52e799e108e@spud>
References: <20240710-pca995x-v1-0-545015603000@gmail.com>
 <20240710-pca995x-v1-1-545015603000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oLQwLI5eC6v/FFV/"
Content-Disposition: inline
In-Reply-To: <20240710-pca995x-v1-1-545015603000@gmail.com>


--oLQwLI5eC6v/FFV/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 10, 2024 at 08:15:44AM +0200, Pieterjan Camerlynck via B4 Relay=
 wrote:
> From: Pieterjan Camerlynck <pieterjanca@gmail.com>
>=20
> Add nxp,pca9956b compatible, which has 24 instead of 16 outputs. Adjust
> the documentation for the difference.
>=20
> Signed-off-by: Pieterjan Camerlynck <pieterjanca@gmail.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--oLQwLI5eC6v/FFV/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZo6SYwAKCRB4tDGHoIJi
0gsoAQDJVnor2Lp2KcrLc7xsvgJT1i41JcZpZ/fP8rC80eVsXwEAjqTIqlXx4Zb/
d3rFubE0TIxtc1tJ/P3KDrgX7IL/bgc=
=g0m6
-----END PGP SIGNATURE-----

--oLQwLI5eC6v/FFV/--

