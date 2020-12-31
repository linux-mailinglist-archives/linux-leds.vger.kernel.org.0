Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D25E2E7F09
	for <lists+linux-leds@lfdr.de>; Thu, 31 Dec 2020 10:40:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726470AbgLaJk3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 31 Dec 2020 04:40:29 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:54214 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726155AbgLaJk3 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 31 Dec 2020 04:40:29 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 9BFEC1C0B77; Thu, 31 Dec 2020 10:39:46 +0100 (CET)
Date:   Thu, 31 Dec 2020 10:39:45 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Alexander Dahl <post@lespocky.de>,
        Rob Herring <robh+dt@kernel.org>,
        Alexander Dahl <ada@thorsis.com>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-amlogic@lists.infradead.org, Jeff LaBundy <jeff@labundy.com>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v9 1/4] dt-bindings: mfd: Fix schema warnings for pwm-leds
Message-ID: <20201231093945.GA22962@amd>
References: <20201228163217.32520-1-post@lespocky.de>
 <20201228163217.32520-2-post@lespocky.de>
 <20201230185439.GC25903@duo.ucw.cz>
 <20201231083317.GB4413@dell>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ZPt4rx8FFjLCG7dd"
Content-Disposition: inline
In-Reply-To: <20201231083317.GB4413@dell>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > The node names for devices using the pwm-leds driver follow a certain
> > > naming scheme (now).  Parent node name is not enforced, but recommend=
ed
> > > by DT project.
> > >=20
> > >   DTC     Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml
> > >   CHECK   Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml
> > > /home/alex/build/linux/Documentation/devicetree/bindings/mfd/iqs62x.e=
xample.dt.yaml: pwmleds: 'panel' does not match any of the regexes: '^led(-=
[0-9a-f]+)?$', 'pinctrl-[0-9]+'
> > >         From schema: /home/alex/src/linux/leds/Documentation/devicetr=
ee/bindings/leds/leds-pwm.yaml
> > >=20
> > > Signed-off-by: Alexander Dahl <post@lespocky.de>
> > > Acked-by: Jeff LaBundy <jeff@labundy.com>
> > > Acked-by: Rob Herring <robh@kernel.org>
> >=20
> > Thanks, applied.
>=20
> Sorry, what?
>=20
> Applied to what tree?

I took it to (local copy) of leds-next tree on. But now I realised it
is mfd, not a LED patch, so I undone that. Sorry for the confusion.

Anyway, patch still looks good to me:

Acked-by: Pavel Machek <pavel@ucw.cz>
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--ZPt4rx8FFjLCG7dd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl/tnGEACgkQMOfwapXb+vL2VgCgjU5/nc2bmfwpIcF1pD2ZODxv
cMgAnR+qCehDZ4rG7JzcCf8qqHL+x3Wu
=uRXv
-----END PGP SIGNATURE-----

--ZPt4rx8FFjLCG7dd--
