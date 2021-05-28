Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C2273940C0
	for <lists+linux-leds@lfdr.de>; Fri, 28 May 2021 12:14:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236381AbhE1KQa (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 May 2021 06:16:30 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:35006 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236312AbhE1KQa (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 28 May 2021 06:16:30 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 1E13B1C0B76; Fri, 28 May 2021 12:14:55 +0200 (CEST)
Date:   Fri, 28 May 2021 12:14:54 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Amireddy Mallikarjuna reddy 
        <mallikarjunax.reddy@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>,
        Abanoub Sameh <abanoubsameh8@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Luca Weiss <luca@z3ntu.xyz>
Subject: Re: [PATCH v1 28/28] leds: sgm3140: Put fwnode in any case during
 ->probe()
Message-ID: <20210528101454.GJ2209@amd>
References: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
 <20210510095045.3299382-29-andy.shevchenko@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ed/6oDxOLijJh8b0"
Content-Disposition: inline
In-Reply-To: <20210510095045.3299382-29-andy.shevchenko@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--ed/6oDxOLijJh8b0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> fwnode_get_next_child_node() bumps a reference counting of a returned var=
iable.
> We have to balance it whenever we return to the caller.

This (and similar) -- in half of the drivers we hold the handle from
successful probe. Is it a problem and why is it problem only for some
drivers?

Thanks for series, btw, I pushed out current version of the tree.

Best regards,
								Pavel

--=20
http://www.livejournal.com/~pavelmachek

--ed/6oDxOLijJh8b0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmCwwp4ACgkQMOfwapXb+vIS8wCfVQC421VH3xqggROvaYA1p7af
l7cAoKH7rhc7udLq/Hy8XoE0n3gwnC+7
=r3rT
-----END PGP SIGNATURE-----

--ed/6oDxOLijJh8b0--
