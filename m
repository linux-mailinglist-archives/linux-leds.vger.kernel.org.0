Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31BDC278418
	for <lists+linux-leds@lfdr.de>; Fri, 25 Sep 2020 11:33:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727346AbgIYJdV (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 25 Sep 2020 05:33:21 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:44384 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727044AbgIYJdV (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 25 Sep 2020 05:33:21 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 18C6B1C0C44; Fri, 25 Sep 2020 11:33:19 +0200 (CEST)
Date:   Fri, 25 Sep 2020 11:33:18 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     linux-leds@vger.kernel.org, dmurphy@ti.com
Subject: [PATCH] leds: Add documentation about possible subsystem improvements
Message-ID: <20200925093318.GB20659@amd>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="xXmbgvnjoT4axfJE"
Content-Disposition: inline
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--xXmbgvnjoT4axfJE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


commit f91fdbb47959537df6175cb4f0e6eb75757540f7
Author: Pavel Machek <pavel@ucw.cz>
Date:   Fri Sep 25 11:29:17 2020 +0200

    leds: Add documentation about possible subsystem improvements
   =20
    Help welcome :-).
   =20
    Signed-off-by: Pavel Machek <pavel@ucw.cz>

diff --git a/drivers/leds/TODO b/drivers/leds/TODO
new file mode 100644
index 000000000000..5beaca261f0a
--- /dev/null
+++ b/drivers/leds/TODO
@@ -0,0 +1,58 @@
+-*- org -*-
+
+* On/off LEDs should have max_brightness of 1
+* Get rid of enum led_brightness
+
+It is really an integer, as maximum is configurable. Get rid of it, or
+make it into typedef or something.
+
+* Review atomicity requirements in LED subsystem
+
+Calls that may and that may not block are mixed in same structure, and
+semantics is sometimes non-intuitive. (For example blink callback may
+not sleep.) Review the requirements for any bugs and document them
+clearly.
+
+* LED names are still a mess
+
+No two LEDs have same name, so the names are probably unusable for the
+userland. Nudge authors into creating common LED names for common
+functionality.
+
+? Perhaps check for known LED names during boot, and warn if there are
+LEDs not on the list?
+
+* Split drivers into subdirectories
+
+The number of drivers is getting big, and driver for on/off LED on a
+i/o port is really quite different from camera flash LED, which is
+really different from driver for RGB color LED that can run its own
+microcode. Split the drivers somehow.
+
+* Figure out what to do with RGB leds
+
+Multicolor is a bit too abstract. Yes, we can have
+Green-Magenta-Ultraviolet LED, but so far all the LEDs we support are
+RGB, and not even RGB-White or RGB-Yellow variants emerged.
+
+Multicolor is not a good fit for RGB LED. It does not really know
+about LED color.  In particular, there's no way to make LED "white".
+
+Userspace is interested in knowing "this LED can produce arbitrary
+color", which not all multicolor LEDs can.
+
+	Proposal: let's add "rgb" to led_colors in drivers/leds/led-core.c,
+	add corresponding device tree defines, and use that, instead of
+	multicolor for RGB LEDs.
+
+	We really need to do that now; "white" stuff can wait.
+
+RGB LEDs are quite common, and it would be good to be able to turn LED
+white and to turn it into any arbitrary color. It is essential that
+userspace is able to set arbitrary colors, and it might be good to
+have that ability from kernel, too... to allow full-color triggers.
+
+* Command line utility to manipulate the LEDs?
+
+/sys interface is not really suitable to use by hand, should we have
+an utility to perform LED control?


--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--xXmbgvnjoT4axfJE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl9tuV4ACgkQMOfwapXb+vKb1QCeJEwQYrHR+VL47oB67sQiNyf1
GmgAnjeHzyev2csR9U9Mkh+zwGnXhc8M
=DDNx
-----END PGP SIGNATURE-----

--xXmbgvnjoT4axfJE--
