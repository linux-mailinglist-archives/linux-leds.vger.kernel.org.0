Return-Path: <linux-leds+bounces-2985-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8015A993598
	for <lists+linux-leds@lfdr.de>; Mon,  7 Oct 2024 20:01:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 498B828170D
	for <lists+linux-leds@lfdr.de>; Mon,  7 Oct 2024 18:01:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C51BF1DDA3A;
	Mon,  7 Oct 2024 18:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="kukd/hRp"
X-Original-To: linux-leds@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB91F13B294;
	Mon,  7 Oct 2024 18:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728324099; cv=none; b=XcNyFapPbx/7mandlXgEwoPRz1yTnnciQF42Zi3nopubLb9YycSvmH7XOkJoSfoHCHkY5pJUpJlwFDBqYJ+VQkMjrhrfKT3aaE7L0hewtOcCtrVKEeKFU0bv8f3EELKvCUdP/dDD/cgxqEut1punWSPTmy8CpIlE5mHIMHtI8mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728324099; c=relaxed/simple;
	bh=tSxOSj9xeLPsNXwq4MaFou/UBhYu4c1HN0GkaaU3Wwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=glIYxNS8Kr7c68MyCq7YHkULGTnhjFoplloGy6tSJ1IuaNMguPfZ63femDltgk21YhXTKSKlBOzGoIbRA2U+Qk+8OAOaW3WQ4qCLwtlcMq4hcAu8yxJaCHabKp/uR5Gmg22R0/v/luJARDF9IbsHcSQM91IvNAE+DGt5wIYmFr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=kukd/hRp; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 58FC81C0082; Mon,  7 Oct 2024 20:01:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1728324088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W3mOuSpcn4Jd+P9mFpSsD2UWkIjeGYperc8QMBIDESQ=;
	b=kukd/hRpPKsvcr2JMaAqXYlPvQanr5z7Um9QiRHiw1UVIJmDUSVwIbCnLvrx+JWNpUqxCk
	FP+QeBnBsD4Dltsch/iqzpNVcfsDyqr9rk7A5QFXc4G5hzRTDKMFH73I4UP5dR/P6FUXTC
	gWQ3CvhO+OCHPR0qGGqnX+p0w2CBBpk=
Date: Mon, 7 Oct 2024 20:01:27 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Heiko Stuebner <heiko@sntech.de>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: leds: Document "rc-feedback" trigger
Message-ID: <ZwQh99TjfKhoP6UK@duo.ucw.cz>
References: <20241007160804.2447947-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SoKU/aEhMC5BLwbp"
Content-Disposition: inline
In-Reply-To: <20241007160804.2447947-1-heiko@sntech.de>


--SoKU/aEhMC5BLwbp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2024-10-07 18:08:04, Heiko Stuebner wrote:
> Document the "rc-feedback" trigger which is used to control LEDs by
> remote control device activity. This is an existing trigger used in
> existing DTs, document it so validation of those DTs would pass.
>=20
> It was originally introduced into the Linux kernel in 2013 with
> commit 153a60bb0fac ("[media] rc: add feedback led trigger for rc keypres=
ses")

> index bf9a101e4d42..32f9116e03a2 100644
> --- a/Documentation/devicetree/bindings/leds/common.yaml
> +++ b/Documentation/devicetree/bindings/leds/common.yaml
> @@ -119,6 +119,8 @@ properties:
>              # if trigger is absent
>            - none
>              # LED indicates camera torch state
> +          - rc-feedback
> +            # LED indicates remote control feedback
>            - torch
>              # LED indicates USB gadget activity
>            - usb-gadget

NAK. Wrongly placed comment.
							Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--SoKU/aEhMC5BLwbp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZwQh9wAKCRAw5/Bqldv6
8j/LAJ4iVDjFXY+b9G86eJ8EmlPHV/cHnwCePHPHd5BMJWGjFpnKlUYoAHN7wEU=
=B+/t
-----END PGP SIGNATURE-----

--SoKU/aEhMC5BLwbp--

