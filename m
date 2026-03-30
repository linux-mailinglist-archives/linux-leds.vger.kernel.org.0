Return-Path: <linux-leds+bounces-7596-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAUWMgPOyml3AAYAu9opvQ
	(envelope-from <linux-leds+bounces-7596-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 30 Mar 2026 21:24:51 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 482CF3604E6
	for <lists+linux-leds@lfdr.de>; Mon, 30 Mar 2026 21:24:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F2D18301A501
	for <lists+linux-leds@lfdr.de>; Mon, 30 Mar 2026 19:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63E06397E8A;
	Mon, 30 Mar 2026 19:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="p9CQIsQR"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1994397E6A
	for <linux-leds@vger.kernel.org>; Mon, 30 Mar 2026 19:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774898687; cv=none; b=A1rf/sf0a5RzpYlJBpWo2aZoQ8dyZMbHbhXe2zp8lCBTqDvBxfUcTdjRbxtAbHt2yKSjap+Ayg30HxgM/YnCaiLmM+IzbwH1Hhx5tsMQZihI138PMrF/FVdohRHUlZsTUeWjAyHKBl87Mc0JMoqL7HDHpGlTEKUYSAzv9jdFueM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774898687; c=relaxed/simple;
	bh=GTqZJjAxNekbI6GWPy/4PxFdEheBs8+Cuenj+kK8/NU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=O4pBtJu5akVNtYZNQJlhhRxBYvKxn/bL5SpPYeWASuZoPznQhULVDxTMt7Lmdzlwxm9x+daCeW9atkSUaI4gjxDFh2kYkCTvBflNwKE25ZydrODecO6sOKEcDp2qvO81Y7k+8ldLttVHlcDa3la94QsEPj5ZmEX+i23PUw3T7jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=p9CQIsQR; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 43BA4240028
	for <linux-leds@vger.kernel.org>; Mon, 30 Mar 2026 21:24:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1774898684; bh=GTqZJjAxNekbI6GWPy/4PxFdEheBs8+Cuenj+kK8/NU=;
	h=Message-ID:Subject:From:To:Cc:Date:Autocrypt:Content-Type:
	 MIME-Version:OpenPGP:From;
	b=p9CQIsQRz/Sx3utNNGm1rvnJBNS2DUa8Zadage6MzDm2mVEhtri6dDQYoan7U/0lf
	 dJJDY7bJ5s9uVIFJZBIOyyu0urbh4ooWwZ6HtFf7ELGp1MhN19GCAQVK2emcHixGot
	 CZQrre1Hu8UuGajj5ubMlvwiSpvwRO6QGph01oV396g83MLDnYvGDDZ88rSsaRIU8I
	 6GF6p1SVKESiPhIqdWeTu2/WS1NXqKS3/6WNkzsuJhyruEt9KpXu56ms1nfwRqf4+u
	 W7Hq3NbJaAMUBkj8tybWqjePjpWnBALLQWkksRlwt+0dA7xElzFwNCyACL9tET+eWG
	 db0NZU6Bm720Q==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4fl1Qv3xMBz9rxD;
	Mon, 30 Mar 2026 21:24:39 +0200 (CEST)
Message-ID: <11b0bfd729b75d2a3f069124699d503993dfa2dc.camel@posteo.de>
Subject: Re: [PATCH v5 2/4] ACPI: of: match PRP0001 in of_match_device
From: Markus Probst <markus.probst@posteo.de>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Hans de Goede <hansg@kernel.org>,
  Ilpo =?ISO-8859-1?Q?J=E4rvinen?=	 <ilpo.jarvinen@linux.intel.com>, Bryan
 O'Donoghue <bryan.odonoghue@linaro.org>,  Lee Jones <lee@kernel.org>, Pavel
 Machek <pavel@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng
 <boqun@kernel.org>, Gary Guo	 <gary@garyguo.net>, =?ISO-8859-1?Q?Bj=F6rn?=
 Roy Baron	 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg	 <a.hindborg@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross	 <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, Greg Kroah-Hartman	 <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Saravana Kannan <saravanak@kernel.org>, 
	platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-acpi@vger.kernel.org
Date: Mon, 30 Mar 2026 19:24:42 +0000
In-Reply-To: <20260330192207.GA3097402-robh@kernel.org>
References: <20260329-synology_microp_initial-v5-0-27cb80bdf591@posteo.de>
	 <20260329-synology_microp_initial-v5-2-27cb80bdf591@posteo.de>
	 <20260330-bipedal-invaluable-slug-0c6dea@quoll>
	 <e4b194028dcf25b943438615a83bce68b0949e5f.camel@posteo.de>
	 <20260330192207.GA3097402-robh@kernel.org>
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
 keydata=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
 jfGillcaQOqFZ3WwVqyzG1BUfTow==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-Pnhl2CeOPIFq2k/rBTFI"
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[posteo.de,none];
	R_DKIM_ALLOW(-0.20)[posteo.de:s=2017];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,linaro.org,garyguo.net,protonmail.com,google.com,umich.edu,linuxfoundation.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7596-lists,linux-leds=lfdr.de];
	DKIM_TRACE(0.00)[posteo.de:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[markus.probst@posteo.de,linux-leds@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 482CF3604E6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-Pnhl2CeOPIFq2k/rBTFI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-03-30 at 14:22 -0500, Rob Herring wrote:
> On Mon, Mar 30, 2026 at 07:04:21PM +0000, Markus Probst wrote:
> > On Mon, 2026-03-30 at 09:00 +0200, Krzysztof Kozlowski wrote:
> > > On Sun, Mar 29, 2026 at 08:02:16PM +0200, Markus Probst wrote:
> > > > Export `acpi_of_match_device` function and use it to match for PRP0=
001
> > > > in `of_match_device`, if the device does not have a device node.
> > > >=20
> > > > This fixes the match data being NULL when using ACPI PRP0001, even =
though
> > > > the device was matched against an of device table.
> > >=20
> > > Fixes tag?
> > >=20
> > > I don't see how this is going to fix !ACPI case - the
> > > acpi_of_match_device() will just return false.
> > While trying to argue I found out that there already is
> > `device_get_match_data`, which takes PRP0001 into account.
> >=20
> > I will now instead make a patch, which will make rust use this function
> > instead of calling `of_match_device` and `acpi_match_device`
> > individually, which ignores PRP0001.
>=20
> IIRC, the rust binding already gives you the data pointer in probe.
Yes, but that pointer is obtained by calling `acpi_match_device` and
`of_match_device` [1].

Thanks
- Markus Probst

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/rus=
t/kernel/driver.rs?id=3D7aaa8047eafd0bd628065b15757d9b48c5f9c07d

>=20
> > There are still a lot of drivers only using `of_match_device`, which
> > makes it impossible to use PRP0001 with them. But this is not relevant
> > for this driver.
>=20
> Usually using of_match_device() in drivers is wrong. You generally just=
=20
> want the data pointer. There's a whole bunch of drivers still doing the=
=20
> old way.
>=20
> Rob

--=-Pnhl2CeOPIFq2k/rBTFI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEgnQYxPSsWOdyMMRzNHYf+OetQ9IFAmnKzfQbFIAAAAAABAAO
bWFudTIsMi41KzEuMTEsMiwyAAoJEDR2H/jnrUPSIfUP/1ppSFpGjFfnFisk2il+
htSb8YUtl56l+xfCWYr+BKC+aHcrMwopyqU+suEX+QLuba8AmFxzP5VNeLaXiDhL
Eoq+Xt4+KIy9mAidiNyf+Ri6E0fwmr4eZ6a8Nowk1hClj/cdKuEZThmdl93ym+DW
ddvm8mWTKkLzOvHR3/dryTFCHUs8lp43SXclJDnoAvAWMmRfvGjYR4z19JjxR/TN
Azrxpjo5AtSZwaHRhrnJ7WpCrvthKW16f6XlAW5xUoi3jgIut3V+CHvGk0KwcKAc
FHKePspE3xFa4rcGehkaXZ3Gn/xZmK/I2dxJnTXYAvpqMmFjaRVshjC89LHyGJXv
t0qb8JkENd5Yk6/kf/tumDitV4fB1RHBQy6XdWVMkZ24N5h2ZdcD9/+sAvOW/7A+
PcTwqqiZoOLEqDVJd/wgXHcd/kN7h2fHHnJfYQOCqwgInmtbA/KFVXw3Su3P+DQy
gi3zpyU6C4DvWbHZ5cP/ACQ+1zBKYp5MXRnJ6ztSQxdmBx5REs0veZkJ88YwsdgF
crvUV4OrDA1pR7IRQlHsVvAuuvDqyon62HtolzATcFmQpGMzsZbh0u/1GMtD91FI
+FgSis6my0RKpaVxGQ6rKH/ry/JGthcJwpEqSG+FEHU+B8lwTvCBtTyn8OZSjP5S
fnCNq8E3w3Y4xRGhCeDKl6FX
=9PtM
-----END PGP SIGNATURE-----

--=-Pnhl2CeOPIFq2k/rBTFI--

