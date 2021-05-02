Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00BEF370F6C
	for <lists+linux-leds@lfdr.de>; Mon,  3 May 2021 00:05:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231801AbhEBWGO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 2 May 2021 18:06:14 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:56118 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230036AbhEBWGN (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 2 May 2021 18:06:13 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 146E21C0B79; Mon,  3 May 2021 00:05:20 +0200 (CEST)
Date:   Mon, 3 May 2021 00:05:19 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        kernel list <linux-kernel@vger.kernel.org>,
        jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org
Subject: [GIT PULL] LEDs changes for v5.13-rc1
Message-ID: <20210502220519.GA24775@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="d6Gm4EdcadzBjdND"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--d6Gm4EdcadzBjdND
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/ tags/=
leds-5.13-rc1

for you to fetch changes up to 23a700455a1bc55f3ea20675e574181b8c129306:

  leds: pca9532: Assign gpio base dynamically (2021-04-25 23:59:58 +0200)

----------------------------------------------------------------
Nothing too exciting here, just some fixes.

This modifies MAINTAINER's file to remove Dan Murphy's email that is
bouncing (and does it globally). I hope that does not conflict too badly.

----------------------------------------------------------------
Arnd Bergmann (1):
      leds: lgm: fix gpiolib dependency

ChiYuan Huang (2):
      leds: rt4505: Add DT binding document for Richtek RT4505
      leds: rt4505: Add support for Richtek RT4505 flash LED controller

Colin Ian King (1):
      leds: lgm: Fix spelling mistake "prepate" -> "prepare"

Geert Uytterhoeven (1):
      leds: LEDS_BLINK_LGM should depend on X86

Pavel Machek (2):
      leds: Kconfig: LEDS_CLASS is usually selected.
      MAINTAINERS: Remove Dan Murphy's bouncing email

Rahul Tanwar (1):
      leds: lgm: Improve Kconfig help

Stefan Riedmueller (1):
      leds: pca9532: Assign gpio base dynamically

Tian Tao (1):
      leds: trigger: pattern: Switch to using the new API kobj_to_dev()

Zheng Yongjun (1):
      leds-lm3642: convert comma to semicolon

 .../devicetree/bindings/leds/leds-rt4505.yaml      |  57 +++
 MAINTAINERS                                        |   4 -
 drivers/leds/Kconfig                               |   7 +-
 drivers/leds/Makefile                              |   2 +-
 drivers/leds/blink/Kconfig                         |  33 +-
 drivers/leds/blink/Makefile                        |   2 +-
 drivers/leds/blink/leds-lgm-sso.c                  |   2 +-
 drivers/leds/flash/Kconfig                         |  11 +
 drivers/leds/flash/Makefile                        |   1 +
 drivers/leds/flash/leds-rt4505.c                   | 430 +++++++++++++++++=
++++
 drivers/leds/leds-lm3642.c                         |   4 +-
 drivers/leds/leds-pca9532.c                        |   2 +
 drivers/leds/trigger/ledtrig-pattern.c             |   2 +-
 13 files changed, 525 insertions(+), 32 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-rt4505.yaml
 create mode 100644 drivers/leds/flash/leds-rt4505.c

--=20
http://www.livejournal.com/~pavelmachek

--d6Gm4EdcadzBjdND
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYI8iHwAKCRAw5/Bqldv6
8m/WAJsHsIKJTjcsNOyM0AqFHsjYR6774gCfcwnlENwrw7LQ8QP76tocoP7U00s=
=hz8I
-----END PGP SIGNATURE-----

--d6Gm4EdcadzBjdND--
