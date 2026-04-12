Return-Path: <linux-leds+bounces-7698-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oENzHGOc22mCEAkAu9opvQ
	(envelope-from <linux-leds+bounces-7698-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 12 Apr 2026 15:21:39 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C923E3F35
	for <lists+linux-leds@lfdr.de>; Sun, 12 Apr 2026 15:21:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2469F3011108
	for <lists+linux-leds@lfdr.de>; Sun, 12 Apr 2026 13:21:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 890D237C0EC;
	Sun, 12 Apr 2026 13:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="Nj5RYxZM"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD00F3783D5
	for <linux-leds@vger.kernel.org>; Sun, 12 Apr 2026 13:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776000093; cv=none; b=CKMJu67dqv4mo6E50dokB2z+xKrecCbgEKdind6jkCaCA5AoLh48brW0S1Dk+iDmf2GGpe6CZP2w1WmvhXiTBOmD/e0a3sZSsQi4DGMwQcv3T7aw9J6Nc8MFUxCjhvk+ryJngYl7+docrr0EUs7+BABW+qW1Q6gtlUbN6yADiLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776000093; c=relaxed/simple;
	bh=TJ8wVwTaPPX8IA9fBCpnZgN0uKm56+4zTNIE8Ys86RI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GUsW9pP159wJ0tfIGEXdoDOnUpJHUyinV+kTahBVJd7Ng1w43wHUpkhQLBhiZN6DuiIx5aKSB06nHMOe6y7kj8ZOAKiWPdkmUnTCYxoNuycSJgNZPNGtZQ1D4S1/v1njsiBSwPfRe0jpCVIC/fUzRVFzP3O5djwt3lpcYSIqOLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=Nj5RYxZM; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id E5B71240103
	for <linux-leds@vger.kernel.org>; Sun, 12 Apr 2026 15:21:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1776000089; bh=Jb7EIbixOeoV5E5XbGXz4LVjV4oNjHY8UojULhpOhrE=;
	h=Message-ID:Subject:From:To:Cc:Date:Autocrypt:Content-Type:
	 MIME-Version:OpenPGP:From;
	b=Nj5RYxZMAO4NhPZsLojI0EIQgJN0wjFGB+xLZUxybn/1NJaH3OXaXO/eETtABLBoR
	 PdFyrebIZX6eIkdVrEpn9WpNyRCgqEhZi8OruJ+HDYRF+OhZ5yOvC0yZufU9TWF8pp
	 VO0h4ZC+dJaUT97Bsq2/xBFpEfD5CbMPlhOmxi1XI45Ku84aQoynvGtttb0aG6d34U
	 J0muUKtpAPaylhUk0SAjD51zimgj43xjRVhTF+aoRDG7AQMSsaPAQ/f8irOtj7GSVv
	 2vTDJRTkWto8L2IQ6ihPcmCA/B0OwmKqvgfgrENlDXPyB9zn5G1sU9vs/ZXzNyfkNZ
	 qZGxBTh0sPFQg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4ftrlp6Bdjz9rxD;
	Sun, 12 Apr 2026 15:21:26 +0200 (CEST)
Message-ID: <485ab9e829e902e3f29172059be8c3203062d06b.camel@posteo.de>
Subject: Re: [PATCH v7 2/2] dt-bindings: embedded-controller: Add synology
 microp devices
From: Markus Probst <markus.probst@posteo.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=	
 <ilpo.jarvinen@linux.intel.com>, Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>,  Lee Jones <lee@kernel.org>, Pavel Machek
 <pavel@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng
 <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?ISO-8859-1?Q?Bj=F6rn?=
 Roy Baron	 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg	 <a.hindborg@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross	 <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, Rob Herring	 <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley	 <conor+dt@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, 
	platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Date: Sun, 12 Apr 2026 13:21:28 +0000
In-Reply-To: <20260412-cuddly-taipan-of-reputation-1cafe0@quoll>
References: <20260411-synology_microp_initial-v7-0-9a3a094e763a@posteo.de>
	 <20260411-synology_microp_initial-v7-2-9a3a094e763a@posteo.de>
	 <20260412-cuddly-taipan-of-reputation-1cafe0@quoll>
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
	protocol="application/pgp-signature"; boundary="=-xhQZRujpQLSdSyyM6rXY"
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[posteo.de:s=2017];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,linaro.org,garyguo.net,protonmail.com,google.com,umich.edu,linuxfoundation.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-7698-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:url]
X-Rspamd-Queue-Id: 18C923E3F35
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-xhQZRujpQLSdSyyM6rXY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2026-04-12 at 10:26 +0200, Krzysztof Kozlowski wrote:
> On Sat, Apr 11, 2026 at 05:27:35PM +0200, Markus Probst wrote:
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - synology,ds923p-microp
> > +      - synology,ds918p-microp
> > +      - synology,ds214play-microp
> > +      - synology,ds225p-microp
> > +      - synology,ds425p-microp
> > +      - synology,ds710p-microp
> > +      - synology,ds1010p-microp
> > +      - synology,ds723p-microp
> > +      - synology,ds1522p-microp
> > +      - synology,rs422p-microp
> > +      - synology,ds725p-microp
> > +      - synology,ds118-microp
> > +      - synology,ds124-microp
> > +      - synology,ds223-microp
> > +      - synology,ds223j-microp
> > +      - synology,ds1823xsp-microp
> > +      - synology,rs822p-microp
> > +      - synology,rs1221p-microp
> > +      - synology,rs1221rpp-microp
> > +      - synology,ds925p-microp
> > +      - synology,ds1525p-microp
> > +      - synology,ds1825p-microp
>=20
> Previous comment is not resolved. For example you stated that ds723p is
> compatible with ds725p, so this should be expressed.
Using this expression?

