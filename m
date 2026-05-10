Return-Path: <linux-leds+bounces-8078-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGAlLFzhAGoQOAEAu9opvQ
	(envelope-from <linux-leds+bounces-8078-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 10 May 2026 21:49:48 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7925060B2
	for <lists+linux-leds@lfdr.de>; Sun, 10 May 2026 21:49:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B4F0D300B634
	for <lists+linux-leds@lfdr.de>; Sun, 10 May 2026 19:49:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3F87322A2E;
	Sun, 10 May 2026 19:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xn--rombobjrn-67a.se header.i=@xn--rombobjrn-67a.se header.b="D/qP+nt8"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.xn--rombobjrn-67a.se (nestor.xn--rombobjrn-67a.se [188.126.83.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B3C81732;
	Sun, 10 May 2026 19:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.126.83.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778442584; cv=none; b=J0h27knqkNsKgAR1VW9PwbujYDxJ+b9vQp1Fp+Hg40AxnQhSqYICJi6tnzytQK1BX79z2GMqlJ2WS4/e0YRmcw+lwd3RpJqyZ38O1TpXEvxSpXXR9bSLV6wr/heRnn8K9dbuLQNahwaFOcVInLxp9rf6becWSArRkqRbK1VHVNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778442584; c=relaxed/simple;
	bh=KoJ2odYCEQhTTQfZSeAaS/5IH8FrhRU1cqddkrINZ08=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DNHWjUJKaS7mFL/+kJcxnpZrRDFOMboz9PeADov5mvjJclwR6DXrd4jzVcgxlm0QjEd3upHl2YHUu6XjKRkwDaLst+Q5Z9nMZsv+S7wPCG92hSCogSBwryBZTYefsKMCCtnqA0UJGBkBJ9H/33UCBNMeIoeXKfL+Uy0+9c6VCGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xn--rombobjrn-67a.se; spf=pass smtp.mailfrom=xn--rombobjrn-67a.se; dkim=pass (2048-bit key) header.d=xn--rombobjrn-67a.se header.i=@xn--rombobjrn-67a.se header.b=D/qP+nt8; arc=none smtp.client-ip=188.126.83.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xn--rombobjrn-67a.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xn--rombobjrn-67a.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xn--rombobjrn-67a.se;
	s=a; t=1778442218; bh=KoJ2odYCEQhTTQfZSeAaS/5IH8FrhRU1cqddkrINZ08=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:From:Sender:Reply-To:Original-From:
	 Organization:To:CC:Subject:Original-Subject:Date:Message-ID:
	 In-Reply-To:References:Original-Message-ID:
	 Disposition-Notification-To:Disposition-Notification-Options:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:
	 Content-Features:Content-Alternative:Content-Location:
	 TLS-Report-Domain:TLS-Report-Submitter:MT-Priority;
	b=D/qP+nt82amgXuffCuwBqMINQ+u/lmXqZEr/7nlSZXLTgmXNYY9+obBXmvm77J6nG
	 p1x6zChw0sNR0GUozjG7tnc/zXSkYPW4JUcXiePmq4M57fVJu5NYY0j90a/PbySDWP
	 cZThJS/zUM0l10oF7/dr/lkeiu40GwELbdPBDOpcdF4unuFFf/qWqqlGKhPVfSkQr1
	 UhuAY67+Y4PBcP4a5P3Tzfr8FXIM23cv8DIkduR6d5EqwBB48DBDZESiAs4WKKDlLQ
	 ruN36Yn+e0U57thbm8YIhtXkS3cV8sBH2v0Q79OHQWqzXYrjsmS/+ocMROzz+uNZQ1
	 N8Of3t7DARx7w==
Received: from tag.xn--rombobjrn-67a.se (tag.xn--rombobjrn-67a.se [192.168.72.9])
	by smtp.xn--rombobjrn-67a.se (Postfix) with ESMTPSA id AA5CB409082F;
	Sun, 10 May 2026 21:43:38 +0200 (CEST)
Date: Sun, 10 May 2026 21:43:08 +0200
From: =?UTF-8?B?QmrDtnJu?= Persson <Bjorn@xn--rombobjrn-67a.se>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah
 Khan <skhan@linuxfoundation.org>, linux-leds@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: leds: uleds: Make the documentation match the
 code.
Message-ID: <20260510214308.09652225@tag.xn--rombobjrn-67a.se>
In-Reply-To: <20260507131128.GM305027@google.com>
References: <20260402220811.4804DD8F722@tag.xn--rombobjrn-67a.se>
 <20260423152655.GF170138@google.com>
 <20260424194714.71de0ef6@tag.xn--rombobjrn-67a.se>
 <20260507131128.GM305027@google.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/T26XZ=bGSRSST3leRrRkr4W";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Rspamd-Queue-Id: 5B7925060B2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[xn--rombobjrn-67a.se:s=a];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8078-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[xn--rombobjrn-67a.se];
	DKIM_TRACE(0.00)[xn--rombobjrn-67a.se:+];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bjorn@xn--rombobjrn-67a.se,linux-leds@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,xn--rombobjrn-67a.se:dkim]
X-Rspamd-Action: no action

--Sig_/T26XZ=bGSRSST3leRrRkr4W
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Lee Jones wrote:
> On Fri, 24 Apr 2026, Bj=C3=B6rn Persson wrote:
>=20
> > Lee Jones wrote: =20
> > > On Thu, 02 Apr 2026, Bj=C3=B6rn Persson wrote:
> > >  =20
> > > > +The current brightness is found by reading a whole int from the ch=
aracter   =20
> > >=20
> > > Try not to shorten names in documentation "integer". =20
> >=20
> > The type is named "int" in C. There are many integer types, but it would
> > be wrong to try to read a uint16_t or a size_t or any other integer
> > type. The document needs to use the actual type name to make it clear to
> > the reader that they must read sizeof(int) bytes. =20
>=20
> Right, but you're not writing in C.

That's technically true, as I wrote my program in C++. It's far from my
favorite, but I had to use a language that can include C header files
and use C types, because /dev/uleds is a very C-centric interface.

If API documentation isn't allowed to name a type, then I withdraw the
patch. It's pointless to continue. The next programmer will also have to
read the code to find out what the true API is, like I did.

Bj=C3=B6rn Persson

--Sig_/T26XZ=bGSRSST3leRrRkr4W
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signatur

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE52SginNFTPmg+iBb4Tha3NZK5j8FAmoA38wACgkQ4Tha3NZK
5j/GeRAAvsV7X5CAynQjGiGbtWjeFZVGcUIpyyXBGfiXEGPnwIVoZez41KUzKlkt
QIw5qMTwe/k3iV7uBRdQ+KmTHQTQV2oZVWXBKO7WEvSi2rZHH+SGTF+ZhwsBr0Iv
joLOJS+m5vs49IiWnauaW86SWvXvF/xV5y9jRaecehdpPLnTucoig24bduV+C+nO
N9QvReK+DvSu1fpsMKzn1EAIqkF8xDP4ymcvKKNI1ljlAwC9cW7rtqOB+qQ34CbE
yeb9DnA9Mkrd09Z8SI5P90HkH20QFsmREZj49QW252eCBVoiXWPy5z1oAoulVW9C
aZxjVxRphNXHXhLnMXZh8Z/RAaJMcTAb1BTsz1V+gl9yELEdQav6wvArpCWFhcmw
P55y9ocyO36PSM3QHIyeL8ViZWna1qZrBYntjxPpNvsOtaK7n8iHExk9u3QB9ERJ
UrXCQPIbn4OxI8Gs7nUWH7g1u/47QmKssasA1AG8/Kehz8Mfccr7pUC5CRjjcbxO
k0ubmhAqyA7GulXZHU+cE2fLL+Qh7iiJ0zJv2Cpja5AgLPecDaScrTQf8BuMM2EH
DXwkEN/4gC59E/ceqGXMEkyxJxqpp+WW8Nyd3fBI/eI1iR/eJErQsv848stNIawP
DGwwq2xY25/omBlz8tvolzSMT1AYVKwGbJXlkw2+9EhgFW85/KU=
=qBgJ
-----END PGP SIGNATURE-----

--Sig_/T26XZ=bGSRSST3leRrRkr4W--

