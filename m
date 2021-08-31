Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AA893FCCC3
	for <lists+linux-leds@lfdr.de>; Tue, 31 Aug 2021 20:08:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235580AbhHaSJ2 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 31 Aug 2021 14:09:28 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:39136 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230145AbhHaSJ1 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 31 Aug 2021 14:09:27 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 2F6BB1C0B76; Tue, 31 Aug 2021 20:08:31 +0200 (CEST)
Date:   Tue, 31 Aug 2021 20:08:30 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        kernel list <linux-kernel@vger.kernel.org>,
        jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org
Subject: [GIT PULL] LEDs changes for v5.15-rc1
Message-ID: <20210831180830.GA13989@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="sm4nu43k4a2Rpi4c"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--sm4nu43k4a2Rpi4c
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/ tags/=
leds-5.15-rc1

for you to fetch changes up to 239f32b4f161c1584cd4b386d6ab8766432a6ede:

  leds: pca955x: Switch to i2c probe_new (2021-08-20 11:00:08 +0200)

----------------------------------------------------------------
LED updates for 5.15-rc1. Usual driver changes, piece of documentation
that should hopefully get LED names standartized, and many fixes.

----------------------------------------------------------------
Andy Shevchenko (11):
      leds: el15203000: Correct headers (of*.h -> mod_devicetable.h)
      leds: lgm-sso: Put fwnode in any case during ->probe()
      leds: lgm-sso: Don't spam logs when probe is deferred
      leds: lgm-sso: Remove explicit managed GPIO resource cleanup
      leds: lgm-sso: Convert to use list_for_each_entry*() API
      leds: lm3692x: Correct headers (of*.h -> mod_devicetable.h)
      leds: lm3697: Update header block to reflect reality
      leds: lm3697: Make error handling more robust
      leds: lt3593: Put fwnode in any case during ->probe()
      leds: rt8515: Put fwnode in any case during ->probe()
      leds: lgm-sso: Propagate error codes from callee to caller

Denis Osterland-Heim (2):
      leds: move default_state read from fwnode to core
      leds: pwm: add support for default-state device property

Eddie James (7):
      dt-bindings: leds: Add retain-state-shutdown boolean
      leds: leds-core: Implement the retain-state-shutdown property
      leds: pca955x: Clean up code formatting
      leds: pca955x: Add brightness_get function
      leds: pca955x: Implement the default-state property
      leds: pca955x: Let the core process the fwnode
      leds: pca955x: Switch to i2c probe_new

Hans de Goede (1):
      leds: trigger: audio: Add an activate callback to ensure the initial =
brightness is set

Jan Kundr=E1t (1):
      leds: lp50xx: Fix chip name in KConfig

Jiapeng Chong (1):
      leds: is31fl32xx: Fix missing error code in is31fl32xx_parse_dt()

Linus Walleij (6):
      leds: aat1290: Move driver to flash subdirectory
      leds: as3645a: Move driver to flash subdirectory
      leds: max77693: Move driver to flash subdirectory
      leds: sgm3140: Move driver to flash subdirectory
      leds: lm3601x: Move driver to flash subdirectory
      leds: ktd2692: Move driver to flash subdirectory

Lukas Bulwahn (1):
      leds: trigger: remove reference to obsolete CONFIG_IDE_GD_ATA

Pavel Machek (2):
      leds: flash: Remove redundant initialization of variable ret
      Documentation: leds: standartizing LED names

 Documentation/devicetree/bindings/leds/common.yaml |   6 +
 Documentation/leds/well-known-leds.txt             |  58 ++++++
 MAINTAINERS                                        |   2 +-
 drivers/leds/Kconfig                               |  59 +-----
 drivers/leds/Makefile                              |   6 -
 drivers/leds/blink/leds-lgm-sso.c                  |  39 ++--
 drivers/leds/flash/Kconfig                         |  53 +++++
 drivers/leds/flash/Makefile                        |   6 +
 drivers/leds/{ =3D> flash}/leds-aat1290.c            |   0
 drivers/leds/{ =3D> flash}/leds-as3645a.c            |   0
 drivers/leds/{ =3D> flash}/leds-ktd2692.c            |   0
 drivers/leds/{ =3D> flash}/leds-lm3601x.c            |   0
 drivers/leds/{ =3D> flash}/leds-max77693.c           |   0
 drivers/leds/flash/leds-rt8515.c                   |   4 +-
 drivers/leds/{ =3D> flash}/leds-sgm3140.c            |   0
 drivers/leds/led-class-flash.c                     |   6 +-
 drivers/leds/led-class.c                           |  10 +-
 drivers/leds/led-core.c                            |  15 ++
 drivers/leds/leds-el15203000.c                     |   3 +-
 drivers/leds/leds-gpio.c                           |  12 +-
 drivers/leds/leds-is31fl32xx.c                     |   1 +
 drivers/leds/leds-lm3692x.c                        |   3 +-
 drivers/leds/leds-lm3697.c                         |  16 +-
 drivers/leds/leds-lt3593.c                         |   5 +-
 drivers/leds/leds-pca955x.c                        | 232 +++++++++++++++--=
----
 drivers/leds/leds-pwm.c                            |  49 ++++-
 drivers/leds/leds.h                                |   1 +
 drivers/leds/trigger/Kconfig                       |   2 +-
 drivers/leds/trigger/ledtrig-audio.c               |  37 +++-
 include/linux/leds.h                               |  12 +-
 30 files changed, 441 insertions(+), 196 deletions(-)
 create mode 100644 Documentation/leds/well-known-leds.txt
 rename drivers/leds/{ =3D> flash}/leds-aat1290.c (100%)
 rename drivers/leds/{ =3D> flash}/leds-as3645a.c (100%)
 rename drivers/leds/{ =3D> flash}/leds-ktd2692.c (100%)
 rename drivers/leds/{ =3D> flash}/leds-lm3601x.c (100%)
 rename drivers/leds/{ =3D> flash}/leds-max77693.c (100%)
 rename drivers/leds/{ =3D> flash}/leds-sgm3140.c (100%)

--=20
http://www.livejournal.com/~pavelmachek

--sm4nu43k4a2Rpi4c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYS5wHgAKCRAw5/Bqldv6
8orsAJ9fmdPsppl4uOIe8VrUKS+dqLyVxgCeNqN3gecIsDBZY90ep0XOGdcAhkI=
=xW4C
-----END PGP SIGNATURE-----

--sm4nu43k4a2Rpi4c--
