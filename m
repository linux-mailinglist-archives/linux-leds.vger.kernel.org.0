Return-Path: <linux-leds+bounces-8419-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKY+BcTpHWp0fwkAu9opvQ
	(envelope-from <linux-leds+bounces-8419-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 01 Jun 2026 22:21:24 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8419862503D
	for <lists+linux-leds@lfdr.de>; Mon, 01 Jun 2026 22:21:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A826B3053FF3
	for <lists+linux-leds@lfdr.de>; Mon,  1 Jun 2026 20:20:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB02C3F44E6;
	Mon,  1 Jun 2026 20:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GoTpa7F2"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B526D3F4137;
	Mon,  1 Jun 2026 20:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780345225; cv=none; b=TLPzcReyD5h0glPa7N3TqVQ/ty/ZViJ/CNfdM6ymKoYbdjkNyKKV+zpkf6KxrwzyC+r8hjIUHCDtdLHto1+PHonIZYZwJ5T1PfidetOJyRfKicapeAl8b3OC18PYNlskAg5umrcCnJH+/9cIYeoJL6PWOSrQSK31Nvs5IZhoshI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780345225; c=relaxed/simple;
	bh=Exkr4abtOny4fk2uF2lAyxf+MBa15MEZYh2y9ORvrKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vr2OBJ36urxs8ZHwne+Kd7ZGc5vKZDC5oQMHOOMAXhCelAH27X8/5hUW5Xl9/l0LSkTDNdqtHq/cLPNzQQo8k3kJ501phjDxuztUYm4Nsris4NZYAgiBzsd7hRKGcuY+ZZ82Prx7GCUuWNAnQa9QIY32Ip9SXs6yc37lOfVdkVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GoTpa7F2; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDDF81F00893;
	Mon,  1 Jun 2026 20:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780345222;
	bh=9pw7yYD6dfg8fZFsX0OSivsYJ6wzSkuV+qhqqICMMi0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GoTpa7F2cPuZhnF2IQxjno+9Owwqswh0Ucg5twwYmoxNWCwQgHzYuZmVll8A9TgRb
	 0jJoy+xPtWQKcNT8ZcQdSg3pr9dQWun0uK1u4cI8K1pvgyTM0L1mJid3/zEItO8Och
	 ew3du9ZTbH8yKj75ttIpAsAT9RvpCzY6P4SndMu3dbQzH52uxjeqo2GRjeFj3sR7k9
	 zc+8H8eYtB5DEKEiD5CVlE5OM1vQaNRtuKSkP5mp4MtHTrbvft1iAk8w/8iAq7o2P8
	 zF78M5poJ2p8r2sU55C122qp9xoCJp4H4WWu1sR8+sRoHr9VA4HsjybjybrY9aIKL1
	 oZEOL06sbtXWA==
Date: Mon, 1 Jun 2026 21:20:17 +0100
From: Conor Dooley <conor@kernel.org>
To: Ninad Naik <ninadnaik07@gmail.com>
Cc: lee@kernel.org, pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, jonas.gorski@gmail.com,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, me@brighamcampbell.com,
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org
Subject: Re: [PATCH] dt-bindings: leds: bcm6358: Convert to DT schema
Message-ID: <20260601-recall-reprocess-6608ba60e0cb@spud>
References: <20260525033258.144291-1-ninadnaik07@gmail.com>
 <20260525-wreckage-gap-9d857408445a@spud>
 <CALJ9ZzS5NrnAnU5SSZXBrL1LEYidfZQMwM8d3V=Dbv2NXF8VyA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="debMrAJnFOVsPtSg"
Content-Disposition: inline
In-Reply-To: <CALJ9ZzS5NrnAnU5SSZXBrL1LEYidfZQMwM8d3V=Dbv2NXF8VyA@mail.gmail.com>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8419-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,brighamcampbell.com,lists.linux.dev,linuxfoundation.org];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 8419862503D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--debMrAJnFOVsPtSg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 31, 2026 at 12:45:00AM +0530, Ninad Naik wrote:
> >
> > > +patternProperties:
> > > +  "^led@(0|1?[0-9a-f])$":
> > > +    type: object
> > > +    $ref: common.yaml#
> > > +    description: Each LED is represented as a sub-node of
> > > +      this device.
> > > +
> > > +    properties:
> > > +      reg:
> > > +        description: LED pin number.
> > > +        minimum: 0
> > > +        maximum: 31
> >
> > Is this missing a maxItems: 1?
> >
> Thanks Conor for pointing this out. I will include it in v2.
>=20
> >
> > > +
> > > +    required:
> > > +      - reg
> > > +
> > > +    unevaluatedProperties: false
> >
> > I wonder if this should be additionalProperties: false instead, and list
> > the three properties mentioned by the text binding explicitly?
> >
> >
> > Cheers,
> > Conor.
> >
> I added unevaluatedProperties: false because my understanding was
> that explicitly listing the properties inherited from common.yaml would
> be redundant.
> I'd be interested to hear the maintainers' preference here, and can
> adjust this in v2 if needed.

If only those 3 are permitted, it's probably the better approach.

--debMrAJnFOVsPtSg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCah3pfgAKCRB4tDGHoIJi
0tSTAQC6MB1OdjoD2VJj97lH99AHuNew/y9+b75756Ry5NzTzQEAvLUR/wc1aCSe
dJFjzeuD7IOeSp/6u101hQzwHzUwFgU=
=q5D1
-----END PGP SIGNATURE-----

--debMrAJnFOVsPtSg--

