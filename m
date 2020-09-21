Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2E46272995
	for <lists+linux-leds@lfdr.de>; Mon, 21 Sep 2020 17:10:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726688AbgIUPKi (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 21 Sep 2020 11:10:38 -0400
Received: from vm1.sequanux.org ([188.165.36.56]:49707 "EHLO vm1.sequanux.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726417AbgIUPKi (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 21 Sep 2020 11:10:38 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by vm1.sequanux.org (Postfix) with ESMTP id E24681085E1;
        Mon, 21 Sep 2020 17:10:36 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at vm1.sequanux.org
Received: from vm1.sequanux.org ([127.0.0.1])
        by localhost (vm1.sequanux.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id EO_Sb7uoyGNq; Mon, 21 Sep 2020 17:10:35 +0200 (CEST)
Received: from localhost (softwrestling.org [188.165.144.248])
        by vm1.sequanux.org (Postfix) with ESMTPSA id 0E6451080EF;
        Mon, 21 Sep 2020 17:10:35 +0200 (CEST)
Date:   Mon, 21 Sep 2020 17:10:35 +0200
From:   Simon Guinot <simon.guinot@sequanux.org>
To:     Marek Behun <marek.behun@nic.cz>
Cc:     Simon Guinot <sguinot@lacie.com>,
        Vincent Donnefort <vdonnefort@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        linux-leds@vger.kernel.org
Subject: Re: question about Network Space v2 LED driver
Message-ID: <20200921151035.GE4828@kw.sim.vm.gnt>
References: <20200918005258.44c0bfc6@blackhole.sk>
 <20200918134201.GF29951@kw.sim.vm.gnt>
 <20200918194315.61fd8f43@nic.cz>
 <20200921141540.GC4828@kw.sim.vm.gnt>
 <20200921164743.1c3dc35d@nic.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="maH1Gajj2nflutpK"
Content-Disposition: inline
In-Reply-To: <20200921164743.1c3dc35d@nic.cz>
User-Agent: Mutt/1.6.0 (2016-04-01)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--maH1Gajj2nflutpK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2020 at 04:47:43PM +0200, Marek Behun wrote:
> On Mon, 21 Sep 2020 16:15:40 +0200
> Simon Guinot <simon.guinot@sequanux.org> wrote:
>=20
> >=20
> > There are several NAS devices using the leds-ns2 driver. On most of them
> > the activity is wired to a single disk. But on some (such as the Network
> > Space v2 Max), the activity is wired to two disks.
> >=20
>=20
> Are they implemented via device-tree or platform-data?

Everything is provided via DT:

arch/arm/boot/dts/armada-370-seagate-nas-4bay.dts
arch/arm/boot/dts/kirkwood-d2net.dts
arch/arm/boot/dts/kirkwood-is2.dts
arch/arm/boot/dts/kirkwood-ns2.dts
arch/arm/boot/dts/kirkwood-ns2max.dts
arch/arm/boot/dts/kirkwood-ns2mini.dts

>=20
> If we are going to implement the disk trigger offloading, we will need
> to use the trigger-sources property so that the driver will know which
> disks can be offloaded.

Yes, we will need to add this property to the "ns2-leds" DT nodes.

Simon

--maH1Gajj2nflutpK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEXW8DgovlR3VS5hA0zyg/RDPmszoFAl9owmoACgkQzyg/RDPm
szr9jg/+LSTb0e1rSG4I1j+1Dgce0auxG4o5Qge59/WXVR9/2U26xlHfEhBhAOBk
TV4DE3aJD1cGL5T8rPbNk0lbusUf0Hk5nycpSMt0MtW0R85Zaw7mQFZDKT+QcZ8u
LFGHKAFRWBvIAaU7GehcD4Cw15uDSbPjJawSPYZneza0y8uCAptrqB4xptrLprTr
kwt2mpgC3L7q89O8PgJ3shz7DUOseSfE766aXDgdoHOc74eomxnSGkNr7yfObHqR
eOkc0dsCZVJIZyUlMXh5M5OS8nEHZvgiRfkbxoAUkCikBbsGXwd9jhMaedCl0ZUu
S8YYvHTkBH9ZA0cLM/KhjFa2TTUH3xGzu3orIzvY0koDPtuVDDL5HPBgq88RbO+M
MIIuQyO/HbnkxDu6tHAA+OXZTLvugmFWO4u0rkjeYYhkTSRn+Kn0OP9yTu/UIOsd
OZ6BGC9hH8t9KBWorSIEFMGKXd6X8FW0pGo3Y9PBHKanKUzAMv13nNhi3xu1H7SX
Z0k5OAXrMNx5UH7dHhv6HZsnZNmxQMuM7V1Alt7VCytOwnxs23UHqND47HvEpFQT
XRjC4fGeDN06cL3kbqHB+BUpVTpLrsSJ0MwnFqXK/F6USqTqaC4s+v7cSEg7DgFA
fPT4saS6OoBTOPeR5mXIbl02IL+IIEcIsXOyIqwQPeZmX2/JJRQ=
=Rwa2
-----END PGP SIGNATURE-----

--maH1Gajj2nflutpK--