properties:
  compatible:
    oneOf:
      - enum:
          - synology,ds923p-microp
          - synology,ds1522p-microp
      - enum:
          - synology,ds918p-microp
          - synology,ds415p-microp
      - const: synology,ds214play-microp
...
?
If so shall there each be a description?

Also ds723p and ds725p are not compatible. ds723p has a system current
sensor, ds725p does not. This will be relevant when implementing the
hwmon part of the driver.

>=20
> ds918p and ds415p as well. ds925p and several others you EXPLICITLY
> wrote they are compatible:
>=20
> "ds925p, ds1525p, ds1825p, ds1823xsp:
> - supports fan rpm report via an adt7475 chip and therefore does not
> have gpios for fan failure
> - no system current sensor"
Yes.

>=20
> Probably many more cases, I did not verify all of them.
>=20
> If there is going to be new version, please organize the patch
> documenting the compatible (DT bindings) before the patch using that
> compatible.
> See also: https://elixir.bootlin.com/linux/v6.14-rc6/source/Documentation=
/devicetree/bindings/submitting-patches.rst#L46
Ok.

Thanks
- Markus Probst

>=20
> > +
> > +  fan-failure-gpios:
> > +    description: GPIOs needed to determine which fans stopped working =
on a fan failure event.
> > +    minItems: 2
> > +    maxItems: 3
> > +
> > +required:
> > +  - compatible
>=20
> Best regards,
> Krzysztof

--=-xhQZRujpQLSdSyyM6rXY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEgnQYxPSsWOdyMMRzNHYf+OetQ9IFAmnbnEobFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJEDR2H/jnrUPSrtMQAJ9Qq+Qbobe0voqfOqqV
FKXcfR/Kl1yi90yrS65R6WQxmG2xphTJ7XXkLPGYXmscivM05vDVEQL6iPTZKV5a
d7Ok7wZhoLj5q+2uFFztPuqOXUzuZJfjBUKaSw3Lg8wI89HxYKfATESrwUhUw3rI
A6pqD1GA5Pnb1AgWuQwq31JftQ/rzCMCAdQdTwRHIZB0ARxtxHssmbmsmnX2N4/n
4K52sq8B72OQM/ImWst5Gym3uCOlnniuoTJH2+EFl2v9RRj045mn8UWnit1szWP9
Uc6DMON3BIr0tdQWs1jj31HMZXzwj7AJW3DKuCcgzbn0XB5Ok4kmNZxaPZINBx+s
JsLZANQi6rsmkxRyz58Nu+Qy6Ydc91ZIZ3UO561F1/vZ17OeLSTgUBIAuq6xGRUW
SEUSQIN0JUPvbKMBnx0i69bAz7rPQnJgpsB+kJ8/b9p/W80yEThHsAau0V4aCJgD
RlSE1Fw4tVr+GBNXNZXZ8oj2zOALVGV4f19Roxl2aPP/P76LtxwK/hcKqfZQZjme
6xckx/MDDv3D24V0ND64uT10FGpK9n+5NPlwoUKlaybkfruSeqXyFpUvfLtopHbM
VGMWdxrTjlPNG3ucrtFFeGGnW/AXfFrcjMJR3Ld3KYsmgZxCf//Z84aBlzp860ig
L6Y2NPqJfh6pDmknIbFBU3TB
=CXK6
-----END PGP SIGNATURE-----

--=-xhQZRujpQLSdSyyM6rXY--

