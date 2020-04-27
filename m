Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2B021BA35E
	for <lists+linux-leds@lfdr.de>; Mon, 27 Apr 2020 14:12:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727056AbgD0MMN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 27 Apr 2020 08:12:13 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:47132 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726260AbgD0MMN (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 27 Apr 2020 08:12:13 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 4EF3A1C0244; Mon, 27 Apr 2020 14:12:11 +0200 (CEST)
Date:   Mon, 27 Apr 2020 14:12:10 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Simon Guinot <simon.guinot@sequanux.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>
Subject: Re: [PATCH] leds: netxbig: Convert to use GPIO descriptors
Message-ID: <20200427121210.GA544@duo.ucw.cz>
References: <20200415145139.155663-1-linus.walleij@linaro.org>
 <20200417125219.GC19028@duo.ucw.cz>
 <20200417180746.GD15254@kw.sim.vm.gnt>
 <CACRpkdaBTeVt-Fp2OVOS_T_E1T7q1wTFUDCQ=foN72SdhJnHjw@mail.gmail.com>
 <20200423223818.GG15254@kw.sim.vm.gnt>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Q68bSM7Ycu6FN28Q"
Content-Disposition: inline
In-Reply-To: <20200423223818.GG15254@kw.sim.vm.gnt>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--Q68bSM7Ycu6FN28Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2020-04-24 00:38:18, Simon Guinot wrote:
> On Fri, Apr 17, 2020 at 10:58:24PM +0200, Linus Walleij wrote:
> > On Fri, Apr 17, 2020 at 8:07 PM Simon Guinot <simon.guinot@sequanux.org=
> wrote:
> > > On Fri, Apr 17, 2020 at 02:52:19PM +0200, Pavel Machek wrote:
> > > > Hi!
> > > >
> > > > > This converts the NetXbig LED driver to use GPIO descriptors
> > > > > instead of using the legacy interfaces in <linux/of_gpio.h>
> > > > > and <linux/gpio.h> to iteratively parse the device tree for
> > > > > global GPIO numbers.
> > > > >
> > > > > Cc: Simon Guinot <simon.guinot@sequanux.org>
> > > > > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > > >
> > > > Nothing obviously wrong here, but I'd not mind some testing.
> > >
> > > Hi Pavel and Linux,
> > >
> > > If you are not in a hurry, then I'll try it next week.
> >=20
> > No hurry, take the time you need. If it explodes, please help me fix it!
>=20
> Well, nothing blew up. I successfully tested your patch on a LaCie
> "2Big NAS" board and it appears that the LEDs are working nicely.
>=20
> Thanks for converting this driver to use the GPIO descriptor API.
>=20
> Tested-by: Simon Guinot <simon.guinot@sequanux.org>

Thanks, applied.
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--Q68bSM7Ycu6FN28Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXqbMGgAKCRAw5/Bqldv6
8kYNAJkByfvftqo/7/sVaSMuAeSaV2bL+QCgsEpkwcjYunc4AFN4hHifCuRPlbA=
=zvMB
-----END PGP SIGNATURE-----

--Q68bSM7Ycu6FN28Q--
