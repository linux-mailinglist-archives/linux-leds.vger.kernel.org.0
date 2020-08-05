Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10BFC23D39F
	for <lists+linux-leds@lfdr.de>; Wed,  5 Aug 2020 23:33:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbgHEVdf (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 5 Aug 2020 17:33:35 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:52298 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725920AbgHEVde (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 5 Aug 2020 17:33:34 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 4333A1C0BD2; Wed,  5 Aug 2020 23:33:30 +0200 (CEST)
Date:   Wed, 5 Aug 2020 23:33:29 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        kernel list <linux-kernel@vger.kernel.org>,
        jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org
Subject: [GIT PULL] LEDs changes for v5.9-rc1
Message-ID: <20200805213329.GA15090@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="vtzGhvizbBRQ85DL"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The following changes since commit 48778464bb7d346b47157d21ffde2af6b2d39110:

  Linux 5.8-rc2 (2020-06-21 15:45:29 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/ tags/=
leds-5.9-rc1

for you to fetch changes up to bba37471de2d7733b0deef57e03c47fa97a284a7:

  MAINTAINERS: Remove myself as LED subsystem maintainer (2020-08-05 23:27:=
51 +0200)

----------------------------------------------------------------
LEDs changes for 5.9-rc1.

Okay, so... this one is interesting. RGB LEDs are very common, and we
need to have some kind of support for them. Multicolor is for
arbitrary set of LEDs in one package, RGB is for LEDs that can produce
full range of colors. We do not have real multicolor LED that is not
RGB in the pipeline, so that one is disabled for now.

You can expect this saga to continue with next pull requests.

Thank Jacek for all the good work you did maintaining LEDs over the years!=
=20

----------------------------------------------------------------
Alexander A. Klimov (1):
      leds: Replace HTTP links with HTTPS ones

Arnd Bergmann (1):
      leds: lm355x: avoid enum conversion warning

Dan Murphy (10):
      leds: lp55xx: Fix file permissions to use DEVICE_ATTR macros
      leds: lp5523: Fix various formatting issues in the code
      dt: bindings: Add multicolor class dt bindings documention
      leds: Add multicolor ID to the color ID list
      leds: multicolor: Introduce a multicolor class definition
      dt-bindings: leds: Convert leds-lp55xx to yaml
      leds: lp55xx: Convert LED class registration to devm_*
      leds: lp55xx: Add multicolor framework support to lp55xx
      leds: lp5523: Update the lp5523 code to add multicolor brightness fun=
ction
      leds: lp5521: Add multicolor framework multicolor brightness support

Flavio Suligoi (2):
      dt-bindings: leds: fix macro names for pca955x
      leds: fix spelling mistake

Gustavo A. R. Silva (2):
      leds: ns2: Use struct_size() in devm_kzalloc()
      leds: gpio: Use struct_size() in devm_kzalloc()

Jacek Anaszewski (1):
      MAINTAINERS: Remove myself as LED subsystem maintainer

Jan Kiszka (1):
      leds: trigger: gpio: Avoid warning on update of inverted

Johan Hovold (6):
      leds: 88pm860x: fix use-after-free on unbind
      leds: da903x: fix use-after-free on unbind
      leds: lm3533: fix use-after-free on unbind
      leds: lm36274: fix use-after-free on unbind
      leds: wm831x-status: fix use-after-free on unbind
      leds: drop redundant struct-device pointer casts

Kai-Heng Feng (1):
      leds: core: Flush scheduled work for system suspend

Linus Walleij (3):
      leds: lp55xx: Convert to use GPIO descriptors
      leds: pca955x: Include the right GPIO header
      leds: gpio: Fix semantic error

Marek Beh=FAn (4):
      leds: trigger: add support for LED-private device triggers
      dt-bindings: leds: add cznic,turris-omnia-leds binding
      leds: initial support for Turris Omnia LEDs
      Documentation: ABI: leds-turris-omnia: document sysfs attribute

Pavel Machek (3):
      leds: pattern trigger -- check pattern for validity
      leds: add RGB color option, as that is different from multicolor.
      leds: disallow /sys/class/leds/*:multi:* for now

Randy Dunlap (1):
      Make LEDS_LP55XX_COMMON depend on I2C to fix build errors:

=C1lvaro Fern=E1ndez Rojas (1):
      leds-bcm6328: support second hw blinking interval

 .../testing/sysfs-class-led-driver-turris-omnia    |  14 +
 .../ABI/testing/sysfs-class-led-multicolor         |  35 +++
 .../bindings/leds/cznic,turris-omnia-leds.yaml     |  90 +++++++
 .../bindings/leds/leds-class-multicolor.yaml       |  37 +++
 .../devicetree/bindings/leds/leds-lm3532.txt       |   2 +-
 .../devicetree/bindings/leds/leds-lm3601x.txt      |   4 +-
 .../devicetree/bindings/leds/leds-lm36274.txt      |   2 +-
 .../devicetree/bindings/leds/leds-lm3692x.txt      |   2 +-
 .../devicetree/bindings/leds/leds-lm3697.txt       |   2 +-
 .../devicetree/bindings/leds/leds-lp55xx.txt       | 228 ----------------
 .../devicetree/bindings/leds/leds-lp55xx.yaml      | 220 +++++++++++++++
 .../devicetree/bindings/leds/leds-lp8860.txt       |   2 +-
 .../devicetree/bindings/leds/leds-pca955x.txt      |   6 +-
 Documentation/leds/index.rst                       |   1 +
 Documentation/leds/leds-class-multicolor.rst       |  86 ++++++
 MAINTAINERS                                        |   2 -
 drivers/leds/Kconfig                               |  33 ++-
 drivers/leds/Makefile                              |   2 +
 drivers/leds/led-class-multicolor.c                | 203 ++++++++++++++
 drivers/leds/led-class.c                           |   1 +
 drivers/leds/led-core.c                            |   6 +
 drivers/leds/led-triggers.c                        |  28 +-
 drivers/leds/leds-88pm860x.c                       |  14 +-
 drivers/leds/leds-bcm6328.c                        |  97 +++++--
 drivers/leds/leds-da903x.c                         |  14 +-
 drivers/leds/leds-gpio.c                           |  15 +-
 drivers/leds/leds-lm3532.c                         |   4 +-
 drivers/leds/leds-lm3533.c                         |  12 +-
 drivers/leds/leds-lm355x.c                         |  16 +-
 drivers/leds/leds-lm3601x.c                        |   2 +-
 drivers/leds/leds-lm36274.c                        |  17 +-
 drivers/leds/leds-lm3642.c                         |   9 +-
 drivers/leds/leds-lm3692x.c                        |   2 +-
 drivers/leds/leds-lm3697.c                         |   2 +-
 drivers/leds/leds-lp5521.c                         |  43 ++-
 drivers/leds/leds-lp5523.c                         |  62 +++--
 drivers/leds/leds-lp5562.c                         |  22 +-
 drivers/leds/leds-lp55xx-common.c                  | 239 ++++++++++++-----
 drivers/leds/leds-lp55xx-common.h                  |  16 +-
 drivers/leds/leds-lp8501.c                         |  23 +-
 drivers/leds/leds-ns2.c                            |   9 +-
 drivers/leds/leds-pca955x.c                        |   2 +-
 drivers/leds/leds-turris-omnia.c                   | 295 +++++++++++++++++=
++++
 drivers/leds/leds-wm831x-status.c                  |  14 +-
 drivers/leds/trigger/ledtrig-gpio.c                |   3 +-
 drivers/leds/trigger/ledtrig-pattern.c             |   6 +-
 include/dt-bindings/leds/common.h                  |   5 +-
 include/linux/led-class-multicolor.h               | 121 +++++++++
 include/linux/leds.h                               |  10 +
 include/linux/platform_data/leds-lp55xx.h          |  13 +-
 50 files changed, 1640 insertions(+), 453 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-driver-turris=
-omnia
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-multicolor
 create mode 100644 Documentation/devicetree/bindings/leds/cznic,turris-omn=
ia-leds.yaml
 create mode 100644 Documentation/devicetree/bindings/leds/leds-class-multi=
color.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-lp55xx.txt
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lp55xx.yaml
 create mode 100644 Documentation/leds/leds-class-multicolor.rst
 create mode 100644 drivers/leds/led-class-multicolor.c
 create mode 100644 drivers/leds/leds-turris-omnia.c
 create mode 100644 include/linux/led-class-multicolor.h

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--vtzGhvizbBRQ85DL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXyslqQAKCRAw5/Bqldv6
8sVKAKC3jd6pP570E6RNoz3DdEruooKYnQCfaJ5m6nKe1uhIdaB26643WpDg2+s=
=YXL1
-----END PGP SIGNATURE-----

--vtzGhvizbBRQ85DL--
