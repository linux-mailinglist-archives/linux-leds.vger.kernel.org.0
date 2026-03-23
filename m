Return-Path: <linux-leds+bounces-7449-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Os6OpiywWkYUwQAu9opvQ
	(envelope-from <linux-leds+bounces-7449-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 22:37:28 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A9B2FDD3F
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 22:37:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7D9E9306833B
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 21:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2B2537FF5D;
	Mon, 23 Mar 2026 21:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DMPpBa6P"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773A937D116;
	Mon, 23 Mar 2026 21:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774301775; cv=none; b=m3UaC7Gd6eP/URZ39t9ZSrRP0ZYzmuWuKrkRNLWPfakdN8T514qE4tfgXhnInx+tfix3BHNMKMAWKN2BA7Pdk/LMnoNWS5kfDnbIGm+98JoIVX1sk7dLJOXeOlB5R2VoW76wpkbcerHeZu6r+W74I/7OOhR2GuufVFk/1eRL6FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774301775; c=relaxed/simple;
	bh=IB+9SlAOh5ptPp2tmgKX5NSgSAr8HddPvomWcKvihkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NPECrmMWUddZRkwFZXMN5yM4MwyoeCl0If2+PE6JjH19a1Nf20xu3hbPBQGhiG2fIMTqaj/78B4gha8fSCZF9LBjrXqihufr1nJQN2cKKoYHaVaYz3eevuZEilRGHPzqf4YKlxeWaV4PbNM07ZqvKTR42E9FYeLVy0aV7HsU+z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DMPpBa6P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10169C4CEF7;
	Mon, 23 Mar 2026 21:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774301775;
	bh=IB+9SlAOh5ptPp2tmgKX5NSgSAr8HddPvomWcKvihkE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DMPpBa6P1TVWJ/aODdQdk67ShVHljEdYRxQQBwcoWKnIkT7yrOmARPxv9PXkbWrhO
	 h+ZMfMNkMGTyGPEkEOCKRMYGZ3CHAp/bvMt/wbipsiYRf33bbMr3mp9ifuB8lfQxiD
	 pEVuCAEc7ex6q53vi4NwzV6onQ7sZbEnnuFLBIkPtQW0Ua+wnVCKqw66kf7HgIOtoR
	 lFgqnQfJp8OXgkTkMI/m5CXJRcFQYlBZOhSMXjPNdfyFye7fkLqtq2CPKEPb/lAr4Q
	 FLMN7uQAKHu5TzS3ERpAn99i49HgiT4esMjFjFklZQNG8Bc+W36bH8OyKLn6Ey5lTN
	 nZDZHNELtFYoQ==
Date: Mon, 23 Mar 2026 21:36:07 +0000
From: Mark Brown <broonie@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>, Peter Rosin <peda@axentia.se>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Moritz Fischer <mdf@kernel.org>, Xu Yilun <yilun.xu@intel.com>,
	Tom Rix <trix@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-spi@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-fpga@vger.kernel.org, driver-core@lists.linux.dev
Subject: Re: [PATCH 04/10] regulator: of: switch to using
 class_find_device_by_fwnode()
Message-ID: <193e194a-498f-464f-b22c-c283c16db6c1@sirena.org.uk>
References: <20260322-remove-device-find-by-of-node-v1-0-b72eb22a1215@gmail.com>
 <20260322-remove-device-find-by-of-node-v1-4-b72eb22a1215@gmail.com>
 <360a8b4a-6507-417a-9fc1-c53b14868657@sirena.org.uk>
 <acGFksyx3SA0kJ5b@google.com>
 <7d46803e-b285-4e9c-8856-10100fa0ea85@sirena.org.uk>
 <cf92122d-6b15-458a-bf89-189a0a6874f7@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GoAgIAlGDIVYM8ig"
Content-Disposition: inline
In-Reply-To: <cf92122d-6b15-458a-bf89-189a0a6874f7@lunn.ch>
X-Cookie: This is a good time to punt work.
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7449-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,linaro.org,axentia.se,armlinux.org.uk,intel.com,linuxfoundation.org,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-leds,netdev];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A4A9B2FDD3F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--GoAgIAlGDIVYM8ig
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 23, 2026 at 09:01:47PM +0100, Andrew Lunn wrote:

> How do you handle deprecated OF properties? This is a problem i've run
> into before. A developer needs an ACPI binding, so they blindly
> convert from of_ to device_ without engaging brain. As a result, they
> bring all the deprecated OF properties we want to die into the brand
> new ACPI bindings.

Honestly that one hasn't really come up much for me - not too many
deprecated properties.

--GoAgIAlGDIVYM8ig
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnBskYACgkQJNaLcl1U
h9DUSwf9F2FhSCxRuGru0SblHA7RaerEEaw1yqAtRLt1txCS0WV8BPpB/DVZnGJ5
lMyagkdO4FZ4WQfp5unRTjX88YTdwnWCbAFUREHpAeC2Z6+WLDleD0oU8PQets1E
lWAcKNiWdIg82KhBI30iXmV9TrZjTr7DyDcFOxqkif2c2vI1kZOFjuf8arHmoyDw
i2sk9XKVUS4ImKWAnMNkOr74j6MtAjXlRdx23/gCXK6uzUeVr0M6r2MeKolcRNQA
H6CD0VGgilwNYVZWE1rvF+WrkkNQPYe4uIRUAHw9+WNufZ4vYzC82qFTXBbYkDUL
sLwVvX9kD7NrSEiQkeEuIcjrsTUtmw==
=3anU
-----END PGP SIGNATURE-----

--GoAgIAlGDIVYM8ig--

