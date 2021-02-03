Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D9BD30E0E8
	for <lists+linux-leds@lfdr.de>; Wed,  3 Feb 2021 18:26:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232367AbhBCRYt (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 3 Feb 2021 12:24:49 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:56186 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229981AbhBCRYC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 3 Feb 2021 12:24:02 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 542691C0B9C; Wed,  3 Feb 2021 18:23:02 +0100 (CET)
Date:   Wed, 3 Feb 2021 18:23:02 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek Behun <marek.behun@nic.cz>
Cc:     Sven Schuchmann <schuchmann@schleissheimer.de>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] leds: lp50xx: add setting of default intensity from DT
Message-ID: <20210203172302.GB23019@duo.ucw.cz>
References: <20210119105312.2636-1-schuchmann@schleissheimer.de>
 <20210203142940.GB12369@duo.ucw.cz>
 <DB8P190MB06348FC85033135BFC3EF5C4D9B49@DB8P190MB0634.EURP190.PROD.OUTLOOK.COM>
 <20210203163555.GA23019@duo.ucw.cz>
 <20210203182137.339f8470@nic.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="PmA2V3Z32TCmWXqI"
Content-Disposition: inline
In-Reply-To: <20210203182137.339f8470@nic.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--PmA2V3Z32TCmWXqI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > If I would not have the default-intensity I would actually see nothin=
g,
> > > since the intensity (which goes from 0-255) of each led is initialize=
d with 0.
> > >=20
> > > I hope I could clarify this a little more? =20
> >=20
> > Yes, sounds reasonable. Could we get default intensity of 100% on all
> > channels if nothing else is specified?
> >=20
> > Or maybe simply "if intensity is not specified, start with 100%, and
> > use explicit =3D0 if other color is expected".
> >=20
> > Best regards,
> > 								Pavel
>=20
> Is the property default-intensity documented in DT bindings?
>=20
> Wouldn't it be better if the property was used in the multi-led node
> instead of the channel node? I.e.
>   multi-led@3 {
>     color =3D <LED_COLOR_ID_RGB>;
>     default-intensity =3D <100 0 0>;
>   };

Yes, this would be better.

--=20
http://www.livejournal.com/~pavelmachek

--PmA2V3Z32TCmWXqI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYBrb9gAKCRAw5/Bqldv6
8lwEAJ97DLDrkxgNNI43oTtWvfSARyO+lACgtaQJ/qjQH5PZCE9JZY03DGw5O/0=
=2YLF
-----END PGP SIGNATURE-----

--PmA2V3Z32TCmWXqI--
