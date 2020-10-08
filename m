Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CF79287244
	for <lists+linux-leds@lfdr.de>; Thu,  8 Oct 2020 12:10:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729391AbgJHKKy (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 8 Oct 2020 06:10:54 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:45714 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729210AbgJHKKy (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 8 Oct 2020 06:10:54 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 874121C0B8A; Thu,  8 Oct 2020 12:10:51 +0200 (CEST)
Date:   Thu, 8 Oct 2020 12:10:51 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     linux-leds@vger.kernel.org, dmurphy@ti.com,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: ledtrig-cpu: Limit to 4 CPUs
Message-ID: <20201008101051.GB16084@duo.ucw.cz>
References: <20200919093833.GA14326@duo.ucw.cz>
 <27e19ac9-4bc0-2945-3985-6cd6bb5407df@gmail.com>
 <20200920183401.GA21494@duo.ucw.cz>
 <781dcb5e-7bad-f740-5914-778ec8a7306b@gmail.com>
 <20200921224212.GA13299@amd>
 <db0b2dca-b7d3-8d76-cc6c-b399c1fa9921@gmail.com>
 <c60858bd-9a9f-5537-9f96-2e44db0c0d9e@gmail.com>
 <20200925094038.GC20659@amd>
 <5496ac44-003e-5f2a-7faf-88b4a264dedf@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="DKU6Jbt7q3WqK7+M"
Content-Disposition: inline
In-Reply-To: <5496ac44-003e-5f2a-7faf-88b4a264dedf@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--DKU6Jbt7q3WqK7+M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > I believe probability someone uses that with more than 4 CPUs is <
> > 5%.
>=20
> So you even didn't bother to check:
>=20
> $ git grep "default-trigger =3D \"cpu[4-9]"
> arch/arm/boot/dts/vexpress-v2m-rs1.dtsi: linux,default-trigger =3D "cpu4";
> arch/arm/boot/dts/vexpress-v2m-rs1.dtsi: linux,default-trigger =3D "cpu5";
> arch/arm/boot/dts/vexpress-v2m.dtsi: linux,default-trigger =3D "cpu4";
> arch/arm/boot/dts/vexpress-v2m.dtsi: linux,default-trigger =3D "cpu5";
>=20
> cpus are enumerated starting from 0, so there are more reasons for which
> your patch is broken:
>=20
> 1. There are mainline users.
> 2. You claim that you limit trigger use to 4 cpus, while the number is
>    actually 5, due to your condition:
> 	+		if (cpu > 4)
> 	+			continue;

Ok, fixed.

> 3. For platforms exceeding the limit the number of triggers registered
>    would not match the number all available cpus, for no obvious reason.
>    Better solution would be to prevent use of the trigger entirely
>    in such cases, which would need only to alter first instruction in
>    ledtrig_cpu_init(), which currently is:
>=20
> 	BUILD_BUG_ON(CONFIG_NR_CPUS > 9999);

Hmm. If I do that I'll get complains from various build bots...

But I might do dependency in Kconfig...

> The correct approach would be to create new trigger with better
> interface and then advise people switching to it.

Patch would be accepted.

> > Probability that someone uses it with more than 100 CPUs is << 1%
> > I'd say. Systems just don't have that many LEDs. I'll take the risk.
> >=20
> > If I broke someone's real, existing setup, I'll raise the limit.
>=20
> Is this professional approach - throw a potential bug at users and
> check if it will hit them? :-) And for no reason - you're not fixing
> anything.

I'm sorry I failed to meet your expectations.

I raised limit to 8.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--DKU6Jbt7q3WqK7+M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX37lqwAKCRAw5/Bqldv6
8ilmAKCCxf8EhDGDrCW5KX7b+zEwEljT5wCgtJQvdgI/YxFIcOoI4Bb8wynKnmU=
=spHC
-----END PGP SIGNATURE-----

--DKU6Jbt7q3WqK7+M--
