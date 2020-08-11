Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 613FA241BCB
	for <lists+linux-leds@lfdr.de>; Tue, 11 Aug 2020 15:52:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728745AbgHKNwa (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 11 Aug 2020 09:52:30 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:45588 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728741AbgHKNwa (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 11 Aug 2020 09:52:30 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 23B201C0BD8; Tue, 11 Aug 2020 15:52:27 +0200 (CEST)
Date:   Tue, 11 Aug 2020 15:52:26 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     linux-doc@vger.kernel.org,
        kernel list <linux-kernel@vger.kernel.org>, corbet@lwn.net,
        jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org
Subject: [PATCH] leds: we don't want people to use LED subsystem for
 vibrations
Message-ID: <20200811135226.GA26056@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ZGiS0Q5IWpPtfppv"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

This will eventually go in, unless I hear some good reasons not to.

Best regards,
								Pavel

=3D=3D=3D

    leds: we don't want people to use LED subsystem for vibrations
   =20
    Remove notes about vibrations, as that is better done using input
    subsystem.
   =20
    Signed-off-by: Pavel Machek <pavel@ucw.cz>

diff --git a/Documentation/leds/ledtrig-transient.rst b/Documentation/leds/=
ledtrig-transient.rst
index eedfa1626e8a..63072f310660 100644
--- a/Documentation/leds/ledtrig-transient.rst
+++ b/Documentation/leds/ledtrig-transient.rst
@@ -17,12 +17,6 @@ set a timer to hold a state, however when user space app=
lication crashes or
 goes away without deactivating the timer, the hardware will be left in that
 state permanently.
=20
-As a specific example of this use-case, let's look at vibrate feature on
-phones. Vibrate function on phones is implemented using PWM pins on SoC or
-PMIC. There is a need to activate one shot timer to control the vibrate
-feature, to prevent user space crashes leaving the phone in vibrate mode
-permanently causing the battery to drain.
-
 Transient trigger addresses the need for one shot timer activation. The
 transient trigger can be enabled and disabled just like the other leds
 triggers.
@@ -159,7 +153,6 @@ repeat the following step as needed::
=20
 This trigger is intended to be used for the following example use cases:
=20
- - Control of vibrate (phones, tablets etc.) hardware by user space app.
  - Use of LED by user space app as activity indicator.
  - Use of LED by user space app as a kind of watchdog indicator -- as
    long as the app is alive, it can keep the LED illuminated, if it dies

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--ZGiS0Q5IWpPtfppv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXzKimgAKCRAw5/Bqldv6
8i6WAKCbiJDq+getQ1Skm9i6lcJ54JD7sQCfUOiBbtKETVb1Sf/7DjtVQjlUCTg=
=16O0
-----END PGP SIGNATURE-----

--ZGiS0Q5IWpPtfppv--
