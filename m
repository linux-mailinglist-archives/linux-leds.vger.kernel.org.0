Return-Path: <linux-leds+bounces-1649-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6308C1389
	for <lists+linux-leds@lfdr.de>; Thu,  9 May 2024 19:09:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CB2D8B20A82
	for <lists+linux-leds@lfdr.de>; Thu,  9 May 2024 17:09:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BC9ACA73;
	Thu,  9 May 2024 17:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HX1F+zCx"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6173B6AD7;
	Thu,  9 May 2024 17:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715274568; cv=none; b=TLcaT3Nj5rhIWi8Iv+FZSVD6JUEncABHNAigv62Yz1smqlua3cghzsJTahmVNOcGq8cWZje5/2Lp9Zhx2k3KXJRWIr5VKs1waS1m042lJlnoKZz3pX+f/5ZqxBMNzPCa3L+wpVe1T9F41Y29Jrxf5nHEZksLCspfD7cy9IQlhLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715274568; c=relaxed/simple;
	bh=+wFFlTnc55xfpgjhlPdcqsCb7nESgiO72PfzTtTnZX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BN41I+mrU9MYnNMSDlTGXWcXuk18ZP2H/hHIITCd13yCdC2Wpot03cEWiIm+NNG7x/PYfWTcURYuMku0OYbDs/1BoUNPtzZhX4UZBPbEAc3g6lRJxw/eiGZ/WrLvjXcIYPLJIohLBAI3dh1lw6cbos0D2NJLmOto6wHNBm/HW+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HX1F+zCx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68B45C116B1;
	Thu,  9 May 2024 17:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715274567;
	bh=+wFFlTnc55xfpgjhlPdcqsCb7nESgiO72PfzTtTnZX0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HX1F+zCxhba2xkkS+/jxIRRSMCzSSUwEJxHOGHh7Yk+LVsZqozmdJHCZjYvt56RC8
	 AzEqRzXcpUMp2enG4vEFF6oZ79h54xD22MHdOUwQHHx4Sthb65ym8ollnjiPEccj0D
	 UP496q/8KBg0TlBI72oGGAQV+Plim21lrfBxA/mCDkyWneGKtb5Qx4gey64lFVRKHw
	 thc6gPwlrMC04+y7f+4+SM93YrIVW/ngC9E3FZvzDwWs8rVuKpSLxUb3uUwhZlc8JK
	 cqoAIFpWcw1IzEoUztJl5Ux1l6O+cze5uLsuI/Dph8BLDu4XkDzHT3d4aBj5oSFcEd
	 yu2Iuw8r5OiWA==
Date: Thu, 9 May 2024 18:09:21 +0100
From: Conor Dooley <conor@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Frank Wunderlich <frank-w@public-files.de>,
	Eric Woudstra <ericwouds@gmail.com>,
	Tianling Shen <cnsztl@immortalwrt.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-leds@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm64: dts: mediatek: add BananaPi
 R3 Mini
Message-ID: <20240509-velcro-march-6878a4ee1f73@spud>
References: <20240509152157.10162-1-linux@fw-web.de>
 <20240509152157.10162-2-linux@fw-web.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1UDgLFyYubxOZ98P"
Content-Disposition: inline
In-Reply-To: <20240509152157.10162-2-linux@fw-web.de>


--1UDgLFyYubxOZ98P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 09, 2024 at 05:21:56PM +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
>=20
> Add MT7988A based BananaPi R3 Mini.
>=20
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--1UDgLFyYubxOZ98P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZj0DQQAKCRB4tDGHoIJi
0luUAP0frxkua/Bw7NrNmTdtW5/WNrwwxuYa9/Wu69VhqSV8VQEAhbmO5/rayKXx
LwEsbLqjtjgZ+ORX0KXmqU1etJV7pAk=
=t38o
-----END PGP SIGNATURE-----

--1UDgLFyYubxOZ98P--

