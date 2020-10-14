Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47FCE28DF93
	for <lists+linux-leds@lfdr.de>; Wed, 14 Oct 2020 13:06:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729134AbgJNLGA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 14 Oct 2020 07:06:00 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:51244 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725922AbgJNLGA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 14 Oct 2020 07:06:00 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 9498B1C0B87; Wed, 14 Oct 2020 13:05:56 +0200 (CEST)
Date:   Wed, 14 Oct 2020 13:05:56 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        kernel list <linux-kernel@vger.kernel.org>,
        jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org
Subject: [GIT PULL] LEDs changes for v5.10-rc1
Message-ID: <20201014110556.GA19009@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="zhXaljGHf11kAtnf"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--zhXaljGHf11kAtnf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/ tags/=
leds-5.10-rc1

for you to fetch changes up to 19d2e0cef0b14f8c7210162f58327485f5fa7c51:

  leds: pwm: Remove platform_data support (2020-10-07 12:02:58 +0200)

----------------------------------------------------------------
Pull request for 5.10-rc1.

Quite a lot of stuff is going on here. Great cleanups/fixes from Marek
and others are biggest part.

I limited CPU LED trigger to 8 CPUs, because it was willing to
register 1024 "triggers" on machine with 1024 CPUs. I don't believe it
will cause any problems, but we can raise the limit if it does.

----------------------------------------------------------------
Alexander Dahl (2):
      leds: pwm: Allow automatic labels for DT based devices
      leds: pwm: Remove platform_data support

Dan Murphy (5):
      dt: bindings: lp50xx: Introduce the lp50xx family of RGB drivers
      leds: lp50xx: Add the LP50XX family of the RGB LED driver
      dt: bindings: lp55xx: Updte yaml examples with new color ID
      leds: lm3532: Fix warnings for undefined parameters
      leds: lm36274: Fix warning for undefined parameters

Dmitry Osipenko (1):
      leds: Add driver for Acer Iconia Tab A500

Eddie James (2):
      dt-bindings: leds: pca955x: Add IBM implementation compatible string
      leds: pca955x: Add an IBM software implementation of the PCA9552 chip

Gabriel David (1):
      leds: lm3697: Fix out-of-bound access

Grant Feng (2):
      leds: is31fl319x: Add shutdown pin and generate a 5ms low pulse when =
startup
      DT: leds: Add an optional property named 'shutdown-gpios'

Krzysztof Kozlowski (5):
      leds: s3c24xx: Remove unused machine header include
      leds: lm3692x: Simplify with dev_err_probe()
      leds: pwm: Simplify with dev_err_probe()
      leds: sgm3140: Simplify with dev_err_probe()
      leds: tlc591xx: Simplify with dev_err_probe()

Liu Shixin (1):
      leds: pca9532 - simplify the return expression of pca9532_remove

Marek Beh=FAn (55):
      leds: various: compile if COMPILE_TEST=3Dy
      leds: ip30: compile if COMPILE_TEST=3Dy
      leds: various: use device_get_match_data
      leds: various: use dev_of_node(dev) instead of dev->of_node
      leds: lt3593: do not rewrite .of_node of new LED device to wrong value
      leds: various: use only available OF children
      leds: various: fix OF node leaks
      leds: bcm6328, bcm6358: use devres LED registering function
      leds: bcm6328, bcm6358: use struct led_init_data when registering
      leds: lm3697: use struct led_init_data when registering
      leds: lm3697: cosmetic change: use helper variable, reverse christmas=
 tree
      leds: max77650: use struct led_init_data when registering
      leds: mt6323: use struct led_init_data when registering
      leds: mt6323: cosmetic change: use helper variable
      leds: pm8058: use struct led_init_data when registering
      leds: pm8058: cosmetic change: use helper variable
      leds: pm8058: cosmetic change: no need to return in if guard
      leds: is31fl32xx: use struct led_init_data when registering
      leds: ns2: use devres LED registering function
      leds: ns2: alloc simple array instead of struct ns2_led_priv
      leds: ns2: support OF probing only, forget platdata
      leds: ns2: move parsing of one LED into separate function
      leds: ns2: use devres API for getting GPIO descriptors
      leds: ns2: cosmetic structure rename
      leds: ns2: cosmetic variable rename
      leds: ns2: cosmetic change
      leds: ns2: cosmetic change: use helper variable
      leds: ns2: register LED immediately after parsing DT properties
      leds: ns2: remove unneeded variable
      leds: ns2: use struct led_init_data when registering
      leds: lm36274: cosmetic: rename lm36274_data to chip
      leds: lm36274: don't iterate through children since there is only one
      leds: lm36274: use struct led_init_data when registering
      leds: lm36274: do not set chip settings in DT parsing function
      leds: lm36274: use platform device as parent of LED
      leds: lm36274: use devres LED registering function
      leds: lm3532: don't parse label DT property
      leds: syscon: use struct led_init_data when registering
      leds: parse linux,default-trigger DT property in LED core
      leds: tca6507: Absorb platform data
      leds: tca6507: use fwnode API instead of OF
      leds: tca6507: fix potential zero passed to ERR_PTR
      leds: pca963x: cosmetic: use helper variables, better indentation
      leds: pca963x: use devres LED registering function
      leds: pca963x: cosmetic: rename variables
      leds: pca963x: cosmetic: rename variables
      leds: pca963x: use flexible array
      dt-bindings: leds: tca6507: convert to YAML
      leds: tca6507: do not set GPIO names
      leds: tca6507: cosmetic change: use helper variable
      leds: tca6507: remove binding comment
      leds: pca963x: register LEDs immediately after parsing, get rid of pl=
atdata
      leds: pca963x: use struct led_init_data when registering
      leds: ns2: convert to fwnode API
      leds: ns2: do not guard OF match pointer with of_match_ptr

