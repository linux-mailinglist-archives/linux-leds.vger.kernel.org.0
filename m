Return-Path: <linux-leds+bounces-7844-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHa2GF6u62nfQAAAu9opvQ
	(envelope-from <linux-leds+bounces-7844-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 24 Apr 2026 19:54:38 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E8287462278
	for <lists+linux-leds@lfdr.de>; Fri, 24 Apr 2026 19:54:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 058AD30065CC
	for <lists+linux-leds@lfdr.de>; Fri, 24 Apr 2026 17:54:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97720277C81;
	Fri, 24 Apr 2026 17:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xn--rombobjrn-67a.se header.i=@xn--rombobjrn-67a.se header.b="WIxSJJEC"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.xn--rombobjrn-67a.se (nestor.xn--rombobjrn-67a.se [188.126.83.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21F57083C;
	Fri, 24 Apr 2026 17:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.126.83.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777053274; cv=none; b=iZqCtqe4UxqSDiRY4sHOl4pfZvThycNHtGSVO38EGU9KfoXPF1bPsX8SYv313MaT7lieaaPa1tTTIb1t8LFF9/wxcnI8KOvFXjhsnMs5P3b/n/PkqadYTp3ADc6SvI+2k7yxXqFVVDoVnVPCljY0lUQEsFVO0nsU3/+wE3L/p30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777053274; c=relaxed/simple;
	bh=WgaMls5U0OisShyTrOkS3PZGbJmhUxFf2DHxM/lugSY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FB1TVbops3lneNrnq4BRE0PQhX1QJBslqgMohbCra6ASLU9j4NeEvtqLci/rzm21MwGU4iseT/9u1KO2aLvaECmPoAHv3hPLII1/SelOEo1dixibTlkpjqEBN0GQREtXVA3MO4t1xOBvQmQIm+qktwNlLB7mAKmA2H9f3+TYo7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xn--rombobjrn-67a.se; spf=pass smtp.mailfrom=xn--rombobjrn-67a.se; dkim=pass (2048-bit key) header.d=xn--rombobjrn-67a.se header.i=@xn--rombobjrn-67a.se header.b=WIxSJJEC; arc=none smtp.client-ip=188.126.83.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xn--rombobjrn-67a.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xn--rombobjrn-67a.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xn--rombobjrn-67a.se;
	s=a; t=1777052848; bh=WgaMls5U0OisShyTrOkS3PZGbJmhUxFf2DHxM/lugSY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:From:Sender:Reply-To:Original-From:
	 Organization:To:CC:Subject:Original-Subject:Date:Message-ID:
	 In-Reply-To:References:Original-Message-ID:
	 Disposition-Notification-To:Disposition-Notification-Options:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:
	 Content-Features:Content-Alternative:Content-Location:
	 TLS-Report-Domain:TLS-Report-Submitter:MT-Priority;
	b=WIxSJJECF4clUw9o2wcK+Ae/BBNemkQwAni0uL3lPekcgQ/y0Efoc2WJwDfJHwi5i
	 us17B/huKxwsWgly1VNypyXt+7B3XAoUNgNO4B7/BjQdTaNzN+jyY4CFvJ1IbrEYeS
	 t38cjmM/D1ghDeNHmYfkCP2cRkRi/niuDXFlEhDp94F0c2g0jxO6p+gwjHGKvumP/E
	 nPk07gOjv4X1gS5x34oXobV5cwKSRoc3E0e4RmqsYE9uOre7VNMDdHIXOQ4GQ274Ek
	 KJkiIKkc0Vc2/cg2QPB/5xccTQ9f4wpKQ7pYs9C0NPKJ0zPb6wZnlZPhQxU3ryxuzL
	 O7rU4VYKf1+gQ==
Received: from tag.xn--rombobjrn-67a.se (tag.xn--rombobjrn-67a.se [192.168.72.9])
	by smtp.xn--rombobjrn-67a.se (Postfix) with ESMTPSA id 137CD407E8F7;
	Fri, 24 Apr 2026 19:47:28 +0200 (CEST)
Date: Fri, 24 Apr 2026 19:47:14 +0200
From: =?UTF-8?B?QmrDtnJu?= Persson <Bjorn@xn--rombobjrn-67a.se>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah
 Khan <skhan@linuxfoundation.org>, linux-leds@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: leds: uleds: Make the documentation match the
 code.
Message-ID: <20260424194714.71de0ef6@tag.xn--rombobjrn-67a.se>
In-Reply-To: <20260423152655.GF170138@google.com>
References: <20260402220811.4804DD8F722@tag.xn--rombobjrn-67a.se>
 <20260423152655.GF170138@google.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9p1HensKdgWEdofuDRm2axt";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Rspamd-Queue-Id: E8287462278
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[xn--rombobjrn-67a.se:s=a];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[xn--rombobjrn-67a.se:+];
	TAGGED_FROM(0.00)[bounces-7844-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[xn--rombobjrn-67a.se];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bjorn@xn--rombobjrn-67a.se,linux-leds@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	TO_DN_SOME(0.00)[]

--Sig_/9p1HensKdgWEdofuDRm2axt
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Lee Jones wrote:
> On Thu, 02 Apr 2026, Bj=C3=B6rn Persson wrote:
>=20
> > From: Bj=C3=B6rn Persson <Bjorn@Rombobj=C3=B6rn.se>
> >=20
> > =C2=B7 max_brightness must be set. Leaving it uninitialized or just omi=
tting it
> >   won't work. =20
>=20
> What are these points?  How do you even type one of those?

The bullet point is the character U+00B7 middle dot. I type it with
AltGr-period on a Swedish keyboard in Fedora. I don't know what keymap
your distro uses for your keyboard. I hear some keyboards lack an AltGr
key.

> Anyway, proper sentences / paragraphs is better.

You mean you dislike bulleted lists?

Or if you mean that the first sentence doesn't begin with a capital M,
that's because identifiers are case-sensitive in C. There is no
Max_brightness, and if it were defined, it would be different from
max_brightness.

Otherwise I don't understand what you mean with "proper sentences", as
I don't see any grammatical errors.

> > -A new LED class device will be created with the name given. The name c=
an be
> > -any valid sysfs device node name, but consider using the LED class nam=
ing
> > -convention of "devicename:color:function".
> > +A new LED class device will be created with the given name and maximum=
 =20
>=20
> Did you mean to revers "name given"?  A "given name" usually means
> something else.

I felt that "the name and maximum brightness given" would be
grammatically awkward.

To prevent misinterpretation, how about replacing "given" with a
synonym? Perhaps "the specified name and maximum brightness"? Another
option is "the given maximum brightness and name", but it feels a
little odd to mention the brightness before the name.

> > +Although max_brightness is a signed int, only positive values are vali=
d:
> > +1 to INT_MAX. =20
>=20
> What about 0?

That will get you an EINVAL from uleds.c =E2=80=93 presumably because a
brightness interval from 0 to 0 would be pointless. That LED would never
be lit.

> > +The current brightness is found by reading a whole int from the charac=
ter =20
>=20
> Try not to shorten names in documentation "integer".

The type is named "int" in C. There are many integer types, but it would
be wrong to try to read a uint16_t or a size_t or any other integer
type. The document needs to use the actual type name to make it clear to
the reader that they must read sizeof(int) bytes.

> Why do we need to specify "whole"?

Because you can't read it piecemeal. Usually when you read from a disk
file, a pipe, a TCP socket or some other bytestream, the system call
will let you read one byte at a time if you want. A reader might assume
that /dev/uleds works the same way.

=46rom a datagram socket you can read the beginning of a datagram and
discard the part that doesn't fit in your buffer. To a reader with a
little-endian system and max_brightness =E2=89=A4 255, it might seem logical
that they'd be able to read the first byte and discard the bits that
will always be zero.

I thought "whole" would communicate to the reader that they must read
sizeof(int) bytes in a single system call.

It seems this wording wasn't enough to get the point across that it's
necessary to read an int, a whole int, and nothing but an int. Do you
think the document needs to expound that point more?

Bj=C3=B6rn Persson

--Sig_/9p1HensKdgWEdofuDRm2axt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signatur

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE52SginNFTPmg+iBb4Tha3NZK5j8FAmnrrKIACgkQ4Tha3NZK
5j8YZA//ZF4R7F0CtoUSf9Oj6W+8/spe9/angJSTShMpi0oAv9xIy2rGhcXh21++
F1ErxzPhHNj4wtxLvDicugdo0TbrR9aZuk8nTrLz2iXYHKMDbi6Fdb8Zy14I9Twx
fsYC5yYvYCUoOs3URzvV9oGqt6iIfD0l+819GsCHRxd4kxdynGhbBdaDB4+9kksM
W3h92eEaSwTYcTr32q89c3fxzig7lZMZ1zRNi838GKjdcQlWDJOeal3kgleG4kVy
LQlhmzb7oJesriasAbzYh97MQP/GbGF4ArGFncj6AvEOLLMo88xaPiKZbHKgLKz2
iwMr4AsmW7mnHx9ke2GadbXE1g9TatS8L4R+DWhKiKvrZ10jCQgFdjAkh71YRV6g
6Yga+Q/qt1AUhwgJ2U8pDMjj3c+pqeJOS/Tbr2Hhz/BIrLSqdPG5Jy0cTfirxtS0
0UxbHh6lRlwKlTnJxVaB2ogJhgUzTZs8cv2SsJ1lm8Iwj0U3eqQVpas7a7YzCUTZ
j+j/Cca2KLP7mEpCuQ0+ztZJK0S5IpLV6ECjmIdpnvj6Ey4Ooi/eCbhFZD4Z/4mX
9JMEVJcJnoCyNLSFit92VDOZUYbrK0nrL1hNUzN5Ho+J67dE2kNydJ7jA76nBBzD
VaxDL2zearSyyrQw/t63slBxwM7GNpx3exrVnU3AkzX1X7yXY64=
=+z4K
-----END PGP SIGNATURE-----

--Sig_/9p1HensKdgWEdofuDRm2axt--

