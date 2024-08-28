Return-Path: <linux-leds+bounces-2538-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE6A9627AC
	for <lists+linux-leds@lfdr.de>; Wed, 28 Aug 2024 14:48:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA2B31F27F9F
	for <lists+linux-leds@lfdr.de>; Wed, 28 Aug 2024 12:48:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE179176259;
	Wed, 28 Aug 2024 12:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="U7PEpYk2"
X-Original-To: linux-leds@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05059176AB9
	for <linux-leds@vger.kernel.org>; Wed, 28 Aug 2024 12:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724849317; cv=none; b=pWcXdvNjY2SzqBsHmHxWxzK49yZQ69DaQFrgxSN7TGbRBoKTvEEIkNgSJxiOSAelWddRkf6veMTjgICVlNLpAAY4bX7bJJBb4xY1e6E/hGh4AxnnrSkAct8E9iw3O3P/D8xEpjPay/nYEHcIBRg2BueRMv3o0d62y1d/br6SeeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724849317; c=relaxed/simple;
	bh=Hn083/LxdolnBtPZF3XpPFr00kjuT2sfLBzg25HjwSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XBFsoPGt+8Hv4F/ElNDG4vTnBRIaoh6Vb51/lpVSBY6QJysuBitzkkApVLVUYVqV1D01d+4z1AG7fvL781u/5FxNQOuYhvm5n8Lamz+lMv5fioRqqz+XPATOZRDtJ8kPKELziBLBUQJ0wYTnJlbUpZAOObTQuQMAJq4p3iWR7u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=U7PEpYk2; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id C487E1C0082; Wed, 28 Aug 2024 14:48:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1724849305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gIN/+UH4zG5G7x3YyRf9ULwcZkUJAgTRLk1pje5RiPU=;
	b=U7PEpYk2H6DOukYRs6rHztF+SNGyl+UndHIABXvzrUoKlGJSnmAVCH3/I4Sy4paO9Hhp0O
	M0rrFzjvzCbejzRLbpmBynTBjOGmrMLGxMlMA62vp2squnEZIT6UFaUpymR2daB+BbULzS
	twp0czwXBTs3eQ7kd6PMKKA1SodIzFw=
Date: Wed, 28 Aug 2024 14:48:25 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Hongbo Li <lihongbo22@huawei.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH -next] leds: gpio: make use of dev_err_cast_probe()
Message-ID: <Zs8cmTyrfWq2+YLD@duo.ucw.cz>
References: <20240828121353.3696414-1-lihongbo22@huawei.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZvU6O/XKREXyzXTU"
Content-Disposition: inline
In-Reply-To: <20240828121353.3696414-1-lihongbo22@huawei.com>


--ZvU6O/XKREXyzXTU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Using dev_err_cast_probe() to simplify the code.
>=20
> Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
> ---
>  drivers/leds/leds-gpio.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
> index 83fcd7b6afff..d323c2954234 100644
> --- a/drivers/leds/leds-gpio.c
> +++ b/drivers/leds/leds-gpio.c
> @@ -172,10 +172,9 @@ static struct gpio_leds_priv *gpio_leds_create(struc=
t device *dev)
>  		led.gpiod =3D devm_fwnode_gpiod_get(dev, child, NULL, GPIOD_ASIS,
>  						  NULL);
>  		if (IS_ERR(led.gpiod)) {
> -			dev_err_probe(dev, PTR_ERR(led.gpiod), "Failed to get GPIO '%pfw'\n",
> -				      child);
>  			fwnode_handle_put(child);
> -			return ERR_CAST(led.gpiod);
> +			return dev_err_cast_probe(dev, led.gpiod,
> +					"Failed to get GPIO '%pfw'\n", child);
>  		}

Is that correct? child should not be used after put(child) would be my
first guess.

BR,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--ZvU6O/XKREXyzXTU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZs8cmQAKCRAw5/Bqldv6
8kLNAKCNShf77AynaaVBEnpvUnH82ieFtwCgokqMnIXk5KWoM/AghdEpfjIpFKQ=
=hveu
-----END PGP SIGNATURE-----

--ZvU6O/XKREXyzXTU--

