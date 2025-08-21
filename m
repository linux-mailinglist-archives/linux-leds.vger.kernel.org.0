Return-Path: <linux-leds+bounces-5279-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D196B30594
	for <lists+linux-leds@lfdr.de>; Thu, 21 Aug 2025 22:32:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DCD016DADE
	for <lists+linux-leds@lfdr.de>; Thu, 21 Aug 2025 20:27:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB0C82D7DC6;
	Thu, 21 Aug 2025 20:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fzzx2DPw"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D21E2D7DC1;
	Thu, 21 Aug 2025 20:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755807112; cv=none; b=LBxKfmlD6Dj1tU7LUlogj0X8MeMjdUfEmOedS711RtTbMNVxDPuOMZUrb/+W5UPfmJiQXCwY4z0KR7L749qQMwTfnUniXsXBH/w4Ml0n0q56OQfUfcE5IAbm8gUT0to8/A5oJfA3GaGB1tjhtoef0J1MSL8kv8S4/9f/XaXnBmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755807112; c=relaxed/simple;
	bh=7UOumc/dJtyyg/QHnSWjD+BJvJ9yDJg2TGgCVbIk6CM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lUWfjXs53Ket06dTowXE1WvdWTATldTHmHq0BNp2PmurdlM+8agbSQS5bY1vUblXg3aF/PjQtqAgSQMMNK4ZqKFP9/DQIXgAtxsii8Iwzxm4LXg26j+YLTSkeYNxehT89dF+GIDnSIs0LL7uJgEHWpdIiubuklRaF+iQ+mp9XZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fzzx2DPw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDEADC113CF;
	Thu, 21 Aug 2025 20:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755807112;
	bh=7UOumc/dJtyyg/QHnSWjD+BJvJ9yDJg2TGgCVbIk6CM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fzzx2DPw9mcPZMFjVVeE3vDfbB+KsTvTOnjiRss1yZIQQxDOGeQpx3470+JJWdfsO
	 i1sriDdf22FFpp1If8dgdkNQL4vNBD4Cn5YKOPkKmm0KtBBoWaU13VzG/Zmxjehg8Q
	 fNR+hoVptU7F4jnjPJ+lJ0sSYjpd5MOeiMuWnY3UImZtXq1Hrxtx72eDNAKimjhO1F
	 XXth8RidvFkZmsKxU3c1knwY4UBeSmKZYRBZ79V3005xl8WsVLeuk0pzz7zBNps05W
	 Fz2hQUQaw7Vw9LBHELUopkY2fTVbb0uAe+wJNQRaS12AIzxsan3ATUJjt/YmFOA3Y2
	 RMAIs7/8XrHSA==
Date: Thu, 21 Aug 2025 21:11:46 +0100
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
Message-ID: <20250821-hardener-underpay-e30d1eb6de6b@spud>
References: <20250820163120.24997-1-jefflessard3@gmail.com>
 <20250820163120.24997-5-jefflessard3@gmail.com>
 <CAHp75VfyR0cjnC6C6Xy8x9nTREdAgbjo18RLYNRzoLc6KmXnTA@mail.gmail.com>
 <20250820-clock-easiness-850342f716f3@spud>
 <CAHp75Ve-bM5ax3=0JkmaU-Kx1ME3VW34=Eqp2bRBA6mO6nZHmg@mail.gmail.com>
 <20250821-diminish-landlord-653a876e3cec@spud>
 <CAHp75VcDDCjt4vTpnSCprfAzK+czJiB_PRDXuLkvtuHZg4SLEw@mail.gmail.com>
 <CAHp75VfVYkmYFHdQgs1+3=jy50SuOaEXcT8Q8qXS34ctxRYKbg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="knF+Ka0cSC/ofLUy"
Content-Disposition: inline
In-Reply-To: <CAHp75VfVYkmYFHdQgs1+3=jy50SuOaEXcT8Q8qXS34ctxRYKbg@mail.gmail.com>


--knF+Ka0cSC/ofLUy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 10:35:07PM +0300, Andy Shevchenko wrote:
> On Thu, Aug 21, 2025 at 10:33=E2=80=AFPM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Thu, Aug 21, 2025 at 8:40=E2=80=AFPM Conor Dooley <conor@kernel.org>=
 wrote:
