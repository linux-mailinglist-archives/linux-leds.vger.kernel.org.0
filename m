Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 036EB3CD44E
	for <lists+linux-leds@lfdr.de>; Mon, 19 Jul 2021 14:05:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236705AbhGSLYq (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 19 Jul 2021 07:24:46 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:33310 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236576AbhGSLYq (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 19 Jul 2021 07:24:46 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 55EE11C0B77; Mon, 19 Jul 2021 14:05:25 +0200 (CEST)
Date:   Mon, 19 Jul 2021 14:05:23 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Amy Parker <apark0006@student.cerritos.edu>,
        kernel test robot <lkp@intel.com>, kbuild-all@lists.01.org,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] swap led_brightness from enum to typedef
Message-ID: <20210719120523.GA20484@duo.ucw.cz>
References: <9b5902665dcc4c0fca7546987303e348d8657f59.1626383424.git.apark0006@student.cerritos.edu>
 <202107161046.heIVRW8r-lkp@intel.com>
 <CAPOgqxHndN+3J-C7+38vLedhN2bhAasW9JRxf-rvt7gvVhD1rQ@mail.gmail.com>
 <CAPOgqxHzhLt91N902NmWaVRO2RkmewWj9rJCdCt5qOrAjai+OQ@mail.gmail.com>
 <e1a4685e-ceab-75f2-ee18-09a0a9c55a87@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="4Ckj6UjgE2iN1+kY"
Content-Disposition: inline
In-Reply-To: <e1a4685e-ceab-75f2-ee18-09a0a9c55a87@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >>> vim +18 include/media/v4l2-flash-led-class.h
> >>>
> >>>     14
> >>>     15  struct led_classdev_flash;
> >>>     16  struct led_classdev;
> >>>     17  struct v4l2_flash;
> >>>   > 18  led_brightness;
> >>>     19
> >>>
> >>> ---
>=20
> >=20
> > Another patch was sent into the list to correct this error.
>=20
> Hopefully Pavel (LED subsystem maintainer) will comment soon-ish.
>=20
> My comments:
>=20
> a. This patch would be the right thing to do if your large patch had alre=
ady been
> applied (merged) somewhere, but AFAIK it hasn't been. So:
>=20
> b. IMO you should resend your entire patch set with this fix included.
> Send it as "v2" (version 2) and explain the changes in it since your
> original patch (which was v1). This v2 explanation should be below the
> "---" line in the patch. (See Documentation/process/submitting-patches.rst
> for more info -- or ask for more info/help.)

I still remember the old patch, so b. is not strictly neccessary here.

> c. For your follow-up patch to include/media/v4l2-flash-led-class.h, whic=
h was:
>=20
> -led_brightness;
> +typedef u8 led_brightness;
>=20
> I would just add this to include/media/v4l2-flash-led-class.h:
>=20
> #include <linux/leds.h>
>=20
> That way, in a few years, when the type of led_brightness changes again,
> someone won't have to remember to search for other typedefs of it and
> update them also. Or maybe they will do that after a bug happens and
> someone notices it.
>=20
> (Note that I am just trying to help. Pavel has more of a final
> say-so about this.)

And your comments are reasonable.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--4Ckj6UjgE2iN1+kY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYPVqgwAKCRAw5/Bqldv6
8sqcAJ0fEgANqqfVlKhtWakvUenLudcV5ACgn+3+BKVHIGKTxz+twWmvkg3w3eE=
=vptw
-----END PGP SIGNATURE-----

--4Ckj6UjgE2iN1+kY--
