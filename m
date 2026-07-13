Return-Path: <linux-leds+bounces-9067-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dwNAGoARVWp3jgAAu9opvQ
	(envelope-from <linux-leds+bounces-9067-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2026 18:25:36 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF04774D929
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2026 18:25:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=BaVOvfIR;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9067-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-9067-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E2FE23038162
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2026 16:20:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 871DC40B371;
	Mon, 13 Jul 2026 16:20:48 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DF231F9A8;
	Mon, 13 Jul 2026 16:20:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783959648; cv=none; b=XcYEnQKP0A4oDU54rXVeQKnhV113fZgpRimBlGGZVS+UAT9/G5bI2Q6h11oJtPQRqCDncBgRYLSdIPZVmSxVid5kqM77SRuVh46kM6ix8/PIl8cxskK+TFs4tXkBFqcHzylDucKZSm4uOYg1UTC2hezqFxUHt6IGwNgGfb3ZUH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783959648; c=relaxed/simple;
	bh=cSSW4ypFGq89oPs396o1/zwUZHbiHKzC+PaNOuaLAck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YzTBEqDP/Yl0AeHIHXV37uIXZZcQcVQC+WLhpXjCPkG7FW5O/E3HaOdNRVNfSZLA9jSV3a28PT1LwWP65X52UTP6ClxIqJe7/LINKa6OfN4MWfcX8Dn2OcPQy7BMRA06aAQQRylbvyUP2fRwYrem8LxkIf5tUO1xTwKL5Pctos8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BaVOvfIR; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED6421F000E9;
	Mon, 13 Jul 2026 16:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783959647;
	bh=cSSW4ypFGq89oPs396o1/zwUZHbiHKzC+PaNOuaLAck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BaVOvfIRnG7IO+xMF4flH3S1TjP0VHwfFHsXIxwWQR8r9Re/RPNTE82fyCkByMqrO
	 MSckTdLVr7pwyD3Y6o4+7df42JhooFcBHokOa1haAKlVB+E+LzcRuvmxG0ixjJRR1i
	 JAvyeCMNx77QKkSXHt4+yVLM/xvG8zqXQXGKwcXYhk0BRSKh4Ujrw8QhmiBWhMziyC
	 hRFNXcPalCOMr9pSlsPA/11Om4t3K5Ldufv3SgAMGwWsLnF+zIsUThpCOjKB3ZISTp
	 kV0ZNUDCBGQ/iXDLqSfGHFaEDPjAcvD15XEcEqZjjJ2aiBa/7oY4EFdI9il8D0JT+W
	 yhLDYRUeqYF9w==
Date: Mon, 13 Jul 2026 17:20:43 +0100
From: Conor Dooley <conor@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/4] dt-bindings: leds: Document "gpio" trigger
Message-ID: <20260713-thorn-usher-c469ff4af0de@spud>
References: <20260711192842.845048-1-samuel@sholland.org>
 <20260711192842.845048-2-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UNnpKZMutGUXxLoK"
Content-Disposition: inline
In-Reply-To: <20260711192842.845048-2-samuel@sholland.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
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
	TAGGED_FROM(0.00)[bounces-9067-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,microchip.com:email,spud:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AF04774D929

--UNnpKZMutGUXxLoK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--UNnpKZMutGUXxLoK
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCalUQWgAKCRB4tDGHoIJi
0r7LAQCHZuS4ULfa1CohKUZKkj2cCcWXgBcGporY4iLJ5z+ZCAD/WVVFLEp85JrL
yHft5d3vx+rXL+xfyengmxXxeZZDpQg=
=G46P
-----END PGP SIGNATURE-----

--UNnpKZMutGUXxLoK--