> > > On Wed, Aug 20, 2025 at 11:29:47PM +0300, Andy Shevchenko wrote:
> > > > On Wed, Aug 20, 2025 at 10:52=E2=80=AFPM Conor Dooley <conor@kernel=
=2Eorg> wrote:
> > > > > On Wed, Aug 20, 2025 at 10:08:06PM +0300, Andy Shevchenko wrote:
> > > > > > On Wed, Aug 20, 2025 at 7:31=E2=80=AFPM Jean-Fran=C3=A7ois Less=
ard
> > > > > > <jefflessard3@gmail.com> wrote:
> > > > > >
> > > > > > Besides the missing commit message, the main part of this patch=
 should
> > > > > > be merged with the patch 2 where the YAML file is being added.
> > > > > > Otherwise it will be a dangling file. I dunno if DT tooling has=
 its
> > > > > > own concept of a maintainer database, though.
> > > > >
> > > > > get_maintainer.pl will pull the maintainer out of the file, so it=
 won't be
> > > > > truly dangling without a way to associate Jean-Fran=C3=A7ois with=
 this file, if
> > > > > that;s what you mean.
> > > >
> > > > Let's assume patch 2 is applied and patch 4 is not, what will be the
> > > > result of get_maintainer.pl for the YAML file?
> > >
> > > Andy Shevchenko <andy@kernel.org> (maintainer:AUXILIARY DISPLAY DRIVE=
RS)
> > > Geert Uytterhoeven <geert@linux-m68k.org> (reviewer:AUXILIARY DISPLAY=
 DRIVERS)
> > > Rob Herring <robh@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED=
 DEVICE TREE BINDINGS)
> > > Krzysztof Kozlowski <krzk+dt@kernel.org> (maintainer:OPEN FIRMWARE AN=
D FLATTENED DEVICE TREE BINDINGS)
> > > Conor Dooley <conor+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLAT=
TENED DEVICE TREE BINDINGS)
> > > "Jean-Fran=C3=A7ois Lessard" <jefflessard3@gmail.com> (commit_signer:=
1/1=3D100%,authored:1/1=3D100%,added_lines:471/471=3D100%,in file)
> > >                                                                      =
                                               ^^^^^^^
> >
> > Which is a git lookup heuristics. If you disable that, there is no
> > maintainer for the file. Try with --m and --no-git (IIRC the option
> > name).

Also, I think linewrap might done some fuckery cos it was the
"in file" I was pointing to, pretty sure that's not coming from git.
I tried ./scripts/get_maintainer.pl --nogit --nogit-fallback -f Documentati=
on/devicetree/bindings/auxdisplay/titanmec,tm16xx.yaml
(I think --nogit-fallback is the salient option, --nogit is a default
actually) and I got:
Andy Shevchenko <andy@kernel.org> (maintainer:AUXILIARY DISPLAY DRIVERS)
Geert Uytterhoeven <geert@linux-m68k.org> (reviewer:AUXILIARY DISPLAY DRIVE=
RS)
Rob Herring <robh@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVIC=
E TREE BINDINGS)
Krzysztof Kozlowski <krzk+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLAT=
TENED DEVICE TREE BINDINGS)
Conor Dooley <conor+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED =
DEVICE TREE BINDINGS)
"Jean-Fran=C3=A7ois Lessard" <jefflessard3@gmail.com> (in file)
                                                  ^^^^^^^
and the in file still appears.
devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TR=
EE BINDINGS)
linux-kernel@vger.kernel.org (open list)
AUXILIARY DISPLAY DRIVERS status: Odd Fixes

> Actually doesn't checkpatch complain in this case?

The usual warning about MAINTAINERS appears ye, the one that appears
whenever a file is moved, created or deleted. I personally don't care
about that, as long as the end result of a series deals with it since
the file will produce the correct maintainer list in a bisection etc
anyway. Of course, your subsystem your prerogative.

--knF+Ka0cSC/ofLUy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKd9ggAKCRB4tDGHoIJi
0rumAP9De46/73MOVgngZyV5AK9LyWOXePmU5X0dCUT8/XjpKwEAnsRD5eJ+kjTt
lmla59yRJHpp9dIezZkkESz+KLp6rg0=
=Lif/
-----END PGP SIGNATURE-----

--knF+Ka0cSC/ofLUy--

