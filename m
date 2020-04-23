Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7F981B66E4
	for <lists+linux-leds@lfdr.de>; Fri, 24 Apr 2020 00:38:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726755AbgDWWiW (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 Apr 2020 18:38:22 -0400
Received: from vm1.sequanux.org ([188.165.36.56]:53215 "EHLO vm1.sequanux.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726057AbgDWWiV (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 23 Apr 2020 18:38:21 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by vm1.sequanux.org (Postfix) with ESMTP id B3340108124;
        Fri, 24 Apr 2020 00:38:20 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at vm1.sequanux.org
Received: from vm1.sequanux.org ([127.0.0.1])
        by localhost (vm1.sequanux.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id XG-rTuFs_W0y; Fri, 24 Apr 2020 00:38:18 +0200 (CEST)
Received: from localhost (softwrestling.org [188.165.144.248])
        by vm1.sequanux.org (Postfix) with ESMTPSA id 946B41080D6;
        Fri, 24 Apr 2020 00:38:18 +0200 (CEST)
Date:   Fri, 24 Apr 2020 00:38:18 +0200
From:   Simon Guinot <simon.guinot@sequanux.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>
Subject: Re: [PATCH] leds: netxbig: Convert to use GPIO descriptors
Message-ID: <20200423223818.GG15254@kw.sim.vm.gnt>
References: <20200415145139.155663-1-linus.walleij@linaro.org>
 <20200417125219.GC19028@duo.ucw.cz>
 <20200417180746.GD15254@kw.sim.vm.gnt>
 <CACRpkdaBTeVt-Fp2OVOS_T_E1T7q1wTFUDCQ=foN72SdhJnHjw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="JIpyCmsTxyPLrmrM"
Content-Disposition: inline
In-Reply-To: <CACRpkdaBTeVt-Fp2OVOS_T_E1T7q1wTFUDCQ=foN72SdhJnHjw@mail.gmail.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--JIpyCmsTxyPLrmrM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 17, 2020 at 10:58:24PM +0200, Linus Walleij wrote:
> On Fri, Apr 17, 2020 at 8:07 PM Simon Guinot <simon.guinot@sequanux.org> =
wrote:
> > On Fri, Apr 17, 2020 at 02:52:19PM +0200, Pavel Machek wrote:
> > > Hi!
> > >
> > > > This converts the NetXbig LED driver to use GPIO descriptors
> > > > instead of using the legacy interfaces in <linux/of_gpio.h>
> > > > and <linux/gpio.h> to iteratively parse the device tree for
> > > > global GPIO numbers.
> > > >
> > > > Cc: Simon Guinot <simon.guinot@sequanux.org>
> > > > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > >
> > > Nothing obviously wrong here, but I'd not mind some testing.
> >
> > Hi Pavel and Linux,
> >
> > If you are not in a hurry, then I'll try it next week.
>=20
> No hurry, take the time you need. If it explodes, please help me fix it!

Well, nothing blew up. I successfully tested your patch on a LaCie
"2Big NAS" board and it appears that the LEDs are working nicely.

Thanks for converting this driver to use the GPIO descriptor API.

Tested-by: Simon Guinot <simon.guinot@sequanux.org>

Simon

--JIpyCmsTxyPLrmrM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEXW8DgovlR3VS5hA0zyg/RDPmszoFAl6iGNkACgkQzyg/RDPm
szpFFhAA2iFeRw+JVqSTQXVD25lQEPyAXGBorClThslMUBLZVH8tCD23JbHbDh00
E8oDXWBJz85s8AFgtGL18koIOAqxHOVxf3sEBgl7FE9uHGoC+6/bOpnWcWsp+hdY
7KCpU0ACEhp5SC/QCs1/yDmywRhLGDY/hO1sf7EADUfwC4ZdFvgVvFYcIvKv9kC4
BkBsz7LTpToXYVSYUybc0vG/03q33pPO18yhetokAqFXo5g7svbaNUJKmDgiDiRF
Ws6uDX1WaiGamEpy2z4EpIAdAy6Q6DjBwjyzo5AxKDWFR5s/FyU4wGOYNjjZIF2s
vx3wVpXy2zDcONKcGPm1hYqt8YMp9t5Ldoe8z5oYsFrllOQ9h+1MbQkZTLpOQ69z
DRxIlrqQIP6eXYmiErP/6pNUyFdcRHfNEkTO/MBgPLXNOJ5K0uSr8bKbk5nJGlyx
bhQjerfG9Mz8okqKcS6JhheFuwDXhphXGoFQXqfhP+lfdLs2T/ogXu37o5WSz+6o
PSoYiWJZHyDPSuMrVsKhH8am+slLQXZKG7UaNcnK4YrMjLdpsb3UIL6b1Ih58GjB
Lb9feIYUpieV0wIaVkTHvcby9jF288C2cb//MvSsUP7wbjc/yk+TWRkx8BkHOd9y
ic2tk5v7bSAIWp8sf34dx6WSObk5yb4ikF1PIQ+HVsob2v1eNfk=
=NAbS
-----END PGP SIGNATURE-----

--JIpyCmsTxyPLrmrM--
