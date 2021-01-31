Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0691309B43
	for <lists+linux-leds@lfdr.de>; Sun, 31 Jan 2021 10:52:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230256AbhAaJvL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 31 Jan 2021 04:51:11 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:54940 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230151AbhAaJo3 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 31 Jan 2021 04:44:29 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id C835D1C0B80; Sun, 31 Jan 2021 10:42:55 +0100 (CET)
Date:   Sun, 31 Jan 2021 10:42:55 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        kernel list <linux-kernel@vger.kernel.org>,
        jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org
Subject: [GIT PULL] LEDs chagnes for v5.11-rc
Message-ID: <20210131094255.GA31740@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="VS++wcV0S1rZb1Fb"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--VS++wcV0S1rZb1Fb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

This pull is due to "leds: trigger: fix potential deadlock with
libata" -- people find the warn annoying. It also contains new driver
(still should be okay late in -rcs, right?) and two trivial fixes.

Best regards,
								Pavel

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/ for-r=
c-5.11

for you to fetch changes up to e1c6edcbea13de025c3406645b4cce4ac3baf973:

  leds: rt8515: Add Richtek RT8515 LED driver (2021-01-31 10:38:03 +0100)

----------------------------------------------------------------
Andrea Righi (1):
      leds: trigger: fix potential deadlock with libata

Linus Walleij (2):
      dt-bindings: leds: Add DT binding for Richtek RT8515
      leds: rt8515: Add Richtek RT8515 LED driver

Zheng Yongjun (2):
      leds: leds-lm3533: convert comma to semicolon
      leds: leds-ariel: convert comma to semicolon

 .../devicetree/bindings/leds/richtek,rt8515.yaml   | 111 ++++++
 drivers/leds/Kconfig                               |   3 +
 drivers/leds/Makefile                              |   3 +
 drivers/leds/flash/Kconfig                         |  15 +
 drivers/leds/flash/Makefile                        |   3 +
 drivers/leds/flash/leds-rt8515.c                   | 397 +++++++++++++++++=
++++
 drivers/leds/led-triggers.c                        |  10 +-
 drivers/leds/leds-ariel.c                          |   6 +-
 drivers/leds/leds-lm3533.c                         |   2 +-
 9 files changed, 542 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/richtek,rt8515.y=
aml
 create mode 100644 drivers/leds/flash/Kconfig
 create mode 100644 drivers/leds/flash/Makefile
 create mode 100644 drivers/leds/flash/leds-rt8515.c

--=20
http://www.livejournal.com/~pavelmachek

--VS++wcV0S1rZb1Fb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYBZ7nwAKCRAw5/Bqldv6
8kv+AJ9u60IV/4XVsv2wwLJOQnGGVxvfZACghfBloNL51XaXBlbAYKrgQoOt5H8=
=Br7k
-----END PGP SIGNATURE-----

--VS++wcV0S1rZb1Fb--
