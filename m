Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 307E0327193
	for <lists+linux-leds@lfdr.de>; Sun, 28 Feb 2021 09:30:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230075AbhB1IaA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 28 Feb 2021 03:30:00 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:55882 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230419AbhB1I37 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 28 Feb 2021 03:29:59 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 749D61C0B77; Sun, 28 Feb 2021 09:29:14 +0100 (CET)
Date:   Sun, 28 Feb 2021 09:29:13 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     kernel test robot <lkp@intel.com>, linux-leds@vger.kernel.org
Cc:     Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel.com>,
        kbuild-all@lists.01.org, clang-built-linux@googlegroups.com,
        linux-kernel@vger.kernel.org
Subject: Re: drivers/leds/blink/leds-lgm-sso.c:123:19: error: field has
 incomplete type 'struct gpio_chip'
Message-ID: <20210228082913.GA27151@amd>
References: <202102280329.hv7RoHLA-lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="C7zPtVaVf+AK4Oqc"
Content-Disposition: inline
In-Reply-To: <202102280329.hv7RoHLA-lkp@intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--C7zPtVaVf+AK4Oqc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >> drivers/leds/blink/leds-lgm-sso.c:263:3: error: implicit declaration o=
f function 'gpiod_set_value' [-Werror,-Wimplicit-function-declaration]
>                    gpiod_set_value(led->gpiod, val);
>                    ^
>    drivers/leds/blink/leds-lgm-sso.c:263:3: note: did you mean
>                    'gpio_set_value'?


It looks like missing #include?

While at it, can you do something with Kconfig help text? Move
existing one into comment in the driver, add something useful for end-users.

Thank you,
									Pavel
--=20
http://www.livejournal.com/~pavelmachek

--C7zPtVaVf+AK4Oqc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmA7VFkACgkQMOfwapXb+vJIuACaAvjcK75ZHLtHKWccdkr+sTui
BpgAn29Exf+50mxBYN/Et3japQPws1vE
=Bxif
-----END PGP SIGNATURE-----

--C7zPtVaVf+AK4Oqc--
