Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41B563F287D
	for <lists+linux-leds@lfdr.de>; Fri, 20 Aug 2021 10:33:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233248AbhHTIeH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 20 Aug 2021 04:34:07 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:41362 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232507AbhHTIeG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 20 Aug 2021 04:34:06 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 5D42B1C0B80; Fri, 20 Aug 2021 10:33:28 +0200 (CEST)
Date:   Fri, 20 Aug 2021 10:33:27 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     linux-leds@vger.kernel.org,
        kernel list <linux-kernel@vger.kernel.org>,
        jacek.anaszewski@gmail.com, kabel@kernel.org
Subject: [PATCH] Documentation: leds: standartizing LED names
Message-ID: <20210820083327.GB22757@amd>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="XF85m9dhOBO43t/C"
Content-Disposition: inline
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--XF85m9dhOBO43t/C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

I pushed this into the LED tree. It was long overdue. If you have LED
with functionality that is common across systems (for example LEDs on
ethernet ports are quite common), please add proposed naming here.

Best regards,
							Pavel

commit 09f1273064eea23ec41fb206f6eccc2bf79d1fa1
Author: Pavel Machek <pavel@ucw.cz>
Date:   Fri Aug 20 10:26:24 2021 +0200

    Documentation: leds: standartizing LED names
   =20
    We have a list of valid functions, but LED names in sysfs are still
    far from being consistent. Create list of "well known" LED names so we
    nudge people towards using same LED names (except color) for same
    functionality.
   =20
    Signed-off-by: Pavel Machek <pavel@ucw.cz>

diff --git a/Documentation/leds/well-known-leds.txt b/Documentation/leds/we=
ll-known-leds.txt
new file mode 100644
index 000000000000..4a8b9dc4bf52
--- /dev/null
+++ b/Documentation/leds/well-known-leds.txt
@@ -0,0 +1,58 @@
+-*- org -*-
+
+It is somehow important to provide consistent interface to the
+userland. LED devices have one problem there, and that is naming of
+directories in /sys/class/leds. It would be nice if userland would
+just know right "name" for given LED function, but situation got more
+complex.
+
+Anyway, if backwards compatibility is not an issue, new code should
+use one of the "good" names from this list, and you should extend the
+list where applicable.
+
+Legacy names are listed, too; in case you are writing application that
+wants to use particular feature, you should probe for good name, first,
+but then try the legacy ones, too.
+
+Notice there's a list of functions in include/dt-bindings/leds/common.h .
+
+* Keyboards
+ =20
+Good: "input*:*:capslock"
+Good: "input*:*:scrolllock"
+Good: "input*:*:numlock"
+Legacy: "shift-key-light" (Motorola Droid 4, capslock)
+
+Set of common keyboard LEDs, going back to PC AT or so.
+
+Legacy: "tpacpi::thinklight" (IBM/Lenovo Thinkpads)
+Legacy: "lp5523:kb{1,2,3,4,5,6}" (Nokia N900)
+
+Frontlight/backlight of main keyboard.
+
+Legacy: "button-backlight" (Motorola Droid 4)
+
+Some phones have touch buttons below screen; it is different from main
+keyboard. And this is their backlight.
+
+* Sound subsystem
+
+Good: "platform:*:mute"
+Good: "platform:*:micmute"
+
+LEDs on notebook body, indicating that sound input / output is muted.
+
+* System notification
+
+Legacy: "status-led:{red,green,blue}" (Motorola Droid 4)
+Legacy: "lp5523:{r,g,b}" (Nokia N900)
+
+Phones usually have multi-color status LED.
+
+* Power management
+
+Good: "platform:*:charging" (allwinner sun50i)
+
+* Screen
+
+Good: ":backlight" (Motorola Droid 4)




--=20
http://www.livejournal.com/~pavelmachek

--XF85m9dhOBO43t/C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmEfaNcACgkQMOfwapXb+vLAPgCfZwnO2KRIswYEM936EVnSngb/
2GMAn22hI8Pw3VF03nPSh8GKusjmUg3i
=1MPf
-----END PGP SIGNATURE-----

--XF85m9dhOBO43t/C--
