Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B601833B0BD
	for <lists+linux-leds@lfdr.de>; Mon, 15 Mar 2021 12:12:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229775AbhCOLMZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 15 Mar 2021 07:12:25 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:43220 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbhCOLMZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 15 Mar 2021 07:12:25 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id D32021C0B78; Mon, 15 Mar 2021 12:12:22 +0100 (CET)
Date:   Mon, 15 Mar 2021 12:12:22 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Rahul Tanwar <rtanwar@maxlinear.com>
Cc:     Arnd Bergmann <arnd@kernel.org>, "arnd@arndb.de" <arnd@arndb.de>,
        "dmurphy@ti.com" <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Cheol Yong Kim <ckim@maxlinear.com>,
        Qiming Wu <qwu@maxlinear.com>
Subject: Re: [PATCH] leds: lgm: fix gpiolib dependency
Message-ID: <20210315111222.GA10084@duo.ucw.cz>
References: <MN2PR19MB36933AFDC4531D0F7A984608B16C9@MN2PR19MB3693.namprd19.prod.outlook.com>
 <MN2PR19MB3693FBBD3E6DB8A916260D69B16C9@MN2PR19MB3693.namprd19.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="4Ckj6UjgE2iN1+kY"
Content-Disposition: inline
In-Reply-To: <MN2PR19MB3693FBBD3E6DB8A916260D69B16C9@MN2PR19MB3693.namprd19.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> On 15/3/2021 5:44 pm, Rahul Tanwar wrote:
>=20
> From: Arnd Bergmann <arnd@kernel.org><mailto:arnd@kernel.org>
>=20
> From: Arnd Bergmann <arnd@arndb.de><mailto:arnd@arndb.de>
>=20
=2E..

>=20
> diff<https://lore.kernel.org/lkml/20210308153052.2353885-1-arnd@kernel.or=
g/#iZ30drivers:leds:blink:Kconfig> --git a/drivers/leds/blink/Kconfig b/dri=
vers/leds/blink/Kconfig
> index 265b53476a80..6dedc58c47b3 100644

=2E..
>=20
> Acked-by: Rahul Tanwar <rtanwar@maxlinear.com><mailto:rtanwar@maxlinear.c=
om>

You may want to do something with your mail configuration. This is
quite corrupted.

								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--4Ckj6UjgE2iN1+kY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYE9BFgAKCRAw5/Bqldv6
8mCqAJ0UPjBFffBM+bycLyzjoiKGTpCeRQCfVY+IwUW8QbX0F8Ffp2ce4pDKScA=
=XdIp
-----END PGP SIGNATURE-----

--4Ckj6UjgE2iN1+kY--
