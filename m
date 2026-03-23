Return-Path: <linux-leds+bounces-7430-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kA+oF5JNwWmhSAQAu9opvQ
	(envelope-from <linux-leds+bounces-7430-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 15:26:26 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CB92F47A5
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 15:26:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9BD413111FDE
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 14:04:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9C2D3B47FD;
	Mon, 23 Mar 2026 14:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b054mkjT"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948D23AF660;
	Mon, 23 Mar 2026 14:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774274451; cv=none; b=hGFgx0gOA81d1grpvhYvnT573pL/rIAg2dz6BAIzXHwwQ36IORgSTNBWO0ngFDxelbgjooSJjV4DeSSH+1AI8GRhsDMoFaY6rW6LhgG8giqUyRMu4XsV1+0r52OTD/eH/0AZqOt/625LjG1uQG1qXQBrELqsZ/ZM2grluGFtjsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774274451; c=relaxed/simple;
	bh=wsIPtE9gLfUlD7CfcHAkLJ1WaXHfJ/+7bt2n8V8whaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oskn+JXnDJOUJBXmM9izdfLFNoDIKshVjc7QjmmgvSmFuArmJ7Hz04Ywhkn50QmlnFnw1fNIREacbsRoli13bPgr1B/fzr3tUS7U+Dkq5nCMIOW8ZqATv+lA9xLfYI0SgT5lFD/LJACAv1QkzVWciHCrXJfJ4ejL/o0ta4DPAiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b054mkjT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59B55C2BCB3;
	Mon, 23 Mar 2026 14:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774274451;
	bh=wsIPtE9gLfUlD7CfcHAkLJ1WaXHfJ/+7bt2n8V8whaQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b054mkjTtYEqGgZaf4/JWuUUq+D1cbRn4oz+QgtcGRhBaIsSbcON5Hb+Z9fSLN+87
	 D3JRT6J6hpQddK+TiwTbVmM/j+IGVTqI6cIYI+1EyX/r8HsrIbB0u22Ites7TsWKQs
	 81kFH9ISPKCWxz+aNcJGkqt8IDLtiOBBk3N7icL40mZ9fErys8BIcMZEEgSrMMM6R5
	 Puc/JmGYoAFl4bsGGnSL/8xqG4pZHj1Kf0U2M8T2cj//L+iTpI6bP2/yYtaMlB9wjG
	 1x3AEiHbs/P9jIeIacaotOzOBa6gYyC9lz0ri8huA4pt9BzDXFJiU7QoftyGNpgYXl
	 BFzFTDjlQAg/Q==
Date: Mon, 23 Mar 2026 14:00:43 +0000
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
Message-ID: <360a8b4a-6507-417a-9fc1-c53b14868657@sirena.org.uk>
References: <20260322-remove-device-find-by-of-node-v1-0-b72eb22a1215@gmail.com>
 <20260322-remove-device-find-by-of-node-v1-4-b72eb22a1215@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vparQmoOwDu5fr6U"
Content-Disposition: inline
In-Reply-To: <20260322-remove-device-find-by-of-node-v1-4-b72eb22a1215@gmail.com>
X-Cookie: Avoid gunfire in the bathroom tonight.
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7430-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,linaro.org,gmail.com,axentia.se,armlinux.org.uk,intel.com,linuxfoundation.org,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-leds,netdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: D4CB92F47A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--vparQmoOwDu5fr6U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 22, 2026 at 06:54:22PM -0700, Dmitry Torokhov wrote:
> In preparation to class_find_device_by_of_node() going away switch to
> using class_find_device_by_fwnode().

>  	struct device *dev;
> =20
> -	dev =3D class_find_device_by_of_node(&regulator_class, np);
> +	dev =3D class_find_device_by_fwnode(&regulator_class, of_fwnode_handle(=
np));

The regulator API is very deliberately specifically using the OF APIs,
not the ACPI APIs, since ACPI really doesn't want to model regulators.

--vparQmoOwDu5fr6U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnBR4oACgkQJNaLcl1U
h9CUPQf9Gr18nCuis7I7DLt40fSEPA95DJmYkmottRjJCAQ2LQSO6j6vqvSDa1Df
SkKWemoGYfYr0SipGuWaT94X5ReYqWmBIwW/Il1ONQ9TwpnUYHCaps4N7hA8uwV7
kLDMXftyQVR4qt24ZcpjI298/kWsaY1P28fMcRYfR+WUv1B5ijfMjjyS4jv9gwqZ
72/JD3NajSRbUpMYwM4nJxUnDlzj1C1YcTJC9TFDFRjMIrGVN1g1AiadGXA7h7pd
4d9DFlsweMKG1uUpdhPFZ0MDamVJzN+e6OMfXCMqSAYch0H0FyRAnXjhK5RUGRt4
Os3QT9yimnEfhwuE+VHBI8lUrD1mug==
=RApe
-----END PGP SIGNATURE-----

--vparQmoOwDu5fr6U--

