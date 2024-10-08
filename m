Return-Path: <linux-leds+bounces-2996-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CAD995778
	for <lists+linux-leds@lfdr.de>; Tue,  8 Oct 2024 21:15:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC70D28949B
	for <lists+linux-leds@lfdr.de>; Tue,  8 Oct 2024 19:15:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0315E212D3E;
	Tue,  8 Oct 2024 19:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="WX7IjV8G"
X-Original-To: linux-leds@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88612139C6;
	Tue,  8 Oct 2024 19:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728414906; cv=none; b=Y54zxVliqKKiaeI7xmr16gOLDOu3t8LoAWq6zJctR1arg7UmVDV3pgMK5K0UGwtFtyqf7VNoBO6mPaWgGLbIatacAdUcglzgNasWmHfn1/+cNS5dxod8nxOkMUhLkgcrahp1t45uOQaCRMQXFSTUzweI/NZWxW/slzXvJe4ABvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728414906; c=relaxed/simple;
	bh=prS89wcRs1TYAU2cj3Y+917IRIMLyK69URTcnbz4Yws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dIp50/3U9JJ5NyzwWHreDDycqShWADUqVOc0M1+4OsMMtfKyGrqVtqbq5hOYljLhClPnxOFuZxEhBJjyG1XQdqT8z1fcZSKeHhhkGBAUzlHiaf8NWZnBL3j2wzceI7wFyM+qJHEAsmvzxBZUdyR0bZISjlxLbGozzuo4I8/mzvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=WX7IjV8G; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id C0C361C006B; Tue,  8 Oct 2024 21:14:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1728414895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=m/w1aogAyOiGPWnSUUY74elVIpm4VgSG30sCYa+lrAI=;
	b=WX7IjV8GUnH4x9RzGfjmufXt6JF/3sghZpcgiV1kJVNBZR2XfmpvO0eSlyaS32/XLewiw1
	d/eKLbmEgeKtC9DcNY6fwJ6oD40Tv/1dOgFc65OiEzgXEoPMsC5kmOGXLl+HzPRsihcfPg
	BkILLvEDgqUQNQ/OXvNSQO5N25B4Jrc=
Date: Tue, 8 Oct 2024 21:14:55 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Heiko Stuebner <heiko@sntech.de>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: leds: Document "rc-feedback" trigger
Message-ID: <ZwWEr6E+Br597eaR@duo.ucw.cz>
References: <20241007205315.2477060-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wKL8NukTjWVemHFV"
Content-Disposition: inline
In-Reply-To: <20241007205315.2477060-1-heiko@sntech.de>


--wKL8NukTjWVemHFV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2024-10-07 22:53:15, Heiko Stuebner wrote:
> Document the "rc-feedback" trigger which is used to control LEDs by
> remote control device activity. This is an existing trigger used in
> existing DTs, document it so validation of those DTs would pass.
>=20
> It was originally introduced into the Linux kernel in 2013 with
> commit 153a60bb0fac ("[media] rc: add feedback led trigger for rc keypres=
ses")
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

Acked-by: Pavel Machek <pavel@ucw.cz>

> diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documen=
tation/devicetree/bindings/leds/common.yaml
> index bf9a101e4d42..9cd89f30fa7c 100644
> --- a/Documentation/devicetree/bindings/leds/common.yaml
> +++ b/Documentation/devicetree/bindings/leds/common.yaml
> @@ -118,6 +118,8 @@ properties:
>              # No trigger assigned to the LED. This is the default mode
>              # if trigger is absent
>            - none
> +            # LED indicates remote control feedback
> +          - rc-feedback
>              # LED indicates camera torch state
>            - torch
>              # LED indicates USB gadget activity

--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--wKL8NukTjWVemHFV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZwWErwAKCRAw5/Bqldv6
8uy1AKCpRg+HFXm1ZzCpM4JnL98g143PYACfV8vxc4pbWM8ru7O58s4QKBnUqBo=
=f5qB
-----END PGP SIGNATURE-----

--wKL8NukTjWVemHFV--

