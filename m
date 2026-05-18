Return-Path: <linux-leds+bounces-8197-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mE6EIRAnC2pAEAUAu9opvQ
	(envelope-from <linux-leds+bounces-8197-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 18 May 2026 16:49:52 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0630A56F3B3
	for <lists+linux-leds@lfdr.de>; Mon, 18 May 2026 16:49:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DCBFF3078295
	for <lists+linux-leds@lfdr.de>; Mon, 18 May 2026 14:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D3F62D0610;
	Mon, 18 May 2026 14:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ZvSOvHLX"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF2E2D3EEB
	for <linux-leds@vger.kernel.org>; Mon, 18 May 2026 14:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779114823; cv=none; b=hZLRAubTwTjW3gpZ9EI8Dy5BwSRgs/7sor0qOFJ+rqLZ51V5RbKr5w8xjCR8V/TPjiecj1M8F89dQxHy94HqAs9OdnAVJ52g489rxWgPwSC2rknsUYWutt7Yo/stPY2GYnXchIdZmwpX2oAHEnD5DgLHAEARRG3Gd8TzmGz/B5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779114823; c=relaxed/simple;
	bh=eJPl/zXhUpCYop2ExONzTSOkm9uyGEAju8KR7xfzSEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GnvcaleEhNE0ivonr6s2aEcyBugxIOQtpOVF+kUKMI/Gt9tLzziWdVY2On/u6Woshh7mpSltqBDed9B+G3rtf5iQY7YxOoTgRlTuiJlEVdDtRQeYWOgbWa8IdUpJGUbh7slmlIF1sQ4gZbgUClv3sHoF6Mah6sQ+HqdxCBMolXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ZvSOvHLX; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48d146705b4so25639635e9.3
        for <linux-leds@vger.kernel.org>; Mon, 18 May 2026 07:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779114820; x=1779719620; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T2SDu6zdWn+sIZKsBCkye8sIkPDm9xEFNCddyoi7RY0=;
        b=ZvSOvHLXebCGNWGUq6JXROFwRFu5/OwLNx7rcksMrwL7b3gEdsxfWEod5MDdx5i6De
         Yac6+YCQaVdBESC/5vzcmHhvmF43/IPyD40yorCmAFN9j9YI4ZAhoTyMufLT4HUzkj4A
         83Lb5LKUYbPcsfE2c9Q9Nir7d85N4QsuGVQrrh3O3CdPaGyYA8zwHE7wXS33vk+w21Sz
         BOJIH5lR0oYZPKkQEBpCMTg+J75QIeJ5GgbbKrAvc/PF5C9xqjwCTwfz65HKmX6JpGFP
         AwPBXanT3sLJ88uc+4/q4MKUcDZqhXuscd2qwxc4DvCgd3MgUnRhOJolH4GHy+HSNbTe
         TnGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779114820; x=1779719620;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T2SDu6zdWn+sIZKsBCkye8sIkPDm9xEFNCddyoi7RY0=;
        b=cvf+mPkAApbzc9YTYhZPnF0wmN9eLwjKqY2z8TdM+9Xfmr1l8h+jhL/T28PRoiPrMe
         tyFjPCm005WQAPyaR7+CTy6xJdWda/mZy3kgMwLnzrQnvqVrGX81ptSPNFzJ8wm75DKd
         zADC+lUlaLiiBhVFXDwgZZG4oc6lsDKZznNrEKBiPFCTHAeU0oT7qz8rOpFIcsh5eziG
         EaDeSPo7Wmwkks/X/YcnMdkHEiuzRi/icbPS0+5L/cc+busaItPzovdeL1UgwvHoUi6f
         6zBidHruk5lo+AsYhD+G5USi1wuMohpv16f8KojA7WoMrkPuMNTwQRNasUx3son/8LkF
         0NLA==
X-Gm-Message-State: AOJu0YzHe8YcKwlCHj6ItSWaMgMB2EzgZwZHULplHvX+8pS69Nrpyz6g
	+0KM21vDXG14KvQoxi3t4I6qxjk1jW/JG2JFFNCn05lIdejnJxBnwXwZPS2Q2r9fBJq7eMjZ3dp
	azu3P
X-Gm-Gg: Acq92OHeSlg6T/1q4+RmQDL7c66I8Wt1NVNupkqNY1gCcQSIl8OGM8IuZQKKM6gQ8Rk
	IItwPmo01urJLh+ujm3j9PFiE0LRxqEkRiWF0ACH8Wb2mJ5b4xhorpAgZHpoH7NWVmfHjqOSB8O
	ecPeOIdCjvM0Cqdmzs4hp7FWgIKNCepCdg3H7v64nMAbGhZf6XO1g8TjSrwS8TEOLWDC65nPOgi
	vF13/ztI3HOswdKt1CSCTbjdKe7zRmTubSqE5FsfNhWw4OsRF2Ck98/fDGIC5s5nB6R+F+5LXY/
	p8xlvA2NAdHwqVxA/qyEAlXZOxX0atGD2hh4aRg8ka+KsNS28qB25oMYpHxT9ZoNkCvhe9y3FFK
	kOqENBCnK13CtM3rJHl3kMiKmYMch64I0E5NAAFOx132fG6xDixa1yvE9E/wZttWhovoly0lhgv
	0+PAsUa7qY3a5nAIY6UUAx1JAZbv7fCRilI24v35y3NoHIAC6wBNsYnXjRL9zltiTh4Fc=
X-Received: by 2002:a05:600c:491e:b0:48e:978f:c45a with SMTP id 5b1f17b1804b1-48fed455991mr137027185e9.19.1779114819691;
        Mon, 18 May 2026 07:33:39 -0700 (PDT)
Received: from localhost (p200300f65f47db00000000000000081d.dip0.t-ipconnect.de. [2003:f6:5f47:db00::81d])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-48fe5ab3977sm283478885e9.9.2026.05.18.07.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 07:33:39 -0700 (PDT)
Date: Mon, 18 May 2026 16:33:37 +0200
From: "u.kleine-koenig@baylibre.com" <u.kleine-koenig@baylibre.com>
To: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] leds: Use named initializers for arrays of
 i2c_device_data
