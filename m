Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E80603245F1
	for <lists+linux-leds@lfdr.de>; Wed, 24 Feb 2021 22:47:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235777AbhBXVqP (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 24 Feb 2021 16:46:15 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:48056 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230330AbhBXVqO (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 24 Feb 2021 16:46:14 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 437ED1C0B80; Wed, 24 Feb 2021 22:45:29 +0100 (CET)
Date:   Wed, 24 Feb 2021 22:45:28 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] leds: bcm6328: improve write and read functions
Message-ID: <20210224214528.GA511@duo.ucw.cz>
References: <20210223081732.9362-1-noltari@gmail.com>
 <20210223081732.9362-2-noltari@gmail.com>
 <20210223083449.GA9750@amd>
 <3826ACDE-EFF2-4CC5-82EE-2DBC991CF996@gmail.com>
 <20210223085819.GB9750@amd>
 <F349F1C2-4D4F-4BF7-9ADC-6E879197405B@gmail.com>
 <a2da8ee6-a941-de04-3d45-56fb6cae596a@gmail.com>
 <20210224173649.GA10809@amd>
 <b43f49c1-8fb6-bedf-b560-9bd8c5ce872a@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="IS0zKkzwUGydFO0o"
Content-Disposition: inline
In-Reply-To: <b43f49c1-8fb6-bedf-b560-9bd8c5ce872a@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--IS0zKkzwUGydFO0o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > Less code duplication? It is immediately clear that driver including
> > this is specific for brcm SoCs and would not try to work somewhere else?
>=20
> Yes maybe, there still does not feel like this deserves a shared header,
> but as long as the generated code is the same, why not.

Ok, it seems patch is not needed at all, after all?

> >=20
> >> As far as using _relaxed() this is absolutely correct because the bus
> >> logic that connects the CPU to its on-chip registers is non re-ordering
> >> non posted. That is true on the MIPS BE/LE and ARM when configured in =
LE
> >> or BE.
> >=20
> > If that's right on particular SoC, then _relaxed and normal versions
> > should be same; drivers still need to use normal versions, because
> > they may be running on different SoC...?
>=20
> readl() includes barriers and read_relaxed() does not, hence the
> difference in the name. There is no need to pay the price of a barrier
> when a) the bus architecture guarantees non re-ordering and posting and
> that statement is true on all the SoCs where these peripherals are used,
> and b) you have worked on fine tuning your drivers to get the most
> performance out of them.

Exactly. When bus architecture guarantees ... readl and read_relaxed
can be the same. That knowledge should be in architecture code, not in
drivers.

(But it does not matter much when the drivers are
architecture-specific).

> Given these peripherals can only be used on CPUs/SoCs made by Broadcom,
> any argument about portability to other SoCs is moot.

Ok.
								Pavel

--=20
http://www.livejournal.com/~pavelmachek

--IS0zKkzwUGydFO0o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYDbI+AAKCRAw5/Bqldv6
8jvKAKDAMeVhVr1yspG9mMfPYO/0EFpXRgCgnu7pOAKu4FSk7HnYa6MrHsW7uQ8=
=kaHi
-----END PGP SIGNATURE-----

--IS0zKkzwUGydFO0o--
