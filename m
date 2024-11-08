Return-Path: <linux-leds+bounces-3345-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BF29C1A41
	for <lists+linux-leds@lfdr.de>; Fri,  8 Nov 2024 11:14:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B0993B234B6
	for <lists+linux-leds@lfdr.de>; Fri,  8 Nov 2024 10:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4C031E32A6;
	Fri,  8 Nov 2024 10:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="IoMoY/PC"
X-Original-To: linux-leds@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A0B1E2303;
	Fri,  8 Nov 2024 10:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731060845; cv=none; b=LbI9wc5Z7QtEUVpnyRYobGsWA38NIZ/AMJK9wQRZZFqRjj3BmfGVFfl+DeEdeI15wAp+BBv2fcQieHk8BaIgFWtFyDudlXsxgBneXpkb/1k0glR+fdSMGZDtsSSyZCjc0bDHtG0QTDovUx34ea8gr2VUW/0fIOHEJSFNL2T0S/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731060845; c=relaxed/simple;
	bh=atv7eZF400/S0PRnrN2ng0/Ut+7a6hVlyoulpZaKxDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F7UVNoiObrGComIyF8QzZCF2cY3EGoDh1qCzfLXe6ozzgPPQ4OPUvmaHVWp42pvj4O6wMqYHVw0VHJWoQSvtCJfECChKelj+LLOFdBMhFxNFVcTVbHDxUSIwqWWee4RtO5rDdRlmSuzr3Bb9v8rsnUyy/09hMV9V3ymYN4YhgAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=IoMoY/PC; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 28C041C00A0; Fri,  8 Nov 2024 11:13:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1731060834;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Mjuq5+QVoir9yK6E4RzXSjM+k6PwpaQeSdjFdVJCvC4=;
	b=IoMoY/PCVpdrxq+pEPa31EhV/E5ET7xjuDUvh5rLj06C6XLHn4/GofDtKlZK6nEE9mSU2g
	q5E0Hijex84Ps+yj6oan60jidD10sN0JnlgVa7XJqNrFUvEGH3+I3U2CFVujx2hf6FG00v
	Q8+yp6wD0oARXX4B4L2n/rBm01lSD9g=
Date: Fri, 8 Nov 2024 11:13:53 +0100
From: Pavel Machek <pavel@ucw.cz>
To: anish kumar <yesanishhere@gmail.com>
Cc: anishkmr@amazon.com, dmurphy@ti.com, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, Karthik Poduval <kpoduval@lab126.com>,
	Yue Hu <yhuamzn@amazon.com>
Subject: Re: [PATCH] leds: driver for O2 Micro LED IC
Message-ID: <Zy3kYZM0zYIpNcqS@duo.ucw.cz>
References: <20241106015441.995014-1-anishkmr@amazon.com>
 <ZyusEX3Pad8DTAk+@duo.ucw.cz>
 <CABCoZhDAg1LfUZ1XCTFkR=TbHEUn=yOQRqrugzDK5Apge3JVPw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hWdK7WnyXcXtw3BW"
Content-Disposition: inline
In-Reply-To: <CABCoZhDAg1LfUZ1XCTFkR=TbHEUn=yOQRqrugzDK5Apge3JVPw@mail.gmail.com>


--hWdK7WnyXcXtw3BW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2024-11-06 14:03:24, anish kumar wrote:
> On Wed, Nov 6, 2024 at 9:49=E2=80=AFAM Pavel Machek <pavel@ucw.cz> wrote:
> >
> > Hi!
> >
> > > +++ b/Documentation/devicetree/bindings/leds/leds-ozl003.txt
> > > @@ -0,0 +1,23 @@
> > > +*O2 Micro Compact LED Strobe Light Controller
> > > +
> > > +Compact LED strobe light controller, can be controlled by I2C or via=
 a
> > > +PWM gpio controlled.
> > > +
> > > +Required properties:
> > > +- compatible : "o2micro,ozl003"
> >
> > o2micro needs to be registered as a prefix somewhere.
>=20
> Wondering if adding hereDocumentation/devicetree/bindings/vendor-prefixes=
=2Eyaml
> not sufficient? I added that in the same patch though, I guess
> I will have to split the patch to add that first and then the
> driver.

Doing that in same patch is ok, sorry if I missed that.

BR,
								Pavel

--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--hWdK7WnyXcXtw3BW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZy3kYQAKCRAw5/Bqldv6
8t6zAJsF+alO6m5uWe+YyQBQXAf3KKy5jwCfXxCiGcsaVNGZ3AUT3qRYi0rIETg=
=CsZa
-----END PGP SIGNATURE-----

--hWdK7WnyXcXtw3BW--

