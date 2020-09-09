Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 836DA262B30
	for <lists+linux-leds@lfdr.de>; Wed,  9 Sep 2020 11:00:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726060AbgIIJAf (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 9 Sep 2020 05:00:35 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:50400 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725877AbgIIJAf (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 9 Sep 2020 05:00:35 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 022E91C0B8C; Wed,  9 Sep 2020 11:00:34 +0200 (CEST)
Date:   Wed, 9 Sep 2020 11:00:33 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Alexander Dahl <ada@thorsis.com>
Cc:     linux-leds@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Alexander Dahl <post@lespocky.de>, devicetree@vger.kernel.org,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] leds: pwm: Make automatic labels work
Message-ID: <20200909090033.GD10891@amd>
References: <20200831210232.28052-1-post@lespocky.de>
 <a8f9068b-d78d-3ba5-6747-f79ed8e641bd@gmail.com>
 <2019500.FJf2EgCAKA@ada>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="BRE3mIcgqKzpedwo"
Content-Disposition: inline
In-Reply-To: <2019500.FJf2EgCAKA@ada>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--BRE3mIcgqKzpedwo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > for leds-gpio you can use the properties 'function' and 'color' in the
> > > devicetree node and omit 'label', the label is constructed
> > > automatically.  This is a common feature supposed to be working for a=
ll
> > > LED drivers.  However it did not yet work for the 'leds-pwm' driver.
> > > This series fixes the driver and takes the opportunity to update the
> > > dt-bindings accordingly.
> > >=20
> > > v1: based on v5.9-rc2, backport on v5.4.59 tested and working
> > >=20
> > > v2: based on v5.9-rc3, added the dt-bindings update patch
> > >=20
> > > Greets
> > > Alex
> > >=20
> > > Alexander Dahl (2):
> > >    leds: pwm: Allow automatic labels for DT based devices
> > >    dt-bindings: leds: Convert pwm to yaml
> > >  =20
> > >   .../devicetree/bindings/leds/leds-pwm.txt     | 50 -----------
> > >   .../devicetree/bindings/leds/leds-pwm.yaml    | 85 ++++++++++++++++=
+++
> > >   drivers/leds/leds-pwm.c                       |  9 +-
> > >   3 files changed, 93 insertions(+), 51 deletions(-)
> > >   delete mode 100644 Documentation/devicetree/bindings/leds/leds-pwm.=
txt
> > >   create mode 100644 Documentation/devicetree/bindings/leds/leds-pwm.=
yaml
> >=20
> > For both patches:
> >=20
> > Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
>=20
> I'd like to make a v3 and change the license of the .yaml file to "(GPL-2=
=2E0-
> only OR BSD-2-Clause)" as suggested by checkpatch and [1].  Can I keep yo=
ur=20
> Acked-by for that?
>=20
> Besides: those suggestions are obviously valid for new bindings.  What ab=
out=20
> old bindings (.txt), which had no explicit SPDX tag or license note befor=
e? =20
> What license would apply there?  Is the .yaml file technically new, when =
it=20
> was mostly just converted from .txt?

If it is based on previous .txt binding, you have to respect previous
author's license. That probably means GPL-2.0 only.

Alternatively, you can contact original author(s) to get permission to
relicense under (GPL-2.0-only OR BSD-2-Clause).

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--BRE3mIcgqKzpedwo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl9YmbEACgkQMOfwapXb+vLZKgCgrKZ1RB1Ep+Opcm6Thf0u4JM2
1xkAoK6e5DOd661jEaNbLA7SVm57YF0B
=w6wt
-----END PGP SIGNATURE-----

--BRE3mIcgqKzpedwo--
