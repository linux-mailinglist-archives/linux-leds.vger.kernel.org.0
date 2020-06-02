Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5B211EC35D
	for <lists+linux-leds@lfdr.de>; Tue,  2 Jun 2020 22:04:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728247AbgFBUEx (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 2 Jun 2020 16:04:53 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:39864 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbgFBUEx (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 2 Jun 2020 16:04:53 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id BF88E1C0BD2; Tue,  2 Jun 2020 22:04:51 +0200 (CEST)
Date:   Tue, 2 Jun 2020 22:04:36 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Rob Herring <robh@kernel.org>
Cc:     Dan Murphy <dmurphy@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        devicetree@vger.kernel.org,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v25 01/16] dt: bindings: Add multicolor class dt bindings
 documention
Message-ID: <20200602200436.GA6535@amd>
References: <20200526164652.2331-1-dmurphy@ti.com>
 <20200526164652.2331-2-dmurphy@ti.com>
 <20200527014902.GA859634@bogus>
 <20200527133948.GA5011@amd>
 <CAL_Jsq+rS=awLC_maPGjeWhh1Sb9U31xfvLecVe9sPTh83eDBw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="xHFwDpU9dbj6ez1V"
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+rS=awLC_maPGjeWhh1Sb9U31xfvLecVe9sPTh83eDBw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--xHFwDpU9dbj6ez1V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2020-05-27 08:35:06, Rob Herring wrote:
> On Wed, May 27, 2020 at 7:39 AM Pavel Machek <pavel@ucw.cz> wrote:
> >
> > Hi!
> >
> > Thanks for reviews!
> >
> > > > +additionalProperties: false
> > > > +...
> > > > diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> > >
> > > This isn't a binding file. Belongs in another patch.
> >
> > These constants are directly related to the binding. It makes sense to
> > go in one patch...
>=20
> Yes, the header does go in this patch, but kernel subsystem files do not.
>=20
> Part of the reason for separating is we generate a DT only repository
> which filters out all the kernel code. Ideally this is just filtering
> out commits and the commit messages still make sens

Well, but the patch can't be split like that. Otherwise we risk null
pointer dereferences when one part is applied but not the second one.

Best regards,
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--xHFwDpU9dbj6ez1V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl7WsNQACgkQMOfwapXb+vI4JwCeLxatm3ymua/F9hO67BMmNsBg
FugAnRNkhigolL/rsu4UJ5kw26SOvJM8
=njXg
-----END PGP SIGNATURE-----

--xHFwDpU9dbj6ez1V--
