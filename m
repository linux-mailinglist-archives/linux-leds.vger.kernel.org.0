Return-Path: <linux-leds+bounces-3068-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31745999DCC
	for <lists+linux-leds@lfdr.de>; Fri, 11 Oct 2024 09:24:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0C15286496
	for <lists+linux-leds@lfdr.de>; Fri, 11 Oct 2024 07:24:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE44C20969E;
	Fri, 11 Oct 2024 07:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="H3otn10T"
X-Original-To: linux-leds@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE150209F47
	for <linux-leds@vger.kernel.org>; Fri, 11 Oct 2024 07:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728631392; cv=none; b=grFL/cIfijDXbtC1vuZyiZ+C/0Vt26nUkKshQqO3poSiCCTY9QHxIAKoYtLo3alHO385jOXYvb85emV1SxqixdqI/G09YwAAvKeJF/xv3EFnzzKlYHfcYKLLKVl0OXzgNtDxFSgIAAXoAFwCWEH/jPGE3+ZhxI7/+jwtoDp7z2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728631392; c=relaxed/simple;
	bh=0l+HP1wG7FlvFZBwuf0WJ9dQ/kIrzFUT3ZGyVXRKHKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t8BJWwANA1itbhr1RBDWv6hm4AoMx7P/XyYGt1KInnicbAcSseNNPqGO/FCJIIwPZR7dphqFYOr/VG3YAKGz6l/OdTSY4/iUsmXBxyBj/+Rbma50sZMM1xydlEkJq5oqxUWB9fBYSiEAaHHdGgLU8UIgekJxWq2aPPVEB73ozWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=H3otn10T; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 864F31C0086; Fri, 11 Oct 2024 09:16:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1728631003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Hj5S2Pv5E96aLb9HR/+YI6ws7noD0Ue/KgTdoCW+78U=;
	b=H3otn10TTh3YeZSemWzVCg/cL5nzPEThji4qk4gJiAvotcEaw6YvcXzNdpxiKHRvpKAIRh
	iWUD1riQSs/djnfUnyFjP+7b/z54ysyIiE8coZdujP9XA214Av9DSNjezC3YoyDTbyfYSm
	IRTlVG8rvFIiDqznwXxJsmxpl3Fsnqs=
Date: Fri, 11 Oct 2024 09:16:43 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: Switch back to struct platform_driver::remove()
Message-ID: <ZwjQ202CCspJS1K6@duo.ucw.cz>
References: <20241010203622.839625-5-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="H5q+UlmE7NprfSOa"
Content-Disposition: inline
In-Reply-To: <20241010203622.839625-5-u.kleine-koenig@baylibre.com>


--H5q+UlmE7NprfSOa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.

Would it make sense to wait few years with that? I feel this is going
to cause problems with backports to stable...

Best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--H5q+UlmE7NprfSOa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZwjQ2wAKCRAw5/Bqldv6
8rXmAKCVf6G4aUd6b/r3JKOkT2fHDronBwCeLFySj1D54UONwI5yxRO+p/1ZX3Y=
=AtFB
-----END PGP SIGNATURE-----

--H5q+UlmE7NprfSOa--

