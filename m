Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84EFC32275A
	for <lists+linux-leds@lfdr.de>; Tue, 23 Feb 2021 10:01:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230088AbhBWI7E (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 23 Feb 2021 03:59:04 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:51578 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230014AbhBWI7C (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 23 Feb 2021 03:59:02 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 60A571C0B85; Tue, 23 Feb 2021 09:58:20 +0100 (CET)
Date:   Tue, 23 Feb 2021 09:58:19 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] leds: bcm6328: improve write and read functions
Message-ID: <20210223085819.GB9750@amd>
References: <20210223081732.9362-1-noltari@gmail.com>
 <20210223081732.9362-2-noltari@gmail.com>
 <20210223083449.GA9750@amd>
 <3826ACDE-EFF2-4CC5-82EE-2DBC991CF996@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="5I6of5zJg18YgZEa"
Content-Disposition: inline
In-Reply-To: <3826ACDE-EFF2-4CC5-82EE-2DBC991CF996@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--5I6of5zJg18YgZEa
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >> This is proven to work in BMIPS BE/LE and ARM BE/LE, as used in bcm283=
5-rng
> >> and bcmgenet drivers.
> >> Both should also be inline functions.
> >=20
> >=20
> >=20
> >> -#ifdef CONFIG_CPU_BIG_ENDIAN
> >> -	iowrite32be(data, reg);
> >> -#else
> >> -	writel(data, reg);
> >> -#endif
> >> +	/* MIPS chips strapped for BE will automagically configure the
> >> +	 * peripheral registers for CPU-native byte order.
> >> +	 */
> >=20
> > Bad comment style.
>=20
> I just wanted to copy the same comment as the one in bcm2835-rng and bcmg=
enet=E2=80=A6
> https://github.com/torvalds/linux/blob/3b9cdafb5358eb9f3790de2f728f765fef=
100731/drivers/char/hw_random/bcm2835-rng.c#L42-L60
> https://github.com/torvalds/linux/blob/3b9cdafb5358eb9f3790de2f728f765fef=
100731/drivers/net/ethernet/broadcom/genet/bcmgenet.c#L71-L88
>

Yeah, but ideally you should not be copying comments; there should be
one central place which does it and does it right.

								Pavel

--=20
http://www.livejournal.com/~pavelmachek

--5I6of5zJg18YgZEa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmA0w6sACgkQMOfwapXb+vLvMgCfYs6RiaK1D1v4cfgUOj82H3wH
AlYAnihI3nqL+vgqkWS0dzv+hioqDBLx
=wT7D
-----END PGP SIGNATURE-----

--5I6of5zJg18YgZEa--
