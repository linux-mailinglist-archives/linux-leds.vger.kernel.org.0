Return-Path: <linux-leds+bounces-6287-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 720E0C7E6B3
	for <lists+linux-leds@lfdr.de>; Sun, 23 Nov 2025 20:48:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1181E344AA7
	for <lists+linux-leds@lfdr.de>; Sun, 23 Nov 2025 19:48:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E81861A317D;
	Sun, 23 Nov 2025 19:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="k678C/+G"
X-Original-To: linux-leds@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1A276026;
	Sun, 23 Nov 2025 19:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763927275; cv=none; b=tueI6ooDkpiHOO/5kSE4twEXlsgrNB4vIjLU3TXZ32RBjOav740SyVF2O1Sqqolbs2Ei+zP7j9cp5R3EzVbsEluTzkKyVhFPDsYSKtmUT8HOzH1g5vGS+ZbHX7HKhKo3STrQoe2QyrbrnktZ1FjA6itWY4emYwPUUC4K+xNXtkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763927275; c=relaxed/simple;
	bh=2vfLX2ig9IpEihKq1Gp06Mygf4BZ/zQfOt4HlCHP1TE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wj9L6h0ejP3MJxgsojJ11FjL0YZvsSsU37nO3kOvgbD22rgOj2sqV5npKGYz+FHVQxO2UxUXbg53GJ9hH8vTQSixtKRkZGhxXObXDVt7rARZgeXmpI7RBkSGFIbddrS6XN/tJwsfkPYG4c4chb24RC/Sxhx9sXnRQEMH92UfI8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=k678C/+G; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id D54F21C00AB; Sun, 23 Nov 2025 20:47:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1763927271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=886E1mOfY18EyVXfYCCSaDjnOSOcLVSy1Or9daJpfjE=;
	b=k678C/+GPObxxiN0hBAXjW01TnBRqCMvISvhrFoiiUjoskq/PxwdZCo4QxGAyWkdrBMaxW
	QZXIEJP0tkw81cqrWNmjccBPn1dbzVBBBI62jgaxqSdvjMGi4yy1TANKm0kykGBAOsOzja
	Ge/MhPF4tk1UMFqh93r4IReFdyBRaps=
Date: Sun, 23 Nov 2025 20:47:51 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Markus Probst <markus.probst@posteo.de>
Cc: Lee Jones <lee@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Igor Korotin <igor.korotin.linux@gmail.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	bjorn3_gh@protonmail.com, Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	linux-leds@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] rust: leds: add basic led classdev abstractions
Message-ID: <aSNk5yD9ouMvvgfl@duo.ucw.cz>
References: <20251008181027.662616-1-markus.probst@posteo.de>
 <20251008181027.662616-2-markus.probst@posteo.de>
 <20251008181027.662616-3-markus.probst@posteo.de>
 <20251008181027.662616-4-markus.probst@posteo.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Cr9FMWmRd8swRDVA"
Content-Disposition: inline
In-Reply-To: <20251008181027.662616-4-markus.probst@posteo.de>


--Cr9FMWmRd8swRDVA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Implement the core abstractions needed for led class devices, including:
>=20
> * `led::LedHandler` - the trait for handling leds, including
>   `brightness_set`
>=20
> * `led::LedInitData` - data set for the led class device
>=20
> * `led::LedClassDev` - a safe wrapper arround `led_classdev`
>=20
> Signed-off-by: Markus Probst <markus.probst@posteo.de>

My knowledge of Rust is not nearly good enough to understand this,
but...

Acked-by: Pavel Machek <pavel@ucw.cz>

								Pavel
--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, Netanyahu and Musk!

--Cr9FMWmRd8swRDVA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaSNk5wAKCRAw5/Bqldv6
8jcyAKCOWAr1SIfoqyFjkkWBQDAobnrnlwCfWaRGBPCeig4/N0r3QbKzfR/y6FU=
=lqh5
-----END PGP SIGNATURE-----

--Cr9FMWmRd8swRDVA--

