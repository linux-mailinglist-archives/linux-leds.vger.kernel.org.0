Return-Path: <linux-leds+bounces-7345-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOnFMcZ2tWlG0wAAu9opvQ
	(envelope-from <linux-leds+bounces-7345-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 14 Mar 2026 15:55:02 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5999728D8F5
	for <lists+linux-leds@lfdr.de>; Sat, 14 Mar 2026 15:55:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 34BD7303B5CA
	for <lists+linux-leds@lfdr.de>; Sat, 14 Mar 2026 14:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93A5B37CD51;
	Sat, 14 Mar 2026 14:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="CdGmOQE8"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D073633D505
	for <linux-leds@vger.kernel.org>; Sat, 14 Mar 2026 14:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773500080; cv=none; b=jF6f8i02dQ4qehGl1DIT09g/VsIcCsd8sVyb2ciP9ZXbyc3HJrSoVdpz/brudAeDJ+iE62S1aOeXuta9wa8rYZvyMXLHnEi2J2hBmLbOdDt+8DSy3EeV3ded2zHHcgVjV1FhJKxvQ/FiC7MELL0Dw7blyDZDLcNSsDyTflvyJOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773500080; c=relaxed/simple;
	bh=nWQ4iF7/s/o03eYJ/7OuMPspkBb+SsFghcFHcgyEvpU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TRcbefw+RIKmZQs/XFPNese022YBeesOX2KHrioaM4XbrSt/3gIVn2raK5V/eNq106nM4YV5b6Cl9kxxBF1MKyF90n6WCKATLBAdd5tSqFdEgyrM3Rwm1V+/dom0EsZp0us6h4f/m9C8HiapHrdWn1C+glUUjFjXNlC+Pddw0s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=CdGmOQE8; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 6DE11240029
	for <linux-leds@vger.kernel.org>; Sat, 14 Mar 2026 15:54:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1773500077; bh=VvvBVmAhBK+BfYL4RCixfcFOqntOkNLVZGklQlrRSr8=;
	h=Message-ID:Subject:From:To:Cc:Date:Autocrypt:Content-Type:
	 MIME-Version:OpenPGP:From;
	b=CdGmOQE8vVyJfEgCouyxm5p3JbAdnr2kKuqpRnTAl8MJzzRIO0TGczHiomxkYAJjk
	 G/wEjgHlJz1x7BNlMAazCNR8jnVce7Bkk4BsytMYBdst9+HNaJ2lDW1B6DX4ACwbLW
	 /HSGTKCUSXAgp0BlaaVViIJWb0lEoDlZ+NpdCKXORJDklal+EuZL31kS2BA/YsI77q
	 YKNDMFi4+jAYB61FNnInW075/1B1kDnvU3uMpzmreWwLAwlO01hztp7ey5qrjuxT8T
	 9D2dSMzWOJ1rueTZ5rgIFWnwkEEMOhGWFnaAhPj+X2AbXL2sA7pvclvKWh3kMp4ime
	 n5ksJlBdhd63A==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4fY4Bf1jRsz6tvk;
	Sat, 14 Mar 2026 15:54:34 +0100 (CET)
Message-ID: <0e133c383374e73990be0d402b6b908e8050e5ae.camel@posteo.de>
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
Date: Sat, 14 Mar 2026 14:54:36 +0000
In-Reply-To: <88f53ef1-5c3c-44d7-a749-a03b9563a552@kernel.org>
References: <20260313-synology_microp_initial-v3-0-ad6ac463a201@posteo.de>
	 <20260313-synology_microp_initial-v3-5-ad6ac463a201@posteo.de>
	 <02e0772d-ba65-4eb8-8453-e0b3eaa4af96@kernel.org>
	 <6f2298f3298dc81e6e2ed34ca43424fc39ce3518.camel@posteo.de>
	 <336523bb-615b-451b-8681-c965bf579203@kernel.org>
	 <97c64ee64734debae475716b4d588dee59889f70.camel@posteo.de>
	 <88f53ef1-5c3c-44d7-a749-a03b9563a552@kernel.org>
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
 keydata=mQINBGiDvXgBEADAXUceKafpl46S35UmDh2wRvvx+UfZbcTjeQOlSwKP7YVJ4JOZrVs93
 qReNLkOWguIqPBxR9blQ4nyYrqSCV+MMw/3ifyXIm6Pw2YRUDg+WTEOjTixRCoWDgUj1nOsvJ9tVA
 m76Ww+/pAnepVRafMID0rqEfD9oGv1YrfpeFJhyE2zUw3SyyNLIKWD6QeLRhKQRbSnsXhGLFBXCqt
 9k5JARhgQof9zvztcCVlT5KVvuyfC4H+HzeGmu9201BVyihJwKdcKPq+n/aY5FUVxNTgtI9f8wIbm
 fAjaoT1pjXSp+dszakA98fhONM98pOq723o/1ZGMZukyXFfsDGtA3BB79HoopHKujLGWAGskzClwT
 jRQxBqxh/U/lL1pc+0xPWikTNCmtziCOvv0KA0arDOMQlyFvImzX6oGVgE4ksKQYbMZ3Ikw6L1Rv1
 J+FvN0aNwOKgL2ztBRYscUGcQvA0Zo1fGCAn/BLEJvQYShWKeKqjyncVGoXFsz2AcuFKe1pwETSsN
 6OZncjy32e4ktgs07cWBfx0v62b8md36jau+B6RVnnodaA8++oXl3FRwiEW8XfXWIjy4umIv93tb8
 8ekYsfOfWkTSewZYXGoqe4RtK80ulMHb/dh2FZQIFyRdN4HOmB4FYO5sEYFr9YjHLmDkrUgNodJCX
 CeMe4BO4iaxUQARAQABtCdNYXJrdXMgUHJvYnN0IDxtYXJrdXMucHJvYnN0QHBvc3Rlby5kZT6JAl
 QEEwEIAD4CGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AWIQSCdBjE9KxY53IwxHM0dh/4561
 D0gUCaIZ9HQIZAQAKCRA0dh/4561D0pKmD/92zsCfbD+SrvBpNWtbit7J9wFBNr9qSFFm2n/65qen
 NNWKDrCzDsjRbALMHSO8nigMWzjofbVjj8Nf7SDcdapRjrMCnidS0DuW3pZBo6W0sZqV/fLx+AzgQ
 7PAr6jtBbUoKW/GCGHLLtb6Hv+zjL17KGVO0DdQeoHEXMa48mJh8rS7VlUzVtpbxsWbb1wRZJTD88
 ALDOLTWGqMbCTFDKFfGcqBLdUT13vx706Q29wrDiogmQhLGYKc6fQzpHhCLNhHTl8ZVLuKVY3wTT+
 f9TzW1BDzFTAe3ZXsKhrzF+ud7vr6ff9p1Zl+Nujz94EDYHi/5Yrtp//+N/ZjDGDmqZOEA86/Gybu
 6XE/v4S85ls0cAe37WTqsMCJjVRMP52r7Y1AuOONJDe3sIsDge++XFhwfGPbZwBnwd4gEVcdrKhnO
 ntuP9TvBMFWeTvtLqlWJUt7n8f/ELCcGoO5acai1iZ59GC81GLl2izObOLNjyv3G6hia/w50Mw9MU
 dAdZQ2MxM6k+x4L5XeysdcR/2AydVLtu2LGFOrKyEe0M9XmlE6OvziWXvVVwomvTN3LaNUmaINhr7
 pHTFwDiZCSWKnwnvD2+jA1trKq1xKUQY1uGW9XgSj98pKyixHWoeEpydr+alSTB43c3m0351/9rYT
 TTi4KSk73wtapPKtaoIR3rOFHLQXbWFya3VzLnByb2JzdEBwb3N0ZW8uZGWJAlEEEwEIADsWIQSCd
 BjE9KxY53IwxHM0dh/4561D0gUCaIO9eAIbAwULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgAAKCR
 A0dh/4561D0oHZEACEmk5Ng9+OXoVxJJ+c9slBI2lYxyBO84qkWjoJ/0GpwoHk1IpyL+i+kF1Bb7y
 Hx9Tiz8ENYX7xIPTZzS8hXs1ksuo76FQUyD6onA/69xZIrYZ0NSA5HUo62qzzMSZL7od5e12R6OPR
 lR0PIuc4ecOGCEq3BLRPfZSYrL54tiase8HubXsvb6EBQ8jPI8ZUlr96ZqFEwrQZF/3ihyV6LILLk
 geExgwlTzo5Wv3piOXPTITBuzuFhBJqEnT25q2j8OumGQ+ri8oVeAzx24g1kc11pwpR0sowfa5MvZ
 WrrBcaIL7uJfR/ig7FyGnTQ1nS3btf3p0v8A3fc4eUu/K2No3l2huJp3+LHhCmpmeykOhSB63Mj3s
 3Q87LD0HE0HBkTEMwp+sD97ZRpO67H5shzJRanUaDTb/mREfzpJmRT1uuec0X2zItL7a6itgMJvYI
 KG29aJLX3fTzzVzFGPgzVZYEdhu4y53p0qEGrrC1JtKR6DRPE1hb/OdWOkjmJ75+PPLD9U5IuRd6y
 sHJWsEBR1F0wkMPkEofWsvMYJzWXx/rvTWO8N4D6HigTgBXAXNgbc3IHpHlkvKoBJptv6DRVRtIrz
 0G0cfBY0Sm7he4N2IYDWWdGnPBZ3rlLSdj5EiBU2YWgIgtLrb8ZNJ3ZlhYluGnBJDGRqy2jC9s1jY
 66sLA9rQZMHhJTzMyIDwweGlvMzJAcG9zdGVvLmV1PokCbQQTAQgAVxYhBIJ0GMT0rFjncjDEczR2
 H/jnrUPSBQJpa71VGxSAAAAAAAQADm1hbnUyLDIuNSsxLjExLDIsMgIbAwULCQgHAgIiAgYVCgkIC
 wIEFgIDAQIeBwIXgAAKCRA0dh/4561D0gKJD/9uOQKYlsDoQX65Gd0LiMT0C+5vXgr3VI0PHDOwcv
 51fJ3A1vNyPZRFPGrz8+mDEXUQOF/INfnz5Tu1QHwf+iYcWcTGAN/FHgVR6ET6VBNU2hJaKhu+Ggo
 kjYyJTOvyX+3yNRUfSny0GjTjIPuPTErjqmHF+BtjXslpgwqnNMznf3lRIuUjRORupos6p3k1DndE
 5vzUTmXSvMyXyOD2KhBl/kL76k0bHYyAQytZPag12pltrtFbA/r2phDGN2si8PooDT99bSTJjaM45
 MTAAHbHKJfvgfK41bNFD5mMtpWpL195XRtS0Nrxdg3PaYBxN5gtTG0RyZfpYRlkdEhm+jj/8RxuSG
 i/qdhRdbiI7K2IELWeQVHSNDi9JabR/UzlR4NSnhfAjRIVlRM+eFbUl8XwxwVrAkojF5IraH2qRvg
 VCmuFsHUW07FUlrDrzpjXsD73cKppoFGDCdDR0BHJepXbFLS9+AqkT+guRJlnCTg2p+TQtnbwPgKp
 Vj98JixovCl99zRYTsL2bRNU5+q8iET65VMJ1ydyNanvLd5vI/NqDkXhlXLsGmdaDTtu4R21PkToX
 dQNGrZ91M9nlIBKw8Y7c7xZ4098qX2b8JX/CxD+gC1r4C8vuA3GkhFLx+KlkON7LyiJPkrePp6Qky
 jfGillcaQOqFZ3WwVqyzG1BUfTow==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-jah4XBQMXauDN9UbTzR7"
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7345-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,collabora.com,intel.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[posteo.de:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[wikipedia.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,posteo.de:dkim,posteo.de:mid]
X-Rspamd-Queue-Id: 5999728D8F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-jah4XBQMXauDN9UbTzR7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2026-03-14 at 14:59 +0100, Krzysztof Kozlowski wrote:
> On 14/03/2026 13:31, Markus Probst wrote:
> > On Sat, 2026-03-14 at 09:49 +0100, Krzysztof Kozlowski wrote:
> > > On 13/03/2026 21:29, Markus Probst wrote:
> > > >=20
> > > > > This is not an "MFD" device.
> > > > It now uses the MFD APIs. By the definiton of @Lee (assuming I
> > > > understood it correctly), this device should now qualify as "MFD"
> > > > device.
> > >=20
> > > No. Using Linux framework does not make this device MFD, since there =
is
> > > no such term of hardware as MFD. Otherwise please explain or link to
> > > verifiable external source describing what sort of device class is MF=
D
> > I assumed these comments would also apply for the dt bindings:
> > -
> > https://lore.kernel.org/rust-for-linux/DGYAFNSJ7576.1E0JZ2W499ZQ7@kerne=
l.org/
> > -
> > https://lore.kernel.org/rust-for-linux/20260309151555.GU183676@google.c=
om/
>=20
> I don't understand your question. We talk here about bindings, so why do
> you ask if the comments are about bindings?
>=20
> >=20
> > given that using linux MFD APIs also changes the structure of the dt
> > bindings with added sub-devices.
> >=20
> > But it seems no?
>=20
> >=20
> > > because for sure this is not MFD how Wikipedia defines it.
> >=20
> > Wikipedia defines it as a synonym for a "multi-function
> > product/printer/peripheral"
> > https://en.wikipedia.org/wiki/Multifunction_device
>=20
> I know, not need to state obvious. And this is not a printer.
>=20
>=20
>=20
> >=20
> > >=20
> > > >=20
> > > > > > +
> > > > > > +    mcu {
> > > > >=20
> > > > > Please read previous comments.
> > > >=20
> > > > You are likly trying to refer to this comment from you:
> > > > > Depending what this is. MCU is generic purpose unit where you loa=
d
> > > > your
> > > > > different FW for different purposes and you have here specific - =
to
> > > > > handle certain aspects of this entire machine. This looks like EC=
, so
> > > > > should be called embedded-controller and placed in that directory=
.
> > > > Synology uses Microchip PIC for this purpose. On a Synology DS215j,=
 it
> > > > uses a "Microchip PIC16F1829". At least to me, this looks like a
> > >=20
> > > It does not matter what chip is used. Every component uses some sort =
of
> > > chip.
> > I would be interested in what does matter then.
> >=20
> > I did not actually find an exact definition for what
> > Documentation/devicetree/bindings/mfd
>=20
> Because there is no such hardware as MFD.
>=20
> > and
> > Documentation/devicetree/bindings/embedded-controller
> > is for in the kernel tree or in the devicetree spec.
>=20
> Commit msg moving several devices there explained, no?
yes.

>=20
>=20
> >=20
> > >=20
> > > > general purpose microcontroller with firmware from synology flashed
> > > > onto it. Therefore it is a MCU.
> > >=20
> > > Every chip is then an MCU with such logic. Every PMIC, every EC.
> > >=20
> > > This is for me clearly embedded controller and that's where this shou=
ld
> > > be placed and called.
> > In that case I will move it to
> > Documentation/devicetree/bindings/embedded-controller and update the
> > node name used in the example.
> >=20
> > I will wait a bit for the other patches to be reviewed before sending a
> > next revision.
> >=20
> > But I wonder how
> > Documentation/devicetree/bindings/mfd/qnap,ts433-mcu.yaml
> > got in there then, given it is pretty similar to this device in the
> > functionality it provides.
>=20
> Great question. How do any bugs, mistakes, different judgments or
> imperfectness got merged?  How is it possible that code for example is
> reviewed but has a bug? Don't ever use arguments that something
> somewhere happened, so you can do the same.
I was not trying to use this as an argument. As you can see above I
already agreed to put it into embedded-controller.

I was interested in knowing, if there was a difference between the two
devices I did not know of, as the bindings for this device go into
another directory despite the similarity (no need to answer it anymore,
see below).

But I see why that hasn't been clear.

>=20
> Not mentioning that if you even question this, you could at least look
> at the history which would tell you if "embedded-controller" directory
> existed that time or not.
yes, that would have made my question entirely obsolete.

>=20
> Best regards,
> Krzysztof

Thanks
- Markus Probst

--=-jah4XBQMXauDN9UbTzR7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEgnQYxPSsWOdyMMRzNHYf+OetQ9IFAmm1dqYbFIAAAAAABAAO
bWFudTIsMi41KzEuMTEsMiwyAAoJEDR2H/jnrUPSJjwQAJEB9jDWsxrdZroEiEit
SPqHXkXhYz4X9Z4xtgAX34xBDU1VjP3meDZgw/Xbejljw71XY2p0JDPUKWbpE0/q
wPIAOE2afEr7fK3PLw8b0wKe+jmZVHMqKq984gRFlM34cqrZy+Ny5YiG4xIeWPnu
xvq6KKuWGYQs76wzaw5GsxrhkTtzUB3cuIS1ExFRh8VeITFwnjtFoVnAk0zLWKIn
ZynZEf5mDnlzNgBCeaPyIZtvO6a+oQtmyBPO7taNEuy7zUyUZZNHIQrlXbaxo9MP
7F9WL8cb7ARvwJTk08nwUhA6pWE2RDbza8qdDOMXRr/nsEGnWiWIMgOWI5srBLcb
wq9B0P07M+XafkcZWUMk+kjVrTU6m/CJtX++ESNUVo/hUPmeEfvQ4VhDS7uyLY9+
5XvMb4YgmF8rbWBZzAebwqYji4k2t9gWhqsK/PpISbfGtJy2uC5XIrEYJlNBg5rJ
FNjKVW8AE+EtDTH884Z7mPM+nkDIMmVPnBdCUuVQIyu6KN/g38pAn5hjmBzzIAhL
SgVLx7DOjHGOOL0V0K9EJGoNUaIyGqUuFtOr8Cyv9QLunevMpusMd46hjDTeAAq+
JWc+lHzS6VAbJheceeQbO9KSSiLUc/qytYEfufDRYGj1B1MEVYZoXqT/UdlPcNIM
uyetEx6zv4L8GqhrxzHLXu3+
=At9Y
-----END PGP SIGNATURE-----

--=-jah4XBQMXauDN9UbTzR7--

