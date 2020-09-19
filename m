Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA9E8270C39
	for <lists+linux-leds@lfdr.de>; Sat, 19 Sep 2020 11:38:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726129AbgISJig (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 19 Sep 2020 05:38:36 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:42722 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726097AbgISJig (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 19 Sep 2020 05:38:36 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id EBE731C0B85; Sat, 19 Sep 2020 11:38:33 +0200 (CEST)
Date:   Sat, 19 Sep 2020 11:38:33 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     linux-leds@vger.kernel.org, dmurphy@ti.com
Subject: ledtrig-cpu: Limit to 4 CPUs
Message-ID: <20200919093833.GA14326@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="PNTmBPCT7hxwcZjr"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--PNTmBPCT7hxwcZjr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

commit 318681d3e019e39354cc6c2155a7fd1bb8e8084d
Author: Pavel Machek <pavel@ucw.cz>
Date:   Sat Sep 19 11:34:58 2020 +0200

    ledtrig-cpu: Limit to 4 CPUs
   =20
    Some machines have thousands of CPUs... and trigger mechanisms was not
    really meant for thousands of triggers. I doubt anyone uses this
    trigger on many-CPU machine; but if they do, they'll need to do it
    properly.
   =20
    Signed-off-by: Pavel Machek <pavel@ucw.cz>

diff --git a/drivers/leds/trigger/ledtrig-cpu.c b/drivers/leds/trigger/ledt=
rig-cpu.c
index 869976d1b734..b7e00b09b137 100644
--- a/drivers/leds/trigger/ledtrig-cpu.c
+++ b/drivers/leds/trigger/ledtrig-cpu.c
@@ -2,14 +2,18 @@
 /*
  * ledtrig-cpu.c - LED trigger based on CPU activity
  *
- * This LED trigger will be registered for each possible CPU and named as
- * cpu0, cpu1, cpu2, cpu3, etc.
+ * This LED trigger will be registered for first four CPUs and named
+ * as cpu0, cpu1, cpu2, cpu3. There's additional trigger called cpu that
+ * is on when any CPU is active.
+ *
+ * If you want support for arbitrary number of CPUs, make it one trigger,
+ * with additional sysfs file selecting which CPU to watch.
  *
  * It can be bound to any LED just like other triggers using either a
  * board file or via sysfs interface.
  *
  * An API named ledtrig_cpu is exported for any user, who want to add CPU
- * activity indication in their code
+ * activity indication in their code.
  *
  * Copyright 2011 Linus Walleij <linus.walleij@linaro.org>
  * Copyright 2011 - 2012 Bryan Wu <bryan.wu@canonical.com>
@@ -145,6 +149,9 @@ static int __init ledtrig_cpu_init(void)
 	for_each_possible_cpu(cpu) {
 		struct led_trigger_cpu *trig =3D &per_cpu(cpu_trig, cpu);
=20
+		if (cpu > 4)
+			continue;
+
 		snprintf(trig->name, MAX_NAME_LEN, "cpu%d", cpu);
=20
 		led_trigger_register_simple(trig->name, &trig->_trig);

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--PNTmBPCT7hxwcZjr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX2XRmQAKCRAw5/Bqldv6
8t4uAKCRZUTaR6lHI7mFGs+cmuxqvGVaNACbBzyL4DtheYwoSXkI9/zusK+95C4=
=+85X
-----END PGP SIGNATURE-----

--PNTmBPCT7hxwcZjr--
