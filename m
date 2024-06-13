Return-Path: <linux-leds+bounces-1894-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7CF907468
	for <lists+linux-leds@lfdr.de>; Thu, 13 Jun 2024 15:53:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 83A131C24876
	for <lists+linux-leds@lfdr.de>; Thu, 13 Jun 2024 13:53:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7117722092;
	Thu, 13 Jun 2024 13:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="Q8NwPbyB"
X-Original-To: linux-leds@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0741448DD
	for <linux-leds@vger.kernel.org>; Thu, 13 Jun 2024 13:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718286833; cv=none; b=he00NSiIYlsV1/YBftdKVUk/eO2WD3s2OXPHorr28CzkkJhcZeidAE6wQjCFGBAw/l8BHmVJWEgPPNw+r3eHQYVzRfxPupbUbfg961XXFpFKksWye4x87IGn0j9RMnK1eCGTF8LeNdB/Dez1DbSv/mwzZ4gt769wBMGWVJA/+Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718286833; c=relaxed/simple;
	bh=L0MCTgUDAIzpKQqDRTFw+JeC+PiijJMhtazs05XMgFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M6+3bQuf5/0WgRkn8EhMS2z2EJzkvu1sjUEXoeYcvkeloDz+rE4Mx5XYQRQlv66ZjlswgT7vX5aDnUOs0SQrYMfwh/aTdXLypX2rFq+q+j/Odmo8fg6ik8l/3gwWljC5WaXmQW6YLdbtyFDKITtz3ieyETdjpaM3qNq5KpE1vak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=Q8NwPbyB; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id C3BFF1C009C; Thu, 13 Jun 2024 15:53:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1718286828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QniCRfRtnYLs7YiTiysw5MWjqf6aDhy/9YpW05z3r2c=;
	b=Q8NwPbyBEZaBoUH88KXpa2lg9RGrRu9e9Q0w47DyGJH7F/YaYBdyCXOr4BFcJAQSsRUn1S
	VRjrv+mtMYA3leKuo9sbO36ygDgIdqOkZgP5y0Zwx2mz0aGjCqqHS015r78YZrPc5pWo4D
	Ud5ceOOiEShPglTW+eMSwptY2FvqEY0=
Date: Thu, 13 Jun 2024 15:53:48 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Lee Jones <lee@kernel.org>
Cc: Joseph Strauss <jstrauss@mailbox.org>, jansimon.moeller@gmx.de,
	conor@kernel.org, christophe.jaillet@wanadoo.fr,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH v7] Add multicolor support to BlinkM LED driver
Message-ID: <Zmr57Iyd9UHWUYy9@duo.ucw.cz>
References: <20240506201905.789376-1-jstrauss@mailbox.org>
 <20240531103840.GC1005600@google.com>
 <20240531232031.u5mphuqrwin533rj@libretux>
 <20240613134933.GC2561462@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Cl1ui5TmjAwn4fK2"
Content-Disposition: inline
In-Reply-To: <20240613134933.GC2561462@google.com>


--Cl1ui5TmjAwn4fK2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Pavel's for-next branch is 18 months old.
>=20
> Use Linux -next.
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/

LED SUBSYSTEM
M:      Pavel Machek <pavel@ucw.cz>
M:      Lee Jones <lee@kernel.org>
L:      linux-leds@vger.kernel.org
S:      Maintained
T:      git git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.=
git

I guess we should get the MAINTAINERS entry updated.

Best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--Cl1ui5TmjAwn4fK2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZmr57AAKCRAw5/Bqldv6
8srbAJ9l4vEqYOVAALnanlT2sHB2YRZb9ACeNVip1HgbmwpeZkyXxUdo9Fq6wgg=
=aOwy
-----END PGP SIGNATURE-----

--Cl1ui5TmjAwn4fK2--

