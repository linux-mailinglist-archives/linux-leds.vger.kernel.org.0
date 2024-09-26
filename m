Return-Path: <linux-leds+bounces-2809-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1171C987119
	for <lists+linux-leds@lfdr.de>; Thu, 26 Sep 2024 12:15:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C98CA288401
	for <lists+linux-leds@lfdr.de>; Thu, 26 Sep 2024 10:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CDED189BA7;
	Thu, 26 Sep 2024 10:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="qQv7Goea"
X-Original-To: linux-leds@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CFC1ACDE0;
	Thu, 26 Sep 2024 10:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727345708; cv=none; b=JQA0ySKd0masGjIEtWLhguRyiTw77ineerEd/n2kgYrXX+yYGU+V0pfEjenktm3K01sQUWzE/xySJRqhy+I5VOEihCp61TPkVbadZQo325bl/NuN/KCNTQQDU0Z1+if/JN4UZQjp4/leuveZ7A8uAPHnJi0GbjLt7W8/W0pSkAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727345708; c=relaxed/simple;
	bh=R3ayNeRktz75FfKcJCKAxHTEP/YEfX3ZwqwbQEA0I4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z3eFcJrt1g9CD4HWtUOgi2lORel6PqB/oZNlT8X2EI8vJdUX8uYdOjWUNmukxeHS074CWNU2nuxK3lKnKZvdMvtHB0v42GbqEHCDlyuzZmukdYA13Sw88hE2Q99/ICxtkvs+zBXEICYrW3EMeAPhyGKugXEgVD2W/IiVptTycl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=qQv7Goea; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 968F71C00AD; Thu, 26 Sep 2024 12:14:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1727345696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dCkLjYWr6d0kz4iEcqf7wg1l72cdr7fXFAnDo9rCERM=;
	b=qQv7GoeaeXZEjpbQllsUMunSDPl1w8iA+VfAIUZ9kg53KB0buZZ9ZTLbkWcaKS2nKDfwMn
	PMYdIIAgqTp8SZaTTIbj0bGgG3RmKztfNjWTx0tkHBqgfxDqg2V1lRkGPC55jVyWMNNkF/
	yRTmSfPvrhF19Xie41QkwNzOq8ILCpE=
Date: Thu, 26 Sep 2024 12:14:56 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Dipendra Khadka <kdipendra88@gmail.com>
Cc: avel@ucw.cz, ee@kernel.org, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Staging: leds: replace divide condition 'shift / 16'
 with 'shift >= 16'
Message-ID: <ZvU0IAbrloI5KQNj@duo.ucw.cz>
References: <20240922174020.49856-1-kdipendra88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1NQp9owI+IEKvH/M"
Content-Disposition: inline
In-Reply-To: <20240922174020.49856-1-kdipendra88@gmail.com>


--1NQp9owI+IEKvH/M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun 2024-09-22 17:40:19, Dipendra Khadka wrote:
> Smatch reported following:
> '''
> drivers/leds/leds-bcm6328.c:116 bcm6328_led_mode() warn: replace divide c=
ondition 'shift / 16' with 'shift >=3D 16'
> drivers/leds/leds-bcm6328.c:360 bcm6328_led() warn: replace divide condit=
ion 'shift / 16' with 'shift >=3D 16'
> '''
> Replacing 'shift / 16' with 'shift >=3D 16'.
>=20
> Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>

Reviewed-by: Pavel Machek <pavel@ucw.cz>

BR,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--1NQp9owI+IEKvH/M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZvU0IAAKCRAw5/Bqldv6
8gIhAKDEwwLrurCUqvkAUUVd5EcwZRKUCACghzK4mHfuBb7dj4qe5NGqp6k0Ohc=
=TcrR
-----END PGP SIGNATURE-----

--1NQp9owI+IEKvH/M--

