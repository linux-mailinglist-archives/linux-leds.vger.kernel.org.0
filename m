Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DB9626460E
	for <lists+linux-leds@lfdr.de>; Thu, 10 Sep 2020 14:31:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730461AbgIJMbK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 10 Sep 2020 08:31:10 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:42502 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730722AbgIJM2n (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 10 Sep 2020 08:28:43 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 16CDC1C0B9D; Thu, 10 Sep 2020 14:28:35 +0200 (CEST)
Date:   Thu, 10 Sep 2020 14:28:34 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Gene Chen <gene.chen.richtek@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Gene Chen <gene_chen@richtek.com>, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: Re: [PATCH v3 1/2] leds: mt6360: Add LED driver for MT6360
Message-ID: <20200910122834.GE7907@duo.ucw.cz>
References: <1599474459-20853-1-git-send-email-gene.chen.richtek@gmail.com>
 <1599474459-20853-2-git-send-email-gene.chen.richtek@gmail.com>
 <CAHp75VdLDvoQicP1nLnjOiit6qjaw9n7+LuJ-J3MtaoHUOa_2g@mail.gmail.com>
 <CAE+NS35FETQ9ASJeYP=Sa8dm7ohRBcdAwUioCAnHPY2TiD4pNA@mail.gmail.com>
 <20200910081814.GB28357@amd>
 <CAHp75Vds75jP47Fy78gxrg05J-CYQ7yD_EiDqizKkcW5rHL_RA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="YkJPYEFdoxh/AXLE"
Content-Disposition: inline
In-Reply-To: <CAHp75Vds75jP47Fy78gxrg05J-CYQ7yD_EiDqizKkcW5rHL_RA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--YkJPYEFdoxh/AXLE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2020-09-10 14:34:54, Andy Shevchenko wrote:
> On Thu, Sep 10, 2020 at 11:18 AM Pavel Machek <pavel@ucw.cz> wrote:
>=20
> ...
>=20
> > > > > +enum {
> > > > > +       MT6360_LED_ISNK1 =3D 0,
> > > > > +       MT6360_LED_ISNK2,
> > > > > +       MT6360_LED_ISNK3,
> > > > > +       MT6360_LED_ISNK4,
> > > > > +       MT6360_LED_FLASH1,
> > > > > +       MT6360_LED_FLASH2,
> > > >
> > > > > +       MT6360_MAX_LEDS,
> > > >
> > > > No comma for terminator entry.
> > > >
> > >
> > > ACK
> >
> > Actually, that comma is fine. Its absence would be fine, too.
>=20
> It is slightly better not to have to prevent (theoretical) rebase or
> other similar issues when a new item can go behind the terminator. In
> such a case compiler can easily tell you if something is wrong.

Okay, I see your point.
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--YkJPYEFdoxh/AXLE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX1ob8gAKCRAw5/Bqldv6
8lViAJ9myb0j5o09GhH3AOC/vEPu/eVHrQCfURBxqy5ugClklDvSpz1f/ewdO60=
=pYh1
-----END PGP SIGNATURE-----

--YkJPYEFdoxh/AXLE--
