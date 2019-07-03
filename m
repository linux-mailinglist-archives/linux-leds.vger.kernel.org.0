Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FA385EEFC
	for <lists+linux-leds@lfdr.de>; Thu,  4 Jul 2019 00:05:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727055AbfGCWFa (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 3 Jul 2019 18:05:30 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:38371 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727056AbfGCWFa (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 3 Jul 2019 18:05:30 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 35F328060B; Thu,  4 Jul 2019 00:05:16 +0200 (CEST)
Date:   Thu, 4 Jul 2019 00:05:26 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     David Laight <David.Laight@ACULAB.COM>
Cc:     'Linus Walleij' <linus.walleij@linaro.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Rob Herring <robh@kernel.org>,
        Dmitry Torokhov <dtor@google.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Dan Murphy <dmurphy@ti.com>,
        Baolin Wang <baolin.wang@linaro.org>,
        Daniel Mack <daniel@zonque.org>,
        Oleh Kravchenko <oleg@kaa.org.ua>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Simon Shields <simon@lineageos.org>
Subject: Various LED complexities was Re: [PATCH v5 05/26] leds: core: Add
 support for composing LED class device names
Message-ID: <20190703220526.GB876@amd>
References: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
 <20190609190803.14815-6-jacek.anaszewski@gmail.com>
 <CACRpkdYdqKZVKSaQB0THi=iZcRT04EKX2-85__Hw1f53o8vsuw@mail.gmail.com>
 <643e3b10fe9d45b59ed063ffc6d578ff@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="vGgW1X5XWziG23Ko"
Content-Disposition: inline
In-Reply-To: <643e3b10fe9d45b59ed063ffc6d578ff@AcuMS.aculab.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--vGgW1X5XWziG23Ko
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2019-06-28 13:30:30, David Laight wrote:
> From: Linus Walleij
> > Sent: 28 June 2019 09:46
> ...
> > A problem with LEDs is that it invites bikeshedding because it is too
> > relateable.
>=20
> Bikeshedding leds :-)
>=20
> It also isn't at all clear how to handle bi-colour and tri-colour leds.
> ISTR the usual interface lets you set the brightness, but more often
> leds are single brightness but multi-colour.
> Eg the ethernet 'speed' led which is (usually) off/orange/green.
>=20
> Changing the brightness either means changing the current or using PWM.
> Both really require more hardware support than changing colours.
>=20
> I've done some led driving (for a front panel) from a PLD (small FPGA).
> As well as the obvious things I did:
> - dim: 1/8th on at 80Hz.
> - flash: 1/8th on at 4Hz.
> - orange: 50-50 red-green at 80Hz on an RGB led.
>=20
> There was also the 'ethernet activity' led which could either be driven
> by the hardware, or forced on/off/flash by the driver.
> If driven by the hardware, the software could read the current state.
>=20
> None of this really fitted the Linux leds interface.

Well, we are working on some of those :-). But lets discuss that in
separate threads.

In particular we are working on triggers and RGB LEDs.

bi-color LEDs seem to handled as two separate LEDs. Not much expected
to change there.
								=09
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--vGgW1X5XWziG23Ko
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl0dJqYACgkQMOfwapXb+vK3+gCgip2UEFe6NwueZy1C3k5AeG/n
otAAnjpPCwHWvYp6ku5OriKI1CkGFCYr
=31SK
-----END PGP SIGNATURE-----

--vGgW1X5XWziG23Ko--
