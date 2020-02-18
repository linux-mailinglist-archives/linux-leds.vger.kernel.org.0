Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 791E416250F
	for <lists+linux-leds@lfdr.de>; Tue, 18 Feb 2020 11:57:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726539AbgBRK5N (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 18 Feb 2020 05:57:13 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:54846 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726477AbgBRK5N (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 18 Feb 2020 05:57:13 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 76F431C0371; Tue, 18 Feb 2020 11:57:11 +0100 (CET)
Date:   Tue, 18 Feb 2020 11:57:10 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Rob Herring <robh@kernel.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: Convert common LED binding to
 schema
Message-ID: <20200218105710.GA28348@duo.ucw.cz>
References: <20200108001738.8209-1-robh@kernel.org>
 <bec9ab4a-da09-6ef1-7334-d19f11ab2523@gmail.com>
 <CAL_Jsq+bOWJM5nvtY58+2DRtWQNzOPiVX9P===NOk4eBaE5OEA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ZPt4rx8FFjLCG7dd"
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+bOWJM5nvtY58+2DRtWQNzOPiVX9P===NOk4eBaE5OEA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > Bindings for LED controllers can reference the common schema for the =
LED
> > > child nodes:
> > >
> > > patternProperties:
> > >   "^led@[0-4]":
> > >     type: object
> > >     allOf:
> > >       - $ref: common.yaml#
> > >
> > > Cc: Pavel Machek <pavel@ucw.cz>
> > > Cc: Dan Murphy <dmurphy@ti.com>
> > > Cc: linux-leds@vger.kernel.org
> > > Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> > > Signed-off-by: Rob Herring <robh@kernel.org>
> > > ---
> > > Jacek, Please take this via led tree
> >
> > Currently Pavel maintains LED tree. Pavel?
>=20
> As it doesn't look like there's any conflicts, I've applied this
> series to the DT tree.

Thank you!
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--ZPt4rx8FFjLCG7dd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXkvDBgAKCRAw5/Bqldv6
8uTmAJ4q9FOCilnz5IzvOIzO/Pvu+CTcIACgk95eQ06CVaeLv5XJZIbCQUSPV9I=
=mqJ6
-----END PGP SIGNATURE-----

--ZPt4rx8FFjLCG7dd--
