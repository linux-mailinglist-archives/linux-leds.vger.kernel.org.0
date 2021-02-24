Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1A8D32433A
	for <lists+linux-leds@lfdr.de>; Wed, 24 Feb 2021 18:37:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229594AbhBXRhd (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 24 Feb 2021 12:37:33 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:53088 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbhBXRhd (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 24 Feb 2021 12:37:33 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 7F0181C0B80; Wed, 24 Feb 2021 18:36:50 +0100 (CET)
Date:   Wed, 24 Feb 2021 18:36:50 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] leds: bcm6328: improve write and read functions
Message-ID: <20210224173649.GA10809@amd>
References: <20210223081732.9362-1-noltari@gmail.com>
 <20210223081732.9362-2-noltari@gmail.com>
 <20210223083449.GA9750@amd>
 <3826ACDE-EFF2-4CC5-82EE-2DBC991CF996@gmail.com>
 <20210223085819.GB9750@amd>
 <F349F1C2-4D4F-4BF7-9ADC-6E879197405B@gmail.com>
 <a2da8ee6-a941-de04-3d45-56fb6cae596a@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="AhhlLboLdkugWU4S"
Content-Disposition: inline
In-Reply-To: <a2da8ee6-a941-de04-3d45-56fb6cae596a@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >> Yeah, but ideally you should not be copying comments; there should be
> >> one central place which does it and does it right.
> >=20
> > I=E2=80=99m open to suggestions :).
> > Which central place would be a good place for you?
>=20
> I did consider creating an include/linux/brcm/brcm_io.h header or
> something like that but I am really not sure what the benefit would
> be.

Less code duplication? It is immediately clear that driver including
this is specific for brcm SoCs and would not try to work somewhere else?

> As far as using _relaxed() this is absolutely correct because the bus
> logic that connects the CPU to its on-chip registers is non re-ordering
> non posted. That is true on the MIPS BE/LE and ARM when configured in LE
> or BE.

If that's right on particular SoC, then _relaxed and normal versions
should be same; drivers still need to use normal versions, because
they may be running on different SoC...?

> We need the swapping for ARM because when running in ARM BE32, the data
> is going to be in the host CPU endian, but the register bus is hard
> wired to little endian.

Yeah I see you need to do some byteswapping. But I'm pretty sure not
all MIPS BE boxes do the magic swapping, right? And drivers/leds is
not a place where you encode knowledge about SoC byte swapping.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--AhhlLboLdkugWU4S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmA2jrEACgkQMOfwapXb+vL/AgCeOS4GOKBqZCUt/Csj+W5FZdyH
n1wAoKcDfUQrzWKWv+1GP8aXoI/EPBbD
=pLCR
-----END PGP SIGNATURE-----

--AhhlLboLdkugWU4S--
