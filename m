Return-Path: <linux-leds+bounces-2299-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 810A4938987
	for <lists+linux-leds@lfdr.de>; Mon, 22 Jul 2024 09:03:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 08D1CB2165A
	for <lists+linux-leds@lfdr.de>; Mon, 22 Jul 2024 07:03:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9D318F58;
	Mon, 22 Jul 2024 07:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="jtza6Ude"
X-Original-To: linux-leds@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBE61B7E4;
	Mon, 22 Jul 2024 07:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721631803; cv=none; b=QT86CylWM7GcPdNAD3vlL7PyfkH7kW4Se+d6aGATdEja4kagfMbFkpf19cB6wI1bN+qYzhzXS4G4N4WbGQ/VRmSPAscxOznVlPytyvCksOpRS5uF9wUCRzRPnXhWbHO00pA4EbAGnp0foF/BPzyEISowQeTjuL8T5XvgMwAraoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721631803; c=relaxed/simple;
	bh=ShBZyXMWknpoa59iAm+h0Mt72MjwnZ1B8nbgWWum4Jw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kGmUH7fIbeeAMNrUEjuA8ZMsWtGpeCu48XziafIHLkt7KqOSpLgJS/HjJb7nR2GG8MG5tnC9nqaZSx0VIOLLiA/FTbfcHo1GpMgbxqFcoKaEA3OCnAeO9t49rEsefZpSB7okRB5u9iRbZKZb7N8DVR48aLoHx4qI8+BQsSVxDNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=jtza6Ude; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 407011C0082; Mon, 22 Jul 2024 09:03:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1721631793;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G5b9JmbbVRXaWesq53em1fPE8GKJyeXjrqeEl9g1DOI=;
	b=jtza6UdeMAwKkqZu+6f5wNz+LZEqz+0Wjsuv8Gdk7zioeV6W0YP2AhkjtACBjm4iwmbqPC
	Zc6T1i2hKEx58p8yJjBGdoaPvl9+oalinNxjtpwRqBmdLw45T6iFYypshE6/RJAZWNoeOH
	QlejcLZK3ZaTa9bqlJYa7QGRxnqcLJQ=
Date: Mon, 22 Jul 2024 09:03:12 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>,
	linux-leds@vger.kernel.org, Lee Jones <lee@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] leds: Add LED1202 I2C driverr
Message-ID: <Zp4EMCjTeyqvB5g1@duo.ucw.cz>
References: <ZpzkBM_ZwM8hdwgP@admins-MacBook-Air.local>
 <52544eec-60d0-42fa-bdb0-ffe56627c426@web.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GhT694mItpkNsAiT"
Content-Disposition: inline
In-Reply-To: <52544eec-60d0-42fa-bdb0-ffe56627c426@web.de>


--GhT694mItpkNsAiT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun 2024-07-21 15:55:12, Markus Elfring wrote:
> > The LED1202 is a 12-channel low quiescent current LED driver.
> =E2=80=A6
>=20
> 1. How do you think about to improve such a change description with imper=
ative wordings?
>    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/Documentation/process/submitting-patches.rst?h=3Dv6.10#n94
>=20
> 2. Would you like to avoid a typo in the summary phrase?

Would you like to simply stop commenting on LED patches?

								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--GhT694mItpkNsAiT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZp4EMAAKCRAw5/Bqldv6
8gv3AJoDARbld2e7LPFMKmXIg6pd07dCnACghP01/blE024TaroRdRpL6H64QJw=
=Jav8
-----END PGP SIGNATURE-----

--GhT694mItpkNsAiT--

