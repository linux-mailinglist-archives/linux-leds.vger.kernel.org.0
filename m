Return-Path: <linux-leds+bounces-5274-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A41B30141
	for <lists+linux-leds@lfdr.de>; Thu, 21 Aug 2025 19:40:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7930E17D7C6
	for <lists+linux-leds@lfdr.de>; Thu, 21 Aug 2025 17:40:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9BD833A001;
	Thu, 21 Aug 2025 17:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hs/WZRy3"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B750338F4D;
	Thu, 21 Aug 2025 17:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755798007; cv=none; b=SVjz1H2IGeNuLlr2dHAL/RiPMmk4GAe/jm8udH/5FHE8spk+V84Vkl7xpNyVa5iqeTBj7myx0o6nQG1aSJYxVmwfH3EP7cdY1Kmfx2cwgVOzl+ryBbfkF/fJJM03ueK+ZRwwzWy377reWapPPUdDgoOO35ZZ+YVapg/tbYuFFAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755798007; c=relaxed/simple;
	bh=1sIllrMwfMD+NGq0n7bHU63yN5BaM6c6Q6yHOP6isOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tLg+lF1pA3PJNKofrlZuxHRJkgcn1amxApJAds4du3ffPyszEdx21JHYNeMCA2qMr7IEQij/+bcyHLSs94O9SbwHMEWK9U0p84VhZI19G1BNn7H3WUrEWy0uX7awTzOfHGm/zh72RRCPBqS9fB0F933Dkphpft75XmDnJ2XnNdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hs/WZRy3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3557AC4CEF4;
	Thu, 21 Aug 2025 17:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755798007;
	bh=1sIllrMwfMD+NGq0n7bHU63yN5BaM6c6Q6yHOP6isOI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hs/WZRy3brH8u5kvag32pb6pDd+bWfscsYuohJYnM1oQuWN3btomBG1so4tzhL6k+
	 yTBLVQjwZmWVwBdUznb+Pb5UNuc7OwTOEsH+6MGGWqX15MSmPRg3gh6oPAtVfVE829
	 O9uF5Z5IoOBzTzSFrjhIVRvXQ1D5pPNjEraDAD+aoPRAEjhhxoFIFc0goEoTdbPbP5
	 lJb+xkGROfhPzY8Cgd0Bpsjv9WSGF3RwTKcGISY2hhWWsDaElujIsrsPJ/J74DQUWT
	 lPsKXAAUYv8v1qVFT6Au8gSG4vS/LZr/3/OGmUl5MXGdWRjXZr+hZJwr9CEG1Ed1uw
	 Thxf+j2cSrGoA==
Date: Thu, 21 Aug 2025 18:40:01 +0100
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
Message-ID: <20250821-diminish-landlord-653a876e3cec@spud>
References: <20250820163120.24997-1-jefflessard3@gmail.com>
 <20250820163120.24997-5-jefflessard3@gmail.com>
 <CAHp75VfyR0cjnC6C6Xy8x9nTREdAgbjo18RLYNRzoLc6KmXnTA@mail.gmail.com>
 <20250820-clock-easiness-850342f716f3@spud>
 <CAHp75Ve-bM5ax3=0JkmaU-Kx1ME3VW34=Eqp2bRBA6mO6nZHmg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9a0pSoNSVPmCuODg"
Content-Disposition: inline
In-Reply-To: <CAHp75Ve-bM5ax3=0JkmaU-Kx1ME3VW34=Eqp2bRBA6mO6nZHmg@mail.gmail.com>


--9a0pSoNSVPmCuODg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 20, 2025 at 11:29:47PM +0300, Andy Shevchenko wrote:
> On Wed, Aug 20, 2025 at 10:52=E2=80=AFPM Conor Dooley <conor@kernel.org> =
wrote:
> >
> > On Wed, Aug 20, 2025 at 10:08:06PM +0300, Andy Shevchenko wrote:
> > > On Wed, Aug 20, 2025 at 7:31=E2=80=AFPM Jean-Fran=C3=A7ois Lessard
> > > <jefflessard3@gmail.com> wrote:
> > >
> > > Besides the missing commit message, the main part of this patch should
> > > be merged with the patch 2 where the YAML file is being added.
> > > Otherwise it will be a dangling file. I dunno if DT tooling has its
> > > own concept of a maintainer database, though.
> >
> > get_maintainer.pl will pull the maintainer out of the file, so it won't=
 be
> > truly dangling without a way to associate Jean-Fran=C3=A7ois with this =
file, if
> > that;s what you mean.
>=20
> Let's assume patch 2 is applied and patch 4 is not, what will be the
> result of get_maintainer.pl for the YAML file?

Andy Shevchenko <andy@kernel.org> (maintainer:AUXILIARY DISPLAY DRIVERS)
Geert Uytterhoeven <geert@linux-m68k.org> (reviewer:AUXILIARY DISPLAY DRIVE=
RS)
Rob Herring <robh@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVIC=
E TREE BINDINGS)
Krzysztof Kozlowski <krzk+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLAT=
TENED DEVICE TREE BINDINGS)
Conor Dooley <conor+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED =
DEVICE TREE BINDINGS)
"Jean-Fran=C3=A7ois Lessard" <jefflessard3@gmail.com> (commit_signer:1/1=3D=
100%,authored:1/1=3D100%,added_lines:471/471=3D100%,in file)
                                                                           =
                                         ^^^^^^^

devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TR=
EE BINDINGS)
linux-kernel@vger.kernel.org (open list)
AUXILIARY DISPLAY DRIVERS status: Odd Fixes


--9a0pSoNSVPmCuODg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKdZ8QAKCRB4tDGHoIJi
0gRIAQDCHeN6EUw4++cLtlKkOqbGoogoRAdewYIEJXFJCF8kxgEA5GJQ2XxYCo0S
q8S9jAuI17Nwy6+5/0FQ52Sncbnt5wg=
=oqX/
-----END PGP SIGNATURE-----

--9a0pSoNSVPmCuODg--

