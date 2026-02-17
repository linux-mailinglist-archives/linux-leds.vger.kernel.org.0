Return-Path: <linux-leds+bounces-6969-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cEMuBW2rlGl7GQIAu9opvQ
	(envelope-from <linux-leds+bounces-6969-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 17 Feb 2026 18:54:53 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E1C14EC5F
	for <lists+linux-leds@lfdr.de>; Tue, 17 Feb 2026 18:54:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 89B663028EF1
	for <lists+linux-leds@lfdr.de>; Tue, 17 Feb 2026 17:54:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF9BD372B49;
	Tue, 17 Feb 2026 17:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B/mnWuBa"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B071372B36;
	Tue, 17 Feb 2026 17:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771350889; cv=none; b=DAawOBphh+h8Sj8QZcSg/HAE8IHLVdspnd6+3b8bBTyot+GuvR4bvv134CHzwWHMuZ0wFiwC8jRTnKcnCIbbWShNrwSbyCvGuxA3DSAjGXM5fxUBczycuLfrw71G1kqmKWcl58jCZAg1eveulQVljznuwa7bgnn9UuKpPV1/tFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771350889; c=relaxed/simple;
	bh=LiiATGb9mLztIHueQqve7IaeHGvQYiZfoTdOKkfC2y0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nTqXth51HiZ4ecRJVEpN21njelhnGAIgXUKSzdz2SQ+NpF7ylupFZWqKjq3EYHIPams6N3jdIZlNsu4ePq6CSaNvXmCQO7Nb628oCtjStZU+09BLUH7kXebI0TnODrUpC8jE1i6tij+jpYyumKCnYq8NwLFazZlDXiYxjYQLevo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B/mnWuBa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7617AC4CEF7;
	Tue, 17 Feb 2026 17:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771350889;
	bh=LiiATGb9mLztIHueQqve7IaeHGvQYiZfoTdOKkfC2y0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B/mnWuBa6ZaSwCsP275HJ8f2GIPUygx0S8Cx1qTiQswMOVpdbaQ3DVKSkZQFt5xBO
	 ujZxauDis9KySFIMUw/dibHNdB5Wrx8jedzDJ1vCgSNp/HPp5rlSTk8tNTEtH8jKfE
	 xX7u1EnUHMXwCLTXV7Oe1C7AaCAx5n8rux07xMrkr6FUtwerGNXopyaYelWtop404b
	 AYl/6wbmp7QZujOYu/fQv/T5Yx7cpz3Y88sNqks2tRwxZCw4GimXReACjBd1KUyI1/
	 q8bseR6W83lOpCIxnXZxgTZnY6Vv6CcpPQUwScsedFBgxoQfGjC7xI00a6MB0GXhZJ
	 wckizMdp5uPNQ==
Date: Tue, 17 Feb 2026 17:54:45 +0000
From: Conor Dooley <conor@kernel.org>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Steffen Trumtrar <kernel@pengutronix.de>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: leds: lp5860: add enable-gpio
Message-ID: <20260217-shrill-running-283c112a76f3@spud>
References: <20260217-v6-19-topic-ti-lp5860-enable-gpio-v1-0-f5e8edeb5d74@pengutronix.de>
 <20260217-v6-19-topic-ti-lp5860-enable-gpio-v1-1-f5e8edeb5d74@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gaUxk0/KYR+pFMMw"
Content-Disposition: inline
In-Reply-To: <20260217-v6-19-topic-ti-lp5860-enable-gpio-v1-1-f5e8edeb5d74@pengutronix.de>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6969-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 67E1C14EC5F
X-Rspamd-Action: no action


--gaUxk0/KYR+pFMMw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--gaUxk0/KYR+pFMMw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaZSrZQAKCRB4tDGHoIJi
0tXEAQCjBqeWnBClZMU8ITOrNun1n+OxHfFXbdjvO+DlOcV8bQEApWRzVZG0se7h
zVHK3v8JUBhTmO4diMslOiqm+Geupwk=
=VSvy
-----END PGP SIGNATURE-----

--gaUxk0/KYR+pFMMw--

