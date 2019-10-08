Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A2DDD0183
	for <lists+linux-leds@lfdr.de>; Tue,  8 Oct 2019 21:55:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729647AbfJHTzO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 8 Oct 2019 15:55:14 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:53653 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729616AbfJHTzO (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 8 Oct 2019 15:55:14 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id E22FA803F9; Tue,  8 Oct 2019 21:54:56 +0200 (CEST)
Date:   Tue, 8 Oct 2019 21:55:11 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Jean-Jacques Hiblot <jjhiblot@ti.com>, jacek.anaszewski@gmail.com,
        robh+dt@kernel.org, mark.rutland@arm.com,
        daniel.thompson@linaro.org, dmurphy@ti.com,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, tomi.valkeinen@ti.com
Subject: Re: [PATCH v8 0/5] Add a generic driver for LED-based backlight
Message-ID: <20191008195511.GA18412@amd>
References: <20191003082812.28491-1-jjhiblot@ti.com>
 <20191003114028.GC21172@dell>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="vtzGhvizbBRQ85DL"
Content-Disposition: inline
In-Reply-To: <20191003114028.GC21172@dell>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2019-10-03 12:40:28, Lee Jones wrote:
> On Thu, 03 Oct 2019, Jean-Jacques Hiblot wrote:
>=20
> > This series aims to add a led-backlight driver, similar to pwm-backligh=
t,
> > but using a LED class device underneath.
> >=20
> > A few years ago (2015), Tomi Valkeinen posted a series implementing a
> > backlight driver on top of a LED device:
> > https://patchwork.kernel.org/patch/7293991/
> > https://patchwork.kernel.org/patch/7294001/
> > https://patchwork.kernel.org/patch/7293981/
> >=20
> > The discussion stopped because Tomi lacked the time to work on it.
>=20
> [...]
>=20
> >  .../bindings/leds/backlight/led-backlight.txt |  28 ++
> >  drivers/leds/led-class.c                      |  98 ++++++-
> >  drivers/video/backlight/Kconfig               |   7 +
> >  drivers/video/backlight/Makefile              |   1 +
> >  drivers/video/backlight/led_bl.c              | 260 ++++++++++++++++++
> >  include/linux/leds.h                          |   6 +
> >  6 files changed, 399 insertions(+), 1 deletion(-)
> >  create mode 100644 Documentation/devicetree/bindings/leds/backlight/le=
d-backlight.txt
> >  create mode 100644 drivers/video/backlight/led_bl.c
>=20
> How should this set be processed?  I'm happy to take it through
> Backlight via an immutable branch and PR to be consumed by LED.

That would make sense to me.

For the record, series is Tested-by: Pavel Machek <pavel@ucw.cz> .

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--vtzGhvizbBRQ85DL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl2c6Z4ACgkQMOfwapXb+vIK8gCgvJrxfKNoHu2ieHmTclJsB+9j
meEAoJXF0QGnU4ymvSKDTKD+Ge/pLySm
=+WdX
-----END PGP SIGNATURE-----

--vtzGhvizbBRQ85DL--
