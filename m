Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3319C28C84
	for <lists+linux-leds@lfdr.de>; Thu, 23 May 2019 23:43:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388038AbfEWVnE (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 May 2019 17:43:04 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:45903 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387709AbfEWVnE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 May 2019 17:43:04 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 37E90803EF; Thu, 23 May 2019 23:42:52 +0200 (CEST)
Date:   Thu, 23 May 2019 23:43:01 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        jacek.anaszewski@gmail.com
Cc:     linus.walleij@linaro.org, linz@li-pro.net, rpurdie@rpsys.net
Subject: Disk activity trigger: keeps blinking under full load
Message-ID: <20190523214301.GA14788@amd>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="gBBFr7Ir9EOA20Yy"
Content-Disposition: inline
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--gBBFr7Ir9EOA20Yy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

I'm trying to use disk activity trigger on a scrollock LED... but it
significantly differs from "usual" disk LED: even under "full" disk
activity (linear read) where it should be solidly "on", it keeps
blinking.

I guess that's what led_trigger_blink_oneshot() does. I tried to
change the parameters... off_delay =3D=3D 0 breaks it completely, and even
with delay of 1 it behaves very weirdly.

Is there better helper I should use?

								Pavel

diff --git a/drivers/leds/trigger/ledtrig-disk.c b/drivers/leds/trigger/led=
trig-disk.c
index 9816b0d..cf40ef2 100644
--- a/drivers/leds/trigger/ledtrig-disk.c
+++ b/drivers/leds/trigger/ledtrig-disk.c
@@ -15,7 +15,7 @@
 #include <linux/init.h>
 #include <linux/leds.h>
=20
-#define BLINK_DELAY 30
+#define BLINK_DELAY 10
=20
 DEFINE_LED_TRIGGER(ledtrig_disk);
 DEFINE_LED_TRIGGER(ledtrig_disk_read);
@@ -25,17 +25,18 @@ DEFINE_LED_TRIGGER(ledtrig_ide);
 void ledtrig_disk_activity(bool write)
 {
 	unsigned long blink_delay =3D BLINK_DELAY;
+	unsigned long off_delay =3D 1;
=20
 	led_trigger_blink_oneshot(ledtrig_disk,
-				  &blink_delay, &blink_delay, 0);
+				  &blink_delay, &off_delay, 0);
 	led_trigger_blink_oneshot(ledtrig_ide,
-				  &blink_delay, &blink_delay, 0);
+				  &blink_delay, &off_delay, 0);
 	if (write)
 		led_trigger_blink_oneshot(ledtrig_disk_write,
-					  &blink_delay, &blink_delay, 0);
+					  &blink_delay, &off_delay, 0);
 	else
 		led_trigger_blink_oneshot(ledtrig_disk_read,
-					  &blink_delay, &blink_delay, 0);
+					  &blink_delay, &off_delay, 0);
 }
 EXPORT_SYMBOL(ledtrig_disk_activity);
=20
@@ -44,6 +45,7 @@ static int __init ledtrig_disk_init(void)
 	led_trigger_register_simple("disk-activity", &ledtrig_disk);
 	led_trigger_register_simple("disk-read", &ledtrig_disk_read);
 	led_trigger_register_simple("disk-write", &ledtrig_disk_write);
+	/* deprecate? */
 	led_trigger_register_simple("ide-disk", &ledtrig_ide);
=20
 	return 0;




--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--gBBFr7Ir9EOA20Yy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlznE+UACgkQMOfwapXb+vJKOACdGqPnr09NzC9PQ2XF5MqD1rmO
xDIAn1fRxyfo3+ezZ5mZPTjNix5XLTrg
=VoB2
-----END PGP SIGNATURE-----

--gBBFr7Ir9EOA20Yy--
