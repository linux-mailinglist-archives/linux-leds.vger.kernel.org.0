Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 162B4274783
	for <lists+linux-leds@lfdr.de>; Tue, 22 Sep 2020 19:32:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbgIVRco (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 22 Sep 2020 13:32:44 -0400
Received: from vm1.sequanux.org ([188.165.36.56]:57543 "EHLO vm1.sequanux.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726526AbgIVRco (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 22 Sep 2020 13:32:44 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by vm1.sequanux.org (Postfix) with ESMTP id 18740108646;
        Tue, 22 Sep 2020 19:32:42 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at vm1.sequanux.org
Received: from vm1.sequanux.org ([127.0.0.1])
        by localhost (vm1.sequanux.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 8oeo1XofqNEz; Tue, 22 Sep 2020 19:32:40 +0200 (CEST)
Received: from localhost (softwrestling.org [188.165.144.248])
        by vm1.sequanux.org (Postfix) with ESMTPSA id 4756A108638;
        Tue, 22 Sep 2020 19:32:40 +0200 (CEST)
Date:   Tue, 22 Sep 2020 19:32:40 +0200
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
Message-ID: <20200922173240.GG4828@kw.sim.vm.gnt>
References: <20200917223338.14164-1-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="pyE8wggRBhVBcj8z"
Content-Disposition: inline
In-Reply-To: <20200917223338.14164-1-marek.behun@nic.cz>
User-Agent: Mutt/1.6.0 (2016-04-01)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--pyE8wggRBhVBcj8z
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

Hi Marek,

If you agree, I'll wait the fwnode support before reviewing and testing
this patches.

Simon

--pyE8wggRBhVBcj8z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEXW8DgovlR3VS5hA0zyg/RDPmszoFAl9qNTcACgkQzyg/RDPm
szrw9Q/+IX/cwi/lHhvzrSlcq8Zbv/kJa44/0dyAmXhWnU8fabW2bYhT1JTwGroN
XiMPOwC6u3PWi7B17KaqoXm2U3HlESZy7tGQhG2cSjadm99aKlKqPOW+YVrkLgo1
LwVlVY6on1/neUM367LC8I+XoltPpOUNv0LbaKm2bGEkMhGGJXrjtWTNfEv9BqJt
X54su5DHrigGVwD3vpv6VVjgx//uk8bhiVhbCE/nHqWOuU9LjWTCRioHa92slCLS
k3vudoCKXUontO1a0v9iUs6IdSMN5SIUVuK2WQWZRdWa9CbH4n4jr5UUFy58iX81
TiNae8AzOpoAjQWvMXmY1Fxv0hJ0A6ql6GXtk42mXlsS89RITdr0+kF4eoj2JW7E
3K+/UOJV+uA/kl+XgjtI3ya68AkQGRjMpYU0NjkMB5ag+VDOyKX1bul8Dt0MPqqK
f9pD2Ko6i1IbbYejkyjtMqmUWrenkvN82YmVwH0zfvvdN8BP2IiKGWzIjWSo1vzu
b4oldw/9OZV7eQxQWWHAHhgwiLX77CINueDYSH8dBWGPL4SBsQp87YL3Eo7nKFbP
7Oh5R94Rjc63EiilhzG4IEmMLF+n9nENu3Zw/UmqygkYDenXX2SiwD68EVFTKG5o
CtWjDvMLPtUcS3ZLJIhZqHRE57NmNF3qJjef/1pYTuQ1TBurkeA=
=8FNN
-----END PGP SIGNATURE-----

--pyE8wggRBhVBcj8z--
