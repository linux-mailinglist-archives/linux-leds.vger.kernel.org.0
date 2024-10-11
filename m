Return-Path: <linux-leds+bounces-3074-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AC599A2A8
	for <lists+linux-leds@lfdr.de>; Fri, 11 Oct 2024 13:25:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D150D284D6F
	for <lists+linux-leds@lfdr.de>; Fri, 11 Oct 2024 11:25:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A22121500F;
	Fri, 11 Oct 2024 11:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="JBukDB9B"
X-Original-To: linux-leds@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEEB1CF5F1;
	Fri, 11 Oct 2024 11:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728645903; cv=none; b=nKba7PmDWSuJ0EUd/F5w8lqtPoHshd7UFJFeCZ4D7GfzN4PCrU53HquPMuJN3uLzuCyR6naTxQR0G8Mj9s+sdZzZ1Q29PZQQJIecCD/1OXF8Gum0RngFmeLk3TbA2E0ZyYClJ7P9Oj5EkVe2MJXT6ZRC099qjJuZu7+nv+gugfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728645903; c=relaxed/simple;
	bh=rHWDZP67p5KvM29gjiRDBXEVwUawL4jd4IATcpTJ+rY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uk1EKzrPG28Gn3DkpJyog74cqugmEzcOrp8PHHG0dqf1qcEqqIJHQWbElgO7Qm+QOBp2i9Ss37ITlle6HjNrHElWYtzp5TYQdlhqG2YCuj8pVLYY0xlqNGxVUUElktXWlst+uVLpTTMQ9XRxhSC5/GrVveIBNQwYwp51kYr6BQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=JBukDB9B; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 0D82B1C0083; Fri, 11 Oct 2024 13:24:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1728645897;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lWUlZbBxnHYv/EqT5fXTqNIxfg9Dp/MfkJopnlzve6U=;
	b=JBukDB9B5uJ8j2by7yB/Wy0WPBTouphUNbaYHVZ7rk/COrf0KswggA7loNXhUZxWn4oLGL
	XMLYcKkOw6+5cCZ6L5GA8ggFReQ3Sg+srupx7Jl5sbJ5Wpiq70UBLLABo2UcpY8dV4aIm2
	pzrFY9TRvhZj79ESeDwebcchNGswGcM=
Date: Fri, 11 Oct 2024 13:24:56 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Lee Jones <lee@kernel.org>
Cc: Dipendra Khadka <kdipendra88@gmail.com>, avel@ucw.cz,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Staging: leds: replace divide condition 'shift / 16'
 with 'shift >= 16'
Message-ID: <ZwkLCE9x5DWtaaJU@duo.ucw.cz>
References: <20240922174020.49856-1-kdipendra88@gmail.com>
 <20241009133643.GI276481@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Gm61JvJwIe1QCBMX"
Content-Disposition: inline
In-Reply-To: <20241009133643.GI276481@google.com>


--Gm61JvJwIe1QCBMX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Staging!  Why Staging?
>=20
> On Sun, 22 Sep 2024, Dipendra Khadka wrote:
>=20
> > Smatch reported following:
> > '''
> > drivers/leds/leds-bcm6328.c:116 bcm6328_led_mode() warn: replace divide=
 condition 'shift / 16' with 'shift >=3D 16'
> > drivers/leds/leds-bcm6328.c:360 bcm6328_led() warn: replace divide cond=
ition 'shift / 16' with 'shift >=3D 16'
> > '''
> > Replacing 'shift / 16' with 'shift >=3D 16'.
>=20
> More info please.
>=20
> - What is the current problem you're attempting to solve?
> - How does this patch help with that?
> - What are the consequences for not applying this fix?

Take a look at patch. Doing shift / 16 when testing on >=3D 16 is just
ugly. It is simple cleanup.

Reviewed-by: Pavel Machek <Pavel@ucw.cz>

Best regards,
						Pavel

> > @@ -113,7 +113,7 @@ static void bcm6328_led_mode(struct bcm6328_led *le=
d, unsigned long value)
> >  	unsigned long val, shift;
> > =20
> >  	shift =3D bcm6328_pin2shift(led->pin);
> > -	if (shift / 16)
> > +	if (shift >=3D 16)
> >  		mode =3D led->mem + BCM6328_REG_MODE_HI;
> >  	else
> >  		mode =3D led->mem + BCM6328_REG_MODE_LO;
> > @@ -357,7 +357,7 @@ static int bcm6328_led(struct device *dev, struct d=
evice_node *nc, u32 reg,
> >  		break;
> >  	case LEDS_DEFSTATE_KEEP:
> >  		shift =3D bcm6328_pin2shift(led->pin);
> > -		if (shift / 16)
> > +		if (shift >=3D 16)
> >  			mode =3D mem + BCM6328_REG_MODE_HI;
> >  		else
> >  			mode =3D mem + BCM6328_REG_MODE_LO;
> > --=20
> > 2.43.0
> >=20
> >=20
>=20

--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--Gm61JvJwIe1QCBMX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZwkLCAAKCRAw5/Bqldv6
8ijxAKC7bhRUqfGi35p3IpsOqzCMgckaGQCgkig1nCxiOYlJNNv9SaqKOQoU2GM=
=zUDw
-----END PGP SIGNATURE-----

--Gm61JvJwIe1QCBMX--

