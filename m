Return-Path: <linux-leds+bounces-9070-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 48bHI4cUVWoCjwAAu9opvQ
	(envelope-from <linux-leds+bounces-9070-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2026 18:38:31 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 091E374DAB8
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2026 18:38:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=YGA9ko4V;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9070-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-9070-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C5203077E0A
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2026 16:34:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06D0743800A;
	Mon, 13 Jul 2026 16:34:55 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC6540B363;
	Mon, 13 Jul 2026 16:34:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783960494; cv=none; b=LMvkzmwqCNX4QLdcpTJqYgRu66urAiROoD1B4x2hS7qCIYaCu2quN7Zp+CHThNMtV0ZXkaT+4GwxUVTvNfBsylW6SjHeQlnkORoVwLez5Ceu+GCqH4+5d3Kp2WdSe7MP+C5aYQBaf+8RKmM44Yly85+gkphjARofVQDW1yIv3bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783960494; c=relaxed/simple;
	bh=na1uv642ZQrq6gWKyzyjjyTGH+8BPshBveflTbSNjgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ut7WUrm0OPAs9l47vgdCHmhixLcbELpRCLFWVFisMgnILUIGmJw2ZBcEKBUUIEC2Wsh72ipwZCeMjuYL+xjZQ3zABdexIYkPgEvM1wGvOykiL7c8eUJURUQGTr/GLSaNP8nNpcLgalP920QeO50KoQJdqfwlaf8P/9hyUnVZJMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YGA9ko4V; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77E381F000E9;
	Mon, 13 Jul 2026 16:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783960493;
	bh=TWl2pjBXORo/TSKlw37Ir+gVF0UuTAmSudez331KOlI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YGA9ko4VvaxB54Kl5hgoPWXgOPl/vRN7Vrr+YCZk2VGNJrdPWqXVcQfR7xRWbx/YJ
	 N/EvAm8bc8pXArHcwmHQuF9mHNHIAEggf9WUZqJ3lhLqwmjo3xiPppQ2RmeFhfbpXe
	 P/kyduGapmN2Nv3ij8Ni7BLCgDlwKztdI3bRR4CXOttZznIpN+PqrScKHSNdwEW+HW
	 U5an22ptcH9WeEb4Y6c8bxEHf7MclBCKD5yAPG4P5Y0XuFRVRy1wwYf9gwnkY91se6
	 GQ6eOH1U1AtKxIeVAV5kccdbKWVyJ+nNSzI6MjLHgDm2XRm6IKaMVIAwauhQWDLNps
	 FubqAP1mP6Owg==
Date: Mon, 13 Jul 2026 17:34:49 +0100
From: Conor Dooley <conor@kernel.org>
To: Jonas Rebmann <jre@pengutronix.de>
Cc: Stefan Wahren <wahrenst@gmx.net>, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 1/2] dt-bindings: leds-group-multicolor: Introduce
 default-intensity
Message-ID: <20260713-undercoat-cranium-c018ab9ab642@spud>
References: <20260708224652.106632-1-wahrenst@gmx.net>
 <20260708224652.106632-2-wahrenst@gmx.net>
 <20260709-outsell-undamaged-6c8045d6115f@spud>
 <cacecf1f-3074-4768-825b-bf143fd36ce2@gmx.net>
 <0e3f38bd-ca70-4136-a313-564267cb9239@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Q2L6aTL7M8Oj44P9"
Content-Disposition: inline
In-Reply-To: <0e3f38bd-ca70-4136-a313-564267cb9239@pengutronix.de>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-9070-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jre@pengutronix.de,m:wahrenst@gmx.net,m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jjhiblot@traphandler.com,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-leds@vger.kernel.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmx.net,kernel.org,traphandler.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,spud:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 091E374DAB8

--Q2L6aTL7M8Oj44P9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 13, 2026 at 10:41:53AM +0200, Jonas Rebmann wrote:
> Hi Stefan,
>=20
> Thanks, for CCing me here.
>=20
> On 2026-07-13 10:23, Stefan Wahren wrote:
> > sorry, I missed this. Thanks for pointing to this patch. In general i'm
> > fine with this approach, but there is something which confuses me.
> > Looking at the description, there is the statement: [default-intensity]
> > "Defaults to 0".
> > This seems to be correct for the Linux implementation of
> > leds-pwm-multicolor, but is this really an expectation along all (multi
> > color) LEDs (at least for Linux)?
>=20
> You are right, sadly the initialization default of some
> multicolor-LED drivers differs.

Hmm, I forget if you had a default in leds common.yaml, but you should
probably remove it in this case and move the default to the individual
led type if so, rather than wait for support in a driver that doesn't
zero initialise.

> > E.g. leds-group-multicolor init the intensity with the maximum. So all
> > users of leds-group-multicolor should specify default-intensity for each
> > sub LED to achieve a defined behavior without breaking existing behavio=
r.
>=20
> I agree, once support is added to one of the drivers that doesn't
> zero-initialize, the documentation needs updating (because as you say,
> backwards-compatibilty probably beats consistency here).
>=20
> I'm also just noticing that my v3 for only the dt-bindings never arrived
> on the list (I think I was on a buggy b4 master), I'll re-send now.
>=20
> Regards,
> Jonas
>=20
> --=20
> Pengutronix e.K.                           | Jonas Rebmann               |
> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |

--Q2L6aTL7M8Oj44P9
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCalUTqQAKCRB4tDGHoIJi
0uA4AQDJIJjUl6dzr6MOLQnkT46rw8z86SUQrrxPm5vvDLjjYwEA9Nsu5J/eXBE1
vJ5Lm5GFrwZVWh/6D991825lwxncngA=
=NFPt
-----END PGP SIGNATURE-----

--Q2L6aTL7M8Oj44P9--

