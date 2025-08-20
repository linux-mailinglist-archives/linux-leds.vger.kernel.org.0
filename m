Return-Path: <linux-leds+bounces-5265-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6879AB2E5DF
	for <lists+linux-leds@lfdr.de>; Wed, 20 Aug 2025 21:52:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EDEAA5E4125
	for <lists+linux-leds@lfdr.de>; Wed, 20 Aug 2025 19:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C67F126F2B2;
	Wed, 20 Aug 2025 19:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZuC0x3zE"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD942F4A;
	Wed, 20 Aug 2025 19:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755719523; cv=none; b=bie9t8yZkcv0aGWOgLDUaZvZnHCNZ8DveVLs1vnZVxpQzXphcqK+bGskCqqaBN81g1WQIg2u4IjKYJ0/YZrd0wIIDCjR/+xC5R0wjt+0M1EpAhasxV/icg33VXll6riO+n8w+lBrISLf7B8WMrMStcB2UUEY8zKQvLXx6o0fotY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755719523; c=relaxed/simple;
	bh=zGAyQrb62JlwMvikL117lzOzDR5dBsupAPSQ54LsUKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sU8l9zp+rvmE3IC3ijbcfyUaXtbxjEDjbFtVzd+52wX9LPf+xqzL8eNN9lAVUOljKbUlaFrdjWinV84KgiyuisYzGINdEF9C4U9Q7iRnHpYkbtuP3/P2Z/XgIMDJHB66feJOrca8ck6VDlQnPuR0/O0WtJKFLDOH9CHJiCsNwMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZuC0x3zE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32D04C4CEE7;
	Wed, 20 Aug 2025 19:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755719523;
	bh=zGAyQrb62JlwMvikL117lzOzDR5dBsupAPSQ54LsUKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZuC0x3zE4gY1tWkVNK9i4nhhTH4EbDDvBu2juzSEV7/jw15X+2uo84+nNGRFgUnnF
	 92bkohYSJ+2OJVEnztRDZCWhZ51mKfSwI2s8iUjbzxConu7HiUFFqhXQS++N0dSX85
	 iUPMYJ+YCKPFr9CUSoqnCiPyZQaTfZqIArdUwbZLAa8WKiJyunvYh5+Q4oxbc2ILd0
	 JLJZOlM5hc2HMwDlUemYPpQYT8I65Y+d5OybGu/T8imPmPyY3dbWbcP8AxFOXxn/Yl
	 /DuEyKtYmsppEGMdpRYF/B6C6CoMQTdpIjGwoLHu1OjgLTHAhp5NYH5jw/5bNCFCG1
	 X7QCWZyUCg5Kw==
Date: Wed, 20 Aug 2025 20:51:58 +0100
From: Conor Dooley <conor@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: =?iso-8859-1?Q?Jean-Fran=E7ois?= Lessard <jefflessard3@gmail.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Boris Gjenero <boris.gjenero@gmail.com>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Paolo Sabatino <paolo.sabatino@gmail.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v3 4/4] MAINTAINERS: Add entry for TM16xx driver
Message-ID: <20250820-clock-easiness-850342f716f3@spud>
References: <20250820163120.24997-1-jefflessard3@gmail.com>
 <20250820163120.24997-5-jefflessard3@gmail.com>
 <CAHp75VfyR0cjnC6C6Xy8x9nTREdAgbjo18RLYNRzoLc6KmXnTA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ED76KRMEHLfSRas1"
Content-Disposition: inline
In-Reply-To: <CAHp75VfyR0cjnC6C6Xy8x9nTREdAgbjo18RLYNRzoLc6KmXnTA@mail.gmail.com>


--ED76KRMEHLfSRas1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 20, 2025 at 10:08:06PM +0300, Andy Shevchenko wrote:
> On Wed, Aug 20, 2025 at 7:31=E2=80=AFPM Jean-Fran=C3=A7ois Lessard
> <jefflessard3@gmail.com> wrote:
>=20
> Besides the missing commit message, the main part of this patch should
> be merged with the patch 2 where the YAML file is being added.
> Otherwise it will be a dangling file. I dunno if DT tooling has its
> own concept of a maintainer database, though.

get_maintainer.pl will pull the maintainer out of the file, so it won't be
truly dangling without a way to associate Jean-Fran=C3=A7ois with this file=
, if
that;s what you mean.

--ED76KRMEHLfSRas1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKYnXgAKCRB4tDGHoIJi
0iIgAQDiRFM5SkzAyXH55vfBZqtQCGaLrGiXAkLlcUyyxoL5CAD+JTcy5r2rjqNV
J1FVxjeFIXCicwdRH1M/+3G3W13qTgY=
=ACTV
-----END PGP SIGNATURE-----

--ED76KRMEHLfSRas1--

