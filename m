Return-Path: <linux-leds+bounces-4705-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBB7AC2234
	for <lists+linux-leds@lfdr.de>; Fri, 23 May 2025 13:53:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 658C54A67AE
	for <lists+linux-leds@lfdr.de>; Fri, 23 May 2025 11:53:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D45C023506C;
	Fri, 23 May 2025 11:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="lxoCzArn"
X-Original-To: linux-leds@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D1420CCD3;
	Fri, 23 May 2025 11:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748001227; cv=none; b=UmfJ8OEx8fgejRWK3DfMTdpS5yjRkbELbc0LEqLpUMWw44YYKV6hNMMOtfhbYuaSmw6dl1h3PUf1EFBY1FpYrxp2u+XsYUWMwcIenz169cPgZLol9XymAJ2QL2IBaxXkC9ISeRSAPyXpzcoaKOFU4xcmEov/IOqzxY8rJAnuots=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748001227; c=relaxed/simple;
	bh=ImDTQZgR/Uit525GqvbBcjyPL4xY113MaIn+BFA55g4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oawceaGooDVi9uTTezeXCHGVLRcfnFzohHXUcL2Ndf1NEA1lPaI8A795IedP7ELTWMhsbcIVmK0wCaCst9T6Kyexxb4D2QE/pg7/IQ9M0xAtC3gK1nvXsfAtrIPCLwfcjgKfDoU4fzg7oW9uV6UuJmmKFE6Xdem55pHpZ622lfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=lxoCzArn; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 5A8711C01F1; Fri, 23 May 2025 13:53:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1748001216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Avs7y+xIjkRaGZOHuMIkcp4QqOg+TJXDVU5xS64kDGY=;
	b=lxoCzArnUlkwtVvJZzfnyp9fFb86CZuNJCa/4mBVtUwyIjCc52BGYh3MHdefr/PdA/oZxA
	iw5vsW92vcvCLVpPQVpqUKeIeumsFi1qwTGem64Ed1IeqLRpwi/YepS1JFgN7IBEuHrn+P
	XQ/jFRtoK28maLYOQsBM0dSm770ovmg=
Date: Fri, 23 May 2025 13:53:35 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Steffen Trumtrar <kernel@pengutronix.de>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] LED: Add basic LP5860 LED matrix driver
Message-ID: <aDBhv2fhMVUXNaqV@duo.ucw.cz>
References: <20250514-v6-14-topic-ti-lp5860-v2-0-72ecc8fa4ad7@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RZ2I2pXh5M5YoMQO"
Content-Disposition: inline
In-Reply-To: <20250514-v6-14-topic-ti-lp5860-v2-0-72ecc8fa4ad7@pengutronix.de>


--RZ2I2pXh5M5YoMQO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> The lp5860 is a LED matrix driver with 18 constant current sinks and 11
> scan switches which allows controlling up to 198 LED dots.

200 points. Is it likely to be used as individual LEDs?

>  Documentation/ABI/testing/sysfs-class-spi-lp5860   |  73 ++++

I'm not big fan of new ABI. Should currents / per channel dimming be
configured from dts (and not sysfs)?

Best regards,
								Pavel
--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, and Musk!

--RZ2I2pXh5M5YoMQO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaDBhvwAKCRAw5/Bqldv6
8keoAKCOMrigr3SrHxVWq0aItP2NREDxjQCgtFztYaeZfcwdYws2AqoZUeFgys8=
=SoZ8
-----END PGP SIGNATURE-----

--RZ2I2pXh5M5YoMQO--

