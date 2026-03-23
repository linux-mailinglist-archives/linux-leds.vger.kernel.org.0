Return-Path: <linux-leds+bounces-7437-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMi+DdePwWmuTwQAu9opvQ
	(envelope-from <linux-leds+bounces-7437-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 20:09:11 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E98DF2FBF01
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 20:09:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 33F8C304EA41
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 19:05:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2971A31A07F;
	Mon, 23 Mar 2026 19:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kZcytg0t"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA5931690E;
	Mon, 23 Mar 2026 19:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774292721; cv=none; b=rOhAL88J82WPSpA7QNAfHy9vtpDukAoEzWi8UVqfw6FECdjJwbjNlEGDn0jXdpTiVleowTTETWjDHMHg0yAOa43gkPHYIrz8uf/P61myRUM/6kwz+bYUzQANf8ZsTxBZZmysku/Axa7IG2miyzMju5Cw2XmtzMcfpu0zFIgmppI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774292721; c=relaxed/simple;
	bh=VK8zf88cWzLQQEyO5m2LxClsKajOayTmmbUa59w0yrU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h8KlV55ZbTcNlJxKnDFTt3jbXWMIzunXX6qszauTftX6dBNKAxna1VqCPPL/43dtQfkzruxpEBYblKZjbtEAFAZUuL3X5GqjC9euUSJ/WwBBcq9i9fNuHMs1ymsdrhEUABATySjhp+TWcS1fWTdg9vAW1moY4L/9YMowzkPiPak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kZcytg0t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 261DCC4CEF7;
	Mon, 23 Mar 2026 19:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774292721;
	bh=VK8zf88cWzLQQEyO5m2LxClsKajOayTmmbUa59w0yrU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kZcytg0t/0GQnQxOzIjNa6BOMIZQHOVbOghqaGVK00RX0XYe1uH8/XttMYpntSWCG
	 puy6uJ5WW2vwH7GfzzJRoiy47gpKbyP+CQdQz9dl86o6cZAol1ZaGhEX5qcA4FpwuN
	 hwJW1BhZ8nHxttypO3FuZHF5xXrf1OuXUBxot6yag1KDXAckrDftbqASzv+5RDdxUr
	 sMbTVsDeLwNAF6avDdkvfN/UPjIMiN9lrc2ltP7tuyBvG832K18N7Uc5BCU/YwVDE7
	 VZu+b7EED40/EHuw7bN1itg+CIODNdRebwrgscWHX8dBPBEOQTEMTl0B9gJM8m5h2h
	 ztYVhrk6TUR4w==
Date: Mon, 23 Mar 2026 19:05:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>, Peter Rosin <peda@axentia.se>,
	Andrew Lunn <andrew@lunn.ch>,
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
Message-ID: <7d46803e-b285-4e9c-8856-10100fa0ea85@sirena.org.uk>
References: <20260322-remove-device-find-by-of-node-v1-0-b72eb22a1215@gmail.com>
 <20260322-remove-device-find-by-of-node-v1-4-b72eb22a1215@gmail.com>
 <360a8b4a-6507-417a-9fc1-c53b14868657@sirena.org.uk>
 <acGFksyx3SA0kJ5b@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EnLlSF+aDasvSOkc"
Content-Disposition: inline
In-Reply-To: <acGFksyx3SA0kJ5b@google.com>
X-Cookie: This is a good time to punt work.
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7437-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,linaro.org,gmail.com,axentia.se,armlinux.org.uk,intel.com,linuxfoundation.org,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-leds,netdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,sirena.org.uk:mid]
X-Rspamd-Queue-Id: E98DF2FBF01
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--EnLlSF+aDasvSOkc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 23, 2026 at 11:28:27AM -0700, Dmitry Torokhov wrote:
> On Mon, Mar 23, 2026 at 02:00:43PM +0000, Mark Brown wrote:

> > The regulator API is very deliberately specifically using the OF APIs,
> > not the ACPI APIs, since ACPI really doesn't want to model regulators.

> For now? We also have software nodes and maybe we come up with something
> else in the future...

> I think we should use firmware-agnostic APIs as much as possible, and
> only use OF- or ACPI-specific ones when there is no generic equivalent.
> This makes the code most flexible.

I think this is a worrying idea for core code like this, we have
specific firmware bindings for specific firmware interfaces with the
different interfaces having very different ideas of how things should be
modelled.  The chances that firmware agnostic code is going to do the
right thing seem low, and encouraging the use of generic APIs that might
happen to run OK raises the risk that we'll get firmware vendors relying
on them and leaving us with a conceptual mishmash to sort through.

Software nodes are already a bit of a concern here TBH.

--EnLlSF+aDasvSOkc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnBjugACgkQJNaLcl1U
h9DGQQf+Mk0kzYDoB4rVGypXwOfdtMgCpkoWOzcoGOZoT5oIqbKWA2xKZp8YZ9lI
iN3X0Fsu/fIbEOD9FNjbJZ9qDqssjwF4J5C0jMRxwk08Suh9YRn+R/3pLvzepLs5
4P9aByiEU8BBGM3HPJ75vVTahxLy8ZqvrHJbX+/H5wlkCZVD2tdatnrnvNvjbQIo
S9NGzwZagxQkwkuw9BJ0DoZgRqiQH6xJi9kpr9uwdIzJMunmo/9FzMye6CHCEdgW
gWq8ynTVSPvQMbs81K7P1kKEyHMdrKW+SR9JsOb53ST2B6P9ErFaz33GFx6d6nr9
Q2enPr6UesV/0+0xDR+N8UmiycTfHA==
=/5RN
-----END PGP SIGNATURE-----

--EnLlSF+aDasvSOkc--

