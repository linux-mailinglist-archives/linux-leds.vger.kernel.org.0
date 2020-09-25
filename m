Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E061F27855C
	for <lists+linux-leds@lfdr.de>; Fri, 25 Sep 2020 12:47:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727521AbgIYKrn (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 25 Sep 2020 06:47:43 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:52232 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727201AbgIYKrn (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 25 Sep 2020 06:47:43 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 88E5F1C0C46; Fri, 25 Sep 2020 12:47:40 +0200 (CEST)
Date:   Fri, 25 Sep 2020 12:47:39 +0200
From:   Pavel Machek <pavel@denx.de>
To:     linux-kernel-mentees@lists.linuxfoundation.org,
        kernel list <linux-kernel@vger.kernel.org>,
        linux-leds@vger.kernel.org
Subject: Help wanted in LED subsystem
Message-ID: <20200925104739.GA26609@amd>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="+QahgC5+KEYLbs62"
Content-Disposition: inline
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--+QahgC5+KEYLbs62
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

In linux-next, I published TODO list for LED subsystem. Is that
something linux-kernel-mentees could help with?

Best regards,
							Pavel


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

--+QahgC5+KEYLbs62
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl9tyssACgkQMOfwapXb+vJwYwCdG0auv9aF9khVFQIS3OPAAcqk
mMkAniskimJAzmhYhVGKqTW4+k7j3T3f
=IOvW
-----END PGP SIGNATURE-----

--+QahgC5+KEYLbs62--
