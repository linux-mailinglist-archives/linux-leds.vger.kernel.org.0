Return-Path: <linux-leds+bounces-7734-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WESiESb732ntbAAAu9opvQ
	(envelope-from <linux-leds+bounces-7734-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 15 Apr 2026 22:55:02 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0283407C3D
	for <lists+linux-leds@lfdr.de>; Wed, 15 Apr 2026 22:54:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6D2BF301D320
	for <lists+linux-leds@lfdr.de>; Wed, 15 Apr 2026 20:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AC7D38BF81;
	Wed, 15 Apr 2026 20:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="W25hlMcl"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB3631AA87
	for <linux-leds@vger.kernel.org>; Wed, 15 Apr 2026 20:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776286480; cv=none; b=U0bGP0Wha/WQJYMpFVtbtmy0KvU+i9bbfXQqeE4vFc/qdUdx54HbmwapVV1wXbRdBwKMfm/HjoTwiLGrQQ5sNLZS7kP52u6PYKHBqbGqJ9LYlAhXtrNUlBClatjeV7mT+6UChIIo9vZet6Cflq3dAh4I6Ig/5KQ4JTK6f7WevXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776286480; c=relaxed/simple;
	bh=LIGk+6JCqpmGlvNj4DXjLt3b/bSistoZdo0VtPcUw8g=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=O4MasTHUBs22I6Aa0gQZftbNBYZPFRxzLDfGj2V+bhbF8KMMFQ/BybfWbmcstbCVUDvyQ5csj684OPJq+S3EkruRsjXMqJTuuNynFwXjo4jZUIqSI3Wll7GoXXujKHL5BQVwyAytMO8nJM0+KZg3Eb4Wy5Ts1cBHUUkkWJ+OFGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=W25hlMcl; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 1ACFF240027
	for <linux-leds@vger.kernel.org>; Wed, 15 Apr 2026 22:54:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1776286471; bh=sqQbN/cl0vomVFx2IrUxM16Wezbrd+GAm8eM7tvhzs0=;
	h=Message-ID:Subject:From:To:Cc:Date:Autocrypt:Content-Type:
	 MIME-Version:OpenPGP:From;
	b=W25hlMclZfWhhAxutMlR1LCVEW4PypxbJl+3fAJDQubHwyTDj62E6V0hkNVOvoS0r
	 hE83em7Ycq3sOL45PycL7mjXwJw1sdz7mWFNK1by4QWdYmpBKYErKHSp4A5TW6GQM5
	 rfs/JNfm9dRv0hBJxfg1c6ROL1XUHy6RgNfcfX+8mJKzAuD481kpsiinFUSFXzQbPQ
	 +Y0AUxZ9h8VlNM8G/AI6hMO+ox0gVhY0E8wdoq1f7h8eiD+7azksP+pJ/6cWHThp2x
	 BLmGfyGDsmbqp4S79dDrjXf8kG8Hue717xfj/6Jmz6pDOQ69vg44N8rGVElCFSNX+0
	 lbZBZG7rT9y1g==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4fwtg65z9Pz6tvq;
	Wed, 15 Apr 2026 22:54:26 +0200 (CEST)
Message-ID: <8c8555b3375375dac47a22fad40080fd5b4228a5.camel@posteo.de>
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
Date: Wed, 15 Apr 2026 20:54:29 +0000
In-Reply-To: <125cad6c-fb58-4498-a967-41778f6f91f6@kernel.org>
References: <20260411-synology_microp_initial-v7-0-9a3a094e763a@posteo.de>
	 <20260411-synology_microp_initial-v7-2-9a3a094e763a@posteo.de>
	 <20260412-cuddly-taipan-of-reputation-1cafe0@quoll>
	 <485ab9e829e902e3f29172059be8c3203062d06b.camel@posteo.de>
	 <125cad6c-fb58-4498-a967-41778f6f91f6@kernel.org>
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
 keydata=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
 jfGillcaQOqFZ3WwVqyzG1BUfTow==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-zCxPlgqRCfQxERdu6rZO"
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[posteo.de:s=2017];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,linaro.org,garyguo.net,protonmail.com,google.com,umich.edu,linuxfoundation.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-7734-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D0283407C3D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-zCxPlgqRCfQxERdu6rZO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2026-04-12 at 15:22 +0200, Krzysztof Kozlowski wrote:
> On 12/04/2026 15:21, Markus Probst wrote:
> > On Sun, 2026-04-12 at 10:26 +0200, Krzysztof Kozlowski wrote:
> > > On Sat, Apr 11, 2026 at 05:27:35PM +0200, Markus Probst wrote:
> > > > +properties:
> > > > +  compatible:
> > > > +    enum:
> > > > +      - synology,ds923p-microp
> > > > +      - synology,ds918p-microp
> > > > +      - synology,ds214play-microp
> > > > +      - synology,ds225p-microp
> > > > +      - synology,ds425p-microp
> > > > +      - synology,ds710p-microp
> > > > +      - synology,ds1010p-microp
> > > > +      - synology,ds723p-microp
> > > > +      - synology,ds1522p-microp
> > > > +      - synology,rs422p-microp
> > > > +      - synology,ds725p-microp
> > > > +      - synology,ds118-microp
> > > > +      - synology,ds124-microp
> > > > +      - synology,ds223-microp
> > > > +      - synology,ds223j-microp
> > > > +      - synology,ds1823xsp-microp
> > > > +      - synology,rs822p-microp
> > > > +      - synology,rs1221p-microp
> > > > +      - synology,rs1221rpp-microp
> > > > +      - synology,ds925p-microp
> > > > +      - synology,ds1525p-microp
> > > > +      - synology,ds1825p-microp
> > >=20
> > > Previous comment is not resolved. For example you stated that ds723p =
is
> > > compatible with ds725p, so this should be expressed.
> > Using this expression?
> >=20
> > properties:
> >   compatible:
> >     oneOf:
> >       - enum:
> >           - synology,ds923p-microp
> >           - synology,ds1522p-microp
> >       - enum:
> >           - synology,ds918p-microp
> >           - synology,ds415p-microp
> >       - const: synology,ds214play-microp
> > ...
> > ?
> > If so shall there each be a description?
>=20
> No, you changed nothing. You need fallbacks, please read example-schema
> or DTS101 slides.
The documentation says to "use fallback compatibles when devices are
the same as or a superset of prior implementations" [1].

Differences are not publicly documented in this device, making it hard
to tell if it is a superset or the same implementation. This would make
no device a fallback, as compatibility is not guaranteed. I could
imagine it would be an ABI breakage if a fallback is no longer
considered compatible with a device later on.

If deciding based on driver compatibility (accepting loss of features
and accounting for future driver features), one device entry would look
like this:

- items:
  - const: synology,ds923p-microp
  - const: synology,ds1522p-microp
  - const: synology,ds925p-microp # no current sensor from here
  - const: synology,ds425p-microp
  - const: synology,ds1525p-microp
  - const: synology,ds918p-microp
  - const: synology,ds1823xsp-microp # no fan failure check from here
  - const: synology,ds1825p-microp

which isn't maintainable in this size for ~22 entries.


But the example schema

- items:
  - enum:
    - vendor,soc4-ip
    - vendor,soc3-ip
    - vendor,soc2-ip
  - enum:
    - vendor,soc1-ip

also does not have all of the previous devices as fallbacks (assuming
"vendor,soc3-ip" is compatible with "vendor,soc2-ip" and so on).

Only adding devices as fallbacks with the exact same known feature set
would ignore the other devices with less features which would still
work (e.g. "synology,ds925p-microp" would still work on a ds923+, but
the "current sensor" would not be accessible).

So my question is, what makes a device eligible to be a fallback for
another device?

Just using the one device that is compatible with most of the devices
(having the least features) for all of the compatible devices as
fallback like in the example?


I would prefer a generic "synology,microp-x64" entry as fallback only,
which only supports the baseline of features (power led, status led,
shutdown/reboot, power button, fan speed), which all devices I am aware
of support.
But documentation explicitly states "DON=E2=80=99T use wildcards or device-
family names in compatible strings" [1], so I think I am not allowed to
do that.

Thanks
- Markus Probst

[1] https://docs.kernel.org/devicetree/bindings/writing-bindings.html

>=20
> Best regards,
> Krzysztof

--=-zCxPlgqRCfQxERdu6rZO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEgnQYxPSsWOdyMMRzNHYf+OetQ9IFAmnf+vcbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJEDR2H/jnrUPS9cYP/03t5hh6MXyY2hpnIpEO
5bv7fMrSvcw9pR9f6hlMla0caRKuoAvFxa0U3RNFKCDesvB9P54tXAceRDeIkYMG
2K2WtYlwalFnB5Kqn9eV8DNYlNfq+o9EIEKWTS+2lLC/SXxx8nW9luqVOifLomgh
sLmrd8ICjyV9JxSSP1rqxfQGrUp4VX95wsGt1zFeT6LmDRikBYUpmNdoQ62A2VaL
31BMSuXfnCYZPqDR2JRWqvm6rvPkXBrq4IbaPEVRdAp8dPDlX0X+1//BhVx7CrPw
7iNCqRAx+U9KvPR23k5Ig0zBxFT7b4ngch9/qtF2OYdxHmf52SZWkDGmoTj3qSXt
rTauYrUTN7sW4CB0Y2zni+ljOchOSfuE8WwJLDCa/anqJvCJLlf1jATP6tFO9jOV
A8bUDN7XSTF+QGR1de2pDDY5F1ScnKKXUTrn6sCF40fpmAvvPNQkH573gn3uxct2
gNvg87wS/QibyuvGJtdE/Mam0DinvzMK7oh0ojLb7/as/atJWrRmKW8AVdb1SWAI
IJkSRE9v9C54qf2+VvDmyYB9QZbETuLSHoEAoiSXBo5QfS3HuI9gPtBm8WWbtoL0
sFs8QMr4jrXTRMguIa6o/5aTk2DwfaK//zBhNumZPdU+PeiKLSLCtEn4skSRknvf
EVUw50yIk3E/NwiCYuOV+pFL
=b+JB
-----END PGP SIGNATURE-----

--=-zCxPlgqRCfQxERdu6rZO--

