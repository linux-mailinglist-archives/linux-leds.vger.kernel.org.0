Return-Path: <linux-leds+bounces-2784-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DA497D796
	for <lists+linux-leds@lfdr.de>; Fri, 20 Sep 2024 17:39:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0CDE2283143
	for <lists+linux-leds@lfdr.de>; Fri, 20 Sep 2024 15:39:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE1F715E8B;
	Fri, 20 Sep 2024 15:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="rdJoPMV7"
X-Original-To: linux-leds@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D753EAD0
	for <linux-leds@vger.kernel.org>; Fri, 20 Sep 2024 15:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726846794; cv=none; b=uuzcx4OKCz0oKwlvipK1Jf0CE6DVtw3mS3Mf/UWjX4DuMJPsP2EEgf1yyZXQqK84jmsV7UDi+crmuNe45onAVUs6M52znz1StLmvXxyILSnvOKtsm7GAohrxmLThPOCM0w/XxQCXdXYqbajmcPvxBRJE9ecCz6lQvGZov3vMBa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726846794; c=relaxed/simple;
	bh=hrEKd5qYdIJJHiVnibNrCoYzUP7RRynl/8yK9uX9Fz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cc1/kOhtlxU99KKhRTy7IPErbJzDjAQVKiDPf+I0X5avJUWOpAjpVbOTspZGuQVIfe1STAXziLpImwA/89y+y4xv5v3otyOQoENKYSQQm1860UTz6xwALZX4H/yevDLnRPzpGedofRVSzQqtjN8+RY6Meziu67P0px5jNCs/AMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=rdJoPMV7; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 1A4431C0082; Fri, 20 Sep 2024 17:39:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1726846783;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GpSntax0a71BzBcPyV8fnAfymUibBzqEanR8zgahDO0=;
	b=rdJoPMV7MryL8lP7sXu6AsbazWACIuMkANrDN0AHU9HSvkPG34ihzQ6N7/KemzgN5UxBYp
	TFrQwsQD7DWlJrNROTbLYptBO+deKBR/5xWL0TXWc5La6XLci4gdiCfci0UFKIDJtE7AfR
	PUdKPapmCGymej9W/hkruJa5j+rbN3c=
Date: Fri, 20 Sep 2024 17:39:41 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Jonathan Brophy <Professor_jonny@hotmail.com>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Subject: Re: multicolor virtual color LED driver.
Message-ID: <Zu2XPSeAURvXWPbi@duo.ucw.cz>
References: <SN7PR10MB64734F72DBF7CD8374A89EB19F632@SN7PR10MB6473.namprd10.prod.outlook.com>
 <SN7PR10MB647363E3B7F21CB35ECBE6669F632@SN7PR10MB6473.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="62ATRq+oX7zsXBwE"
Content-Disposition: inline
In-Reply-To: <SN7PR10MB647363E3B7F21CB35ECBE6669F632@SN7PR10MB6473.namprd10.prod.outlook.com>


--62ATRq+oX7zsXBwE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

>=20
> I'm wondering if a simple solution would be to create a driver to
> provide virtual colour leds by splitting multicolour or grouped
> singular leds into virtual individual led colours so they can be
> connected to an individual trigger.

I don't believe adding virtual LEDs for this is a good idea.

What about:

1) introduce infrastructure for triggers to work with color, too.

2) introduce "colorful" trigger that accepts three monochromatic
trigggers and combines them in a way you desire?

> Also, of note On color wheels of the RGB (additive) and CMY (subtractive)=
 color models magenta is a standard reference color but is not an available=
 color ID in leds/common.h not so much an issue just a note and I don't kno=
w if such an addition of this color would be a good idea?

That would be "violet". Feel free to add a comment that it is magenta
or something.

Best regards,

								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--62ATRq+oX7zsXBwE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZu2XPQAKCRAw5/Bqldv6
8g4PAJ0eRyp2DP3pH5PAhh+z0drSBD7gawCeIaAYXJMp3KLECNHN9ujD+u5xeAk=
=40ru
-----END PGP SIGNATURE-----

--62ATRq+oX7zsXBwE--

