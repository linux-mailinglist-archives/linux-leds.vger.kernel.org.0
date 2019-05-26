Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9E3C2A8FA
	for <lists+linux-leds@lfdr.de>; Sun, 26 May 2019 09:38:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726470AbfEZHi7 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 26 May 2019 03:38:59 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:39748 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725972AbfEZHi6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 26 May 2019 03:38:58 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 9F39A802CD; Sun, 26 May 2019 09:38:45 +0200 (CEST)
Date:   Sun, 26 May 2019 09:38:55 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     hughd@google.com, jacek.anaszewski@gmail.com,
        linux-leds@vger.kernel.org,
        kernel list <linux-kernel@vger.kernel.org>
Subject: leds: avoid flush_work in atomic context
Message-ID: <20190526073854.GA13681@amd>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="UlVJffcvxoiEqYs2"
Content-Disposition: inline
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


It turns out that various triggers use led_blink_setup() from atomic
context, so we can't do a flush_work there. Flush is still needed for
slow LEDs, but we can move it to sysfs code where it is safe.
   =20
    WARNING: inconsistent lock state
    5.2.0-rc1 #1 Tainted: G        W
    --------------------------------
    inconsistent {SOFTIRQ-ON-W} -> {IN-SOFTIRQ-W} usage.
    swapper/1/0 [HC0[0]:SC1[1]:HE1:SE0] takes:
    000000006e30541b
    ((work_completion)(&led_cdev->set_brightness_work)){+.?.}, at:
    +__flush_work+0x3b/0x38a
    {SOFTIRQ-ON-W} state was registered at:
      lock_acquire+0x146/0x1a1
     __flush_work+0x5b/0x38a
     flush_work+0xb/0xd
     led_blink_setup+0x1e/0xd3
     led_blink_set+0x3f/0x44
     tpt_trig_timer+0xdb/0x106
     ieee80211_mod_tpt_led_trig+0xed/0x112
   =20
Fixes: 0db37915d912
Signed-off-by: Pavel Machek <pavel@ucw.cz>
Tested-by: Hugh Dickins <hughd@google.com>
   =20
diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index aefac4d..9f8da39 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -166,11 +166,6 @@ static void led_blink_setup(struct led_classdev *led_c=
dev,
 		     unsigned long *delay_on,
 		     unsigned long *delay_off)
 {
-	/*
-	 * If "set brightness to 0" is pending in workqueue, we don't
-	 * want that to be reordered after blink_set()
-	 */
-	flush_work(&led_cdev->set_brightness_work);
 	if (!test_bit(LED_BLINK_ONESHOT, &led_cdev->work_flags) &&
 	    led_cdev->blink_set &&
 	    !led_cdev->blink_set(led_cdev, delay_on, delay_off))
diff --git a/drivers/leds/trigger/ledtrig-timer.c b/drivers/leds/trigger/le=
dtrig-timer.c
index ca898c1..427fc3c 100644
--- a/drivers/leds/trigger/ledtrig-timer.c
+++ b/drivers/leds/trigger/ledtrig-timer.c
@@ -113,6 +113,11 @@ static int timer_trig_activate(struct led_classdev *le=
d_cdev)
 		led_cdev->flags &=3D ~LED_INIT_DEFAULT_TRIGGER;
 	}
=20
+	/*
+	 * If "set brightness to 0" is pending in workqueue, we don't
+	 * want that to be reordered after blink_set()
+	 */
+	flush_work(&led_cdev->set_brightness_work);
 	led_blink_set(led_cdev, &led_cdev->blink_delay_on,
 		      &led_cdev->blink_delay_off);
=20

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--UlVJffcvxoiEqYs2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzqQo4ACgkQMOfwapXb+vJZ5wCeOuzhonhKAc9kR3QYlQgTrzhT
nkwAoIcNo6zD0gpTKkeUuttcHes4o9OP
=vzsX
-----END PGP SIGNATURE-----

--UlVJffcvxoiEqYs2--
