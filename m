Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DE2631F86E
	for <lists+linux-leds@lfdr.de>; Fri, 19 Feb 2021 12:30:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230257AbhBSL3Z (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 19 Feb 2021 06:29:25 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:50120 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbhBSL2j (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 19 Feb 2021 06:28:39 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id E35CF1C0B8A; Fri, 19 Feb 2021 12:27:55 +0100 (CET)
Date:   Fri, 19 Feb 2021 12:27:55 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 6/7] leds: lp50xx: Add missed bits.h and convert to
 BIT()
Message-ID: <20210219112755.GN19207@duo.ucw.cz>
References: <20210216155050.29322-1-andriy.shevchenko@linux.intel.com>
 <20210216155050.29322-6-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="mkHYMT4O8DyWoHkb"
Content-Disposition: inline
In-Reply-To: <20210216155050.29322-6-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--mkHYMT4O8DyWoHkb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Add missed bits.h and convert to BIT() in lp50xx_set_banks().
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks, I applied whole series except this one...

<< is well known C, it can stay.

Best regards,
							Pavel
--=20
http://www.livejournal.com/~pavelmachek

--mkHYMT4O8DyWoHkb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYC+guwAKCRAw5/Bqldv6
8lfVAJ9fLh66nagRGvKWVOiXRIES1sFingCfVt/Dz8cpXZWeHXkuuzVtr2mPL34=
=TrQv
-----END PGP SIGNATURE-----

--mkHYMT4O8DyWoHkb--
