Return-Path: <linux-leds+bounces-2319-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DB393C22C
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jul 2024 14:37:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 155CB1F2117E
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jul 2024 12:37:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A028172BBC;
	Thu, 25 Jul 2024 12:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="TCSS1hFJ"
X-Original-To: linux-leds@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74FED26281
	for <linux-leds@vger.kernel.org>; Thu, 25 Jul 2024 12:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721911063; cv=none; b=VPQ6iql0G9dyw8kLNDOiDXiQtqh6uBCFZxJqIUeSzROHVYMogcn/cpcE7MPcaZH/lYefxziH8Ueznk/Rqx1Li68A8AYOw4lkM5dSubinBRj0xnPAw2/Tg085R5CGmGGscMzEQBUngmWBE5aCjz5QvSk8UP3C+YivtvFPHENtfCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721911063; c=relaxed/simple;
	bh=FBZDULB3JsoLzD9nC3lJ217i9NtM1oMLGKBLw2hv26k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E1namslqFFh0REq5EKqux1/H3Rl6AXy02ODYjzE0mLkmRqFUcqDwHupcdBt2zfDkDLt+2o1ORLsA0Fw1MJRNOyCCRM9H8lLSr87JuTWSAFmmHZxawOaEdxnA7mNHeC+oLTiNdVf0Oy8u0jj0P2UwheEX0PNsDiMDOfWFVJmQPCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=TCSS1hFJ; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 5AE9B1C0082; Thu, 25 Jul 2024 14:37:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1721911058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jliQxEJ+310RKO57b8JdvPiOfbYoHwK/mDOATzuhPMQ=;
	b=TCSS1hFJkyqgBECmTYWdai0d/u1ZaxX9P84w1PegwTuFGw3LVZ82rE2MBbPYCu/GoewwzD
	TYfwTlVTdHYpf/5ewTZrxs1yrpYxamLYBoGFwe27QhRZrXkFxs1Fg5Y0bTxX1OeZI3UTBz
	C0UcvoWDtNjdHpoFHd9ciss44OJ1JHI=
Date: Thu, 25 Jul 2024 14:37:37 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Guilherme =?iso-8859-1?Q?Gi=E1como_Sim=F5es?= <trintaeoitogc@gmail.com>
Cc: Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org
Subject: Re: [RESEND LEDs] leds: remove led_brightness
Message-ID: <ZqJHEdxwEpr5W605@duo.ucw.cz>
References: <CAM_RzfbuYYf7P2YK7H0BpUJut8hFvxa-Sm6hP1BKJe-jVFa62w@mail.gmail.com>
 <20240725102623.GF501857@google.com>
 <CAM_RzfZhySkzDZF-RV=+8rtx0yTs-+qmsRNwwa31nsWRAc40-g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0agi46YoS+GoZg+u"
Content-Disposition: inline
In-Reply-To: <CAM_RzfZhySkzDZF-RV=+8rtx0yTs-+qmsRNwwa31nsWRAc40-g@mail.gmail.com>


--0agi46YoS+GoZg+u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > The includes/linux/leds.h diff:
> > > -/* This is obsolete/useless. We now support variable maximum brightn=
ess. */
> > > -enum led_brightness {
> > > -       LED_OFF         =3D 0,
> > > -       LED_ON          =3D 1,
> > > -       LED_HALF        =3D 127,
> > > -       LED_FULL        =3D 255,
> > > -};
> > > +// default values for leds brightness
> > > +#define LED_OFF  0
> > > +#define LED_ON   1
> > > +#define LED_HALF 127
> > > +#define LED_FULL 255
> > >
> > I'm not aware of the history of this, however I'm even less sure how
> > converting these from an enum to #defines makes this any better.
> >
>=20
> Yeah. The TODO says:
> -* On/off LEDs should have max_brightness of 1
> -* Get rid of enum led_brightness
> -
> -It is really an integer, as maximum is configurable. Get rid of it, or
> -make it into typedef or something.
>=20
> I could only remove enum led_brightness, but in some places, the
> LED_FULL, LED_HALF...
> are used. This is why I created this #defines.
> I don't know what we can do in these cases that LED_FULL, FULL_HALF is us=
ed.
> For example, in the drivers/leds/leds-ss4200.c on line 223 have this code
>=20
> u32 setting =3D 0;
> if (brightness >=3D LED_HALF)
>     setting =3D 1;

Yep. Such drivers should be modified to set max_brightness to real
number of steps hardware can do... then we can remove LED_HALF,
LED_FULL and such defines.

Best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--0agi46YoS+GoZg+u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZqJHEQAKCRAw5/Bqldv6
8tEHAJkBgRKFA4Rmh1fg9hrRniH6jz7kewCghofz95LTSAK+p9hSmIou9ESH5HE=
=mVgH
-----END PGP SIGNATURE-----

--0agi46YoS+GoZg+u--

