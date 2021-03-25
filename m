Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A482E348DF7
	for <lists+linux-leds@lfdr.de>; Thu, 25 Mar 2021 11:28:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230155AbhCYK12 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 25 Mar 2021 06:27:28 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:53070 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229934AbhCYK1W (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 25 Mar 2021 06:27:22 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id BD35D1C0B92; Thu, 25 Mar 2021 11:27:19 +0100 (CET)
Date:   Thu, 25 Mar 2021 11:27:19 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     ChiYuan Huang <u0084500@gmail.com>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        cy_huang <cy_huang@richtek.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] leds: rt4505: Add support for Richtek RT4505
 flash LED controller
Message-ID: <20210325102718.GA7158@amd>
References: <1604284946-16254-1-git-send-email-u0084500@gmail.com>
 <3cf3ee50-3dd8-d3b1-66a9-cea2ba487de3@gmail.com>
 <CADiBU3-pDdoCioKc1mZwx7tp+_kfcN=4j-iMOT9LupXW03qwNA@mail.gmail.com>
 <20210325100122.GA4619@amd>
 <CADiBU3-J7nUav98t=inpt-UzkLkARtJBRgO8q5GXFX4wRoWmgw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="opJtzjQTFsWo+cga"
Content-Disposition: inline
In-Reply-To: <CADiBU3-J7nUav98t=inpt-UzkLkARtJBRgO8q5GXFX4wRoWmgw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--opJtzjQTFsWo+cga
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2021-03-25 18:19:03, ChiYuan Huang wrote:
> Pavel Machek <pavel@ucw.cz> =E6=96=BC 2021=E5=B9=B43=E6=9C=8825=E6=97=A5 =
=E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=886:01=E5=AF=AB=E9=81=93=EF=BC=9A
> >
> > Hi!
> >
> > > > >   create mode 100644 drivers/leds/flash/Kconfig
> > > > >   create mode 100644 drivers/leds/flash/Makefile
> > > > >   create mode 100644 drivers/leds/flash/leds-rt4505.c
> > > >
> > > > Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> > > >
> > > Any problem with this patch? Do I need to submit it again?
> >
> > It won't apply on current next.
> >
> > So please: Merge ACKs, reorder it so that docs goes first, port it to
> >
> > To gitolite.kernel.org:pub/scm/linux/kernel/git/pavel/linux-leds.git
> >    34731ed13e8a..85674b0e40d9  for-next -> for-next
> >
> > and resubmit.
>=20
> Thx. It's clear.
> So the next I need to do is
> 1. Merge ACKs
> 2. Reorder this patch from the docs first
>=20
> After done, do I need to change the patch revision from v2 to v3
> before submitng it?

Most important step is

0. port it to the for-next tree.

And yes, you can increase patch revision.

Best regards,

								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--opJtzjQTFsWo+cga
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmBcZYYACgkQMOfwapXb+vKWXgCeNkZr3KczfGCvufCwFoH/Rvhz
irQAn169QQXLy+DeDICBiumXT+IHKqV/
=mO7l
-----END PGP SIGNATURE-----

--opJtzjQTFsWo+cga--
