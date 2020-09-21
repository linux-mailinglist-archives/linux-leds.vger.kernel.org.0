Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF586272691
	for <lists+linux-leds@lfdr.de>; Mon, 21 Sep 2020 16:03:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726688AbgIUOD0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 21 Sep 2020 10:03:26 -0400
Received: from vm1.sequanux.org ([188.165.36.56]:48968 "EHLO vm1.sequanux.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726496AbgIUOD0 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 21 Sep 2020 10:03:26 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by vm1.sequanux.org (Postfix) with ESMTP id 5D0B01085E1;
        Mon, 21 Sep 2020 16:03:24 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at vm1.sequanux.org
Received: from vm1.sequanux.org ([127.0.0.1])
        by localhost (vm1.sequanux.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id wm2QrDNdFfMb; Mon, 21 Sep 2020 16:03:22 +0200 (CEST)
Received: from localhost (softwrestling.org [188.165.144.248])
        by vm1.sequanux.org (Postfix) with ESMTPSA id 556781080EF;
        Mon, 21 Sep 2020 16:03:22 +0200 (CEST)
Date:   Mon, 21 Sep 2020 16:03:22 +0200
From:   Simon Guinot <simon.guinot@sequanux.org>
To:     Marek Behun <marek.behun@nic.cz>
Cc:     linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>,
        =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Simon Guinot <sguinot@lacie.com>,
        Vincent Donnefort <vdonnefort@gmail.com>,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH leds v1 10/10] leds: ns2: refactor and use struct
 led_init_data
Message-ID: <20200921140322.GB4828@kw.sim.vm.gnt>
References: <20200916231650.11484-1-marek.behun@nic.cz>
 <20200916231650.11484-11-marek.behun@nic.cz>
 <20200918130206.GE29951@kw.sim.vm.gnt>
 <20200918191405.516b51ff@nic.cz>
 <20200921125343.GA4828@kw.sim.vm.gnt>
 <20200921150208.6a296bc7@nic.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ftEhullJWpWg/VHq"
Content-Disposition: inline
In-Reply-To: <20200921150208.6a296bc7@nic.cz>
User-Agent: Mutt/1.6.0 (2016-04-01)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--ftEhullJWpWg/VHq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2020 at 03:02:08PM +0200, Marek Behun wrote:
> On Mon, 21 Sep 2020 14:53:43 +0200
> Simon Guinot <simon.guinot@sequanux.org> wrote:
>=20
> > On Fri, Sep 18, 2020 at 07:14:05PM +0200, Marek Behun wrote:
> > > On Fri, 18 Sep 2020 15:02:06 +0200
> > > Simon Guinot <simon.guinot@sequanux.org> wrote:
> > >  =20
> > > > On Thu, Sep 17, 2020 at 01:16:50AM +0200, Marek Beh=C3=BAn wrote:
> > > >=20
> > > > Hi Marek,
> > > >  =20
> > > > > By using struct led_init_data when registering we do not need to =
parse
> > > > > `label` DT property nor `linux,default-trigger` property.
> > > > >=20
> > > > > Also, move forward from platform data to device tree only:
> > > > > since commit c7896490dd1a ("leds: ns2: Absorb platform data") the
> > > > > platform data structure is absorbed into the driver, because noth=
ing
> > > > > else in the source tree used it. Since nobody complained and all =
usage   =20
> > > >=20
> > > > Well, I probably should have...
> > > >=20
> > > > I am using this driver on the Seagate Superbee NAS devices. This de=
vices
> > > > are based on a x86 SoC. Since I have been unable to get from the OD=
M the
> > > > LED information written in the ACPI tables, then platform data are =
used
> > > > to pass the LED description to the driver.
> > > >=20
> > > > The support of this boards is not available mainline yet but it is =
still
> > > > on my todo list. So that's why I am complaining right now :) If it =
is
> > > > not too much trouble I'd like to keep platform data support in this
> > > > driver.
> > > >=20
> > > > Thanks in advance.
> > > >=20
> > > > Simon
> > > >  =20
> > >=20
> > > Simon, what if we refactored the driver to use fwnode API instead of =
OF
> > > API? Then if it is impossible for you to write DTS for that device,
> > > instead of platform data you could implement your device via swnode
> > > fwnodes. :) =20
> >=20
> > Yes. That would be perfect.
> >=20
> > Simon
>=20
> BTW if you have access to device schematics I could try to write DTS,
> with schematics and the current board source file it should not be that
> hard. But I can't test it, since I don't have the board.

Don't worry, I'll do the writing and the testing of the fwnode in the
x86 board files. This boards are not mainlined yet. So it is my problem.

And actually if you don't have the time I can do the writing of the
fwnode support in the driver as well. And you can just let the driver
with the OF support. That's fine.

But if you are willing to add fwnode support to the driver yourself,
then you are more than welcome to do it. On my side, I can help with
the testing. I can check that the ARM boards ant their DTB are still
supported by the driver. And I can also check the support of the x86
boards with the addition of the fwnode properties.

Simon

--ftEhullJWpWg/VHq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEXW8DgovlR3VS5hA0zyg/RDPmszoFAl9osqkACgkQzyg/RDPm
szqsPRAA02ZvnEqDbSk0IS/Qv1gVvuZ25GxX9cnLf1L9L5vCiR+Hc8VkCo2nUgqA
9loWpEPNJMO9zRlOkquBucv4UHZszje+es04pYIF0iCxJ+y6N5of4LhT/+akEp/2
ASaDJPphgi+EpMmpZ3aFjeEFQpKx3iUzoCNqs9Vq1ExCIUs4n9qBX43Vv640EJC8
37E4TmnrA57ewARmt22ppPlhspwaiMFsr7gAav54w5KC4w4/ibcBcJtuqepJbn6q
ENz7vhP8ixTZDjEjN9aKFWIXMKEqJv3x11lUazhMr99tdeX+frQWcuRMnRAMKqht
/IG+HbyJqTaCSBsxj4LFznBBjuy3ra9sC5E5QaJrExx42btFG/EYXrg1GVKB3nHF
kiQC2v/paaEvAs1H9xinfBDKjHJ6rFOYoQkva3aAVSAB9cuGs/yr/eODeOjjSVYb
johlpxk+TcPb207mfkv1lIZ9C7yEi9qcqoKsyJVI6JRMYZV4KgvAnmhL8DSePpy6
naJcj+UfJUe8rsHCN82TJLRaPwYwKOf/QkEbD9qRN6MZuahRVPfCMjB9iKDBLO7v
RqPC7UpUBzXrgat2ejZZcFim6tXPgRBlLo3sqBJAt7cCD8fU+KyLyEJov5fKI85K
Gxo/qV5X8kVGXJZxe76xc8wr/B1votHKcaG6nhyXhE8iVxV4KaQ=
=wNem
-----END PGP SIGNATURE-----

--ftEhullJWpWg/VHq--
