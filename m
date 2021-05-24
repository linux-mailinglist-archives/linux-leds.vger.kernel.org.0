Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BFCC38F27D
	for <lists+linux-leds@lfdr.de>; Mon, 24 May 2021 19:49:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233255AbhEXRue (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 24 May 2021 13:50:34 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:53940 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232744AbhEXRud (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 24 May 2021 13:50:33 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 92FCB1C0B80; Mon, 24 May 2021 19:49:03 +0200 (CEST)
Date:   Mon, 24 May 2021 19:49:03 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>,
        Abanoub Sameh <abanoubsameh8@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 00/28] leds: cleanups and fwnode refcounting bug fixes
Message-ID: <20210524174903.GA29340@duo.ucw.cz>
References: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
 <YKIbgBd3q8c+Tgz0@smile.fi.intel.com>
 <YKu+jUHTjwf+3J5g@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="bg08WKrSYDhXBjb5"
Content-Disposition: inline
In-Reply-To: <YKu+jUHTjwf+3J5g@smile.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2021-05-24 17:56:13, Andy Shevchenko wrote:
> On Mon, May 17, 2021 at 10:30:08AM +0300, Andy Shevchenko wrote:
> > On Mon, May 10, 2021 at 12:50:17PM +0300, Andy Shevchenko wrote:
> > > When analyzing the current state of affairs with fwnode reference cou=
nting
> > > I found that a lot of core doesn't take it right. Here is a bunch of
> > > corresponding fixes against LED drivers.
> > >=20
> > > The series includes some cleanups and a few other fixes grouped by a =
driver.
> > >=20
> > > First two patches are taking care of -ENOTSUPP error code too  preven=
t its
> > > appearance in the user space.
> >=20
> > Pavel, any comments on this bug fix series?
>=20
> Pavel, we are at rc-3 already and this is kinda a big series that needs m=
ore
> time to be sit in Linux-next, unfortunately while I see your activities h=
ere
> and there, it is kept uncommented and unapplied. Can you shed a light wha=
t's
> going on here? Do I need something to be amended?

I'm busy, sorry.

Series looks kind of okay on quick look.

									Pavel
--=20
http://www.livejournal.com/~pavelmachek

--bg08WKrSYDhXBjb5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYKvnDwAKCRAw5/Bqldv6
8rlqAJ9nzY+BG69+yIHXmivyfUXP38sMJACdE3Q5pH6k3Dzs40raSAYBr7D1sN8=
=NNnE
-----END PGP SIGNATURE-----

--bg08WKrSYDhXBjb5--
