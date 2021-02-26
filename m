Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E12333262A3
	for <lists+linux-leds@lfdr.de>; Fri, 26 Feb 2021 13:22:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230318AbhBZMUh (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 26 Feb 2021 07:20:37 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:51640 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230403AbhBZMTr (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 26 Feb 2021 07:19:47 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 1FC541C0B7D; Fri, 26 Feb 2021 13:18:49 +0100 (CET)
Date:   Fri, 26 Feb 2021 13:18:48 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        kernel list <linux-kernel@vger.kernel.org>,
        jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org
Subject: [GIT PULL] LEDs changes for 5.12-rc1
Message-ID: <20210226121848.GA20159@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="LZvS9be/3tNcYl/X"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/ tags/=
leds-5.12-rc1

for you to fetch changes up to b0a82efa51ad3ba1117817817cbabe9c9a37b893:

  leds: lp50xx: Get rid of redundant explicit casting (2021-02-19 22:15:50 =
+0100)

----------------------------------------------------------------
Updates for 5.12-rc1. Besides usual fixes and new drivers, we are
changing CLASS_FLASH to return success to make it easier to work with
V4L2 stuff disabled, and we are getting rid of enum that should have
been plain integer long time ago. I'm slightly nervous about potential
warnings, but it needed to be fixed at some point.

Sorry this is a bit late and a bit rushed. But its not a rocket
science, so hopefully we'll be fine. I'll try better next time.

Best regards,
							Pavel

----------------------------------------------------------------
Abanoub Sameh (1):
      leds: led-core: Get rid of enum led_brightness

Amireddy Mallikarjuna reddy (2):
      dt-bindings: leds: Add bindings for Intel LGM SoC
      leds: lgm: Add LED controller driver for LGM SoC

Andreas Eberlein (1):
      leds: apu: extend support for PC Engines APU1 with newer firmware

Andy Shevchenko (6):
      leds: lp50xx: Don't spam logs when probe is deferred
      leds: lp50xx: Switch to new style i2c-driver probe function
      leds: lp50xx: Reduce level of dereferences
      leds: lp50xx: Get rid of redundant check in lp50xx_enable_disable()
      leds: lp50xx: Update headers block to reflect reality
      leds: lp50xx: Get rid of redundant explicit casting

Dwaipayan Ray (1):
      leds: Use DEVICE_ATTR_{RW, RO, WO} macros

Dylan Van Assche (1):
      leds: gpio: Set max brightness to 1

Gene Chen (2):
      leds: flash: Add flash registration with undefined CONFIG_LEDS_CLASS_=
FLASH
      leds: flash: Fix multicolor no-ops registration by return 0

Tian Tao (1):
      leds: lm3533: Switch to using the new API kobj_to_dev()

Zheng Yongjun (1):
      leds: ss4200: simplify the return expression of register_nasgpio_led()

 .../devicetree/bindings/leds/leds-lgm.yaml         | 113 +++
 drivers/leds/Kconfig                               |   3 +
 drivers/leds/Makefile                              |   3 +
 drivers/leds/blink/Kconfig                         |  20 +
 drivers/leds/blink/Makefile                        |   2 +
 drivers/leds/blink/leds-lgm-sso.c                  | 888 +++++++++++++++++=
++++
 drivers/leds/led-class.c                           |   3 +-
 drivers/leds/led-core.c                            |  20 +-
 drivers/leds/leds-apu.c                            |  11 +-
 drivers/leds/leds-blinkm.c                         |  24 +-
 drivers/leds/leds-gpio.c                           |   3 +-
 drivers/leds/leds-lm3530.c                         |  10 +-
 drivers/leds/leds-lm3533.c                         |   2 +-
 drivers/leds/leds-lm355x.c                         |   8 +-
 drivers/leds/leds-lm3642.c                         |  16 +-
 drivers/leds/leds-lp50xx.c                         |  83 +-
 drivers/leds/leds-max8997.c                        |  12 +-
 drivers/leds/leds-netxbig.c                        |  12 +-
 drivers/leds/leds-ss4200.c                         |  18 +-
 drivers/leds/leds-wm831x-status.c                  |  12 +-
 drivers/leds/leds.h                                |   6 +-
 include/linux/led-class-flash.h                    |  42 +-
 include/linux/led-class-multicolor.h               |  42 +-
 include/linux/leds.h                               |  12 +-
 24 files changed, 1196 insertions(+), 169 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lgm.yaml
 create mode 100644 drivers/leds/blink/Kconfig
 create mode 100644 drivers/leds/blink/Makefile
 create mode 100644 drivers/leds/blink/leds-lgm-sso.c

--=20
http://www.livejournal.com/~pavelmachek

--LZvS9be/3tNcYl/X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYDjnKAAKCRAw5/Bqldv6
8l31AKDAaXysClCLvjVoeboJU8vdkA2ZCQCfR5irhxiyXRe6LY9Gx1NNo4PrEQc=
=cgCD
-----END PGP SIGNATURE-----

--LZvS9be/3tNcYl/X--
