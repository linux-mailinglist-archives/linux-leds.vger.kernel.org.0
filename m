Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1353310909
	for <lists+linux-leds@lfdr.de>; Fri,  5 Feb 2021 11:28:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231178AbhBEK0z (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 5 Feb 2021 05:26:55 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:36840 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229763AbhBEKYY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 5 Feb 2021 05:24:24 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 803601C0B77; Fri,  5 Feb 2021 11:23:40 +0100 (CET)
Date:   Fri, 5 Feb 2021 11:23:38 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Sven Schuchmann <schuchmann@schleissheimer.de>
Cc:     Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/4] leds: lp50xx: add setting of default intensity
 from DT
Message-ID: <20210205102338.GA27854@amd>
References: <20210204143726.27977-1-schuchmann@schleissheimer.de>
 <20210204145201.GB14305@duo.ucw.cz>
 <DB8P190MB063482D8E38C0529AD16A4D5D9B29@DB8P190MB0634.EURP190.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="HcAYCG3uE/tztfnV"
Content-Disposition: inline
In-Reply-To: <DB8P190MB063482D8E38C0529AD16A4D5D9B29@DB8P190MB0634.EURP190.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--HcAYCG3uE/tztfnV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > >      patternProperties:
> > >        "(^led-[0-9a-f]$|led)":
> > > @@ -99,6 +104,7 @@ examples:
> > >                 reg =3D <0x1>;
> > >                 color =3D <LED_COLOR_ID_RGB>;
> > >                 function =3D LED_FUNCTION_CHARGING;
> > > +               default-intensity =3D <100 0 0>;
> > >
> > >                 led-0 {
> > >                     color =3D <LED_COLOR_ID_RED>;
> >=20
> > Should this go to leds-class-multicolor.yaml ?=20
>=20
> I think then all drivers should support it,  but I cannot change all driv=
ers.=20
> So I would only leave it in there.

It really should be in common binding, and no, that does not mean you
need to change all the drivers.

Plus there's at most two of them at the moment.

Best regards,
							Pavel

--=20
http://www.livejournal.com/~pavelmachek

--HcAYCG3uE/tztfnV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmAdHKoACgkQMOfwapXb+vLFegCgp5fsWD5ZfPr20YCODLcTu/2F
YfMAmQEwkcFypjBKY/922iLgshcFNhVn
=2653
-----END PGP SIGNATURE-----

--HcAYCG3uE/tztfnV--