Message-ID: <agsgRWNCh3oKSKLQ@monoceros>
References: <20260515163325.471175-2-u.kleine-koenig@baylibre.com>
 <b8223eeed0835423b39cfb59e080efb362f347e2.camel@siemens.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="erpskybci55a36dh"
Content-Disposition: inline
In-Reply-To: <b8223eeed0835423b39cfb59e080efb362f347e2.camel@siemens.com>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	FROM_DN_EQ_ADDR(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-leds@vger.kernel.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-8197-lists,linux-leds=lfdr.de];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[baylibre.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,baylibre.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,googlesource.com:url]
X-Rspamd-Queue-Id: 0630A56F3B3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--erpskybci55a36dh
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] leds: Use named initializers for arrays of
 i2c_device_data
MIME-Version: 1.0

Hello,

On Mon, May 18, 2026 at 09:53:42AM +0000, Sverdlin, Alexander wrote:
> On Fri, 2026-05-15 at 18:33 +0200, Uwe Kleine-K=F6nig (The Capable Hub) w=
rote:
> > While being less compact, using named initializers allows to more easily
> > see which members of the structs are assigned which value without having
> > to lookup the declaration of the struct. And it's also more robust
> > against changes to the struct definition.
> >=20
> > The mentioned robustness is relevant for a planned change to struct
> > i2c_device_id that replaces .driver_data by an anonymous union.
> >=20
> > While touching all these arrays, unify usage of whitespace and commas.
> >=20
> > This patch doesn't modify the compiled arrays, only their representation
> > in source form benefits. The former was confirmed with x86 and arm64
> > builds.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@ba=
ylibre.com>
>=20
> the patch looks good overall, except one minor nit below and the fact that
> https://kernel.googlesource.com/pub/scm/linux/kernel/git/lee/leds for-led=
s-next
> branch already has commit c7dd343a37567e650c263d4c068418b0bb82bf79
> ("leds: as3668: Driver for the ams Osram 4-channel i2c LED driver"), whic=
h is
> not converted. Would it make sense to rebase and convert as3668 driver as=
 well?

My tree is based on v7.1-rc1 and I expect to have missed some more
drivers. So I'm well aware that I won't be done with the quest when I
sent one patch per subsystem. I hesitate to base my development on top
of next because I juggle ~100 patches currently and there are more to
come.

I plan to address the missed drivers separately, so my preference would
be to not stop this patch from going in because of that missed driver,
but I adapt to whatever the LED maintainers POV is on that.
=20
> > diff --git a/drivers/leds/leds-lp8501.c b/drivers/leds/leds-lp8501.c
> > index ee4ff4586bc0..946c27fd74cc 100644
> > --- a/drivers/leds/leds-lp8501.c
> > +++ b/drivers/leds/leds-lp8501.c
> > @@ -130,7 +130,7 @@ static struct lp55xx_device_config lp8501_cfg =3D {
> >  };
> > =20
> >  static const struct i2c_device_id lp8501_id[] =3D {
> > -	{ "lp8501",  .driver_data =3D (kernel_ulong_t)&lp8501_cfg, },
> > +	{ .name =3D "lp8501",  .driver_data =3D (kernel_ulong_t)&lp8501_cfg },
>                            ^^
> duplicate whitespace

Ah right, the double space is also in the source and my script kept
that. I fixed that in my tree, so if it comes to a v2 this will be
fixed.

Thanks for your feedback.

Best regards
Uwe

--erpskybci55a36dh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmoLIzcACgkQj4D7WH0S
/k4m6Af8CPH/jHIYSPa54vHkd15rTijpNnrgk34VApYFi1mJ8nbTFpFqMp4R1ETG
OUtwxdu6tPkgBQROKlefk800J4QWec9iteurBoPBkdQxm6T+skOy/8KoYaOztcXQ
oMaa4TuyGXCAmeM0JTc1pehdqo3qIG/SD4P3KlzX+efk9+vvx3t1p9tNlu1YlGsX
3H13p1/sixm8IjGLwQg34MzSV8o4HhqyX3nPJ+C6sgo/4rg9oROCqRgfJqEeoaA1
O2yJJNktfH3ATz9CXFGfdCJlcZQJWN5XEWKupOIJi1QnH2M61vWGhvgj4cLkKIXJ
uc9TodjxvJgruZJY1ltRjPxpO5y73g==
=mcY5
-----END PGP SIGNATURE-----

--erpskybci55a36dh--

