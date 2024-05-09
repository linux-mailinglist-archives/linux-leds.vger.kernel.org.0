Return-Path: <linux-leds+bounces-1648-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DFF8C1348
	for <lists+linux-leds@lfdr.de>; Thu,  9 May 2024 18:55:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EEBA1B21326
	for <lists+linux-leds@lfdr.de>; Thu,  9 May 2024 16:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 575638C0B;
	Thu,  9 May 2024 16:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="CLInEngq"
X-Original-To: linux-leds@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EBB6FD0;
	Thu,  9 May 2024 16:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715273715; cv=none; b=rc/HMP89BDWYb/bpqPJebtDG9UMnkLVQbxwHw7GyWor9Hkhfxg0wB0+BL+5u//RAuPevM8XS9Ns7JZXgsSrH1SWfGkKaaEvnT9n0OTASZNKUybNvxcPCiAuAvNw7dVy6cF1stDXCfDYk0uslA04nsp+NHiUhebtr0LS9AaVmxgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715273715; c=relaxed/simple;
	bh=Op4baZkeYx4PycytPYJ+HGzm0cEAn1ct5A+MrtsKREk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=prWC1NADbXc59cJ8v8y5LQIFwoN8esF45UWhlaSxzdO+2VPAnxAZkiPfwPTOv2icQIbcq7nJl4/CVg85ILAZFRGB/U5wR4cWxazw87U4Lx7FLGix8EFvc8TyWfKRZK1EJZd5ATWT9nvpWf+yI8NgX5fsJysPz5NYk+yxP7jYzuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=CLInEngq; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 560121C008B; Thu,  9 May 2024 18:55:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1715273703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4nfZrJNfA4kvIyfocScga5lNL685Pn0IbxsrfCfZxfk=;
	b=CLInEngqiyFo+qFd013o5aB6NcOEoTHidDQg7ZrDKmxUqXp2MLWQ5Yx3ZK3AdrTpN1wemA
	Np3Ru9bRj5VJVPtI+iXo519huoMRvXZHSvrXfe1RNyfbMmNjd6xfnFEyBhOOR0GhHrWij9
	vuI5ZaqjJvsFypEOi/zZJ1QZFimETrs=
Date: Thu, 9 May 2024 18:55:02 +0200
From: Pavel Machek <pavel@ucw.cz>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Frank Wunderlich <linux@fw-web.de>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Wunderlich <frank-w@public-files.de>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: leds: mark label as depected to match
 description
Message-ID: <Zjz/5slQk6XVy3us@duo.ucw.cz>
References: <20240509110545.49889-1-linux@fw-web.de>
 <c461b4cb-2f14-4793-a967-bf08e2b4ab88@linaro.org>
 <fdce3c08-a3cb-4d5b-ad1a-0eeb8761778f@collabora.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dJIDwvg8nV2S1P4B"
Content-Disposition: inline
In-Reply-To: <fdce3c08-a3cb-4d5b-ad1a-0eeb8761778f@collabora.com>


--dJIDwvg8nV2S1P4B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2024-05-09 14:39:36, AngeloGioacchino Del Regno wrote:
> Il 09/05/24 13:46, Krzysztof Kozlowski ha scritto:
> > On 09/05/2024 13:05, Frank Wunderlich wrote:
> > > From: Frank Wunderlich <frank-w@public-files.de>
> > >=20
> > > The description for property 'label' describes it as deprected, so
> >=20
> > Typos here and in subject.
> >=20
> >=20
> > > add a option to mark it like that. Future devicetrees should use
> > > function and color properties.
> > >=20
> > > Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@c=
ollabora.com>
> > > Fixes: 24a71afe05a8 ("dt-bindings: leds: Convert common LED binding t=
o schema")
> >=20
> > Nooo, that's not a fix.
> >=20
> > I don't think there was conclusion to make it deprecated on last attemp=
t:
> >=20
> > https://lore.kernel.org/all/20221122111124.6828-1-cniedermaier@dh-elect=
ronics.com/
> >=20
>=20
> It's not a fix, agreed.
>=20
> But that property being deprecated deserves to be marked as deprecated, a=
nyway.
> Otherwise the documentation shouldn't say in words that it is such.

Fix the docs. We are not ready to deprecate that.

Best regards,
								Pavel

--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--dJIDwvg8nV2S1P4B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZjz/5gAKCRAw5/Bqldv6
8gOgAJ90HGlgqKBZTk9S31H4rqMvmtkIGgCfTlPWwPFlqAonoICOLcwjXQdSPxs=
=UHzF
-----END PGP SIGNATURE-----

--dJIDwvg8nV2S1P4B--

