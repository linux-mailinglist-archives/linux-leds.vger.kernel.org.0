Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EBE13EFD43
	for <lists+linux-leds@lfdr.de>; Wed, 18 Aug 2021 09:02:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238094AbhHRHCf (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 18 Aug 2021 03:02:35 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:47634 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237636AbhHRHCe (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 18 Aug 2021 03:02:34 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id CEDD01C0B7A; Wed, 18 Aug 2021 09:01:59 +0200 (CEST)
Date:   Wed, 18 Aug 2021 09:01:59 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Hermes Zhang <Hermes.Zhang@axis.com>
Cc:     Dan Murphy <dmurphy@ti.com>, kernel <kernel@axis.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Subject: Re: [PATCH v3] leds: leds-multi-gpio: Add multiple GPIOs LED driver
Message-ID: <20210818070159.GE22282@amd>
References: <20210329055847.13293-1-chenhui.zhang@axis.com>
 <20210804155221.GB25072@amd>
 <69ae0b3fd44c4a5796d125a5b97b9d78@XBOX01.axis.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="PPYy/fEw/8QCHSq3"
Content-Disposition: inline
In-Reply-To: <69ae0b3fd44c4a5796d125a5b97b9d78@XBOX01.axis.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--PPYy/fEw/8QCHSq3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > From: Hermes Zhang <chenhuiz@axis.com>
> > >
> > > Introduce a new multiple GPIOs LED driver. This LED will made of
> > > multiple GPIOs (up to 8) and will map different brightness to
> > > different GPIOs states which defined in dts file.
> > >
> > > Signed-off-by: Hermes Zhang <chenhuiz@axis.com>
> >=20
> > Thank you, it looks simple and mostly ok.
> >=20
> > Acked-by: Pavel Machek <pavel@ucw.cz>
> >=20
> > But it really needs to go in with devicetree documentation changes, and=
 they
> > need to be acked by devicetree maintainers. If you have that, please se=
nd it
> > in series.
> >=20
>=20
> Do you mean this one: https://lore.kernel.org/patchwork/patch/1402471/, i=
t's already in series.=20

I don't see Rob Herring's ack there.

Best regards,
						Pavel
--=20
http://www.livejournal.com/~pavelmachek

--PPYy/fEw/8QCHSq3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmEcsGcACgkQMOfwapXb+vLbgwCghkKagE1YQyWqaVfKcHCt/YG9
voQAoJtFadjtZAffGpuIvAI4vClNJHm6
=16pI
-----END PGP SIGNATURE-----

--PPYy/fEw/8QCHSq3--
