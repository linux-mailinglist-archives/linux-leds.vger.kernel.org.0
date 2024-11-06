Return-Path: <linux-leds+bounces-3320-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF739BF493
	for <lists+linux-leds@lfdr.de>; Wed,  6 Nov 2024 18:49:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1B82286AD7
	for <lists+linux-leds@lfdr.de>; Wed,  6 Nov 2024 17:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF14620721C;
	Wed,  6 Nov 2024 17:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="gcj3HTZ7"
X-Original-To: linux-leds@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D98F205137;
	Wed,  6 Nov 2024 17:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730915351; cv=none; b=QuS10lptNcoTF0VMrO4FPuDUTrxAfjmy71M1LgiVEZQ/Q7z/ArlENNn1/FkzK0u9QJtQtDnC/3zE9+4VROl5H8Y+KVSo3UooJHZDbBgvUFy3sEUbKOhUcD8/n2Z9Bvqqz6ROwYNKbHN/qq6QJSDEOUd70FjlGtMsMYAMm+QTwq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730915351; c=relaxed/simple;
	bh=rZ0AHnFlkPojxV8zDLmE7gXqcPz0Hc1o+TSxHoEAZBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RH2d2aMexWGqUl1fWFe0mavT2N5jLraWhtRro2c2dBYR17U2ImaaXP8BXGVvYLIE7hrucIIz6cR1EPkyUQXHwicsUAvpUWReh7IMOYe1igfes96hrvrFEnTmm1ijUHgBafMvNAejXcNXNhfFP0RJCfbJkrSMCP6w0SPtw5lzJmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=gcj3HTZ7; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 33AF61C00A8; Wed,  6 Nov 2024 18:49:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1730915346;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qrqxqbGgbhGqhX5NKtxPAjB1Ah5iqmFvP6g0rlkAXFE=;
	b=gcj3HTZ7ZpwPKj7DPl19zsYplL4Cq4z5Yi7Q1RACgd0Kzse7ZWCXgdkFJOPetMHFV3//kR
	yUoOdSNatYVwPWBfqY7bgTFkeoY/VbClTxphi5i770e/LUoNMIrX3vHbFzPbiBTmUdedzp
	/r9g1laAU2V/Xwee6NUYbz9bfcaWvD8=
Date: Wed, 6 Nov 2024 18:49:05 +0100
From: Pavel Machek <pavel@ucw.cz>
To: anishkmr@amazon.com
Cc: dmurphy@ti.com, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, Anish Kumar <yesanishhere@gmail.com>,
	Karthik Poduval <kpoduval@lab126.com>, Yue Hu <yhuamzn@amazon.com>
Subject: Re: [PATCH] leds: driver for O2 Micro LED IC
Message-ID: <ZyusEX3Pad8DTAk+@duo.ucw.cz>
References: <20241106015441.995014-1-anishkmr@amazon.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ihaWzg01fV8LJLgH"
Content-Disposition: inline
In-Reply-To: <20241106015441.995014-1-anishkmr@amazon.com>


--ihaWzg01fV8LJLgH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> +++ b/Documentation/devicetree/bindings/leds/leds-ozl003.txt
> @@ -0,0 +1,23 @@
> +*O2 Micro Compact LED Strobe Light Controller
> +
> +Compact LED strobe light controller, can be controlled by I2C or via a
> +PWM gpio controlled.
> +
> +Required properties:
> +- compatible : "o2micro,ozl003"

o2micro needs to be registered as a prefix somewhere.

Best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--ihaWzg01fV8LJLgH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZyusEQAKCRAw5/Bqldv6
8oqkAJ9rllItCguh3nlqL4LAaohv1Gu6UQCbBwNsNov+8NZVoL4YQc29I8fRiYs=
=bOme
-----END PGP SIGNATURE-----

--ihaWzg01fV8LJLgH--

