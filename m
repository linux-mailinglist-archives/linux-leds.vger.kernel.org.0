Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7B3E27243A
	for <lists+linux-leds@lfdr.de>; Mon, 21 Sep 2020 14:53:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726898AbgIUMxs (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 21 Sep 2020 08:53:48 -0400
Received: from vm1.sequanux.org ([188.165.36.56]:48371 "EHLO vm1.sequanux.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726395AbgIUMxr (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 21 Sep 2020 08:53:47 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by vm1.sequanux.org (Postfix) with ESMTP id 03AB21085E1;
        Mon, 21 Sep 2020 14:53:46 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at vm1.sequanux.org
Received: from vm1.sequanux.org ([127.0.0.1])
        by localhost (vm1.sequanux.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id U7ldmjyxRVTX; Mon, 21 Sep 2020 14:53:43 +0200 (CEST)
Received: from localhost (softwrestling.org [188.165.144.248])
        by vm1.sequanux.org (Postfix) with ESMTPSA id D50811080EF;
        Mon, 21 Sep 2020 14:53:43 +0200 (CEST)
Date:   Mon, 21 Sep 2020 14:53:43 +0200
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
Message-ID: <20200921125343.GA4828@kw.sim.vm.gnt>
References: <20200916231650.11484-1-marek.behun@nic.cz>
 <20200916231650.11484-11-marek.behun@nic.cz>
 <20200918130206.GE29951@kw.sim.vm.gnt>
 <20200918191405.516b51ff@nic.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="KsGdsel6WgEHnImy"
Content-Disposition: inline
In-Reply-To: <20200918191405.516b51ff@nic.cz>
User-Agent: Mutt/1.6.0 (2016-04-01)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2020 at 07:14:05PM +0200, Marek Behun wrote:
> On Fri, 18 Sep 2020 15:02:06 +0200
> Simon Guinot <simon.guinot@sequanux.org> wrote:
>=20
> > On Thu, Sep 17, 2020 at 01:16:50AM +0200, Marek Beh=C3=BAn wrote:
> >=20
> > Hi Marek,
> >=20
> > > By using struct led_init_data when registering we do not need to parse
> > > `label` DT property nor `linux,default-trigger` property.
> > >=20
> > > Also, move forward from platform data to device tree only:
> > > since commit c7896490dd1a ("leds: ns2: Absorb platform data") the
> > > platform data structure is absorbed into the driver, because nothing
> > > else in the source tree used it. Since nobody complained and all usag=
e =20
> >=20
> > Well, I probably should have...
> >=20
> > I am using this driver on the Seagate Superbee NAS devices. This devices
> > are based on a x86 SoC. Since I have been unable to get from the ODM the
> > LED information written in the ACPI tables, then platform data are used
> > to pass the LED description to the driver.
> >=20
> > The support of this boards is not available mainline yet but it is still
> > on my todo list. So that's why I am complaining right now :) If it is
> > not too much trouble I'd like to keep platform data support in this
> > driver.
> >=20
> > Thanks in advance.
> >=20
> > Simon
> >=20
>=20
> Simon, what if we refactored the driver to use fwnode API instead of OF
> API? Then if it is impossible for you to write DTS for that device,
> instead of platform data you could implement your device via swnode
> fwnodes. :)

Yes. That would be perfect.

Simon

--KsGdsel6WgEHnImy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEXW8DgovlR3VS5hA0zyg/RDPmszoFAl9oolcACgkQzyg/RDPm
szrExxAAjNpMeco55YZIg8vi5pc3s8jKk0RzlVCx0U8kugJzjUN0Uh+WVGgelNpY
5b+z1qe9m893rke8AueMJZMPraHrL585c2JWatYHeGfyoEXG+e4Uwba9XfRF1xj/
vdAc/OZJSAF1ZMiJIZ6sQ385dr06MP7KEFCHwy1HVquohMVEjAHfXfG9WMamaQLX
XRb43iuJP3WBiR3LVJ19q/bAoArcyF+My4WB3vbuv3MnV0fOWSmglX6Hbl078w2K
qnBwB3u1+A0oXVGCndKUeHxFTscJBLPoKPdMmE0TI8QQOaey4rSmyAivBuCeANby
Z3LpPNX8b2kffxD/zVTQrzxnHMTpnZeKt46zlanYAK46ks0/d8yZEbIgYlC6oVI2
tFwH8bzieitdHYXoJ+d0V5Ac9G6NPODmKw5gh0F4PXr5R2x77M8k4mYFiXwgpR+q
YEziR+Fi3iYiKNFGqQ2cZRNmJ+QhhOb1OH8lpH53etIVHs6Hy+FSuZoNJf2rLRDh
BW4wIqOaHd91sf931DXJhKKrKsECH89/OLcr52OT3zL8ieOC5mgLiXaMRjL76YbC
r8gKajpIZS+zdF7ecUVXFRtegyTj1xhZY53YT+3nZqSvpb7w7MP9JaInC1kaDg0A
sXyq+GFw6grikNHJFmqlRPT25g28aLFFDHny9+Grb5goEktLKTc=
=/jex
-----END PGP SIGNATURE-----

--KsGdsel6WgEHnImy--
