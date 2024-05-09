Return-Path: <linux-leds+bounces-1650-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 803D78C1394
	for <lists+linux-leds@lfdr.de>; Thu,  9 May 2024 19:12:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45DAD281C26
	for <lists+linux-leds@lfdr.de>; Thu,  9 May 2024 17:12:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4DFFDDBE;
	Thu,  9 May 2024 17:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KmcaWCvu"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1006CA73;
	Thu,  9 May 2024 17:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715274745; cv=none; b=jP02oZziu9ZMmOW1Xco+9wAyyc/4evGbSI0kGC+LEpztvzBHOge/1xMBp0k3jaU0AmY2xNY5fV75Z9ACl3vvZwdaXqCXEfCC6pjqsSZEUHkIbXxB2HenChTpzRkN4ssucmVODzxo9tzgvbhGoyTJDhBFkdFSa4I8wFVkY3QIzEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715274745; c=relaxed/simple;
	bh=cD69ICcj5UxBlb9k5M5IBUdciufwch/ZUuxho43dmes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FmanTDuhzeS/SGOY1ZBfdXxAdnE27CCREaLu82AxmesL9TLHe/itjYYqhmSCmOpNjlsQzO6bIR+OsAnvmnbPZLwJ6JMQdspiqg+9206s1AQqc3QTN7gkR1vBTYd3uc8Fv9LrqSSIGe9YePE17g0vMQRTDcHxE66qBkoUniGMzGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KmcaWCvu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EC76C116B1;
	Thu,  9 May 2024 17:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715274745;
	bh=cD69ICcj5UxBlb9k5M5IBUdciufwch/ZUuxho43dmes=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KmcaWCvuTAwE0V4qjpfxETVLf9F2J5Qmo/FtC5jp+UKUhl7ySNG+KBuESwaKd3yHx
	 hwlj3vg4jK5L29lUClun8XTp1MBptH3DqI3fQOYU5LB6WPwNXmJJdG1sBnmXZHYMtc
	 9a0pBF/T3T+7v4NHsR/vhDDcrpf+EOZ84GZu3omNfQ6oUWsXj2jfSJvHCvtQCNe1fD
	 xiy8BfpxUK4Bpx87LS9zq2Aawbe5Yg0a5UgUOrep5IMpXY6EYtjrby6r+UmQlocOB/
	 FuIX50e64Y6TFUkRLzjRMEbeeNj/aDtcezYQ3/FdEi9TnDCLTu3t9qxcCKODyIc5um
	 02IRTZl6oQRUg==
Date: Thu, 9 May 2024 18:12:18 +0100
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
Message-ID: <20240509-petroleum-game-3f1fce762eca@spud>
References: <20240509152157.10162-1-linux@fw-web.de>
 <20240509152157.10162-2-linux@fw-web.de>
 <20240509-velcro-march-6878a4ee1f73@spud>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VuTyzBpp28zUKDaK"
Content-Disposition: inline
In-Reply-To: <20240509-velcro-march-6878a4ee1f73@spud>


--VuTyzBpp28zUKDaK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 09, 2024 at 06:09:21PM +0100, Conor Dooley wrote:
> On Thu, May 09, 2024 at 05:21:56PM +0200, Frank Wunderlich wrote:
> > From: Frank Wunderlich <frank-w@public-files.de>
> >=20
> > Add MT7988A based BananaPi R3 Mini.
> >=20
> > Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
>=20
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

btw, subject here is odd. s/dts: // :)

--VuTyzBpp28zUKDaK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZj0D8gAKCRB4tDGHoIJi
0sISAP4yfgcGwbSR0//UJHU/u1e/KT1zyw6C6I2NV5mGn9AR3gEAktdYhKOWv4G3
nLBkdVhjppQAPXsK4/uD936eZspTQws=
=DOFJ
-----END PGP SIGNATURE-----

--VuTyzBpp28zUKDaK--

