Return-Path: <linux-leds+bounces-912-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B588604E5
	for <lists+linux-leds@lfdr.de>; Thu, 22 Feb 2024 22:36:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 086651C2342D
	for <lists+linux-leds@lfdr.de>; Thu, 22 Feb 2024 21:36:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09B0A137902;
	Thu, 22 Feb 2024 21:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="TaAJMXd1"
X-Original-To: linux-leds@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D1012D1E0;
	Thu, 22 Feb 2024 21:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708637775; cv=none; b=ODZP+9uY9vVCbDjF3UrMekDa3MxO+ZuiewycR20/M2v/739Ws9cwatY0OJpUGrmvSiOSzdBwloxdvDPVXDV/ansT5jF3qDB5RPGq0uURqdhAoCNrr9TTexikuelS6GM6nSZ3diUdemCu1DEo3LMq3SxZJkfcWOWZUIT2uaI4fh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708637775; c=relaxed/simple;
	bh=vuAaEiJCLJK2cNsjl/qEqbIOLPfcmVtss6kY5sClwbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aZCLtbHokrdZ2IyYxTu47Mq5dktNzOv+2eUEN92XcgJkchyV/OVrTKN59fO9YKfY5GkT5wTSdCfzLHuWTANXtrI22yPIxUXui+kIg8wEPWgrXburh8aTlQkC0/2Si5bFSlaOMbA6RJvMmaXJKUiiv1KU4XQWmx2d3tYELB9Nn58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=TaAJMXd1; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 806131C0080; Thu, 22 Feb 2024 22:36:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1708637770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RiAbSOg1V4wsQMn+whZ+yfkXiKtN4HGpCsJmgM0ywIs=;
	b=TaAJMXd1bifnIX5lis8dv/SDuYGIau9YOv3Xh+piopnkSZZt1WL5XCRf/JAWXe4jkEMG0h
	KQkR4ZKHf++Gllq+AJ4b4JyhlKV4+oE4JyaL0lXffi7xd4VAcLKUdKZunBCmhMRnU9wglL
	bxhj+A63hDeYxHE+zJQYjUJWyqc5/5g=
Date: Thu, 22 Feb 2024 22:36:09 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Aren Moynihan <aren@peacevolution.org>
Cc: linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
	Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
	Chen-Yu Tsai <wens@csie.org>, Ondrej Jirman <megi@xff.cz>,
	linux-sunxi@lists.linux.dev, Lee Jones <lee@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-leds@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Miles Alan <m@milesalan.com>, Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v2 1/4] leds: rgb: leds-group-multicolor: allow leds to
 stay on in suspend
Message-ID: <Zde+Sce+PAuC1U6g@duo.ucw.cz>
References: <20240206185400.596979-1-aren@peacevolution.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="B4lkKzSJHCjhcEG2"
Content-Disposition: inline
In-Reply-To: <20240206185400.596979-1-aren@peacevolution.org>


--B4lkKzSJHCjhcEG2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> If none of the managed leds enable LED_CORE_SUSPENDRESUME, then we
> shouldn't need to set it here. This makes it possible to use multicolor
> groups with gpio leds that enable retain-state-suspended in the device
> tree.
>=20
> Signed-off-by: Aren Moynihan <aren@peacevolution.org>

Thanks for the series.

Acked-by: Pavel Machek <pavel@ucw.cz>

Note this will change userland API and maybe break the LED for code
expecting old setup and hardcoding paths. I guess we should not
backport this to stable. But we should do this, because it is really
one LED and not three.

Best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--B4lkKzSJHCjhcEG2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZde+SQAKCRAw5/Bqldv6
8owvAKC5O0usOAHO4lNiUtD+OQPqk9DWqACfTanRh5WRYGfqZMAbzMJdVj8NVpQ=
=rcWe
-----END PGP SIGNATURE-----

--B4lkKzSJHCjhcEG2--

