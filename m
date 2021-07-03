Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55EEB3BA8D4
	for <lists+linux-leds@lfdr.de>; Sat,  3 Jul 2021 15:34:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229504AbhGCNhI (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 3 Jul 2021 09:37:08 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:58910 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbhGCNhI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 3 Jul 2021 09:37:08 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id C18AE1C0B79; Sat,  3 Jul 2021 15:34:33 +0200 (CEST)
Date:   Sat, 3 Jul 2021 15:34:32 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        kernel list <linux-kernel@vger.kernel.org>,
        jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org
Subject: [GIT PULL] LEDs changes for v5.14-rc1
Message-ID: <20210703133432.GA30301@amd>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="VS++wcV0S1rZb1Fb"
Content-Disposition: inline
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--VS++wcV0S1rZb1Fb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/ tags/=
leds-5.14-rc1

for you to fetch changes up to 7b97174cc93fadb055258f4f8f3b964e9968e59f:

  leds: lgm: Fix up includes (2021-06-24 00:55:41 +0200)

----------------------------------------------------------------
This contains quite a lot of fixes, with more fixes in my inbox that
did not make it (sorry).

----------------------------------------------------------------
Andy Shevchenko (16):
      leds: class: The -ENOTSUPP should never be seen by user space
      leds: el15203000: Introduce to_el15203000_led() helper
      leds: lgm-sso: Fix clock handling
      leds: lgm-sso: Remove unneeded of_match_ptr()
      leds: lgm-sso: Drop duplicate NULL check for GPIO operations
      leds: lm3532: select regmap I2C API
      leds: lm3532: Make error handling more robust
      leds: lm36274: Put fwnode in error case during ->probe()
      leds: lm36274: Correct headers (of*.h -> mod_devicetable.h)
      leds: lm3692x: Put fwnode in any case during ->probe()
      leds: lm3697: Don't spam logs when probe is deferred
      leds: lp50xx: Put fwnode in error case during ->probe()
      leds: lt3593: Make use of device properties
      leds: pwm: Make error handling more robust
      leds: el15203000: Make error handling more robust
      leds: lm36274: Add missed property.h

Christophe JAILLET (1):
      leds: ktd2692: Fix an error handling path

Doug Zobel (1):
      leds: lp55xx: Initialize enable GPIO direction to output

Lee Jones (14):
      leds: trigger: ledtrig-cpu: Fix incorrectly documented param 'ledevt'
      leds: leds-gpio-register: Supply description for param 'id'
      leds: led-class: Fix incorrectly documented param 'dev'
      leds: leds-bcm6328: Demote kernel-doc abuse
      leds: leds-as3645a: Fix function name 'as3645a_set_current()'
      leds: leds-blinkm: Remove unused variable 'ret'
      leds: leds-is31fl32xx: Provide missing description for member 'sw_shu=
tdown_func'
      leds: leds-lp3944: Provide missing function names in documentation he=
aders
      leds: leds-lm3530: Fix incorrect spelling of 'brightness'
      leds: leds-lm3692x: Fix some kernel-doc formatting issues
      leds: leds-lm3697: Provide some missing descriptions for struct membe=
rs
      leds: leds-mlxreg: Fix incorrect documentation of struct member 'led_=
cdev' and 'led_cdev_name'
      leds: leds-lp8860: Fix kernel-doc related formatting issues
      leds: leds-mlxcpld: Fix a bunch of kernel-doc formatting issues

Linus Walleij (1):
      leds: lgm: Fix up includes

Yang Yingliang (1):
      leds: tlc591xx: fix return value check in tlc591xx_probe()

Zhen Lei (1):
      leds: as3645a: Fix error return code in as3645a_parse_node()

Zou Wei (1):
      leds: turris-omnia: add missing MODULE_DEVICE_TABLE

 drivers/leds/Kconfig               |  2 +-
 drivers/leds/blink/leds-lgm-sso.c  | 53 ++++++++++++++++------------------=
----
 drivers/leds/led-class.c           |  6 +----
 drivers/leds/leds-as3645a.c        |  3 ++-
 drivers/leds/leds-bcm6328.c        |  2 +-
 drivers/leds/leds-blinkm.c         |  5 ++--
 drivers/leds/leds-el15203000.c     | 37 +++++++++++---------------
 drivers/leds/leds-gpio-register.c  |  1 +
 drivers/leds/leds-is31fl32xx.c     |  3 ++-
 drivers/leds/leds-ktd2692.c        | 27 ++++++++++++-------
 drivers/leds/leds-lm3530.c         |  2 +-
 drivers/leds/leds-lm3532.c         |  7 ++---
 drivers/leds/leds-lm36274.c        |  4 ++-
 drivers/leds/leds-lm3692x.c        | 26 +++++++++----------
 drivers/leds/leds-lm3697.c         | 12 +++++----
 drivers/leds/leds-lp3944.c         |  6 ++---
 drivers/leds/leds-lp50xx.c         |  2 +-
 drivers/leds/leds-lp55xx-common.c  |  2 +-
 drivers/leds/leds-lp8860.c         | 16 ++++++------
 drivers/leds/leds-lt3593.c         |  8 +++---
 drivers/leds/leds-mlxcpld.c        | 38 +++++++++++++--------------
 drivers/leds/leds-mlxreg.c         |  3 ++-
 drivers/leds/leds-pwm.c            | 16 +++++++-----
 drivers/leds/leds-tlc591xx.c       |  8 ++++--
 drivers/leds/leds-turris-omnia.c   |  1 +
 drivers/leds/trigger/ledtrig-cpu.c |  2 +-
 26 files changed, 145 insertions(+), 147 deletions(-)


--=20
http://www.livejournal.com/~pavelmachek

--VS++wcV0S1rZb1Fb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmDgZ2gACgkQMOfwapXb+vKDLACglwxhR4mb6h33Ku4+hdyWX68L
0CYAnjUSkcnCo4dC6kkawkSXCXXBQQof
=x0yT
-----END PGP SIGNATURE-----

--VS++wcV0S1rZb1Fb--
