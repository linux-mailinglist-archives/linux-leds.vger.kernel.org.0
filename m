Return-Path: <linux-leds+bounces-7343-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNIHBjdVtWnAzQAAu9opvQ
	(envelope-from <linux-leds+bounces-7343-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 14 Mar 2026 13:31:51 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7164D28D269
	for <lists+linux-leds@lfdr.de>; Sat, 14 Mar 2026 13:31:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B14B301AF46
	for <lists+linux-leds@lfdr.de>; Sat, 14 Mar 2026 12:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71AB4202F65;
	Sat, 14 Mar 2026 12:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="onQdP31J"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864111A9FAF
	for <linux-leds@vger.kernel.org>; Sat, 14 Mar 2026 12:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773491508; cv=none; b=h1ZUZZtVyQcT655Ls3nqpYL4nFS6Y6vKEf4gtyS2THknvoJEr/9kn1vB8FB/nETZ0a1/y3LhNRYuGFvXDIylUYswj815SiBpxM+vZ76gTWeLUILiwWFUrXeBOuCTLVmXGHlQUkiuNaYMZFYNVGJAAMGkjN8Kw2JoaydcsVB1OaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773491508; c=relaxed/simple;
	bh=ymnt/NWDGkNqoUIBq0vbjXm6EpNS9Aqr8moYdTzESqM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XhdQwOZB79mgLgavOP6dyNWyRmTTmQYj4J03lXOTFfJsg9pJgrcrmwO7noG2nI2XF1T49T+pKcH5fQgjT4iXCOpmiIGp0x2bfdqBm17jJHmf6r3jsNn8s5wmKh0jENvXpTh8afWmqsECFsdM415SByOmrIIonxw4Itm5tOC0ZyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=onQdP31J; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id DB748240106
	for <linux-leds@vger.kernel.org>; Sat, 14 Mar 2026 13:31:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1773491504; bh=q2dLmprXXF4mEzJHnhT896dDscoHqOY/k5KCoI0lfzg=;
	h=Message-ID:Subject:From:To:Cc:Date:Autocrypt:Content-Type:
	 MIME-Version:OpenPGP:From;
	b=onQdP31JL9kQH55J170ITPp7yb4J/ZB9hKj7Xiz7y9dvLjvn5HFSLfD94zEVLg6wt
	 zG2vn40X5mwpvc2N84aS7AaamycGVAdQR5oaHuM4VGwbbHiLr2HFrIrc1M57IpDeR8
	 +kTJ2NVeeJUCx6A8Teg3FmNAn6d/Zj+jJ/cc00lq8vSK2MJCx+AiwVUc6rFsJh1R5s
	 X39yoNRDK9OU0caxgE+VeU9+w+2BY8SFSA5JepJwkg8LxgcTgr4Qs0dhx/XMpo1Aek
	 /sFJieBB4Vt65LzfAbirVxxyUfsvXSbGjt9RKQ9lvP/6vJ0gh4m9ejBW5JuMCr5Wm+
	 3eBgt71mQbNSA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4fY11l3nCGz9rxS;
	Sat, 14 Mar 2026 13:31:39 +0100 (CET)
Message-ID: <97c64ee64734debae475716b4d588dee59889f70.camel@posteo.de>
Subject: Re: [PATCH v3 5/7] dt-bindings: mfd: Add synology,microp device
From: Markus Probst <markus.probst@posteo.de>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley	 <conor+dt@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Miguel Ojeda <ojeda@kernel.org>, Boqun Feng
 <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,  =?ISO-8859-1?Q?Bj=F6rn?=
 Roy Baron	 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg	 <a.hindborg@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross	 <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, "Rafael J. Wysocki"	 <rafael@kernel.org>, Igor Korotin
 <igor.korotin.linux@gmail.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?=	 <kwilczynski@kernel.org>, Pavel
 Machek <pavel@kernel.org>, Len Brown	 <lenb@kernel.org>, Robert Moore
 <robert.moore@intel.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-pci@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev
Date: Sat, 14 Mar 2026 12:31:43 +0000
In-Reply-To: <336523bb-615b-451b-8681-c965bf579203@kernel.org>
References: <20260313-synology_microp_initial-v3-0-ad6ac463a201@posteo.de>
	 <20260313-synology_microp_initial-v3-5-ad6ac463a201@posteo.de>
	 <02e0772d-ba65-4eb8-8453-e0b3eaa4af96@kernel.org>
	 <6f2298f3298dc81e6e2ed34ca43424fc39ce3518.camel@posteo.de>
	 <336523bb-615b-451b-8681-c965bf579203@kernel.org>
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
 keydata=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
 jfGillcaQOqFZ3WwVqyzG1BUfTow==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-QgeV7XmAqUUPZhNVaoPn"
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7343-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,collabora.com,intel.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[posteo.de:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[wikipedia.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,posteo.de:dkim,posteo.de:mid]
X-Rspamd-Queue-Id: 7164D28D269
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-QgeV7XmAqUUPZhNVaoPn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2026-03-14 at 09:49 +0100, Krzysztof Kozlowski wrote:
> On 13/03/2026 21:29, Markus Probst wrote:
> >=20
> > > This is not an "MFD" device.
> > It now uses the MFD APIs. By the definiton of @Lee (assuming I
> > understood it correctly), this device should now qualify as "MFD"
> > device.
>=20
> No. Using Linux framework does not make this device MFD, since there is
> no such term of hardware as MFD. Otherwise please explain or link to
> verifiable external source describing what sort of device class is MFD
I assumed these comments would also apply for the dt bindings:
-
https://lore.kernel.org/rust-for-linux/DGYAFNSJ7576.1E0JZ2W499ZQ7@kernel.or=
g/
-
https://lore.kernel.org/rust-for-linux/20260309151555.GU183676@google.com/

given that using linux MFD APIs also changes the structure of the dt
bindings with added sub-devices.

But it seems no?

> because for sure this is not MFD how Wikipedia defines it.

Wikipedia defines it as a synonym for a "multi-function
product/printer/peripheral"
https://en.wikipedia.org/wiki/Multifunction_device

>=20
> >=20
> > > > +
> > > > +    mcu {
> > >=20
> > > Please read previous comments.
> >=20
> > You are likly trying to refer to this comment from you:
> > > Depending what this is. MCU is generic purpose unit where you load
> > your
> > > different FW for different purposes and you have here specific - to
> > > handle certain aspects of this entire machine. This looks like EC, so
> > > should be called embedded-controller and placed in that directory.
> > Synology uses Microchip PIC for this purpose. On a Synology DS215j, it
> > uses a "Microchip PIC16F1829". At least to me, this looks like a
>=20
> It does not matter what chip is used. Every component uses some sort of
> chip.
I would be interested in what does matter then.

I did not actually find an exact definition for what
Documentation/devicetree/bindings/mfd
and
Documentation/devicetree/bindings/embedded-controller
is for in the kernel tree or in the devicetree spec.

>=20
> > general purpose microcontroller with firmware from synology flashed
> > onto it. Therefore it is a MCU.
>=20
> Every chip is then an MCU with such logic. Every PMIC, every EC.
>=20
> This is for me clearly embedded controller and that's where this should
> be placed and called.
In that case I will move it to
Documentation/devicetree/bindings/embedded-controller and update the
node name used in the example.

I will wait a bit for the other patches to be reviewed before sending a
next revision.

But I wonder how
Documentation/devicetree/bindings/mfd/qnap,ts433-mcu.yaml
got in there then, given it is pretty similar to this device in the
functionality it provides.

>=20
> Best regards,
> Krzysztof

Thanks
- Markus Probst

--=-QgeV7XmAqUUPZhNVaoPn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEgnQYxPSsWOdyMMRzNHYf+OetQ9IFAmm1VSgbFIAAAAAABAAO
bWFudTIsMi41KzEuMTEsMiwyAAoJEDR2H/jnrUPSP+MP/1/VBG/dQxtLR1lRfGjP
p2JzDwOfaO93qw6mJsn7rNMLFDHKQmJO81dItaEXl9jyILcrE/Cy7UcoMtpeH04r
jcQyDORLNPVXzcc+rHIJ/sUt3Qy2G079Wf9qC6RgkVy4LVkCOcjH/s9JdxoAAFih
yIXwkhnCUE3S73WfzwuxSVnuCO+V7/IIzahYG2kDV2kdpIvGF41Aq9SyUB+4E3u7
g+mfg7R2TJVtENuQQJScHBXEoqos8bUegjMCegORqAhKCTtyHwdzCgGwH+ZZK2Oh
utEcaGUQRE7KUkUbH24aPyk67FTGhBiwH4NJxJFW+XXJpwue+SO7xGYP9XOXtAcd
MBPzmXkwYC0miMgDnadnYyZfbQ/eUcSzYE3N6n/Cur+mDW5kokdDOdiFInDH9yfH
Q9PHATWyP29w7XD+AWA5K2w0iUZugvLozHTYm1G/gIcEYKByA588v0Z8VQb2LwQP
GMQMXTWv6drWpHCMRSUZOgjRsH57kfKexCkZPfSLyZVxvPP7Ii19aOTMH/8kQRW5
8IL4gvnYHWGoktz5S80CUT2CzzqI11L+RAYWE3v/f6ITZC+WByfxI5ohJj9e3mxj
12Swd/r6R4CyySCeIPyfH4eqd24S7cGwRyBWe0ujFVKWoY17PZyfZc/Wu+BIsICq
BAGtgYZCiTCFd8ajt9i1+TGT
=TVne
-----END PGP SIGNATURE-----

--=-QgeV7XmAqUUPZhNVaoPn--

