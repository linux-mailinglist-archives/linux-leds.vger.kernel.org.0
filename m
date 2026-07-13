Return-Path: <linux-leds+bounces-9066-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iDolJukQVWpjjgAAu9opvQ
	(envelope-from <linux-leds+bounces-9066-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2026 18:23:05 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BC974D8DD
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2026 18:23:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=JledqyFq;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9066-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-9066-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F1E1E3012D1B
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2026 16:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9935B3EBF1A;
	Mon, 13 Jul 2026 16:17:57 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895E030F92D;
	Mon, 13 Jul 2026 16:17:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783959477; cv=none; b=UyVa3voreW6i3XLSllHlXZdB042YSYtxEl0YEjLBF3ImIUd6YyCW3o6v4ZEFJ8GCEicjAY/W05L/cG7HXgXKoBbUHdIuUkyT5XldT/R5XXfSPxHmiyqdF80I2l30VblBiC3LaA8AKHxBVwkvA2vuZHZVhcaOQgWXH3sWW62yNfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783959477; c=relaxed/simple;
	bh=tuwF9vwESMLqkD+bDFietU0mxhnReLF+5GhxbApRbqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IPXh6cO+Txd0IpXKzKkPa/WAaRBWosP4uEFCVYv87wMHSNh9wLoeQDFZ8A1HNbHP/gx4/TRBOzXwHhOcrWJFLD6j55pemjapgsJaLHVAcBzU81zWRF/HVY5PvwQZGslJ9c4h7OkTk6Qe+GFgERA2RQrEndrhROSEo1MQwz0rNq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JledqyFq; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ED641F00A3F;
	Mon, 13 Jul 2026 16:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783959476;
	bh=tuwF9vwESMLqkD+bDFietU0mxhnReLF+5GhxbApRbqg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JledqyFqn3TcSRwAL0y2b2vcOAjaHitnZRcP5Cnu+4wadG9f8IDngb8YvUQ1mCoaO
	 UDBx4imS2imCStDpgzCbZhTBtk/CbjSNLO4AMC2E4hz+bVAnBO4aN59rJTFvQfql4J
	 2XAqa6kp5Yd32f47K0oJYnognME+dhe9H/a9OY9w4V3dmlRVvyFpxXjbXGcZnSzSFP
	 X0ezjYLEE056P1qNRzN0dWOPq/zV1qVeFAJwDstbHW5dGByrRdr8gny9KVOEpkMK93
	 ZLswKiCeGYfz190CT0rBCs8B3Fcm65MsxU9j8gdv2pRkaqBW0Vg7f+HBvC9W+mevST
	 sABuQoRqCM+pA==
Date: Mon, 13 Jul 2026 17:17:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Jonas Rebmann <jre@pengutronix.de>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Sven Schwermer <sven.schwermer@disruptive-technologies.com>,
	Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel@pengutronix.de
Subject: Re: [PATCH RESEND v3] dt-bindings: leds: Add default-intensity
 property
Message-ID: <20260713-preachy-tinderbox-5d73eef5f106@spud>
References: <20260713-multicolor-default-v3-1-fb43f3f789cf@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s3WRRSQLhh5beZEZ"
Content-Disposition: inline
In-Reply-To: <20260713-multicolor-default-v3-1-fb43f3f789cf@pengutronix.de>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:jre@pengutronix.de,m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jacek.anaszewski@gmail.com,m:sven.schwermer@disruptive-technologies.com,m:pavel@ucw.cz,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kernel@pengutronix.de,m:krzk@kernel.org,m:conor@kernel.org,m:jacekanaszewski@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-9066-lists,linux-leds=lfdr.de];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,disruptive-technologies.com,ucw.cz,vger.kernel.org,pengutronix.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,spud:mid,microchip.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 13BC974D8DD

--s3WRRSQLhh5beZEZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--s3WRRSQLhh5beZEZ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCalUPrwAKCRB4tDGHoIJi
0gqCAP98rL/t1xK7uPgwytUSDHlpe11BjbBYcqn4IJ8OVZlP9gD+JwzM7NsMDFfG
4puEsdJDinSzumwRmPYHdNWbulqK/wM=
=zS4X
-----END PGP SIGNATURE-----

--s3WRRSQLhh5beZEZ--