Markus Moll (2):
      leds: pca9532: correct shift computation in pca9532_getled
      leds: pca9532: read pwm settings from device tree

Pavel Machek (5):
      leds: we don't want people to use LED subsystem for vibrations
      leds: sgm3140: fix led->LED for consistency
      leds: tca6507: fix warning triggered by fwnode conversion.
      leds: TODO: Add documentation about possible subsystem improvements
      ledtrig-cpu: Limit to 8 CPUs

Randy Dunlap (1):
      leds: LP55XX_COMMON needs to depend on LEDS_CLASS

Tobias Jordan (1):
      leds: tlc591xx: fix leak of device node iterator

Tom Rix (1):
      leds: mt6323: move period calculation

 .../devicetree/bindings/leds/leds-is31fl319x.txt   |   2 +
 .../devicetree/bindings/leds/leds-lp50xx.yaml      | 130 +++++
 .../devicetree/bindings/leds/leds-lp55xx.yaml      |   2 +-
 .../devicetree/bindings/leds/leds-pca955x.txt      |   1 +
 Documentation/devicetree/bindings/leds/tca6507.txt |  49 --
 .../devicetree/bindings/leds/ti,tca6507.yaml       | 134 +++++
 Documentation/leds/ledtrig-transient.rst           |   7 -
 drivers/leds/Kconfig                               |  31 +-
 drivers/leds/Makefile                              |   2 +
 drivers/leds/TODO                                  |  75 +++
 drivers/leds/led-class.c                           |   5 +
 drivers/leds/leds-88pm860x.c                       |   6 +-
 drivers/leds/leds-aat1290.c                        |   2 +-
 drivers/leds/leds-acer-a500.c                      | 129 +++++
 drivers/leds/leds-an30259a.c                       |   7 +-
 drivers/leds/leds-aw2013.c                         |  11 +-
 drivers/leds/leds-bcm6328.c                        |  11 +-
 drivers/leds/leds-bcm6358.c                        |  11 +-
 drivers/leds/leds-cpcap.c                          |   7 +-
 drivers/leds/leds-cr0014114.c                      |   3 -
 drivers/leds/leds-el15203000.c                     |   3 -
 drivers/leds/leds-gpio.c                           |   3 -
 drivers/leds/leds-ip30.c                           |   1 +
 drivers/leds/leds-is31fl319x.c                     |  32 +-
 drivers/leds/leds-is31fl32xx.c                     |  33 +-
 drivers/leds/leds-ktd2692.c                        |   4 +-
 drivers/leds/leds-lm3532.c                         |  65 +--
 drivers/leds/leds-lm36274.c                        | 133 ++---
 drivers/leds/leds-lm3692x.c                        |  14 +-
 drivers/leds/leds-lm3697.c                         | 100 ++--
 drivers/leds/leds-lp50xx.c                         | 631 +++++++++++++++++=
++++
 drivers/leds/leds-lp5521.c                         |   2 +-
 drivers/leds/leds-lp5523.c                         |   2 +-
 drivers/leds/leds-lp5562.c                         |   2 +-
 drivers/leds/leds-lp55xx-common.c                  |  14 +-
 drivers/leds/leds-lp8501.c                         |   2 +-
 drivers/leds/leds-lp8860.c                         |   6 +-
 drivers/leds/leds-lt3593.c                         |   6 +-
 drivers/leds/leds-max77650.c                       |  24 +-
 drivers/leds/leds-max77693.c                       |   2 +-
 drivers/leds/leds-mc13783.c                        |   8 +-
 drivers/leds/leds-mt6323.c                         |  38 +-
 drivers/leds/leds-netxbig.c                        |   6 +-
 drivers/leds/leds-ns2.c                            | 346 ++++-------
 drivers/leds/leds-pca9532.c                        |  24 +-
 drivers/leds/leds-pca955x.c                        |   8 +
 drivers/leds/leds-pca963x.c                        | 399 ++++++-------
 drivers/leds/leds-pm8058.c                         |  33 +-
 drivers/leds/leds-powernv.c                        |   2 +-
 drivers/leds/leds-pwm.c                            |  49 +-
 drivers/leds/leds-s3c24xx.c                        |   2 -
 drivers/leds/leds-sc27xx-bltc.c                    |   6 +-
 drivers/leds/leds-sgm3140.c                        |  29 +-
 drivers/leds/leds-spi-byte.c                       |  11 +-
 drivers/leds/leds-syscon.c                         |  13 +-
 drivers/leds/leds-tca6507.c                        | 116 ++--
 drivers/leds/leds-tlc591xx.c                       |  24 +-
 drivers/leds/leds-turris-omnia.c                   |   8 +-
 drivers/leds/trigger/ledtrig-cpu.c                 |  13 +-
 include/linux/leds-tca6507.h                       |  21 -
 include/linux/platform_data/leds-pca963x.h         |  35 --
 61 files changed, 1791 insertions(+), 1104 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/tca6507.txt
 create mode 100644 Documentation/devicetree/bindings/leds/ti,tca6507.yaml
 create mode 100644 drivers/leds/TODO
 create mode 100644 drivers/leds/leds-acer-a500.c
 create mode 100644 drivers/leds/leds-lp50xx.c
 delete mode 100644 include/linux/leds-tca6507.h
 delete mode 100644 include/linux/platform_data/leds-pca963x.h



--zhXaljGHf11kAtnf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX4bblAAKCRAw5/Bqldv6
8lNGAJ9U1JIZjV4ZUf1ItaDTYJZ+nmpNywCfZuN2r8bFIPrWN04l2NoH0veNiaw=
=3Jkc
-----END PGP SIGNATURE-----

--zhXaljGHf11kAtnf--
