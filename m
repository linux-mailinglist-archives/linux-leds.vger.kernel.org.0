Return-Path: <linux-leds+bounces-7791-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IG2jH3mm52lS+wEAu9opvQ
	(envelope-from <linux-leds+bounces-7791-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 21 Apr 2026 18:31:53 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3E843D5E0
	for <lists+linux-leds@lfdr.de>; Tue, 21 Apr 2026 18:31:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DF1D03021993
	for <lists+linux-leds@lfdr.de>; Tue, 21 Apr 2026 16:29:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46CB8376BD3;
	Tue, 21 Apr 2026 16:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="sJHjuTv9"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B371626AA93
	for <linux-leds@vger.kernel.org>; Tue, 21 Apr 2026 16:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776788997; cv=none; b=gh91mBdCR9yc/5iHdZ4Fx5GOf11u5gmgvjt1KYhLnujRIL9NMKo1skFudUuLcB7wiMps6y4uX07+v03rTv2vbVYV30Lc6lgZYTMSmJjaXJWp45jYvKjqwwgsUI9859I8kAVq+M/m1KdIlHaUTKFxucKs5MVGkMSyK6ccLcSgp2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776788997; c=relaxed/simple;
	bh=uWBNbqa5WKE0MqfPGoR0yUspQbrhBWVcvO5ku1Y2xk0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hsOT2HR54FvSfElrN/a9QDPiWYr0IwyfebqJqNR6RQTdr8UMwAzL2HnkqiTITovuaAdsE/sDxl6AGXi/CwaSbGf6FbI3+Eco27Jqm1zbG1RTby+7ahkZwVfH8EFohSOUpLde+ZRaA2yuT4IdKBCOrE4SZC9J9zyQpQm2wgT9JS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=sJHjuTv9; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 305F8240027
	for <linux-leds@vger.kernel.org>; Tue, 21 Apr 2026 18:29:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1776788994; bh=NqSyv49+hgO5nP72gIJxJRJnsm6fOojsO6RRlXj5248=;
	h=Message-ID:Subject:From:To:Cc:Date:Autocrypt:Content-Type:
	 MIME-Version:OpenPGP:From;
	b=sJHjuTv9E+Ee9Vlp3hxrrZT4KoxmbdV9Rm8CxbI5VwDWuZiPabc2TLjf7bdCNul1w
	 uRCVuzRUrb+QaUCOtKniLG8eg8PEP9qvvQ4d/V+APud3ogEeGzmLbXXRAOj6v87nG0
	 EZ8Iye81Id5YzaT0FMb4oULgqzoSboGF9TKQzbKwiAEqN5XWp9mE7gG7wOj3TvpuML
	 ZRX0K3GjUCwj4u0eQKZRwSn4L2Ybvsj9KK85Aao4mKVrPI2ZLR5UXW6Z2cK9EQ9B8c
	 Psm+pUerLnzmjlHdT5JWVawmi4+BwL+DSkpACh74EA7m/kksohIYvgxOewJ5w9vgAq
	 qoZF37ioZ0FGw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4g0SW363qtz6tw1;
	Tue, 21 Apr 2026 18:29:51 +0200 (CEST)
Message-ID: <7bb65d98aad028bd4f430985b617d4cb61b31032.camel@posteo.de>
Subject: Re: [PATCH v8 2/2] platform: Add initial synology microp driver
From: Markus Probst <markus.probst@posteo.de>
To: Krzysztof Kozlowski <krzk@kernel.org>, Hans de Goede <hansg@kernel.org>,
  Ilpo =?ISO-8859-1?Q?J=E4rvinen?=	 <ilpo.jarvinen@linux.intel.com>, Bryan
 O'Donoghue <bryan.odonoghue@linaro.org>,  Lee Jones <lee@kernel.org>, Pavel
 Machek <pavel@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng
 <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?ISO-8859-1?Q?Bj=F6rn?=
 Roy Baron	 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg	 <a.hindborg@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross	 <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, Rob Herring	 <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley	 <conor+dt@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Date: Tue, 21 Apr 2026 16:29:53 +0000
In-Reply-To: <00486b10-4c0b-420b-a735-67c3164eeb24@kernel.org>
References: <20260420-synology_microp_initial-v8-0-7946a9124491@posteo.de>
	 <20260420-synology_microp_initial-v8-2-7946a9124491@posteo.de>
	 <00486b10-4c0b-420b-a735-67c3164eeb24@kernel.org>
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
 keydata=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
 jfGillcaQOqFZ3WwVqyzG1BUfTow==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-IpSPnhQIWO4AeFAyD3CO"
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
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[posteo.de:s=2017];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7791-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,linaro.org,garyguo.net,protonmail.com,google.com,umich.edu,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[posteo.de:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[markus.probst@posteo.de,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,posteo.de:dkim,posteo.de:mid]
X-Rspamd-Queue-Id: ED3E843D5E0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-IpSPnhQIWO4AeFAyD3CO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-04-21 at 17:33 +0200, Krzysztof Kozlowski wrote:
> On 20/04/2026 16:24, Markus Probst wrote:
> > +        // pineview
> > +        (DeviceId::new(c"synology,ds710p-microp"), Model::new().led_es=
ata()),
> > +        (DeviceId::new(c"synology,ds1010p-microp"), Model::new().led_a=
lert(Color::Orange)),
> > +        (DeviceId::new(c"synology,ds411p-microp"), Model::new()),
> > +
> > +        // r1000
> > +        (DeviceId::new(c"synology,ds923p-microp"), Model::new()),
> > +        (DeviceId::new(c"synology,ds723p-microp"), Model::new()),
> > +        (DeviceId::new(c"synology,ds1522p-microp"), Model::new()),
>=20
> What is this all doing here? Again, what is the fallback and front
> compatible?
>=20
See previous comment. There was no separation between them until now. I
will fix that.

> Why do you keep duplicating all this when I asked to REMOVE
> the completely unnecessary front compatibles?
I can't recall you asking that. My apologies if I missed that.

So only keep the fallbacks and only add a front compatible if a
unexpected difference comes up?

Thanks
- Markus Probst

>=20
> So it is not only schema which is wrong, but your driver makes no sense
> with it.
>=20
> Best regards,
> Krzysztof

--=-IpSPnhQIWO4AeFAyD3CO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEgnQYxPSsWOdyMMRzNHYf+OetQ9IFAmnnpf8bFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJEDR2H/jnrUPSC6MP/R5ysnQ7psw/bPhKI5Xz
/Fyvv0hTuESgvMae7SYERG6PjDXYKhgMSGz4OuEj8aoZK9kstYgMqVFIDlZvCrrp
1/iyx82q68aPTi2Q4PSZrY85bENXGrum4JeyW6H7OHmOsJjHlXRjlECzliYGSkbG
cpXr+h+Qd0ItibDj6BU4VsHdaQdL9drvbfNennrjOio5sFDNYpfo3QlMBUIjuRqL
c36+qdGLbzck4fZUJHdlOp5paqQjJ2tPw4ReAP5EcKXA72jS5tOp+ju6ZGUG9y6R
Ivos5iLibPfh4VkOowIOZkt2BbuthvoiSspIj5620mX64k+fQoegGA1vrK0vx4sw
MYqjqOurB2k4YMcCUNwRJAivK2VUkFu8mewvApgrJC3arLr9O91wfH7aak6I6Qe7
Zqn0J9dLGlOlK3ORCxAe1mzKkvbSxVEzwBwoxykfpKLH8D2Ynj029LfcOFzcGNwd
XxEiZj8bIzul4KRqZZtqoFZCToIHHCgab6R/jsrqtGMc8NPUShUH+vmDgRMPVbCr
Xqc+0NngWTbnJt3oTKTkWe1WO6QmpSr0pFvTotjR5lAIY5LnMkgokznzlrekA500
1wbFKcy1nQN3PyzvRLeoVI7uYR/xYHXznJ7YkljxY12eNp+0IH5BRRy2v1XcXZju
sWwaBMkd68VbwwGEggbMGMnv
=C+e7
-----END PGP SIGNATURE-----

--=-IpSPnhQIWO4AeFAyD3CO--

