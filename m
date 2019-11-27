Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E27DA10C056
	for <lists+linux-leds@lfdr.de>; Wed, 27 Nov 2019 23:46:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727097AbfK0WqS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 27 Nov 2019 17:46:18 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:44684 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726947AbfK0WqS (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 27 Nov 2019 17:46:18 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 1232D1C229A; Wed, 27 Nov 2019 23:46:15 +0100 (CET)
Date:   Wed, 27 Nov 2019 23:46:14 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        kernel list <linux-kernel@vger.kernel.org>,
        jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org
Subject: [GIT PULL] LEDs changes for v5.5-rc1
Message-ID: <20191127224614.GA24850@amd>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="k1lZvvs/B4yU6o8G"
Content-Disposition: inline
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--k1lZvvs/B4yU6o8G
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

LED updates for 5.5-rc1

This contains usual small updates to drivers, and removal of PAGE_SIZE
limits on /sys/class/leds/<led>/trigger.

We should not be really having that many triggers; but with cpu
activity triggers we do, and we'll eventually need to fix it,
but... remove the limit for now.

Signed-off-by: Pavel Machek <pavel@ucw.cz>

The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/ tags/=
leds-5.5-rc1

for you to fetch changes up to 5f820ed52371b4f5d8c43c93f03408d0dbc01e5b:

  leds: trigger: netdev: fix handling on interface rename (2019-11-03 18:10=
:12 +0100)

----------------------------------------------------------------
Akinobu Mita (1):
      leds: remove PAGE_SIZE limit of /sys/class/leds/<led>/trigger

Chuhong Yuan (1):
      leds: an30259a: add a check for devm_regmap_init_i2c

Dan Murphy (8):
      leds: Kconfig: Be consistent with the usage of "LED"
      leds: flash: Convert non extended registration to inline
      leds: flash: Remove extern from the header file
      leds: flash: Add devm_* functions to the flash class
      leds: lm3601x: Convert class registration to device managed
      leds: core: Remove extern from header
      leds: core: Fix devm_classdev_match to reference correct structure
      leds: core: Fix leds.h structure documentation

Daniel Mack (1):
      drivers: leds: tlc591xx: check error during device init

Guido G=FCnther (5):
      leds: lm3692x: Print error value on dev_err
      leds: lm3692x: Don't overwrite return value in error path
      leds: lm3692x: Handle failure to probe the regulator
      leds: lm3692x: Use flags from LM3692X_BOOST_CTRL
      leds: lm3692x: Use flags from LM3692X_BRT_CTRL

Jean-Jacques Hiblot (3):
      leds: tlc591xx: simplify driver by using the managed led API
      leds: tlc591xx: use devm_led_classdev_register_ext()
      leds: tlc591xx: update the maximum brightness

Markus Elfring (2):
      leds: bcm6328: Use devm_platform_ioremap_resource() in bcm6328_leds_p=
robe()
      leds: bcm6358: Use devm_platform_ioremap_resource() in bcm6358_leds_p=
robe()

Martin Schiller (1):
      leds: trigger: netdev: fix handling on interface rename

Oleh Kravchenko (3):
      dt-bindings: Add docs for EL15203000
      leds: add LED driver for EL15203000 board
      leds: mlxreg: Fix possible buffer overflow

Stephen Boyd (1):
      leds: pca953x: Use of_device_get_match_data()

 .../ABI/testing/sysfs-class-led-driver-el15203000  | 139 ++++++++
 .../devicetree/bindings/leds/leds-el15203000.txt   |  69 ++++
 drivers/leds/Kconfig                               |  17 +-
 drivers/leds/Makefile                              |   1 +
 drivers/leds/led-class-flash.c                     |  50 +++
 drivers/leds/led-class.c                           |  10 +-
 drivers/leds/led-triggers.c                        |  90 ++++--
 drivers/leds/leds-an30259a.c                       |   7 +
 drivers/leds/leds-bcm6328.c                        |   7 +-
 drivers/leds/leds-bcm6358.c                        |   7 +-
 drivers/leds/leds-el15203000.c                     | 357 +++++++++++++++++=
++++
 drivers/leds/leds-lm3601x.c                        |   4 +-
 drivers/leds/leds-lm3692x.c                        |  47 ++-
 drivers/leds/leds-mlxreg.c                         |   4 +-
 drivers/leds/leds-pca9532.c                        |  14 +-
 drivers/leds/leds-tlc591xx.c                       |  90 ++----
 drivers/leds/leds.h                                |   6 +
 drivers/leds/trigger/ledtrig-netdev.c              |   5 +-
 include/linux/led-class-flash.h                    |  41 ++-
 include/linux/leds.h                               | 105 +++---
 20 files changed, 860 insertions(+), 210 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-driver-el1520=
3000
 create mode 100644 Documentation/devicetree/bindings/leds/leds-el15203000.=
txt
 create mode 100644 drivers/leds/leds-el15203000.c

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--k1lZvvs/B4yU6o8G
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl3e/LYACgkQMOfwapXb+vKivACfQJFuvzDQ0u2gfnENhghhVLJx
fCsAoKAD6mEiT7fsNlKqMfC/UeJa2NJM
=vYvs
-----END PGP SIGNATURE-----

--k1lZvvs/B4yU6o8G--
