Return-Path: <linux-leds+bounces-6145-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 35333C5EB85
	for <lists+linux-leds@lfdr.de>; Fri, 14 Nov 2025 19:04:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 652B14F25AA
	for <lists+linux-leds@lfdr.de>; Fri, 14 Nov 2025 17:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1088234A3B0;
	Fri, 14 Nov 2025 17:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ag+mbxCQ"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48BE346790;
	Fri, 14 Nov 2025 17:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763142817; cv=none; b=p+VWO4DF4zl/35pCrUoHqPx1bt3ueKJC4DHSxNiQRu7CBBxt3bSBTv3Xb5S7ShXvk87mIRkmoxGd0TNdxtTwyGpm2Gr8g8gSrwKcnkFmJZ4D70I3nKnGTr3JfiriO8vz4MqKiBJpNbr9Ni5Z5N8LPzCcg8sLEwOJQX6khSn92WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763142817; c=relaxed/simple;
	bh=clFh80UCN2GxmCCAvzH1vFgZDVg9NsNxwAf0FB+VIUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ALjh5U3FvYXz7C1D+gVmmnepTE72frUKihbtZgZ0NZk1YQXwVc1KRmbVreTIgD3aSckyGFePa23Xd5UNh4JfVTZUYWJIRey4u2gh84pW5je1AyuKr+lZ8ha+n4j8Q74dzpePR03Vg0PV1fIVnK4y6Re/Le4ly1VGuqZukYFV2VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ag+mbxCQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C057FC4CEF8;
	Fri, 14 Nov 2025 17:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763142817;
	bh=clFh80UCN2GxmCCAvzH1vFgZDVg9NsNxwAf0FB+VIUE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ag+mbxCQ+Y1v+qaj2r5jSJg7EZB2MlPYmsmqeWPy4NoJKZZ1U99nkwFmZdbbOdOI4
	 HMYNb7KxHLawzU4L58ZZgMXfgltFLBwzbNRlJ7NxKiXdDJ/ESh8Zch/nI2uV2xdX8T
	 LTJjE7I9GOFosy6+5jnxEvajFVOBafJd/CbtKewS/y6m32+i2bqsI+QOarv7XDFOw2
	 tD8cetab1GF0ZlvtuYPiqW3BpVKxdExlvyYR6tML+wddANRUDwsZnWhCVK/4Y3Wm6O
	 1qrlE6wFBLDm1ZlO686NpoEVJ3J/wzkcofQa9v632GInLssJgveAMuxFPCHDCq9D6J
	 O0WZ1qXc0eJ1w==
Date: Fri, 14 Nov 2025 17:53:33 +0000
From: Conor Dooley <conor@kernel.org>
To: Daniel Mack <daniel.mack@holoplot.com>
Cc: linux-leds@vger.kernel.org, pavel@kernel.org, lee@kernel.org,
	robh@kernel.org, devicetree@vger.kernel.org,
	Daniel Mack <daniel@zonque.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: leds: add issi,is31fl3293 to
 leds-is31fl32xx
Message-ID: <20251114-endurance-doorstep-05bd2f5a3877@spud>
References: <20251114094640.4096054-1-daniel.mack@holoplot.com>
 <20251114094640.4096054-2-daniel.mack@holoplot.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="k+9fqS1GSlVhtUIJ"
Content-Disposition: inline
In-Reply-To: <20251114094640.4096054-2-daniel.mack@holoplot.com>


--k+9fqS1GSlVhtUIJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 14, 2025 at 10:46:38AM +0100, Daniel Mack wrote:
> From: Daniel Mack <daniel@zonque.org>
>=20
> This variant supports 3 channels with 4096 brightness steps.
>=20
> Signed-off-by: Daniel Mack <daniel@zonque.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--k+9fqS1GSlVhtUIJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaRdsnQAKCRB4tDGHoIJi
0lrBAQDi+GMjFDYIu/j7b96Vtmi6Bm1mjKGu5B0oc+UqTnmqkQD/V8QnIzuFdCAR
6q5RpaOAUzPnhLXTw2RoHTsHWm2wrAc=
=YyA3
-----END PGP SIGNATURE-----

--k+9fqS1GSlVhtUIJ--

