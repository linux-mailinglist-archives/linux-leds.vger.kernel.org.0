Return-Path: <linux-leds+bounces-9068-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id baZ+BKIRVWp6jgAAu9opvQ
	(envelope-from <linux-leds+bounces-9068-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2026 18:26:10 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6C074D934
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2026 18:26:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=gAnf3T54;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9068-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-9068-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A89E30BFF4A
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2026 16:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D7F533A9E2;
	Mon, 13 Jul 2026 16:21:02 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882F331F9A8;
	Mon, 13 Jul 2026 16:21:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783959662; cv=none; b=FCAt69pZNVw5nKIVOpFhgu98SLp/zkVYZO1CVaBPiFQfW5J0xAYvgAglTUK5Dncxc74MkB3i+Z2XYela2mp4Vu5j+W6vAnRSIuI6nE29JX2xY7MDPMvj5T4oGYxBBabVB7vwVzJGEurAzg92uJUxaibhhjQIkbc0TMgq4eFjNGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783959662; c=relaxed/simple;
	bh=CZuU2nwPdOwLla8Is6fZKgR8o6flmQzOs610sHlRGF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SCITUB6NnLau07he4x0y8jlUeC6J1hCo8/tCXxgc6ydrOCLVPu6eHJlv1zEFlqQCEW+O0HijzQ0zL5TpJQE758hiG3fPcFFIkjxzrXfJKIawDy87FiVRBNFgLJv8rLofIrzNACvP6wcE+T666zEDm+qf1NUJpU9Mg9vF/uvVLLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gAnf3T54; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA9C31F000E9;
	Mon, 13 Jul 2026 16:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783959661;
	bh=CZuU2nwPdOwLla8Is6fZKgR8o6flmQzOs610sHlRGF8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gAnf3T54MOWerL4i9c1iRvBwGDSvRE1i0ux34P91ZULsdzmT7e7OG58wv8C0zhOXY
	 5I7KbPIQWuEftzmgDRCE6rSNfvGlyfaOUl1lKGf4vxXcXj1/uFcVwhksV/eouFg+VM
	 3BQazf+Rbubnx8pwRltBBmYCPasGtaC1BUP74cQ86tQYY7vlw/NwbVpzQvdcHqQ592
	 OSg5Cei1gEqM6vEbEjGJz6EtaUzEj8K4vEEH7d38zLTSh72slTaD4yHKTHSkeVEA+M
	 hmpSdbrCY0fbjfabDIObpE6762QYzc/vvYU/lzobV1AYdmR6iJBcyDvXjSehsp/pol
	 mv2BtQjgpv+Tg==
Date: Mon, 13 Jul 2026 17:20:56 +0100
From: Conor Dooley <conor@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/4] dt-bindings: vendor-prefixes: Add techvision
Message-ID: <20260713-chevron-buggy-fdb7812657f9@spud>
References: <20260711192842.845048-1-samuel@sholland.org>
 <20260711192842.845048-3-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="53fdQdUunGakAevX"
Content-Disposition: inline
In-Reply-To: <20260711192842.845048-3-samuel@sholland.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-leds@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:samuel@sholland.org,m:heiko@sntech.de,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:robh@kernel.org,m:linux-rockchip@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-leds@vger.kernel.org,m:lee@kernel.org,m:pavel@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-9068-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,microchip.com:email,spud:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4D6C074D934

--53fdQdUunGakAevX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--53fdQdUunGakAevX
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCalUQaAAKCRB4tDGHoIJi
0u8FAQDxnQgyP0pTRW9IemWBr9emhVbwxDD1qhepCwJraKJ1iAD/XIKwhwY2gXeY
9N4VkrL6k8eUsvVgTlf0rewh3twpIgE=
=U5O4
-----END PGP SIGNATURE-----

--53fdQdUunGakAevX--

