Return-Path: <linux-leds+bounces-6039-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3E7C40FF1
	for <lists+linux-leds@lfdr.de>; Fri, 07 Nov 2025 18:14:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 76BAE4E4722
	for <lists+linux-leds@lfdr.de>; Fri,  7 Nov 2025 17:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 067A63346B1;
	Fri,  7 Nov 2025 17:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ch4WLeyk"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD603334695;
	Fri,  7 Nov 2025 17:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762535685; cv=none; b=G3uWApnNN3QGt38TPH66ekAo+WxHLHF0sd1abGkNTwJeMCp9Xmy1Z71vkk0Wjo2M44TO6rfVnSG+WxgNhsh9TBkYoIuzfrbBxbIWqMfeaIWkQXi2pSC+VzlKdk1n7ldJIvdgYNCGv15AiDU+0AejhfkEwXjfjPN5sLuiYmu2H4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762535685; c=relaxed/simple;
	bh=iZ+FrXmrNg9m+vRphS3VtQYquQLEkFINHFmKNJIzHf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HCZiOLc/doG+UrfZ+OIAnsQvM4w3jbcsYg7w5cdDBrG6KzOVZE2l9KWVacLnanDm5itnJW6oe0PA/lhINEbEL3+RNv9ipP1NvB3LHp0h3iQXiulxvE8Iux7WZoXtxzOOiU8UHqQBaCC5TXsycOUh+NSa1MyyO/vt/5bqKp0lEnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ch4WLeyk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A450C19423;
	Fri,  7 Nov 2025 17:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762535685;
	bh=iZ+FrXmrNg9m+vRphS3VtQYquQLEkFINHFmKNJIzHf0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ch4WLeykxW0UEitLCeqR5iRGkb3N1IvMlWvvO2kVip+YATE5uJqoryTiLs1VKE1c4
	 fOC0t29HS+RHFklWe+3LyA7a2BxHfqj3W1RwbHeiDrm/5kyIwLpXQsc1sHJi+hz/L2
	 vMfcZjUHYTkie+9w5AnCxlBH3l9a/hJtW2aRHmw3f09supzpeDBGKKuebZ3AeNUO4n
	 bnTFhrXQcQZR6jKAAMjVav+lmBCLgNqK38earv+Fl7ngPVI5a4XpHWqO2bPI/E2p4y
	 Zr56knLQp23Wfz/chOhb1p5d7lCZnOBVSzohujEStOWZO2oZ92kNvv6n4lXkqFvMpi
	 DqPmX21yGYLLQ==
Date: Fri, 7 Nov 2025 17:14:38 +0000
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: maudspierings@gocontroll.com, Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 1/4] dt-bindings: backlight: Add max25014 supporty
Message-ID: <20251107-estimator-flap-158b1dc054af@spud>
References: <20251107-max25014-v5-0-9a6aa57306bf@gocontroll.com>
 <20251107-max25014-v5-1-9a6aa57306bf@gocontroll.com>
 <aQ4RqNiGsngOWrV5@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s6RySbGPqQzAw7m8"
Content-Disposition: inline
In-Reply-To: <aQ4RqNiGsngOWrV5@lizhi-Precision-Tower-5810>


--s6RySbGPqQzAw7m8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 07, 2025 at 10:35:04AM -0500, Frank Li wrote:
> On Fri, Nov 07, 2025 at 01:49:58PM +0100, Maud Spierings via B4 Relay wro=
te:
> > From: Maud Spierings <maudspierings@gocontroll.com>
> >
> > The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
> > with integrated boost controller.
> >
> > Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>


> > +  led@0:
> > +    type: object
> > +    description: Properties for a string of connected LEDs.
> > +    $ref: common.yaml#
> > +
> > +    properties:
> > +      reg:
> > +        const: 0
>=20
> If reg is const 0, why need use led@0?

> > In the current implementation the control registers for channel 1,
> > control all channels. So only one led subnode with led-sources is
> > supported right now. If at some point the driver functionality is
> > expanded the bindings can be easily extended with it.

--s6RySbGPqQzAw7m8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQ4o/gAKCRB4tDGHoIJi
0jIvAQD0+hh9svmOHdU5hyVROE565agXP34VdWQ0eWMxVyOYNAD9GBNH6x0Xyw93
6zQVoS9McvIgls8VBa4UvQeukIIKJg4=
=JBJl
-----END PGP SIGNATURE-----

--s6RySbGPqQzAw7m8--

