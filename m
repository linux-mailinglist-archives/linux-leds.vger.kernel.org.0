Return-Path: <linux-leds+bounces-7431-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gO4GCNB5wWkQTQQAu9opvQ
	(envelope-from <linux-leds+bounces-7431-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 18:35:12 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C65FB2FA085
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 18:35:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D3329304655C
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 17:16:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8533F3C73D8;
	Mon, 23 Mar 2026 17:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oEPcAVYx"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51643C5DB4;
	Mon, 23 Mar 2026 17:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774286174; cv=none; b=bbHoEiAE1uvW0K16qJXqr5LsxKNjRs22Ld1yUIc8i6c847fNWfbLBhY8JHGCqtgBFaOTRy+fy6dbU2Zv3KdbD01O5gM/UdKVdUuQ8GK7FHd3FAutow/LobHzyWceWCYz/6EkBei5NRHOndM2Cr/6oRONdR/Upz0REfQtnEY6nJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774286174; c=relaxed/simple;
	bh=GPZRjw9420otJR954wv9jlY5KaF4RQTzb5PccDoBlqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GP5FyKE415K+/0PxH3Y3yBJiHA63ACGwPRRQ7Jb9mCht3mvAyJFhZ2M+CWc8yf5dJYq6FYc49VHnmbdoymufpTnZBM7JgQit1ymfjY1y8jTWazKG02enCUZbtrHhrpokJrsdiz1AyxpPF9tY90rK2CBnuS+4Y2xsxbiC4v36vFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oEPcAVYx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8213C4CEF7;
	Mon, 23 Mar 2026 17:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774286173;
	bh=GPZRjw9420otJR954wv9jlY5KaF4RQTzb5PccDoBlqA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oEPcAVYx8EfysVPLpGplRNI3M4k/Ct3YJWskSAod8cjNc1kdUYhIGoTf63okXWz2q
	 0hEGs2DfACbPoNyzgdtj87k/P+cEFXjqR4zVObWBaUkYJisObzaPTFF88rBaqW7kDE
	 u44XlLVOUONXIUPzTC9AC634kEAVIofUv5uLsWXnrnV6jadm4XyQlj4vWrFFiFKajE
	 To4Ze8LqNXjukWlYqjZq7F8XbbETwBxXQK5qIyqZx2UXnkN7Gp69ERU2MgblYsng5A
	 A/wZC66xfEiHhhCI5f/gGI3mYjB7rlZ7Sw+E+px2pkPKpvS8rJRJTMHzbqXvw/P49f
	 S+GsHsIhgxKOA==
Date: Mon, 23 Mar 2026 17:16:04 +0000
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
Subject: Re: [PATCH 03/10] spi: switch to using class_find_device_by_fwnode()
Message-ID: <098e1856-feee-4f4b-8059-85a53967f6b3@sirena.org.uk>
References: <20260322-remove-device-find-by-of-node-v1-0-b72eb22a1215@gmail.com>
 <20260322-remove-device-find-by-of-node-v1-3-b72eb22a1215@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5CiJK9+3S3OZYzXr"
Content-Disposition: inline
In-Reply-To: <20260322-remove-device-find-by-of-node-v1-3-b72eb22a1215@gmail.com>
X-Cookie: Avoid gunfire in the bathroom tonight.
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7431-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,sirena.org.uk:mid]
X-Rspamd-Queue-Id: C65FB2FA085
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--5CiJK9+3S3OZYzXr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 22, 2026 at 06:54:21PM -0700, Dmitry Torokhov wrote:
> In preparation to class_find_device_by_of_node() going away switch to
> using class_find_device_by_fwnode().

>  struct spi_controller *of_find_spi_controller_by_node(struct device_node=
 *node)
>  {
> +	struct fwnode_handle *fwnode =3D of_fwnode_handle(node);
>  	struct device *dev;
> =20
> -	dev =3D class_find_device_by_of_node(&spi_controller_class, node);
> +	dev =3D class_find_device_by_fwnode(&spi_controller_class, fwnode);
>  	if (!dev && IS_ENABLED(CONFIG_SPI_SLAVE))
> -		dev =3D class_find_device_by_of_node(&spi_target_class, node);
> +		dev =3D class_find_device_by_fwnode(&spi_target_class, fwnode);
>  	if (!dev)
>  		return NULL;

Actually, no - this just looks weird.  We're in the middle of an OF
specific function but we're having to jump up to fwnode for no apparent
reason.  If we actually decide to get rid of the OF specific function
then I guess but I'm really not convinced this is an improvement in
isolation.

--5CiJK9+3S3OZYzXr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnBdVMACgkQJNaLcl1U
h9AZpwf+IYUP90323AiTlXT8gw1Dypm0TDgs0IOfZCsY6eI2ifZgGPN9bmjL/nqn
qOCQnievL6WWoQiEOvgXsLRJl9rBwFIoqSVqZ5KSwziQt3eVC1C8h2BBG1RRNUTs
iAN2o35mqWmLWMjutA6YleGKMYmsZYLPhv47Bn89wSF5X2/KO2oAUR3pc4t1UZwV
iB4S4xXHm268iBSZduYC+IqDTV8Dd6HABhODhHHz96h17qZlzPM64vxVlOU30dlc
QEHhAL5tfwE+km7QmFrPh176jDVmndTGdXRJbtRICsUHDLuIPIjeuCFwom9RyzhN
v8Jk4nJOfxCXEkLHHAlP8AtJaBLsrw==
=ncpO
-----END PGP SIGNATURE-----

--5CiJK9+3S3OZYzXr--

