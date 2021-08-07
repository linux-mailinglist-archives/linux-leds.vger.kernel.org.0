Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B90CD3E33E4
	for <lists+linux-leds@lfdr.de>; Sat,  7 Aug 2021 09:17:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231408AbhHGHRQ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 7 Aug 2021 03:17:16 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:54436 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231405AbhHGHRP (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 7 Aug 2021 03:17:15 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id D5C141C0B7C; Sat,  7 Aug 2021 09:16:57 +0200 (CEST)
Date:   Sat, 7 Aug 2021 09:16:57 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v1 1/1] leds: lgm-sso: Propagate error codes from callee
 to caller
Message-ID: <20210807071656.GB25211@amd>
References: <20210805112619.65116-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="EuxKj2iCbKjpUGkD"
Content-Disposition: inline
In-Reply-To: <20210805112619.65116-1-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--EuxKj2iCbKjpUGkD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> The one of the latest change to the driver reveals the problem that
> the error codes from callee aren't propagated to the caller of
> __sso_led_dt_parse(). Fix this accordingly.
>=20
> Fixes: 9999908ca1ab ("leds: lgm-sso: Put fwnode in any case during ->prob=
e()")
> Fixes: c3987cd2bca3 ("leds: lgm: Add LED controller driver for LGM SoC")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thank you, applied.
								Pavel
							=09
--=20
http://www.livejournal.com/~pavelmachek

--EuxKj2iCbKjpUGkD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmEOM2gACgkQMOfwapXb+vKZFQCgnFbou3kuO9HcC7i0jYUS1BiD
9L4AnRlYQyCHrnINiQJ/lZ/97DCJx4c6
=BrKj
-----END PGP SIGNATURE-----

--EuxKj2iCbKjpUGkD--
