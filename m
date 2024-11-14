Return-Path: <linux-leds+bounces-3405-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FB89C92AC
	for <lists+linux-leds@lfdr.de>; Thu, 14 Nov 2024 20:56:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 311A7B274D9
	for <lists+linux-leds@lfdr.de>; Thu, 14 Nov 2024 19:56:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8870A1A265B;
	Thu, 14 Nov 2024 19:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MnwIXzxW"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559A919F13C;
	Thu, 14 Nov 2024 19:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731614183; cv=none; b=IfKmRWSmrATfQG5mdEjoLK4LZG6+sMCpRaqs+XgbJuQcVIhKBylnzte9Mn29WcytEeeoYatH739rZPwe+RGG2Y5BORkDpOSSeWQSfL1TW/Rt82Jk2S89Hb2paKYFWkZVgOYvwmdqzv6/rkepEh2MdgIat3ntZOHGtbLcIvxjf5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731614183; c=relaxed/simple;
	bh=Wy3xW519vO58T+WSKMRPU829L1swRSBU7dl9kMYxkFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pFOQrzLGGNjtPvbN+s1sjMK9xIsPaO8BxmQs6VG+otNxZhY7RKWrZAcPOfsxpay5b0Tz7lvaxfIlmTFNPRwXdzTMtwZdKmqxiLf5haGWl4UFnn8cQWSWHHBRFNeYpqsBIPH6t5DGG8MqOICvOCytdI9OKnS6kysJM2qCDzEAtdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MnwIXzxW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A47CC4CECD;
	Thu, 14 Nov 2024 19:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731614182;
	bh=Wy3xW519vO58T+WSKMRPU829L1swRSBU7dl9kMYxkFk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MnwIXzxWtWbzMleIyQv0NcsbvnMJDQZg0Y/dyvRRRKYZ6ne8BfrMAiricyk/EdBHi
	 fdHBHaO4nPLPv5jHhy3FbRnNE+eDriEeG/d+YZHZzar+sFftOqn/ogGJ7tDnkUnlO/
	 RXUO+Yk5K+d/QGfVlsfvRZmktp3hHX+6NrHj8Y6NbnFildOqFY0DNbBJsLBNTN6C/4
	 YGHs7f1lxq4NGNaN3BbLKM+LyJvIp65qHYtrL/KNIEuytIpPSNf4rXUvCOLzc78yHW
	 HyJCb1O6TYoHlrwN1oAsk6UW7WME5q9YW+7tFXtuGhK7V833dwaGUnT3/hfo6815Tj
	 LhVFCTq0lKEhg==
Date: Thu, 14 Nov 2024 19:56:18 +0000
From: Conor Dooley <conor@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Dan Murphy <dmurphy@ti.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: leds: class-multicolor: Fix path to color
 definitions
Message-ID: <20241114-gush-panorama-4b6ece667975@spud>
References: <a3c7ea92e90b77032f2e480d46418b087709286d.1731588129.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ev4BpBTqU2/yBhhC"
Content-Disposition: inline
In-Reply-To: <a3c7ea92e90b77032f2e480d46418b087709286d.1731588129.git.geert+renesas@glider.be>


--ev4BpBTqU2/yBhhC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 14, 2024 at 01:44:29PM +0100, Geert Uytterhoeven wrote:
> The LED color definitions have always been in
> include/dt-bindings/leds/common.h in upstream.
>=20
> Fixes: 5c7f8ffe741daae7 ("dt: bindings: Add multicolor class dt bindings =
documention")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--ev4BpBTqU2/yBhhC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZzZV4gAKCRB4tDGHoIJi
0goxAP9EKRitQOdyEmEvuhoxDKxV9gpzw65us1HaV1RRckhzTQEAhgxVp1ERafJI
Fjpofb/8SMv0x+pQo6a5ZOkvIGFjyws=
=eDMR
-----END PGP SIGNATURE-----

--ev4BpBTqU2/yBhhC--

