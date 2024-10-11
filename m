Return-Path: <linux-leds+bounces-3080-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C15899A783
	for <lists+linux-leds@lfdr.de>; Fri, 11 Oct 2024 17:26:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B5FC1C23E79
	for <lists+linux-leds@lfdr.de>; Fri, 11 Oct 2024 15:26:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3053194A6F;
	Fri, 11 Oct 2024 15:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="T9fDsFjR"
X-Original-To: linux-leds@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9968194A65;
	Fri, 11 Oct 2024 15:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728660392; cv=none; b=dV30vereqrW21F7+Ha4XUcMy4IkgNEHFu3gTInqJR4TeFoQRlDgynLRBoKGVLapUKxQJ8dvA01rtMEc0HQP2u02ZLeeFjqyiF6I8tnIHzMegw7hhUNC+beevhJJsVMU5AutsdoWfFCgbjsukMr0aUWpb3WydC8pT+sRVUcocjXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728660392; c=relaxed/simple;
	bh=giPqeOH/RSw1VdB+Wl0PIEL8nT37w/uVSBSFTWm147E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mRRFLmWZguj4OOMmvu3MKwAOxySWYqysMhLRoO8LZ2ASpSsQRwZyhrKm8IDxJzGHeknXJ9hEJMwdqNtR6+3cbn0o51iFtGyPI/2EPayM3bnu8nYfYnY5ydAveC2703X0llE7bb8PYWsV3SSTFEiIfGsJeIcQhTKGDqriLVu/CsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=T9fDsFjR; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id E86621C0087; Fri, 11 Oct 2024 17:26:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1728660388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UcwpcOG8ou2eL058uLGZfB1UfmH7tSswN80Lv6moiw8=;
	b=T9fDsFjRt10r/lCr0AVd952sZi88eGqS8Lr6G/JoLCdJvaHwYLEvmLGQlZyej5maTEu6Hn
	pF6WVrtLS/nplqem0QYFMJ/9F5w8LAk2JFYprMXmdRdXv8CYXe84NZy1Psk1LUa9d9U7JO
	Ig+kDWTIyn+3ta+mn24xzEMg8Exw1a0=
Date: Fri, 11 Oct 2024 17:26:28 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Armin Wolf <W_Armin@gmx.de>
Cc: Werner Sembach <wse@tuxedocomputers.com>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	dri-devel@lists.freedesktop.org, jelle@vdwaa.nl, jikos@kernel.org,
	lee@kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
	miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org,
	onitake@gmail.com, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/1] platform/x86/tuxedo: Add virtual LampArray for
 TUXEDO NB04 devices
Message-ID: <ZwlDpCPhieF3tezX@duo.ucw.cz>
References: <7ce4470c-a502-416a-8472-a5b606bb8fd4@tuxedocomputers.com>
 <d7gk2mgihtg6242l3isnhw3xpdt745ehpu2kvim2xxgmxdhat7@g5cqei7uqujj>
 <39f84cfe-bb89-4194-81a9-e178c93e5309@tuxedocomputers.com>
 <sih5i2ausorlpiosifvj2vvlut4ok6bbgt6cympuxhdbjljjiw@gg2r5al552az>
 <82a6eca1-728c-436f-8c4d-073d8a43ee27@tuxedocomputers.com>
 <5crqia4gecxg62n2m2lf6haiifue4wlxrr3g35dyoaa3svjyuj@cd5bhouz5rlh>
 <4a761cd0-611a-4245-8353-5c66ba133715@tuxedocomputers.com>
 <rszv4p34oivysoyi337dxwooebipiikzd3pyq7rof5r3agbzce@xejutpd4jcfv>
 <06c58141-4aa9-4b54-8ae4-e27069561ac9@tuxedocomputers.com>
 <48a8d62f-ea3f-4f17-b917-ff3aaa83e89c@gmx.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zWKrZbw00MuOib0M"
Content-Disposition: inline
In-Reply-To: <48a8d62f-ea3f-4f17-b917-ff3aaa83e89c@gmx.de>


--zWKrZbw00MuOib0M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > 1.
> > https://lore.kernel.org/all/6b32fb73-0544-4a68-95ba-e82406a4b188@gmx.de/
> > -> Should be no problem? Because this is not generally exposing wmi
> > calls, just mapping two explicitly with sanitized input (whitelisting
> > basically).
>=20
> It would be OK to expose a selected set of WMI calls to userspace and san=
itizing the input of protect potentially buggy firmware from userspace.
>

I don't believe this is good idea. Passthrough interfaces where
userland talks directly to hardware are very tricky.

>=20
> Regarding the basic idea of having a virtual HID interface: i would prefe=
r to create a illumination subsystem instead, but i have to agree that we s=
hould be doing this
> only after enough drivers are inside the kernel, so we can design a
> suitable interface for them. For now, creating a virtual HID
> interface seems to be good enough.

I have an RGB keyboard, and would like to get it supported. I already
have kernel driver for LEDs (which breaks input functionality). I'd
like to cooperate on "illumination" subsystem.

Best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--zWKrZbw00MuOib0M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZwlDpAAKCRAw5/Bqldv6
8mh0AJ0aTptrc+f+mRYy54oz6nrCUGaV6wCfd1a2bQN7AH6mB0+NHPYlLYV1I2s=
=eE0M
-----END PGP SIGNATURE-----

--zWKrZbw00MuOib0M--

