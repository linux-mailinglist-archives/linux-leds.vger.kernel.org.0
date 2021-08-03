Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8ECB63DF719
	for <lists+linux-leds@lfdr.de>; Tue,  3 Aug 2021 23:50:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229745AbhHCVvE (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 3 Aug 2021 17:51:04 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:40028 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbhHCVvC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 3 Aug 2021 17:51:02 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 537381C0B76; Tue,  3 Aug 2021 23:50:50 +0200 (CEST)
Date:   Tue, 3 Aug 2021 23:50:49 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     andy@surfacebook.localdomain
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Amireddy Mallikarjuna reddy 
        <mallikarjunax.reddy@linux.intel.com>,
        Abanoub Sameh <abanoubsameh8@gmail.com>,
        Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 12/13] leds: rt8515: Put fwnode in any case during
 ->probe()
Message-ID: <20210803215049.GC30387@amd>
References: <20210529111935.3849707-1-andy.shevchenko@gmail.com>
 <20210529111935.3849707-12-andy.shevchenko@gmail.com>
 <CACRpkdb21tMWyoxHuv8CwUB9fZeD332B_ui2jtMP7ocfbi6LSQ@mail.gmail.com>
 <YLtH45iTFAn9QcpQ@surfacebook.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="QRj9sO5tAVLaXnSD"
Content-Disposition: inline
In-Reply-To: <YLtH45iTFAn9QcpQ@surfacebook.localdomain>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--QRj9sO5tAVLaXnSD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat 2021-06-05 12:46:11, andy@surfacebook.localdomain wrote:
> Tue, Jun 01, 2021 at 12:06:05PM +0200, Linus Walleij kirjoitti:
> > On Sat, May 29, 2021 at 1:19 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> >=20
> > > fwnode_get_next_available_child_node() bumps a reference counting of
> > > a returned variable. We have to balance it whenever we return to
> > > the caller.
> > >
> > > Fixes: e1c6edcbea13 ("leds: rt8515: Add Richtek RT8515 LED driver")
> > > Cc: Linus Walleij <linus.walleij@linaro.org>
> > > Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> >=20
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>=20
> Thanks!
>=20
> Pavel, can you, please, review this batch? I think I addressed most of yo=
ur
> comments if not all.

10-12 applied, thanks.
									Pavel
--=20
http://www.livejournal.com/~pavelmachek

--QRj9sO5tAVLaXnSD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmEJujkACgkQMOfwapXb+vJEVQCeID25VeF3Y503w5mOvpeJAY2p
R44An0ewAIbhsFtjTGN/eb7UywUywqlY
=f9Cw
-----END PGP SIGNATURE-----

--QRj9sO5tAVLaXnSD--
