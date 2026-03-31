Return-Path: <linux-leds+bounces-7616-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EEn6BkwtzGkmQgYAu9opvQ
	(envelope-from <linux-leds+bounces-7616-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 31 Mar 2026 22:23:40 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0BB37121C
	for <lists+linux-leds@lfdr.de>; Tue, 31 Mar 2026 22:23:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 41C9C30369ED
	for <lists+linux-leds@lfdr.de>; Tue, 31 Mar 2026 20:23:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 004FC44E02A;
	Tue, 31 Mar 2026 20:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="lWiHmIX3";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="JJmhO17z"
X-Original-To: linux-leds@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A0644DB69;
	Tue, 31 Mar 2026 20:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774988617; cv=none; b=SDx4p0w861n21pZ3JWN5BPQqmk4KhcTpoUCiAYf5ztAnoqNiQsOUl29xN1hBGWMiOsrE/yZKEEGeBpc78WxxppVopkd6aXkptgcaj41EXyt2P95XXxL9dywWU+q51RGuwChueSoiBu0yq5E+KOcrVarfv6f6FrPd8mWOGDMP2Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774988617; c=relaxed/simple;
	bh=VOGMHVm3mRA42ZUHG5tlG0ubSoPynlOJXSvDfHRuIKo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rw7g8kTWqQJlXKdjsSM/KOHPs8T/K5tpxPqwI+hPimQenZd0tp1WfNs8QJJGMZAv8nvjlkkXZAUoLTGhe+F0YIWeel062bw8uOQYh1lsa6ELxp8FqBHe04nonN7VxAlIxL0EgJ55RgnfgCywLwOVfVqGeR+BnG3eXj3jPgfSFKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=lWiHmIX3; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=JJmhO17z; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Tobias Deiminger <tobias.deiminger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774988614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lYimr6WepS9kou2sOosB6BFu771qSPlPLJB8yiaWuWg=;
	b=lWiHmIX36sejOqB9TQTl+kwWNZIEUAXdssMTqFuP2wVqaA2kxvbBzvKhH+vkGzks7RbYnz
	G4kx+qBhpEG8F8Dd7xJYzuX1OfbipIUNC5+9GG744u8CQRkAzKF+qi3xV83zfsAIXr3RuR
	iYfZcnjJN1AeF2C+JFhZODjwCX5Ry8+mIH2r+PgBQrnGkAZ2lskIhGkO+YeoMjXniKp59s
	cplX6l2JE4DTCOLECF7r6QulS3xHITRsnay4dV1KX7XT2DOgE+JkQDA/mX11nHo/CQvVr0
	IKO3+YLP+MCKG+LWdPrknAd8roHBl3trxJnmVtUHdKipXxURrM75KfMEcXd1bA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774988614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lYimr6WepS9kou2sOosB6BFu771qSPlPLJB8yiaWuWg=;
	b=JJmhO17zFq3i6lkpVnnNoa8IY7EqSLd3gof5br7OahsFBidc2OPhpXp71RroPwY7eQljNc
	XRsJeHR4arzMlpBA==
To: Lee Jones <lee@kernel.org>
Cc: pavel@kernel.org, eajames@linux.ibm.com, riku.voipio@iki.fi,
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] leds: pca9532: don't stop blinking for non-zero brightness
Date: Tue, 31 Mar 2026 22:23:31 +0200
Message-ID: <7425682.G0QQBjFxQf@schlupp>
Organization: Linutronix GmbH
In-Reply-To: <20260331094730.GC3241346@google.com>
References:
 <20260321102121.1563365-1-tobias.deiminger@linutronix.de>
 <20260331094730.GC3241346@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart7479015.4vTCxPXJkl";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7616-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tobias.deiminger@linutronix.de,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[linutronix.de:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CF0BB37121C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

--nextPart7479015.4vTCxPXJkl
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Tobias Deiminger <tobias.deiminger@linutronix.de>
To: Lee Jones <lee@kernel.org>
Date: Tue, 31 Mar 2026 22:23:31 +0200
Message-ID: <7425682.G0QQBjFxQf@schlupp>
Organization: Linutronix GmbH
In-Reply-To: <20260331094730.GC3241346@google.com>
MIME-Version: 1.0

Am Dienstag, 31. M=C3=A4rz 2026, 11:47:30 Mitteleurop=C3=A4ische Sommerzeit=
 schrieb Lee Jones:
> On Sat, 21 Mar 2026, Tobias Deiminger wrote:
> [...]
> > --- a/drivers/leds/leds-pca9532.c
> > +++ b/drivers/leds/leds-pca9532.c
> > @@ -184,6 +184,8 @@ static int pca9532_set_brightness(struct led_classd=
ev *led_cdev,
> > =20
> >  	if (value =3D=3D LED_OFF)
> >  		led->state =3D PCA9532_OFF;
> > +	else if (led->state =3D=3D PCA9532_PWM1)
> > +		return 0; /* non-zero brightness shall not stop HW blinking */
>=20
> Comments should start with a capital letter.
>=20
> Also, as the final 'else' statement uses braces, should we perhaps take t=
he
> opportunity to add braces to all branches of this conditional block?

Thanks for taking a look, sounds reasonable. Will adjust the comment and K&=
R-ify the
hunk in v2.

=2D Tobias

> >  	else if (value =3D=3D LED_FULL)
> >  		led->state =3D PCA9532_ON;
> >  	else {
> >=20
> > base-commit: b2c87f5e98cd88095dbc6802197526703d5e4e48
>=20
>=20
--nextPart7479015.4vTCxPXJkl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEKUF1IxSAivls6X6ly2PCe21rOcoFAmnMLUMACgkQy2PCe21r
Ocqz8w/+Op2M0MLdQEQ4eW4/Bfq7/FoId0MhiqRNWc8jKS7KrLQr4FA9FmEi2Vlp
vo4Xiq1mDEoq/Ps4hOQz6M2f0iLag20bCeI1vABkxwchnzmSfKUjKW+VKOD3M5mi
ZOABBh8c9S4S3TPOpV4hD0NT9pirBY8mh8r52Y/oH5HKBS5AV5qVg4pFeLbiAwDj
IuU/AUwcUcu4VLGlGtGPHH4F+PEpM7CEG5xGNtKAfD8qSOpwgww+I3WS0E7ybflp
Pqq/nlln60YyTzt93pj2knOpNp5W69r4MUKg3D0a2cDN13aqg8eRwdK5RcSqylUU
qSwmSx5BPsNlSSNxZQvuf2xYWs3zZQ5Zgk0vVkj9OsThwuoU6YEDtPGMpReI2HgY
grS3NfrSQulRMPhYg4Cvdq5wcHsYa/tTIN3PQrjs0tOJwN9VSO9KFND8TUh18FDT
xobZOH8kfGTjTQxrRIogHqsdtS7OQuulLcG/KBSBpl6pqO1UTsnl7lDiObCq8ZV/
UG0P12uvBY//1bZ48ieUUUzpSq2fyBrDYt9swNyP8rB0LAZkCj48qzia+cAeVK0T
EtRPBYvEbq9JEVS5GgsLdNmKxL7L4YgNca8k00M9cMb7xlDA9VAnj/zuZr68YfDW
/c/D46jSNStNSgByLFU0JkiLpIOhMnEuvVMktUuNvErjDQfJ38s=
=rlZD
-----END PGP SIGNATURE-----

--nextPart7479015.4vTCxPXJkl--




