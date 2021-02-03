Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7F7730DFDA
	for <lists+linux-leds@lfdr.de>; Wed,  3 Feb 2021 17:38:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234512AbhBCQg5 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 3 Feb 2021 11:36:57 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:45752 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231799AbhBCQgy (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 3 Feb 2021 11:36:54 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id EDDE21C0B9C; Wed,  3 Feb 2021 17:35:55 +0100 (CET)
Date:   Wed, 3 Feb 2021 17:35:55 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Sven Schuchmann <schuchmann@schleissheimer.de>
Cc:     Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] leds: lp50xx: add setting of default intensity from DT
Message-ID: <20210203163555.GA23019@duo.ucw.cz>
References: <20210119105312.2636-1-schuchmann@schleissheimer.de>
 <20210203142940.GB12369@duo.ucw.cz>
 <DB8P190MB06348FC85033135BFC3EF5C4D9B49@DB8P190MB0634.EURP190.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ZGiS0Q5IWpPtfppv"
Content-Disposition: inline
In-Reply-To: <DB8P190MB06348FC85033135BFC3EF5C4D9B49@DB8P190MB0634.EURP190.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2021-02-03 15:39:59, Sven Schuchmann wrote:
> Hello Pavel,
>=20
> > > In order to use a multicolor-led together with a trigger
> > > from DT the led needs to have an intensity set to see something.
> > > The trigger changes the brightness of the led but if there
> > > is no intensity we actually see nothing.
> > >
> > > This patch adds the ability to set the default intensity
> > > of each led so that it is turned on from DT.
> >=20
> > Do we need this to be configurable from device tree? Can we just set
> > it to max or something?
> >=20
> > Aha, this basically sets the initial color for LEDs the monochromatic
> > triggers, right?
>=20
> Let me try to explain in other words: I have one RGB-LED
> which consists of 3 Colors. Each of the three colors (Red, Green, Blue) y=
ou have
> to define in the DT. For example this is my setup for one RGB-LED which I=
 wanted
> to show the heartbeat in Red (half intensity):
>=20
>                                 multi-led@3 {
>                                         #address-cells =3D <1>;
>                                         #size-cells =3D <0>;
>                                         reg =3D <0x3>;
>                                         color =3D <LED_COLOR_ID_RGB>;
>=20
>                                         linux,default-trigger =3D "heartb=
eat";
>                                         function =3D LED_FUNCTION_HEARTBE=
AT;
>=20
>                                         led-9 {
>                                                 color =3D <LED_COLOR_ID_R=
ED>;
>                                                 default-intensity =3D <10=
0>;
>                                         };
>=20
>                                         led-10 {
>                                                 color =3D <LED_COLOR_ID_G=
REEN>;
>                                         };
>=20
>                                         led-11 {
>                                                 color =3D <LED_COLOR_ID_B=
LUE>;
>                                         };
>                                 };
>=20
> If I would not have the default-intensity I would actually see nothing,
> since the intensity (which goes from 0-255) of each led is initialized wi=
th 0.
>=20
> I hope I could clarify this a little more?

Yes, sounds reasonable. Could we get default intensity of 100% on all
channels if nothing else is specified?

Or maybe simply "if intensity is not specified, start with 100%, and
use explicit =3D0 if other color is expected".

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--ZGiS0Q5IWpPtfppv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYBrQ6wAKCRAw5/Bqldv6
8oYqAJ9zXvIQPTznpEndEdPE2Ht/6128KACgo1CHMC/SmJsoqpFkMhE2SgSlehc=
=SBrF
-----END PGP SIGNATURE-----

--ZGiS0Q5IWpPtfppv--
