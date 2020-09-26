Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18C162799BE
	for <lists+linux-leds@lfdr.de>; Sat, 26 Sep 2020 15:47:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726309AbgIZNrL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 26 Sep 2020 09:47:11 -0400
Received: from vm1.sequanux.org ([188.165.36.56]:50662 "EHLO vm1.sequanux.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726244AbgIZNrL (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 26 Sep 2020 09:47:11 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by vm1.sequanux.org (Postfix) with ESMTP id 9F2321085FD;
        Sat, 26 Sep 2020 15:47:09 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at vm1.sequanux.org
Received: from vm1.sequanux.org ([127.0.0.1])
        by localhost (vm1.sequanux.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id UOytG_biRnex; Sat, 26 Sep 2020 15:47:07 +0200 (CEST)
Received: from localhost (softwrestling.org [188.165.144.248])
        by vm1.sequanux.org (Postfix) with ESMTPSA id EB80410812B;
        Sat, 26 Sep 2020 15:47:06 +0200 (CEST)
Date:   Sat, 26 Sep 2020 15:47:06 +0200
From:   Simon Guinot <simon.guinot@sequanux.org>
To:     Marek =?utf-8?B?QmVow7pu?= <marek.behun@nic.cz>
Cc:     linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>,
        =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        =?utf-8?B?w4FsdmFybyBGZXJuw6FuZGV6?= Rojas <noltari@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Andrey Utkin <andrey_utkin@fastmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Baolin Wang <baolin.wang@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Christian Mauderer <oss@c-mauderer.de>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Daniel Mack <daniel@caiaq.de>,
        David Rivshin <drivshin@allworx.com>,
        Grant Feng <von81@163.com>,
        Haojian Zhuang <haojian.zhuang@marvell.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Jaedon Shin <jaedon.shin@gmail.com>,
        John Crispin <john@phrozen.org>,
        Kevin Cernekee <cernekee@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Milo Kim <milo.kim@ti.com>, NeilBrown <neilb@suse.de>,
        Nikita Travkin <nikitos.tr@gmail.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Paul Mackerras <paulus@samba.org>,
        Philippe Retornaz <philippe.retornaz@epfl.ch>,
        Riku Voipio <riku.voipio@iki.fi>,
        Rod Whitby <rod@whitby.id.au>,
        Ryder Lee <ryder.lee@mediatek.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Sebastian Reichel <sre@kernel.org>,
        Simon Guinot <sguinot@lacie.com>,
        Simon Shields <simon@lineageos.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Thomas Bogendoerfer <tbogendoerfer@suse.de>,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Vasant Hegde <hegdevasant@linux.vnet.ibm.com>,
        Vincent Donnefort <vdonnefort@gmail.com>,
        Xiaotong Lu <xiaotong.lu@spreadtrum.com>
Subject: Re: [PATCH leds v2 00/50] Start moving parsing of
 `linux,default-trigger` to LED core (a cleanup of LED drivers)
Message-ID: <20200926134706.GJ4828@kw.sim.vm.gnt>
References: <20200917223338.14164-1-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="WR+jf/RUebEcofwt"
Content-Disposition: inline
In-Reply-To: <20200917223338.14164-1-marek.behun@nic.cz>
User-Agent: Mutt/1.6.0 (2016-04-01)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--WR+jf/RUebEcofwt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2020 at 12:32:48AM +0200, Marek Beh=C3=BAn wrote:
> Hi,
>=20
> this series is also available at [1].
>=20
> This is v2, you can read cover letter of v1 at [2] (togehter with
> explanation of why I did this).
>=20
> Changes since v1:
> - split big changes into several patches of little changes
> - added many cosmetic fixes (helper variables, reversal christmas tree
>   variables declaration, ...)
> - fixed some bugs in various drivers (memory leaks, iteration over
>   unavailable OF nodes)
> - made some drivers compilable when COMPILE_TEST=3Dy (since allyesconfig
>   did not compile them). Not all though, some still don't compile with
>   allyesconfig
> - the commit that moves parsing of `linux,default-trigger` property from
>   drivers to LED core is now last in the series, instead of first
>=20
> Marek
>=20
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/kabel/linux.git/log/?=
h=3Dleds-cleanup-for-pavel
> [2] https://lore.kernel.org/linux-leds/20200916231650.11484-1-marek.behun=
@nic.cz/T/#m826493318174b0f38a3d4ba107092b5420ce440c

=2E..

>   leds: ns2: use devres LED registering function
>   leds: ns2: alloc simple array instead of struct ns2_led_priv
>   leds: ns2: support OF probing only, forget platdata
>   leds: ns2: move parsing of one LED into separate function
>   leds: ns2: use devres API for getting GPIO descriptors
>   leds: ns2: cosmetic structure rename
>   leds: ns2: cosmetic variable rename
>   leds: ns2: cosmetic change
>   leds: ns2: cosmetic change: use helper variable
>   leds: ns2: register LED immediately after parsing DT properties
>   leds: ns2: remove unneeded variable
>   leds: ns2: cosmetic: use reverse christmas tree
>   leds: ns2: reorder headers alphabetically
>   leds: ns2: use struct led_init_data when registering
>   leds: parse linux,default-trigger DT property in LED core

Hi Marek,

For all the patches applying to the leds-ns2 driver:

Reviewed-by: Simon Guinot <simon.guinot@sequanux.org>
Tested-by: Simon Guinot <simon.guinot@sequanux.org>

Thanks for it. The driver is looking way better.

Simon

--WR+jf/RUebEcofwt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEXW8DgovlR3VS5hA0zyg/RDPmszoFAl9vRloACgkQzyg/RDPm
szpYlxAA2tv+ztwuTqGVHf0MAJV7dd+lrcA7E7bj++L3tVr20iUB44pmcvgX0qqr
y4UJWuBP9RDoPc3DmVhKljALA+EbzX0QSHT5LXayTmdykZaLEF5zCl9Ki79/+vvv
kVwZFU5n/RNaig98ZqbjsyMtjYsaIgC1ImOveMoUU4hUgxJMJX6h31yQPB3hxid5
edYEUNIOpIN1n74N9NKikBBhxPIiGfA9Q4XoQ0w2LNjIHXyrjdtk+tV1ymAb0/Uw
WSpMGnmNdgzwy48iYlBZndP771XhYvFl3mZv+FcKsS1qs21jLFQUdk6ZsRd6aEVT
JyXxUOizOIJRw4KGVHIILbfkIwct9Is5H+9bhlK5HzvgkhqBGAa50cvgDIQrndI2
a7rJAwd0KfxcxfvfHw4iJMRDdQ/QXIRVyKE3m5/hTdwq4p6a91tTAemtgODHQGlN
S6NF8GyHK2yWCkv6N2zx/tmZkcJOyAvD6rMNtBZdQCfyvv5Qx83T7UckYHzZEeo1
oHRrHs4quQ6KNQHYv9y8Y6W6SN2tkfZTNzBv0YxF6Jl/q0hYrLw6D8VAhRsErHQy
1OVrZQoxXUL4X5etjRJoXJdp2Guzrh2iIUJtlRlHeS4Vc2brMc1s1Xym0SN4XIgR
/67wH+ybeKolA5cpHas++693+x7J8dp8S2rvXvY6SuyOYyMcLBY=
=MzSs
-----END PGP SIGNATURE-----

--WR+jf/RUebEcofwt--
