Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B49A33365A
	for <lists+linux-leds@lfdr.de>; Wed, 10 Mar 2021 08:29:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229875AbhCJH2r (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 10 Mar 2021 02:28:47 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:45800 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231152AbhCJH2d (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 10 Mar 2021 02:28:33 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 0F22E1C0B8E; Wed, 10 Mar 2021 08:28:32 +0100 (CET)
Date:   Wed, 10 Mar 2021 08:28:31 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Adam Borowski <kilobyte@angband.pl>
Cc:     Arnd Bergmann <arnd@kernel.org>, rafael.j.wysocki@intel.com,
        Arnd Bergmann <arnd@arndb.de>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: MaxLinear, please maintain your drivers was Re: [PATCH] leds:
 lgm: fix gpiolib dependency
Message-ID: <20210310072831.GA29779@amd>
References: <20210308153052.2353885-1-arnd@kernel.org>
 <20210309180851.GA4669@duo.ucw.cz>
 <20210309193910.GA7507@amd>
 <YEgeoPqCCgTUEsSc@angband.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="J2SCkAp4GZ/dPZZf"
Content-Disposition: inline
In-Reply-To: <YEgeoPqCCgTUEsSc@angband.pl>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--J2SCkAp4GZ/dPZZf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > I'd like people from Intel to contact me. There's more to fix there,
> > > and AFAICT original author went away.
> >=20
> > The following message to <mallikarjunax.reddy@linux.intel.com> was
> > undeliverable.
>=20
> > <mallikarjunax.reddy@linux.intel.com>: Recipient
> > +address rejected: User unknown in virtual mailbox table'
>=20
> > commit c3987cd2bca34ddfec69027acedb2fae5ffcf7a0
> > Author: Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel.co=
m>
>=20
> I asked around, and got told Mallikarjuna has been "sold" to MaxLinear,
> together with the rest of the Connected Home Division.  So he most likely
> still works on this stuff, just under a different banner.
>=20
> > If someone knows how to contact the author, that would be welcome.
>=20
> Alas, no idea about his MaxLinear address.

Thanks for the effort. Anyway, I suspect I'll just do this:

BR,
								Pavel

diff --git a/drivers/leds/blink/Kconfig b/drivers/leds/blink/Kconfig
index 6dedc58c47b3..79493f21d365 100644
--- a/drivers/leds/blink/Kconfig
+++ b/drivers/leds/blink/Kconfig
@@ -1,14 +1,6 @@
-menuconfig LEDS_BLINK
-	bool "LED Blink support"
-	depends on LEDS_CLASS
-	help
-	  This option enables blink support for the leds class.
-	  If unsure, say Y.
-
-if LEDS_BLINK
-
 config LEDS_BLINK_LGM
 	tristate "LED support for Intel LGM SoC series"
+	depends on BROKEN
 	depends on GPIOLIB
 	depends on LEDS_CLASS
 	depends on MFD_SYSCON
@@ -17,5 +9,3 @@ config LEDS_BLINK_LGM
 	  Parallel to serial conversion, which is also called SSO controller,
 	  can drive external shift register for LED outputs.
 	  This enables LED support for Serial Shift Output controller(SSO).
-
-endif # LEDS_BLINK


--=20
http://www.livejournal.com/~pavelmachek

--J2SCkAp4GZ/dPZZf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmBIdR8ACgkQMOfwapXb+vId5wCfczM3LRgtlt7+XestLmn71GFp
JZYAoLhqW7qz48VoNHWoYRgmhdna7Mva
=Z+gZ
-----END PGP SIGNATURE-----

--J2SCkAp4GZ/dPZZf--
