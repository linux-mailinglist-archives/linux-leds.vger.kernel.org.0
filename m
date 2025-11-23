Return-Path: <linux-leds+bounces-6286-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F161C7E6AD
	for <lists+linux-leds@lfdr.de>; Sun, 23 Nov 2025 20:44:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D59183A64AB
	for <lists+linux-leds@lfdr.de>; Sun, 23 Nov 2025 19:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 133322566F5;
	Sun, 23 Nov 2025 19:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="sUk0To1a"
X-Original-To: linux-leds@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E4D1FF1C7;
	Sun, 23 Nov 2025 19:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763927059; cv=none; b=VifiyHHtDuy4kcA4xlRpkBOYUOKD+h70UE9IRRm+8DPsci8/AuKiXKdRT8RUsjPUnt99W3Pqnha7cetNWv3H2uXKJSLwV7F1PLE7xcHzP9mcwfEUTJsjpT9NjDJDAP8wYPcPJyEintoblvnh0aVRZ1kRbF+x2uAsowFvlUtrBlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763927059; c=relaxed/simple;
	bh=ryp91Z72CHt8hiTBvHcq8LsLXKSXtHCvM/Ajrgzff+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dp6d6PopKD8Jnt9uLdnDbpanFfw/S/gJd1eEmKqw1xq5mMeddXt6fJpXG9+/j5IwzSksIqUy+piXMhCMAkk24jyKDO8MY5XsCHpqYcdduzz+JqrTCp4AAU6Eoqsoxlnb1BLQo5Bs2ZB3YAWzkGjtNyk+BnBhCq4j8CTBAPqE9fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=sUk0To1a; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 5B7E71C00AB; Sun, 23 Nov 2025 20:44:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1763927048;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ryp91Z72CHt8hiTBvHcq8LsLXKSXtHCvM/Ajrgzff+U=;
	b=sUk0To1afsPWYs5t25hE/yEnBZbC7vh0g3sz3mM6O7XVcCizfS11bRLbytyP83yyzGC2lr
	cynbNw6vdJ8RIpawEsRQjMHNwCAklEJGgbD5mgOcXPA+bCnCcGCtw6+TtO1H/XJ9gqJp4X
	mp5I054rbcUVu8gXy+v+LLznWjs0mpc=
Date: Sun, 23 Nov 2025 20:44:07 +0100
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
Subject: Re: [PATCH 1/4] rust: i2c: add read and write byte data abstractions
Message-ID: <aSNkB02mGaquh+g0@duo.ucw.cz>
References: <20251008181027.662616-1-markus.probst@posteo.de>
 <20251008181027.662616-2-markus.probst@posteo.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LsSWzOXRnzv/dDlS"
Content-Disposition: inline
In-Reply-To: <20251008181027.662616-2-markus.probst@posteo.de>


--LsSWzOXRnzv/dDlS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> In addition to the core abstractions, implement
>=20
> * `i2c::I2cClient::read_byte` - read a byte from the i2c client
> * `i2c::I2cClient::write_byte` - write a byte to the i2c client
>=20
> * `i2c::I2cClient::read_byte_data` - read byte data from the i2c client
> * `i2c::I2cClient::write_byte_data` - write byte data to the i2c client
>=20
> * `i2c::I2cClient::read_word_data` - read word data from the i2c client
> * `i2c::I2cClient::write_word_data` - write word data to the i2c client
>=20
> Signed-off-by: Markus Probst <markus.probst@posteo.de>

Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, Netanyahu and Musk!

--LsSWzOXRnzv/dDlS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaSNkBwAKCRAw5/Bqldv6
8nivAJ94WlepgyYcfiXPs0puJCU5vAUspQCgofhVgTF/0OnZjX6vG4Gl53LgVgE=
=7Jc7
-----END PGP SIGNATURE-----

--LsSWzOXRnzv/dDlS--

